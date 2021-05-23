<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Resources\AdminRessource;
use App\Http\Resources\ClasseRessource;
use App\Http\Resources\EtudiantRessource;
use App\Http\Resources\FormationRessource;
use App\Http\Resources\GroupeRessource;

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

Route::get('/admin' , function() {
    return new AdminRessource([]);
});

Route::get('/' , function() { return new GlobalRessource([]); });

Route::get('/classe' , function() { return new ClasseRessource([]); });
Route::get('/formation' , function() { return new FormationRessource([]); });
Route::get('/groupe' , function() { return new GroupeRessource([]); });
Route::get('/etudiant' , function() { return new EtudiantRessource([]); });
