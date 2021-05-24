<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class TOKEN extends Model
{
    use HasFactory;
	 
    public static function get_permission_level_token(string $token) {
		$query = DB::select('SELECT access_level FROM token WHERE token.token = :tk',['tk'=>$token]);
		if(sizeof($query) > 0) {
			return $query[0]->access_level;
		}
		return -1;
    }

	 public static function is_token_api(string $token) {
		return TOKEN::get_permission_level_token($token) > 0;
	 }

	 public static function is_token_admin(string $token) {
		return TOKEN::get_permission_level_token($token) >= 3;
	 }

}
