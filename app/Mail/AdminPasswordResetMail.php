<?php

namespace App\Mail;

use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AdminPasswordResetMail extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public string $resetUrl;

    public function __construct(public User $user, string $token)
    {
        $this->resetUrl = rtrim(config('services.frontend_url'), '/')
            .'/admin/reset-password?token='.$token.'&email='.urlencode($user->email);
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Hotel Meridian — Password Reset Request',
        );
    }

    public function content(): Content
    {
        return new Content(
            markdown: 'emails.admin-password-reset',
            with: ['user' => $this->user, 'resetUrl' => $this->resetUrl],
        );
    }
}
