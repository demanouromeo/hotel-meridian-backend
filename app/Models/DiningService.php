<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['name_en', 'name_fr', 'description_en', 'description_fr', 'price_per_guest_per_night', 'is_active'])]
class DiningService extends Model
{
    protected function casts(): array
    {
        return [
            'is_active' => 'boolean',
            'price_per_guest_per_night' => 'integer',
        ];
    }

    public function bookings(): HasMany
    {
        return $this->hasMany(Booking::class);
    }
}
