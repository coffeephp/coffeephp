<div class="panel-body text-center topic-author-box">
    <?php if ($this->session->auth['id'] === $topic->users_id) { ?>
        <a class="pull-right popover-with-html text-lg animated rubberBand edit-btn" href="<?= $this->url->get('users/') . $this->session->auth['id'] . '/edit' ?>" data-content="编辑个人资料">
            <i class="fa fa-cog"></i>
        </a>
    <?php } ?>

    <a href="<?= $this->url->get('users/') . $topic->users->id ?>">
        <img src="<?= $topic->users->avatar ?>" style="width:80px; height:80px;margin:5px;" class="img-thumbnail avatar">
    </a>


    <div class="media-body padding-top-sm">
        <?php if ($topic->users->introduction) { ?>
            <div class="media-heading">
                <span class="introduction">
                     <?= $topic->users->introduction ?>
                </span>
            </div>
        <?php } ?>

        <ul class="list-inline">
            <?php if ($topic->users->github_name) { ?>
                <li class="popover-with-html" data-content="<?= $topic->users->github_name ?>">
                    <a href="<?php if ($topic->users->github_url) { ?><?= $topic->users->github_url ?><?php } else { ?>https://github.com/<?= $topic->users->github_name ?><?php } ?>" target="_blank">
                        <i class="fa fa-github-alt"></i> GitHub
                    </a>
                </li>
            <?php } ?>

            <?php if ($topic->users->weibo_link) { ?>
                <li class="popover-with-html" data-content="<?= $topic->users->weibo_name ?>">
                    <a href="<?= $topic->users->weibo_link ?>" rel="nofollow" class="weibo" target="_blank"><i class="fa fa-weibo"></i> Weibo
                    </a>
                </li>
            <?php } ?>

            <?php if ($topic->users->twitter_account) { ?>
                <li class="popover-with-html" data-content="jsyzchen">
                    <a href="https://twitter.com/<?= $topic->users->twitter_account ?>" rel="nofollow" class="twitter" target="_blank"><i class="fa fa-twitter"></i> Twitter
                    </a>
                </li>
            <?php } ?>

            <?php if ($topic->users->personal_website) { ?>
                <li class="popover-with-html" data-content="<?= $topic->users->personal_website ?>">
                    <a href="http://<?= $topic->users->personal_website ?>" rel="nofollow" target="_blank" class="url">
                        <i class="fa fa-globe"></i> Website
                    </a>
                </li>
            <?php } ?>

            <?php if ($topic->users->company) { ?>
                <li class="popover-with-html" data-content="<?= $topic->users->company ?>">
                    <i class="fa fa-users"></i> 公司
                </li>
            <?php } ?>

            <?php if ($topic->users->city) { ?>
                <li class="popover-with-html" data-content="<?= $topic->users->city ?>">
                    <i class="fa fa-map-marker"></i> 城市
                </li>
            <?php } ?>
        </ul>
        <div class="clearfix"></div>
    </div>


</div>