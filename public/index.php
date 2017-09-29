<?php
header('content-type:text/html;charset=utf-8');
ini_set('date.timezone','Asia/Shanghai');

/**
 * @const APP_START_TIME The start time of the application, used for profiling
 */
define('APP_START_TIME', microtime(true));

/**
 * @const APP_START_MEMORY The memory usage at the start of the application, used for profiling
 */
define('APP_START_MEMORY', memory_get_usage());

define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');

/***************************** 简单的反爬虫策略 **************************************/
//获取UA信息
$ua = $_SERVER['HTTP_USER_AGENT'];

//将恶意USER_AGENT存入数组
$maliciousUa = array('FeedDemon','CrawlDaddy','Java','Feedly','UniversalFeedParser','ApacheBench','Swiftbot','ZmEu','Indy Library','oBot','jaunty','YandexBot','AhrefsBot','MJ12bot','WinHttp','EasouSpider','HttpClient','Microsoft URL Control','YYSpider','jaunty','Python-urllib','lightDeckReports Bot');
//禁止空USER_AGENT，dedecms等主流采集程序都是空USER_AGENT，部分sql注入工具也是空USER_AGENT
if (!$ua) {
    header("http/1.1 403 Forbidden");
    exit();
} else {
    if (strpos($ua, 'BOT/0.1 (BOT for JCE)') !== false) {//BOT/0.1 (BOT for JCE)用正则有问题，暂时先用strpos
        header("http/1.1 403 Forbidden");
        exit();
    }

    foreach($maliciousUa as $value) {
        //判断是否是数组中存在的UA
        if (preg_match('/'.$value.'/i', $ua)) {
            header("http/1.1 403 Forbidden");
            exit();
        }
    }
}
/***************************** 反爬虫策略 end **************************************/

try {
    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new \Phalcon\Di\FactoryDefault();

    /**
     * Include Autoloader
     */
    include APP_PATH . '/config/loader.php';

    /**
     * Read services
     */
    include APP_PATH . "/config/services.php";

    /**
     * Handle the request
     */
    $application = new \Phalcon\Mvc\Application($di);

    echo $application->handle()->getContent();
    
} catch (\Exception $e) {
    $log = array(
        'file' => $e->getFile(),
        'line' => $e->getLine(),
        'code' => $e->getCode(),
        'msg' => $e->getMessage(),
        'trace' => $e->getTraceAsString(),
    );

    $date = date('Ymd');
    $logger = new \Phalcon\Logger\Adapter\File(BASE_PATH . "/logs/{$date}_error.log");
    $logger->error(json_encode($log));

    exit('咦，竟然发生错误了!');
}