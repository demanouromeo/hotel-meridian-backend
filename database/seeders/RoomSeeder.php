<?php

namespace Database\Seeders;

use App\Models\Room;
use App\Models\RoomType;
use Illuminate\Database\Seeder;

class RoomSeeder extends Seeder
{
    public function run(): void
    {
        $floors = [
            'standard' => 1,
            'executive' => 2,
            'junior_executive' => 3,
            'junior_suite' => 4,
            'senior_suite' => 5,
        ];

        foreach ($floors as $code => $floor) {
            $roomType = RoomType::query()->where('code', $code)->first();

            if (! $roomType) {
                continue;
            }

            for ($i = 1; $i <= $roomType->total_units; $i++) {
                $roomNumber = sprintf('%d%02d', $floor, $i);

                Room::query()->updateOrCreate(
                    ['room_number' => $roomNumber],
                    [
                        'room_type_id' => $roomType->id,
                        'floor' => $floor,
                        'status' => 'available',
                    ]
                );
            }
        }
    }
}
