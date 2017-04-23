<?php
// Register The Composer Auto Loader
require BASE_PATH . '/vendor/autoload.php';

// Load environment
try {
    (new Dotenv\Dotenv(BASE_PATH))->load();
} catch (Dotenv\Exception\InvalidPathException $e) {
    // Skip
}