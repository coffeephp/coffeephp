<div class="panel panel-default corner-radius" style="padding-bottom: 20px;">

    <div class="panel-heading text-center">
        <h3 class="panel-title">专栏作者</h3>
    </div>

    <div class="panel-body text-center topic-author-box blog-info text-center">
        <a class="" href="{{ url('users/') ~ blog.users_id }}" title="{{ blog.users.name }}{% if blog.users.introduction %}-{{ blog.users.introduction }}{% endif %}">
            <img class="img-thumbnail avatar avatar-middle" alt="{{ blog.users.name }}" src="{{ blog.users.avatar }}"/>
        </a>
    </div>

</div>