<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>{{ title }} CoffeePHP社区 - Powered by PHPHub </title>
        <meta name="baidu-site-verification" content="yzSVxuBQxp" />
        <meta name="keywords" content="CoffeePHP,CoffeePHP社区,PHP,PHP社区,PHP论坛,PHP学习,PHP话题,PHP问答,PHP文章,PHP招聘,Phalcon社区,Phalcon,Yaf,Laravel,ThinkPHP" />
        <meta name="description" content="CoffeePHP社区是一个有情怀的PHP社区，致力于解决PHP问题和分享PHP相关文章，目标成为每一位PHP开发者每天都会访问的PHP社区。" />
        <link rel="icon" type="image/png" href="{{ static_url("img/favicon.png") }}">
        <link href="{{ static_url("css/main.css") }}" rel="stylesheet">
        <script src="{{ static_url("js/main.js") }}"></script>
        <script>
            Config = {
                'cdnDomain': 'http://static.coffeephp.com/',
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
            {{ partial("layouts/nav") }}
            <div class="container main-container">
                {{ flashSession.output() }}
                {{ content() }}
            </div>
            {{ partial("layouts/footer") }}
        </div>

        {% if appEnv == 'production' %}
            <!-- Google Analytics -->
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                ga('create', 'UA-97746115-1', 'auto');
                ga('send', 'pageview');
            </script>
            <!-- End Google Analytics -->

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
            <!--百度统计结束-->

            <!--百度站长 链接提交-->
            <script>
                (function(){
                    var bp = document.createElement('script');
                    var curProtocol = window.location.protocol.split(':')[0];
                    if (curProtocol === 'https') {
                        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
                    }
                    else {
                        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
                    }
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(bp, s);
                })();
            </script>
            <!--百度站长 链接提交结束-->
        {% endif %}
    </body>
</html>
