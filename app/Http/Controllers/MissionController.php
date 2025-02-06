<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreMissionRequest;
use App\Models\Mission;
use Illuminate\Http\Request;

class MissionController extends Controller
{
    public function getGagarinFlight()
    {
        $array = [];
        $flights = Mission::where('type', "Полет Гагарина")
            ->whereJsonContains('spacecraft->cosmonaut', [['name' => 'Юрий Гагарин']])
            ->get();

        foreach ($flights as $flight) {
            $array [] = [
                'mission' => [
                    'name' => $flight->name,
                    'launch_details' => [
                        'launch_date' => $flight->launch_details['launch_date'],
                        'launch_site' => $flight->launch_details['launch_site'],
                    ],
                    'flight_duration' => $flight->landing_details['flight_duration'],
                    'spacecraft' => [
                        'name' => $flight->spacecraft['name'],
                        'manufacturer' => $flight->spacecraft['manufacturer'],
                        'crew_capacity' => count($flight->spacecraft['cosmonaut']),
                    ]
                ],
                'landing' => [
                    'date' => $flight->landing_details['date'],
                    'site' => $flight->landing_details['site'],
                    'details' => $flight->landing_details['details'],
                ],
                'cosmonaut' => $flight->spacecraft['cosmonaut'],

            ];
        }
        return response()->json([
            'data' => $array
        ]);
    }

    public function getStaticFlight()
    {
        $flight = Mission::where('type', 'Полет')->first();
        return response()->json([
            'data' => [
                "name" => $flight->name,
                "crew_capacity" => count($flight->spacecraft['crew']),
                'cosmonaut' => $flight->spacecraft['crew'],
                'launch_details' => [
                    'launch_date' => $flight->launch_details['launch_date'],
                    'launch_site' => [
                        'name' => $flight->launch_details['launch_site']['name'],
                        'latitude' => $flight->launch_details['launch_site']['location']['latitude'],
                        'longitude' => $flight->launch_details['launch_site']['location']['longitude'],
                    ]
                ],
                'landing_details' => [
                    'landing_date' => $flight->landing_details['landing_date'],
                    'landing_site' => [
                        'name' => $flight->landing_details['landing_site']['name'],
                        'latitude' => $flight->landing_details['landing_site']['coordinates']['latitude'],
                        'longitude' => $flight->landing_details['landing_site']['coordinates']['longitude'],
                    ]
                ],
            ]
        ]);
    }

    public function createMission(StoreMissionRequest $request)
    {
        $mission = $request->mission;

        Mission::create([
            'name' => $mission['name'],
            'launch_details' => $mission['launch_details'],
            'landing_details' => $mission['landing_details'],
            'spacecraft' => $mission['spacecraft'],
        ]);

        return response()->json([
            'data' => [
                'code' => 201,
                'message' => 'Миссия добавлена',
            ]
        ], 201);
    }

    public function deleteMission(Mission $mission)
    {
        if ($mission->type != 'Миссия') {
            return response()->json([
                'data' => [
                    'code' => 400,
                    'message' => 'Вы можете удалять только миссии'
                ]
            ], 400);
        }
        $mission->delete();
        return response()->json([], 204);
    }

    public function updateMission(Request $request, Mission $mission)
    {
        $data = $request->mission;

        if ($mission->type != 'Миссия') {
            return response()->json([
                'data' => [
                    'code' => 400,
                    'message' => 'Вы можете менять только миссии'
                ]
            ], 400);
        }

        if (isset($data['name'])) {
            $mission->name = $data['name'];
        }
        if (isset($data['launch_details'])) {
            $mission->launch_details = $data['launch_details'];
        }
        if (isset($data['landing_details'])) {
            $mission->landing_details = $data['landing_details'];
        }
        if (isset($data['spacecraft'])) {
            $mission->spacecraft = $data['spacecraft'];
        }

        $mission->save();

        return response()->json([
            'data' => [
                'code' => 200,
                'message' => 'Миссия обновлена',
                'mission' => $mission,
            ]
        ]);
    }

    public function getMissionList()
    {
        $array = [];
        $missions = Mission::where('type', 'Миссия')->get();

        foreach ($missions as $mission) {
            $array[] = [
                'mission' => [
                    'name' => $mission->name,
                    'launch_details' => $mission->launch_details,
                    'landing_details' => $mission->landing_details,
                    'spacecraft' => $mission->spacecraft,
                ],
            ];
        }
        return response()->json($array);
    }

    public function search(Request $request)
    {
        $array = [];
        $query = $request->get('query');

        if (empty($query)) {
            return response()->json([
                'data' => []
            ]);
        }

        $missions = Mission::where('name', 'like', "%$query%")
            ->orWhere('spacecraft', 'like', "%$query%")
            ->where('type', 'Миссия')->get();

        foreach ($missions as $mission) {
            $array[] = [
                'type' => $mission->type,
                'name' => $mission->name,
                'launch_date' => $mission->launch_details['launch_date'],
                'landing_date' => $mission->landing_details['landing_date'],
                'landing_site' => $mission->landing_details['landing_site']['name'],
                'crew' => $mission->spacecraft['crew'],
            ];
        }
        return response()->json([
            'data' => $array
        ]);
    }
}
