<?php
namespace App\Controllers;

use App\Models\Topics;
use App\Models\Shares;
use App\Models\Articles;

/**
 * Class IndexController
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class IndexController extends ControllerBase
{

    /**
     * 社区首页
     * @author jsyzchenchen@gmail.com
     * @date 2016/12/3
     */
    public function indexAction()
    {
        //热门分享
        $hotShares = Shares::find([
            "order" => "clicks DESC, id DESC",
            "limit" => 10
        ]);

        //热门话题
        $hotTopics = Topics::find([
            "order" => "sticked DESC, number_replies DESC, votes_up DESC, number_views DESC, id DESC",
            "limit" => 10
        ]);

        //热门文章
        $hotArticles = Articles::find([
            "order" => "number_replies DESC, votes_up DESC, number_views DESC, id DESC",
            "limit" => 10
        ]);

        $this->view->setVar("hotShares", $hotShares);
        $this->view->setVar("hotTopics", $hotTopics);
        $this->view->setVar("hotArticles", $hotArticles);
    }
}

