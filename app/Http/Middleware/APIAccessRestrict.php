<?php 

namespace App\Http\Middleware;

use App\Models\TOKEN;

use Closure;

class APIAccessRestrict {

   public function handle($request, Closure $next)
   {
		if( isset($_POST['token']) || isset($_GET['token']) ) {
			if( isset($_GET['token']) ) {
				$token = $_GET['token'];
			} else {
				$token = $_POST['token'];
			}
			if(TOKEN::is_token_api($token)) {
				return $next($request);
			}
		}

		return response(view('errors.pattern',['err' => '403 - Access denied (you must provide a valid token)']),403);
   }
}