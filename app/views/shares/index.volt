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
                                <span class="count_of_visits" title="点击量">
                                   {{ item.clicks }}
                                </span>

                                <span class="count_seperator">|</span>

                                <abbr title="{{ item.created_at }}" class="timeago">{{ item.created_at }}</abbr>
                            </div>
                        </a>

                        <div class="avatar pull-left">
                            <a href="{{ url('users/') ~  item.users.id}}" title="{{ item.users.name }}">
                                <img class="media-object img-thumbnail avatar avatar-middle" alt="{{ item.users.name }}" src="{{ item.users.avatar }}"></a>
                        </div>


                        <div class="infos">

                            <div class="media-heading">
                                {#{% if item.sticked == 1 %}#}
                                    {#<span class="hidden-xs label label-warning">置顶</span>#}
                                {#{% else %}#}
                                    {#<span class="hidden-xs label {% if item.is_excellent %}label-success{% else %}label-default{% endif %}">{{ item.categories.name }}</span>#}
                                {#{% endif %}#}
                                <span class="hidden-xs label label-primary">分享</span>
                                <a href="{{ item.url }}" title="{{ item.title }}" onclick="addClicks({{ item.id }})" target="_blank">
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

{{ partial("layouts/partials/sidebar") }}

<script>
    /**
     * 添加点击量
     * @param shares_id
     */
    function addClicks(shares_id)
    {
        if (!shares_id) {
            console.log('clicks fail!');
            return false;
        }

        $.ajax({
            type: "POST",
            url: "{{ url('shares/clicks') }}",
            data: "shares_id="+shares_id,
            dataType: "json",
            success: function(data){
                //console.log(data.msg);
            }
        });
    }
</script>