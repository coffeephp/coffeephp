<?php
namespace App\Controllers;

use App\Models\Users;
use App\Models\Topics;
use App\Models\TopicsReplies;

/**
 * 用户控制器
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/4
 */
class UsersController extends ControllerBase
{
    /**
     * 个人页面
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/4
     */
    public function showAction($id)
    {
        $user = Users::findFirst($id);

        if (!$user) {
            $this->flashSession->error('该用户不存在！');
            $this->response->redirect();
            return;
        }

        $topics = Topics::find(
            [
                "users_id = :users_id:",
                "order" => "id desc",
                "bind" => [
                    'users_id' => $id
                ]
            ]
        );

        $replies = TopicsReplies::find(
            [
                "users_id = :users_id:",
                "order" => "id desc",
                "bind" => [
                    'users_id' => $id
                ]
            ]
        );

        $this->view->setVar('user', $user);
        $this->view->setVar('topics', $topics);
        $this->view->setVar('replies', $replies);
    }


    /**
     * Show the form for editing the specified resource.
     * @param  int  $id
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/4
     */
    public function editAction($id)
    {
        $auth = $this->session->get('auth');
        if (!$auth || $auth['id'] != $id) {
            $this->flashSession->error('forbidden!');
            $this->response->redirect();
            return;
        }

        $user = Users::findFirst($id);

        if (!$user) {
            $this->flashSession->error('该用户不存在！');
            $this->response->redirect();
            return;
        }

        $this->view->setVar('user', $user);
    }

    /**
     * Update the specified resource in storage.
     * @param  int  $id
     * @author jsyzchenchen@gmail.com
     * @date 2016/1/13
     */
    public function updateAction($id)
    {
        $auth = $this->session->get('auth');
        if (!$auth || $auth['id'] != $id) {
            $this->flashSession->error('forbidden!');
            $this->response->redirect();
            return;
        }

        if ($this->request->isPost()) {
            if ($this->security->checkToken()) {
                $users = Users::findFirst($id);
                $users->last_actived_at = date('Y-m-d H:i:s', time());
                $users->update($_POST);
                $this->flashSession->success("操作成功!");
                $this->response->redirect("users/{$id}/edit");
                return;
            } else {
                $this->flashSession->error("The info was failed to save!");
            }
        }
    }
}

