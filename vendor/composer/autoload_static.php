<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit535f0063f6bd1b914d9efabebe6162d2
{
    public static $files = array (
        '0e6d7bf4a5811bfa5cf40c5ccd6fae6a' => __DIR__ . '/..' . '/symfony/polyfill-mbstring/bootstrap.php',
        'c964ee0ededf28c96ebd9db5099ef910' => __DIR__ . '/..' . '/guzzlehttp/promises/src/functions_include.php',
        'a0edc8309cc5e1d60e3047b5df6b7052' => __DIR__ . '/..' . '/guzzlehttp/psr7/src/functions_include.php',
        '37a3dc5111fe8f707ab4c132ef1dbc62' => __DIR__ . '/..' . '/guzzlehttp/guzzle/src/functions_include.php',
        'ea45cb24dcd98a7af4e3faa91ad94286' => __DIR__ . '/../..' . '/bootstrap/helpers.php',
    );

    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'Symfony\\Polyfill\\Mbstring\\' => 26,
            'Symfony\\Component\\Translation\\' => 30,
            'Symfony\\Component\\HttpFoundation\\' => 33,
        ),
        'P' => 
        array (
            'Psr\\Log\\' => 8,
            'Psr\\Http\\Message\\' => 17,
        ),
        'O' => 
        array (
            'Overtrue\\Socialite\\' => 19,
        ),
        'G' => 
        array (
            'GuzzleHttp\\Psr7\\' => 16,
            'GuzzleHttp\\Promise\\' => 19,
            'GuzzleHttp\\' => 11,
        ),
        'D' => 
        array (
            'Dotenv\\' => 7,
        ),
        'C' => 
        array (
            'Carbon\\' => 7,
        ),
        'A' => 
        array (
            'App\\Models\\' => 11,
            'App\\Controllers\\' => 16,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Symfony\\Polyfill\\Mbstring\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-mbstring',
        ),
        'Symfony\\Component\\Translation\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/translation',
        ),
        'Symfony\\Component\\HttpFoundation\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/http-foundation',
        ),
        'Psr\\Log\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/log/Psr/Log',
        ),
        'Psr\\Http\\Message\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/http-message/src',
        ),
        'Overtrue\\Socialite\\' => 
        array (
            0 => __DIR__ . '/..' . '/overtrue/socialite/src',
        ),
        'GuzzleHttp\\Psr7\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/psr7/src',
        ),
        'GuzzleHttp\\Promise\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/promises/src',
        ),
        'GuzzleHttp\\' => 
        array (
            0 => __DIR__ . '/..' . '/guzzlehttp/guzzle/src',
        ),
        'Dotenv\\' => 
        array (
            0 => __DIR__ . '/..' . '/vlucas/phpdotenv/src',
        ),
        'Carbon\\' => 
        array (
            0 => __DIR__ . '/..' . '/nesbot/carbon/src/Carbon',
        ),
        'App\\Models\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app/models',
        ),
        'App\\Controllers\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app/controllers',
        ),
    );

    public static $prefixesPsr0 = array (
        'P' => 
        array (
            'Parsedown' => 
            array (
                0 => __DIR__ . '/..' . '/erusev/parsedown',
            ),
        ),
        'F' => 
        array (
            'Fabfuel\\Prophiler\\' => 
            array (
                0 => __DIR__ . '/..' . '/fabfuel/prophiler/src',
            ),
        ),
    );

    public static $classMap = array (
        'Fabfuel\\Prophiler\\Adapter\\AdapterAbstractTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Adapter/AdapterAbstractTest.php',
        'Fabfuel\\Prophiler\\Adapter\\Doctrine\\SQLLoggerTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Adapter/Doctrine/SQLLoggerTest.php',
        'Fabfuel\\Prophiler\\Adapter\\Fabfuel\\MongoTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Adapter/Fabfuel/MongoTest.php',
        'Fabfuel\\Prophiler\\Adapter\\Interop\\Container\\ContainerTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Adapter/Interop/Container/ContainerTest.php',
        'Fabfuel\\Prophiler\\Adapter\\Psr\\Log\\LoggerTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Adapter/Psr/Log/LoggerTest.php',
        'Fabfuel\\Prophiler\\Aggregator\\AbstractAggregatorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Aggregator/AbstractAggregatorTest.php',
        'Fabfuel\\Prophiler\\Aggregator\\AggregationTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Aggregator/AggregationTest.php',
        'Fabfuel\\Prophiler\\Aggregator\\Cache\\CacheAggregatorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Aggregator/Cache/CacheAggregatorTest.php',
        'Fabfuel\\Prophiler\\Aggregator\\Database\\QueryAggregatorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Aggregator/Database/QueryAggregatorTest.php',
        'Fabfuel\\Prophiler\\Aggregator\\TestableAbstractAggregator' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Aggregator/AbstractAggregatorTest.php',
        'Fabfuel\\Prophiler\\BenchmarkTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Benchmark/BenchmarkTest.php',
        'Fabfuel\\Prophiler\\Benchmark\\BenchmarkFactoryTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Benchmark/BenchmarkFactoryTest.php',
        'Fabfuel\\Prophiler\\DataCollector\\GenericTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/DataCollector/GenericTest.php',
        'Fabfuel\\Prophiler\\DataCollector\\RequestTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/DataCollector/RequestTest.php',
        'Fabfuel\\Prophiler\\Decorator\\Elasticsearch\\ClientDecoratorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Decorator/Elasticsearch/ClientDecoratorTest.php',
        'Fabfuel\\Prophiler\\Decorator\\Foobar' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Decorator/GeneralDecoratorTest.php',
        'Fabfuel\\Prophiler\\Decorator\\GeneralDecoratorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Decorator/GeneralDecoratorTest.php',
        'Fabfuel\\Prophiler\\Decorator\\PDO\\PDOStatementTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Decorator/PDO/PDOStatementTest.php',
        'Fabfuel\\Prophiler\\Decorator\\PDO\\PDOTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Decorator/PDO/PDOTest.php',
        'Fabfuel\\Prophiler\\Decorator\\Phalcon\\Cache\\BackendDecoratorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Decorator/Phalcon/Cache/BackendDecoratorTest.php',
        'Fabfuel\\Prophiler\\Iterator\\ComponentFilteredIteratorTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Iterator/ComponentFilteredIteratorTest.php',
        'Fabfuel\\Prophiler\\Mock\\PDO' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Mock/PDO.php',
        'Fabfuel\\Prophiler\\Plugin\\Manager\\PhalconTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Plugin/Manager/PhalconTest.php',
        'Fabfuel\\Prophiler\\Plugin\\Phalcon\\Db\\AdapterPluginTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Plugin/Phalcon/Db/AdapterPluginTest.php',
        'Fabfuel\\Prophiler\\Plugin\\Phalcon\\Mvc\\DispatcherPluginTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Plugin/Phalcon/Mvc/DispatcherPluginTest.php',
        'Fabfuel\\Prophiler\\Plugin\\Phalcon\\Mvc\\ViewPluginTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Plugin/Phalcon/Mvc/ViewPluginTest.php',
        'Fabfuel\\Prophiler\\Plugin\\Phalcon\\PhalconPluginTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Plugin/Phalcon/PhalconPluginTest.php',
        'Fabfuel\\Prophiler\\ProfilerTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/ProfilerTest.php',
        'Fabfuel\\Prophiler\\ToolbarTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/ToolbarTest.php',
        'Fabfuel\\Prophiler\\Toolbar\\Formatter\\BenchmarkFormatterTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Toolbar/Formatter/BenchmarkFormatterTest.php',
        'Fabfuel\\Prophiler\\Toolbar\\Formatter\\LogFormatterTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Toolbar/Formatter/LogFormatterTest.php',
        'Fabfuel\\Prophiler\\Toolbar\\Formatter\\TimelineFormatterTest' => __DIR__ . '/..' . '/fabfuel/prophiler/tests/Fabfuel/Prophiler/Toolbar/Formatter/TimelineFormatterTest.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit535f0063f6bd1b914d9efabebe6162d2::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit535f0063f6bd1b914d9efabebe6162d2::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit535f0063f6bd1b914d9efabebe6162d2::$prefixesPsr0;
            $loader->classMap = ComposerStaticInit535f0063f6bd1b914d9efabebe6162d2::$classMap;

        }, null, ClassLoader::class);
    }
}
