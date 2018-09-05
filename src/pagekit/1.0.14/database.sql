-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pagekit
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Current Database: `pagekit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pagekit` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pagekit`;

--
-- Table structure for table `pk_blog_comment`
--

DROP TABLE IF EXISTS `pk_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_blog_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_BLOG_COMMENT_AUTHOR` (`author`),
  KEY `pk_BLOG_COMMENT_CREATED` (`created`),
  KEY `pk_BLOG_COMMENT_STATUS` (`status`),
  KEY `pk_BLOG_COMMENT_POST_ID` (`post_id`),
  KEY `pk_BLOG_COMMENT_POST_ID_STATUS` (`post_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_blog_comment`
--

LOCK TABLES `pk_blog_comment` WRITE;
/*!40000 ALTER TABLE `pk_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pk_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_blog_post`
--

DROP TABLE IF EXISTS `pk_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_blog_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_BLOG_POST_SLUG` (`slug`),
  KEY `pk_BLOG_POST_TITLE` (`title`),
  KEY `pk_BLOG_POST_USER_ID` (`user_id`),
  KEY `pk_BLOG_POST_DATE` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_blog_post`
--

LOCK TABLES `pk_blog_post` WRITE;
/*!40000 ALTER TABLE `pk_blog_post` DISABLE KEYS */;
INSERT INTO `pk_blog_post` VALUES (1,1,'hello-pagekit','Hello Pagekit',2,'2018-09-03 06:06:36','2018-09-03 06:06:36','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.','',1,0,'{\"title\":null,\"markdown\":true}',NULL);
/*!40000 ALTER TABLE `pk_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_auth`
--

DROP TABLE IF EXISTS `pk_system_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_auth` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_auth`
--

LOCK TABLES `pk_system_auth` WRITE;
/*!40000 ALTER TABLE `pk_system_auth` DISABLE KEYS */;
INSERT INTO `pk_system_auth` VALUES ('861f27005865b58a591a50547a68b09545f72dfa',1,'2018-09-03 06:07:22',1,'{\"ip\":\"172.17.0.1\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/68.0.3440.106 Safari\\/537.36\"}');
/*!40000 ALTER TABLE `pk_system_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_config`
--

DROP TABLE IF EXISTS `pk_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_SYSTEM_CONFIG_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_config`
--

LOCK TABLES `pk_system_config` WRITE;
/*!40000 ALTER TABLE `pk_system_config` DISABLE KEYS */;
INSERT INTO `pk_system_config` VALUES (1,'system/dashboard','{\"55dda578e93b5\":{\"type\":\"location\",\"column\":1,\"idx\":0,\"units\":\"metric\",\"id\":\"55dda578e93b5\",\"uid\":2911298,\"city\":\"Hamburg\",\"country\":\"DE\",\"coords\":{\"lon\":10,\"lat\":53.549999}},\"55dda581d5781\":{\"type\":\"feed\",\"column\":2,\"idx\":0,\"count\":5,\"content\":\"1\",\"id\":\"55dda581d5781\",\"title\":\"Pagekit News\",\"url\":\"http:\\/\\/pagekit.com\\/blog\\/feed\"},\"55dda6e3dd661\":{\"type\":\"user\",\"column\":0,\"idx\":100,\"show\":\"registered\",\"display\":\"thumbnail\",\"total\":\"1\",\"count\":12,\"id\":\"55dda6e3dd661\"}}'),(2,'system/site','{\"menus\":{\"main\":{\"id\":\"main\",\"label\":\"Main\"}},\"title\":\"pagekit\",\"frontpage\":1,\"view\":{\"logo\":\"storage\\/pagekit-logo.svg\"}}'),(3,'system','{\"admin\":{\"locale\":\"zh_CN\"},\"site\":{\"locale\":\"zh_CN\",\"theme\":\"theme-one\"},\"version\":\"1.0.14\",\"packages\":{\"blog\":\"1.0.5\",\"theme-one\":\"1.0.0\"},\"extensions\":[\"blog\"]}'),(6,'theme-one','{\"logo_contrast\":\"storage\\/pagekit-logo-contrast.svg\",\"_menus\":{\"main\":\"main\",\"offcanvas\":\"main\"},\"_positions\":{\"hero\":[1],\"footer\":[2]},\"_widgets\":{\"1\":{\"title_hide\":true,\"title_size\":\"uk-panel-title\",\"alignment\":true,\"html_class\":\"\",\"panel\":\"\"},\"2\":{\"title_hide\":true,\"title_size\":\"uk-panel-title\",\"alignment\":\"true\",\"html_class\":\"\",\"panel\":\"\"}},\"_nodes\":{\"1\":{\"title_hide\":true,\"title_large\":false,\"alignment\":true,\"html_class\":\"\",\"sidebar_first\":false,\"hero_image\":\"storage\\/home-hero.jpg\",\"hero_viewport\":true,\"hero_contrast\":true,\"navbar_transparent\":true}}}');
/*!40000 ALTER TABLE `pk_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_node`
--

DROP TABLE IF EXISTS `pk_system_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_node`
--

LOCK TABLES `pk_system_node` WRITE;
/*!40000 ALTER TABLE `pk_system_node` DISABLE KEYS */;
INSERT INTO `pk_system_node` VALUES (1,0,1,1,'Home','home','/home','@page/1','page','main',NULL,'{\"defaults\":{\"id\":1}}'),(2,0,2,1,'Blog','blog','/blog','@blog','blog','main',NULL,NULL);
/*!40000 ALTER TABLE `pk_system_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_page`
--

DROP TABLE IF EXISTS `pk_system_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_page`
--

LOCK TABLES `pk_system_page` WRITE;
/*!40000 ALTER TABLE `pk_system_page` DISABLE KEYS */;
INSERT INTO `pk_system_page` VALUES (1,'Home','<div class=\"uk-width-medium-3-4 uk-container-center\">\n    \n<h3 class=\"uk-h1 uk-margin-large-bottom\">Uniting fresh design and clean code<br class=\"uk-hidden-small\"> to create beautiful websites.</h3>\n\n<p class=\"uk-width-medium-4-6 uk-container-center\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\n\n</div>','{\"title\":true}');
/*!40000 ALTER TABLE `pk_system_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_role`
--

DROP TABLE IF EXISTS `pk_system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_SYSTEM_ROLE_NAME` (`name`),
  KEY `pk_SYSTEM_ROLE_NAME_PRIORITY` (`name`,`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_role`
--

LOCK TABLES `pk_system_role` WRITE;
/*!40000 ALTER TABLE `pk_system_role` DISABLE KEYS */;
INSERT INTO `pk_system_role` VALUES (1,'Anonymous',0,NULL),(2,'Authenticated',1,'blog: post comments'),(3,'Administrator',2,NULL);
/*!40000 ALTER TABLE `pk_system_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_session`
--

DROP TABLE IF EXISTS `pk_system_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_session`
--

LOCK TABLES `pk_system_session` WRITE;
/*!40000 ALTER TABLE `pk_system_session` DISABLE KEYS */;
INSERT INTO `pk_system_session` VALUES ('bivppi0u37kep5mqcmdfpofvpt','2018-09-03 06:07:22','X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiMTE2ZjJmMTFhNjI4YzdjMDgzNTcyMDU1MjU5YzEzZDhjMGU0NjRkYyI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE1MzU5NTQ4NDI7czoxOiJjIjtpOjE1MzU5NTQ4MDE7czoxOiJsIjtzOjE6IjAiO30='),('uu8o50rdpfr120ipp5t6hmuog7','2018-09-03 06:06:48','X3NmMl9hdHRyaWJ1dGVzfGE6MTp7czo1OiJfY3NyZiI7czo0MDoiMTE2ZjJmMTFhNjI4YzdjMDgzNTcyMDU1MjU5YzEzZDhjMGU0NjRkYyI7fV9zZjJfZmxhc2hlc3xhOjA6e31fcGtfbWVzc2FnZXN8YToyOntzOjc6ImRpc3BsYXkiO2E6MDp7fXM6MzoibmV3IjthOjA6e319X3NmMl9tZXRhfGE6Mzp7czoxOiJ1IjtpOjE1MzU5NTQ4MDc7czoxOiJjIjtpOjE1MzU5NTQ4MDE7czoxOiJsIjtzOjE6IjAiO30=');
/*!40000 ALTER TABLE `pk_system_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_user`
--

DROP TABLE IF EXISTS `pk_system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `registered` datetime NOT NULL,
  `login` datetime DEFAULT NULL,
  `activation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_SYSTEM_USER_USERNAME` (`username`),
  UNIQUE KEY `pk_SYSTEM_USER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_user`
--

LOCK TABLES `pk_system_user` WRITE;
/*!40000 ALTER TABLE `pk_system_user` DISABLE KEYS */;
INSERT INTO `pk_system_user` VALUES (1,'admin','admin','admin@admin.com','$2y$10$XTVH4N/JyQ91exZRdOiQN.km99eIc5szE9dsnGUadIltd0wvSzEk.','',1,'2018-09-03 06:06:36','2018-09-03 06:06:48',NULL,'2,3',NULL);
/*!40000 ALTER TABLE `pk_system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pk_system_widget`
--

DROP TABLE IF EXISTS `pk_system_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pk_system_widget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `roles` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pk_system_widget`
--

LOCK TABLES `pk_system_widget` WRITE;
/*!40000 ALTER TABLE `pk_system_widget` DISABLE KEYS */;
INSERT INTO `pk_system_widget` VALUES (1,'Hello, I\'m Pagekit','system/text',1,'1',NULL,'{\"content\":\"<h1 class=\\\"uk-heading-large uk-margin-large-bottom\\\">Hello, I\'m Pagekit,<br class=\\\"uk-hidden-small\\\"> your new favorite CMS.<\\/h1>\\n\\n<a class=\\\"uk-button uk-button-large\\\" href=\\\"http:\\/\\/www.pagekit.com\\\">Get started<\\/a>\"}'),(2,'Powered by Pagekit','system/text',1,NULL,NULL,'{\"content\":\"<ul class=\\\"uk-grid uk-grid-medium uk-flex uk-flex-center\\\">\\n    <li><a href=\\\"https:\\/\\/github.com\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-github\\\"><\\/a><\\/li>\\n    <li><a href=\\\"https:\\/\\/twitter.com\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-twitter\\\"><\\/a><\\/li>\\n    <li><a href=\\\"https:\\/\\/gitter.im\\/pagekit\\/pagekit\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-comment-o\\\"><\\/a><\\/li>\\n    <li><a href=\\\"https:\\/\\/plus.google.com\\/communities\\/104125443335488004107\\\" class=\\\"uk-icon-hover uk-icon-small uk-icon-google-plus\\\"><\\/a><\\/li>\\n<\\/ul>\\n\\n<p>Powered by <a href=\\\"https:\\/\\/pagekit.com\\\">Pagekit<\\/a><\\/p>\"}');
/*!40000 ALTER TABLE `pk_system_widget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-03  6:08:21
