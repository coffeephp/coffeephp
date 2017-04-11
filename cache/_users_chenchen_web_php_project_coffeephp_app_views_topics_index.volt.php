
    
        
            
                
            
            
                
                    
                            
                    
                
            


            
                
                    
                        
                        
                        
                        
                        
                        
                        
                    
                
            
        
    
    
        
            
                
            
            
                
            
        
    



<div class="col-md-9 topics-index main-col">
    <div class="panel panel-default">

        <div class="panel-heading">

            <ul class="list-inline topic-filter">
                <li class="popover-with-html" data-content="最后创建排序"><a href="<?= $this->url->get('topics') ?>" class="active">最新</a></li>
                
                
                
                
                
            </ul>

            <div class="clearfix"></div>
        </div>


        <div class="panel-body remove-padding-horizontal">
            <ul class="list-group row topic-list">

                

                    
                        

                        
                    

                    
                        
                            
                        
                    

                    
                        
                            
                        
                        
                
                  
                
                            
                            
                  
                
                        
                    

                    

                        

                            

                            
                                
                            
                        

                    

                

                <?php foreach ($page->items as $item) { ?>
                    

                        
                            

                            
                        

                        
                            
                                
                            
                        

                        
                            
                                
                            
                            
                                
                                  
                                
                                
                                
                                  
                                
                            
                        

                        

                            

                                

                                
                                    
                                
                            

                        

                    

                    <li class="list-group-item ">

                        <a class="reply_count_area hidden-xs pull-right" href="<?= $this->url->get('topics/' . $item->id) ?>">
                            <div class="count_set">
                 <span class="count_of_votes" title="投票数">
                   <?= $item->votes_up ?>
                </span>

                                <span class="count_seperator">/</span>

                                <span class="count_of_replies" title="回复数">
                   <?= $item->number_replies ?>
                 </span>

                                <span class="count_seperator">/</span>

                                <span class="count_of_visits" title="查看数">
                   <?= $item->number_views ?>
                 </span>
                                <span class="count_seperator">|</span>

                                <abbr title="" class="timeago popover-with-html" data-content="36分钟前" data-original-title="2017-03-05 16:58:01">36分钟前</abbr>
                            </div>
                        </a>

                        <div class="avatar pull-left">
                            <a href="<?= $this->url->get('users/') . $item->users->id ?>" title="<?= $item->users->name ?>">
                                <img class="media-object img-thumbnail avatar avatar-middle" alt="<?= $item->users->name ?>" src="<?= $item->users->avatar ?>"></a>
                        </div>


                        <div class="infos">

                            <div class="media-heading">

                                <span class="hidden-xs label label-default"><?= $item->categories->name ?></span>
                                <a href="<?= $this->url->get('topics/' . $item->id) ?>" title="<?= $item->title ?>">
                                    <?= $item->title ?>
                                </a>

                            </div>

                        </div>

                    </li>
                <?php } ?>

            </ul>

        </div>

        <div class="panel-footer text-right remove-padding-horizontal pager-footer">
            <!-- Pager -->
            <?= $page->paginatorRender ?>
        </div>
    </div>

    <!-- Nodes Listing -->

</div>

<div class="col-md-3 side-bar">







    <div class="panel panel-default corner-radius">
        <div class="panel-body text-center">
            <div class="btn-group">
                <a href="<?= $this->url->get('topics/create') ?>" class="btn btn-primary btn-lg btn-inverted">
                    <i class="fa fa-paint-brush" aria-hidden="true"></i>  新 建 话 题
                </a>
            </div>
        </div>
    </div>

    




        
            
    

    




        
            
    



    
        
            
        
        
            
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
            
        
    

    <?php if ($activeUsers) { ?>
        <div class="panel panel-default corner-radius panel-active-users">
            <div class="panel-heading text-center">
                <h3 class="panel-title">活跃用户<!--（<a href="https://laravel-china.org/hall_of_fames"><i class="fa fa-star" aria-hidden="true"></i> 名人堂</a>）--></h3>
            </div>
            <div class="panel-body">
                <div class="users-label">
                    <?php foreach ($activeUsers as $activeUser) { ?>
                        <a class="popover-with-html users-label-item" href="" data-content="<?= $activeUser->name ?><?php if ($activeUser->introduction) { ?>-<?= $activeUser->introduction ?><?php } ?>">
                            <img class="avatar-small inline-block" src="<?= $activeUser->avatar ?>"> <?= $activeUser->name ?>
                        </a>
                    <?php } ?>
                </div>
            </div>
        </div>
    <?php } ?>

    <div class="panel panel-default corner-radius panel-hot-topics">
        <div class="panel-heading text-center">
            <h3 class="panel-title">热门话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                <?php foreach ($hotTopics as $hotTopic) { ?>
                    <li>
                        <a href="<?= $this->url->get('topics/') . $hotTopic->id ?>" class="popover-with-html" data-content="<?= $hotTopic->title ?>">
                            <?= $hotTopic->title ?>
                        </a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>



    
        
            
                
            
        
    

    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title">友情社区</h3>
        </div>
        <div class="panel-body text-center" style="padding-top: 5px;">
            <a href="https://ruby-china.org" target="_blank" rel="nofollow" title="Ruby China" style="padding: 3px;">
                <img src="https://dn-phphub.qbox.me/assets/images/friends/ruby-china.png" style="width:150px; margin: 3px 0;">
            </a>
            <a href="http://golangtc.com/" target="_blank" rel="nofollow" title="Golang 中国" style="padding: 3px;">
                <img src="https://dn-phphub.qbox.me/assets/images/friends/golangcn.png" style="width:150px; margin: 3px 0;">
            </a>
            <a href="http://cnodejs.org/" target="_blank" rel="nofollow" title="CNode：Node.js 中文社区" style="padding: 3px;">
                <img src="https://dn-phphub.qbox.me/assets/images/friends/cnodejs.png" style="width:150px; margin: 3px 0;">
            </a>
            <a href="https://testerhome.com" target="_blank" rel="nofollow" title="Tester Home" style="padding: 3px;">
                <img src="https://dn-phphub.qbox.me/testerhome-logo.png" style="width:150px; margin: 3px 0;">
            </a>
            <a href="http://laravel.so/" target="_blank" rel="nofollow" title="Laravel So" style="padding: 3px;">
                <img src="https://dn-phphub.qbox.me/uploads/images/201608/13/1/qEgPEq6wft.png" style="width:150px; margin: 3px 0;">
            </a>
            <a href="https://easywechat.org/" target="_blank" rel="nofollow" title="Easy We Chat" style="padding: 3px;">
                <img src="https://easywechat.org/logo.svg" style="width:150px; margin: 3px 0;">
            </a>
            <a href="http://www.diycode.cc/" target="_blank" rel="nofollow" title="diycode" style="padding: 3px;">
                <img src="https://dn-phphub.qbox.me/uploads/banners/h22iuEtfjyHZRmv4Fdoq.png" style="width:150px; margin: 3px 0;">
            </a>
        </div>
    </div>



    
        
            
        
        
            
                
            
        
    



    
        
        
        
    


    
        
            
                
                
          
      
            
        

    

</div>
<div class="clearfix"></div>



