<x-mail::message>
# New Service Reservation Received

<x-mail::table>
| | |
|---|---|
| Reference | {{ $reservation->reference }} |
| Service | {{ $reservation->service->name_en }} |
| Date | {{ $reservation->reservation_date->toFormattedDateString() }} |
| Guest | {{ $reservation->guest_name }} ({{ $reservation->guest_email }}, {{ $reservation->guest_phone }}) |
| Notes | {{ $reservation->notes ?? '—' }} |
</x-mail::table>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
