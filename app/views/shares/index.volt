<div class="col-md-9 topics-index main-col">
    <div class="panel panel-default">
        <div class="panel-heading">
            <ul class="list-inline topic-filter">
                <li class="popover-with-html" data-content="时间排序"><a href="{{ url('shares') }}" class="{% if currentOrder == 'new' %}active{% endif %}">最新</a></li>
                <li class="popover-with-html" data-content="点击排序"><a href="{{ url('shares/hot') }}" class="{% if currentOrder == 'hot' %}active{% endif %}">热门</a></li>
            </ul>

            <div class="clearfix"></div>
        </div>
        <div class="panel-body remove-padding-horizontal">
            <ul class="list-group row topic-list">
                {% for item in page.items %}
                    <li class="list-group-item">

                        <a class="reply_count_area hidden-xs pull-right" href="{{ item.url }}" target="_blank">
                            <div class="count_set">
                                <span class="count_of_visits" title="点击量">
                                   {{ item.clicks }}
                                </span>

                                <span class="count_seperator">|</span>

                                <abbr title="{{ item.created_at }}" class="timeago">{{ item.created_at }}</abbr>
                            </div>
                        </a>

                        <div class="avatar pull-left">
                            <a href="{{ url('users/') ~  item.users.id}}" title="{{ item.users.name }}">
                                <img class="media-object img-thumbnail avatar avatar-middle" alt="{{ item.users.name }}" src="{{ item.users.avatar ~ '?imageView2/1/w/60/h/60'}}"></a>
                        </div>

                        <div class="infos">
                            <div class="media-heading">
                                <span class="hidden-xs label label-primary">分享</span>
                                <a href="{{ item.url }}{% if strpos(item.url, '?') === false %}?{% else %}&{% endif %}hmsr=coffeephp.com&utm_medium=coffeephp.com&utm_source=coffeephp.com" title="{{ item.title }}" class="shares_clicks" data-sharesId="{{ item.id }}" target="_blank">
                                    {{ item.title }} ({{ sharesDomain[item.id] }})
                                </a>
                            </div>
                        </div>

                        <div>
                            {% if item.users_id == session.auth['id'] %}
                                <a id="topic-edit-button" href="/shares/{{ item.id }}/edit" data-content="编辑"><i class="fa fa-pencil-square-o"></i></a>
                            {% endif %}
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

{{ partial("layouts/partials/sidebar") }}