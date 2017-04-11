<div class="users-show  row">

    <div class="col-md-3">
        <div class="box">

            <div class="padding-sm user-basic-info">
                <div style="">

                    <div class="media">
                        <div class="media-left">
                            <div class="image">
                                <?php if ($this->session->auth['id'] == $user->id) { ?>
                                    <a href="javascript:;" class="popover-with-html" data-content="修改头像">
                                        <img class="media-object avatar-112 avatar img-thumbnail" src="<?= $user->avatar ?>">
                                    </a>
                                <?php } else { ?>
                                    <img class="media-object avatar-112 avatar img-thumbnail" src="<?= $user->avatar ?>">
                                <?php } ?>
                            </div>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">
                                <?= $user->name ?>
                            </h3>
                            <div class="item">

                            </div>
                            <div class="item">
                                第 <?= $user->id ?> 位会员
                            </div>
                            <div class="item number">
                                注册于 <span class="timeago"><?= $user->created_at ?></span>
                            </div>

                            <div class="item number">
                                活跃于 <span class="timeago"><?= $user->last_actived_at ?></span>
                            </div>

                        </div>
                    </div>

                </div>

                <hr>
                
                    
                        
                        
                    
                    
                        
                        
                    
                    
                        
                        
                    
                

                <div class="follow-info row">
                    <div class="col-xs-6">
                        <a class="counter" href="javascript:;">1</a>
                        <a class="text" href="javascript:;">话题</a>
                    </div>
                    <div class="col-xs-6">
                        <a class="counter" href="javascript:;">5</a>
                        <a class="text" href="javascript:;">评论</a>
                    </div>
                </div>

                <hr>
                <div class="topic-author-box text-center">
                    <ul class="list-inline">
                        <?php if ($user->github_name) { ?>
                        <li class="popover-with-html" data-content="<?= $user->github_name ?>">
                            <a href="<?php if ($user->github_url) { ?><?= $user->github_url ?><?php } else { ?>https://github.com/<?= $user->github_name ?><?php } ?>" target="_blank">
                                <i class="fa fa-github-alt"></i> GitHub
                            </a>
                        </li>
                        <?php } ?>

                        <?php if ($user->weibo_link) { ?>
                        <li class="popover-with-html" data-content="<?= $user->weibo_name ?>">
                            <a href="<?= $user->weibo_link ?>" rel="nofollow" class="weibo" target="_blank"><i class="fa fa-weibo"></i> Weibo
                            </a>
                        </li>
                        <?php } ?>

                        <?php if ($user->twitter_account) { ?>
                        <li class="popover-with-html" data-content="jsyzchen">
                            <a href="https://twitter.com/<?= $user->twitter_account ?>" rel="nofollow" class="twitter" target="_blank"><i class="fa fa-twitter"></i> Twitter
                            </a>
                        </li>
                        <?php } ?>

                        
                        
                            
                            
                        
                        

                        <?php if ($user->personal_website) { ?>
                        <li class="popover-with-html" data-content="<?= $user->personal_website ?>">
                            <a href="http://<?= $user->personal_website ?>" rel="nofollow" target="_blank" class="url">
                                <i class="fa fa-globe"></i> Website
                            </a>
                        </li>
                        <?php } ?>

                        <?php if ($user->company) { ?>
                        <li class="popover-with-html" data-content="<?= $user->company ?>">
                            <i class="fa fa-users"></i> 公司
                        </li>
                        <?php } ?>

                        <?php if ($user->city) { ?>
                        <li class="popover-with-html" data-content="<?= $user->city ?>">
                            <i class="fa fa-map-marker"></i> 城市
                        </li>
                        <?php } ?>

                    </ul>
                </div>

                <hr>

                <?php if ($this->session->auth['id'] == $user->id) { ?>
                <a class="btn btn-primary btn-block" href="<?= $this->url->get('users/') . $this->session->auth['id'] . '/edit' ?>" id="user-edit-button">
                    <i class="fa fa-edit"></i> 编辑个人资料
                </a>
                <?php } ?>



            </div>

        </div>

        

            
                
                
                        
                            
                        
                    

                    
                        
                            
                        
                    

                    
                        
                            
                        
                    

                    
                        
                            
                        
                    

                
            

        

        
            
            
                
                
            

        
    </div>

    <div class="main-col col-md-9 left-col">
        <?php if ($user->introduction) { ?>
            <div class="box text-center"><?= $user->introduction ?></div>
        <?php } ?>

        <div class="panel panel-default">
            <div class="panel-heading">
                最近话题
            </div>

            <div class="panel-body">
                <?php if ($topics) { ?>
                    <?= $this->partial('users/partials/topics') ?>
                <?php } else { ?>
                    <div class="empty-block">还没有发表话题呢~~</div>
                <?php } ?>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                最新评论
            </div>

            <div class="panel-body">
                <?php if ($replies) { ?>
                    <?= $this->partial('users/partials/replies') ?>
                <?php } else { ?>
                    <div class="empty-block">还没有评论过呢~~</div>
                <?php } ?>
            </div>
        </div>

    </div>


</div>





