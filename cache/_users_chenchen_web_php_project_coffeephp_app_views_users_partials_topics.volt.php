<ul class="list-group">
    <?php foreach ($topics as $topic) { ?>
    <li class="list-group-item">
        <a href="<?= $this->url->get('topics/') . $topic->id ?>" title="<?= $topic->title ?>">
            <?= $topic->title ?>
        </a>

        <span class="meta">
            <a href="javascript:;" title="分享">
              分享
            </a>
            <span> ⋅ </span>
            <?= $topic->votes_up ?> 点赞
            <span> ⋅ </span>
            <?= $topic->number_replies ?> 回复
            <span> ⋅ </span>
            <span class="timeago"><?= $topic->created_at ?></span>
        </span>
    </li>
    <?php } ?>
</ul>
