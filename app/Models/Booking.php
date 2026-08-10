<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

#[Fillable([
    'reference', 'room_type_id', 'room_id', 'dining_service_id',
    'guest_name', 'guest_email', 'guest_phone', 'guest_nationality',
    'check_in', 'check_out', 'guests_count', 'payment_method', 'status',
    'total_price', 'special_requests', 'locale',
])]
class Booking extends Model
{
    protected function casts(): array
    {
        return [
            'check_in' => 'date',
            'check_out' => 'date',
            'guests_count' => 'integer',
            'total_price' => 'integer',
        ];
    }

    public function roomType(): BelongsTo
    {
        return $this->belongsTo(RoomType::class);
    }

    public function room(): BelongsTo
    {
        return $this->belongsTo(Room::class);
    }

    public function diningService(): BelongsTo
    {
        return $this->belongsTo(DiningService::class);
    }

    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class);
    }

    public static function generateReference(): string
    {
        do {
            $reference = 'MER-'.now()->format('Ymd').'-'.Str::upper(Str::random(4));
        } while (static::query()->where('reference', $reference)->exists());

        return $reference;
    }
}
