<x-mail::message>
# New Booking Received

<x-mail::table>
| | |
|---|---|
| Reference | {{ $booking->reference }} |
| Room type | {{ $booking->roomType->name_en }} |
| Guest | {{ $booking->guest_name }} ({{ $booking->guest_email }}, {{ $booking->guest_phone }}) |
| Check-in | {{ $booking->check_in->toFormattedDateString() }} |
| Check-out | {{ $booking->check_out->toFormattedDateString() }} |
| Guests | {{ $booking->guests_count }} |
| Payment method | {{ $booking->payment_method }} |
| Total | {{ number_format($booking->total_price) }} FCFA |
</x-mail::table>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
