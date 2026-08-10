<x-mail::message>
# Password Reset Request

Hello {{ $user->name }},

We received a request to reset the password for your Hotel Meridian admin account
({{ $user->email }}).

<x-mail::button :url="$resetUrl">
Reset Password
</x-mail::button>

This link will expire in 60 minutes. If you did not request a password reset, no
further action is required and your password will remain unchanged.

Thanks,<br>
Hotel Meridian
</x-mail::message>
