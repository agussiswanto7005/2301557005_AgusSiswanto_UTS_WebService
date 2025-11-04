<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// === Tambahkan fallback untuk fungsi getallheaders() ===
if (!function_exists('getallheaders')) {
    function getallheaders()
    {
        $headers = [];
        foreach ($_SERVER as $name => $value) {
            if (substr($name, 0, 5) == 'HTTP_') {
                $headers[str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($name, 5)))))] = $value;
            }
        }
        return $headers;
    }
}

// === Autoload dari Composer ===
require_once __DIR__ . '/vendor/autoload.php';

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

// === Jalankan API ===
$api = new Api($config);

// Buat request PSR-7 dari environment PHP
$request = RequestFactory::fromGlobals();

// Tangani request & kirim response
$response = $api->handle($request);
ResponseUtils::output($response);
