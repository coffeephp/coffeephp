<?php
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
            "Users",
            "id"
        );

        $this->belongsTo(
            "topics_id",
            "Topics",
            "id"
        );

        $this->hasMany(
            "id",
            "RepliesVotes",
            "replies_id"
        );
    }
}