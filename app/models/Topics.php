<?php
namespace App\Models;

/**
 * 话题模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class Topics extends ModelBase
{
    /** @var int 浏览数 */
    public $number_views;
    /** @var int 回复数 */
    public $number_replies;
    public $votes_up;
    public $id;
    public $users_id;
    public $categories_id;
    public $title;

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
            "App\\Models\\TopicsReplies",
            "topics_id",
            [
                'alias'    => 'replies'
            ]
        );

        $this->belongsTo(
            "categories_id",
            "App\\Models\\Categories",
            "id",
            [
                'alias'    => 'categories'
            ]
        );

        $this->hasMany(
            "id",
            "App\\Models\\TopicsVotes",
            "topics_id",
            [
                'alias'    => 'topicsVotes'
            ]
        );
    }
}