<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\ServiceReservationResource;
use App\Mail\ServiceReservationCancelledMail;
use App\Models\ServiceReservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ServiceReservationController extends Controller
{
    public function index(Request $request)
    {
        $reservations = ServiceReservation::query()
            ->with('service')
            ->when($request->filled('service_id'), fn ($q) => $q->where('service_id', $request->input('service_id')))
            ->when($request->filled('status'), fn ($q) => $q->where('status', $request->input('status')))
            ->when($request->filled('from'), fn ($q) => $q->where('reservation_date', '>=', $request->input('from')))
            ->when($request->filled('to'), fn ($q) => $q->where('reservation_date', '<=', $request->input('to')))
            ->latest()
            ->paginate(20);

        return ServiceReservationResource::collection($reservations);
    }

    public function update(Request $request, ServiceReservation $serviceReservation)
    {
        $data = $request->validate([
            'status' => ['required', 'in:confirmed,cancelled'],
        ]);

        $wasCancelled = $serviceReservation->status === 'cancelled';

        $serviceReservation->update($data);

        if (! $wasCancelled && $serviceReservation->status === 'cancelled') {
            Mail::to($serviceReservation->guest_email)->queue(
                new ServiceReservationCancelledMail($serviceReservation->load('service'))
            );
        }

        return new ServiceReservationResource($serviceReservation->fresh('service'));
    }
}
