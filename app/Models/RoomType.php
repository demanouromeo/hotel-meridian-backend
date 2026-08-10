<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable([
    'code', 'name_en', 'name_fr', 'description_en', 'description_fr',
    'beds', 'baths', 'capacity', 'price_per_night', 'total_units', 'amenities', 'image_path',
])]
class RoomType extends Model
{
    protected function casts(): array
    {
        return [
            'amenities' => 'array',
            'price_per_night' => 'integer',
            'total_units' => 'integer',
        ];
    }

    public function rooms(): HasMany
    {
        return $this->hasMany(Room::class);
    }

    public function bookings(): HasMany
    {
        return $this->hasMany(Booking::class);
    }

    public function getRouteKeyName(): string
    {
        return 'code';
    }
}
