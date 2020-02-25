<?php
namespace App\Controllers;

use Overtrue\Socialite\SocialiteManager;
use App\Models\Users;
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

/**
 * 权限控制器
 * @author jsyzchenchen@gmail.com
 * @date 2017/1/1
 */
class AuthController extends ControllerBase
{
    /**
     * github授权
     * @author jsyzchenchen@gmail.com
     * @date 2017/1/2
     */
    public function githubAuthorizeAction()
    {
        $socialiteConfig = $this->config->socialite->toArray();

        $socialite = new SocialiteManager($socialiteConfig);

        $response = $socialite->driver('github')->redirect();

        $response->send();
    }

    /**
     * github回调
     * @author jsyzchenchen@gmail.com
     * @date 2017/1/2
     */
    public function githubCallbackAction()
    {
        $socialiteConfig = $this->config->socialite->toArray();

        $socialite = new SocialiteManager($socialiteConfig);

        $user = $socialite->driver('github')->user();

        //查看是否有该用户信息
        $users = Users::findFirst(["conditions"=>"github_id = :github_id:", "bind"=>['github_id' => $user->id]]);

        $rememberToken = md5(uniqid(rand(), TRUE));
        $rememberMe = $users->id . ':' . $rememberToken;

        if($users){
            $users->last_actived_at = date('Y-m-d H:i:s', time());
            $users->remember_token = $rememberToken;
            $users->update();
        } else {//没有该用户添加
            $users = new Users();
            $users->name = $user->nickname;
            $users->avatar = $user->avatar;
            $users->email = $user->email;
            $users->city = $user->original['location'];
            $users->company = $user->original['company'];
            $users->personal_website = $user->original['blog'];
            $users->github_id = $user->id;
            $users->github_name = $user->nickname;
            $users->last_actived_at = date('Y-m-d H:i:s', time());
            $users->remember_token = $rememberToken;
            $users->create();
        }

        //设置用户的session
        $this->session->set(
            "auth",
            [
                "id"   => $users->id,
                "name" => $users->name,
                "avatar" => $users->avatar
            ]
        );

        //设置记住我的cookie
        $this->cookies->set(
            "remember_me",
            $rememberMe,
            time() + 15 * 86400
        );

        //更新用户头像
        $this->updateUserAvatar($users->id);

        $this->response->redirect("/");
        return;
    }

    /**
     * 用户退出
     * @author jsyzchenchen@gmail.com
     * @date 2017/1/5
     */
    public function logoutAction()
    {
        // 删除session变量
        $this->session->remove("auth");

        // Delete the cookie
        $rememberMeCookie = $this->cookies->get("remember_me");
        $rememberMeCookie->delete();

        $this->response->redirect("/");
        return;
    }


    /**
     * 更新用户的头像到七牛
     * @param $id
     * @return bool
     * @author jsyzchenchen@gmail.com
     * @date 2017/10/30
     */
    public function updateUserAvatar($id)
    {
        $user = Users::findFirst($id);

        $avatar = $user->avatar;

        if (strpos($avatar, 'github') !== false) {
            // 需要填写你的 Access Key 和 Secret Key
            $accessKey = env('QINIU_ACCESS_KEY');
            $secretKey = env('QINIU_SECRET_KEY');
            $bucket = env('QINIU_AVATAR_BUCKET');

            // 构建鉴权对象
            $auth = new Auth($accessKey, $secretKey);
            // 生成上传 Token
            $token = $auth->uploadToken($bucket);

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
                    $user->update(['avatar' => 'https://avatar.coffeephp.com/' . $ret['key']]);
                }
            }
        }

        return true;
    }
}