<?php

namespace Database\Seeders;

use App\Models\DiningService;
use Illuminate\Database\Seeder;

class DiningServiceSeeder extends Seeder
{
    public function run(): void
    {
        $services = [
            [
                'name_en' => 'Room Only',
                'name_fr' => 'Chambre seule',
                'description_en' => 'No dining plan included.',
                'description_fr' => 'Aucune formule de restauration incluse.',
                'price_per_guest_per_night' => 0,
            ],
            [
                'name_en' => 'Breakfast Only',
                'name_fr' => 'Petit-déjeuner seul',
                'description_en' => 'Continental breakfast served each morning.',
                'description_fr' => 'Petit-déjeuner continental servi chaque matin.',
                'price_per_guest_per_night' => 5000,
            ],
            [
                'name_en' => 'Half Board',
                'name_fr' => 'Demi-pension',
                'description_en' => 'Breakfast and dinner included.',
                'description_fr' => 'Petit-déjeuner et dîner inclus.',
                'price_per_guest_per_night' => 12000,
            ],
            [
                'name_en' => 'Full Board',
                'name_fr' => 'Pension complète',
                'description_en' => 'Breakfast, lunch and dinner included.',
                'description_fr' => 'Petit-déjeuner, déjeuner et dîner inclus.',
                'price_per_guest_per_night' => 18000,
            ],
        ];

        foreach ($services as $service) {
            DiningService::query()->updateOrCreate(
                ['name_en' => $service['name_en']],
                $service + ['is_active' => true]
            );
        }
    }
}
