<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

use Illuminate\Support\Facades\DB;

class AdminRessource extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        session_start();
        if(isset($_SESSION["admin"])) {
            $serverTask = sizeof(DB::select('SELECT id FROM jobs;'));
            $lastUpdate = date("d/m/Y H:i:s", filemtime("../repartition/data/etudiant_groupe.csv"));
            return [
                'serverstatus'=> ($serverTask > 0) ? 'working' : 'sleeping',
                'servertaskcount'=> $serverTask,
                'lastupdate'=> $lastUpdate
            ];
        } else {
            return [ 'Accès restreint' => "Vous devez être connecter en tant qu'administrateur pour obtenir cela"];
        }
    }
}
