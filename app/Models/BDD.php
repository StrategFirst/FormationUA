<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class BDD extends Model
{
    use HasFactory;

    public static function get_formations() {
        return DB::select("SELECT * FROM formation ORDER BY nom;" , []);
    }

    public static function get_ue(int $formation_id) {
        return DB::select("SELECT * FROM ue WHERE id_formation = :id_form",['id_form'=>$formation_id]);
    }

    public static function get_matieres(int $ue_id) {
        return DB::select("SELECT * FROM matiere WHERE id_ue = :id_ue",['id_ue'=>$ue_id]);
    }

    public static function get_matieres_choix(int $formation_id) {
        $liste = DB::select("SELECT mat.*
        FROM matiere AS mat 
            JOIN ue
            ON mat.id_ue = ue.id
        WHERE ue.id_formation = :id_form
            AND mat.id_groupe_opt IS NOT NULL",['id_form'=>$formation_id]);
        $result = [];
        foreach($liste as $mat) {
            if( ! isset( $result[ $mat->id_groupe_opt ] )) {
                $result[ $mat->id_groupe_opt ] = [
                    "compte" => DB::select("SELECT * FROM groupe_options WHERE id = :id_mat",['id_mat'=>$mat->id_groupe_opt])[0]->compte,
                    "matieres" => []
                ];
            }
            $id_groupe_opt = $mat->id_groupe_opt;
            $mat = [ 'id' => $mat->id , 'nom' => $mat->descriptif , 'incompatible' => BDD::get_matieres_incompatible($mat->id) ];
            array_push( $result[ $id_groupe_opt ]['matieres'] , $mat );
        }
        return $result;
    }

    public static function get_matieres_incompatible(int $matiere_id) {
        $a = array_map( function($v){return $v->id_matiere_a;} , DB::select("SELECT id_matiere_a FROM incompatibilite WHERE id_matiere_b = :id_mat",['id_mat'=>$matiere_id]) );
        $b = array_map( function($v){return $v->id_matiere_b;} , DB::select("SELECT id_matiere_b FROM incompatibilite WHERE id_matiere_a = :id_mat",['id_mat'=>$matiere_id]) );
        return array_unique(array_merge($a,$b));
    }
}
