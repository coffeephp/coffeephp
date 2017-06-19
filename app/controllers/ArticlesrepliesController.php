<?php
namespace App\Controllers;

use Carbon\Carbon;
use Parsedown;
use App\Models\Articles;
use App\Models\ArticlesReplies;
use App\Models\Users;
use App\Models\ArticlesRepliesVotes;

/**
 * 文章回复控制器
 * @author jsyzchenchen@gmail.com
 * @date 2017/06/19
 */
class ArticlesRepliesController extends ControllerBase
{
    /**
     * 添加回复
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/19
     */
    public function storeAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        $return = array();

        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $bodyOriginal = $this->request->getPost('body_original');
                // @ user
                $preg_match_res = preg_match_all("/(\S*)\@([^\r\n\s]*)/i", $bodyOriginal, $atlistTmp);
                if ($preg_match_res) {
                    $usersNames = [];
                    foreach ($atlistTmp[2] as $k=>$v) {
                        if ($atlistTmp[1][$k] || strlen($v) >25) {
                            continue;
                        }
                        $usersNames[] = $v;
                    }
                    $usersNames = array_unique($usersNames);

                    if (count($usersNames) > 0) {
                        $atUsers = Users::find(
                            [
                                'name IN ({names:array})',
                                'bind' => [
                                    'names' => $usersNames
                                ]
                            ]
                        );

                        foreach ($atUsers as $users) {
                            $search = '@' . $users->name;
                            $place = '['.$search.'](/users/'.$users->id.')';
                            $bodyOriginal = str_replace($search, $place, $bodyOriginal);
                        }
                    }
                }

                $parsedown = new Parsedown();
                $body = $parsedown->text($bodyOriginal);
                $articlesId = $this->request->getPost('articles_id');
                $usersId = $auth['id'];

                $replies = new ArticlesReplies([
                    'articles_id' => $articlesId,
                    'body_original' => $bodyOriginal,
                    'body'          => $body,
                    'users_id'      => $usersId
                ]);

                $res = $replies->save();

                if ($res) {
                    $return['manage_topics'] = 'no';
                    $return['message'] = '操作成功！';
                    $return['status'] = 200;

                    $reply['body'] = $body;
                    $reply['articles_id'] = $articlesId;
                    $reply['source'] = null;
                    $reply['users_id'] = $usersId;
                    $reply['users'] = Users::findFirst($usersId)->toArray();
                    $reply['created_at'] = $replies->created_at;
                    $reply['id'] = $replies->id;

                    $return['reply'] = $reply;

                    //取出当前话题数据
                    $article = Articles::findFirst($articlesId);
                    //回复数 +1
                    $article->number_replies = $article->number_replies + 1;
                    $article->update();

                    //更新用户的活跃时间
                    $users = Users::findFirst($usersId);
                    $users->last_actived_at = Carbon::now()->toDateTimeString();
                    $users->save();

                } else {
                    $messages = $replies->getMessages();

                    foreach ($messages as $message) {
                        echo $message, "\n";
                    }
                }
            }
        }

        if (empty($return)) {
            $return['manage_topics'] = 'no';
            $return['message'] = '操作失败！';
            $return['status'] = 400;
        }

        exit(json_encode($return));
    }

    /**
     * 回复投票控制器
     * @param $id
     * @auhor jsyzchenchen@gmail.com
     * @date 2017/06/19
     */
    public function upvoteAction($id)
    {
        $return = array();

        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect('/login');
            return;
        }

        $articleReplie = ArticlesReplies::findFirst($id);

        $usersId = $auth['id'];

        $replieVotes = ArticlesRepliesVotes::findFirst([
            "articles_replies_id = :articles_replies_id: AND users_id = :users_id:",
            "bind" => [
                'articles_replies_id' => $id,
                'users_id' => $usersId
            ]
        ]);

        if ($replieVotes) {
            if ($replieVotes->status == 1) {
                $replieVotes->status = 0;

                $articleReplie->votes_up = $articleReplie->votes_up - 1;

                $return['type'] = 'sub';
            } elseif ($replieVotes->status == 0) {
                $replieVotes->status = 1;

                $articleReplie->votes_up = $articleReplie->votes_up + 1;

                $return['type'] = 'add';
            }
        } else {
            //更新投票表
            $replieVotes = new ArticlesRepliesVotes();
            $replieVotes->topics_replies_id = $id;
            $replieVotes->users_id = $usersId;
            $replieVotes->type = 1;

            $articleReplie->votes_up = $articleReplie->votes_up + 1;

            $return['type'] = 'add';
        }

        $replieVotes->save();
        $articleReplie->save();

        //更新用户的活跃时间
        $users = Users::findFirst($usersId);
        $users->last_actived_at = Carbon::now()->toDateTimeString();
        $users->save();

        $return['status'] = 200;
        $return['message'] = '操作成功！';

        exit(json_encode($return));
    }
}