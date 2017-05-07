<?php
namespace App\Controllers;

use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use Phalcon\Http\Response;
use Carbon\Carbon;
use Parsedown;
use App\Models\Users;
use App\Models\Topics;
use App\Models\Categories;
use App\Models\TopicsViews;
use App\Models\TopicsVotes;

/**
 * 话题控制器
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/4
 */
class TopicsController extends ControllerBase
{
    /**
     * 话题列表页
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/4
     */
    public function indexAction($order = null)
    {
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        switch ($order) {
            case 'hot':
                $builder = $this->modelsManager->createBuilder()
                    ->from("App\\Models\\Topics")
                    ->orderBy("sticked DESC, number_replies DESC, votes_up DESC, number_views DESC, id DESC");
                break;
            default:
                $builder = $this->modelsManager->createBuilder()
                    ->from("App\\Models\\Topics")
                    ->orderBy("sticked DESC, id DESC");

        }

        $order = $order ? $order : 'new';

        $paginator = new PaginatorQueryBuilder(
            [
                "builder" => $builder,
                "limit"   => 20,
                "page"    => $currentPage,
            ]
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        if ($order == 'hot') {
            $path = '/topics/hot';
        } else {
            $path = '/topics';
        }
        $paginatorRender = $this->getPaginateRender($page->total_pages, $path);
        $page->paginatorRender = $paginatorRender;

        //获取活跃用户
        $activeUsers = Users::find(
            [
                "order" => "last_actived_at DESC",
                "limit" => 8
            ]
        );

        //获取热门话题
        $hotTopics = Topics::find([
            "order" => "number_replies DESC, votes_up DESC, number_views DESC, id DESC",
            "limit" => 10
        ]);

        $title = '话题列表';

        $this->view->setVar("title", $title);
        $this->view->setVar("page", $page);
        $this->view->setVar("activeUsers", $activeUsers);
        $this->view->setVar("hotTopics", $hotTopics);
        $this->view->setVar("currentOrder", $order);
    }

    /**
     * 创建话题
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/7
     */
    public function createAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        //获取所有分类
        $categories = Categories::find();

        $this->view->setVar("title", '话题创建');
        $this->view->setVar("categories", $categories);
    }

    /**
     * 存储话题
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/11
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
            $this->response->redirect("topics/create");
            return;
        }

        if ($this->security->checkToken()) {
            $usersId = $auth['id'];
            $bodyOriginal = $this->request->getPost('body_original');
            $bodyOriginal = str_replace('<!--more--> ', '', $bodyOriginal);

            $parsedown = new Parsedown();
            $body = $parsedown->text($bodyOriginal);

            $topics = new Topics([
                'users_id'      => $usersId,
                'categories_id' => $this->request->getPost('category_id', 'int'),
                'title'         => $this->request->getPost('title', 'string'),
                'body_original' => $bodyOriginal,
                'body'          => $body,
            ]);

            $res = $topics->save();

            if ($res === false) {
                $messages = $topics->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $this->flashSession->error("The topic was failed to save!");
                $this->response->redirect("topics/create");
                return;
            }

            //更新用户的活跃时间
            $users = Users::findFirst($usersId);
            $users->last_actived_at = Carbon::now()->toDateTimeString();
            $users->save();

            $this->flashSession->success('创建成功!');
            $this->response->redirect("topics/{$topics->id}");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("topics/create");
            return;
        }
    }

    /**
     * 话题详情页
     * @param $id
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/6
     */
    public function showAction($id)
    {
        $usersId = 0;
        if($auth = $this->session->get('auth')) {
            $usersId = $auth['id'];
        }

        //话题浏览量+1
        $topicsViews = new TopicsViews();
        $topicsViews->topics_id = $id;
        $topicsViews->ip_address = get_client_ip();
        $topicsViews->user_agent = $_SERVER['HTTP_USER_AGENT'];
        $topicsViews->users_id = $usersId;

        $topicsViews->create();

        //取出当前话题数据
        $topic = Topics::findFirst($id);

        //浏览量+1
        $topic->number_views = $topic->number_views + 1;
        $topic->update();

        //获取该话题的所有回复数据
        $replies = $topic->getReplies();

        //获取当前话题下的赞
        $topicsVotes = $topic->getTopicsVotes([
            'status = :status:',
            'bind'     => [
                'status' => 1
            ]
        ]);
        //当前用户是否已经赞过当前话题
        $isVoted = false;
        if ($usersId) {
            foreach ($topicsVotes as $topicsVote) {
                if ($topicsVote->users_id == $usersId) {
                    $isVoted = true;
                }
            }
        }

        //当前作者的其他话题
        $userTopics = Topics::find([
            'conditions' => 'users_id = :users_id: AND id != :topics_id:',
            'order'    => "id DESC",
            'limit'    => 3,
            'bind'     => [
                'users_id' => $topic->users_id,
                'topics_id' => $topic->id
            ],
        ]);

        //分类下其他话题
        $categoryTopics = Topics::find([
            'conditions' => 'categories_id = :categories_id: AND id != :topics_id:',
            'order'    => "id DESC",
            'limit'    => 3,
            'bind'     => [
                'categories_id' => $topic->categories_id,
                'topics_id' => $topic->id
            ]
        ]);

        //随机推荐话题
        $maxId = Topics::maximum(
            [
                "column" => "id",
            ]
        );
        $randArray = range(1, $maxId);
        shuffle($randArray); //调用现成的数组随机排列函数
        $randomTopicsId =  array_slice($randArray, 0, 6); //截取前$limit个
        //排除掉当前话题
        if ($searchKey = array_search($topic->id, $randomTopicsId) !== false) {
            if (count($randomTopicsId) > 1) {
                unset($randomTopicsId[$searchKey]);
            }
            $randomTopicsId = array_values($randomTopicsId);
        } else {
            array_pop($randomTopicsId);
        }

        $randomExcellentTopics = Topics::find(
            [
                'id IN ({randomTopicsId:array})',
                'bind' => [
                    'randomTopicsId' => $randomTopicsId
                ]
            ]
        );

        $this->view->setVar("title", $topic->title);
        $this->view->setVar("topic", $topic);
        $this->view->setVar("replies", $replies);
        $this->view->setVar("topicsVotes", $topicsVotes);
        $this->view->setVar("isVoted", $isVoted);
        $this->view->setVar("userTopics", $userTopics);
        $this->view->setVar("categoryTopics", $categoryTopics);
        $this->view->setVar("randomExcellentTopics", $randomExcellentTopics);
    }

    /**
     * 话题修改页
     * @param  int  $id
     * @author jsyzchenchen@gmail.com
     * @date 2017/04/20
     */
    public function editAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        $usersId = $auth['id'];

        //取出当前话题数据
        $topic = Topics::findFirst($id);

        if ($topic->users_id != $usersId) {//不是当前话题的作者
            // Getting a response instance
            $response = new Response();
            // Setting a raw header
            $response->setRawHeader("HTTP/1.1 403 Forbidden");
            // Return the response
            return $response;
        }

        $this->view->setVar("title", '话题编辑');
        $this->view->setVar("topic", $topic);
    }

    /**
     * 话题更新
     * @param  int  $id
     * @author jsyzchenchen@gmail.com
     * @date 2017/04/20
     */
    public function updateAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        //取出当前话题数据
        $topics = Topics::findFirst($id);

        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use put!');
            $this->response->redirect("topics/{$topics->id}/edit");
            return;
        }

        if ($this->security->checkToken()) {
            $usersId = $auth['id'];
            $bodyOriginal = $this->request->getPost('body_original');
            $bodyOriginal = str_replace('<!--more--> ', '', $bodyOriginal);

            $parsedown = new Parsedown();
            $body = $parsedown->text($bodyOriginal);

            $topics->title = $this->request->getPost('title', 'string');
            $topics->body_original = $bodyOriginal;
            $topics->body = $body;

            $res = $topics->save();

            if ($res === false) {
                $messages = $topics->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $this->flashSession->error("The topic was failed to save!");
                $this->response->redirect("topics/create");
                return;
            }

            //更新用户的活跃时间
            $users = Users::findFirst($usersId);
            $users->last_actived_at = Carbon::now()->toDateTimeString();
            $users->save();

            $this->flashSession->success('修改成功!');
            $this->response->redirect("topics/{$topics->id}");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("topics/{$topics->id}/edit");
            return;
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param  int  $id
     */
    public function destroyAction($id)
    {
        //
    }

    /**
     * 上传图片
     * @return array
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/30
     */
    public function uploadImageAction()
    {
        $data = array();

        if ($this->request->hasFiles()) {
            $files = $this->request->getUploadedFiles();

            foreach ($files as $file) {
                // Move the file into the application
                $path = "files/" . date('Ymd') . '/';
                if (!is_dir($path)) {
                    mkdir($path);
                }
                $savename = md5(microtime(true)) . '.' .pathinfo($file->getName(), PATHINFO_EXTENSION);
                $filename = $path . $savename;
                $file->moveTo($filename);

                $data['filename'] = '/' . $filename;
            }
        } else {
            $data['error'] = 'Error while uploading file';
        }

        echo json_encode($data);
        die;
    }

    /**
     * 话题投票控制器
     * @param $id
     * @return Response
     * @auhor jsyzchenchen@gmail.com
     * @date 2017/04/14
     */
    public function upvoteAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        $usersId = $auth['id'];

        //取出当前话题数据
        $topic = Topics::findFirst($id);

        $topicsVotes = TopicsVotes::findFirst([
            "topics_id = :topics_id: AND users_id = :users_id:",
            "bind" => [
                'topics_id' => $id,
                'users_id' => $usersId
            ]
        ]);

        if ($topicsVotes) {
            if ($topicsVotes->status == 1) {
                $topicsVotes->status = 0;
                //点赞数-1
                $topicsVotes->votes_up = $topic->votes_up - 1;
            } elseif ($topicsVotes->status == 0) {
                $topicsVotes->status = 1;
                //点赞数+1
                $topic->votes_up = $topic->votes_up + 1;
            }
            $topicsVotes->save();
            $topic->update();
        } else {
            //更新投票表
            $topicsVotes = new TopicsVotes();
            $topicsVotes->topics_id = $id;
            $topicsVotes->users_id = $usersId;
            $topicsVotes->type = 1;
            $topicsVotes->save();

            //点赞数+1
            $topic->votes_up = $topic->votes_up + 1;
            $topic->update();
        }

        //更新用户的活跃时间
        $users = Users::findFirst($usersId);
        $users->last_actived_at = Carbon::now()->toDateTimeString();
        $users->save();

        // Getting a response instance
        $response = new Response();
        // Setting a raw header
        $response->setRawHeader("HTTP/1.1 200 OK");
        // Return the response
        return $response;
    }
}

