<?php
namespace App\Controllers;

use App\Models\Users;
use App\Models\Shares;
use App\Models\Topics;
use App\Models\Articles;
use Phalcon\Http\Response;
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

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

        $shares = Shares::find(
            [
                "users_id = :users_id:",
                "order" => "id desc",
                "bind" => [
                    'users_id' => $id
                ]
            ]
        );

        $topics = Topics::find(
            [
                "users_id = :users_id:",
                "order" => "id desc",
                "bind" => [
                    'users_id' => $id
                ]
            ]
        );

        $articles = Articles::find(
            [
                "users_id = :users_id:",
                "order" => "id desc",
                "bind" => [
                    'users_id' => $id
                ]
            ]
        );

        $this->view->setVar('user', $user);
        $this->view->setVar('shares', $shares);
        $this->view->setVar('topics', $topics);
        $this->view->setVar('articles', $articles);
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
                $post_data = $this->request->getPost();
                $user = Users::findFirst($id);
                $user->last_actived_at = date('Y-m-d H:i:s', time());
                $old_name = $user->name;
                $user->update($post_data);

                if ($post_data['name'] != $old_name) {
                    //设置用户的session
                    $this->session->set(
                        "auth",
                        [
                            "id"   => $user->id,
                            "name" => $user->name,
                            "avatar" => $user->avatar
                        ]
                    );
                }

                $this->flashSession->success("操作成功!");
                $this->response->redirect("users/{$id}/edit");
                return;
            } else {
                $this->flashSession->error("The info was failed to save!");
            }
        }
    }

    public function updateUserAvatarAction()
    {
        $users = Users::find();


        // 需要填写你的 Access Key 和 Secret Key
        $accessKey = env('QINIU_ACCESS_KEY');
        $secretKey = env('QINIU_SECRET_KEY');
        $bucket = env('QINIU_AVATAR_BUCKET');

        // 构建鉴权对象
        $auth = new Auth($accessKey, $secretKey);

        // 生成上传 Token
        $token = $auth->uploadToken($bucket);

        foreach ($users as $user) {
            $avatar = $user->avatar;

            if (strpos($avatar, 'github') !== false) {

                $handle = fopen($avatar, "rb");

                $contents = stream_get_contents($handle);

                // 上传到七牛后保存的文件名
                $key = $user->id . '.jpg';

                // 初始化 UploadManager 对象并进行文件的上传。
                $uploadMgr = new UploadManager();

                // 调用 UploadManager 的 put 方法进行文件的上传。
                list($ret, $err) = $uploadMgr->put($token, $key, $contents);

                if ($err !== null) {
                    //var_dump($err);
                } else {
                    //var_dump($ret);

                    if (isset($ret['key']) && $ret['key']) {
                        //更新头像地址
                        //$user->update(['avatar' => 'http://avatar.coffeephp.com/' . $ret['key']]);
                    }
                }
            }
        }


        // Getting a response instance
        $response = new Response();
        // Setting a raw header
        $response->setRawHeader("HTTP/1.1 200 OK");
        // Return the response
        return $response;
    }
}

