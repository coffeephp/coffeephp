<div class="panel panel-default corner-radius">
    <div class="panel-body text-center topic-author-box blog-info">

        <div class="image blog-cover">
            <a href="{{ url('blogs/') ~ blog.slug }}">
                <img class="avatar-112 avatar img-thumbnail" src="{{ blog.cover }}">
            </a>
        </div>
        <div class="blog-name">
            <h4><a href="">{{ blog.name }}</a></h4>
        </div>
        <div class="blog-description">
            {% if blog.description %}{{ blog.description }}{% else %}{{ blog.users.name }}的个人专栏{% endif %}
        </div>

        <hr>

        <a href="{{ url('blogs/') ~ blog.slug }}">
            <li class="list-group-item"><i class="text-md fa fa-list-ul"></i> &nbsp;专栏文章（{{ blog.articles.count() }}）</li>
        </a>

        {% if session.auth['id'] === blog.users_id %}
            <hr>
            <div class="follow-box">
                <a class="btn btn-info btn-block" href="{{ url('blogs/') ~ blog.id ~ '/edit' }}">
                    <i class="fa fa-edit"></i> 编辑专栏
                </a>
            </div>
        {% endif %}
    </div>
</div>