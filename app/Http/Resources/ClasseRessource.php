<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

use Illuminate\Support\Facades\DB;

class ClasseRessource extends ResourceCollection
{
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
			$query = DB::select("SELECT * FROM classe");
			return $query;
		 }
    }

	 public function toObject($request) {
		$query = DB::select("SELECT * FROM groupe WHERE id = :id",['id'=>$_GET['id']]);
		if(sizeof($query) == 0) {
			return ["Pas de classe pour l'id : "=>$_GET['id']];
		} else {
			$result = $query[0];
			$result->groupes = array_map( function($v){return $v->id_groupe;} , DB::select("SELECT id_groupe FROM regroupement WHERE id_classe = :id_classe",['id_classe'=>$result->id]) );
			$result->parties = DB::select(
                'SELECT sous_matiere.description AS "nom", partie.type AS "type"
                FROM sous_matiere 
                    JOIN partie ON sous_matiere.id = partie.id_sous_matiere
                    JOIN suivi ON partie.id = suivi.id_partie
                WHERE suivi.id_classe = :id_classe',['id_classe'=>$result->id]
            );
			return $result;
		}
	 }

}
