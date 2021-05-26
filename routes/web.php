<?php

use Illuminate\Support\Facades\Route;

use App\Http\Resources\AdminRessource;
use App\Http\Controllers\ControllerAdmin;
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
})->name('login');

Route::post('/formation', 'App\Http\Controllers\ControllerFormation@render')->name('formation');

Route::post('/option', 'App\Http\Controllers\ControllerOption@render')->name('option');

Route::post('/recap', 'App\Http\Controllers\ControllerRecap@render')->name('recap');

Route::post('/admin', 'App\Http\Controllers\ControllerAdmin@render')->name('admin');

Route::get('/admin', 'App\Http\Controllers\ControllerAdmin@render')->name('admin');

Route::get('/admin/recup/{type}.csv', function($type) {
    session_start();
    if(! isset($_SESSION['admin'])) {
        return redirect()->to('admin');
    }
    switch($type) {
        case 'etudiants': return response(ControllerAdmin::get_etudiants() , 200)->header('Content-Type', 'text/csv');
        case 'matieres': return response(ControllerAdmin::get_matieres() , 200)->header('Content-Type', 'text/csv');
        case 'formation': return response(ControllerAdmin::get_formation() , 200)->header('Content-Type', 'text/csv');
        default: return response( view('errors.pattern',['err' => '404 - Not Found']),404);
    }
})->name('adminrecup');

Route::get('/admin/api', function () {
    return new AdminRessource([]);
})->name('adminapi');
