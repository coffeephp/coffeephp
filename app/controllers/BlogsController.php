<?php
namespace App\Controllers;

use App\Models\Users;
use App\Models\Blogs;
/**
 * 专栏控制器
 * @author jsyzchenchen@gmail.com
 * @date 2017/05/03
 */
class BlogsController extends ControllerBase
{
    /**
     * 创建专栏
     * @author jsyzchenchen@gmail.com
     * @date 2017/05/03
     */
    public function createAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        $user = Users::findFirst($auth['id']);

        $this->view->setVar('user', $user);
    }

    /**
     * 保存专栏
     * @author jsyzchenchen@gmail.com
     * @date 2017/05/04
     */
    public function storeAction()
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use post!');
            $this->response->redirect("blogs/create");
            return;
        }


        if ($this->security->checkToken()) {
            $usersId = $auth['id'];

            $blogs = new Blogs();
            $blogs->users_id = $usersId;
            $blogs->name = $this->request->getPost('name');
            $blogs->slug = $this->request->getPost('slug');
            $blogs->description = $this->request->getPost('description');

            if ($this->request->hasFiles()) {
                $files = $this->request->getUploadedFiles();

                foreach ($files as $file) {
                    // Move the file into the application
                    $path = "files/" . date('Ymd') . '/';
                    if (!is_dir($path)) {
                        mkdir($path);
                    }
                    $savename = md5(microtime(true)) . '.' .pathinfo($file->getName(), PATHINFO_EXTENSION);
                    $filename = $path . $savename;
                    $file->moveTo($filename);

                    $blogs->cover = '/' . $filename;
                }
            } else {
                $this->flashSession->error("upload file fail!");
                $this->response->redirect("blogs/create");
                return;
            }

            $res = $blogs->save();

            if ($res === false) {
                $messages = $blogs->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $this->flashSession->error("The topic was failed to save!");
                $this->response->redirect("blogs/create");
                return;
            }

            $this->flashSession->success('创建成功!');
            $this->response->redirect("blogs/{$blogs->slug}");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("blogs/create");
            return;
        }
    }
}