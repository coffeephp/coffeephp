<?php
use Carbon\Carbon;

/**
 * 回复控制器
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/31
 */
class RepliesController extends ControllerBase
{
    /**
     * 添加回复
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/31
     */
    public function storeAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
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
                    $usersNames =  array_unique($usersNames);

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
                $topicsId = $this->request->getPost('topics_id');
                $usersId = $auth['id'];

                $replies = new Replies([
                    'topics_id' => $topicsId,
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
                    $reply['topics_id'] = $topicsId;
                    $reply['source'] = null;
                    $reply['users_id'] = $usersId;
                    $reply['users'] = Users::findFirst($usersId)->toArray();
                    $reply['created_at'] = $replies->created_at;
                    $reply['id'] = $replies->id;

                    $return['reply'] = $reply;

                    //取出当前话题数据
                    $topic = Topics::findFirst($topicsId);
                    //回复数 +1
                    $topic->number_replies = $topic->number_replies + 1;
                    $topic->update();

                    //更新用户的活跃时间
                    $users = Users::findFirst($usersId);
                    $users->last_actived_at = Carbon::now()->toDateTimeString();
                    $users->save();

                } else {
                    $messages = $replies->getMessages();

                    foreach ($messages as $message) {
                        echo $message, "\n";
                    }
                    die;
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
}