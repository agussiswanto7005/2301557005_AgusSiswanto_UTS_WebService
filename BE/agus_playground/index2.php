<?php
require 'vendor/autoload.php';

use Tqdev\PhpCrudApi\Config\Config;
use Tqdev\PhpCrudApi\Api;
use Tqdev\PhpCrudApi\RequestFactory;
use Tqdev\PhpCrudApi\ResponseUtils;

// === Konfigurasi koneksi database ===
$config = new Config([
    'address' => 'sql305.infinityfree.com',
    'username' => 'if0_40236604',
    'password' => 'Digaz056900',
    'database' => 'if0_40236604_agus_playground',
    'debug' => true,
    'basePath' => '/agus_playground'
]);

// Jalankan API
$api = new Api($config);
$response = $api->handle(RequestFactory::fromGlobals());
ResponseUtils::output($response);
