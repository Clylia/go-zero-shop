-- 创建用户数据库
CREATE DATABASE user;
USE user;

-- 创建用户表
CREATE TABLE user
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username`    varchar(50) NOT NULL COMMENT '用户名',
    `password`    varchar(50) NOT NULL COMMENT '密码',
    `phone`       varchar(20) NOT NULL COMMENT '手机号',
    `create_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_phone` (`phone`),
    UNIQUE KEY `uniq_username` (`username`),
    KEY `index_update_time` (`update_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 创建收货地址表
CREATE TABLE user_address
(
    `id`             bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货地址ID',
    `user_id`        bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
    `name`           varchar(20)  NOT NULL COMMENT '收货人',
    `phone`          varchar(20)  NOT NULL COMMENT '手机号',
    `province`       varchar(100) NOT NULL DEFAULT '' COMMENT '省份/直辖市',
    `city`           varchar(100) NOT NULL DEFAULT '' COMMENT '城市',
    `region`         varchar(100) NOT NULL DEFAULT '' COMMENT '区',
    `detail_address` varchar(128) NOT NULL DEFAULT '' COMMENT '详细地址(街道)',
    `is_default`     tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认地址',
    `create_time`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `index_user_id` (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收货地址表';


-- 创建商品数据库
CREATE DATABASE product;
USE product;

-- 创建商品表
CREATE TABLE product
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `category_id` smallint(6) unsigned NOT NULL COMMENT '商品分类ID',
    `name`        varchar(20)    NOT NULL COMMENT '商品名',
    `images`      varchar(1024)  NOT NULL DEFAULT '' COMMENT '图片地址,逗号分隔',
    `detail`      varchar(1024)  NOT NULL DEFAULT '' COMMENT '商品详情',
    `price`       decimal(10, 2) NOT NULL COMMENT '商品价格',
    `stock`       int(11) NOT NULL DEFAULT 0 COMMENT '库存数量',
    `status`      int(6) NOT NULL DEFAULT 1 COMMENT '商品状态.1-在售 2-下架 3-删除',
    `create_time` timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `index_category_id` (`category_id`),
    KEY `index_update_time` (`update_time`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- 创建商品分类表

CREATE TABLE product_category
(
    `id`          smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
    `parent_id`   smallint(6) NOT NULL DEFAULT 0 COMMENT '父类别id当id=0时说明是根节点,一级类别',
    `name`        varchar(20) NOT NULL COMMENT '商品分类名',
    `create_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';


-- 创建购物车数据库
CREATE DATABASE cart;
USE cart;

-- 创建购物车表
CREATE TABLE cart
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
    `user_id`     bigint(20) unsigned NOT NULL COMMENT '用户ID',
    `product_id`  bigint(20) unsigned NOT NULL COMMENT '商品ID',
    `quantity`    int(11) NOT NULL DEFAULT 0 COMMENT '购买数量',
    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `index_user_id` (`user_id`),
    KEY `index_product_id` (`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车表';


-- 创建订单数据库
CREATE DATABASE orders;
USE orders;

-- 创建订单表
CREATE TABLE orders
(
    `id`               bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    `user_id`          bigint(20) unsigned NOT NULL COMMENT '用户ID',
    `order_address_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '收货信息表id',
    `pay_amount`       decimal(20, 2) NOT NULL COMMENT '实际付款金额',
    `pay_type`         tinyint(4) NOT NULL DEFAULT 1 COMMENT '支付类型,1-在线支付',
    `freight`         decimal(10, 2) NOT NULL DEFAULT 0 COMMENT '运费',
    `status`           tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单状态,1-未付款 2-已付款 3-已发货 4-已收货 5-已评价 6-已取消',
    `create_time`      timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 创建订单子表
CREATE TABLE order_item
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单子表ID',
    `order_id`    bigint(20) unsigned NOT NULL COMMENT '订单ID',
    `product_id`  bigint(20) unsigned NOT NULL COMMENT '商品ID',
    `pro_name`    varchar(100)   NOT NULL DEFAULT '' COMMENT '商品名称',
    `pro_img`     varchar(500)   NOT NULL DEFAULT '' COMMENT '商品图片',
    `price` decimal(20,2) NOT NULL DEFAULT 0 COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
    `quantity`    int(11) NOT NULL DEFAULT 0 COMMENT '购买数量',
    `total_price` decimal(20, 2) NOT NULL COMMENT '商品总价',
    `create_time` timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
        KEY `order_id` (`order_id`),
        KEY `product_id` (`product_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单子表';

-- 创建收货地址表
CREATE TABLE order_address
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货地址表ID',
    `order_id`    varchar(64)  NOT NULL DEFAULT '' COMMENT '订单id',
    `user_id`    bigint(20) unsigned NOT NULL COMMENT '用户ID',
    `name`        varchar(20)  NOT NULL COMMENT '收货人姓名',
    `phone`       varchar(20)  NOT NULL COMMENT '收货人手机号',
    `province`    varchar(20)  NOT NULL COMMENT '省',
    `city`        varchar(20)  NOT NULL COMMENT '市',
    `area`        varchar(0)  NOT NULL COMMENT '区',
    `detail`      varchar(100) NOT NULL COMMENT '详细地址',
    `create_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
        KEY `user_id` (`user_id`),
        KEY `order_id` (`order_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收货地址表';

-- 创建支付数据库
CREATE DATABASE pay;
USE pay;

-- 创建支付信息表
CREATE TABLE pay
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付信息表ID',
    `order_id`    bigint(20) unsigned NOT NULL COMMENT '订单ID',
    `user_id`     bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
    `pay_type`    tinyint(4) NOT NULL DEFAULT 1 COMMENT '支付类型,1-支付宝 2-微信',
    `pay_number`   varchar(200) NOT NULL DEFAULT '' COMMENT '支付流水号',
    `pay_status`   varchar(20)  NOT NULL DEFAULT '' COMMENT '支付状态',
    `create_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
        KEY `order_id` (`order_id`),
        KEY `user_id` (`user_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付信息表';



