{#<div class="container">#}
    {#<div class="col-md-9" style="padding-left: 0px;">#}
        {#<div class="panel panel-default">#}
            {#<div class="panel-heading">#}
                {#<h1 class="panel-title topic-title">{{ topic.title }}</h1>#}
            {#</div>#}

            {#<div class="panel-body">#}
                {#<div class="markdown-body">#}
                    {#{{ topic.body }}#}
                {#</div>#}
            {#</div>#}
        {#</div>#}
    {#</div>#}

    {#<div class="col-md-3" style="padding-right: 0px;">#}
        {#<div class="panel panel-default">#}
            {#<div class="panel-heading">#}
                {#<h3 class="panel-title">作者</h3>#}
            {#</div>#}
            {#<div class="panel-body">#}
                {#jsyzchen#}
            {#</div>#}
        {#</div>#}
    {#</div>#}
{#</div>#}
<div class="col-md-9 topics-show main-col">
    <!-- Topic Detial -->
    <div class="topic panel panel-default">
        <div class="infos panel-heading">

            <h1 class="panel-title topic-title">{{ topic.title }}</h1>

            <div class="meta inline-block">

                <a href="javascript:;" class="remove-padding-left">
                    <i class="fa fa-folder text-md" aria-hidden="true"></i> {{ topic.categories.name }}
                </a>
                ⋅
                <a class="author" href="{{ url('users/') ~  topic.users.id}}">
                    {{ topic.users.name }}
                </a>

                ⋅
                于 <abbr title="{{ topic.created_at }}" class="timeago">{{ topic.created_at }}</abbr>
                ⋅

                {% if replies.count() %}
                    {% set lastReplies = replies.getLast() %}
                        最后回复由
                        <a href="{{ url('users/') ~  lastReplies.users.id}}">
                            {{ lastReplies.users.name }}
                        </a>
                        于 <abbr title="{{ lastReplies.created_at }}" class="timeago">{{ lastReplies.created_at }}</abbr>
                    ⋅
                {% endif %}

                {{ topic.number_views }} 阅读
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="content-body entry-content panel-body ">

            <div class="markdown-body" id="emojify">
                {{ topic.body }}
            </div>
            {% if topic.is_excellent %}
            <div data-lang-excellent="本帖已被设为精华帖！" data-lang-wiki="本帖已被设为社区 Wiki！" class="ribbon-container">
                <div class="ribbon">
                    <div class="ribbon-excellent">
                        <i class="fa fa-trophy"></i> 本帖已被设为精华帖！
                    </div>
                </div>
            </div>
            {% endif %}
        </div>
        <div class="appends-container" data-lang-append="附言">
        </div>
        <div class="panel-footer operate">

            <div class="pull-left hidden-xs">
                <div class="social-share-cs share-component social-share">
                </div>
            </div>

            {#<div class="pull-right actions">#}


                {#<a id="topic-append-button" href="javascript:void(0);" class="admin  popover-with-html" data-toggle="modal" data-target="#exampleModal" data-content="帖子附言，添加附言后所有参与讨论的用户都能收到消息提醒，包括点赞和评论的用户" data-original-title="" title="">#}
                    {#<i class="fa fa-plus"></i>#}
                {#</a>#}

                {#<a id="topic-edit-button" href="https://laravel-china.org/topics/2100/edit" data-content="编辑" class="admin  popover-with-html" data-original-title="" title="">#}
                    {#<i class="fa fa-pencil-square-o"></i>#}
                {#</a>#}

            {#</div>#}
            <div class="clearfix"></div>
        </div>


        <div class="modal fade" id="exampleModal" tabindex="-1" role="" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">添加附言</h4>
                    </div>

                    <form method="POST" action="https://laravel-china.org/topics/2100/append" accept-charset="UTF-8">
                        <input type="hidden" name="_token" value="EpU61sAkaBvgTC15mD6K1mK4fThIu4KThvUUiKAY"><div class="modal-body">

                            <div class="alert alert-warning">
                                附加内容, 使用此功能的话, 会给所有参加过讨论的人发送提醒.
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" style="min-height: 20px; overflow: hidden; word-wrap: break-word; resize: horizontal; height: 164px;" placeholder="请使用 Markdown 格式书写 ;-)" name="content" cols="50" rows="10"></textarea>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>


    <div class="votes-container panel panel-default padding-md">
        <div class="panel-body vote-box text-center">
            <div class="btn-group">
                <a data-ajax="post" href="javascript:void(0);" data-url="/topics/{{ topic.id }}/upvote" id="up-vote" class="vote btn btn-primary btn-inverted {% if isVoted %}active{% endif %}" data-original-title="Up Vote">
                    {% if isVoted %}
                        已赞过
                    {% else %}
                        <i class="fa fa-thumbs-up" aria-hidden="true"></i>点赞
                    {% endif %}
                </a>
            </div>

            <div class="voted-users">
                <div class="user-lists">
                    {% for topicsVote in topicsVotes %}
                    <a href="{{ url('users/') ~ topicsVote.users.id }}" data-userid="{{ topicsVote.users.id }}">
                        <img class="img-thumbnail avatar avatar-middle" src="{{ topicsVote.users.avatar }}" style="width:48px;height:48px;">
                    </a>
                    {% endfor %}
                </div>
                <a class="voted-template" href="" data-userid="" style="display:none">
                    <img class="img-thumbnail avatar avatar-middle" src="" style="width:48px;height:48px;">
                </a>
            </div>
        </div>
    </div>

    <!-- Reply List -->
    <div class="replies panel panel-default list-panel replies-index">
        <div class="panel-heading">
            <div class="total">回复数量: <b>{{ topic.number_replies }}</b> </div>
        </div>

        <div class="panel-body">

            <ul class="list-group row">
                {% for reply in replies %}
                    {% if loop.last %}
                        <a name="last-reply" class="anchor" href="#last-reply" aria-hidden="true"></a>
                    {% endif %}
                    <li class="list-group-item media" style="margin-top: 0px;">

                        <div class="avatar pull-left">
                            <a href="{{ url('users/') ~ reply.users_id }}">
                                <img class="media-object img-thumbnail avatar avatar-middle" alt="xcaptain" src="{{ reply.users.avatar }}" style="width:48px;height:48px;">
                            </a>
                        </div>

                        <div class="infos">

                            <div class="media-heading">

                                <a href="{{ url('users/') ~ reply.users_id }}" title="xcaptain" class="remove-padding-left author">
                                    {{ reply.users.name }}
                                </a>



                                <span class="operate pull-right">

                    <a class="comment-vote" data-ajax="post" id="reply-up-vote-{{ reply.id }}" href="javascript:void(0);" data-url="/replies/{{ reply.id }}/upvote" title="Vote Up">
             <i class="fa fa-thumbs-o-up" style="font-size:14px;"></i> <span class="vote-count">{% if reply.repliesVotes.count() %}{{ reply.repliesVotes.count() }}{% endif %}</span>
          </a>
          <span> ⋅  </span>

                    <a class="fa fa-reply" href="javascript:void(0)" onclick="replyOne('{{ reply.users.name }}');" title="回复 {{ reply.users.name }}"></a>
        </span>

                                <div class="meta">
                                    <a name="reply{{ loop.index }}" class="anchor" href="#reply{{ loop.index }}" aria-hidden="true">#{{ loop.index }}</a>


                                    <span> ⋅  </span>
                                    <abbr class="timeago" title="{{ reply.created_at }}">{{ reply.created_at }}</abbr>

                                </div>

                            </div>

                            <div class="media-body markdown-reply content-body">
                                {{ reply.body }}
                            </div>

                        </div>

                    </li>
                {% endfor %}
            </ul>
            <div id="replies-empty-block" class="empty-block hide">暂无评论~~</div>

            <!-- Pager -->
            <div class="pull-right" style="padding-right:20px">

            </div>
        </div>
    </div>

    <!-- Reply Box -->
    <div class="reply-box form box-block">
        <form method="POST" action="{{ url('replies') }}" accept-charset="UTF-8" id="reply-form">
            <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
            <input type="hidden" name="topics_id" value="{{ topic.id }}">
            <div id="reply_notice" class="box">
                <ul class="helpblock list">
                    <li>请注意单词拼写，以及中英文排版</li>
                    <li>支持 Markdown 格式, <strong>**粗体**</strong>、~~删除线~~、<code>`单行代码`</code>, 更多语法请见这里 <a href="https://github.com/riku/Markdown-Syntax-CN/blob/master/syntax.md">Markdown 语法</a></li>
                    <li>支持Emoji表情，在输入的时候只需要 ":" 就可以自动提示了</li>
                    <li>上传图片, 支持拖拽和剪切板黏贴上传, 格式限制 - jpg, png, gif</li>
                    <li>发布框支持本地存储功能，会在内容变更时保存，「提交」按钮点击时清空</li>
                </ul>
            </div>

            <div class="form-group">
                {% if session.auth['id'] %}
                    <textarea class="form-control" rows="5" placeholder="请使用 Markdown 格式书写 ;-)" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 164px;" id="reply_content" name="body_original" cols="50"></textarea>
                {% else %}
                    <textarea class="form-control" disabled="disabled" rows="5" placeholder="需要登录才能发表评论." name="body" cols="50"></textarea>
                {% endif %}
            </div>

            <div class="form-group reply-post-submit">
                <input class="btn btn-primary {% if !session.auth['id'] %}disabled{% endif %}" id="reply-create-submit" type="submit" value="回复"><span class="help-inline" title="Or Command + Enter">Ctrl+Enter</span>
            </div>

            <div class="box preview markdown-reply" id="preview-box" style="display:none;"></div>

        </form>
    </div>


</div>


{{ partial("topics/partials/sidebar") }}

<div class="clearfix"></div>

<div class="banner-container rbs row"></div>


