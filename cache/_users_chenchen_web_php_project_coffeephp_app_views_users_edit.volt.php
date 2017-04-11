<div class="users-show">

    <div class="col-md-3 box" style="padding: 15px 15px;">
        <div class="padding-md">
            <div class="list-group text-center">
                <a href="<?= $this->url->get('users/') . $user->id . '/edit' ?>" class="list-group-item active">
                    <i class="text-md fa fa-list-alt" aria-hidden="true"></i>
                    &nbsp;个人信息
                </a>
                
                    
                    
                
                
                    
                    
                
                
                    
                    
                
            </div>
        </div>
    </div>

    <div class="main-col col-md-9 left-col">

        <div class="panel panel-default padding-md">

            <div class="panel-body ">

                <h2>
                    <i class="fa fa-cog" aria-hidden="true"></i> 编辑个人资料</h2>
                <hr>
                <form class="form-horizontal" method="POST" action="<?= $this->url->get('users/') . $user->id ?>" accept-charset="UTF-8" enctype="multipart/form-data">
                    <input type="hidden" name="<?= $this->security->getTokenKey() ?>" value="<?= $this->security->getToken() ?>"/>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">GitHub Name</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="github_name" type="text" value="<?= $user->github_name ?>">
                        </div>

                        <div class="col-sm-4 help-block">
                            请跟 GitHub 上保持一致
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">邮 箱</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="email" type="text" value="<?= $user->email ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：chenchenjsyz@163.com
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="real_name" type="text" value="<?= $user->real_name ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：陈晨
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">城市</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="city" type="text" value="<?= $user->city ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：北京
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">公司</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="company" type="text" value="<?= $user->company ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：新浪乐居
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">微博用户名</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="weibo_name" type="text" value="<?= $user->weibo_name ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：陈晨jsyz
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">微博个人页面</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="weibo_link" type="text" value="<?= $user->weibo_link ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            微博个人主页链接，如：http://weibo.com/92chen
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Twitter 帐号</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="twitter_account" type="text" value="<?= $user->twitter_account ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：jsyzchen
                        </div>
                    </div>

                    
                        
                        
                            
                        
                        
                            
                        
                    

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">个人网站</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="personal_website" type="text" value="<?= $user->personal_website ?>">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：jsyzchen.com，不需要加前缀 https://
                        </div>
                    </div>

                    
                        
                        
                            
                        
                        
                            
                        
                    

                    
                        
                        
                            
                        
                        
                            
                        
                    

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">个人简介</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="3" name="introduction" cols="50" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"><?= $user->introduction ?></textarea>
                        </div>
                        <div class="col-sm-4 help-block">
                            请一句话介绍你自己，大部分情况下会在你的头像和名字旁边显示
                        </div>
                    </div>

                    
                        
                        
                            
                        
                        
                            
                        
                    

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <input class="btn btn-primary" id="user-edit-submit" type="submit" value="应用修改">
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
