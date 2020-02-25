<div class="panel panel-default list-panel search-results">
    <div class="panel-heading">
        <h3 class="panel-title ">
            <i class="fa fa-search"></i> 关于 “{{ query }}” 的搜索结果, 共 {{ page.total_items }} 条
        </h3>
    </div>

    <div class="panel-body ">
        {% if page.total_items %}
            {% for item in page.items %}
                <div class="result">
                    <h2 class="title">

                        <a href="{{ url("topics/" ~ item.id) }}" target="_blank">{{ item.title }}</a>

                        <small>by</small>

                        <a href="{{ url('users/') ~  item.users.id}}" title="{{ item.users.name }}">
                            <img class="avatar avatar-small" alt="{{ item.users.name }}" src="{{ item.users.avatar}}"/>
                            <small>{{ item.users.name }}</small>
                        </a>
                    </h2>
                    <div class="info">
                        <span class="date" title="Last Updated At">
                            {{ item.created_at }}
                              ⋅
                            <i class="fa fa-eye"></i> {{ item.number_views }}
                            <i class="fa fa-thumbs-up"></i> {{ item.votes_up }}
                            <i class="fa fa fa-reply"></i> {{ item.number_replies }}
                        </span>
                    </div>
                    <hr>
                </div>
            {% endfor %}
        {% else %}
            <div class="empty-block">咦，竟然没有搜到结果~~</div>
        {% endif %}
        {% if page.total_items%}
            <div class="panel-footer">
                {{ page.paginatorRender }}
            </div>
        {% endif %}
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function()
    {
        var query = '{{ query }}';
        var results = query.match(/("[^"]+"|[^"\s]+)/g);
        results.forEach(function(entry) {
            $('.search-results').highlight(entry);
        });
    });
</script>