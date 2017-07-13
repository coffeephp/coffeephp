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

        <div class="content-body entry-content panel-body">

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

            <div class="pull-right actions">
                {% if topic.users_id == session.auth['id'] %}
                    <a id="topic-edit-button" href="/topics/{{ topic.id }}/edit" data-content="编辑" class="admin  popover-with-html no-pjax"><i class="fa fa-pencil-square-o"></i></a>
                {% endif %}
            </div>
            <div class="clearfix"></div>
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
                {% if topicsVotes.count() %}
                    <div class="user-lists">
                        {% for topicsVote in topicsVotes %}
                        <a href="{{ url('users/') ~ topicsVote.users.id }}" data-userid="{{ topicsVote.users.id }}">
                            <img class="img-thumbnail avatar avatar-middle" src="{{ topicsVote.users.avatar }}" style="width:48px;height:48px;">
                        </a>
                        {% endfor %}
                    </div>
                {% else %}
                    <div class="user-lists">

                    </div>
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
            <div class="total">回复数量: <b>{{ topic.number_replies }}</b> </div>
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
                                    <img class="media-object img-thumbnail avatar avatar-middle" alt="xcaptain" src="{{ reply.users.avatar  ~ '&s=60'}}" style="width:48px;height:48px;">
                                </a>
                            </div>

                            <div class="infos">

                                <div class="media-heading">

                                    <a href="{{ url('users/') ~ reply.users_id }}" title="xcaptain" class="remove-padding-left author">
                                        {{ reply.users.name }}
                                    </a>



                                    <span class="operate pull-right">

                        <a class="comment-vote" data-ajax="post" id="reply-up-vote-{{ reply.id }}" href="javascript:void(0);" data-url="/topics-replies/{{ reply.id }}/upvote" title="Vote Up">
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
        <form method="POST" action="{{ url('topics-replies') }}" accept-charset="UTF-8" id="reply-form">
            <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
            <input type="hidden" name="topics_id" value="{{ topic.id }}">

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


{{ partial("topics/partials/sidebar") }}

<div class="clearfix"></div>

<div class="banner-container rbs row"></div>


