<?php
namespace App\Controllers;

use App\Models\Users;
use App\Models\Blogs;
use App\Models\Articles;

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

        $usersId = $auth['id'];

        $blog = Blogs::findFirst([
            'conditions' => 'users_id = :users_id:',
            'bind'     => [
                'users_id' => $usersId,
            ],
        ]);

        if ($blog) {
            $this->response->redirect('blogs/' . $blog->id . '/edit');
            return;
        }

        $user = Users::findFirst($usersId);
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
            $blogs->name = $this->request->getPost('name', 'string');
            $blogs->slug = $this->request->getPost('slug', 'string');
            $blogs->description = $this->request->getPost('description', 'string');

            if ($this->request->hasFiles(true)) {
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

    /**
     * 专栏编辑页
     * @author jsyzchenchen@gmail.com
     * @date 2017/05/11
     */
    public function editAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        $usersId = $auth['id'];

        $user = Users::findFirst($usersId);
        $blog = Blogs::findFirst($id);

        if ($blog->users_id !== $usersId) {
            $this->flashSession->error('The blog does not belong to you!');
            $this->response->redirect();
            return;
        }

        $user = Users::findFirst($usersId);
        $this->view->setVar('user', $user);
        $this->view->setVar('blog', $blog);
    }

    /**
     * 更新专栏
     * @param $id int 专栏id
     * @author jsyzchenchen@gmail.com
     * @date 2017/05/11
     */
    public function updateAction($id)
    {
        if (!$auth = $this->session->get('auth')) {
            $this->flashSession->error('You must be logged first');
            $this->response->redirect();
            return;
        }

        if (!$this->request->isPost()) {
            $this->flashSession->error('You must use post!');
            $this->response->redirect("blogs/" . $id . "/edit");
            return;
        }

        if ($this->security->checkToken()) {
            $usersId = $auth['id'];

            $blogs = Blogs::findFirst($id);
            $blogs->users_id = $usersId;
            $blogs->name = $this->request->getPost('name', 'string');
            $blogs->slug = $this->request->getPost('slug', 'string');
            $blogs->description = $this->request->getPost('description', 'string');

            if ($this->request->hasFiles(true)) {
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
            }

            $res = $blogs->save();

            if ($res === false) {
                $messages = $blogs->getMessages();

                foreach ($messages as $message) {
                    //echo $message, "\n";
                }

                $this->flashSession->error("The blog was failed to save!");
                $this->response->redirect("blogs/" . $id . "/edit");
                return;
            }

            $this->flashSession->success('修改成功!');
            $this->response->redirect("blogs/" . $id . "/edit");
            return;
        } else {
            $this->flashSession->error("The token is error!");
            $this->response->redirect("blogs/" . $id . "/edit");
            return;
        }
    }

    /**
     * 专栏详情页
     * @param $slug
     * @author jsyzchenchen@gmail.com
     * @date 2017/06/18
     */
    public function showAction($slug)
    {
        $blog = Blogs::findFirst([
            'conditions' => 'slug = :slug:',
            'bind'     => [
                'slug' => $slug,
            ],
        ]);

        $articles = Articles::find([
            'conditions' => 'blogs_id = :blogs_id:',
            'bind'     => [
                'blogs_id' => $blog->id,
            ],
        ]);
        $this->view->setVar('blog', $blog);
        $this->view->setVar('articles', $articles);
    }
}