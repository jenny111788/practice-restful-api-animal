<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//動物
Route::apiResource('animal', 'AnimalController');

//動物分類
Route::apiResource('types', 'TypeController');

//我的最愛可以用 like 辨識
Route::post('animal/{animal}/like', 'AnimalController@like');