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
        return DB::select("SELECT * FROM matiere WHERE mat.id_ue = :id_ue",['id_ue'=>$ue_id]);
    }

}
