<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

#[Fillable([
    'reference', 'service_id', 'reservation_date',
    'guest_name', 'guest_email', 'guest_phone', 'notes', 'status',
])]
class ServiceReservation extends Model
{
    protected function casts(): array
    {
        return [
            'reservation_date' => 'date',
        ];
    }

    public function service(): BelongsTo
    {
        return $this->belongsTo(Service::class);
    }

    public static function generateReference(): string
    {
        do {
            $reference = 'SVC-'.now()->format('Ymd').'-'.Str::upper(Str::random(4));
        } while (static::query()->where('reference', $reference)->exists());

        return $reference;
    }
}
