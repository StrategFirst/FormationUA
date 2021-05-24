<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

use Illuminate\Support\Facades\DB;

class GroupeRessource extends ResourceCollection
{
	public static $wrap = null;
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */

    public function toArray($request)
    {
		 if(isset($_GET['id'])) {
			return $this->toObject($request);
		 } else {
			$query = DB::select("SELECT * FROM groupe");
			return $query;
		 }
    }

	 public function toObject($request) {
		$query = DB::select("SELECT * FROM groupe WHERE id = :id",['id'=>$_GET['id']]);
		if(sizeof($query) == 0) {
			return ["Pas de groupe pour l'id : "=>$_GET['id']];
		} else {
			$result = $query[0];
			$etudiants = array_map( function($v){return $v->id_etu;} , DB::select("SELECT id_etu FROM choix_groupe WHERE id_groupe = :id_grp",['id_grp'=>$result->id]) );
			$classes = array_map( function($v){return $v->id_classe;} , DB::select("SELECT id_classe FROM regroupement WHERE id_groupe = :id_grp",['id_grp'=>$result->id]) );
			$result->etudiants = $etudiants;
			$result->classes = $classes;
			return $result;
		}
	 }
}
