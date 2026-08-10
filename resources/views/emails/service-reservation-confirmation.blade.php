<x-mail::message>
# Reservation Confirmed

Dear {{ $reservation->guest_name }},

Your reservation at Hotel Meridian is confirmed. Here are the details:

<x-mail::table>
| | |
|---|---|
| Reference | {{ $reservation->reference }} |
| Service | {{ $reservation->service->name_en }} |
| Date | {{ $reservation->reservation_date->toFormattedDateString() }} |
</x-mail::table>

If you need to cancel, you can do so at any time from our website using this reference and your email address.

If you have any questions, contact us at {{ config('services.hotel.contact_email') }} or {{ config('services.hotel.contact_phone') }}.

Thanks,<br>
Hotel Meridian
</x-mail::message>
