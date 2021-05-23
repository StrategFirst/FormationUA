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
    public function __construct()
    {
        $this->step = [ 
            'current' => 0,
            'total' => 3,
            'name' => 'Starting'
        ];
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $this->step['current'] = 1;
        $this->step['name'] = 'Fetch data from database';
        CONVERSION::toCSV();

        $this->step['current'] = 2;
        $this->step['name'] = 'Running repartition algorithm';
        exec('cd repartition;./run', $shell_output, $shell_error);

        if($shell_error == 0) {
            $this->step['current'] = 3;
            $this->step['name'] = 'Fetching back result to database';
            CONVERSION::fromCSV();
        } else {
            $this->step['current'] = null;
            $this->step['name'] = 'An error occured during the algorithm';
        }
    }
}
