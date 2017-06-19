<?php
namespace App\Models;

/**
 * 文章回复投票模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/06/19
 */
class ArticlesRepliesVotes extends ModelBase
{
    public $articles_replies_id;
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