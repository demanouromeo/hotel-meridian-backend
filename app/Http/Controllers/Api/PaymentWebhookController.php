<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\BookingConfirmationMail;
use App\Mail\NewBookingNotificationMail;
use App\Models\Payment;
use App\Services\CampayService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class PaymentWebhookController extends Controller
{
    public function campay(Request $request, CampayService $campay)
    {
        // Campay's webhook payload isn't signed, so treat it only as a hint of which
        // transaction to check — the authoritative status always comes from calling
        // Campay's own status endpoint back, not from trusting this payload directly.
        if ($request->query('token') !== config('services.campay.webhook_token')) {
            abort(403);
        }

        $campayReference = $request->input('reference');

        if (! $campayReference) {
            return response()->json(['message' => 'Missing reference'], 422);
        }

        $payment = Payment::query()->where('campay_reference', $campayReference)->first();

        if (! $payment) {
            Log::warning("Campay webhook for unknown reference: {$campayReference}");

            return response()->json(['message' => 'Unknown reference'], 404);
        }

        if ($payment->status === 'successful') {
            return response()->json(['message' => 'Already processed']);
        }

        $status = $campay->transactionStatus($campayReference);
        $confirmedStatus = strtoupper($status['status'] ?? '');

        $payment->update([
            'operator' => $status['operator'] ?? $payment->operator,
            'status' => match ($confirmedStatus) {
                'SUCCESSFUL' => 'successful',
                'FAILED' => 'failed',
                default => 'pending',
            },
            'raw_payload' => $status,
            'paid_at' => $confirmedStatus === 'SUCCESSFUL' ? now() : null,
        ]);

        if ($confirmedStatus === 'SUCCESSFUL') {
            $booking = $payment->booking;
            $booking->update(['status' => 'confirmed']);
            $booking->load('roomType');

            Mail::to($booking->guest_email)->queue(new BookingConfirmationMail($booking));
            Mail::to(config('services.hotel.contact_email'))->queue(new NewBookingNotificationMail($booking));
        } elseif ($confirmedStatus === 'FAILED') {
            $payment->booking->update(['status' => 'cancelled']);
        }

        return response()->json(['message' => 'Processed']);
    }
}
