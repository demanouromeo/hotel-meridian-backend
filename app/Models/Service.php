<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

#[Fillable(['code', 'name_en', 'name_fr', 'description_en', 'description_fr', 'starting_price', 'is_active', 'image_path'])]
class Service extends Model
{
    protected function casts(): array
    {
        return [
            'starting_price' => 'integer',
            'is_active' => 'boolean',
        ];
    }

    public function getRouteKeyName(): string
    {
        return 'code';
    }

    public function reservations(): HasMany
    {
        return $this->hasMany(ServiceReservation::class);
    }
}
