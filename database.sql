# CoffeePHP 数据表结构
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '真实名字',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `city` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '城市',
  `company` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '公司',
  `github_id` int(10) NOT NULL DEFAULT 0 COMMENT 'github_id',
  `github_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'github用户名',
  `github_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'github url',
  `weibo_name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '微博昵称',
  `weibo_link` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '微博链接',
  `twitter_account` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '推特账号',
  `personal_website` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '个人网址',
  `introduction` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '个人介绍',
  `last_actived_at` DATETIME,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  KEY (`github_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '用户表';

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics`(
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `body` text NOT NULL COMMENT '内容主体',
  `body_original` text COMMENT 'Markdown原文',
  `excerpt` text COMMENT '摘要',
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `categories_id` int unsigned NOT NULL COMMENT '分类id',
  `is_excellent` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '是否是精华话题',
  `sticked` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '置顶',
  `number_replies` int unsigned NOT NULL DEFAULT 0 COMMENT '回复数',
  `number_views` int unsigned NOT NULL DEFAULT 0 COMMENT '浏览数',
  `votes_up` int unsigned NOT NULL DEFAULT 0 COMMENT 'up投票数',
  `votes_down` int unsigned NOT NULL DEFAULT 0 COMMENT 'down投票数',
  `last_replies_id` int unsigned NOT NULL DEFAULT 0 COMMENT '最后回复id',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  KEY (`categories_id`),
  KEY (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '话题表';
#ALTER TABLE `topics` ADD `is_excellent` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '是否是精华话题' AFTER `categories_id`;
#ALTER TABLE `topics` ADD `sticked` int unsigned NOT NULL DEFAULT 0 COMMENT '置顶' AFTER `is_excellent`;

DROP TABLE IF EXISTS `replies`;
CREATE TABLE IF NOT EXISTS `replies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL COMMENT '内容',
  `body_original` text COMMENT 'Markdown原文',
  `users_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `topics_id` int NOT NULL DEFAULT 0 COMMENT '主题id',
  `in_reply_to_id` int NOT NULL DEFAULT 0 COMMENT '答复的回复id',
  `votes_up` int unsigned NOT NULL DEFAULT 0 COMMENT 'up投票数',
  `votes_down` int unsigned NOT NULL DEFAULT 0 COMMENT 'down投票数',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  KEY (`users_id`),
  KEY (`topics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '回复表';

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '分类表';

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL COMMENT '标签名称',
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '标签表';

DROP TABLE IF EXISTS `votes`;
CREATE TABLE IF NOT EXISTS `votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int unsigned NOT NULL COMMENT '用户id',
  `topics_id` int unsigned NOT NULL COMMENT '主题id',
  `type` int unsigned NOT NULL DEFAULT 1 COMMENT '投票类型,1up,2down',
  `status` int unsigned NOT NULL DEFAULT 1 COMMENT '状态',
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '投票表';


DROP TABLE IF EXISTS `topics_views`;
CREATE TABLE IF NOT EXISTS `topics_views` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `topics_id` int UNSIGNED NOT NULL COMMENT '主题id',
  `users_id` int UNSIGNED  NOT NULL DEFAULT 0 COMMENT '用户id',
  `ip_address` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '用户的ip地址',
  `user_agent` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户代理',
  `created_at` DATETIME,
  PRIMARY KEY (`id`),
  KEY (`topics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT '话题浏览表';

