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
        if(
            isset($_POST["formation_id"])
        ) {
            [$ue_liste,$mat_liste] = BDD::get_matiere_par_ue($_POST["formation_id"]);
            return view( 'option' , [
                'ues' => $ue_liste ,
                'matieres' => $mat_liste , 
                'choix' => BDD::get_matieres_choix($_POST["formation_id"]),
                'incompatible' => BDD::get_matieres_incompatible_par_formation_text($_POST["formation_id"])
            ] );
        } else {
			return response(view('errors.pattern',['err' => '406 - Parameters missing or not acceptable']),406);
        } 
    }
}
