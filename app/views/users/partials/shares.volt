<ul class="list-group">
    {% for share in shares %}
        <li class="list-group-item">
            <a href="{{ share.url }}{% if strpos(share.url, '?') === false %}?{% else %}&{% endif %}utm_source=coffeephp.com" title="{{ share.title }}" target="_blank">
                {{ share.title }}
            </a>

            <span class="meta">
                {{ share.clicks }} 点击
                <span> ⋅ </span>
                <span class="timeago">{{ share.created_at }}</span>
            </span>
        </li>
        {% if loop.index == 20 %}{% break %}{% endif %}
    {% endfor %}
</ul>
