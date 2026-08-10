<?php

namespace Database\Seeders;

use App\Models\Service;
use App\Models\ServiceReservation;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class ServiceReservationSeeder extends Seeder
{
    public function run(): void
    {
        $services = Service::all();

        if ($services->isEmpty()) {
            return;
        }

        $now = Carbon::now();
        $rangeStart = Carbon::create(2023, 1, 1);
        $rangeEnd = Carbon::create(2026, 12, 31);
        $totalDays = $rangeStart->diffInDays($rangeEnd);

        $notesOptions = [
            null,
            'Mariage traditionnel, prévoir décoration en blanc et or.',
            'Conférence d\'entreprise, besoin d\'un vidéoprojecteur.',
            'Anniversaire, 50 invités environ.',
            'Séminaire de formation sur deux jours.',
            'Merci de prévoir une sonorisation pour extérieur.',
        ];

        for ($i = 0; $i < 30; $i++) {
            $service = $services->random();
            $reservationDate = $rangeStart->copy()->addDays(random_int(0, $totalDays));

            $status = $reservationDate->isPast()
                ? (random_int(1, 100) <= 88 ? 'confirmed' : 'cancelled')
                : (random_int(1, 100) <= 92 ? 'confirmed' : 'cancelled');

            $guestName = CameroonianNames::random();
            $createdAt = $reservationDate->copy()->subDays(random_int(1, 30));
            if ($createdAt->gt($now)) {
                $createdAt = $now->copy()->subDays(random_int(0, 10));
            }

            $reference = 'SVC-'.$reservationDate->format('Ymd').'-'.Str::upper(Str::random(4));
            while (ServiceReservation::query()->where('reference', $reference)->exists()) {
                $reference = 'SVC-'.$reservationDate->format('Ymd').'-'.Str::upper(Str::random(4));
            }

            ServiceReservation::create([
                'reference' => $reference,
                'service_id' => $service->id,
                'reservation_date' => $reservationDate,
                'guest_name' => $guestName,
                'guest_email' => CameroonianNames::email($guestName),
                'guest_phone' => CameroonianNames::phone(),
                'notes' => $notesOptions[array_rand($notesOptions)],
                'status' => $status,
                'created_at' => $createdAt,
                'updated_at' => $createdAt,
            ]);
        }
    }
}
