<?php
namespace App\Models;

/**
 * 专栏模型
 * @author jsyzchenchen@gmail.com
 * @date 2017/05/03
 */
class Blogs extends ModelBase
{
    public $users_id;
    public $name;
    public $slug;
    public $description;
    public $cover;

    public function initialize()
    {
        parent::initialize();
    }
}