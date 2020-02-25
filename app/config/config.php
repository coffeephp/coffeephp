<?php
/*
 * Modified: preppend directory path of current file, because of this file own different ENV under between Apache and command line.
 * NOTE: please remove this comment.
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?: realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/app');

return new \Phalcon\Config([
    'database' => [
        'adapter'     => 'Mysql',
        'host'     => env('DB_HOST', '127.0.0.1'),
        'port'     => env('DB_PORT', 3306),
        'dbname'   => env('DB_DATABASE', 'coffeephp'),
        'username' => env('DB_USERNAME', 'mysql'),
        'password' => env('DB_PASSWORD', 'password'),
        'charset'  => env('DB_CHARSET', 'utf8mb4'),
    ],
    'application' => [
        'appDir'         => APP_PATH . '/',
        'controllersDir' => APP_PATH . '/controllers/',
        'modelsDir'      => APP_PATH . '/models/',
        'migrationsDir'  => APP_PATH . '/migrations/',
        'viewsDir'       => APP_PATH . '/views/',
        'pluginsDir'     => APP_PATH . '/plugins/',
        'libraryDir'     => APP_PATH . '/library/',
        'cacheDir'       => BASE_PATH . '/cache/',
        'staticBaseUri'  => env('APP_STATIC_URL'),
        'baseUri'        => env('APP_BASE_URI'),
        'debug'          => env('APP_DEBUG', false),
    ],
    'socialite' => [
        'github' => [
            'client_id' => env('GITHUB_CLIENT_ID'),
            'client_secret' => env('GITHUB_CLIENT_SECRET'),
            'redirect' => env('GITHUB_REDIRECT_URI'),
        ]
    ]
]);
