<?php
namespace App\Models;

/**
 * 文章回复模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/6/19
 */
class ArticlesReplies extends ModelBase
{
    public $votes_up;

    public function initialize()
    {
        parent::initialize();

        $this->belongsTo(
            "users_id",
            "App\\Models\\Users",
            "id",
            [
                "alias" => "users",
            ]
        );

        $this->belongsTo(
            "articles_id",
            "App\\Models\\Topics",
            "id",
            [
                "alias" => "articles",
            ]
        );

        $this->hasMany(
            "id",
            "App\\Models\\ArticlesRepliesVotes",
            "articles_replies_id",
            [
                "alias" => "articlesVotes",
            ]
        );
    }
}