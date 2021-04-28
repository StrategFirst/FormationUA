<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use App\Models\BDD;

class ControllerOption extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    

	public function render() { 
        // Transformation de la reqûete SQL en un format utilisable aisément par la vue
        $ue_liste = [];
        foreach(BDD::get_ue($_POST["formation_id"]) as $ue) {
            if( ! isset($ue_liste[ $ue->bloc ]) ) {
                $ue_liste[ $ue->bloc ] = [];
            }
            array_push( $ue_liste[ $ue->bloc ] , $ue );
        }
        return view('option',['ues'=>$ue_liste]); }
}
