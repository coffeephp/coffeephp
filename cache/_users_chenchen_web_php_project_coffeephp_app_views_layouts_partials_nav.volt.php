<div role="navigation" class="navbar navbar-default navbar-static-top topnav">
    <div class="container">
        <div class="navbar-header hidden-xs">

            <a href="/" class="navbar-brand">
                <img src="https://dn-phphub.qbox.me/assets/images/logo4.png" alt="Laravel China">
            </a>
        </div>
        <div id="top-navbar-collapse" class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/topics">社区</a></li>
                <li><a href="http://www.imooc.com/course/list?c=php" target="_blank">课程</a></li>
                <li><a href="https://www.lagou.com/zhaopin/PHP/" target="_blank">招聘</a></li>
                <li><a href="/sites">酷站</a></li>
            </ul>

            <div class="navbar-right">
                <form method="GET" action="https://laravel-china.org/search" accept-charset="UTF-8" class="navbar-form navbar-left" target="_blank">
                    <div class="form-group">
                        <input class="form-control search-input mac-style" placeholder="搜索" name="q" type="text">
                    </div>
                </form>

                <ul class="nav navbar-nav github-login">
                    <?php if (0) { ?>
                        <li>
                            <a href="https://laravel-china.org/topics/create" data-placement="bottom" class="popover-with-html" data-content="添加主题" data-original-title="" title="">
                                <i class="fa fa-plus text-md"></i>
                            </a>
                        </li>

                        <li>
                            <a href="https://laravel-china.org/notifications" class="text-warning" style="margin-top: -4px;">
                                <span class="badge badge-fade popover-with-html" data-content="消息提醒" id="notification-count" data-original-title="" title="">0</span>
                            </a>
                        </li>

                        <li>
                            <a href="#" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dLabel">
                                <img class="avatar-topnav" alt="Summer" src="https://dn-phphub.qbox.me/uploads/avatars/4330_1462204218.jpeg?imageView2/1/w/100/h/100">
                                jsyzchen
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dLabel">


                                <li>
                                    <a class="button" href="https://laravel-china.org/users/4330" data-lang-loginout="你确定要退出吗?">
                                        <i class="fa fa-user text-md"></i> 个人中心
                                    </a>
                                </li>
                                <li>
                                    <a class="button" href="https://laravel-china.org/users/4330/edit">
                                        <i class="fa fa-cog text-md"></i> 编辑资料
                                    </a>
                                </li>
                                <li>
                                    <a id="login-out" class="button" href="https://laravel-china.org/logout" data-lang-loginout="你确定要退出吗?">
                                        <i class="fa fa-sign-out text-md"></i> 退出
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <?php } else { ?>
                        <a href="" class="btn btn-info login-btn">
                            <i class="fa fa-github-alt"></i>
                            登录
                        </a>
                    <?php } ?>
                </ul>
            </div>
        </div>

    </div>
</div>