<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    public function run(): void
    {
        $settings = [
            'hotel_name' => 'Hotel Meridian',
            'contact_email' => 'booking@meridian.com',
            'contact_phone' => '+237 695 52 71',
            'address' => 'Bamenda, Cameroun',
            'languages' => 'fr,en',
        ];

        foreach ($settings as $key => $value) {
            Setting::query()->updateOrCreate(['key' => $key], ['value' => $value]);
        }
    }
}
