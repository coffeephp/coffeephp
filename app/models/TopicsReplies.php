<?php
namespace App\Models;

/**
 * 话题回复模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class TopicsReplies extends ModelBase
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
            "topics_id",
            "App\\Models\\Topics",
            "id",
            [
                "alias" => "topics",
            ]
        );

        $this->hasMany(
            "id",
            "App\\Models\\TopicsRepliesVotes",
            "topics_replies_id",
            [
                "alias" => "repliesVotes",
            ]
        );
    }
}