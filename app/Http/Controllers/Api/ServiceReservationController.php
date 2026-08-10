<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreServiceReservationRequest;
use App\Http\Resources\ServiceReservationResource;
use App\Mail\NewServiceReservationNotificationMail;
use App\Mail\ServiceReservationCancelledMail;
use App\Mail\ServiceReservationConfirmationMail;
use App\Models\Service;
use App\Models\ServiceReservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ServiceReservationController extends Controller
{
    public function reservedDates(Service $service, Request $request)
    {
        $query = ServiceReservation::query()
            ->where('service_id', $service->id)
            ->where('status', 'confirmed')
            ->where('reservation_date', '>=', now()->toDateString());

        if ($request->filled('month')) {
            $month = $request->input('month');
            $query->whereRaw("DATE_FORMAT(reservation_date, '%Y-%m') = ?", [$month]);
        }

        return response()->json([
            'dates' => $query->pluck('reservation_date')->map(fn ($date) => $date->toDateString()),
        ]);
    }

    public function store(Service $service, StoreServiceReservationRequest $request)
    {
        $data = $request->validated();

        $reservation = ServiceReservation::create([
            'reference' => ServiceReservation::generateReference(),
            'service_id' => $service->id,
            'reservation_date' => $data['reservation_date'],
            'guest_name' => $data['guest_name'],
            'guest_email' => $data['guest_email'],
            'guest_phone' => $data['guest_phone'] ?? null,
            'notes' => $data['notes'] ?? null,
            'status' => 'confirmed',
        ]);

        $reservation->load('service');

        Mail::to($reservation->guest_email)->queue(new ServiceReservationConfirmationMail($reservation));
        Mail::to(config('services.hotel.contact_email'))->queue(new NewServiceReservationNotificationMail($reservation));

        return new ServiceReservationResource($reservation);
    }

    public function show(string $reference, Request $request)
    {
        $request->validate(['email' => ['required', 'email']]);

        $reservation = ServiceReservation::query()
            ->where('reference', $reference)
            ->where('guest_email', $request->input('email'))
            ->with('service')
            ->firstOrFail();

        return new ServiceReservationResource($reservation);
    }

    public function cancel(string $reference, Request $request)
    {
        $request->validate(['email' => ['required', 'email']]);

        $reservation = ServiceReservation::query()
            ->where('reference', $reference)
            ->where('guest_email', $request->input('email'))
            ->with('service')
            ->firstOrFail();

        if ($reservation->status !== 'cancelled') {
            $reservation->update(['status' => 'cancelled']);
            Mail::to($reservation->guest_email)->queue(new ServiceReservationCancelledMail($reservation));
        }

        return new ServiceReservationResource($reservation);
    }
}
