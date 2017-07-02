<div class="users-show  row">

    <div class="col-md-3">
        {{ partial("users/partials/basicinfo") }}
    </div>

    <div class="main-col col-md-9 left-col">
        {% if user.introduction %}
            <div class="box text-center">{{ user.introduction }}</div>
        {% endif %}

        <div class="panel panel-default">
            <div class="panel-heading">
                最近分享
            </div>

            <div class="panel-body">
                {% if shares.count() %}
                    {{ partial("users/partials/shares") }}
                {% else %}
                    <div class="empty-block">还没有推荐分享呢~~</div>
                {% endif %}
            </div>
        </div>

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
                最近文章
            </div>

            <div class="panel-body">
                {% if articles.count() %}
                    {{ partial("users/partials/articles") }}
                {% else %}
                    <div class="empty-block">还没有发表文章呢~~</div>
                {% endif %}
            </div>
        </div>


        {#<div class="panel panel-default">#}
            {#<div class="panel-heading">#}
                {#最新评论#}
            {#</div>#}

            {#<div class="panel-body">#}
                {#{% if replies.count() %}#}
                    {#{{ partial("users/partials/replies") }}#}
                {#{% else %}#}
                    {#<div class="empty-block">还没有评论过呢~~</div>#}
                {#{% endif %}#}
            {#</div>#}
        {#</div>#}

    </div>


</div>





