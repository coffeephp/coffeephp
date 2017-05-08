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
                                <a href="{{ item.url }}" title="{{ item.title }}" class="shares_clicks" data-sharesId="{{ item.id }}" target="_blank">
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
    $(function() {
        //添加点击量
       $('.shares_clicks').click(function () {
           var sharesId = $(this).attr("data-sharesId");

           if (!sharesId) {
               console.log('add clicks fail!');
               return false;
           }

           var currentObj = $(this);

           $.ajax({
               type: "POST",
               url: "{{ url('shares/clicks') }}",
               data: "sharesId="+sharesId,
               dataType: "json",
               success: function(msg){
                   if (msg.status == 200) {
                       //修改页面的点击量
                       currentObj.parentsUntil('','li.list-group-item').find('.count_set .count_of_visits').text(msg.data.clicks);
                   }
               }
           });
       });
    });
</script>