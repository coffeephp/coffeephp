<?php
header('content-type:text/html;charset=utf-8');
ini_set('date.timezone','Asia/Shanghai');

/***************************** 简单的反爬虫策略 **************************************/
//获取UA信息
$ua = $_SERVER['HTTP_USER_AGENT'];

//将恶意USER_AGENT存入数组
$malicious_ua = array('FeedDemon','CrawlDaddy','Java','Feedly','UniversalFeedParser','ApacheBench','Swiftbot','ZmEu','Indy Library','oBot','jaunty','YandexBot','AhrefsBot','MJ12bot','WinHttp','EasouSpider','HttpClient','Microsoft URL Control','YYSpider','jaunty','Python-urllib','lightDeckReports Bot');
//禁止空USER_AGENT，dedecms等主流采集程序都是空USER_AGENT，部分sql注入工具也是空USER_AGENT
if (!$ua) {
    header("http/1.1 403 Forbidden");
    exit();
} else {
    if (strpos($ua, 'BOT/0.1 (BOT for JCE)') !== false) {//BOT/0.1 (BOT for JCE)用正则有问题，暂时先用strpos
        header("http/1.1 403 Forbidden");
        exit();
    }

    foreach($malicious_ua as $value) {
        //判断是否是数组中存在的UA
        if (preg_match('/'.$value.'/i', $ua)) {
            header("http/1.1 403 Forbidden");
            exit();
        }
    }
}
/***************************** 反爬虫策略 end **************************************/

define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');
// 开启调试模式
define('APP_DEBUG', true);
if (APP_DEBUG) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
}

try {

    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new \Phalcon\Di\FactoryDefault();

    /**
     * Read services
     */
    include APP_PATH . "/config/services.php";

    /**
     * Get config service for use in inline setup below
     */
    $config = $di->getConfig();

    /**
     * Include Autoloader
     */
    include APP_PATH . '/config/loader.php';

    /**
     * Include Helpers
     */
    include APP_PATH . '/library/helpers.php';

    /**
     * Handle the request
     */
    $application = new \Phalcon\Mvc\Application($di);

    echo $application->handle()->getContent();

} catch (\Exception $e) {
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}