<?php
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

        $this->hasMany(
            "id",
            "Votes",
            "topics_id"
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