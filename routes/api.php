<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\FlightController;
use App\Http\Controllers\MissionController;
use App\Http\Controllers\WaterMarkController;
use Illuminate\Support\Facades\Route;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/registration', [AuthController::class, 'registration']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/logout', [AuthController::class, 'logout']);

    Route::get('/gagarin-flight', [MissionController::class, 'getGagarinFlight']);
    Route::get('/flight', [MissionController::class, 'getStaticFlight']);

    Route::get('/search', [MissionController::class, 'search']);
    Route::get('/lunar-missions', [MissionController::class, 'getMissionList']);
    Route::post('/lunar-missions', [MissionController::class, 'createMission']);
    Route::delete('/lunar-missions/{mission}', [MissionController::class, 'deleteMission']);
    Route::patch('/lunar-missions/{mission}', [MissionController::class, 'updateMission']);

    Route::post('/space-flights', [FlightController::class, 'createFlight']);
    Route::get('/space-flights', [FlightController::class, 'getFlightList']);
    Route::post('/book-flight', [FlightController::class, 'bookingFlight']);

    Route::post('/lunar-watermark', [WaterMarkController::class, 'addWatermark']);
});
