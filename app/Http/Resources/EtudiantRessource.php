<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

use Illuminate\Support\Facades\DB;

class EtudiantRessource extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return mixed
     */
    public function toArray($request)
    {
		 if(isset($_GET['id'])) {
			return $this->toObject($request);
		 } else {
			$query = DB::select("SELECT id,nom,prenom FROM etudiant");
			return $query;
		 }
    }

	 public function toObject($request) {
		$query = DB::select("SELECT * FROM etudiant WHERE id = :id",['id'=>$_GET['id']]);
		if(sizeof($query) == 0) {
			return ["Pas d'étudiant pour l'id : "=>$_GET['id']];
		} else {
			$query[0]->groupe = array_map( function($v){return $v->id_groupe;} , DB::select("SELECT id_groupe FROM choix_groupe WHERE id_etu = :id_etu",['id_etu'=>$query[0]->id]) );
			return $query[0];
		}
	 }
}
