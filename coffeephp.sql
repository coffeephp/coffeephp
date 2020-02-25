####
# CoffeePHP社区 数据表结构
####
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实名字',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '公司',
  `github_id` int NOT NULL DEFAULT 0 COMMENT 'github id',
  `github_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'github用户名',
  `weibo_name` varchar(255) NOT NULL DEFAULT '' COMMENT '微博昵称',
  `weibo_link` varchar(255) NOT NULL DEFAULT '' COMMENT '微博链接',
  `twitter_account` varchar(255) NOT NULL DEFAULT '' COMMENT '推特账号',
  `personal_website` varchar(255) NOT NULL DEFAULT '' COMMENT '个人网址',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '个人介绍',
  `remember_token` varchar(255) NOT NULL DEFAULT '' COMMENT '记住登录状态的token',
  `last_actived_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`github_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `body` mediumtext NOT NULL COMMENT '内容主体',
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `categories_id` int unsigned NOT NULL COMMENT '分类id',
  `is_excellent` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否是精华话题',
  `sticked` tinyint NOT NULL DEFAULT 0 COMMENT '置顶',
  `number_replies` int unsigned NOT NULL DEFAULT 0 COMMENT '回复数',
  `number_views` int unsigned NOT NULL DEFAULT 0 COMMENT '浏览数',
  `votes_up` int unsigned NOT NULL DEFAULT 0 COMMENT '点赞数',
  `body_original` mediumtext COMMENT 'Markdown原文',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`categories_id`),
  INDEX (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题表';

CREATE TABLE IF NOT EXISTS `topics_replies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL COMMENT '内容',
  `body_original` text COMMENT 'Markdown原文',
  `users_id` int NOT NULL COMMENT '用户id',
  `topics_id` int NOT NULL COMMENT '主题id',
  `in_reply_to_id` int DEFAULT NULL COMMENT '答复的回复id',
  `votes_up` int unsigned NOT NULL DEFAULT 0 COMMENT 'up投票数',
  `votes_down` int unsigned NOT NULL DEFAULT 0 COMMENT 'down投票数',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`users_id`),
  INDEX (`topics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题回复表';

CREATE TABLE IF NOT EXISTS `topics_replies_votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `topics_replies_id` int unsigned NOT NULL COMMENT '回复id',
  `type` int unsigned NOT NULL DEFAULT 1 COMMENT '投票类型,1up,2down',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题回复的投票表';

CREATE TABLE IF NOT EXISTS `topics_views` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `topics_id` int unsigned NOT NULL COMMENT '主题id',
  `users_id` int unsigned DEFAULT NULL COMMENT '用户id',
  `ip_address` varchar(20)  NOT NULL DEFAULT '' COMMENT '用户的ip地址',
  `user_agent` varchar(255)  NOT NULL DEFAULT '' COMMENT '用户代理',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`topics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题浏览表';

CREATE TABLE IF NOT EXISTS `topics_votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `topics_id` int unsigned NOT NULL COMMENT '主题id',
  `type` int unsigned NOT NULL DEFAULT 1 COMMENT '投票类型,1up,2down',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题投票表';

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` char(20) NOT NULL COMMENT '类型',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';

CREATE TABLE IF NOT EXISTS `shares` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `clicks` int unsigned NOT NULL DEFAULT 0 COMMENT '点击量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分享表';

CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '专栏名称',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `description` text COMMENT '专栏介绍',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `number_articles` int unsigned NOT NULL DEFAULT 0 COMMENT '文章数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='专栏表';

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `blogs_id` int unsigned NOT NULL COMMENT '专栏id',
  `body` mediumtext NOT NULL COMMENT '内容主体',
  `body_original` mediumtext COMMENT 'Markdown原文',
  `number_replies` int unsigned NOT NULL DEFAULT 0 COMMENT '回复数',
  `number_views` int unsigned NOT NULL DEFAULT 0 COMMENT '浏览数',
  `votes_up` int unsigned NOT NULL DEFAULT 0 COMMENT '点赞数',
  `votes_down` int unsigned NOT NULL DEFAULT 0 COMMENT 'down投票数',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章表';

CREATE TABLE IF NOT EXISTS `articles_votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `articles_id` int unsigned NOT NULL COMMENT '文章d',
  `type` int unsigned NOT NULL DEFAULT 1 COMMENT '投票类型,1up,2down',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章投票表';

CREATE TABLE IF NOT EXISTS `articles_replies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL COMMENT '内容',
  `body_original` text COMMENT 'Markdown原文',
  `users_id` int NOT NULL COMMENT '用户id',
  `articles_id` int NOT NULL COMMENT '主题id',
  `in_reply_to_id` int DEFAULT NULL COMMENT '答复的回复id',
  `votes_up` int unsigned NOT NULL DEFAULT 0 COMMENT 'up投票数',
  `votes_down` int unsigned NOT NULL DEFAULT 0 COMMENT 'down投票数',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`users_id`),
  INDEX (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章回复表';

CREATE TABLE IF NOT EXISTS `articles_replies_votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `articles_replies_id` int unsigned NOT NULL COMMENT '回复id',
  `type` int unsigned NOT NULL DEFAULT 1 COMMENT '投票类型,1up,2down',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章回复的投票表';

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL COMMENT '标签名称',
  `slug` varchar(100) NOT NULL COMMENT '内链',
  `description` text COMMENT '描述',
  `color` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标签表';

CREATE TABLE IF NOT EXISTS `shares_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shares_id` int unsigned NOT NULL COMMENT '分享id',
  `tags_id` int unsigned NOT NULL COMMENT '标签id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  INDEX (`shares_id`),
  INDEX (`tags_id`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分享标签表';

CREATE TABLE IF NOT EXISTS `topics_tags` (
  `topics_id` int unsigned NOT NULL COMMENT '话题id',
  `tags_id` int unsigned NOT NULL COMMENT '标签id',
  INDEX (`topics_id`),
  INDEX (`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='话题标签表';

CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `categories_id` int unsigned NOT NULL COMMENT '分类id',
  `common_id` int unsigned NOT NULL COMMENT '具体内容的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='feed表';

