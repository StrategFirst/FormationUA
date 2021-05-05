<?php 

namespace App\Http\Middleware;

use Closure;

class HeaderProtect {

   public function handle($request, Closure $next)
   {
		// Pour remplacer des informations permettants d'obtenir les versions des app coté serveur, et d'éssayez des bugs connu dessus
		header('X-Powered-By: Universite d\'Angers : LERIA ');
		// Pour empécher le site d'être charger dans une iframe
		header('X-Frame-Options: DENY');
		header('Content-Security-Policy: frame-ancestors \'none\' ');
		// Pour se défendre contre certaine forme de cross-site scripting
		header(`Content-Security-Policy:default-src 'self';base-uri 'self';block-all-mixed-content;font-src 'self' https: data:;frame-ancestors 'self';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr 'none';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests`);
		// Dire au navigateur de trust le MIME type donnée et de ne pas chercher eux même a le déterminé s'il ne le trouve pas correct
		header(`X-Content-Type-Options: nosniff`);
      return $next($request);
   }
}