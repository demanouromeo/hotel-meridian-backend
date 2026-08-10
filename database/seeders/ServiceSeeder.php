<?php

namespace Database\Seeders;

use App\Models\Service;
use Illuminate\Database\Seeder;

class ServiceSeeder extends Seeder
{
    public function run(): void
    {
        $services = [
            [
                'code' => 'conference_room',
                'name_en' => 'Conference / Meeting Room',
                'name_fr' => 'Salle de conférence / réunion',
                'description_en' => 'A well-equipped room for meetings, seminars and conferences.',
                'description_fr' => 'Une salle bien équipée pour vos réunions, séminaires et conférences.',
                'starting_price' => 350000,
            ],
            [
                'code' => 'party_hall',
                'name_en' => 'Party Hall',
                'name_fr' => 'Salle de fête',
                'description_en' => 'A spacious hall for weddings, birthdays and celebrations.',
                'description_fr' => 'Une salle spacieuse pour vos mariages, anniversaires et célébrations.',
                'starting_price' => 600000,
            ],
            [
                'code' => 'sound_decoration',
                'name_en' => 'Sound System / Decoration',
                'name_fr' => 'Sonorisation / Décoration',
                'description_en' => 'Professional sound system and decoration for your events.',
                'description_fr' => 'Sonorisation professionnelle et décoration pour vos événements.',
                'starting_price' => 200000,
            ],
            [
                'code' => 'catering',
                'name_en' => 'Catering Service',
                'name_fr' => 'Service traiteur',
                'description_en' => 'Catering service for your events, from cocktails to full menus.',
                'description_fr' => 'Service traiteur pour vos événements, du cocktail au menu complet.',
                'starting_price' => 1200000,
            ],
            [
                'code' => 'fitness_subscription',
                'name_en' => 'Monthly Fitness Room Subscription',
                'name_fr' => 'Abonnement mensuel salle de fitness',
                'description_en' => 'Monthly access to our fitness room.',
                'description_fr' => 'Accès mensuel à notre salle de fitness.',
                'starting_price' => 60000,
            ],
        ];

        foreach ($services as $service) {
            Service::query()->updateOrCreate(['code' => $service['code']], $service);
        }
    }
}
