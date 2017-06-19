<?php
namespace App\Models;

/**
 * 文章投票模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/06/19
 */
class ArticlesVotes extends ModelBase
{
    public $articles_id;
    public $users_id;

    public function initialize()
    {
        parent::initialize();

        $this->belongsTo(
            "users_id",
            "App\\Models\\Users",
            "id",
            [
                "alias" => "users"
            ]
        );
    }

}