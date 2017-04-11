<?php
use Phalcon\Mvc\Model;

/**
 * 话题浏览表
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/31
 */
class TopicsViews extends Model
{
    public $id;
    public $topics_id;
    public $ip_address;
    public $user_agent;

    public function initialize()
    {
        $this->belongsTo(
            'topics_id',
            'Topics',
            'id'
        );
    }

    public function beforeCreate()
    {
        $this->created_at = date("Y-m-d H:i:s");
    }
}