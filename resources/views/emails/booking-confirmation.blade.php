<x-mail::message>
# Booking Confirmed

Dear {{ $booking->guest_name }},

Your reservation at Hotel Meridian is confirmed. Here are the details:

<x-mail::table>
| | |
|---|---|
| Reference | {{ $booking->reference }} |
| Room type | {{ $booking->roomType->name_en }} |
| Check-in | {{ $booking->check_in->toFormattedDateString() }} |
| Check-out | {{ $booking->check_out->toFormattedDateString() }} |
| Guests | {{ $booking->guests_count }} |
| Total | {{ number_format($booking->total_price) }} FCFA |
</x-mail::table>

If you have any questions, contact us at {{ config('services.hotel.contact_email') }} or {{ config('services.hotel.contact_phone') }}.

Thanks,<br>
Hotel Meridian
</x-mail::message>
