<?php
namespace App\Controllers;

use App\Models\Shares;
use App\Models\Users;
use Carbon\Carbon;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
/**
 * 分享控制器
 * @package App\Controllers
 * @author jsyzchenchen@gmail.com
 * @date 2017/5/7
 */
class SharesController extends ControllerBase
{
    /**
     * 分享列表页
     * @author jsyzchenchen@gmail.com
     * @date 2017/5/7
     */
    public function indexAction()
    {
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        $builder = $this->modelsManager->createBuilder()
            ->from("App\\Models\\Shares")
            ->orderBy("id desc");

        $paginator = new PaginatorQueryBuilder(
            [
                "builder" => $builder,
                "limit"   => 20,
                "page"    => $currentPage,
            ]
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $paginatorRender = $this->getPaginateRender($page->total_pages, '/shares');
        $page->paginatorRender = $paginatorRender;

        $title = '分享列表 ' . '第' . $currentPage . '页';

        $this->view->setVar("title", $title);
        $this->view->setVar("page", $page);
    }

    /**
     * 创建分享
     * @author jsyzchenchen@gmail.com
     * @date 2017/5/7
     */
    public function createAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        $this->view->setVar("title", '推荐分享');
    }

    /**
     * 分享保存
     * @author jsyzchenchen@gmail.com
     * @date 2017/5/7
     */
    public function storeAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use post!');
            $this->response->redirect("blogs/create");
            return;
        }


        if ($this->security->checkToken()) {
            $usersId = $auth['id'];

            $shares = new Shares();
            $shares->users_id = $usersId;
            $shares->title = $this->request->getPost('title', 'string');
            $shares->url = $this->request->getPost('url', 'string');

            $res = $shares->save();

            if ($res === false) {
                $messages = $shares->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $this->flashSession->error("The share was failed to save!");
                $this->response->redirect("shares/create");
                return;
            }

            //更新用户的活跃时间
            $users = Users::findFirst($usersId);
            $users->last_actived_at = Carbon::now()->toDateTimeString();
            $users->save();

            $this->flashSession->success('创建成功!');
            $this->response->redirect("shares");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("shares/create");
            return;
        }
    }
}