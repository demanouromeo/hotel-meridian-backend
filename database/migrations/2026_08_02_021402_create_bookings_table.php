<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->string('reference')->unique();
            $table->foreignId('room_type_id')->constrained();
            $table->foreignId('room_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('dining_service_id')->nullable()->constrained()->nullOnDelete();
            $table->string('guest_name');
            $table->string('guest_email');
            $table->string('guest_phone');
            $table->string('guest_nationality')->nullable();
            $table->date('check_in');
            $table->date('check_out');
            $table->unsignedTinyInteger('guests_count');
            $table->enum('payment_method', ['online', 'at_hotel'])->default('at_hotel');
            $table->enum('status', [
                'pending_payment',
                'confirmed',
                'cancelled',
                'checked_in',
                'checked_out',
            ])->default('pending_payment');
            $table->unsignedInteger('total_price');
            $table->text('special_requests')->nullable();
            $table->string('locale', 2)->default('fr');
            $table->timestamps();

            $table->index(['room_type_id', 'check_in', 'check_out']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
