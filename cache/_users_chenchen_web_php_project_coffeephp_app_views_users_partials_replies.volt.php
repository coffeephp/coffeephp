<ul class="list-group">
    <?php foreach ($replies as $reply) { ?>
    <li class="list-group-item">

        <a href="<?= $this->url->get('topics/') . $reply->topics_id ?>" title="<?= $reply->topics->title ?>" class="remove-padding-left">
            <?= $reply->topics->title ?>
        </a>
        <span class="meta">
         at <span class="timeago" title="<?= $reply->created_at ?>"><?= $reply->created_at ?></span>
        </span>

        <div class="reply-body markdown-reply content-body">
            <?= $reply->body ?>
        </div>
    </li>
    <?php } ?>
</ul>