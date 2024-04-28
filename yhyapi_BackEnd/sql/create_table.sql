# 数据库初始化
# @author <a href="https://github.com/liyupi">程序员鱼皮</a>
# @from <a href="https://yupi.icu">编程导航知识星球</a>

-- 创建库
create database if not exists yhyapi;

-- 切换库
use yhyapi;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户' collate = utf8mb4_unicode_ci;

-- 帖子表
create table if not exists post
(
    id         bigint auto_increment comment 'id' primary key,
    title      varchar(512)                       null comment '标题',
    content    text                               null comment '内容',
    tags       varchar(1024)                      null comment '标签列表（json 数组）',
    thumbNum   int      default 0                 not null comment '点赞数',
    favourNum  int      default 0                 not null comment '收藏数',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete   tinyint  default 0                 not null comment '是否删除',
    index idx_userId (userId)
) comment '帖子' collate = utf8mb4_unicode_ci;

-- 帖子点赞表（硬删除）
create table if not exists post_thumb
(
    id         bigint auto_increment comment 'id' primary key,
    postId     bigint                             not null comment '帖子 id',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_postId (postId),
    index idx_userId (userId)
) comment '帖子点赞';

-- 帖子收藏表（硬删除）
create table if not exists post_favour
(
    id         bigint auto_increment comment 'id' primary key,
    postId     bigint                             not null comment '帖子 id',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    index idx_postId (postId),
    index idx_userId (userId)
) comment '帖子收藏';

-- 接口信息
create table if not exists interface_info
(
    `id`             bigint                             not null auto_increment comment '主键' primary key,
    `name`           varchar(256)                       not null comment '名称',
    `description`    varchar(256)                       null comment '描述',
    `url`            varchar(512)                       not null comment '接口地址',
    `requestHeader`  text                               null comment '请求头',
    `responseHeader` text                               null comment '响应头',
    `status`         int      default 0                 not null comment '接口状态（0-关闭，1-开启）',
    `method`         varchar(256)                       not null comment '请求类型',
    `userId`         bigint                             not null comment '创建人',
    `createTime`     datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime`     datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete`       tinyint  default 0                 not null comment '是否删除(0-未删, 1-已删)'
) comment '接口信息';
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (1, '邹鹏涛', 'description', 'www.lorretta-okeefe.net', 1, 'method', 276649228, '2022-02-21 10:24:57', '2022-11-21 22:28:07', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (2, '万博文', 'description', 'www.micah-king.name', 1, 'method', 35, '2022-04-04 09:43:46', '2022-04-04 20:44:37', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (3, '丁明杰', 'description', 'www.carlton-kulas.net', 1, 'method', 19166, '2022-05-07 17:19:12', '2022-04-18 12:38:28', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (4, '曹皓轩', 'description', 'www.duane-okuneva.co', 1, 'method', 6286656, '2022-09-27 09:28:07', '2022-02-21 18:03:45', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (5, '唐博涛', 'description', 'www.anthony-botsford.org', 1, 'method', 68, '2022-02-22 08:09:15', '2022-03-18 14:47:11', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (6, '莫晟睿', 'description', 'www.arlena-considine.org', 1, 'method', 13, '2022-08-21 01:12:13', '2022-03-30 00:53:33', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (7, '卢鸿涛', 'description', 'www.newton-bayer.co', 1, 'method', 3282870118, '2022-09-30 20:35:09', '2022-01-13 17:22:23', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (8, '曹子默', 'description', 'www.mozell-rogahn.info', 1, 'method', 79091, '2022-01-19 12:57:13', '2022-06-11 03:45:45', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (9, '林正豪', 'description', 'www.rudolf-schuster.io', 1, 'method', 6371082366, '2022-08-17 07:54:22', '2022-03-29 03:21:23', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (10, '卢果', 'description', 'www.corrina-tillman.info', 1, 'method', 32450705, '2022-03-12 22:21:57', '2022-02-27 04:13:11', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (11, '沈航', 'description', 'www.edmond-hansen.io', 1, 'method', 34317040, '2022-04-06 16:10:30', '2022-03-25 22:43:25', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (12, '唐立轩', 'description', 'www.kimbery-okon.info', 1, 'method', 14, '2022-02-04 00:14:26', '2022-06-15 10:00:38', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (13, '程昊天', 'description', 'www.mauricio-pfannerstill.org', 1, 'method', 0, '2022-04-18 17:09:12', '2022-04-07 16:13:49', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (14, '戴烨伟', 'description', 'www.buck-koss.name', 1, 'method', 8797268829, '2022-10-14 14:18:05', '2022-04-08 13:31:57', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (15, '杨嘉熙', 'description', 'www.kory-hammes.net', 1, 'method', 7016, '2022-08-31 01:00:05', '2022-03-05 21:15:04', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (16, '卢聪健', 'description', 'www.yoko-cole.net', 1, 'method', 26724102, '2022-01-05 08:09:58', '2022-01-10 06:16:59', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (17, '贾立轩', 'description', 'www.rolland-bergnaum.name', 1, 'method', 7135036, '2022-09-02 08:14:27', '2022-05-10 19:22:54', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (18, '崔明', 'description', 'www.zenaida-glover.name', 1, 'method', 4695185952, '2022-01-07 02:57:36', '2022-10-07 03:43:55', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (19, '邹煜祺', 'description', 'www.luanna-nolan.com', 1, 'method', 202389756, '2022-08-05 08:18:01', '2022-03-16 10:39:48', 0);
insert into yhyapi.`interface_info` (`id`, `name`, `description`, `url`, `status`, `method`, `userId`, `createTime`, `updateTime`, `isDelete`) values (20, '张博超', 'description', 'www.hunter-hand.com', 1, 'method', 9, '2022-04-28 05:30:36', '2022-10-30 23:01:36', 0);