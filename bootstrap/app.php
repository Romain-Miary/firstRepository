<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        //
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
    class check_role // Remplacez par le nom de votre classe
{
    protected $routeMiddleware = [
        'role'=> \App\Http\Middleware\CheckRole::class,
    ];

    public function createRoutes() 
    {
        return Route::group([
            'web' => __DIR__.'/../routes/web.php',
            'api' => __DIR__.'/../routes/api.php',
            'commands' => __DIR__.'/../routes/console.php',
            'health' => '/up',
        ])
        ->withMiddleware(function (Middleware $middleware) {
            //
        })
        ->withExceptions(function (Exceptions $exceptions) {
            //
        })->create();
    }
}
