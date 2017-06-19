<?php
namespace App\Controllers;

use App\Models\Blogs;
use App\Models\Articles;
use App\Models\ArticlesVotes;
use Phalcon\Http\Response;
use Carbon\Carbon;
use Parsedown;
use App\Models\Users;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * 文章控制器
 * @package App\Controllers
 * @author jsyzchenchen@gmail.com
 */
class ArticlesController extends ControllerBase
{
    /**
     * 文章列表页
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/03
     */
    public function indexAction($order = null)
    {
        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        switch ($order) {
            case 'hot':
                $builder = $this->modelsManager->createBuilder()
                    ->from("App\\Models\\Articles")
                    ->orderBy("number_replies DESC, votes_up DESC, number_views DESC, id DESC");
                break;
            default:
                $builder = $this->modelsManager->createBuilder()
                    ->from("App\\Models\\Articles")
                    ->orderBy("id DESC");
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
            $path = '/articles/hot';
        } else {
            $path = '/articles';
        }
        $paginatorRender = $this->getPaginateRender($page->total_pages, $path);
        $page->paginatorRender = $paginatorRender;

        $title = '专栏 文章';

        $this->view->setVar("title", $title);
        $this->view->setVar("page", $page);
        $this->view->setVar("currentOrder", $order);
    }

    /**
     * 文章创建页
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/03
     */
    public function createAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        $usersId = $auth['id'];
        //查看是否有专栏
        $blog = Blogs::findFirst([
            'conditions' => 'users_id = :users_id:',
            'bind'     => [
                'users_id' => $usersId,
            ],
        ]);
        if (!$blog) {
            $this->flashSession->warning('你得先创建你的专栏！');
            $this->response->redirect('/blogs/create');
            return;
        }
    }

    /**
     * 文章保存
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/14
     */
    public function storeAction()
    {
        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use post!');
            $this->response->redirect("articles/create");
            return;
        }

        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        if ($this->security->checkToken()) {
            $usersId = $auth['id'];

            $blog = Blogs::findFirst([
                'conditions' => 'users_id = :users_id:',
                'bind'     => [
                    'users_id' => $usersId,
                ],
            ]);

            $articles = new Articles();
            $articles->users_id = $usersId;
            $articles->blogs_id = $blog->id;
            $articles->title = $this->request->getPost('title', 'string');
            $bodyOriginal = $this->request->getPost('body_original');
            $bodyOriginal = str_replace('<!--more--> ', '', $bodyOriginal);
            $articles->body_original = $bodyOriginal;

            $parsedown = new Parsedown();
            $body = $parsedown->text($bodyOriginal);
            $articles->body = $body;

            $res = $articles->save();

            if ($res === false) {
                $messages = $articles->getMessages();

                foreach ($messages as $message) {
                    echo $message, "\n";
                }

                $this->flashSession->error("The articles was failed to save!");
                $this->response->redirect("articles/create");
                return;
            }

            $this->flashSession->success('创建成功!');
            $this->response->redirect("articles/{$articles->id}");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("articles/create");
            return;
        }
    }

    /**
     * 文章编辑页
     * @param $id
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/14
     */
    public function editAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        $usersId = $auth['id'];
        //查看是否有专栏
        $blog = Blogs::findFirst([
            'conditions' => 'users_id = :users_id:',
            'bind'     => [
                'users_id' => $usersId,
            ],
        ]);
        if (!$blog) {
            $this->flashSession->warning('你得先创建你的专栏！');
            $this->response->redirect('/blogs/create');
            return;
        }

        $article = Articles::findFirst($id);

        if ($article->users_id !== $usersId) {//不是当前话题的作者
            // Getting a response instance
            $response = new Response();
            // Setting a raw header
            $response->setRawHeader("HTTP/1.1 403 Forbidden");
            // Return the response
            return $response;
        }

        $this->view->setVar("article", $article);
    }

    /**
     * 更新文章
     * @param $id
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/15
     */
    public function updateAction($id)
    {
        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use put!');
            $this->response->redirect("articles/{$id}/edit");
            return;
        }

        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        //取出当前话题数据
        $articles = Articles::findFirst($id);

        if ($this->security->checkToken()) {
            $usersId = $auth['id'];

            $articles->title = $this->request->getPost('title', 'string');
            $bodyOriginal = $this->request->getPost('body_original');
            $bodyOriginal = str_replace('<!--more--> ', '', $bodyOriginal);
            $articles->body_original = $bodyOriginal;

            $parsedown = new Parsedown();
            $body = $parsedown->text($bodyOriginal);
            $articles->body = $body;

            $res = $articles->save();

            if ($res === false) {
                $messages = $articles->getMessages();

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
            $this->response->redirect("articles/{$articles->id}");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("articles/{$articles->id}/edit");
            return;
        }
    }

    /**
     * 文章展示页
     * @param $id
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/15
     */
    public function showAction($id)
    {
        $article = Articles::findFirst($id);

        //获取该话题的所有回复数据
        $replies = $article->getReplies();

        //查看文章作者的专栏
        $blog = Blogs::findFirst([
            'conditions' => 'users_id = :users_id:',
            'bind'     => [
                'users_id' => $article->users_id,
            ],
        ]);

        if (!$this->request->isAjax()) {//pjax不统计
            $article->number_views = $article->number_views + 1;
            $article->save();
        }

        $articleVotes = ArticlesVotes::find([
            'conditions' => 'articles_id = :articles_id: AND status = 1',
            'bind'     => [
                'articles_id' => $article->id,
            ]
        ]);
        //当前用户是否已经赞过当前话题
        $isVoted = false;
        if($auth = $this->session->get('auth')) {
            $usersId = $auth['id'];

            foreach ($articleVotes as $articleVote) {
                if ($articleVote->users_id == $usersId) {
                    $isVoted = true;
                }
            }
        }

        $this->view->setVar("title", $article->title);
        $this->view->setVar("article", $article);
        $this->view->setVar("blog", $blog);
        $this->view->setVar("replies", $replies);
        $this->view->setVar("articleVotes", $articleVotes);
        $this->view->setVar("isVoted", $isVoted);
    }

    /**
     * 文章投票
     * @param $id
     * @return Response
     * @auhor jsyzchenchen@gmail.com
     * @date 2017/06/19
     */
    public function upvoteAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        $usersId = $auth['id'];

        //取出当前话题数据
        $article = Articles::findFirst($id);

        $articleVote = ArticlesVotes::findFirst([
            "articles_id = :articles_id: AND users_id = :users_id:",
            "bind" => [
                'articles_id' => $id,
                'users_id' => $usersId
            ]
        ]);

        if ($articleVote) {
            if ($articleVote->status == 1) {
                $articleVote->status = 0;
                //点赞数-1
                $article->votes_up = $article->votes_up - 1;
            } elseif ($articleVote->status == 0) {
                $articleVote->status = 1;
                //点赞数+1
                $article->votes_up = $article->votes_up + 1;
            }
            $articleVote->save();
            $article->update();
        } else {
            //更新投票表
            $articleVote = new ArticlesVotes();
            $articleVote->articles_id = $id;
            $articleVote->users_id = $usersId;
            $articleVote->type = 1;
            $articleVote->save();

            //点赞数+1
            $article->votes_up = $article->votes_up + 1;
            $article->update();
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