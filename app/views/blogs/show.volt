<div class="blog-pages">

    <div class="col-md-9 left-col pull-right">

        <div class="panel article-body article-index">

            <div class="panel-body">

                <h1 class="all-articles">
                    专栏文章

                    {% if session.auth['id'] === blog.users_id %}
                        <a href="{{ url('articles/create') }}" class="btn btn-primary pull-right no-pjax"> <i class="fa fa-paint-brush"></i> 创作文章</a>
                    {% endif %}
                </h1>

                {% if articles.count() %}
                    {{ partial("users/partials/articles") }}
                {% else %}
                    <div class="empty-block">该专栏还没有文章~~</div>
                {% endif %}
            </div>

        </div>

    </div>


    <div class="col-md-3 main-col pull-left">
        {{ partial("blogs/partials/info") }}
        {{ partial("blogs/partials/blog_author_box") }}
    </div>

</div>