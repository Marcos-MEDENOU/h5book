<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->enum('gender', ['M', 'F']);
            $table->date('date_of_birth')->nullable();
            $table->foreignId('id_country')->nullable();
            $table->string('phone_number')->nullable();
            $table->foreignId('id_profession')->nullable();
            $table->foreignId('id_gallery')->nullable();
            $table->foreignId('id_cover_gallery')->nullable();
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('id_country')->references('id')->on('countries');
            $table->foreign('id_profession')->references('id')->on('professions');
            $table->foreign('id_gallery')->references('id')->on('gallery_users');
            $table->foreign('id_cover_gallery')->references('id')->on('gallery_users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
