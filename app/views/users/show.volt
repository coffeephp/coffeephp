<div class="users-show  row">

    <div class="col-md-3">
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
                {#<div class="follow-info row">#}
                    {#<div class="col-xs-4">#}
                        {#<a class="counter" href="https://laravel-china.org/users/4330/followers">1</a>#}
                        {#<a class="text" href="https://laravel-china.org/users/4330/followers">关注者</a>#}
                    {#</div>#}
                    {#<div class="col-xs-4">#}
                        {#<a class="counter" href="https://laravel-china.org/users/4330/replies">5</a>#}
                        {#<a class="text" href="https://laravel-china.org/users/4330/replies">评论</a>#}
                    {#</div>#}
                    {#<div class="col-xs-4">#}
                        {#<a class="counter" href="https://laravel-china.org/users/4330/topics">1</a>#}
                        {#<a class="text" href="https://laravel-china.org/users/4330/topics">话题</a>#}
                    {#</div>#}
                {#</div>#}

                <div class="follow-info row">
                    <div class="col-xs-6">
                        <a class="counter" href="javascript:;">{{ topics.count() }}</a>
                        <a class="text" href="javascript:;">话题</a>
                    </div>
                    <div class="col-xs-6">
                        <a class="counter" href="javascript:;">{{ replies.count() }}</a>
                        <a class="text" href="javascript:;">评论</a>
                    </div>
                </div>

                <hr>
                <div class="topic-author-box text-center">
                    <ul class="list-inline">
                        {% if user.github_name %}
                        <li class="popover-with-html" data-content="{{ user.github_name }}">
                            <a href="{% if user.github_url %}{{ user.github_url }}{% else %}https://github.com/{{ user.github_name }}{% endif %}" target="_blank">
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

                        {#{% if user.linkedin %}#}
                        {#<li class="popover-with-html" data-content="点击查看 LinkedIn 个人资料">#}
                            {#<a href="{{ user.linkedin }}" rel="nofollow" class="linkedin" target="_blank"><i class="fa fa-linkedin"></i> LinkedIn#}
                            {#</a>#}
                        {#</li>#}
                        {#{% endif %}#}

                        {% if user.personal_website %}
                        <li class="popover-with-html" data-content="{{ user.personal_website }}">
                            <a href="http://{{ user.personal_website }}" rel="nofollow" target="_blank" class="url">
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

        {#<div class="box text-center">#}
            {#<p style="margin-bottom: 10px;margin-top: 10px;"><a href="https://laravel-china.org/topics/1531">客户端</a> 登录二维码</p>#}
            {#<img style="height: 180px; width=180px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAIAAAAiOjnJAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEHklEQVR4nO3d0WobOxRA0Tb0/z853NcLLlSIs6WZsNZz7DjORiCkkX5/f3//gmlftz8AP5OwSAiLhLBICIuEsEgIi4SwSAiLhLBICIuEsEj8Wfy5r6+bCX6ulO99nr336V61twPgaf+LvzJikRAWCWGREBYJYZFYnRV+6vY0n5z17P0VK6/a+yv2Zo4P/F8YsUgIi4SwSAiLhLBI7M8KP02t3+1ZWZvbm3NNrfGtvPOUu/+LX0YsIsIiISwSwiIhLBKTs8K7VuZuK3OlqZ9Z8YPPkDJikRAWCWGREBYJYZF466yw2/l58n32nk98BSMWCWGREBYJYZEQFonJWeHJ+cvUXtAV3bkx3Td2fS5pxCIhLBLCIiEsEsIisT8rvHsS5oq9PaXP/5lPD/xfPO4D8TMIi4SwSAiLhLBI/L6+qDTl7urhnu4cm+uMWCSERUJYJIRFQlgkJu8rvDsL604TnTp/5uT9EVM3PH5yXyE3CYuEsEgIi4SwSOyvFZ5cZZua9UzNlU7ePn/3G9v+PEYsEsIiISwSwiIhLBLtGaQnn627u1K58pmn5mWvePbQiEVCWCSERUJYJIRFYn8H6dSt8d3N8id3vXY7Nld03+H+R5p6I/g/YZEQFglhkRAWiXYH6cndjyfXJfccfrLvn9JnIY1YJIRFQlgkhEVCWCQm1wqn3ufkXfPXT2UZeZ+p+d3grNmIRUJYJIRFQlgkhEVi8rnCbsfm3jN6J++Iv7tf9NPeJxz8Do1YJIRFQlgkhEVCWCRO7yCdetXzn0/8GWeimhXyLMIiISwSwiIhLBKrs8Kn3Q0x9c7dmuPU/O5ps+9FRiwSwiIhLBLCIiEsEpOzwpVXrTi5O/Rpn/DkU43OIOV9hEVCWCSERUJYJPZ3kH46eSLN3vs8zdRe2anftfKqRU//6nkpYZEQFglhkRAWifYW+0/pTOSf7/PGuyq6Jw3TM3OMWCSERUJYJIRFQlgk9neQ7ulOgHnjutvJ1cxubvtXRiwSwiIhLBLCIiEsEpM7SE/q1hx/ximg11dFjVgkhEVCWCSERUJYJPZvsT9p777CvVlPd4rO1Nrl3T2ubrHnJmGREBYJYZEQFon95wqf/7Rddw7n3rrb3dsJV7iZgqcTFglhkRAWCWGRmDxt5u4c5+6d9Xt/xd6K557DNxgasUgIi4SwSAiLhLBInD6DdMrJe9u73bMnz/BZ+e3WCnk6YZEQFglhkRAWibfOCvd0N0FM/fapldPrd0casUgIi4SwSAiLhLBITM4KTx5n2u0F7c5yObnHde+dBxmxSAiLhLBICIuEsEjszwrvnkq6p9sdujfnOjlTm5o1L3pfHLyCsEgIi4SwSAiLxFvvK+ThjFgkhEVCWCSERUJYJIRFQlgkhEVCWCSERUJYJIRF4j8DmkdmtrmF6gAAAABJRU5ErkJggg=="><br><br><form method="POST" action="https://laravel-china.org/users/regenerate_login_token" accept-charset="UTF-8">#}
                {#<input type="hidden" name="_token" value="EpU61sAkaBvgTC15mD6K1mK4fThIu4KThvUUiKAY"><div style="margin-bottom: 8px;color: #999;font-size: 0.9em;">登录失败请点击</div>#}
                {#<input class="btn btn-sm btn-default" style="margin-bottom: 13px;" id="topic-create-submit" type="submit" value="重新生成">#}
            {#</form>#}

        {#</div>#}
    </div>

    <div class="main-col col-md-9 left-col">
        {% if user.introduction %}
            <div class="box text-center">{{ user.introduction }}</div>
        {% endif %}

        <div class="panel panel-default">
            <div class="panel-heading">
                最近话题
            </div>

            <div class="panel-body">
                {% if topics.count() %}
                    {{ partial("users/partials/topics") }}
                {% else %}
                    <div class="empty-block">还没有发表话题呢~~</div>
                {% endif %}
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                最新评论
            </div>

            <div class="panel-body">
                {% if replies.count() %}
                    {{ partial("users/partials/replies") }}
                {% else %}
                    <div class="empty-block">还没有评论过呢~~</div>
                {% endif %}
            </div>
        </div>

    </div>


</div>





