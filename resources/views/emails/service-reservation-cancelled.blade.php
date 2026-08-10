<x-mail::message>
# Reservation Cancelled

Dear {{ $reservation->guest_name }},

Your reservation at Hotel Meridian has been cancelled as requested.

<x-mail::table>
| | |
|---|---|
| Reference | {{ $reservation->reference }} |
| Service | {{ $reservation->service->name_en }} |
| Date | {{ $reservation->reservation_date->toFormattedDateString() }} |
</x-mail::table>

If this was a mistake, feel free to make a new reservation on our website at any time.

Thanks,<br>
Hotel Meridian
</x-mail::message>
