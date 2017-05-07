<?php
namespace App\Controllers;

/**
 * 搜索控制器
 * @package App\Controllers
 * @author jsyzchenchen@gmail.com
 * @date 2017/5/7
 */
class SearchController extends ControllerBase
{
    /**
     * 搜索
     * @author jsyzchenchen@gmail.com
     * @date 2017/5/7
     */
    public function indexAction()
    {
        $query = $this->request->getQuery('q');

        $this->response->redirect('https://www.bing.com/search?q=site:coffeephp.com ' . $query, true, 301);
        return;
    }
}