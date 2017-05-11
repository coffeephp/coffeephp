<div role="navigation" class="navbar navbar-default navbar-static-top topnav">
    <div class="container">
        <div class="navbar-header hidden-xs">
            <a href="/" class="navbar-brand">
                <img src="/img/logo.png" alt="CoffeePHP" style="width: 50px;height: 50px;margin-top: -18px;">
            </a>
        </div>
        {#<div class="navbar-header">#}
            {#<a class="navbar-brand" href="/" style="color: #777">CoffeePHP</a>#}
        {#</div>#}
        <div id="top-navbar-collapse" class="navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="{%  if controllerName == 'shares' %}active{% endif %}"><a href="{{ url('shares') }}">分享</a></li>
                <li class="{%  if controllerName == 'topics' %}active{% endif %}"><a href="{{ url('topics') }}">话题</a></li>
                <li class="{%  if controllerName == 'resources' %}active{% endif %}"><a href="{{ url('resources') }}">资源</a></li>
                <li><a href="http://www.imooc.com/course/list?c=php" target="_blank">课程</a></li>
                <li><a href="https://www.lagou.com/zhaopin/PHP/" target="_blank">招聘</a></li>
                {#<li><a href="/sites">酷站</a></li>#}
            </ul>

            <div class="navbar-right">
                <form method="GET" action="/search" accept-charset="UTF-8" class="navbar-form navbar-left" target="_blank">
                    <div class="form-group">
                        <input class="form-control search-input mac-style" placeholder="搜索" name="q" type="text">
                    </div>
                </form>

                <ul class="nav navbar-nav github-login">
                    {% if session.auth%}
                        <li class="">
                            <a href="#" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-plus text-md"></i>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dLabel">
                                <li>
                                    <a class="button no-pjax" href="{{ url('shares/create') }}">
                                        <i class="fa fa-share-alt text-md"></i> 推荐分享
                                    </a>
                                </li>

                                <li>
                                    <a class="button no-pjax" href="{{ url('topics/create') }}">
                                        <i class="fa fa-comment text-md"></i> 新建话题
                                    </a>
                                </li>

                                {#<li>#}
                                    {#<a class="button no-pjax" href="https://laravel-china.org/articles/create">#}
                                        {#<i class="fa fa-paint-brush text-md"></i> 创作文章#}
                                    {#</a>#}
                                {#</li>#}
                            </ul>
                        </li>

                        {#<li>#}
                            {#<a href="/notifications" class="text-warning" style="margin-top: -4px;">#}
                                {#<span class="badge badge-fade popover-with-html" data-content="消息提醒" id="notification-count" data-original-title="" title="">0</span>#}
                            {#</a>#}
                        {#</li>#}

                        <li>
                            <a href="#" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dLabel">
                                <img class="avatar-topnav" alt="{{ session.auth['name'] }}" src="{{ session.auth['avatar'] }}">
                                {{ session.auth['name'] }}
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dLabel">
                                <li>
                                    <a class="button" href="{{ url('users/') ~ session.auth['id']}}" data-lang-loginout="你确定要退出吗?">
                                        <i class="fa fa-user text-md"></i> 个人中心
                                    </a>
                                </li>
                                <li>
                                    <a class="button" href="{{ url('users/') ~ session.auth['id'] ~ '/edit'}}">
                                        <i class="fa fa-cog text-md"></i> 编辑资料
                                    </a>
                                </li>
                                <li>
                                    <a id="login-out" class="button" href="{{ url('logout') }}" data-lang-loginout="你确定要退出吗?">
                                        <i class="fa fa-sign-out text-md"></i> 退出
                                    </a>
                                </li>
                            </ul>
                        </li>
                    {% else %}
                        <a href="{{ url('auth/github') }}" class="btn btn-info login-btn">
                            <i class="fa fa-github-alt"></i>
                            登录
                        </a>
                    {% endif %}
                </ul>
            </div>
        </div>

    </div>
</div>