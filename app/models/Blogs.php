<?php
namespace App\Models;

/**
 * 专栏模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/05/03
 */
class Blogs extends ModelBase
{
    public $id;
    public $users_id;
    public $name;
    public $slug;
    public $description;
    public $cover;

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

        $this->hasMany(
            "id",
            "App\\Models\\Articles",
            "blogs_id",
            [
                'alias'    => 'articles'
            ]
        );
    }
}