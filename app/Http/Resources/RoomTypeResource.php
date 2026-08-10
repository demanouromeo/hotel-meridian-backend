<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class RoomTypeResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'code' => $this->code,
            'name_en' => $this->name_en,
            'name_fr' => $this->name_fr,
            'description_en' => $this->description_en,
            'description_fr' => $this->description_fr,
            'beds' => $this->beds,
            'baths' => $this->baths,
            'capacity' => $this->capacity,
            'price_per_night' => $this->price_per_night,
            'total_units' => $this->total_units,
            'amenities' => $this->amenities,
            'image_url' => $this->image_path ? Storage::disk('public')->url($this->image_path) : null,
            'available_units' => $this->when(
                isset($this->available_units),
                fn () => $this->available_units
            ),
        ];
    }
}
