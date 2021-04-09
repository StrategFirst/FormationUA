<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class ControllerOption extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    

	public function render() { return view('option'); }
}
