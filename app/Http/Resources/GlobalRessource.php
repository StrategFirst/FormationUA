<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

use Illuminate\Support\Facades\DB;

class GlobalRessource extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */

    public function toArray($request)
    {
		return DB::select( '
		 SELECT * FROM
		 (SELECT count(id) AS "Nombre de formations" FROM formation) AS a
		 JOIN
		 (SELECT count(id) AS "Nombre d\'étudiants" FROM etudiant) AS b
		 JOIN
		 (SELECT count(id) AS "Nombre de groupes" FROM groupe) AS c
		 JOIN
		 (SELECT count(id) AS "Nombre de classes" FROM classe) AS d
		 JOIN
		 (SELECT count(id) AS "Nombre de matières" FROM sous_matiere) AS e; ')[0];
    }
	}