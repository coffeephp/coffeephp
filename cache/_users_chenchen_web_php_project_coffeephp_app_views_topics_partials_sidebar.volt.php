<div class="col-md-3 side-bar">

    <div class="panel panel-default corner-radius">

        <div class="panel-heading text-center">
            <h3 class="panel-title">作者：<?= $topic->users->name ?></h3>
        </div>

        <?= $this->partial('topics/partials/topic_author_box') ?>
    </div>

    <?php if ($userTopics) { ?>
    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title"><?= $topic->users->name ?> 的其他话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                 <?php foreach ($userTopics as $userTopic) { ?>
                    <li>
                        <a href="<?= $this->url->get('topics/') . $userTopic->id ?>" class="popover-with-html" data-content="<?= $userTopic->title ?>">
                            <?= $userTopic->title ?>
                        </a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php } ?>

    <?php if ($categoryTopics) { ?>
    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title">分类下其他主题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                <?php foreach ($categoryTopics as $categoryTopic) { ?>
                <li>
                    <a href="<?= $this->url->get('topics/') . $categoryTopic->id ?>" class="popover-with-html" data-content="<?= $categoryTopic->title ?>" >
                        <?= $categoryTopic->title ?>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php } ?>

    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    



    
        
            
        
        
            
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
                
                    
                        
                        
                    
                
            
        
    



    
    
    
    
    
    


    <?php if ($randomExcellentTopics) { ?>
    <div class="panel panel-default corner-radius panel-hot-topics">
        <div class="panel-heading text-center">
            <h3 class="panel-title">随机推荐话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                <?php foreach ($randomExcellentTopics as $randomExcellentTopic) { ?>
                    <li>
                        <a href="<?= $this->url->get('topics/') . $randomExcellentTopic->id ?>" class="popover-with-html" data-content="<?= $randomExcellentTopic->title ?>" >
                            <?= $randomExcellentTopic->title ?>
                        </a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php } ?>



    
    
    
    


    
    
    
    
    
    
    
    

    

</div>