<div class="topic_create">

    <div class="col-md-8 main-col">

        <div class="reply-box form box-block">

            {#<div class="alert alert-warning">#}
            {#我们希望 Laravel China 能够成为拥有浓厚技术氛围的开发者社区，而实现这个目标，需要我们所有人的共同努力：友善，公平，尊重知识和事实。请严格遵守 - <a href="https://laravel-china.org/topics/3022">社区发帖和管理规范</a>#}
            {#</div>#}


            <form method="POST" action="{{ url("topics/") ~ topic.id }}" accept-charset="UTF-8" id="topic-create-form">
                <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>

                <div class="category-hint alert alert-warning category-3 " style="display:none">
                    社区公告，小朋友不要做坏事哦。
                </div>
                <div class="category-hint alert alert-warning category-4 " style="display:none">
                    新手问答，请仔细阅读 <a href="https://laravel-china.org/topics/535">关于《提问的智慧》</a>，质量太低的问题，不遵循规范，会被视为对用户的不尊重，管理员会做沉贴操作，沉贴后用户基本上看不到帖子。排版清晰，信息完整的，我们会为话题加精，加精后的帖子将会被推荐到网站首页、手机端首页、精华帖周报邮件、<a href="http://weibo.com/phphub">微博官方账号</a>。
                </div>
                <div class="category-hint alert alert-warning category-5 " style="display:none">
                    分享创造，分享知识，分享灵感，分享创意，分享美好的东西。排版清晰，内容精良的话，我们会为话题加精，加精后的帖子将会被推荐到网站首页、手机端首页、精华帖周报邮件、<a href="http://weibo.com/phphub">微博官方账号</a>。
                </div>
                <div class="category-hint alert alert-warning category-6 " style="display:none">
                    教程文章请存放在此分类下，转载请在文章中注明「转载于xxx」。
                </div>
                <div class="category-hint alert alert-warning category-7 " style="display:none">
                    管理员站务信息，此分类下帖子只有管理员和创始人可见
                </div>

                <div class="form-group">
                    <input class="form-control" id="topic-title" placeholder="" name="title" type="text" value="{{ topic.title }}">
                </div>

                {{ partial("topics/partials/composing_help_block") }}

                <div class="form-group">
                    <textarea class="form-control" rows="20" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 614px;" id="reply_content" placeholder="" name="body_original" cols="50">{{ topic.body_original }}</textarea>
                </div>

                <div class="form-group status-post-submit">
                    <input class="btn btn-primary" id="topic-create-submit" type="submit" value="发 布">
                </div>

                <div class="box preview markdown-body" id="preview-box">{{ topic.body }}</div>

            </form>

        </div>
    </div>

    <div class="col-md-4 side-bar">

        <div class="panel panel-default corner-radius help-box">
            <div class="panel-heading text-center">
                <h3 class="panel-title">以下类型的信息会污染我们的社区</h3>
            </div>
            <div class="panel-body">
                <ul class="list">
                    <li>请传播美好的事物，这里拒绝低俗、诋毁、谩骂等相关信息</li>
                    <li>请尽量分享技术相关的话题，谢绝发布社会, 政治等相关新闻</li>
                    <li>这里绝对不讨论任何有关盗版软件、音乐、电影如何获得的问题</li>
                </ul>
            </div>
        </div>

        <div class="panel panel-default corner-radius help-box">
            <div class="panel-heading text-center">
                <h3 class="panel-title">在高质量优秀社区的我们</h3>
            </div>
            <div class="panel-body">
                <ul class="list">
                    <li>分享生活见闻, 分享知识</li>
                    <li>接触新技术, 讨论技术解决方案</li>
                    <li>为自己的创业项目找合伙人, 遇见志同道合的人</li>
                    <li>自发线下聚会, 加强社交</li>
                    <li>发现更好工作机会</li>
                    <li>甚至是开始另一个神奇的开源项目</li>
                </ul>
            </div>
        </div>

    </div>
</div>