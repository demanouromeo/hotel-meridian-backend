<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BookingResource extends JsonResource
{
    /**
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'reference' => $this->reference,
            'room_type' => new RoomTypeResource($this->whenLoaded('roomType')),
            'dining_service' => new DiningServiceResource($this->whenLoaded('diningService')),
            'guest_name' => $this->guest_name,
            'guest_email' => $this->guest_email,
            'guest_phone' => $this->guest_phone,
            'guest_nationality' => $this->guest_nationality,
            'check_in' => $this->check_in->toDateString(),
            'check_out' => $this->check_out->toDateString(),
            'guests_count' => $this->guests_count,
            'payment_method' => $this->payment_method,
            'status' => $this->status,
            'total_price' => $this->total_price,
            'special_requests' => $this->special_requests,
            'locale' => $this->locale,
            'created_at' => $this->created_at,
        ];
    }
}
