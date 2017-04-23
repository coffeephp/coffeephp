<?php
namespace App\Models;

/**
 * 话题浏览表
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/31
 */
class TopicsViews extends ModelBase
{
    public $id;
    public $topics_id;
    public $users_id;
    public $ip_address;
    public $user_agent;

    public function initialize()
    {
        parent::initialize();

        $this->belongsTo(
            'topics_id',
            'App\\Models\\Topics',
            'id',
            [
                "alias" => "topics"
            ]
        );
    }
}