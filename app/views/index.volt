<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>{{ title }} CoffeePHP 社区 - Powered by PHPHub</title>
        <meta name="keywords" content="CoffeePHP,PHP,PHP社区,PHP论坛,PHP学习,PHP问答,PHP文章,PHP招聘,Phalcon社区,Phalcon,Yaf,Laravel,ThinkPHP" />
        <meta name="description" content="CoffeePHP是一个有情怀的PHP社区，致力于解决PHP问题和分享PHP相关文章，目标成为每一位PHP开发者每天都会访问的PHP社区。" />
        <link href="{{ static_url("css/coffeephp.css") }}" rel="stylesheet">
        <link rel="icon" type="image/png" href="/img/favicon.png">
        <script>
            Config = {
                'cdnDomain': 'http://oojwdbogh.bkt.clouddn.com/',
                'user_id': {% if session.auth %}{{ session.auth['id'] }}{% else %}0{% endif %},
                'user_avatar': "{% if session.auth %}{{ session.auth['avatar'] }}{% endif %}",
                'user_link': "{% if session.auth %}/users/{{ session.auth['id'] }}{% endif %}",
                'routes': {
                    'notificationsCount' : '/notifications/count',
                    'upload_image' : '/upload_image'
                },
                'environment': 'production',
                'following_users': []
            };

            var ShowCrxHint = 'no';
        </script>
    </head>
    <body id="body">
    <div id="wrap">
        {#<nav class="navbar navbar-default navbar-static-top" role="navigation">#}
            {#<div class="container">#}
                {#<!-- Brand and toggle get grouped for better mobile display -->#}
                {#<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">#}
                    {#<span class="sr-only">Toggle navigation</span>#}
                    {#<span class="icon-bar"></span>#}
                    {#<span class="icon-bar"></span>#}
                    {#<span class="icon-bar"></span>#}
                {#</button>#}
                {#<div class="navbar-header">#}
                    {#<a class="navbar-brand" href="/">CoffeePHP</a>#}
                {#</div>#}

                {#<!-- Collect the nav links, forms, and other content for toggling -->#}
                {#<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">#}
                    {#<ul class="nav navbar-nav">#}
                        {#<li class="active"><a href="/topics">社区</a></li>#}
                        {#<li class="active"><a href="#">问答</a></li>#}
                        {#<li><a href="#">文章</a></li>#}
                        {#<li><a href="http://www.imooc.com/course/list?c=php" target="_blank">课程</a></li>#}
                        {#<li><a href="https://www.lagou.com/zhaopin/PHP/" target="_blank">招聘</a></li>#}
                    {#</ul>#}
                    {#<form class="navbar-form navbar-left" role="search">#}
                        {#<div class="form-group">#}
                            {#<input type="text" class="form-control" placeholder="Search">#}
                        {#</div>#}
                        {#<button type="submit" class="btn btn-default">Submit</button>#}
                    {#</form>#}
                    {#<ul class="nav navbar-nav navbar-right">#}
                        {#<li class="dropdown">#}
                            {#<a href="#" class="dropdown-toggle" data-toggle="dropdown">jsyzchen <span class="caret"></span></a>#}
                            {#<ul class="dropdown-menu" role="menu">#}
                                {#<li><a href="#">个人信息</a></li>#}
                                {#<li><a href="#">编辑资料</a></li>#}
                                {#<li><a href="#">退出</a></li>#}
                            {#</ul>#}
                        {#</li>#}
                    {#</ul>#}
                {#</div>#}
            {#</div>#}
        {#</nav>#}

        {{ partial("layouts/nav") }}
        <div class="container main-container">
            {{ flashSession.output() }}
            {{ content() }}
        </div>
        {{ partial("layouts/footer") }}
    </div>
    {#<div class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: block; margin-top: -80px;">#}
        {#<div class="sa-icon sa-error" style="display: none;">#}
      {#<span class="sa-x-mark">#}
        {#<span class="sa-line sa-left"></span>#}
        {#<span class="sa-line sa-right"></span>#}
      {#</span>#}
        {#</div><div class="sa-icon sa-warning pulseWarning" style="display: block;">#}
            {#<span class="sa-body pulseWarningIns"></span>#}
            {#<span class="sa-dot pulseWarningIns"></span>#}
        {#</div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success" style="display: none;">#}
            {#<span class="sa-line sa-tip"></span>#}
            {#<span class="sa-line sa-long"></span>#}

            {#<div class="sa-placeholder"></div>#}
            {#<div class="sa-fix"></div>#}
        {#</div><div class="sa-icon sa-custom" style="display: none;"></div><h2></h2>#}
        {#<p style="display: block;">你确定要退出吗?</p>#}
        {#<fieldset>#}
            {#<input type="text" tabindex="3" placeholder="">#}
            {#<div class="sa-input-error"></div>#}
        {#</fieldset><div class="sa-error-container">#}
            {#<div class="icon">!</div>#}
            {#<p>Not valid!</p>#}
        {#</div><div class="sa-button-container">#}
            {#<button class="cancel" tabindex="2" style="display: inline-block;">取消</button>#}
            {#<div class="sa-confirm-button-container">#}
                {#<button class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(140, 212, 245); box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.0470588) 0px 0px 0px 1px inset;">退出</button><div class="la-ball-fall">#}
                    {#<div></div>#}
                    {#<div></div>#}
                    {#<div></div>#}
                {#</div>#}
            {#</div>#}
        {#</div>#}
    {#</div>#}
    {#<div class="swal2-container swal2-fade swal2-shown" style="overflow-y: auto;">#}
        {#<div role="dialog" aria-labelledby="modalTitleId" aria-describedby="modalContentId" class="swal2-modal swal2-show" tabindex="-1" style="width: 500px; padding: 20px; background: rgb(255, 255, 255); display: block; min-height: 313px;">#}
            {#<ul class="swal2-progresssteps" style="display: none;"></ul>#}
            {#<div class="swal2-icon swal2-error" style="display: none;">#}
                {#<span class="x-mark"><span class="line left"></span>#}
                    {#<span class="line right"></span></span>#}
            {#</div>#}
            {#<div class="swal2-icon swal2-question" style="display: none;">?</div>#}
            {#<div class="swal2-icon swal2-warning pulse-warning" style="display: block;">!</div>#}
            {#<div class="swal2-icon swal2-info" style="display: none;">i</div>#}
            {#<div class="swal2-icon swal2-success" style="display: none;">#}
                {#<span class="line tip"></span> <span class="line long"></span>#}
                {#<div class="placeholder"></div> <div class="fix"></div>#}
            {#</div>#}
            {#<img class="swal2-image" style="display: none;">#}
            {#<h2 class="swal2-title" id="modalTitleId"></h2>#}
            {#<div id="modalContentId" class="swal2-content" style="display: block;">你确定要退出吗?</div>#}
            {#<input class="swal2-input" style="display: none;">#}
            {#<input type="file" class="swal2-file" style="display: none;">#}
            {#<div class="swal2-range" style="display: none;"><output></output><input type="range"></div>#}
            {#<select class="swal2-select" style="display: none;"></select>#}
            {#<div class="swal2-radio" style="display: none;"></div>#}
            {#<label for="swal2-checkbox" class="swal2-checkbox" style="display: none;">#}
                {#<input type="checkbox">#}
            {#</label>#}
            {#<textarea class="swal2-textarea" style="display: none;"></textarea>#}
            {#<div class="swal2-validationerror" style="display: none;"></div>#}
            {#<hr class="swal2-spacer" style="display: block;">#}
            {#<button type="button" role="button" tabindex="0" class="swal2-confirm swal2-styled" style="background-color: rgb(140, 212, 245); border-left-color: rgb(140, 212, 245); border-right-color: rgb(140, 212, 245);">退出</button>#}
            {#<button type="button" role="button" tabindex="0" class="swal2-cancel swal2-styled" style="display: inline-block; background-color: rgb(193, 193, 193);">取消</button>#}
            {#<span class="swal2-close" style="display: none;">×</span>#}
        {#</div>#}
    {#</div>#}
        {#<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->#}
        {#<script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>#}
        {#<!-- Latest compiled and minified JavaScript -->#}
        {#<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>#}
        {#<script src="https://dn-phphub.qbox.me//build/assets/js/scripts-eebbf931d6.js"></script>#}
        <script src="{{ static_url("js/coffeephp.js") }}"></script>
        {#<script src="{{ static_url("js/prism.js") }}"></script>#}

        <!--百度统计-->
        <script>
            var _hmt = _hmt || [];
            (function() {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?8cb350b9a5523174fcd0d5f514daf292";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </body>
</html>
