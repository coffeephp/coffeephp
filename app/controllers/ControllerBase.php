<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    /**
     * 初始化
     * @author jsyzchenchen@gmail.com
     * @date 2017/2/12
     */
    public function initialize()
    {
        $numberUsers = Users::count();
        $numberTopics = Topics::count();
        $numberReplies = Replies::count();

        $this->view->setVar("numberUsers", $numberUsers);
        $this->view->setVar("numberTopics", $numberTopics);
        $this->view->setVar("numberReplies", $numberReplies);
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
