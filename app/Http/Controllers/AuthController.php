<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Models\User;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    //
    public function registration(StoreUserRequest $request)
    {
        $user = User::create($request->all());
        return response()->json([
            'data' => [
                'user' => [
                    'name' => $user->first_name . ' ' . $user->last_name . ' ' . $user->patronymic,
                    'email' => $user->email,
                ],
                'code' => 201,
                'message' => 'Пользователь создан'
            ]
        ], 201);
    }

    public function login(LoginUserRequest $request)
    {
        $attempt = Auth::attempt($request->only('email', 'password'));
        if (!$attempt) {
            throw new AuthenticationException();
        }
        $user = Auth::user();
        return response()->json([
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'name' => $user->first_name . ' ' . $user->last_name . ' ' . $user->patronymic,
                    'birth_date' => $user->birth_date,
                    'email' => $user->email,
                ],
                'token' => $user->createToken('reg token')->plainTextToken,
            ]
        ]);
    }

    public function logout()
    {
        Auth::user()->currentAccessToken()->delete();
        return response()->json([], 204);
    }
}
