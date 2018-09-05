-- MySQL dump 10.13  Distrib 5.6.41, for Linux (x86_64)
--
-- Host: localhost    Database: NoneCMS
-- ------------------------------------------------------
-- Server version	5.6.41-log

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
-- Current Database: `NoneCMS`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `NoneCMS` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `NoneCMS`;

--
-- Table structure for table `none_admin`
--

DROP TABLE IF EXISTS `none_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `realname` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(30) NOT NULL DEFAULT '' COMMENT '登录IP',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '管理员创建时间',
  `role_id` int(10) DEFAULT '0' COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_admin`
--

LOCK TABLES `none_admin` WRITE;
/*!40000 ALTER TABLE `none_admin` DISABLE KEYS */;
INSERT INTO `none_admin` VALUES (1,'admin','aeddfdf5128953d46b7dcf2255c8f02a','Q7A4EH','','',9,1535965133,'172.17.0.1',0,0,0);
/*!40000 ALTER TABLE `none_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_admin_power`
--

DROP TABLE IF EXISTS `none_admin_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_admin_power` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(255) NOT NULL COMMENT '操作名称',
  `route` varchar(255) NOT NULL COMMENT '路由 =》MVC',
  `parent` int(10) DEFAULT '0' COMMENT '父级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_admin_power`
--

LOCK TABLES `none_admin_power` WRITE;
/*!40000 ALTER TABLE `none_admin_power` DISABLE KEYS */;
INSERT INTO `none_admin_power` VALUES (1,'后台管理','main/index',0),(2,'系统设置','index/system',1),(3,'清除缓存','index/clear',1),(4,'查看操作记录','log/index',1),(5,'文章管理','article/index',0),(6,'添加文章','article/add',5),(7,'编辑文章','article/edit',5),(8,'删除文章','article/dele',5),(9,'移动文章分类','article/move',5),(10,'产品管理','product/index',0),(11,'添加产品','product/add',10),(12,'编辑产品','product/edit',10),(13,'删除产品','product/dele',10),(14,'移动产品分类','product/move',10),(15,'单页管理','page/index',0),(16,'添加单页','page/add',15),(17,'修改单页','page/edit',15),(18,'删除单页','page/dele',15),(19,'导航管理','nav/index',0),(20,'添加导航','nav/add',19),(21,'修改导航','nav/edit',19),(22,'删除导航','nav/dele',19),(23,'管理员管理','admin/index',0),(24,'添加管理员','admin/add',23),(25,'修改管理员','admin/edit',23),(26,'删除管理员','admin/dele',23),(27,'幻灯广告管理','banner/index',0),(28,'添加幻灯广告','banner/add',27),(29,'修改幻灯广告','banner/edit',27),(30,'删除幻灯广告','banner/dele',27),(31,'添加幻灯图片集','banner/adddetail',27),(32,'修改幻灯图片集','banner/editdetail',27),(33,'删除幻灯图片集','banner/deledetail',27),(34,'友情链接管理','flink/index',0),(35,'添加友链','flink/add',34),(36,'修改友链','flink/edit',34),(37,'删除友链','flink/dele',34),(38,'转载文章','article/copy',5),(39,'角色管理','role/index',0),(40,'添加角色','role/add',39),(41,'修改角色','role/edit',39),(42,'删除角色','role/dele',39),(43,'幻灯图片集管理','banner/banlist',27),(44,'留言管理','comment/index',0),(45,'回复留言','comment/add',44),(46,'删除留言','comment/dele',44);
/*!40000 ALTER TABLE `none_admin_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_admin_role`
--

DROP TABLE IF EXISTS `none_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(255) NOT NULL COMMENT '角色名',
  `power` varchar(255) DEFAULT '' COMMENT '拥有的权限',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_admin_role`
--

LOCK TABLES `none_admin_role` WRITE;
/*!40000 ALTER TABLE `none_admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `none_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_article`
--

DROP TABLE IF EXISTS `none_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(30) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(150) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `editor` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_article`
--

LOCK TABLES `none_article` WRITE;
/*!40000 ALTER TABLE `none_article` DISABLE KEYS */;
INSERT INTO `none_article` VALUES (1,'Ubuntu 15.04 静态IP网络配置\n浏览器内部工作原理\nLinux下c语言线程池的实现\njsoncpp解析\nC+','','','http://blog.csdn.net/a854073071/article/details','','','','','',1474191607,0,1,47,1,0,'',0,0,0,0),(2,'图片上传','','','','','','/uploads/20161114\\583404ee60de6f311e4da6375abcb84e.jpg','<p><img src=\"/ueditor/php/upload/image/20161113/1479018170146092.jpg\" title=\"1479018170146092.jpg\" alt=\"post3.jpg\"/></p><p>图片上传</p>','图片上传',1479018333,1479115209,1,47,1,0,'',0,0,0,0);
/*!40000 ALTER TABLE `none_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_banner`
--

DROP TABLE IF EXISTS `none_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'banner 标题',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'banner 类型 1：banner大图；2：广告',
  `start_time` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `end_time` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否；1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_banner`
--

LOCK TABLES `none_banner` WRITE;
/*!40000 ALTER TABLE `none_banner` DISABLE KEYS */;
INSERT INTO `none_banner` VALUES (1,'首页大图',1,1402564152,1594125465,0);
/*!40000 ALTER TABLE `none_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_banner_detail`
--

DROP TABLE IF EXISTS `none_banner_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_banner_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '所属banner id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标题',
  `img` varchar(255) DEFAULT '' COMMENT '图片地址',
  `url` varchar(255) DEFAULT '' COMMENT '图片链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_banner_detail`
--

LOCK TABLES `none_banner_detail` WRITE;
/*!40000 ALTER TABLE `none_banner_detail` DISABLE KEYS */;
INSERT INTO `none_banner_detail` VALUES (1,1,'2222','/uploads/20161219\\d57ee6aa088a79866cfa7f8d64c3546a.jpg','http://blog.csdn.net/free_ant/article/details/52701212'),(2,1,'2','/uploads/20161219\\47aacf820659b5e3bcf08e74174e7946.jpg','http://blog.csdn.net/free_ant/article/details/52936756'),(3,1,'3','/uploads/20161219\\d764a6c9cb36617eefd1340d2b3fb69e.jpg','http://blog.csdn.net/free_ant/article/details/52936722');
/*!40000 ALTER TABLE `none_banner_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_category`
--

DROP TABLE IF EXISTS `none_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目分类名称',
  `ename` varchar(200) NOT NULL DEFAULT '' COMMENT '别名',
  `catpic` varchar(150) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别',
  `seotitle` varchar(50) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '关键字',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 ，显示；1， 不显示',
  `sort` smallint(6) NOT NULL DEFAULT '100' COMMENT '排序',
  `position` varchar(6) NOT NULL DEFAULT '1' COMMENT '导航出现的位置，默认1：主导航；2：底部；3：侧边',
  `outurl` varchar(255) NOT NULL DEFAULT '' COMMENT '外链url',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '属性：8 百度富文本框编辑；9 Markdown编辑',
  `editor` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_category`
--

LOCK TABLES `none_category` WRITE;
/*!40000 ALTER TABLE `none_category` DISABLE KEYS */;
INSERT INTO `none_category` VALUES (45,'文章模型','blog','',0,1,0,'','','','','','',NULL,0,50,'1','',0,0),(46,'产品模型','product','',0,3,0,'','','','','','',NULL,0,50,'1','',0,0),(47,'新闻','news','',0,1,0,'','','','','List_article.html','Show_article.html',NULL,0,50,'1','',0,0),(48,'我的博客','blog','',0,0,1,'','','','','List_article.html','Show_article.html',NULL,0,0,'1','http://5none.com',0,0),(49,'关于我们','about','',0,2,0,'','','<p>发士大夫</p>','','List_page.html','Show_article.html','暗示法撒旦',0,0,'1','',0,0),(50,'意见反馈','feedback','',0,6,0,'','','','','Guestbook_index.html','',NULL,0,0,'1','',0,0),(51,'二级栏目','','',46,3,0,'','','','','List_product.html','Show_product.html',NULL,0,0,'1','',0,0);
/*!40000 ALTER TABLE `none_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_chat`
--

DROP TABLE IF EXISTS `none_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_chat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '消息类型 say:广播；prisay:私聊',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容',
  `name` varchar(255) NOT NULL DEFAULT 'nango' COMMENT '用户名称',
  `client_id` int(10) DEFAULT '0' COMMENT '发送消息客户端id',
  `to_client_id` varchar(4) DEFAULT '' COMMENT '私聊对象客户端id',
  `send_time` int(10) DEFAULT NULL COMMENT '发送消息时间',
  `room_id` int(5) DEFAULT '1' COMMENT '房间id',
  `ip` varchar(50) DEFAULT NULL COMMENT '客户端ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1720 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_chat`
--

LOCK TABLES `none_chat` WRITE;
/*!40000 ALTER TABLE `none_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `none_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_chatrecord`
--

DROP TABLE IF EXISTS `none_chatrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_chatrecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `type` int(2) DEFAULT '0',
  `content` text,
  `receive_id` int(10) DEFAULT NULL,
  `room_id` int(6) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_chatrecord`
--

LOCK TABLES `none_chatrecord` WRITE;
/*!40000 ALTER TABLE `none_chatrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `none_chatrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_comment`
--

DROP TABLE IF EXISTS `none_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '留言标题',
  `username` varchar(10) NOT NULL DEFAULT '' COMMENT '留言者姓名',
  `tel` varchar(12) DEFAULT '' COMMENT '电话',
  `email` varchar(255) DEFAULT '' COMMENT 'email',
  `qq` varchar(15) DEFAULT '' COMMENT 'qq',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `rid` int(10) DEFAULT '0' COMMENT '回复id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论状态 1：已删除',
  `uid` int(10) DEFAULT '0' COMMENT '用户id',
  `aid` int(10) DEFAULT '0' COMMENT '管理员id',
  `from` varchar(10) DEFAULT '' COMMENT '评论来源：本站 or 第三方站（多说）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_comment`
--

LOCK TABLES `none_comment` WRITE;
/*!40000 ALTER TABLE `none_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `none_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_flink`
--

DROP TABLE IF EXISTS `none_flink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_flink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '记录类型：1：友情链接；2：公告',
  `logo` varchar(255) DEFAULT '' COMMENT 'logo',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_flink`
--

LOCK TABLES `none_flink` WRITE;
/*!40000 ALTER TABLE `none_flink` DISABLE KEYS */;
INSERT INTO `none_flink` VALUES (1,'nonecms',1,'','http://www.5none.com','简单建站！',1,NULL);
/*!40000 ALTER TABLE `none_flink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_log`
--

DROP TABLE IF EXISTS `none_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '日志类型 1，登入；2，操作',
  `datetime` int(10) unsigned NOT NULL COMMENT '操作时间',
  `ip` varchar(15) DEFAULT '0' COMMENT '登入ip',
  `content` varchar(255) DEFAULT '' COMMENT '操作内容',
  `username` varchar(255) DEFAULT NULL,
  `userid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_log`
--

LOCK TABLES `none_log` WRITE;
/*!40000 ALTER TABLE `none_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `none_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_modeln`
--

DROP TABLE IF EXISTS `none_modeln`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_modeln` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `tablename` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_modeln`
--

LOCK TABLES `none_modeln` WRITE;
/*!40000 ALTER TABLE `none_modeln` DISABLE KEYS */;
INSERT INTO `none_modeln` VALUES (1,'文章模型','','article',1,'','List_article.html','Show_article.html',1),(2,'单页模型','','category',1,'','List_page.html','Show_page.html',2),(3,'产品模型','','product',1,'','List_product.html','Show_product.html',3),(6,'留言本模型','','comment',1,'','Guestbook_index.html','Guestbook_detail.html',6);
/*!40000 ALTER TABLE `none_modeln` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_product`
--

DROP TABLE IF EXISTS `none_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `brand` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌',
  `units` varchar(50) NOT NULL DEFAULT '' COMMENT '单位',
  `specification` varchar(50) NOT NULL DEFAULT '' COMMENT '规格',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `editor` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_product`
--

LOCK TABLES `none_product` WRITE;
/*!40000 ALTER TABLE `none_product` DISABLE KEYS */;
INSERT INTO `none_product` VALUES (29,'webupload','','','/uploads/20161124/20161124141006-thumb.jpeg','/uploads/20161124\\8a9af5a4a608ce3088bb99123f97ae98.jpg','<p>sfasfdasdfasdfsd</p>','',1.00,0.00,'sdf','','',1479887452,1479967806,2,46,1,0,'',0,0,0,0),(30,'ces','','dsd','/uploads/20161124/20161124112437-thumb.jpeg','/uploads/20161124\\1b1bc8747798660f36965bfd79332d4c.jpg|/uploads/20161124\\b777ed2fda015fa99cb1bf40868b35ff.jpg|/uploads/20161124\\7baca94ccf44ad9243700edc30efc4f0.jpg|/uploads/20161124\\ab77d53288704b54d43864d2dd5cf490.jpg|/uploads/20161124\\741c9adb296ade60846fb53d751eecc2.jpg|/uploads/20161124\\e6f6880ce3a3cf1c94e9ac4de7f5256a.jpg|/uploads/20161124\\dabcf8714caa18c970ac5f8609de0dd9.jpg|/uploads/20161124\\aba1bce170f09dc3e73c18e54ec7525e.jpg|/uploads/20161124\\d0228344a0f05869b0f24cdcb5b24241.jpg|/uploads/20161124\\891c56539aa96ae3134979ac90640129.jpg|/uploads/20161124\\6883d39163b8ec00196d53d05a58736a.jpg|/uploads/20161124\\72ca7423c0bed3c45bc296c97e4238ea.jpg','<p>contentcontentcontentcontentcontentcontentcontentcontent</p>','',1.00,0.00,'sdf','','',1479957877,0,1,46,1,0,'',0,0,0,0),(31,'CENTOS7 下部署RSync','','','/uploads/20161124/20161124165252-thumb.jpeg','/uploads/20161124\\b770210db9f306fb4d47251701a93912.jpg','     ','',0.00,0.00,'','','',1479977262,1479977572,0,46,1,0,'',0,0,0,0),(32,'asdfs','','','/uploads/20161124/20161124165515-thumb.jpeg','/uploads/20161124\\bdfea98f884f6769d36c9405bca5534a.jpg','<p>afas</p>','asf',1.00,0.00,'fas','','',1479977715,0,0,46,1,0,'',0,0,0,0);
/*!40000 ALTER TABLE `none_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_system`
--

DROP TABLE IF EXISTS `none_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '说明',
  `tvalue` varchar(150) NOT NULL DEFAULT '' COMMENT '参数类型',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分组',
  `value` text,
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_system`
--

LOCK TABLES `none_system` WRITE;
/*!40000 ALTER TABLE `none_system` DISABLE KEYS */;
INSERT INTO `none_system` VALUES (1,'site_name','站点名称','','',0,0,'NoneCMS',0),(2,'site_title','站点标题','','',0,0,'NoneCMS',0),(3,'site_keywords','站点关键字','','',0,0,'NoneCMS',0),(4,'site_description','站点描述','','',0,0,'NoneCMS',0),(5,'site_address','公司地址','','',0,0,'浙江省杭州市',0),(6,'site_closed','关闭网站','','radio',0,0,'0',0),(7,'site_icp','ICP备案证书号','','',0,0,'',0),(8,'site_tel','客服电话','','',0,0,'0571-11223311',0),(9,'site_fax','传真','','',0,0,'0571-112231111',0),(10,'site_qq','客服QQ号码','多个客服的QQ号码请以半角逗号（,）分隔，如果需要设定昵称则在号码后跟 /昵称。','',0,0,'553212320',0),(11,'site_email','邮件地址','','',0,0,'553212320@qq.com',0),(12,'display_thumbw','缩略图宽度','','',0,0,'300',0),(13,'display_thumbh','缩略图高度','','',0,0,'300',0),(14,'site_editor','编辑器选择','如果选择Markdown编辑器，则前台展示页面需引入editor.md相关js；具体操作流程看文章：blog.5none.com','radio',0,0,'markdown',0),(15,'site_theme','网站主题','','select',0,0,'default',0),(16,'site_mobile_theme','移动端主题','','select',0,0,'default',0),(17,'email_host','邮箱服务器主机地址','','',0,0,'default',0),(18,'email_port','端口号','','',0,0,'25',0),(19,'email_username','邮箱用户名','','',0,0,'default',0),(20,'email_password','邮箱授权码','','',0,0,'default',0),(21,'email_fromemail','发件人邮箱','','',0,0,'default',0),(22,'email_fromuser','发件人用户名','','',0,0,'default',0),(23,'email_debug','开启调试模式',' 0 No output  1 Commands 2 Data and commands 3 As 2 plus connection status 4 Low-level data output.','',0,0,'0',0),(24,'site_dsn','Client keys','Sentry日志Client keys','',0,0,'',0);
/*!40000 ALTER TABLE `none_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `none_user`
--

DROP TABLE IF EXISTS `none_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `none_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `nick` varchar(255) DEFAULT '',
  `img` blob,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `accesstoken` varchar(32) NOT NULL DEFAULT '',
  `accesstoken_expire` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `none_user`
--

LOCK TABLES `none_user` WRITE;
/*!40000 ALTER TABLE `none_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `none_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-03  9:05:20
