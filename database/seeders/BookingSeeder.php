<?php

namespace Database\Seeders;

use App\Models\Booking;
use App\Models\DiningService;
use App\Models\RoomType;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class BookingSeeder extends Seeder
{
    public function run(): void
    {
        $roomTypes = RoomType::all();
        $diningServices = DiningService::all();

        if ($roomTypes->isEmpty()) {
            return;
        }

        $now = Carbon::now();
        $rangeStart = Carbon::create(2023, 1, 1);
        $rangeEnd = Carbon::create(2026, 12, 31);
        $totalDays = $rangeStart->diffInDays($rangeEnd);

        for ($i = 0; $i < 60; $i++) {
            $roomType = $roomTypes->random();
            $diningService = random_int(1, 100) <= 70 ? $diningServices->random() : null;

            $checkIn = $rangeStart->copy()->addDays(random_int(0, $totalDays));
            $nights = random_int(1, 6);
            $checkOut = $checkIn->copy()->addDays($nights);

            $guestsCount = random_int(1, max(1, $roomType->capacity));
            $totalPrice = $nights * $roomType->price_per_night;
            if ($diningService) {
                $totalPrice += $nights * $diningService->price_per_guest_per_night * $guestsCount;
            }

            $paymentMethod = random_int(1, 100) <= 50 ? 'online' : 'at_hotel';

            if ($checkOut->isPast()) {
                $roll = random_int(1, 100);
                $status = match (true) {
                    $roll <= 80 => 'checked_out',
                    $roll <= 92 => 'cancelled',
                    default => 'pending_payment',
                };
            } elseif ($checkIn->lte($now) && $checkOut->gte($now)) {
                $status = 'checked_in';
            } else {
                $roll = random_int(1, 100);
                $status = match (true) {
                    $roll <= 75 => 'confirmed',
                    $roll <= 90 => 'pending_payment',
                    default => 'cancelled',
                };
            }

            $guestName = CameroonianNames::random();
            $createdAt = $checkIn->copy()->subDays(random_int(1, 45));
            if ($createdAt->gt($now)) {
                $createdAt = $now->copy()->subDays(random_int(0, 10));
            }

            $reference = 'MER-'.$checkIn->format('Ymd').'-'.Str::upper(Str::random(4));
            while (Booking::query()->where('reference', $reference)->exists()) {
                $reference = 'MER-'.$checkIn->format('Ymd').'-'.Str::upper(Str::random(4));
            }

            Booking::create([
                'reference' => $reference,
                'room_type_id' => $roomType->id,
                'dining_service_id' => $diningService?->id,
                'guest_name' => $guestName,
                'guest_email' => CameroonianNames::email($guestName),
                'guest_phone' => CameroonianNames::phone(),
                'guest_nationality' => 'Camerounaise',
                'check_in' => $checkIn,
                'check_out' => $checkOut,
                'guests_count' => $guestsCount,
                'payment_method' => $paymentMethod,
                'status' => $status,
                'total_price' => $totalPrice,
                'special_requests' => null,
                'locale' => random_int(1, 100) <= 70 ? 'fr' : 'en',
                'created_at' => $createdAt,
                'updated_at' => $createdAt,
            ]);
        }
    }
}
