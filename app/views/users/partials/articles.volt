<ul class="list-group">
    {% for article in articles %}
        <li class="list-group-item">
            <a href="{{ url('articles/') ~ article.id }}" title="{{ article.title }}">
                {{ article.title }}
            </a>

            <span class="meta">
                {{ article.votes_up }} 点赞
                <span> ⋅ </span>
                {{ article.number_replies }} 回复
                <span> ⋅ </span>
                <span class="timeago">{{ article.created_at }}</span>
            </span>
        </li>
        {% if loop.index == 20 %}{% break %}{% endif %}
    {% endfor %}
</ul>
