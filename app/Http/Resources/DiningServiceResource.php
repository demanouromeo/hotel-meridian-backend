<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DiningServiceResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name_en' => $this->name_en,
            'name_fr' => $this->name_fr,
            'description_en' => $this->description_en,
            'description_fr' => $this->description_fr,
            'price_per_guest_per_night' => $this->price_per_guest_per_night,
            'is_active' => $this->is_active,
        ];
    }
}
