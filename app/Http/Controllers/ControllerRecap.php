<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use App\Models\BDD;

class ControllerRecap extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	public function render() {
		if(!isset($_POST['opt_choix'])) { $_POST['opt_choix'] = [];}
		if(
			isset($_POST['id_formation']) &&
			BDD::verification_coherence($_POST['id_formation'],$_POST['opt_choix'])
		) {
			BDD::set_etudiant($_POST["id_formation"],$_POST["opt_choix"]);
			return view('recap',[
				'nom_formation' => BDD::get_nom_formation_par_id($_POST['id_formation']),
				'liste_option' => BDD::get_nom_choix_par_id($_POST['opt_choix'])
			]);
		} else {
			return response(view('errors.pattern',['err' => '406 - Parameters missing or not acceptable']),406);
		}
	}
}
