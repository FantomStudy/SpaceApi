<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mission extends Model
{
    //
    use HasFactory;

    protected $fillable = [
        'name',
        'launch_details',
        'landing_details',
        'spacecraft',
//        'type',
    ];
    protected $casts = [
        'launch_details' => 'array',
        'landing_details' => 'array',
        'spacecraft' => 'array',
    ];
}
