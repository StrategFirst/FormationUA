<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/formation', 'App\Http\Controllers\ControllerFormation@render')->name('formation');

Route::get('/option', 'App\Http\Controllers\ControllerOption@render')->name('option');

Route::get('/recap', 'App\Http\Controllers\ControllerRecap@render')->name('récapitulatif');
