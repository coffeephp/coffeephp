<?php
namespace App\Controllers;

use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
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

        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        if (empty($query)) {
            $query = 'PHP';
        }


        $builder = $this->modelsManager->createBuilder()
            ->from("App\\Models\\Shares")
            ->where('title like :query:', ['query' => '%' . $query . '%'])
            ->orderBy("clicks desc, id desc");

        $paginator = new PaginatorQueryBuilder(
            [
                "builder" => $builder,
                "limit"   => 20,
                "page"    => $currentPage,
            ]
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $path = '/search?q=' . $query;
        $paginatorRender = $this->getPaginateRender($page->total_pages, $path);
        $page->paginatorRender = $paginatorRender;

        $this->view->setVar('query', $query);
        $this->view->setVar('page', $page);
    }
}