-- 创建用户表
CREATE TABLE user
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username`    varchar(20) NOT NULL COMMENT '用户名',
    `password`    varchar(20) NOT NULL COMMENT '密码',
    `phone`       varchar(20) NOT NULL COMMENT '手机号',
    `create_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_phone` (`phone`),
    UNIQUE KEY `uniq_username` (`username`),
    KEY `index_update_time` (`update_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';