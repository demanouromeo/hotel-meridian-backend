<?php

namespace App\Http\Requests;

use App\Models\RoomType;
use App\Services\AvailabilityService;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class StoreBookingRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'room_type_id' => ['required', 'integer', 'exists:room_types,id'],
            'dining_service_id' => ['nullable', 'integer', 'exists:dining_services,id'],
            'check_in' => ['required', 'date', 'after_or_equal:today'],
            'check_out' => ['required', 'date', 'after:check_in'],
            'guests_count' => ['required', 'integer', 'min:1'],
            'payment_method' => ['required', 'in:online,at_hotel'],
            'guest_name' => ['required', 'string', 'max:255'],
            'guest_email' => ['required', 'email', 'max:255'],
            'guest_phone' => ['required', 'string', 'max:30'],
            'guest_nationality' => ['nullable', 'string', 'max:100'],
            'special_requests' => ['nullable', 'string', 'max:2000'],
            'locale' => ['nullable', 'in:en,fr'],
        ];
    }

    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            $roomTypeId = $this->input('room_type_id');
            $guestsCount = (int) $this->input('guests_count');

            if (! $roomTypeId || ! $this->input('check_in') || ! $this->input('check_out')) {
                return;
            }

            $roomType = RoomType::find($roomTypeId);

            if (! $roomType) {
                return;
            }

            if ($guestsCount > $roomType->capacity) {
                $validator->errors()->add(
                    'guests_count',
                    "This room type accommodates a maximum of {$roomType->capacity} guests."
                );

                return;
            }

            $checkIn = \Illuminate\Support\Carbon::parse($this->input('check_in'));
            $checkOut = \Illuminate\Support\Carbon::parse($this->input('check_out'));

            $available = app(AvailabilityService::class)->isAvailable($roomType, $checkIn, $checkOut);

            if (! $available) {
                $validator->errors()->add(
                    'room_type_id',
                    'No rooms of this type are available for the selected dates.'
                );
            }
        });
    }
}
