<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * 用户模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class Users extends Model
{
    public $name;
    public $real_name;
    public $email;
    public $avatar;
    public $github_id;
    public $github_url;
    public $github_name;
    public $github_nickname;
    public $last_actived_at;

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