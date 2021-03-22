-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: yii_shop
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `yii_shop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `yii_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `yii_shop`;

--
-- Table structure for table `car_blacklists`
--

DROP TABLE IF EXISTS `car_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_blacklists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '乘客id',
  `driver_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '司机id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1:生效 0:失效',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_blacklists`
--

LOCK TABLES `car_blacklists` WRITE;
/*!40000 ALTER TABLE `car_blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_cars`
--

DROP TABLE IF EXISTS `car_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_cars`
--

LOCK TABLES `car_cars` WRITE;
/*!40000 ALTER TABLE `car_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_configs`
--

DROP TABLE IF EXISTS `car_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_configs`
--

LOCK TABLES `car_configs` WRITE;
/*!40000 ALTER TABLE `car_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_messages`
--

DROP TABLE IF EXISTS `car_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_messages`
--

LOCK TABLES `car_messages` WRITE;
/*!40000 ALTER TABLE `car_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_opinions`
--

DROP TABLE IF EXISTS `car_opinions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_opinions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布者id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `content` varchar(250) NOT NULL DEFAULT '0' COMMENT '内容',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='意见反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_opinions`
--

LOCK TABLES `car_opinions` WRITE;
/*!40000 ALTER TABLE `car_opinions` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_opinions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_orders`
--

DROP TABLE IF EXISTS `car_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_orders`
--

LOCK TABLES `car_orders` WRITE;
/*!40000 ALTER TABLE `car_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_users`
--

DROP TABLE IF EXISTS `car_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_users`
--

LOCK TABLES `car_users` WRITE;
/*!40000 ALTER TABLE `car_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_address`
--

DROP TABLE IF EXISTS `shop_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_address`
--

LOCK TABLES `shop_address` WRITE;
/*!40000 ALTER TABLE `shop_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category` (
  `cateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cateid`),
  KEY `shop_category_parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (24,'电子产品',0,1611803867),(25,'手机',24,1611803882),(26,'华为',25,1611803888),(27,'书籍',0,1614171515),(28,'电子书',27,1614171535);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_manager`
--

DROP TABLE IF EXISTS `shop_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_manager`
--

LOCK TABLES `shop_manager` WRITE;
/*!40000 ALTER TABLE `shop_manager` DISABLE KEYS */;
INSERT INTO `shop_manager` VALUES (1,'admin','e3ceb5881a0a1fdaad01296d7554868d','xiaowangli@huashenggroups.com',1615982183,3232243969,1610623646),(2,'xiaobai','202cb962ac59075b964b07152d234b70','111@qq.com',0,0,1611229912),(3,'admin2','670df58df5a2ec63b0a33e054418105a','17001@163.com',0,0,0),(4,'admin222','9f6e6800cfae7749eb6c486619254b9c','7001@163.com',0,0,0),(5,'admin333','698d51a19d8a121ce581499d7b701668','70011@163.com',0,0,0),(6,'admin444','bcbe3365e6ac95ea2c0343a2395834dd','187001@163.com',0,0,0),(7,'admin2224','698d51a19d8a121ce581499d7b701668','1001@163.com',0,0,0),(8,'admin555','b53b3a3d6ab90ce0268229151c9bde11','181@163.com',0,0,0),(9,'admin456','b53b3a3d6ab90ce0268229151c9bde11','456001@163.com',0,0,0),(12,'admin4564','f7177163c833dff4b38fc8d2872f1ec6','456601@163.com',0,0,0),(14,'admin233','b6d767d2f8ed5d21a44b0e5886680cb9','12257001@163.com',1611315224,0,1611315224),(15,'test','934b535800b1cba8f96a5d72f72f1611','22@huashenggroups.com',1615982091,0,1615982091);
/*!40000 ALTER TABLE `shop_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_detail`
--

DROP TABLE IF EXISTS `shop_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_detail`
--

LOCK TABLES `shop_order_detail` WRITE;
/*!40000 ALTER TABLE `shop_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product`
--

LOCK TABLES `shop_product` WRITE;
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` VALUES (3,24,'华为荣耀9S','华为荣耀9S华为荣耀9S',100,2000.00,'static.welltrend.com.cn/601fd1a37ef5d','{\"601fd1a415e72\":\"static.welltrend.com.cn\\/601fd1a415e72\"}','1','1','1',2000.00,'0',0),(4,24,'华为荣耀9S','华为荣耀9S华为荣耀9S',100,2000.00,'http://static.welltrend.com.cn/601fd85ea0fff','{\"601fd85f351a9\":\"http:\\/\\/static.welltrend.com.cn\\/601fd85f351a9\"}','0','0','0',2000.00,'0',0),(5,24,'华为荣耀9S','华为荣耀9S华为荣耀9S',100,2000.00,'http://static.welltrend.com.cn/601fdd467c3c4','{\"601fdd4731d49\":\"http:\\/\\/static.welltrend.com.cn\\/601fdd4731d49\"}','1','0','1',2000.00,'1',0),(6,24,'华为荣耀9S','华为荣耀9S华为荣耀9S',100,2000.00,'http://static.welltrend.com.cn/601fddbdc8f5e','{\"601fddbe575d0\":\"http:\\/\\/static.welltrend.com.cn\\/601fddbe575d0\"}','1','0','1',2000.00,'1',0),(7,0,'华为荣耀9S','华为荣耀9S3333',100,2000.00,'http://static.welltrend.com.cn/6034edf2c2411','{\"6034f02973247\":\"http:\\/\\/static.welltrend.com.cn\\/6034f02973247\",\"6035b3081373f\":\"http:\\/\\/static.welltrend.com.cn\\/6035b3081373f\"}','1','0','1',2000.00,'1',0),(8,25,'oppo','oppo手机',100,2000.00,'http://static.welltrend.com.cn/604f44eb7dcd4','{\"604f44ebdc7c3\":\"http:\\/\\/static.welltrend.com.cn\\/604f44ebdc7c3\",\"604f44ec43010\":\"http:\\/\\/static.welltrend.com.cn\\/604f44ec43010\"}','1','0','1',2000.00,'1',0);
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_profile`
--

DROP TABLE IF EXISTS `shop_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_profile`
--

LOCK TABLES `shop_profile` WRITE;
/*!40000 ALTER TABLE `shop_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_user`
--

DROP TABLE IF EXISTS `shop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_user`
--

LOCK TABLES `shop_user` WRITE;
/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` VALUES (1,'lxw','275939945caa6f44d32a2bdb9687ca47','lxw@qq.com',0),(4,'tesr','934b535800b1cba8f96a5d72f72f1611','11@qq.com',1616069978),(6,'shop_6053511c89d44','1feae7faa8920440ff34d73a63551a65','xiaowangli@huashenggroups.com',1616072991);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 20:29:26
