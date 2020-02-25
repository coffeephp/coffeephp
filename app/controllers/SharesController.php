<?php
namespace App\Controllers;

use App\Models\Shares;
use App\Models\Topics;
use App\Models\Users;
use Carbon\Carbon;
use Parsedown;
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
    public function indexAction($order = null)
    {
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        switch ($order) {
            case 'hot':
                $startDateTime = Carbon::parse('-1 months')->toDateTimeString();
                $builder = $this->modelsManager->createBuilder()
                    ->from("App\\Models\\Shares")
                    ->where('created_at >= :startDateTime:', ["startDateTime" => $startDateTime])
                    ->orderBy("clicks desc, id desc");
                break;
            default:
                $builder = $this->modelsManager->createBuilder()
                    ->from("App\\Models\\Shares")
                    ->orderBy("id desc");

        }

        $order = $order ? $order : 'new';

        $paginator = new PaginatorQueryBuilder(
            [
                "builder" => $builder,
                "limit"   => 40,
                "page"    => $currentPage,
            ]
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        if ($order == 'hot') {
            $path = '/shares/hot';
        } else {
            $path = '/shares';
        }
        $paginatorRender = $this->getPaginateRender($page->total_pages, $path);
        $page->paginatorRender = $paginatorRender;

        $sharesDomain = array();
        foreach ($page->items as $item) {
            $sharesDomain[$item->id] = parse_url($item->url, PHP_URL_HOST);
        }

        //热门分享
        $startDateTime = Carbon::parse('-1 months')->toDateTimeString();
        $hotShares = Shares::find([
            "conditions" => "created_at >= :startDateTime:",
            "order" => "clicks DESC, id DESC",
            "limit" => 10,
            "bind"  => [
                "startDateTime" => $startDateTime,
            ]
        ]);

        $title = '分享';

        $this->view->setVar("page", $page);
        $this->view->setVar("title", $title);
        $this->view->setVar("hotShares", $hotShares);
        $this->view->setVar("currentOrder", $order);
        $this->view->setVar("sharesDomain", $sharesDomain);
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
            $this->response->redirect('/login');
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
            $this->response->redirect('/login');
            return;
        }

        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use post!');
            $this->response->redirect("shares/create");
            return;
        }

        if (filter_var($this->request->getPost('url', 'string'), FILTER_VALIDATE_URL) === false) {
            $this->flashSession->error("分享的链接不符合标准，请核实！");
            $this->response->redirect("shares/create");
            return;
        }

        if (mb_strlen($this->request->getPost('url', 'string')) > 500) {
            $this->flashSession->error("分享的链接太长啦！");
            $this->response->redirect("shares/create");
            return;
        }


        if ($this->security->checkToken()) {
            $usersId = $auth['id'];

            $title = $this->request->getPost('title', 'string');
            $url = $this->request->getPost('url', 'string');

            $isHas = Shares::findFirst([
                'conditions' => 'title like :title: or url like :url:',
                'bind'     => [
                    'title' =>  $title . "%",
                    'url'   =>  $url . "%"
                ],
            ]);

            if ($isHas) {
                $this->flashSession->error("该分享已被分享！");
                $this->response->redirect("shares/create");
                return;
            }

            $shares = new Shares();
            $shares->users_id = $usersId;
            $shares->title = $title;
            $shares->url = $url;

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

            $bodyOriginal = "分享链接 [{$url}]({$url})";

            $parsedown = new Parsedown();
            $body = $parsedown->text($bodyOriginal);

            $topics = new Topics([
                'users_id'      => $usersId,
                'categories_id' => 2,//分类2为分享
                'title'         => $title,
                'body_original' => $bodyOriginal,
                'body'          => $body,
            ]);

            $topics->save();

            //更新用户的活跃时间
            $users = Users::findFirst($usersId);
            $users->last_actived_at = Carbon::now()->toDateTimeString();
            $users->save();

            $this->flashSession->success('创建成功!');
            $this->response->redirect("topics");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("shares/create");
            return;
        }
    }

    /**
     * 分享修改页
     * @param  int  $id
     * @author jsyzchenchen@gmail.com
     * @date 2018/07/26
     */
    public function editAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        $usersId = $auth['id'];

        $share = Shares::findFirst($id);

        if ($share->users_id != $usersId) {
            // Getting a response instance
            $response = new Response();
            // Setting a raw header
            $response->setRawHeader("HTTP/1.1 403 Forbidden");
            // Return the response
            return $response;
        }

        $this->view->setVar("title", '分享编辑');
        $this->view->setVar("share", $share);
    }

    /**
     * 分享更新
     * @param  int  $id
     * @author jsyzchenchen@gmail.com
     * @date 2018/07/26
     */
    public function updateAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use post!');
            $this->response->redirect("shares/" . $id . "/edit");
            return;
        }

        if (filter_var($this->request->getPost('url', 'string'), FILTER_VALIDATE_URL) === false) {
            $this->flashSession->error("分享的链接不符合标准，请核实！");
            $this->response->redirect("shares/" . $id . "/edit");
            return;
        }

        if (mb_strlen($this->request->getPost('url', 'string')) > 500) {
            $this->flashSession->error("分享的链接太长啦！");
            $this->response->redirect("shares/" . $id . "/edit");
            return;
        }

        $share = Shares::findFirst($id);

        if ($this->security->checkToken()) {
            $userId = $auth['id'];


            $share->title = $this->request->getPost('title', 'string');
            $share->url = $this->request->getPost('url', 'string');

            $res = $share->save();

            if ($res === false) {
                $messages = $share->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $this->flashSession->error("The topic was failed to save!");
                $this->response->redirect("shares/" . $id . "/edit");
                return;
            }

            //更新用户的活跃时间
            $user = Users::findFirst($userId);
            $user->last_actived_at = Carbon::now()->toDateTimeString();
            $user->save();

            $this->flashSession->success('修改成功!');
            $this->response->redirect("shares");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("shares/" . $id . "/edit");
            return;
        }
    }

    /**
     * 增加点击量
     * @author jsyzchenchen@gmail.com
     * @date 2017/5/7
     */
    public function addClicksAction()
    {
        $return = array();

        $sharesId = $this->request->getPost('sharesId', 'int');

        $shares = Shares::findFirst($sharesId);

        if ($shares) {
            $shares->clicks = $shares->clicks + 1;

            $res = $shares->save();

            if ($res === false) {
                $messages = $shares->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $return['msg'] = 'save fail!';
                $return['status'] = 400;
            } else {
                $return['msg'] = 'success!';
                $return['status'] = 200;
                $return['data']['clicks'] = $shares->clicks;
            }
        } else {
            $return['msg'] = 'this share does not exist!';
            $return['status'] = 400;
        }

        exit(json_encode($return));
    }
}