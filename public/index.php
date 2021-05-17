<?php

use App\Kernel;
use Symfony\Component\Dotenv\Dotenv;
use Symfony\Component\ErrorHandler\Debug;
use Symfony\Component\HttpFoundation\Request;

require dirname(__DIR__).'/vendor/autoload.php';

(new Dotenv())->bootEnv(dirname(__DIR__).'/.env');

if ($_SERVER['APP_DEBUG']) {
    umask(0000);

    Debug::enable();
}

$kernel = new Kernel($_SERVER['APP_ENV'], (bool) $_SERVER['APP_DEBUG']);
$request = Request::createFromGlobals();
Request::setTrustedProxies(
// trust all requests
    array('127.0.0.1', $request->server->get('REMOTE_ADDR')),

    // if you're using ELB, otherwise use a constant from above
    Request::HEADER_X_FORWARDED_AWS_ELB
);
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
