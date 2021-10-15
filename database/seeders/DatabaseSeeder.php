<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        // $this->call([
        //     ServiceCategorySeeder::class
        // ]);

        if(config('database.default') !== 'sqlite'){
            DB::statement('SET FOREIGN_KEY_CHECKS=0');
            }

        \App\Models\Service::factory(20)->create();

        if(config('database.default') != 'sqlite'){
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
          }
    }
}
