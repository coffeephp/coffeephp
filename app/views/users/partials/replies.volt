<ul class="list-group">
    {% for reply in replies %}
        <li class="list-group-item">

            <a href="{{ url('topics/') ~ reply.topics_id }}" title="{{ reply.topics.title }}" class="remove-padding-left">
                {{ reply.topics.title }}
            </a>
            <span class="meta">
             at <span class="timeago" title="{{ reply.created_at }}">{{ reply.created_at }}</span>
            </span>

            <div class="reply-body markdown-reply content-body">
                {{ reply.body }}
            </div>
        </li>
        {% if loop.index == 20 %}{% break %}{% endif %}
    {% endfor %}
</ul>