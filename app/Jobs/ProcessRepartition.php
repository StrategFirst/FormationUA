<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

use App\Models\CONVERSION;

class ProcessRepartition implements ShouldQueue, ShouldBeUnique
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($typeRepartition)
    {
        switch($typeRepartition) {
            case 'equilibre': $this->optProg = ' --repartition:balanced'; break;
            case 'bourrage': $this->optProg = ' --repartition:unbalanced'; break;
            default:  $this->optProg = ''; break;
        }
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        echo date("[ Y-m-d H:i:s ]").' - '."Répartition 0/3 : Base de donnée -> CSV \n";

        CONVERSION::toCSV();

        echo date("[ Y-m-d H:i:s ]").' - '."Répartition 1/3 : CSV -> répartition -> CSV \n";

        exec('cd repartition;./run'.$this->optProg, $shell_output, $shell_error);
        
        echo date("[ Y-m-d H:i:s ]").' - '."Répartition 2/3 : CSV -> Base de donnée \n";

        if($shell_error != 0) {
            return $this->fail(new ErrorException("{$shell_error} : {$shell_output} "));
        }

        CONVERSION::fromCSV();
        
        echo date("[ Y-m-d H:i:s ]").' - '."Répartition 3/3 : Términé avec succès ! \n";
    }
}
