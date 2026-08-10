<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\PayBookingRequest;
use App\Http\Requests\StoreBookingRequest;
use App\Http\Resources\BookingResource;
use App\Mail\BookingConfirmationMail;
use App\Mail\NewBookingNotificationMail;
use App\Models\Booking;
use App\Models\DiningService;
use App\Models\Payment;
use App\Models\RoomType;
use App\Services\CampayService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Mail;

class BookingController extends Controller
{
    public function store(StoreBookingRequest $request)
    {
        $data = $request->validated();

        $roomType = RoomType::findOrFail($data['room_type_id']);
        $diningService = isset($data['dining_service_id'])
            ? DiningService::find($data['dining_service_id'])
            : null;

        $checkIn = Carbon::parse($data['check_in']);
        $checkOut = Carbon::parse($data['check_out']);
        $nights = $checkIn->diffInDays($checkOut);

        $totalPrice = $nights * $roomType->price_per_night;

        if ($diningService) {
            $totalPrice += $nights * $diningService->price_per_guest_per_night * $data['guests_count'];
        }

        $booking = Booking::create([
            'reference' => Booking::generateReference(),
            'room_type_id' => $roomType->id,
            'dining_service_id' => $diningService?->id,
            'guest_name' => $data['guest_name'],
            'guest_email' => $data['guest_email'],
            'guest_phone' => $data['guest_phone'],
            'guest_nationality' => $data['guest_nationality'] ?? null,
            'check_in' => $checkIn,
            'check_out' => $checkOut,
            'guests_count' => $data['guests_count'],
            'payment_method' => $data['payment_method'],
            'status' => $data['payment_method'] === 'at_hotel' ? 'confirmed' : 'pending_payment',
            'total_price' => $totalPrice,
            'special_requests' => $data['special_requests'] ?? null,
            'locale' => $data['locale'] ?? 'fr',
        ]);

        if ($booking->status === 'confirmed') {
            $this->sendConfirmationEmails($booking);
        }

        return new BookingResource($booking->load(['roomType', 'diningService']));
    }

    public function pay(string $reference, PayBookingRequest $request, CampayService $campay)
    {
        $booking = Booking::query()->where('reference', $reference)->firstOrFail();

        if ($booking->payment_method !== 'online' || $booking->status !== 'pending_payment') {
            return response()->json(['message' => 'This booking is not awaiting online payment.'], 422);
        }

        $phone = '237'.$request->validated('phone_number');

        $result = $campay->collect(
            $phone,
            $booking->total_price,
            $booking->reference,
            "Hotel Meridian booking {$booking->reference}"
        );

        $payment = Payment::create([
            'booking_id' => $booking->id,
            'aggregator' => 'campay',
            'campay_reference' => $result['reference'] ?? null,
            'amount' => $booking->total_price,
            'currency' => 'XAF',
            'phone_number' => $phone,
            'status' => 'pending',
            'raw_payload' => $result,
        ]);

        return response()->json([
            'message' => 'Payment request sent. Approve the prompt on your phone.',
            'payment_id' => $payment->id,
        ]);
    }

    public function show(string $reference, Request $request)
    {
        $request->validate(['email' => ['required', 'email']]);

        $booking = Booking::query()
            ->where('reference', $reference)
            ->where('guest_email', $request->input('email'))
            ->with(['roomType', 'diningService'])
            ->firstOrFail();

        return new BookingResource($booking);
    }

    public function status(string $reference, Request $request)
    {
        $request->validate(['email' => ['required', 'email']]);

        $booking = Booking::query()
            ->where('reference', $reference)
            ->where('guest_email', $request->input('email'))
            ->firstOrFail();

        return response()->json([
            'reference' => $booking->reference,
            'status' => $booking->status,
        ]);
    }

    private function sendConfirmationEmails(Booking $booking): void
    {
        $booking->loadMissing('roomType');

        Mail::to($booking->guest_email)->queue(new BookingConfirmationMail($booking));
        Mail::to(config('services.hotel.contact_email'))->queue(new NewBookingNotificationMail($booking));
    }
}
