<?php

namespace App\Http\Requests;

use App\Models\ServiceReservation;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class StoreServiceReservationRequest extends FormRequest
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
            'reservation_date' => ['required', 'date', 'after_or_equal:today'],
            'guest_name' => ['required', 'string', 'max:255'],
            'guest_email' => ['required', 'email', 'max:255'],
            'guest_phone' => ['nullable', 'string', 'max:30'],
            'notes' => ['nullable', 'string', 'max:2000'],
        ];
    }

    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            $service = $this->route('service');
            $date = $this->input('reservation_date');

            if (! $service || ! $date) {
                return;
            }

            $taken = ServiceReservation::query()
                ->where('service_id', $service->id)
                ->where('reservation_date', $date)
                ->where('status', 'confirmed')
                ->exists();

            if ($taken) {
                $validator->errors()->add(
                    'reservation_date',
                    'This date is already reserved for this service. Please choose another date.'
                );
            }
        });
    }
}
