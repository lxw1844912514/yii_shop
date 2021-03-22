/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 192.168.33.11:3306
 Source Schema         : yii_shop

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 22/03/2021 20:57:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car_blacklists
-- ----------------------------
DROP TABLE IF EXISTS `car_blacklists`;
CREATE TABLE `car_blacklists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '乘客id',
  `driver_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '司机id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:生效 0:失效',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单表';

-- ----------------------------
-- Table structure for car_cars
-- ----------------------------
DROP TABLE IF EXISTS `car_cars`;
CREATE TABLE `car_cars` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '汽车所属人id',
  `car_img` varchar(255) NOT NULL DEFAULT '' COMMENT '汽车图片',
  `steatnum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '座位数',
  `color` char(20) NOT NULL DEFAULT '' COMMENT '颜色',
  `buy_year` int(11) NOT NULL DEFAULT '0' COMMENT '生产年份',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:正常 0:已删除',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='汽车表';

-- ----------------------------
-- Table structure for car_configs
-- ----------------------------
DROP TABLE IF EXISTS `car_configs`;
CREATE TABLE `car_configs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '网站名称',
  `title` varchar(250) NOT NULL DEFAULT '0' COMMENT '标题',
  `describe` varchar(250) NOT NULL DEFAULT '' COMMENT '描述',
  `keyword` varchar(250) NOT NULL DEFAULT '' COMMENT '关键字',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:开启 0:关闭',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置表';

-- ----------------------------
-- Table structure for car_messages
-- ----------------------------
DROP TABLE IF EXISTS `car_messages`;
CREATE TABLE `car_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_point` varchar(50) DEFAULT NULL COMMENT '起始站',
  `end_point` varchar(50) DEFAULT NULL COMMENT '终点站',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布者id',
  `car_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '汽车id',
  `start_time` int(11) DEFAULT NULL COMMENT '出发时间',
  `route` varchar(100) NOT NULL DEFAULT '' COMMENT '路线',
  `pass_station` varchar(100) NOT NULL DEFAULT '' COMMENT '经停站',
  `surplus_seat` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '剩余座位数',
  `remark` varchar(250) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:正在发布 0:已结束',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `car_userid` (`user_id`),
  KEY `car_start_point` (`start_point`),
  KEY `car_end_point` (`end_point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息表';

-- ----------------------------
-- Table structure for car_opinions
-- ----------------------------
DROP TABLE IF EXISTS `car_opinions`;
CREATE TABLE `car_opinions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布者id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `content` varchar(250) NOT NULL DEFAULT '0' COMMENT '内容',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='意见反馈表';

-- ----------------------------
-- Table structure for car_orders
-- ----------------------------
DROP TABLE IF EXISTS `car_orders`;
CREATE TABLE `car_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `content` varchar(100) NOT NULL DEFAULT '' COMMENT '订单内容',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `driver_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '司机id',
  `passenger_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '乘客id',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `duration` char(50) NOT NULL DEFAULT '' COMMENT '时长',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:未结束 0:已结束',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Table structure for car_users
-- ----------------------------
DROP TABLE IF EXISTS `car_users`;
CREATE TABLE `car_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(60) NOT NULL DEFAULT '' COMMENT '密码',
  `gender` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别:1:男 2:女',
  `headImg` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `phonenum` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '手机号',
  `opendid` char(50) NOT NULL DEFAULT '' COMMENT '微信号',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1乘客  2司机 ',
  `start_address` varchar(100) NOT NULL DEFAULT '' COMMENT '常用起点',
  `end_address` varchar(100) NOT NULL DEFAULT '' COMMENT '常用终点',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:正常 0:已删除',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `car_user_name_password` (`name`,`password`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Table structure for shop_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `addressid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(100) NOT NULL DEFAULT '',
  `address` text,
  `postcode` char(6) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`addressid`),
  KEY `shop_address_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `cartid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cartid`),
  KEY `shop_cart_productid` (`productid`),
  KEY `shop_cart_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `cateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cateid`),
  KEY `shop_category_parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_category
-- ----------------------------
BEGIN;
INSERT INTO `shop_category` VALUES (24, '电子产品', 0, 1611803867);
INSERT INTO `shop_category` VALUES (25, '手机', 24, 1611803882);
INSERT INTO `shop_category` VALUES (26, '华为', 25, 1611803888);
INSERT INTO `shop_category` VALUES (27, '书籍', 0, 1614171515);
INSERT INTO `shop_category` VALUES (28, '电子书', 27, 1614171535);
COMMIT;

-- ----------------------------
-- Table structure for shop_manager
-- ----------------------------
DROP TABLE IF EXISTS `shop_manager`;
CREATE TABLE `shop_manager` (
  `adminid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `adminuser` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `adminpass` char(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `adminemail` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员电子邮箱',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录IP',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `shop_admin_adminuser_adminpass` (`adminuser`,`adminpass`),
  UNIQUE KEY `shop_admin_adminuser_adminemail` (`adminuser`,`adminemail`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_manager
-- ----------------------------
BEGIN;
INSERT INTO `shop_manager` VALUES (1, 'admin', 'e3ceb5881a0a1fdaad01296d7554868d', 'xiaowangli@huashenggroups.com', 1615982183, 3232243969, 1610623646);
INSERT INTO `shop_manager` VALUES (2, 'xiaobai', '202cb962ac59075b964b07152d234b70', '111@qq.com', 0, 0, 1611229912);
INSERT INTO `shop_manager` VALUES (3, 'admin2', '670df58df5a2ec63b0a33e054418105a', '17001@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (4, 'admin222', '9f6e6800cfae7749eb6c486619254b9c', '7001@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (5, 'admin333', '698d51a19d8a121ce581499d7b701668', '70011@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (6, 'admin444', 'bcbe3365e6ac95ea2c0343a2395834dd', '187001@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (7, 'admin2224', '698d51a19d8a121ce581499d7b701668', '1001@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (8, 'admin555', 'b53b3a3d6ab90ce0268229151c9bde11', '181@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (9, 'admin456', 'b53b3a3d6ab90ce0268229151c9bde11', '456001@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (12, 'admin4564', 'f7177163c833dff4b38fc8d2872f1ec6', '456601@163.com', 0, 0, 0);
INSERT INTO `shop_manager` VALUES (14, 'admin233', 'b6d767d2f8ed5d21a44b0e5886680cb9', '12257001@163.com', 1611315224, 0, 1611315224);
INSERT INTO `shop_manager` VALUES (15, 'test', '934b535800b1cba8f96a5d72f72f1611', '22@huashenggroups.com', 1615982091, 0, 1615982091);
COMMIT;

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `orderid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `addressid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `expressid` int(10) unsigned NOT NULL DEFAULT '0',
  `expressno` varchar(50) NOT NULL DEFAULT '',
  `tradeno` varchar(100) NOT NULL DEFAULT '',
  `tradeext` text,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderid`),
  KEY `shop_order_userid` (`userid`),
  KEY `shop_order_addressid` (`addressid`),
  KEY `shop_order_expressid` (`expressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_detail`;
CREATE TABLE `shop_order_detail` (
  `detailid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productnum` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`detailid`),
  KEY `shop_order_detail_productid` (`productid`),
  KEY `shop_order_detail_orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_product
-- ----------------------------
DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE `shop_product` (
  `productid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `descr` text,
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cover` varchar(200) NOT NULL DEFAULT '',
  `pics` text,
  `issale` enum('0','1') NOT NULL DEFAULT '0',
  `ishot` enum('0','1') NOT NULL DEFAULT '0',
  `istui` enum('0','1') NOT NULL DEFAULT '0',
  `saleprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ison` enum('0','1') NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`productid`),
  KEY `shop_product_cateid` (`cateid`),
  KEY `shop_product_ison` (`ison`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_product
-- ----------------------------
BEGIN;
INSERT INTO `shop_product` VALUES (3, 24, '华为荣耀9S', '华为荣耀9S华为荣耀9S', 100, 2000.00, 'static.welltrend.com.cn/601fd1a37ef5d', '{\"601fd1a415e72\":\"static.welltrend.com.cn\\/601fd1a415e72\"}', '1', '1', '1', 2000.00, '0', 0);
INSERT INTO `shop_product` VALUES (4, 24, '华为荣耀9S', '华为荣耀9S华为荣耀9S', 100, 2000.00, 'http://static.welltrend.com.cn/601fd85ea0fff', '{\"601fd85f351a9\":\"http:\\/\\/static.welltrend.com.cn\\/601fd85f351a9\"}', '0', '0', '0', 2000.00, '0', 0);
INSERT INTO `shop_product` VALUES (5, 24, '华为荣耀9S', '华为荣耀9S华为荣耀9S', 100, 2000.00, 'http://static.welltrend.com.cn/601fdd467c3c4', '{\"601fdd4731d49\":\"http:\\/\\/static.welltrend.com.cn\\/601fdd4731d49\"}', '1', '0', '1', 2000.00, '1', 0);
INSERT INTO `shop_product` VALUES (6, 24, '华为荣耀9S', '华为荣耀9S华为荣耀9S', 100, 2000.00, 'http://static.welltrend.com.cn/601fddbdc8f5e', '{\"601fddbe575d0\":\"http:\\/\\/static.welltrend.com.cn\\/601fddbe575d0\"}', '1', '0', '1', 2000.00, '1', 0);
INSERT INTO `shop_product` VALUES (7, 0, '华为荣耀9S', '华为荣耀9S3333', 100, 2000.00, 'http://static.welltrend.com.cn/6034edf2c2411', '{\"6034f02973247\":\"http:\\/\\/static.welltrend.com.cn\\/6034f02973247\",\"6035b3081373f\":\"http:\\/\\/static.welltrend.com.cn\\/6035b3081373f\"}', '1', '0', '1', 2000.00, '1', 0);
INSERT INTO `shop_product` VALUES (8, 25, 'oppo', 'oppo手机', 100, 2000.00, 'http://static.welltrend.com.cn/604f44eb7dcd4', '{\"604f44ebdc7c3\":\"http:\\/\\/static.welltrend.com.cn\\/604f44ebdc7c3\",\"604f44ec43010\":\"http:\\/\\/static.welltrend.com.cn\\/604f44ec43010\"}', '1', '0', '1', 2000.00, '1', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_profile
-- ----------------------------
DROP TABLE IF EXISTS `shop_profile`;
CREATE TABLE `shop_profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `truename` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '年龄',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '性别',
  `avatar` varchar(50) NOT NULL COMMENT '头像',
  `birthday` date NOT NULL DEFAULT '2016-01-01' COMMENT '生日',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `company` varchar(100) NOT NULL DEFAULT '' COMMENT '公司',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户的ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_profile_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(32) NOT NULL DEFAULT '',
  `userpass` char(32) NOT NULL DEFAULT '',
  `useremail` varchar(100) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `shop_user_username_userpass` (`username`,`userpass`),
  UNIQUE KEY `shop_user_useremail_userpass` (`useremail`,`userpass`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user
-- ----------------------------
BEGIN;
INSERT INTO `shop_user` VALUES (1, 'lxw', '275939945caa6f44d32a2bdb9687ca47', 'lxw@qq.com', 0);
INSERT INTO `shop_user` VALUES (4, 'tesr', '934b535800b1cba8f96a5d72f72f1611', '11@qq.com', 1616069978);
INSERT INTO `shop_user` VALUES (6, 'shop_6053511c89d44', '1feae7faa8920440ff34d73a63551a65', 'xiaowangli@huashenggroups.com', 1616072991);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
