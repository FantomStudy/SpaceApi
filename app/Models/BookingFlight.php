<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class BookingFlight extends Model
{
    //
    use HasFactory;

    protected $fillable = [
      'user_id',
      'flight_id',
    ];

    public function user() : hasOne {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
    public function flight() : hasOne {
        return $this->hasOne(Flight::class, 'id', 'flight_id');
    }
}
