<?php
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

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

                $res = $topics->create();

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
        $topicsViews->create();

        //取出当前话题数据
        $topic = Topics::findFirst($id);

        //浏览量+1
        $topic->number_views = $topic->number_views + 1;
        $topic->update();

        //获取该话题的所有回复数据
        $replies = $topic->getReplies(["order" => "id DESC"]);

        //当前作者的其他话题
        $userTopics = Topics::find([
            'users_id' => $topic->users_id,
            'conditions' => 'id != :topics_id:',
            'order'    => "id DESC",
            'limit'    => 3,
            'bind'     => ['topics_id' => $topic->id],
        ]);

        //分类下其他话题
        $categoryTopics = Topics::find([
            'categories_id' => $topic->categories_id,
            'conditions' => 'id != :topics_id:',
            'order'    => "id DESC",
            'limit'    => 3,
            'bind'     => ['topics_id' => $topic->id],
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
        if ($searchKey = array_search($topic->id, $randomTopicsId)) {
            unset($randomTopicsId[$searchKey]);
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
                $data['filename'] = 'http://www.coffeephp.com/files/' . $filename;
            }
        } else {
            $data['error'] = 'Error while uploading file';
        }

        echo json_encode($data);
        die;
    }
}

