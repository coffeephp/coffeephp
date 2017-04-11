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
        <link href="<?= $this->url->getStatic('css/coffeephp.css') ?>" rel="stylesheet">

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
        
            
                
                
                    
                    
                    
                    
                
                
                    
                

                
                
                    
                        
                        
                        
                        
                        
                    
                    
                        
                            
                        
                        
                    
                    
                        
                            
                            
                                
                                
                                
                            
                        
                    
                
            
        

        <?= $this->partial('layouts/nav') ?>
        <div class="container main-container">
            <?= $this->flashSession->output() ?>
            <?= $this->getContent() ?>
        </div>
        <?= $this->partial('layouts/footer') ?>
    </div>
        
        
        
        
        
        <script src="<?= $this->url->getStatic('js/coffeephp.js') ?>"></script>
        
    </body>
</html>
