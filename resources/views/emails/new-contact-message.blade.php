<x-mail::message>
# New Contact Message

<x-mail::table>
| | |
|---|---|
| Name | {{ $contactMessage->name }} |
| Email | {{ $contactMessage->email }} |
| Phone | {{ $contactMessage->phone ?? '—' }} |
| Subject | {{ $contactMessage->subject ?? '—' }} |
</x-mail::table>

{{ $contactMessage->message }}

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
