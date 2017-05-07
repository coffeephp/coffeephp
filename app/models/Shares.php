<?php
namespace App\Models;

/**
 * 分享模型
 * @package App\Models
 * @author jsyzchenchen@gmail.com
 * @date 2017/5/7
 */
class Shares extends ModelBase
{
    public $users_id;
    public $title;
    public $url;
    public $clicks;

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
    }
}