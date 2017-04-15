<?php
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use Phalcon\Http\Response;

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
    public function indexAction()
    {
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        $builder = $this->modelsManager->createBuilder()
            ->from("Topics")
            ->orderBy("id DESC");

        $paginator = new PaginatorQueryBuilder(
            [
                "builder" => $builder,
                "limit"   => 20,
                "page"    => $currentPage,
            ]
        );

        // Get the paginated results
        $page = $paginator->getPaginate();
        $paginatorRender = $this->getPaginateRender($page->total_pages, '/topics');
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
            "order" => "number_replies DESC",
            "limit" => 5
        ]);

        $this->view->setVar("page", $page);
        $this->view->setVar("activeUsers", $activeUsers);
        $this->view->setVar("hotTopics", $hotTopics);
    }

    /**
     * 创建话题
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/7
     */
    public function createAction()
    {
        //获取所有分类
        $categories = Categories::find();

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

        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $usersId = $auth['id'];

                $parsedown = new Parsedown();
                $body = $parsedown->text($this->request->getPost('body'));

                $topics = new Topics([
                    'users_id'      => $usersId,
                    'categories_id' => $this->request->getPost('category_id'),
                    'title'         => $this->request->getPost('title'),
                    'body_original' => $this->request->getPost('body'),
                    'body'          => $body,
                ]);

                $res = $topics->save();

                if ($res === false) {
                    $messages = $topics->getMessages();

                    foreach ($messages as $message) {
                        echo $message, "\n";
                    }

                    exit();
                }


                $this->response->redirect("topics/{$topics->id}");
                return;
            } else {
                $this->flashSession->error("The topic was failed to save!");
            }
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
        //话题浏览量+1
        $topicsViews = new TopicsViews();
        $topicsViews->topics_id = $id;
        $topicsViews->ip_address = get_client_ip();
        $topicsViews->user_agent = $_SERVER['HTTP_USER_AGENT'];
        if($auth = $this->session->get('auth')) {
            $topicsViews->users_id = $auth['id'];
        }
        $topicsViews->create();

        //取出当前话题数据
        $topic = Topics::findFirst($id);

        //浏览量+1
        $topic->number_views = $topic->number_views + 1;
        $topic->update();

        //获取该话题的所有回复数据
        $replies = $topic->getReplies();

        //获取当前话题下的赞
        $votes = $topic->getVotes([
            'status = :status:',
            'bind'     => [
                'status' => 1
            ]
        ]);
        $isVoted = 0;
        if ($auth) {
            $isVoted = $topic->getVotes([
                'status = :status: AND users_id = :users_id:',
                'bind'     => [
                    'status' => 1,
                    'users_id' => $auth['id']
                    ]
                ])->count() ? 1 :0;
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

        $this->view->setVar("topic", $topic);
        $this->view->setVar("replies", $replies);
        $this->view->setVar("votes", $votes);
        $this->view->setVar("isVoted", $isVoted);
        $this->view->setVar("userTopics", $userTopics);
        $this->view->setVar("categoryTopics", $categoryTopics);
        $this->view->setVar("randomExcellentTopics", $randomExcellentTopics);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     */
    public function editAction($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     * @param  int  $id
     *
     */
    public function updateAction($id)
    {
        //
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
                $filename = $file->getName();
                $file->moveTo(
                    "files/" . $filename
                );
                $data['filename'] = '/files/' . $filename;
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
        $auth = $this->session->get('auth');
        $users_id = $auth['id'];

        //取出当前话题数据
        $topic = Topics::findFirst($id);

        $votes = Votes::findFirst([
            "topics_id = :topics_id: AND users_id = :users_id:",
            "bind" => [
                'topics_id' => $id,
                'users_id' => $users_id
            ]
        ]);

        if ($votes) {
            if ($votes->status == 1) {
                $votes->status = 0;
                //点赞数-1
                $topic->votes_up = $topic->votes_up - 1;
            } elseif ($votes->status == 0) {
                $votes->status = 1;
                //点赞数+1
                $topic->votes_up = $topic->votes_up + 1;
            }
            $votes->save();
            $topic->update();
        } else {
            //更新投票表
            $votes = new Votes();
            $votes->topics_id = $id;
            $votes->users_id = $users_id;
            $votes->type = 1;
            $votes->save();

            //点赞数+1
            $topic->votes_up = $topic->votes_up + 1;
            $topic->update();
        }

        // Getting a response instance
        $response = new Response();
        // Setting a raw header
        $response->setRawHeader("HTTP/1.1 200 OK");
        // Return the response
        return $response;
    }
}

