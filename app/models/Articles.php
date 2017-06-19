<?php
namespace App\Models;

/**
 * 文章模型
 * @package App\Models
 * @author jsyzchenchen@gmail.com
 * @date 2017/06/03
 */
class Articles extends ModelBase
{
    public $id;
    public $users_id;
    public $title;
    public $number_views;
    public $votes_up;
    public $number_replies;

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

        $this->hasMany(
            "id",
            "App\\Models\\ArticlesReplies",
            "articles_id",
            [
                'alias'    => 'replies'
            ]
        );
    }
}