
    
        
            
                
            

            
                
                    
                
            
        
    

    
        
            
                
            
            
                
            
        
    



<div class="col-md-9 topics-show main-col">
    <!-- Topic Detial -->
    <div class="topic panel panel-default">
        <div class="infos panel-heading">

            <h1 class="panel-title topic-title"><?= $topic->title ?></h1>

            <div class="meta inline-block">

                <a href="javascript:;" class="remove-padding-left">
                    <i class="fa fa-folder text-md" aria-hidden="true"></i> <?= $topic->categories->name ?>
                </a>
                ⋅
                <a class="author" href="<?= $this->url->get('users/') . $topic->users->id ?>">
                    <?= $topic->users->name ?>
                </a>

                ⋅
                于 <abbr title="<?= $topic->created_at ?>" class="timeago"><?= $topic->created_at ?></abbr>
                ⋅

                <?php if ($replies) { ?>
                    <?php foreach ($replies as $reply) { ?>
                        最后回复由
                        <a href="<?= $this->url->get('users/') . $reply->users->id ?>">
                            <?= $reply->users->name ?>
                        </a>
                        于 <abbr title="<?= $reply->created_at ?>" class="timeago"><?= $reply->created_at ?></abbr>
                        <?php break; ?>
                    <?php } ?>
                    ⋅
                <?php } ?>

                <?= $topic->number_views ?> 阅读
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="content-body entry-content panel-body ">

            <div class="markdown-body" id="emojify">
                <?= $topic->body ?>
            </div>

            
                
                    
                        
                    
                

            
        </div>
        <div class="appends-container" data-lang-append="附言">
        </div>
        <div class="panel-footer operate">

            <div class="pull-left hidden-xs">
                <div class="social-share-cs share-component social-share">
                </div>
            </div>

            


                
                    
                

                
                    
                

            
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


    

        

            

                
                    
                    
                

            

            

                
                    
                        
                

                
                    
            

        
    

    <!-- Reply List -->
    <div class="replies panel panel-default list-panel replies-index">
        <div class="panel-heading">
            <div class="total">回复数量: <b>12</b> </div>
        </div>

        <div class="panel-body">

            <ul class="list-group row">
                <?php $v11486020747979675951iterator = $replies; $v11486020747979675951incr = 0; $v11486020747979675951loop = new stdClass(); $v11486020747979675951loop->self = &$v11486020747979675951loop; $v11486020747979675951loop->length = count($v11486020747979675951iterator); $v11486020747979675951loop->index = 1; $v11486020747979675951loop->index0 = 1; $v11486020747979675951loop->revindex = $v11486020747979675951loop->length; $v11486020747979675951loop->revindex0 = $v11486020747979675951loop->length - 1; ?><?php foreach ($v11486020747979675951iterator as $reply) { ?><?php $v11486020747979675951loop->first = ($v11486020747979675951incr == 0); $v11486020747979675951loop->index = $v11486020747979675951incr + 1; $v11486020747979675951loop->index0 = $v11486020747979675951incr; $v11486020747979675951loop->revindex = $v11486020747979675951loop->length - $v11486020747979675951incr; $v11486020747979675951loop->revindex0 = $v11486020747979675951loop->length - ($v11486020747979675951incr + 1); $v11486020747979675951loop->last = ($v11486020747979675951incr == ($v11486020747979675951loop->length - 1)); ?>
                    
                        
                    
                <li class="list-group-item media" style="margin-top: 0px;">

                    <div class="avatar pull-left">
                        <a href="<?= $this->url->get('users/') . $reply->users_id ?>">
                            <img class="media-object img-thumbnail avatar avatar-middle" alt="xcaptain" src="<?= $reply->users->avatar ?>" style="width:48px;height:48px;">
                        </a>
                    </div>

                    <div class="infos">

                        <div class="media-heading">

                            <a href="<?= $this->url->get('users/') . $reply->users_id ?>" title="xcaptain" class="remove-padding-left author">
                                <?= $reply->users->name ?>
                            </a>



                            <span class="operate pull-right">

                <a class="comment-vote" data-ajax="post" id="reply-up-vote-<?= $reply->id ?>" href="javascript:void(0);" data-url="/replies/<?= $reply->id ?>/vote" title="Vote Up">
         <i class="fa fa-thumbs-o-up" style="font-size:14px;"></i> <span class="vote-count"></span>
      </a>
      <span> ⋅  </span>

                <a class="fa fa-reply" href="javascript:void(0)" onclick="replyOne('<?= $reply->users->name ?>');" title="回复 <?= $reply->users->name ?>"></a>
    </span>

                            <div class="meta">
                                <a name="reply<?= $v11486020747979675951loop->index ?>" class="anchor" href="#reply<?= $v11486020747979675951loop->index ?>" aria-hidden="true">#<?= $v11486020747979675951loop->index ?></a>


                                <span> ⋅  </span>
                                <abbr class="timeago" title="<?= $reply->created_at ?>"><?= $reply->created_at ?></abbr>

                            </div>

                        </div>

                        <div class="media-body markdown-reply content-body">
                            <?= $reply->body ?>
                        </div>

                    </div>

                </li>
                <?php $v11486020747979675951incr++; } ?>
            </ul>
            <div id="replies-empty-block" class="empty-block hide">暂无评论~~</div>

            <!-- Pager -->
            <div class="pull-right" style="padding-right:20px">

            </div>
        </div>
    </div>

    <!-- Reply Box -->
    <div class="reply-box form box-block">


        <form method="POST" action="<?= $this->url->get('replies') ?>" accept-charset="UTF-8" id="reply-form">
            <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>"/>
            <input type="hidden" name="topics_id" value="<?= $topic->id ?>">
            <div id="reply_notice" class="box">
                <ul class="helpblock list">
                    <li>请注意单词拼写，以及中英文排版，<a href="https://github.com/sparanoid/chinese-copywriting-guidelines">参考此页</a>
                    </li>
                    <li>支持 Markdown 格式, <strong>**粗体**</strong>、~~删除线~~、<code>`单行代码`</code>, 更多语法请见这里 <a href="https://github.com/riku/Markdown-Syntax-CN/blob/master/syntax.md">Markdown 语法</a>
                    </li>
                    <li>支持表情，使用方法请见 <a href="https://laravel-china.org/topics/45" target="_blank">Emoji 自动补全来咯</a>，可用的 Emoji 请见 <img title=":metal:" alt=":metal:" class="emoji" src="https://dn-phphub.qbox.me/assets/images/emoji/metal.png" align="absmiddle"></img> <img title=":point_right:" alt=":point_right:" class="emoji" src="https://dn-phphub.qbox.me/assets/images/emoji/point_right.png" align="absmiddle"></img> <a href="https://laravel-china.org/ecc/index.html" target="_blank" rel="nofollow"> Emoji 列表 </a> <img title=":star:" alt=":star:" class="emoji" src="https://dn-phphub.qbox.me/assets/images/emoji/star.png" align="absmiddle"></img> <img title=":sparkles:" alt=":sparkles:" class="emoji" src="https://dn-phphub.qbox.me/assets/images/emoji/sparkles.png" align="absmiddle"></img> </li>
                    <li>上传图片, 支持拖拽和剪切板黏贴上传, 格式限制 - jpg, png, gif</li>
                    <li>发布框支持本地存储功能，会在内容变更时保存，「提交」按钮点击时清空</li>
                </ul>
            </div>

            <div class="form-group">
                <?php if ($this->session->auth['id']) { ?>
                    <textarea class="form-control" rows="5" placeholder="请使用 Markdown 格式书写 ;-)" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 164px;" id="reply_content" name="body_original" cols="50"></textarea>
                <?php } else { ?>
                    <textarea class="form-control" disabled="disabled" rows="5" placeholder="需要登录才能发表评论." name="body" cols="50"></textarea>
                <?php } ?>
            </div>

            <div class="form-group reply-post-submit">
                <input class="btn btn-primary <?php if (!$this->session->auth['id']) { ?>disabled<?php } ?>" id="reply-create-submit" type="submit" value="回复"><span class="help-inline" title="Or Command + Enter">Ctrl+Enter</span>
            </div>

            <div class="box preview markdown-reply" id="preview-box" style="display:none;"></div>

        </form>
    </div>


</div>


<?= $this->partial('topics/partials/sidebar') ?>

<div class="clearfix"></div>

<div class="banner-container rbs row"></div>


