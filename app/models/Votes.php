<?php
/**
 * 投票模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/04/13
 */
class Votes extends ModelBase
{
    public $topics_id;
    public $users_id;

    public function initialize()
    {
        parent::initialize();

        $this->belongsTo(
            "users_id",
            "Users",
            "id"
        );
    }

}