<?php
namespace App\Controllers;

/**
 * Class IndexController
 * @author jsyzchenchen@gmail.com
 * @date 2016/12/3
 */
class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->response->redirect('/topics');
        return;
//        $topics       = new  Topics();
//        $topics->title = "test";
//        $topics->body = "test";
//        $topics->user_id = 111;
//        $topics->category_id = 1;
//
//        //执行操作
//        $ret = $topics->save();

       //Topics::findFirst(2)->save(['user_id'=>222445600]);
//        //对结果进行验证
////        if ($ret) {
////            echo "修改数据成功";
////        } else {
////            //如果插入失败处理打印报错信息
////            echo "修改数据库失败了";
////            foreach ($topics->getMessages() as $message) {
////                echo $message->getMessage(), "<br/>";
////            }
////        }
        //die;
    }
}

