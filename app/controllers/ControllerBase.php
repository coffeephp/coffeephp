<?php
namespace App\Controllers;

use Phalcon\Mvc\Controller;
use App\Models\Users;
use App\Models\Shares;
use App\Models\Topics;
use App\Models\Articles;

class ControllerBase extends Controller
{
    /**
     * 初始化
     * @author jsyzchenchen@gmail.com
     * @date 2017/2/12
     */
    public function initialize()
    {
        $this->checkLogin();

        $numberUsers = Users::count();
        $numberShares = Shares::count();
        $numberTopics = Topics::count();
        $numberArticles = Articles::count();
        $controllerName = $this->dispatcher->getControllerName();
        $appEnv = env('APP_ENV');

        $this->view->setVar("numberUsers", $numberUsers);
        $this->view->setVar("numberShares", $numberShares);
        $this->view->setVar("numberTopics", $numberTopics);
        $this->view->setVar("numberArticles", $numberArticles);
        $this->view->setVar("title", '');
        $this->view->setVar("controllerName", $controllerName);
        $this->view->setVar("appEnv", $appEnv);
    }

    /**
     * 检查用户是否登录
     * @author jsyzchenchen@gmail.com
     * @date 2017/5/24
     */
    public function checkLogin()
    {
        // 获取cookie
        $rememberMeCookie = $this->cookies->get("remember_me");
        // 获取cookie的值
        $rememberMe = $rememberMeCookie->getValue();

        if (!$this->session->get('auth') && $rememberMe) {
            list($usersId, $rememberToken) = explode(':', $rememberMe);

            $users = Users::findFirst($usersId);

            if ($users->remember_token === $rememberToken) {
                //设置用户的session
                $this->session->set(
                    "auth",
                    [
                        "id"   => $users->id,
                        "name" => $users->name,
                        "avatar" => $users->avatar
                    ]
                );
            }
        }
    }

    /**
     * 获取分页结果显示
     * @param $totalPage integer 总页数
     * @param $path
     * @return string
     * @author jsyzchenchen@gmail.com
     * @date 2017/2/10
     */
    public function getPaginateRender($totalPage, $path){
        $str = '';

        $str .= '<ul class="pagination">';

        $urlPrefix = $path . '?page=';

        $currentPage = isset($_GET['page']) ? intval($_GET['page']) : 1;

        if ($currentPage < 1) {
            $currentPage = 1;
        }

        if ($currentPage > $totalPage) {
            $currentPage = $totalPage;
        }

        $prePage = $currentPage - 1;
        $nextPage = $currentPage + 1;

        if ($prePage < 1) {
            $str .= '<li class="disabled" rel="prev"><span>«</span></li>';
        } else {
            $str .= '<li><a href="' . $urlPrefix . $prePage  . '" rel="prev">«</a></li>';
        }

        for ($i = 1; $i <= $totalPage; $i++) {
            if ($i == $currentPage) {
                $str .= '<li class="active"><span>' . $i . '</span></li>';
            } else {
                if ($totalPage > 10) {
                    if ($currentPage <= 5) {
                        if ($i >= 10) {
                            $str .= '<li class="disabled"><span>...</span></li>';
                            break;
                        } else {
                            $str .= '<li><a href="' . $urlPrefix . $i . '">' . $i . '</a></li>';
                        }
                    } else {
                        if (abs($i - $currentPage) == 5) {
                            $str .= '<li class="disabled"><span>...</span></li>';
                        }

                        if (abs($i - $currentPage) < 5) {
                            $str .= '<li><a href="' . $urlPrefix . $i . '">' . $i . '</a></li>';
                        }

                        if ($i - $currentPage > 4) {
                            break;
                        }
                    }
                } else {
                    $str .= '<li><a href="' . $urlPrefix . $i . '">' . $i . '</a></li>';
                }
            }
        }

        if ($nextPage > $totalPage) {
            $str .= '<li class="disabled" rel="next"><span>»</span></li>';
        } else {
            $str .= '<li><a href="' . $urlPrefix . $nextPage . '"' . ' rel="next">»</a></li>';
        }

        $str .= '</ul>';

        return $str;
    }
}
