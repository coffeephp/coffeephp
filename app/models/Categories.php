<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

/**
 * 分类模型
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/11
 */
class Categories extends Model
{
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