<?php
namespace App\Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * 回复模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class Replies extends ModelBase
{
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
            "App\\Models\\RepliesVotes",
            "replies_id",
            [
                "alias" => "repliesVotes",
            ]
        );
    }
}