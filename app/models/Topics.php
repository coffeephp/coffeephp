<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * 话题模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class Topics extends Model
{
    /** @var int 浏览数 */
    public $number_views;
    /** @var int 回复数 */
    public $number_replies;
    public $id;
    public $users_id;
    public $categories_id;

    public function initialize()
    {
        $this->addBehavior(
            new SoftDelete(
                [
                    "field" => "deleted_at",
                    "value" => date("Y-m-d H:i:s"),
                ]
            )
        );

        $this->belongsTo(
            "users_id",
            "Users",
            "id"
        );

        $this->belongsTo(
            "last_reply_users_id",
            "Users",
            "id",
            [
                "alias" => "lastReplyUsers",
            ]
        );

        $this->hasMany(
            "id",
            "Replies",
            "topics_id"
        );

        $this->belongsTo(
            "categories_id",
            "Categories",
            "id"
        );
    }

    public function beforeCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
    }

    public function beforeUpdate()
    {
        $this->updated_at = date("Y-m-d H:i:s");
    }
}