<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

use App\Models\BDD;
use Illuminate\Support\Facades\DB;

class ControllerRecap extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	public function render() {
		DB::insert('INSERT INTO etudiant(nom,prenom) VALUES ("NTest","PTest")');
		$id = DB::select('SELECT id AS LastID FROM etudiant WHERE id = @@identity')[0]->LastID;
		DB::insert('INSERT INTO inscrit_formation(id_etudiant,id_formation) VALUES (:id_etu,:id_form)',['id_etu'=>$id,'id_form'=>$_POST['id_formation']]);
		foreach($_POST['opt_choix'] as $choix) {
			DB::insert('INSERT INTO choix_etudiants(id_etu,id_matiere) VALUES (:id_etu,:id_mat)',['id_etu'=>$id,'id_mat'=>$choix]);
		}
		return view('recap',[
			'nom_formation' => DB::select("SELECT nom FROM formation WHERE id = :id_form" , ['id_form' => $_POST['id_formation']])[0]->nom,
			'liste_option' => array_map(function ($id) { return DB::select("SELECT descriptif FROM matiere WHERE id = :id_mat",['id_mat'=>$id])[0]->descriptif; },$_POST['opt_choix'])
		]); }
}
