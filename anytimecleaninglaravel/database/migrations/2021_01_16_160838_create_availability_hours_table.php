<?php
/*
 * File name: 2021_01_16_160838_create_availability_hours_table.php
 * Last modified: 2021.04.20 at 11:19:32
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAvailabilityHoursTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('availability_hours', function (Blueprint $table) {
            $table->increments('id');
            $table->string('day', 16)->default('monday');
            $table->string('start_at', 16)->nullable();
            $table->string('end_at', 16)->nullable();
            $table->longText('data')->nullable();
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('availability_hours');
    }
}
