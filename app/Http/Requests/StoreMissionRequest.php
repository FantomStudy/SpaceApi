<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMissionRequest extends FormRequest
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
            'mission.name' => 'required|string|unique:missions,name',
            'mission.launch_details.launch_date' => 'required|string',
            'mission.launch_details.launch_site.name' => 'required|string',
            'mission.launch_details.launch_site.location.latitude' => 'required|numeric',
            'mission.launch_details.launch_site.location.longitude' => 'required|numeric',
            'mission.landing_details.landing_date' => 'required|string',
            'mission.landing_details.landing_site.name' => 'required|string',
            'mission.landing_details.landing_site.coordinates.latitude' => 'required|numeric',
            'mission.landing_details.landing_site.coordinates.longitude' => 'required|numeric',
            'mission.spacecraft.command_module' => 'required|string',
            'mission.spacecraft.lunar_module' => 'required|string',
            'mission.spacecraft.crew' => 'required|array',
            'mission.spacecraft.crew.*.name' => 'required|string',
            'mission.spacecraft.crew.*.role' => 'required|string',
        ];
    }
}
