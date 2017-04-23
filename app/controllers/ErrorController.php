<?php
namespace App\Controllers;

/**
 * Error Controller
 *
 * @package Phosphorum\Controllers
 */
class ErrorController extends ControllerBase
{

    public function route404Action()
    {
        exit('Unfortunately, the page you are requesting can not be found!');
    }
}