<?php

namespace App\Mail;

use App\Models\ServiceReservation;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ServiceReservationCancelledMail extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public function __construct(public ServiceReservation $reservation) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: "Hotel Meridian — Reservation Cancelled {$this->reservation->reference}",
        );
    }

    public function content(): Content
    {
        return new Content(
            markdown: 'emails.service-reservation-cancelled',
            with: ['reservation' => $this->reservation],
        );
    }
}
