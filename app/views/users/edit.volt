<div class="users-show">

    <div class="col-md-3 box" style="padding: 15px 15px;">
        <div class="padding-md">
            <div class="list-group text-center">
                <a href="{{ url('users/') ~ user.id ~ '/edit'}}" class="list-group-item active">
                    <i class="text-md fa fa-list-alt" aria-hidden="true"></i>
                    &nbsp;个人信息
                </a>
                {#<a href="https://laravel-china.org/users/4330/edit_avatar" class="list-group-item ">#}
                    {#<i class="text-md fa fa-picture-o" aria-hidden="true"></i>#}
                    {#&nbsp;修改头像#}
                {#</a>#}
                {#<a href="https://laravel-china.org/users/4330/edit_email_notify" class="list-group-item ">#}
                    {#<i class="text-md fa fa-bell" aria-hidden="true"></i>#}
                    {#&nbsp;消息通知#}
                {#</a>#}
                {#<a href="https://laravel-china.org/users/4330/edit_social_binding" class="list-group-item ">#}
                    {#<i class="text-md fa fa-flask" aria-hidden="true"></i>#}
                    {#&nbsp;账号绑定#}
                {#</a>#}
            </div>
        </div>
    </div>

    <div class="main-col col-md-9 left-col">

        <div class="panel panel-default padding-md">

            <div class="panel-body ">

                <h2>
                    <i class="fa fa-cog" aria-hidden="true"></i> 编辑个人资料</h2>
                <hr>
                <form class="form-horizontal" method="POST" action="{{ url('users/') ~ user.id}}" accept-charset="UTF-8" enctype="multipart/form-data">
                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="name" type="text" value="{{ user.name }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：jsyzchen
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">GitHub Name</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="github_name" type="text" value="{{ user.github_name }}">
                        </div>

                        <div class="col-sm-4 help-block">
                            请跟 GitHub 上保持一致
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="email" type="text" value="{{ user.email }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：chenchenjsyz@163.com
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="real_name" type="text" value="{{ user.real_name }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：陈晨
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">城市</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="city" type="text" value="{{ user.city }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：北京
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">公司</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="company" type="text" value="{{ user.company }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：新浪乐居
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">微博用户名</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="weibo_name" type="text" value="{{ user.weibo_name }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：陈晨jsyz
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">微博个人页面</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="weibo_link" type="text" value="{{ user.weibo_link }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            微博个人主页链接，如：http://weibo.com/92chen
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">Twitter 帐号</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="twitter_account" type="text" value="{{ user.twitter_account }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：jsyzchen
                        </div>
                    </div>

                    {#<div class="form-group">#}
                        {#<label for="" class="col-sm-2 control-label">LinkedIn</label>#}
                        {#<div class="col-sm-6">#}
                            {#<input class="form-control" name="linkedin" type="text" value="">#}
                        {#</div>#}
                        {#<div class="col-sm-4 help-block">#}
                            {#你的 <a href="https://www.linkedin.com">LinkedIn</a> 主页完整 URL 地址，如：https://cn.linkedin.com/in/summerblue#}
                        {#</div>#}
                    {#</div>#}

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">个人网站</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="personal_website" type="text" value="{{ user.personal_website }}">
                        </div>
                        <div class="col-sm-4 help-block">
                            如：jsyzchen.com
                        </div>
                    </div>

                    {#<div class="form-group">#}
                        {#<label for="wechat_qrcode" class="col-sm-2 control-label">微信账号二维码</label>#}
                        {#<div class="col-sm-6">#}
                            {#<input type="file" name="wechat_qrcode">#}
                        {#</div>#}
                        {#<div class="col-sm-4 help-block">#}
                            {#你的微信个人账号，或者订阅号#}
                        {#</div>#}
                    {#</div>#}

                    {#<div class="form-group">#}
                        {#<label for="" class="col-sm-2 control-label">支付二维码</label>#}
                        {#<div class="col-sm-6">#}
                            {#<input type="file" name="payment_qrcode">#}
                        {#</div>#}
                        {#<div class="col-sm-4 help-block">#}
                            {#文章打赏时使用，微信支付二维码#}
                        {#</div>#}
                    {#</div>#}

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">个人简介</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="3" name="introduction" cols="50" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;">{{ user.introduction }}</textarea>
                        </div>
                        <div class="col-sm-4 help-block">
                            请一句话介绍你自己，大部分情况下会在你的头像和名字旁边显示
                        </div>
                    </div>

                    {#<div class="form-group">#}
                        {#<label for="" class="col-sm-2 control-label">署名</label>#}
                        {#<div class="col-sm-6">#}
                            {#<textarea class="form-control" rows="3" name="signature" cols="50" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>#}
                        {#</div>#}
                        {#<div class="col-sm-4 help-block">#}
                            {#文章署名，会拼接在每一个你发表过的帖子内容后面。支持 Markdown。#}
                        {#</div>#}
                    {#</div>#}

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
