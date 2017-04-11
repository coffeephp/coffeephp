<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>CoffeePHP 社区 Powered by PHPHub</title>
        <meta name="keywords" content="CoffeePHP,PHP,PHP社区,PHP论坛,PHP学习,PHP问答,PHP文章,PHP招聘,Phalcon,Yaf,Laravel,ThinkPHP" />
        <meta name="description" content="CoffeePHP是一个有情怀的PHP社区，致力于解决PHP问题和分享PHP相关文章，目标成为每一位PHP开发者每天都会访问的PHP社区。" />
        <link href="{{ static_url("css/coffeephp.css") }}" rel="stylesheet">
        <link rel="icon" type="image/png" href="/img/favicon.png">
        <script>
            Config = {
                'cdnDomain': 'https://dn-phphub.qbox.me/',
                'user_id': 1,
                'user_avatar': "https://dn-phphub.qbox.me/uploads/avatars/4330_1462204218.jpeg?imageView2/1/w/100/h/100",
                'user_link': "http://www.coffeephp.com/users/1",
                'routes': {
                    'notificationsCount' : 'http://www.coffeephp.com/notifications/count',
                    'upload_image' : 'http://www.coffeephp.com/upload_image'
                },
                'token': 'EpU61sAkaBvgTC15mD6K1mK4fThIu4KThvUUiKAY',
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
        {#<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->#}
        {#<script src="//cdn.bootcss.com/jquery/3.1.0/jquery.min.js"></script>#}
        {#<!-- Latest compiled and minified JavaScript -->#}
        {#<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>#}
        {#<script src="https://dn-phphub.qbox.me//build/assets/js/scripts-eebbf931d6.js"></script>#}
        <script src="{{ static_url("js/coffeephp.js") }}"></script>
        {#<script src="{{ static_url("js/prism.js") }}"></script>#}
    </body>
</html>
