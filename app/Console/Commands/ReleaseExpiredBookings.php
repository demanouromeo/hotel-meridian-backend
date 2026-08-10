<?php

namespace App\Console\Commands;

use App\Models\Booking;
use Illuminate\Console\Attributes\Description;
use Illuminate\Console\Attributes\Signature;
use Illuminate\Console\Command;

#[Signature('bookings:release-expired')]
#[Description('Cancel pending_payment bookings older than 30 minutes to free up inventory.')]
class ReleaseExpiredBookings extends Command
{
    public function handle(): void
    {
        $count = Booking::query()
            ->where('status', 'pending_payment')
            ->where('created_at', '<', now()->subMinutes(30))
            ->update(['status' => 'cancelled']);

        $this->info("Released {$count} expired pending-payment booking(s).");
    }
}
