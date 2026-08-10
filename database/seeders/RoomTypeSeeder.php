<?php

namespace Database\Seeders;

use App\Models\RoomType;
use Illuminate\Database\Seeder;

class RoomTypeSeeder extends Seeder
{
    public function run(): void
    {
        $baseAmenities = ['wifi' => true, 'tv' => true, 'phone' => false, 'kitchen' => false, 'parking' => true];
        $suiteAmenities = ['wifi' => true, 'tv' => true, 'phone' => true, 'kitchen' => true, 'parking' => true];

        $roomTypes = [
            [
                'code' => 'standard',
                'name_en' => 'Standard Room',
                'name_fr' => 'Chambre Standard',
                'description_en' => 'A comfortable room with one bed, ideal for two guests.',
                'description_fr' => 'Une chambre confortable avec un lit, idéale pour deux personnes.',
                'beds' => 1,
                'baths' => 1,
                'capacity' => 2,
                'price_per_night' => 15000,
                'total_units' => 15,
                'amenities' => $baseAmenities,
            ],
            [
                'code' => 'executive',
                'name_en' => 'Executive Room',
                'name_fr' => 'Chambre Executive',
                'description_en' => 'A spacious room with two beds, perfect for families or small groups of up to four guests.',
                'description_fr' => 'Une chambre spacieuse avec deux lits, parfaite pour les familles ou petits groupes jusqu’à quatre personnes.',
                'beds' => 2,
                'baths' => 1,
                'capacity' => 4,
                'price_per_night' => 50000,
                'total_units' => 4,
                'amenities' => $baseAmenities,
            ],
            [
                'code' => 'junior_executive',
                'name_en' => 'Junior Executive Room',
                'name_fr' => 'Chambre Executive Junior',
                'description_en' => 'A cozy room with one bed, well suited for two guests.',
                'description_fr' => 'Une chambre chaleureuse avec un lit, bien adaptée pour deux personnes.',
                'beds' => 1,
                'baths' => 1,
                'capacity' => 2,
                'price_per_night' => 30000,
                'total_units' => 6,
                'amenities' => $baseAmenities,
            ],
            [
                'code' => 'junior_suite',
                'name_en' => 'Junior Suite',
                'name_fr' => 'Suite Junior',
                'description_en' => 'An elegant suite with one bed and a kitchenette, for two guests.',
                'description_fr' => 'Une suite élégante avec un lit et une kitchenette, pour deux personnes.',
                'beds' => 1,
                'baths' => 1,
                'capacity' => 2,
                'price_per_night' => 65000,
                'total_units' => 2,
                'amenities' => $suiteAmenities,
            ],
            [
                'code' => 'senior_suite',
                'name_en' => 'Senior Suite',
                'name_fr' => 'Suite Senior',
                'description_en' => 'Our most luxurious suite, with two beds, two bathrooms and a full kitchen, for up to four guests.',
                'description_fr' => 'Notre suite la plus luxueuse, avec deux lits, deux salles de bain et une cuisine complète, jusqu’à quatre personnes.',
                'beds' => 2,
                'baths' => 2,
                'capacity' => 4,
                'price_per_night' => 110000,
                'total_units' => 1,
                'amenities' => $suiteAmenities,
            ],
        ];

        foreach ($roomTypes as $roomType) {
            RoomType::query()->updateOrCreate(['code' => $roomType['code']], $roomType);
        }
    }
}
