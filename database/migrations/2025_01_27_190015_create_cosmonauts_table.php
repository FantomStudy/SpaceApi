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
        Schema::create('cosmonauts', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('birth_date');
            $table->string('rank');
            $table->json('bio'); //early life, career, post_flight
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cosmonauts');
    }
};
