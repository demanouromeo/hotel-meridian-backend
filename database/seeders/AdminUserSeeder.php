<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    public function run(): void
    {
        User::query()->updateOrCreate(
            ['email' => env('ADMIN_EMAIL', 'admin@meridian.com')],
            [
                'name' => env('ADMIN_NAME', 'Hotel Meridian Admin'),
                'password' => Hash::make(env('ADMIN_PASSWORD', 'change-me-please')),
                'role' => 'admin',
                'email_verified_at' => now(),
            ]
        );
    }
}
