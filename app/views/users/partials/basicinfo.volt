<div class="box">

    <div class="padding-sm user-basic-info">
        <div style="">

            <div class="media">
                <div class="media-left">
                    <div class="image">
                        {% if session.auth['id'] == user.id %}
                            <a href="javascript:;" class="popover-with-html" data-content="修改头像">
                                <img class="media-object avatar-112 avatar img-thumbnail" src="{{ user.avatar }}">
                            </a>
                        {% else %}
                            <img class="media-object avatar-112 avatar img-thumbnail" src="{{ user.avatar }}">
                        {% endif %}
                    </div>
                </div>
                <div class="media-body">
                    <h3 class="media-heading">
                        {{ user.name }}
                    </h3>
                    <div class="item">

                    </div>
                    <div class="item">
                        第 {{ user.id }} 位会员
                    </div>
                    <div class="item number">
                        注册于 <span class="timeago">{{ user.created_at }}</span>
                    </div>

                    <div class="item number">
                        活跃于 <span class="timeago">{{ user.last_actived_at }}</span>
                    </div>

                </div>
            </div>

        </div>

        <hr>

        <div class="follow-info row">
            <div class="col-xs-4">
                <a class="counter" href="javascript:;">0</a>
                <a class="text" href="javascript:;">关注者</a>
            </div>
            <div class="col-xs-4">
                <a class="counter" href="javascript:;">{{ user.topics.count() }}</a>
                <a class="text" href="javascript:;">话题</a>
            </div>
            <div class="col-xs-4">
                <a class="counter" href="javascript:;">{{ user.replies.count() }}</a>
                <a class="text" href="javascript:;">评论</a>
            </div>
        </div>

        <hr>
        <div class="topic-author-box text-center">
            <ul class="list-inline">
                {% if user.github_name %}
                    <li class="popover-with-html" data-content="{{ user.github_name }}">
                        <a href="https://github.com/{{ user.github_name }}" target="_blank">
                            <i class="fa fa-github-alt"></i> GitHub
                        </a>
                    </li>
                {% endif %}

                {% if user.weibo_link %}
                    <li class="popover-with-html" data-content="{{ user.weibo_name }}">
                        <a href="{{ user.weibo_link }}" rel="nofollow" class="weibo" target="_blank"><i class="fa fa-weibo"></i> Weibo
                        </a>
                    </li>
                {% endif %}

                {% if user.twitter_account %}
                    <li class="popover-with-html" data-content="jsyzchen">
                        <a href="https://twitter.com/{{ user.twitter_account }}" rel="nofollow" class="twitter" target="_blank"><i class="fa fa-twitter"></i> Twitter
                        </a>
                    </li>
                {% endif %}

                {% if user.personal_website %}
                    <li class="popover-with-html" data-content="{{ user.personal_website }}">
                        <a href="{{ user.personal_website }}" rel="nofollow" target="_blank" class="url">
                            <i class="fa fa-globe"></i> Website
                        </a>
                    </li>
                {% endif %}

                {% if user.company %}
                    <li class="popover-with-html" data-content="{{ user.company }}">
                        <i class="fa fa-users"></i> 公司
                    </li>
                {% endif %}

                {% if user.city %}
                    <li class="popover-with-html" data-content="{{ user.city }}">
                        <i class="fa fa-map-marker"></i> 城市
                    </li>
                {% endif %}

            </ul>
        </div>

        <hr>

        {% if session.auth['id'] == user.id %}
            <a class="btn btn-primary btn-block" href="{{ url('users/') ~ session.auth['id'] ~ '/edit' }}" id="user-edit-button">
                <i class="fa fa-edit"></i> 编辑个人资料
            </a>
        {% endif %}



    </div>

</div>

{#<div class="box text-center">#}

            {#<div class="padding-sm user-basic-nav">#}
                {#<ul class="list-group">#}
                {#<a href="{{ url('/users/') ~ user.id ~ '/topics'}}" class="">#}
                        {#<li class="list-group-item">#}
                            {#<i class="text-md fa fa-list-ul"></i> Ta 发布的话题#}
                        {#</li>#}
                    {#</a>#}

                    {#<a href="{{ url('/users/') ~ user.id ~ '/replies'}}" class="">#}
                        {#<li class="list-group-item">#}
                            {#<i class="text-md fa fa-comment"></i> Ta 发表的回复#}
                        {#</li>#}
                    {#</a>#}

                    {#<a href="{{ url('/users/') ~ user.id ~ '/following'}}" class="">#}
                        {#<li class="list-group-item">#}
                            {#<i class="text-md fa fa-eye"></i> Ta 关注的用户#}
                        {#</li>#}
                    {#</a>#}

                    {#<a href="{{ url('/users/') ~ user.id ~ '/votes'}}" class="">#}
                        {#<li class="list-group-item">#}
                            {#<i class="text-md fa fa-thumbs-up"></i> Ta 赞过的话题#}
                        {#</li>#}
                    {#</a>#}

                {#</ul>#}
            {#</div>#}

        {#</div>#}