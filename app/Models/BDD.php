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
}
