{#<div class="box text-center site-intro rm-link-color">#}
    {#Laravel China 中国最大的 Laravel 和 PHP 开发者社区，Powered By <a class="popover-with-html" data-content="查看源代码" target="_blank" style="padding-right:8px" href="https://github.com/summerblue/phphub5" data-original-title="" title=""><i class="fa fa-github-alt text-md" aria-hidden="true"></i> PHPHub</a>#}
{#</div>#}

<div class="banner-container rbs row">
    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
        <div class="item">
            <a href="http://php.net/manual/zh/" class="no-pjax" target="_blank">
                <p class="img"><span style="background-image:url({{ static_url("img/php-logo.jpg") }}); background-repeat:no-repeat;"></span></p>
                <p class="caption">PHP 手册</p>
            </a>
        </div>
    </div>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
        <div class="item">
            <a href="https://psr.phphub.org/" class="no-pjax" target="_blank">
                <p class="img"><span style="background-image:url({{ static_url("/img/php-fig.png") }})"></span></p>
                <p class="caption">PHP PSR 标准规范</p>
            </a>
        </div>
    </div>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
        <div class="item">
            <a href="https://packagist.org/" class="no-pjax" target="_blank">
                <p class="img"><span style="background-image:url({{ static_url("/img/packagist-logo.png") }}); background-repeat:no-repeat;"></span></p>
                <p class="caption">Composer包</p>
            </a>
        </div>
    </div>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
        <div class="item">
            <a href="http://laravel-china.github.io/php-the-right-way/" class="no-pjax" target="_blank">
                <p class="img"><span style="background-image:url({{ static_url("/img/the-right-way.png") }}); background-repeat:no-repeat;"></span></p>
                <p class="caption">PHP 之道</p>
            </a>
        </div>
    </div>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
        <div class="item">
            <a href="http://php-internals.com/" class="no-pjax" target="_blank">
                <p class="img"><span style="background-image:url({{ static_url("/img/tipi.png") }});"></span></p>
                <p class="caption">深入理解PHP内核</p>
            </a>
        </div>
    </div>

    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
        <div class="item">
            <a href="https://zephir-lang.com/" class="no-pjax" target="_blank">
                <p class="img"><span style="background-image:url({{ static_url("/img/zephir.png") }}); background-repeat:no-repeat;"></span></p>
                <p class="caption">Zephir 开发PHP扩展</p>
            </a>
        </div>
    </div>
</div>

<div class="panel panel-default list-panel home-topic-list col-md-6">
    <div class="panel-heading">
        <h3 class="panel-title text-center">
            热门分享
        </h3>
    </div>

    <div class="panel-body">
        <ul class="list-group row topic-list">
            {% for share in hotShares %}
                <li class="list-group-item media col-md-12" style="margin-top: 0px;">
                    <a class="reply_last_time hidden-xs meta" href="{{ share.url }}" target="_blank">
                        {{ share.clicks }} 点击
                    </a>

                    <div class="avatar pull-left">
                        <a href="{{ url('users/') ~  share.users_id}}">
                            <img class="media-object img-thumbnail avatar avatar-middle" alt="phecho" src="{{ share.users.avatar }}"></a>
                    </div>

                    <div class="infos">
                        <div class="media-heading">
                            <span class="hidden-xs label label-primary">分享</span>

                            <a href="{{ share.url }}" title="{{ share.title }}" target="_blank">
                                {{ share.title }}
                            </a>
                        </div>
                    </div>
                </li>
            {% endfor %}
        </ul>
    </div>

    <div class="panel-footer text-right">

        <a href="{{ url("shares/hot") }}" class="more-excellent-topic-link">
            查看更多 <i class="fa fa-arrow-right" aria-hidden="true"></i>
        </a>
    </div>
</div>

<div class="panel panel-default list-panel home-topic-list col-md-6">
    <div class="panel-heading">
        <h3 class="panel-title text-center">
            热门话题
        </h3>
    </div>

    <div class="panel-body">
        <ul class="list-group row topic-list">
            {% for topic in hotTopics %}
                <li class="list-group-item media col-md-12" style="margin-top: 0px;">
                    <a class="reply_last_time hidden-xs meta" href="{{ url("topics/" ~ topic.id) }}">
                        {{ topic.votes_up }} 点赞
                        <span> ⋅ </span>
                        {{ topic.number_replies }} 回复
                    </a>

                    <div class="avatar pull-left">
                        <a href="{{ url('users/') ~  topic.users_id}}">
                            <img class="media-object img-thumbnail avatar avatar-middle" alt="oustn" src="{{ topic.users.avatar }}"></a>
                    </div>

                    <div class="infos">

                        <div class="media-heading">

                            <span class="hidden-xs label label-default">{{ topic.categories.name }}</span>

                            <a href="{{ url("topics/" ~ topic.id) }}" title="{{ topic.title }}">
                                {{ topic.title }}
                            </a>
                        </div>

                    </div>

                </li>
            {% endfor %}
        </ul>
    </div>

    <div class="panel-footer text-right">

        <a href="{{ url("topics/hot") }}" class="more-excellent-topic-link">
            查看更多 <i class="fa fa-arrow-right" aria-hidden="true"></i>
        </a>
    </div>
</div>



