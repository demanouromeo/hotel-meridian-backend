<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\BookingResource;
use App\Mail\BookingConfirmationMail;
use App\Models\Booking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class BookingController extends Controller
{
    public function index(Request $request)
    {
        $bookings = Booking::query()
            ->with(['roomType', 'diningService', 'room'])
            ->when($request->filled('status'), fn ($q) => $q->where('status', $request->input('status')))
            ->when($request->filled('from'), fn ($q) => $q->where('check_in', '>=', $request->input('from')))
            ->when($request->filled('to'), fn ($q) => $q->where('check_out', '<=', $request->input('to')))
            ->latest()
            ->paginate(20);

        return BookingResource::collection($bookings);
    }

    public function show(Booking $booking)
    {
        return new BookingResource($booking->load(['roomType', 'diningService', 'room', 'payments']));
    }

    public function update(Request $request, Booking $booking)
    {
        $data = $request->validate([
            'status' => ['sometimes', 'in:confirmed,cancelled,checked_in,checked_out'],
            'room_id' => ['sometimes', 'nullable', 'integer', 'exists:rooms,id'],
        ]);

        $wasConfirmed = $booking->status === 'confirmed';

        $booking->update($data);

        if (! $wasConfirmed && $booking->status === 'confirmed') {
            Mail::to($booking->guest_email)->queue(new BookingConfirmationMail($booking->load('roomType')));
        }

        return new BookingResource($booking->fresh(['roomType', 'diningService', 'room']));
    }
}
