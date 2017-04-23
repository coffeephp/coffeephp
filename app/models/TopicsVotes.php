<?php
namespace App\Models;

/**
 * 话题投票模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/04/13
 */
class TopicsVotes extends ModelBase
{
    public $topics_id;
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