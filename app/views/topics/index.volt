{#<div class="container">#}
    {#<div class="col-md-9" style="padding-left: 0px;">#}
        {#<div class="panel panel-default">#}
            {#<div class="panel-heading">#}
                {#<h3 class="panel-title">所有话题</h3>#}
            {#</div>#}
            {#<ul class="list-group row topic-list">#}
                {#{% for item in page.items %}#}
                    {#<li class="list-group-item" style="margin-top: 0px;">#}
                            {#<a href="{{ url("topics/" ~ item.id) }}" class=""><span class="badge">{{ item.reply_count }}</span>{{ item.title }}</a>#}
                    {#</li>#}
                {#{% endfor %}#}
            {#</ul>#}


            {#<div class="panel-footer" style="text-align: right;padding-bottom: 0px;padding-top: 0px;">#}
                {#<nav>#}
                    {#<ul class="pagination">#}
                        {#<li><a href="#">&laquo;</a></li>#}
                        {#<li><a href="#">1</a></li>#}
                        {#<li><a href="#">2</a></li>#}
                        {#<li><a href="#">3</a></li>#}
                        {#<li><a href="#">4</a></li>#}
                        {#<li><a href="#">5</a></li>#}
                        {#<li><a href="#">&raquo;</a></li>#}
                    {#</ul>#}
                {#</nav>#}
            {#</div>#}
        {#</div>#}
    {#</div>#}
    {#<div class="col-md-3" style="padding-right: 0px;">#}
        {#<div class="panel panel-default">#}
            {#<div class="panel-heading">#}
                {#<h3 class="panel-title">新建</h3>#}
            {#</div>#}
            {#<div class="panel-body">#}
                {#<a href="{{ url("topics/create") }}" class="btn btn-primary btn-lg btn-block" role="button">新 建 话 题</a>#}
            {#</div>#}
        {#</div>#}
    {#</div>#}
{#</div>#}


<div class="col-md-9 topics-index main-col">
    <div class="panel panel-default">

        <div class="panel-heading">

            <ul class="list-inline topic-filter">
                <li class="popover-with-html" data-content="最后创建排序"><a href="{{ url('topics') }}" class="active">最新</a></li>
                {#<li class="popover-with-html" data-content="最后回复排序"><a href="https://laravel-china.org/topics?filter=default" class="active">活跃</a></li>#}
                {#<li class="popover-with-html" data-content="只看加精的话题"><a href="https://laravel-china.org/topics?filter=excellent">精华</a></li>#}
                {#<li class="popover-with-html" data-content="点赞数排序"><a href="https://laravel-china.org/topics?filter=vote">投票</a></li>#}
                {#<li class="popover-with-html" data-content="发布时间排序"><a href="https://laravel-china.org/topics?filter=recent">最近</a></li>#}
                {#<li class="popover-with-html" data-content="无人问津的话题"><a href="https://laravel-china.org/topics?filter=noreply">零回复</a></li>#}
            </ul>

            <div class="clearfix"></div>
        </div>


        <div class="panel-body remove-padding-horizontal">
            <ul class="list-group row topic-list">

                {#<li class="list-group-item media" style="margin-top: 0px;">#}

                    {#<a class="reply_last_time hidden-xs" href="https://laravel-china.org/topics/3383">#}
                        {#<img class="user_small_avatar avatar-circle" src="https://dn-phphub.qbox.me/uploads/avatars/5303_1470682385.jpeg?imageView2/1/w/100/h/100">#}

                        {#<span class="timeago popover-with-html" data-content="2016-12-20 17:54:03" data-original-title="" title="">4小时前</span>#}
                    {#</a>#}

                    {#<div class="avatar pull-left">#}
                        {#<a href="https://laravel-china.org/users/1">#}
                            {#<img class="media-object img-thumbnail avatar avatar-middle" alt="Summer" src="https://dn-phphub.qbox.me/uploads/avatars/1_1479342408.png?imageView2/1/w/100/h/100">#}
                        {#</a>#}
                    {#</div>#}

                    {#<div class="reply_count_area hidden-xs">#}
                        {#<div class="count_of_votes" title="投票数">#}
                            {#126#}
                        {#</div>#}
                        {#<div class="count_set">#}
                {#<span class="count_of_replies" title="回复数">#}
                  {#73#}
                {#</span>#}
                            {#<span class="count_seperator">/</span>#}
                            {#<span class="count_of_visits" title="查看数">#}
                  {#11950#}
                {#</span>#}
                        {#</div>#}
                    {#</div>#}

                    {#<div class="infos">#}

                        {#<div class="media-heading">#}

                            {#<span class="hidden-xs label label-warning">置顶</span>#}

                            {#<a href="https://laravel-china.org/topics/3383" title="Laravel 第一部中文新手书籍《Laravel 入门教程》">#}
                                {#Laravel 第一部中文新手书籍《Laravel 入门教程》#}
                            {#</a>#}
                        {#</div>#}

                    {#</div>#}

                {#</li>#}

                {% for item in page.items %}
                    {#<li class="list-group-item media" style="margin-top: 0px;">#}

                        {#<a class="reply_last_time hidden-xs" href="{{ url("topics/" ~ item.id) }}">#}
                            {#<img class="user_small_avatar avatar-circle" src="{{ item.lastReplyUsers.avatar }}">#}

                            {#<span class="timeago popover-with-html" data-content="{{ item.lastReplyUsers.created_at }}" data-original-title="" title="">{{ item.lastReplyUsers.created_at }}</span>#}
                        {#</a>#}

                        {#<div class="avatar pull-left">#}
                            {#<a href="{{ url('users/') ~  item.users.id}}">#}
                                {#<img class="media-object img-thumbnail avatar avatar-middle" alt="maimai" src="{{ item.users.avatar }}">#}
                            {#</a>#}
                        {#</div>#}

                        {#<div class="reply_count_area hidden-xs">#}
                            {#<div class="count_of_votes" title="投票数">#}
                                {#{{ item.votes_up }}#}
                            {#</div>#}
                            {#<div class="count_set">#}
                                {#<span class="count_of_replies" title="回复数">#}
                                  {#{{ item.number_replies }}#}
                                {#</span>#}
                                {#<span class="count_seperator">/</span>#}
                                {#<span class="count_of_visits" title="查看数">#}
                                  {#{{ item.number_views }}#}
                                {#</span>#}
                            {#</div>#}
                        {#</div>#}

                        {#<div class="infos">#}

                            {#<div class="media-heading">#}

                                {#<span class="hidden-xs label label-default">{{ item.categories.name }}</span>#}

                                {#<a href="{{ url("topics/" ~ item.id) }}" title="{{ item.title }}">#}
                                    {#{{ item.title }}#}
                                {#</a>#}
                            {#</div>#}

                        {#</div>#}

                    {#</li>#}

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

    {#<div class="panel panel-default corner-radius" style="#}
{#text-align: center;#}
{#background-color: transparent;#}
{#border: none;#}
{#">#}
        {#<a href="https://laravel-china.org/topics/3383" rel="nofollow" title="" style="">#}
            {#<img src="https://dn-phphub.qbox.me/uploads/images/201612/09/1/qASrRyKNj0.jpg" style="width: 100%;border-radius: 0px;box-shadow: none;border: 1px solid #ffafaf;"></a>#}
    {#</div>#}

    {#<div class="panel panel-default corner-radius" style="#}
{#text-align: center;#}
{#background-color: transparent;#}
{#border: none;#}
{#">#}
        {#<a href="https://laravel-china.org/topics/3213" rel="nofollow" title="" style="">#}
            {#<img src="https://dn-phphub.qbox.me/uploads/images/201612/09/1/06fkozmGAH.jpg" style="width: 100%;border-radius: 0px;box-shadow: none;border: 1px solid #e2e1e1;"></a>#}
    {#</div>#}



    {#<div class="panel panel-default corner-radius sidebar-resources">#}
        {#<div class="panel-heading text-center">#}
            {#<h3 class="panel-title">推荐资源</h3>#}
        {#</div>#}
        {#<div class="panel-body">#}
            {#<ul class="list list-group ">#}
                {#<li class="list-group-item ">#}
                    {#<a href="https://laravel-china.org/docs/home" class="popover-with-html no-pjax" data-content="Laravel 中文文档" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/ql9XtosRhTe4v8HVC3TV.jpg">#}
                        {#Laravel 中文文档#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="https://lumen.laravel-china.org" class="popover-with-html no-pjax" data-content="Lumen 中文文档" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/bcMFkfsJZpetLgKFwWqY.jpg">#}
                        {#Lumen 中文文档#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="https://cs.laravel-china.org/" class="popover-with-html no-pjax" data-content="Laravel 速查表" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/cV55gsrH70qz6VdKr502.jpg">#}
                        {#Laravel 速查表#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="http://laravel.so/" class="popover-with-html no-pjax" data-content="Laravel.so 实战技巧" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/ROHXvR4OQwsX4spfOK33.png">#}
                        {#Laravel.so 实战技巧#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="http://estgroupe.com/tickets/create" class="popover-with-html no-pjax" data-content="寻求技术合作？ " data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/v89tIQ6vjceA6g7JmrQB.png">#}
                        {#寻求技术合作？#}
                    {#</a>#}
                {#</li>#}
            {#</ul>#}
        {#</div>#}
    {#</div>#}

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



    {#<div class="panel panel-default corner-radius">#}
        {#<div class="panel-body text-center sidebar-sponsor-box">#}
            {#<a class="sidebar-sponsor-link" href="http://www.ucloud.cn/site/seo.html?utm_source=zanzhu&amp;utm_campaign=phphub&amp;utm_medium=display&amp;utm_content=shengji&amp;ytag=phphubshenji" target="_blank">#}
                {#<img src="https://dn-phphub.qbox.me/uploads/banners/IHfTLiWaKJ4CmUL4Tfbc.jpg" class="popover-with-html" data-content="UCloud" width="100%" data-original-title="" title="">#}
            {#</a>#}
        {#</div>#}
    {#</div>#}

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



    {#<div class="panel panel-default corner-radius">#}
        {#<div class="panel-heading text-center">#}
            {#<h3 class="panel-title">App 下载</h3>#}
        {#</div>#}
        {#<div class="panel-body text-center" style="padding: 7px;">#}
            {#<a href="https://laravel-china.org/topics/1531" target="_blank" rel="nofollow" title="">#}
                {#<img src="https://dn-phphub.qbox.me/uploads/images/201512/08/1/cziZFHqkm8.png" style="width:240px;">#}
            {#</a>#}
        {#</div>#}
    {#</div>#}



    {#<div class="box text-center">#}
        {#<p style="margin-bottom: 10px;margin-top: 10px;">订阅 Laravel 资讯</p>#}
        {#<img class="image-border popover-with-html" data-content="扫码，或者搜索微信订阅号：「Laravel资讯」" src="https://dn-phphub.qbox.me/uploads/images/201612/15/1/MGig6IACCQ.png" style="width:80%" data-original-title="" title="">#}
        {#<br><br>#}
    {#</div>#}


    {#<div class="panel panel-default corner-radius" style="color:#a5a5a5">#}
        {#<div class="panel-body text-center">#}
            {#<a href="http://estgroupe.com/" style="color:#a5a5a5">#}
                {#<img src="https://dn-phphub.qbox.me/uploads/images/201612/12/1/iq7WQc2iuW.png" style="width: 20px;margin-right: 4px;margin-top: -4px;">#}
                {#<span style="margin-top: 7px;display: inline-block;">#}
          {#优帆远扬 - 创造不息，交付不止#}
      {#</span>#}
            {#</a>#}
        {#</div>#}

    {#</div>#}

</div>
<div class="clearfix"></div>



