<?php
namespace App\Models;

/**
 * 用户模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class Users extends ModelBase
{
    public $id;
    public $name;
    public $real_name;
    public $email;
    public $avatar;
    public $github_id;
    public $github_url;
    public $github_name;
    public $github_nickname;
    public $last_actived_at;
    public $remember_token;

    public function initialize()
    {
        parent::initialize();

        $this->hasMany(
            "id",
            "App\\Models\\Topics",
            "users_id",
            [
                'alias'    => 'topics'
            ]
        );

        $this->hasMany(
            "id",
            "App\\Models\\TopicsReplies",
            "users_id",
            [
                'alias'    => 'replies'
            ]
        );
    }
}