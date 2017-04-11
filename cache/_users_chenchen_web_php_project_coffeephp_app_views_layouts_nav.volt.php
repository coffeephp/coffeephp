<div role="navigation" class="navbar navbar-default navbar-static-top topnav">
    <div class="container">
        

            
                
            
        
        <div class="navbar-header">
            <a class="navbar-brand" href="/" style="color: #777">CoffeePHP</a>
        </div>
        <div id="top-navbar-collapse" class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<?= $this->url->get('topics') ?>">社区</a></li>
                <li><a href="http://www.imooc.com/course/list?c=php" target="_blank">课程</a></li>
                <li><a href="https://www.lagou.com/zhaopin/PHP/" target="_blank">招聘</a></li>
                
            </ul>

            <div class="navbar-right">
                
                    
                        
                    
                

                <ul class="nav navbar-nav github-login">
                    <?php if ($this->session->auth) { ?>
                        <li>
                            <a href="<?= $this->url->get('topics/create') ?>" data-placement="bottom" class="popover-with-html" data-content="添加主题" data-original-title="" title="">
                                <i class="fa fa-plus text-md"></i>
                            </a>
                        </li>

                        
                            
                                
                            
                        

                        <li>
                            <a href="#" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dLabel">
                                <img class="avatar-topnav" alt="<?= $this->session->auth['name'] ?>" src="<?= $this->session->auth['avatar'] ?>">
                                <?= $this->session->auth['name'] ?>
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dLabel">
                                <li>
                                    <a class="button" href="<?= $this->url->get('users/') . $this->session->auth['id'] ?>" data-lang-loginout="你确定要退出吗?">
                                        <i class="fa fa-user text-md"></i> 个人中心
                                    </a>
                                </li>
                                <li>
                                    <a class="button" href="<?= $this->url->get('users/') . $this->session->auth['id'] . '/edit' ?>">
                                        <i class="fa fa-cog text-md"></i> 编辑资料
                                    </a>
                                </li>
                                <li>
                                    <a id="login-out" class="button" href="<?= $this->url->get('logout') ?>" data-lang-loginout="你确定要退出吗?">
                                        <i class="fa fa-sign-out text-md"></i> 退出
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <?php } else { ?>
                        <a href="<?= $this->url->get('auth/github') ?>" class="btn btn-info login-btn">
                            <i class="fa fa-github-alt"></i>
                            登录
                        </a>
                    <?php } ?>
                </ul>
            </div>
        </div>

    </div>
</div>