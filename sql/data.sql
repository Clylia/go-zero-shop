
-- 选择product数据库
USE product;

-- 填充5条一级分类数据
    INSERT INTO product_category (id,parent_id, name) VALUES
    (1,0,'手机'),
    (2,0,'电脑'),
    (3,0,'家用电器'),
    (4,0,'数码配件'),
    (5,0,'电脑配件');


-- 填充商品数据
   INSERT INTO product (id,category_id,name,images,detail,price,stock,status) VALUES
    (1,1,'小米手机','http://img.alicdn.com/imgextra/i1/2638/O1CN01XqXqXq1XqXqXqXqXq_!!2638.jpg_430x430.jpg','小米手机',1999,100,1),
    (2,1,'华为手机','http://img.alicdn.com/imgextra/i1/2638/O1CN01XqXqXq1XqXqXqXqXq_!!2638.jpg_430x430.jpg','华为手机',1999,100,1),
    (3,1,'苹果手机','http://img.alicdn.com/imgextra/i1/2638/O1CN01XqXqXq1XqXqXqXqXq_!!2638.jpg_430x430.jpg','苹果手机',1999,100,1),
    (4,2,'笔记本','http://img.alicdn.com/imgextra/i1/2638/O1CN01XqXqXq1XqXqXqXqXq_!!2638.jpg_430x430.jpg','笔记本',1999,100,1),
    (5,2,'台式机','http://img.alicdn.com/imgextra/i1/2638/O1CN01XqXqXq1XqXqXqXqXq_!!2638.jpg_430x430.jpg','台式机',1999,100,1),
    (6,2,'一体机','http://img.alicdn.com/imgextra/i1/2638/O1CN01XqXqXq1XqXqXqXqXq_!!2638.jpg_430x430.jpg','一体机',1999,100,1);








