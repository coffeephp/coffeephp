<div class="blog-pages">

    <div class="col-md-9 left-col pull-right">

        <div class="panel article-body content-body">

            <div class="panel-body">

                <h1 class="text-center">
                    {{ article.title }}
                </h1>

                <div class="article-meta text-center">
                    <i class="fa fa-clock-o"></i> <abbr title="{{ article.created_at }}" class="timeago">{{ article.created_at }}</abbr>
                    ⋅
                    <i class="fa fa-eye"></i> {{ article.number_views }}
                    ⋅
                    <i class="fa fa-thumbs-o-up"></i> {{ article.votes_up }}
                    ⋅
                    <i class="fa fa-comments-o"></i> {{ article.number_replies }}

                </div>

                <div class="entry-content">
                    <div class="markdown-body" id="emojify">
                        {{ article.body }}
                    </div>
                </div>


                <div class="post-info-panel">
                    <p class="info">
                        <label class="info-title">版权声明：</label><i class="fa fa-fw fa-creative-commons"></i>自由转载-非商用-非衍生-保持署名（<a href="https://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh">创意共享3.0许可证</a>）
                    </p>
                </div>
                <br>
                <br>

                <div class="panel-footer operate">

                    <div class="pull-left hidden-xs">
                        <div class="social-share-cs share-component social-share">
                        </div>
                    </div>

                    <div class="pull-right actions">
                        {% if article.users_id == session.auth['id'] %}
                            <a id="topic-edit-button" href="/articles/{{ article.id }}/edit" data-content="编辑" class="admin  popover-with-html no-pjax"><i class="fa fa-pencil-square-o"></i></a>
                        {% endif %}
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>

        <div class="votes-container panel panel-default padding-md">
            <div class="panel-body vote-box text-center">
                <div class="btn-group">
                    <a data-ajax="post" href="javascript:void(0);" data-url="/articles/{{ article.id }}/upvote" id="up-vote" class="vote btn btn-primary btn-inverted {% if isVoted %}active{% endif %}" data-original-title="Up Vote">
                        {% if isVoted %}
                            已赞过
                        {% else %}
                            <i class="fa fa-thumbs-up" aria-hidden="true"></i>点赞
                        {% endif %}
                    </a>
                </div>

                <div class="voted-users">
                    {% if articleVotes.count() %}
                        <div class="user-lists">
                            {% for articleVote in articleVotes %}
                                <a href="{{ url('users/') ~ articleVote.users.id }}" data-userid="{{ articleVote.users.id }}">
                                    <img class="img-thumbnail avatar avatar-middle" src="{{ articleVote.users.avatar }}" style="width:48px;height:48px;">
                                </a>
                            {% endfor %}
                        </div>
                    {% else %}
                        <div class="user-lists"></div>
                        <div class="vote-hint">
                            成为第一个点赞的人吧 <img title=":bowtie:" alt=":bowtie:" class="emoji" src="https://dn-phphub.qbox.me/assets/images/emoji/bowtie.png" align="absmiddle"></img>
                        </div>
                    {% endif %}
                    <a class="voted-template" href="" data-userid="" style="display:none">
                        <img class="img-thumbnail avatar avatar-middle" src="" style="width:48px;height:48px;">
                    </a>
                </div>
            </div>
        </div>

        <!-- Reply List -->
        <div class="replies panel panel-default list-panel replies-index">
            <div class="panel-heading">
                <div class="total">回复数量: <b>{{ article.number_replies }}</b> </div>
            </div>

            <div class="panel-body">
                {% if replies.count() %}
                    <ul class="list-group row">
                        {% for reply in replies %}
                            {% if loop.last %}
                                <a name="last-reply" class="anchor" href="#last-reply" aria-hidden="true"></a>
                            {% endif %}
                            <li class="list-group-item media" style="margin-top: 0px;">

                                <div class="avatar pull-left">
                                    <a href="{{ url('users/') ~ reply.users_id }}">
                                        <img class="media-object img-thumbnail avatar avatar-middle" alt="xcaptain" src="{{ reply.users.avatar}}" style="width:48px;height:48px;">
                                    </a>
                                </div>

                                <div class="infos">

                                    <div class="media-heading">

                                        <a href="{{ url('users/') ~ reply.users_id }}" title="xcaptain" class="remove-padding-left author">
                                            {{ reply.users.name }}
                                        </a>

                                        {% if reply.users.introduction %}
                                            <span class="introduction">{{ reply.users.introduction }}</span>
                                        {% endif %}

                                        <span class="operate pull-right">

                        <a class="comment-vote" data-ajax="post" id="reply-up-vote-{{ reply.id }}" href="javascript:void(0);" data-url="/articles-replies/{{ reply.id }}/upvote" title="Vote Up">
                 <i class="fa fa-thumbs-o-up" style="font-size:14px;"></i> <span class="vote-count">{% if reply.votes_up %}{{ reply.votes_up }}{% endif %}</span>
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
                {% else %}
                    <ul class="list-group row"></ul>
                    <div id="replies-empty-block" class="empty-block">暂无评论~~</div>
                {% endif %}
                <!-- Pager -->
                <div class="pull-right" style="padding-right:20px">

                </div>
            </div>
        </div>

        <!-- Reply Box -->
        <div class="reply-box form box-block">
            <form method="POST" action="{{ url('articles-replies') }}" accept-charset="UTF-8" id="reply-form">
                <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
                <input type="hidden" name="articles_id" value="{{ article.id }}">

                {{ partial("topics/partials/composing_help_block") }}

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

    <div class="col-md-3 main-col pull-left">
        {{ partial("blogs/partials/info") }}

        <div id="sticker">
            <div class="panel panel-default corner-radius">

                <div class="panel-heading text-center">
                    <h3 class="panel-title">作者：{{ article.users.name }}</h3>
                </div>

                <div class="panel-body text-center topic-author-box">
                    {{ partial("articles/partials/article_author_box") }}
                </div>
            </div>
        </div>
    </div>

</div>


