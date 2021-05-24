<?php 

namespace App\Http\Middleware;

use Closure;

use Illuminate\Support\Facades\DB;

class APIAccessRestrict {

   public function handle($request, Closure $next)
   {
		$k = 0;
		if( isset($_POST['token']) || isset($_GET['token']) ) {
			$k = 1;
			if( isset($_GET['token']) ) {
				$token = $_GET['token'];
			} else {
				$token = $_POST['token'];
			}
			$query = DB::select('SELECT access_level FROM token WHERE token.token = :tk',['tk'=>$token]);
			$k = 2;
			if(sizeof($query) > 0) {
				$k = 3;
				$perm = $query[0]->access_level;
				if($perm > 0) {
					$k = 5;
					return $next($request);
				}
			}
		}

		return response(view('errors.pattern',['err' => '403 - Access denied (you must provide a valid token)']),403);
   }
}