<div class="col-md-3 side-bar">
    <div class="panel panel-default corner-radius">
        <div class="panel-body text-center">
            <div class="btn-group">
                {% if controllerName == 'shares' %}
                    <a href="{{ url("shares/create") }}" class="btn btn-primary btn-lg btn-inverted">
                        <i class="fa fa-share-alt" aria-hidden="true"></i>  推 荐 分 享
                    </a>
                {%  elseif controllerName == 'topics' %}
                    <a href="{{ url("topics/create") }}" class="btn btn-primary btn-lg btn-inverted">
                        <i class="fa fa-comment" aria-hidden="true"></i>  新 建 话 题
                    </a>
                {% elseif controllerName == 'articles' %}
                    <a href="{{ url("articles/create") }}" class="btn btn-primary btn-lg btn-inverted">
                        <i class="fa fa-paint-brush" aria-hidden="true"></i>  创 作 文 章
                    </a>
                {% endif %}
            </div>
        </div>
    </div>

    {#<div class="panel panel-default corner-radius">#}
        {#<div class="panel-body text-center">#}
            {#<a class="sidebar-sponsor-link" href="https://account.ucloud.cn/cas/register?utm_source=coffeephp&utm_medium=content_pic_pc&utm_campaign=zanzhu&ytag=coffeephp" target="_blank">#}
                {#<img src="/img/ad/ucloud.jpg" class="popover-with-html" data-content="服务器赞助商：UCloud" width="100%" data-original-title="" title=""></a>#}
            {#<hr>#}
            {#<a class="sidebar-sponsor-link" href="http://www.bagevent.com/event/268776" target="_blank">#}
                {#<img src="{{ static_url("img/ad/devlinkphp2017.jpg") }}" class="popover-with-html" data-content="第三届 PHP 全球开发者大会 2017·北京" width="100%" data-original-title="" title=""></a>#}
            {#<hr>#}
            {#<a class="sidebar-sponsor-link" href="http://www.phpconchina.com" target="_blank">#}
                {#<img src="{{ static_url("img/ad/phpcon2017.png") }}" class="popover-with-html" data-content="PHPConf 2017 上海" width="100%" data-original-title="" title=""></a>#}
            {#<hr>#}
        {#</div>#}
    {#</div>#}

    <div class="panel panel-default corner-radius sidebar-resources">
        <div class="panel-heading text-center">
            <h3 class="panel-title">推荐资源</h3>
        </div>

        <div class="panel-body">
            <ul class="list list-group">
                <li class="list-group-item">
                    <a href="http://php.net/manual/zh/" class="no-pjax" title="PHP 手册" target="_blank">
                        <img class="media-object inline-block " src="{{ static_url("img/php-logo.jpg") ~ '?imageView2/1/w/20/h/20'}}">
                        PHP 手册
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="https://psr.phphub.org/" class="no-pjax" title="PHP PSR 标准规范" target="_blank">
                        <img class="media-object inline-block " src="{{ static_url("/img/php-fig.png") ~ '?imageView2/1/w/20/h/20' }}">
                        PSR PHP 标准规范
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="https://laravel-china.github.io/php-the-right-way/" class="no-pjax" title="PHP 之道 - PHPer 必读" target="_blank">
                        <img class="media-object inline-block " src="{{ static_url("/img/the-right-way.png") ~ '?imageView2/1/w/20/h/20'}}">
                        PHP 之道 - PHPer 必读
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="http://php-internals.com/" class="no-pjax" title="深入理解PHP内核" target="_blank">
                        <img class="media-object inline-block " src="{{ static_url("img/tipi-logo.png") ~ '?imageView2/1/w/20/h/20'}}">
                        深入理解PHP内核
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="https://olddocs.phalconphp.com/zh/latest/index.html" class="no-pjax" title="Phalcon 中文文档" target="_blank">
                        <img class="media-object inline-block " src="{{ static_url("img/phalcon-logo.png") ~ '?imageView2/1/w/20/h/20'}}">
                        Phalcon 中文文档
                    </a>
                </li>

                <li class="list-group-item">
                    <a href="http://d.laravel-china.org/" class="no-pjax" title="Laravel 中文文档" target="_blank">
                        <img class="media-object inline-block " src="{{ static_url("img/laravel-icon.jpg") ~ '?imageView2/1/w/20/h/20'}}">
                        Laravel 中文文档
                    </a>
                </li>
            </ul>
        </div>
    </div>

    {% if activeUsers is defined %}
        <div class="panel panel-default corner-radius panel-active-users">
            <div class="panel-heading text-center">
                <h3 class="panel-title">活跃用户<!--（<a href="https://laravel-china.org/hall_of_fames"><i class="fa fa-star" aria-hidden="true"></i> 名人堂</a>）--></h3>
            </div>
            <div class="panel-body">
                <div class="users-label">
                    {% for activeUser in activeUsers %}
                        <a class="popover-with-html users-label-item" href="{{ url('users/') ~  activeUser.id}}" data-content="{{ activeUser.name }}{% if activeUser.introduction %}-{{ activeUser.introduction }}{% endif %}">
                            <img class="avatar-small inline-block" src="{{ activeUser.avatar }}"> {{ activeUser.name }}
                        </a>
                    {% endfor %}
                </div>
            </div>
        </div>
    {% endif %}

    {% if hotTopics is defined %}
    <div class="panel panel-default corner-radius panel-hot-topics">
        <div class="panel-heading text-center">
            <h3 class="panel-title">热门话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                {% for hotTopic in hotTopics %}
                    <li>
                        <a href="{{ url("topics/") ~ hotTopic.id }}" class="popover-with-html" data-content="{{ hotTopic.title }}">
                            {{ loop.index }}.{{ hotTopic.title }}
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    {% endif %}

    {% if hotShares is defined %}
    <div class="panel panel-default corner-radius panel-hot-topics">
        <div class="panel-heading text-center">
            <h3 class="panel-title">热门分享</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                {% for hotShare in hotShares %}
                    <li>
                        <a href="{{ hotShare.url }}" class="popover-with-html" data-content="{{ hotShare.title }}" target="_blank">
                            {{ loop.index }}.{{ hotShare.title }}
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    {% endif %}

    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title">友情社区</h3>
        </div>
        <div class="panel-body text-center" style="padding-top: 5px;">
            <a href="http://golangtc.com/" target="_blank" rel="nofollow" title="Golang 中国" style="padding: 3px;">
                <img src="{{ static_url("img/friends/golangcn.png") }}" style="width:150px; margin: 3px 0;">
            </a>
            <a href="http://cnodejs.org/" target="_blank" rel="nofollow" title="CNode：Node.js 中文社区" style="padding: 3px;">
                <img src="{{ static_url("img/friends/cnodejs.png") }}" style="width:150px; margin: 3px 0;">
            </a>
        </div>
    </div>
</div>
<div class="clearfix"></div>