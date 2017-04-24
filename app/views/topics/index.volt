<div class="col-md-9 topics-index main-col">
    <div class="panel panel-default">
        <div class="panel-heading">
            <ul class="list-inline topic-filter">
                <li class="popover-with-html" data-content="最后创建排序"><a href="{{ url('topics') }}" class="active">最新</a></li>
            </ul>

            <div class="clearfix"></div>
        </div>
        <div class="panel-body remove-padding-horizontal">
            <ul class="list-group row topic-list">
                {% for item in page.items %}
                    <li class="list-group-item ">

                        <a class="reply_count_area hidden-xs pull-right" href="{{ url("topics/" ~ item.id) }}">
                            <div class="count_set">
                 <span class="count_of_votes" title="投票数">
                   {{ item.votes_up }}
                </span>

                                <span class="count_seperator">/</span>

                                <span class="count_of_replies" title="回复数">
                   {{ item.number_replies }}
                 </span>

                                <span class="count_seperator">/</span>

                                <span class="count_of_visits" title="查看数">
                   {{ item.number_views }}
                 </span>
                                <span class="count_seperator">|</span>

                                <abbr title="{% if item.updated_at %}{{ item.updated_at }}{% else %}{{ item.created_at }}{% endif %}" class="timeago">{% if item.updated_at %}{{ item.updated_at }}{% else %}{{ item.created_at }}{% endif %}</abbr>
                            </div>
                        </a>

                        <div class="avatar pull-left">
                            <a href="{{ url('users/') ~  item.users.id}}" title="{{ item.users.name }}">
                                <img class="media-object img-thumbnail avatar avatar-middle" alt="{{ item.users.name }}" src="{{ item.users.avatar }}"></a>
                        </div>


                        <div class="infos">

                            <div class="media-heading">
                                {% if item.sticked == 1 %}
                                <span class="hidden-xs label label-warning">置顶</span>
                                {% else %}
                                <span class="hidden-xs label {% if item.is_excellent %}label-success{% else %}label-default{% endif %}">{{ item.categories.name }}</span>
                                {% endif %}
                                <a href="{{ url("topics/" ~ item.id) }}" title="{{ item.title }}">
                                    {{ item.title }}
                                </a>

                            </div>

                        </div>

                    </li>
                {% endfor %}

            </ul>

        </div>

        <div class="panel-footer text-right remove-padding-horizontal pager-footer">
            <!-- Pager -->
            {{ page.paginatorRender }}
        </div>
    </div>

    <!-- Nodes Listing -->

</div>

<div class="col-md-3 side-bar">
    <div class="panel panel-default corner-radius">
        <div class="panel-body text-center">
            <div class="btn-group">
                <a href="{{ url("topics/create") }}" class="btn btn-primary btn-lg btn-inverted">
                    <i class="fa fa-paint-brush" aria-hidden="true"></i>  新 建 话 题
                </a>
            </div>
        </div>
    </div>

    <div class="panel panel-default corner-radius sidebar-resources">
        <div class="panel-heading text-center">
            <h3 class="panel-title">推荐资源</h3>
        </div>

        <div class="panel-body">
            <ul class="list list-group ">
                <li class="list-group-item ">
                    <a href="https://laravel-china.github.io/php-the-right-way/" class="no-pjax" title="PHP 之道 - PHPer 必读">
                        <img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/vA50AYuscu2RCMowq7ee.png">
                        PHP 之道 - PHPer 必读
                    </a>
                </li>

                <li class="list-group-item ">
                    <a href="https://docs.phalconphp.com/zh/latest/index.html" class="no-pjax" title="Phalcon 中文文档">
                        <img class="media-object inline-block " src="{{ static_url("img/phalcon-logo.png") }}">
                        Phalcon 中文文档
                    </a>
                </li>

                <li class="list-group-item ">
                    <a href="http://d.laravel-china.org/" class="no-pjax" title="Laravel 中文文档">
                        <img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/ql9XtosRhTe4v8HVC3TV.jpg">
                        Laravel 中文文档
                    </a>
                </li>
            </ul>
        </div>
    </div>

    {% if activeUsers %}
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

    <div class="panel panel-default corner-radius panel-hot-topics">
        <div class="panel-heading text-center">
            <h3 class="panel-title">热门话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                {% for hotTopic in hotTopics %}
                    <li>
                        <a href="{{ url("topics/") ~ hotTopic.id }}" class="popover-with-html" data-content="{{ hotTopic.title }}">
                            {{ hotTopic.title }}
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>

    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title">友情社区</h3>
        </div>
        <div class="panel-body text-center" style="padding-top: 5px;">
            <a href="http://golangtc.com/" target="_blank" rel="nofollow" title="Golang 中国" style="padding: 3px;">
                <img src="/img/friends/golangcn.png" style="width:150px; margin: 3px 0;">
            </a>
            <a href="http://cnodejs.org/" target="_blank" rel="nofollow" title="CNode：Node.js 中文社区" style="padding: 3px;">
                <img src="/img/friends/cnodejs.png" style="width:150px; margin: 3px 0;">
            </a>
        </div>
    </div>
</div>
<div class="clearfix"></div>



