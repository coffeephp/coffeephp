<?php
namespace App\Controllers;

use Overtrue\Socialite\SocialiteManager;
use App\Models\Users;

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
}