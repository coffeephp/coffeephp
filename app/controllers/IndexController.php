<?php
namespace App\Controllers;

use App\Models\Topics;
use App\Models\Shares;
use App\Models\Articles;
use Carbon\Carbon;

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
        $startDateTime = Carbon::parse('-1 months')->toDateTimeString();

        //热门分享
        $hotShares = Shares::find([
            "conditions" => "created_at >= :startDateTime:",
            "order" => "clicks DESC, id DESC",
            "limit" => 10,
            "bind"  => [
                "startDateTime" => $startDateTime,
            ]
        ]);

        //热门话题
        $hotTopics = Topics::find([
            "conditions" => "created_at >= :startDateTime:",
            "order" => "sticked DESC, number_replies DESC, votes_up DESC, number_views DESC, id DESC",
            "limit" => 10,
            "bind"  => [
                "startDateTime" => $startDateTime,
            ]
        ]);

        //热门文章
        $hotArticles = Articles::find([
            "conditions" => "created_at >= :startDateTime:",
            "order" => "number_replies DESC, votes_up DESC, number_views DESC, id DESC",
            "limit" => 10,
            "bind"  => [
                "startDateTime" => $startDateTime,
            ]
        ]);

        $this->view->setVar("hotShares", $hotShares);
        $this->view->setVar("hotTopics", $hotTopics);
        $this->view->setVar("hotArticles", $hotArticles);
    }
}

