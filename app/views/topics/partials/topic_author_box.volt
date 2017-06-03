<div class="panel-body text-center topic-author-box">
    {% if session.auth['id'] === topic.users_id %}
        <a class="pull-right popover-with-html text-lg animated rubberBand edit-btn" href="{{ url('users/') ~ session.auth['id'] ~ '/edit' }}" data-content="编辑个人资料">
            <i class="fa fa-cog"></i>
        </a>
    {% endif %}

    <a href="{{ url('users/') ~ topic.users.id}}">
        <img src="{{ topic.users.avatar }}" style="width:80px; height:80px;margin:5px;" class="img-thumbnail avatar">
    </a>


    <div class="media-body padding-top-sm">
        {% if topic.users.introduction %}
            <div class="media-heading">
                <span class="introduction">
                     {{ topic.users.introduction }}
                </span>
            </div>
        {% endif %}

        <ul class="list-inline">
            {% if topic.users.github_name %}
                <li class="popover-with-html" data-content="{{ topic.users.github_name }}">
                    <a href="{% if topic.users.github_url %}{{ topic.users.github_url }}{% else %}https://github.com/{{ topic.users.github_name }}{% endif %}" target="_blank">
                        <i class="fa fa-github-alt"></i> GitHub
                    </a>
                </li>
            {% endif %}

            {% if topic.users.weibo_link %}
                <li class="popover-with-html" data-content="{{ topic.users.weibo_name }}">
                    <a href="{{ topic.users.weibo_link }}" rel="nofollow" class="weibo" target="_blank"><i class="fa fa-weibo"></i> Weibo
                    </a>
                </li>
            {% endif %}

            {% if topic.users.twitter_account %}
                <li class="popover-with-html" data-content="jsyzchen">
                    <a href="https://twitter.com/{{ topic.users.twitter_account }}" rel="nofollow" class="twitter" target="_blank"><i class="fa fa-twitter"></i> Twitter
                    </a>
                </li>
            {% endif %}

            {% if topic.users.personal_website %}
                <li class="popover-with-html" data-content="{{ topic.users.personal_website }}">
                    <a href="{{ topic.users.personal_website }}" rel="nofollow" target="_blank" class="url">
                        <i class="fa fa-globe"></i> Website
                    </a>
                </li>
            {% endif %}

            {% if topic.users.company %}
                <li class="popover-with-html" data-content="{{ topic.users.company }}">
                    <i class="fa fa-users"></i> 公司
                </li>
            {% endif %}

            {% if topic.users.city %}
                <li class="popover-with-html" data-content="{{ topic.users.city }}">
                    <i class="fa fa-map-marker"></i> 城市
                </li>
            {% endif %}
        </ul>
        <div class="clearfix"></div>
    </div>


</div>