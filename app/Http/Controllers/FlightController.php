<?php

namespace App\Http\Controllers;

use App\Models\BookingFlight;
use App\Models\Flight;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FlightController extends Controller
{
    public function bookingFlight(Request $request)
    {
        $flight = Flight::where('flight_number', $request->flight_number)->first();

        if (!$flight) {
            throw new ModelNotFoundException();
        }
        if ($flight->seats_available <= 0) {
            return response()->json([
                'data' => [
                    'code' => 400,
                    'message' => 'Все места на рейсе заняты'
                ]
            ], 400);
        }
        if ($flight->launch_date < now()) {
            return response()->json([
                'data' => [
                    'code' => 400,
                    'message' => 'Время рейса прошло'
                ]
            ], 400);
        }

        BookingFlight::create([
            'user_id' => Auth::id(),
            'flight_id' => $flight->id,
        ]);

        $flight->seats_available -= 1;
        $flight->save();

        return response()->json([
            'data' => [
                'code' => 201,
                'message' => 'Рейс забронирован'
            ]
        ], 201);
    }

    public function createFlight(Request $request)
    {
        $request->validate([
            'flight_number' => 'required|string|unique:flights,flight_number',
            'destination' => 'required|string',
            'launch_date' => 'required|string',
            'seats_available' => 'required|integer',
        ]);
        Flight::create($request->all());
        return response()->json([
            'code' => 201,
            'message' => 'Космический полет создан',
        ], 201);
    }

    public function getFlightList(Request $request)
    {
        $array = [];
        $flights = Flight::where('seats_available', '>', 0)->where('launch_date', '>', now())->get();

        foreach ($flights as $flight) {
            $array[] = [
                'flight_number' => $flight->flight_number,
                'destination' => $flight->destination,
                'launch_date' => $flight->launch_date,
                'seats_available' => $flight->seats_available,
            ];
        }
        return response()->json([
            'data' => $array
        ]);
    }
}
