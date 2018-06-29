-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: phpmelody
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

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
-- Current Database: `phpmelody`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phpmelody` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `phpmelody`;

--
-- Table structure for table `art_articles`
--

DROP TABLE IF EXISTS `art_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art_articles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `category` varchar(100) NOT NULL DEFAULT '',
  `status` smallint(3) NOT NULL DEFAULT '0',
  `date` int(10) NOT NULL DEFAULT '0',
  `author` int(5) NOT NULL DEFAULT '0',
  `allow_comments` enum('0','1') NOT NULL DEFAULT '1',
  `comment_count` int(7) NOT NULL DEFAULT '0',
  `views` int(8) unsigned NOT NULL DEFAULT '0',
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `restricted` enum('0','1') NOT NULL DEFAULT '0',
  `article_slug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_articles`
--

LOCK TABLES `art_articles` WRITE;
/*!40000 ALTER TABLE `art_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_categories`
--

DROP TABLE IF EXISTS `art_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art_categories` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `parent_id` int(3) NOT NULL DEFAULT '0',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `published_articles` int(7) unsigned NOT NULL DEFAULT '0',
  `total_articles` int(7) NOT NULL DEFAULT '0',
  `position` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `meta_tags` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_categories`
--

LOCK TABLES `art_categories` WRITE;
/*!40000 ALTER TABLE `art_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_tags`
--

DROP TABLE IF EXISTS `art_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art_tags` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `article_id` int(6) NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `safe_tag` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_tags`
--

LOCK TABLES `art_tags` WRITE;
/*!40000 ALTER TABLE `art_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_activity`
--

DROP TABLE IF EXISTS `pm_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_activity` (
  `activity_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activity_type` varchar(50) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_type` varchar(50) NOT NULL DEFAULT '',
  `target_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target_type` varchar(50) NOT NULL DEFAULT '',
  `hide` enum('0','1') NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `activity_type` (`activity_type`),
  KEY `hide` (`hide`),
  KEY `objects` (`object_id`,`object_type`),
  KEY `targets` (`target_id`,`target_type`),
  KEY `user_id` (`user_id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_activity`
--

LOCK TABLES `pm_activity` WRITE;
/*!40000 ALTER TABLE `pm_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_ads`
--

DROP TABLE IF EXISTS `pm_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_ads` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `code` text NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `disable_stats` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_ads`
--

LOCK TABLES `pm_ads` WRITE;
/*!40000 ALTER TABLE `pm_ads` DISABLE KEYS */;
INSERT INTO `pm_ads` VALUES (1,'Header','Appears on all pages right under the horizontal menu','','0','0'),(2,'Footer','Appears on all pages right before the footer','','0','0'),(3,'Video Player','Appears on video pages under the video player. (Recommended max. width: 540px)','','0','0'),(4,'Article Page','Appears at the end of all articles (Recommended max. width: 540px)','','0','0'),(5,'Index page','Appears as the first widget block on the right site of your homepage (Recommended max. width: 250px)','','0','0'),(6,'Floating Skyscraper (Left)','Appears on the left side of the page container','','0','0'),(7,'Floating Skyscraper (Right)','Appears on the right side of the page container','','0','0'),(8,'mobile_header','Appears in the header of Mobile Melody (requires Mobile Melody)','','0','0'),(9,'mobile_footer','Appears in the footer of Mobile Melody (requires Mobile Melody)','','0','0'),(10,'mobile_video','Appears on the video pages of Mobile Melody (requires Mobile Melody)','','0','0'),(11,'mobile_article','Appears on the article pages of Mobile Melody (requires Mobile Melody)','','0','0');
/*!40000 ALTER TABLE `pm_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_ads_log`
--

DROP TABLE IF EXISTS `pm_ads_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_ads_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `ad_id` mediumint(6) NOT NULL DEFAULT '0',
  `ad_type` smallint(2) NOT NULL DEFAULT '0',
  `impressions` int(11) unsigned NOT NULL DEFAULT '0',
  `clicks` int(11) unsigned NOT NULL DEFAULT '0',
  `skips` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `date` (`date`,`ad_id`,`ad_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_ads_log`
--

LOCK TABLES `pm_ads_log` WRITE;
/*!40000 ALTER TABLE `pm_ads_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_ads_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_banlist`
--

DROP TABLE IF EXISTS `pm_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_banlist` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(6) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_banlist`
--

LOCK TABLES `pm_banlist` WRITE;
/*!40000 ALTER TABLE `pm_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_bin_rating_meta`
--

DROP TABLE IF EXISTS `pm_bin_rating_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_bin_rating_meta` (
  `vote_meta_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `up_vote_count` int(11) NOT NULL DEFAULT '0',
  `down_vote_count` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_meta_id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `score` (`score`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_bin_rating_meta`
--

LOCK TABLES `pm_bin_rating_meta` WRITE;
/*!40000 ALTER TABLE `pm_bin_rating_meta` DISABLE KEYS */;
INSERT INTO `pm_bin_rating_meta` VALUES (7,'14a4e06f8',1,0,1);
/*!40000 ALTER TABLE `pm_bin_rating_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_bin_rating_votes`
--

DROP TABLE IF EXISTS `pm_bin_rating_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_bin_rating_votes` (
  `vote_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `vote_value` tinyint(1) NOT NULL DEFAULT '0',
  `vote_ip` varchar(40) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`),
  KEY `uniq_id` (`uniq_id`,`vote_ip`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_bin_rating_votes`
--

LOCK TABLES `pm_bin_rating_votes` WRITE;
/*!40000 ALTER TABLE `pm_bin_rating_votes` DISABLE KEYS */;
INSERT INTO `pm_bin_rating_votes` VALUES (1,'14a4e06f8',1,'127.0.0.1',1,1528688047);
/*!40000 ALTER TABLE `pm_bin_rating_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_categories`
--

DROP TABLE IF EXISTS `pm_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_categories` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `published_videos` int(7) unsigned NOT NULL DEFAULT '0',
  `total_videos` int(7) NOT NULL DEFAULT '0',
  `position` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `meta_tags` text NOT NULL,
  `image` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_categories`
--

LOCK TABLES `pm_categories` WRITE;
/*!40000 ALTER TABLE `pm_categories` DISABLE KEYS */;
INSERT INTO `pm_categories` VALUES (1,0,'categoryone','Sample Category #1',1,1,1,'','',''),(2,1,'subcat','Sample Sub-cat',0,0,1,'','',''),(3,0,'categorytwo','Sample Category #2',1,1,2,'','','');
/*!40000 ALTER TABLE `pm_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_chart`
--

DROP TABLE IF EXISTS `pm_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_chart` (
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `views` int(9) unsigned NOT NULL DEFAULT '0',
  `views_this` int(6) NOT NULL DEFAULT '0',
  `views_last` int(6) NOT NULL DEFAULT '0',
  `views_seclast` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uniq_id`),
  KEY `views` (`views`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_chart`
--

LOCK TABLES `pm_chart` WRITE;
/*!40000 ALTER TABLE `pm_chart` DISABLE KEYS */;
INSERT INTO `pm_chart` VALUES ('14a4e06f8',1,1,0,0);
/*!40000 ALTER TABLE `pm_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_comments`
--

DROP TABLE IF EXISTS `pm_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_comments` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(50) DEFAULT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `added` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) NOT NULL DEFAULT '',
  `user_id` mediumint(7) NOT NULL DEFAULT '0',
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `up_vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `down_vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `score` int(10) NOT NULL DEFAULT '0',
  `report_count` mediumint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `score` (`score`),
  KEY `report_count` (`report_count`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_comments`
--

LOCK TABLES `pm_comments` WRITE;
/*!40000 ALTER TABLE `pm_comments` DISABLE KEYS */;
INSERT INTO `pm_comments` VALUES (1,'ac0266df0','admin','Lovely!',1528688047,'127.0.0.1',1,'1',0,0,0,0);
/*!40000 ALTER TABLE `pm_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_comments_reported`
--

DROP TABLE IF EXISTS `pm_comments_reported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_comments_reported` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`comment_id`),
  KEY `user_id_2` (`user_id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_comments_reported`
--

LOCK TABLES `pm_comments_reported` WRITE;
/*!40000 ALTER TABLE `pm_comments_reported` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_comments_reported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_config`
--

DROP TABLE IF EXISTS `pm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_config`
--

LOCK TABLES `pm_config` WRITE;
/*!40000 ALTER TABLE `pm_config` DISABLE KEYS */;
INSERT INTO `pm_config` VALUES (1,'contact_mail','noreply@domain.com'),(2,'thumb_from','2'),(3,'browse_page','16'),(4,'browse_articles','5'),(5,'player_w','638'),(6,'player_h','401'),(7,'player_w_index','638'),(8,'player_h_index','344'),(9,'player_w_favs','575'),(10,'player_h_favs','466'),(11,'player_w_embed','640'),(12,'player_h_embed','360'),(13,'isnew_days','7'),(14,'ispopular','100'),(15,'stopbadcomments','1'),(16,'comments_page','10'),(17,'template_f','default'),(18,'firstinstall','1528688047'),(19,'counterhtml',''),(20,'voth_cat','0'),(21,'views_from','2'),(22,'fav_limit','20'),(23,'version','2.6.1'),(24,'seomod','0'),(25,'new_videos','24'),(26,'top_videos','10'),(27,'chart_days','7'),(28,'chart_last_reset','1528688047'),(29,'guests_can_comment','1'),(30,'comm_moderation_level','0'),(31,'show_tags','0'),(32,'shuffle_tags','0'),(33,'tag_cloud_limit','20'),(34,'show_stats','0'),(35,'account_activation','0'),(36,'issmtp','1'),(37,'player_timecolor','545454'),(38,'player_bgcolor','5e5e5e'),(39,'player_autoplay','0'),(40,'player_autobuff','0'),(41,'player_watermarkurl',''),(42,'player_watermarklink',''),(43,'player_watermarkshow','fullscreen'),(44,'search_suggest','1'),(45,'use_hq_vids','1'),(46,'total_videoads','0'),(47,'videoads_delay','20'),(48,'default_lang','1'),(49,'last_video',''),(50,'top_videos_sort','views'),(51,'video_player','videojs'),(52,'gzip','0'),(53,'mod_article','0'),(54,'mail_server','mail.domain.com'),(55,'mail_port','25'),(56,'mail_user','noreply+domain.com'),(57,'mail_pass','domain'),(58,'show_ads','0'),(59,'total_videos','2'),(60,'total_articles','0'),(61,'total_pages','2'),(62,'homepage_title','PHP Melody'),(63,'homepage_description',''),(64,'homepage_keywords',''),(65,'moderator_can','manage_users:1;manage_comments:1;manage_videos:1;manage_articles:1;'),(66,'last_autosync','1528688047'),(67,'allow_user_uploadvideo','1'),(68,'allow_user_uploadvideo_bytes','10485760'),(69,'jwplayerskin','modieus.zip'),(70,'video_sitemap_options','a:4:{s:14:\"media_keywords\";b:0;s:14:\"media_category\";b:0;s:12:\"item_pubDate\";b:0;s:10:\"last_build\";i:0;}'),(71,'auto_feature','300'),(72,'bin_rating_allow_anon_voting','0'),(73,'published_articles','0'),(74,'published_videos','2'),(75,'comment_default_sort','added'),(76,'comment_rating_hide_threshold','3'),(77,'user_following_limit','1000'),(78,'mod_social','0'),(79,'activity_options','a:17:{s:6:\"follow\";i:1;s:8:\"unfollow\";i:0;s:5:\"watch\";i:0;s:4:\"like\";i:1;s:7:\"dislike\";i:1;s:8:\"favorite\";i:1;s:10:\"send-video\";i:0;s:12:\"upload-video\";i:1;s:13:\"suggest-video\";i:1;s:4:\"read\";i:0;s:7:\"comment\";i:1;s:4:\"join\";i:1;s:13:\"update-avatar\";i:1;s:12:\"update-cover\";i:1;s:6:\"status\";i:1;s:15:\"create-playlist\";i:1;s:15:\"update-playlist\";i:1;}'),(80,'pm_notifications_last_prune','1528688047'),(81,'total_preroll_ads','0'),(82,'preroll_ads_delay','300'),(83,'default_tpl_customizations','YTowOnt9'),(84,'custom_logo_url',''),(85,'article_widget_limit','10'),(86,'new_page_limit','50'),(87,'top_page_limit','50'),(88,'allow_registration','1'),(89,'allow_user_suggestvideo','1'),(90,'maintenance_mode','0'),(91,'maintenance_display_message',''),(92,'thumb_video_w','480'),(93,'thumb_video_h','360'),(94,'thumb_article_w','180'),(95,'thumb_article_h','180'),(96,'thumb_avatar_w','180'),(97,'thumb_avatar_h','180'),(98,'allow_nonlatin_usernames','1'),(99,'featured_autoplay','0'),(100,'jwplayerkey',''),(101,'auto_approve_suggested_videos','0'),(102,'keyboard_shortcuts','1'),(103,'show_addthis_widget','0'),(104,'playingnow_limit','9'),(105,'watch_related_limit','10'),(106,'watch_toprated_limit','10'),(107,'user_upload_daily_limit','20'),(108,'spambot_prevention','securimage'),(109,'recaptcha_public_key',''),(110,'recaptcha_private_key',''),(111,'comment_system','on'),(112,'unread_system_messages','0'),(113,'disable_indexing','0'),(114,'rtl_support','0'),(115,'allow_playlists','1'),(116,'playlists_limit','25'),(117,'playlists_items_limit','100'),(118,'admin_welcome','1'),(119,'admin_color_scheme','default'),(120,'vimeo_api_token',''),(121,'register_time_to_submit','3'),(122,'comment_system_primary','native'),(123,'comment_system_native','1'),(124,'comment_system_facebook','0'),(125,'comment_system_disqus','0'),(126,'disqus_shortname',''),(127,'fb_comment_sorting','social'),(128,'fb_app_id',''),(129,'youtube_api_key',''),(130,'homepage_featured_limit','10'),(131,'allow_embedding','1'),(132,'timezone','UTC'),(133,'jwplayer7key',''),(134,'homepage_featured_categories','a:0:{}'),(135,'eu_cookie_warning','0'),(136,'eu_cookie_warning_position','floating'),(137,'allow_emojis','1'),(138,'trashed_videos','0'),(139,'auto_approve_suggested_videos_verified','1'),(140,'allow_user_edit_video','1'),(141,'allow_user_delete_video','0'),(142,'cron_secret_key','');
/*!40000 ALTER TABLE `pm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_countries`
--

DROP TABLE IF EXISTS `pm_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_countries` (
  `countryid` smallint(3) NOT NULL AUTO_INCREMENT,
  `country` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`countryid`),
  KEY `location` (`country`)
) ENGINE=MyISAM AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_countries`
--

LOCK TABLES `pm_countries` WRITE;
/*!40000 ALTER TABLE `pm_countries` DISABLE KEYS */;
INSERT INTO `pm_countries` VALUES (500,'USA'),(184,'Albania'),(301,'Algeria'),(240,'American Samoa'),(241,'Andorra'),(302,'Angola'),(303,'Anguilla'),(304,'Antigua'),(115,'Antilles'),(305,'Argentina'),(185,'Armenia'),(306,'Aruba'),(307,'Australia'),(308,'Austria'),(186,'Azerbaijan'),(187,'Azores'),(309,'Bahamas'),(310,'Bahrain'),(311,'Bangladesh'),(312,'Barbados'),(313,'Barbuda'),(315,'Belgium'),(316,'Belize'),(314,'Belorus'),(317,'Benin'),(318,'Bermuda'),(319,'Bhutan'),(320,'Bolivia'),(321,'Bonaire'),(188,'Bosnia-Hercegovina'),(322,'Botswana'),(324,'Br. Virgin Islands'),(323,'Brazil'),(325,'Brunei'),(326,'Bulgaria'),(327,'Burkina Faso'),(328,'Burundi'),(189,'Caicos Island'),(329,'Cameroon'),(330,'Canada'),(190,'Canary Islands'),(331,'Cape Verde'),(332,'Cayman Islands'),(333,'Central African Republic'),(334,'Chad'),(335,'Channel Islands'),(336,'Chile'),(337,'China'),(338,'Colombia'),(191,'Commonwealth of Ind'),(339,'Congo'),(242,'Cook Islands'),(192,'Cooper Island'),(340,'Costa Rica'),(193,'Cote D\'Ivoire'),(194,'Croatia'),(341,'Curacao'),(342,'Cyprus'),(343,'Czech Republic'),(344,'Denmark'),(345,'Djibouti'),(346,'Dominica'),(347,'Dominican Republic'),(348,'Ecuador'),(349,'Egypt'),(350,'El Salvador'),(351,'England'),(352,'Equatorial Guinea'),(353,'Estonia'),(354,'Ethiopia'),(355,'Fiji'),(356,'Finland'),(357,'France'),(358,'French Guiana'),(243,'French Polynesia'),(254,'Futuna Island'),(359,'Gabon'),(360,'Gambia'),(215,'Georgia'),(361,'Germany'),(362,'Ghana'),(216,'Gibraltar'),(363,'Greece'),(364,'Grenada'),(217,'Grenland'),(365,'Guadeloupe'),(366,'Guam'),(367,'Guatemala'),(368,'Guinea'),(369,'Guinea-Bissau'),(370,'Guyana'),(195,'Haiti'),(244,'Holland'),(371,'Honduras'),(372,'Hong Kong'),(373,'Hungary'),(374,'Iceland'),(375,'India'),(376,'Indonesia'),(377,'Iran'),(196,'Iraq'),(378,'Ireland, Northern'),(379,'Ireland, Republic of'),(197,'Isle of Man'),(380,'Israel'),(381,'Italy'),(382,'Ivory Coast'),(383,'Jamaica'),(384,'Japan'),(385,'Jordan'),(198,'Jost Van Dyke Island'),(218,'Kampuchea'),(199,'Kazakhstan'),(386,'Kenya'),(219,'Kiribati'),(239,'Korea'),(387,'Korea, South'),(256,'Kosrae'),(388,'Kuwait'),(200,'Kyrgyzstan'),(220,'Laos'),(389,'Latvia'),(390,'Lebanon'),(391,'Lesotho'),(221,'Liberia'),(392,'Liechtenstein'),(393,'Lithuania'),(394,'Luxembourg'),(395,'Macau'),(222,'Macedonia'),(396,'Madagascar'),(201,'Madeira Islands'),(202,'Malagasy'),(397,'Malawi'),(398,'Malaysia'),(399,'Maldives'),(100,'Mali'),(101,'Malta'),(102,'Marshall Islands'),(103,'Martinique'),(104,'Mauritania'),(105,'Mauritius'),(106,'Mexico'),(107,'Micronesia'),(203,'Moldova'),(108,'Monaco'),(223,'Mongolia'),(109,'Montserrat'),(110,'Morocco'),(111,'Mozambique'),(224,'Myanmar'),(112,'Namibia'),(225,'Nauru'),(113,'Nepal'),(114,'Netherlands'),(204,'Nevis'),(246,'Nevis (St. Kitts)'),(116,'New Caledonia'),(117,'New Zealand'),(118,'Nicaragua'),(119,'Niger'),(120,'Nigeria'),(226,'Niue'),(258,'Norfolk Island'),(205,'Norman Island'),(257,'Northern Mariana Island'),(121,'Norway'),(122,'Oman'),(123,'Pakistan'),(124,'Palau'),(125,'Panama'),(126,'Papua New Guinea'),(127,'Paraguay'),(128,'Peru'),(129,'Philippines'),(130,'Poland'),(260,'Ponape'),(131,'Portugal'),(132,'Qatar'),(133,'Reunion'),(134,'Romania'),(261,'Rota'),(135,'Russia'),(136,'Rwanda'),(137,'Saba'),(147,'Saipan'),(228,'San Marino'),(229,'Sao Tome'),(148,'Saudi Arabia'),(149,'Scotland'),(150,'Senegal'),(207,'Serbia'),(151,'Seychelles'),(152,'Sierra Leone'),(153,'Singapore'),(208,'Slovakia'),(209,'Slovenia'),(210,'Solomon Islands'),(154,'Somalia'),(155,'South Africa'),(156,'Spain'),(157,'Sri Lanka'),(138,'St. Barthelemy'),(206,'St. Christopher'),(139,'St. Croix'),(140,'St. Eustatius'),(141,'St. John'),(142,'St. Kitts'),(143,'St. Lucia'),(144,'St. Maarten'),(245,'St. Martin'),(145,'St. Thomas'),(146,'St. Vincent'),(158,'Sudan'),(159,'Suriname'),(160,'Swaziland'),(161,'Sweden'),(162,'Switzerland'),(163,'Syria'),(247,'Tahiti'),(164,'Taiwan'),(211,'Tajikistan'),(165,'Tanzania'),(166,'Thailand'),(248,'Tinian'),(167,'Togo'),(230,'Tonaga'),(249,'Tonga'),(250,'Tortola'),(168,'Trinidad and Tobago'),(251,'Truk'),(169,'Tunisia'),(170,'Turkey'),(212,'Turkmenistan'),(171,'Turks and Caicos Island'),(231,'Tuvalu'),(175,'U.S. Virgin Islands'),(172,'Uganda'),(173,'Ukraine'),(252,'Union Island'),(174,'United Arab Emirates'),(176,'Uruguay'),(262,'United Kingdom'),(232,'Uzbekistan'),(233,'Vanuatu'),(177,'Vatican City'),(178,'Venezuela'),(234,'Vietnam'),(235,'Virgin Islands (Brit'),(236,'Virgin Islands (U.S.'),(237,'Wake Island'),(179,'Wales'),(253,'Wallis Island'),(238,'Western Samoa'),(255,'Yap'),(180,'Yemen, Republic of'),(213,'Yugoslavia'),(181,'Zaire'),(182,'Zambia'),(183,'Zimbabwe'),(501,'Kosova'),(502,'Afghanistan'),(503,'Libya'),(504,'Eritrea');
/*!40000 ALTER TABLE `pm_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_cron_jobs`
--

DROP TABLE IF EXISTS `pm_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_cron_jobs` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `exec_frequency` int(10) unsigned NOT NULL DEFAULT '86400',
  `last_exec_time` int(10) unsigned NOT NULL DEFAULT '0',
  `rel_object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_id`),
  KEY `status` (`status`,`state`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_cron_jobs`
--

LOCK TABLES `pm_cron_jobs` WRITE;
/*!40000 ALTER TABLE `pm_cron_jobs` DISABLE KEYS */;
INSERT INTO `pm_cron_jobs` VALUES (1,'Video Status Checker','vscheck','stopped','ready',259200,0,9,'a:5:{s:9:\"sql_start\";i:0;s:12:\"time_started\";i:0;s:16:\"videos_processed\";i:0;s:13:\"video_sorting\";s:6:\"latest\";s:11:\"video_limit\";s:2:\"20\";}',1528688047);
/*!40000 ALTER TABLE `pm_cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_cron_log`
--

DROP TABLE IF EXISTS `pm_cron_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_cron_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_cron_log`
--

LOCK TABLES `pm_cron_log` WRITE;
/*!40000 ALTER TABLE `pm_cron_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_cron_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_embed_code`
--

DROP TABLE IF EXISTS `pm_embed_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_embed_code` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `embed_code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_embed_code`
--

LOCK TABLES `pm_embed_code` WRITE;
/*!40000 ALTER TABLE `pm_embed_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_embed_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_import_csv_files`
--

DROP TABLE IF EXISTS `pm_import_csv_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_import_csv_files` (
  `file_id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `upload_date` int(10) unsigned NOT NULL DEFAULT '0',
  `items_detected` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `items_processed` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `items_skipped` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `items_with_error` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `items_imported` mediumint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_import_csv_files`
--

LOCK TABLES `pm_import_csv_files` WRITE;
/*!40000 ALTER TABLE `pm_import_csv_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_import_csv_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_import_csv_items`
--

DROP TABLE IF EXISTS `pm_import_csv_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_import_csv_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` mediumint(6) unsigned NOT NULL,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `video_title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `yt_id` varchar(50) NOT NULL DEFAULT '',
  `yt_length` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `yt_thumb` varchar(255) NOT NULL DEFAULT '',
  `category` varchar(30) NOT NULL DEFAULT '',
  `added` int(10) unsigned NOT NULL DEFAULT '0',
  `site_views` int(9) NOT NULL DEFAULT '0',
  `url_flv` varchar(255) NOT NULL DEFAULT '',
  `source_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `restricted` enum('0','1') NOT NULL DEFAULT '0',
  `allow_comments` enum('0','1') NOT NULL DEFAULT '1',
  `allow_embedding` enum('0','1') NOT NULL DEFAULT '1',
  `video_slug` varchar(255) NOT NULL,
  `mp4` varchar(200) NOT NULL,
  `direct` varchar(200) NOT NULL,
  `tags` text NOT NULL,
  `embeddable` enum('0','1') NOT NULL DEFAULT '0',
  `private` enum('0','1') NOT NULL DEFAULT '0',
  `geo-restriction` text NOT NULL,
  `has_errors` enum('0','1') NOT NULL DEFAULT '0',
  `errors` text NOT NULL,
  `processed` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `yt_id` (`yt_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_import_csv_items`
--

LOCK TABLES `pm_import_csv_items` WRITE;
/*!40000 ALTER TABLE `pm_import_csv_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_import_csv_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_import_subscriptions`
--

DROP TABLE IF EXISTS `pm_import_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_import_subscriptions` (
  `sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL DEFAULT '',
  `sub_type` varchar(20) NOT NULL DEFAULT '',
  `last_query_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_query_results` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_import_subscriptions`
--

LOCK TABLES `pm_import_subscriptions` WRITE;
/*!40000 ALTER TABLE `pm_import_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_import_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_internal_log`
--

DROP TABLE IF EXISTS `pm_internal_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_internal_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` datetime NOT NULL,
  `log_info` text NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_internal_log`
--

LOCK TABLES `pm_internal_log` WRITE;
/*!40000 ALTER TABLE `pm_internal_log` DISABLE KEYS */;
INSERT INTO `pm_internal_log` VALUES (1,'2018-06-11 03:34:07','Installed');
/*!40000 ALTER TABLE `pm_internal_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_languages`
--

DROP TABLE IF EXISTS `pm_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_languages` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `tag` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_languages`
--

LOCK TABLES `pm_languages` WRITE;
/*!40000 ALTER TABLE `pm_languages` DISABLE KEYS */;
INSERT INTO `pm_languages` VALUES (1,'Abkhazian','ab'),(2,'Afar','aa'),(3,'Afrikaans','af'),(4,'Albanian','sq'),(5,'Amharic','am'),(6,'Arabic','ar'),(7,'Aragonese','an'),(8,'Armenian','hy'),(9,'Assamese','as'),(10,'Aymara','ay'),(11,'Azerbaijani','az'),(12,'Bashkir','ba'),(13,'Basque','eu'),(14,'Bengali (Bangla)','bn'),(15,'Bhutani','dz'),(16,'Bihari','bh'),(17,'Bislama','bi'),(18,'Breton','br'),(19,'Bulgarian','bg'),(20,'Burmese','my'),(21,'Byelorussian (Belarusian)','be'),(22,'Cambodian','km'),(23,'Catalan','ca'),(24,'Chinese (Simplified)','zh'),(25,'Chinese (Traditional)','zh'),(26,'Corsican','co'),(27,'Croatian','hr'),(28,'Czech','cs'),(29,'Danish','da'),(30,'Dutch','nl'),(31,'English','en'),(32,'Esperanto','eo'),(33,'Estonian','et'),(34,'Faeroese','fo'),(35,'Farsi','fa'),(36,'Fiji','fj'),(37,'Finnish','fi'),(38,'French','fr'),(39,'Frisian','fy'),(40,'Galician','gl'),(41,'Gaelic (Scottish)','gd'),(42,'Gaelic (Manx)','gv'),(43,'Georgian','ka'),(44,'German','de'),(45,'Greek','el'),(46,'Greenlandic','kl'),(47,'Guarani','gn'),(48,'Gujarati','gu'),(49,'Haitian Creole','ht'),(50,'Hausa','ha'),(51,'Hebrew','he'),(52,'Hindi','hi'),(53,'Hungarian','hu'),(54,'Icelandic','is'),(55,'Ido','io'),(56,'Indonesian','id'),(57,'Interlingua','ia'),(58,'Interlingue','ie'),(59,'Inuktitut','iu'),(60,'Inupiak','ik'),(61,'Irish','ga'),(62,'Italian','it'),(63,'Japanese','ja'),(64,'Javanese','jv'),(65,'Kannada','kn'),(66,'Kashmiri','ks'),(67,'Kazakh','kk'),(68,'Kinyarwanda (Ruanda)','rw'),(69,'Kirghiz','ky'),(70,'Kirundi (Rundi)','rn'),(71,'Korean','ko'),(72,'Kurdish','ku'),(73,'Laothian','lo'),(74,'Latin','la'),(75,'Latvian (Lettish)','lv'),(76,'Limburgish (Limburger)','li'),(77,'Lingala','ln'),(78,'Lithuanian','lt'),(79,'Macedonian','mk'),(80,'Malagasy','mg'),(81,'Malay','ms'),(82,'Malayalam','ml'),(83,'Maltese','mt'),(84,'Maori','mi'),(85,'Marathi','mr'),(86,'Moldavian','mo'),(87,'Mongolian','mn'),(88,'Nauru','na'),(89,'Nepali','ne'),(90,'Norwegian','no'),(91,'Occitan','oc'),(92,'Oriya','or'),(93,'Oromo (Afan Galla)','om'),(94,'Pashto (Pushto)','ps'),(95,'Polish','pl'),(96,'Portuguese','pt'),(97,'Punjabi','pa'),(98,'Quechua','qu'),(99,'Rhaeto-Romance','rm'),(100,'Romanian','ro'),(101,'Russian','ru'),(102,'Samoan','sm'),(103,'Sangro','sg'),(104,'Sanskrit','sa'),(105,'Serbian','sr'),(106,'Serbo-Croatian','sh'),(107,'Sesotho','st'),(108,'Setswana','tn'),(109,'Shona','sn'),(110,'Sichuan Yi','ii'),(111,'Sindhi','sd'),(112,'Sinhalese','si'),(113,'Siswati','ss'),(114,'Slovak','sk'),(115,'Slovenian','sl'),(116,'Somali','so'),(117,'Spanish','es'),(118,'Sundanese','su'),(119,'Swahili (Kiswahili)','sw'),(120,'Swedish','sv'),(121,'Tagalog','tl'),(122,'Tajik','tg'),(123,'Tamil','ta'),(124,'Tatar','tt'),(125,'Telugu','te'),(126,'Thai','th'),(127,'Tibetan','bo'),(128,'Tigrinya','ti'),(129,'Tonga','to'),(130,'Tsonga','ts'),(131,'Turkish','tr'),(132,'Turkmen','tk'),(133,'Twi','tw'),(134,'Uighur','ug'),(135,'Ukrainian','uk'),(136,'Urdu','ur'),(137,'Uzbek','uz'),(138,'Vietnamese','vi'),(139,'Volap&uuml;k','vo'),(140,'Wallon','wa'),(141,'Welsh','cy'),(142,'Wolof','wo'),(143,'Xhosa','xh'),(144,'Yiddish','yi'),(145,'Yoruba','yo'),(146,'Zulu','zu');
/*!40000 ALTER TABLE `pm_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_log`
--

DROP TABLE IF EXISTS `pm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `log_msg` text NOT NULL,
  `area` varchar(50) NOT NULL DEFAULT '',
  `added` int(11) NOT NULL DEFAULT '0',
  `msg_type` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `area` (`area`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_log`
--

LOCK TABLES `pm_log` WRITE;
/*!40000 ALTER TABLE `pm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_meta`
--

DROP TABLE IF EXISTS `pm_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_type` smallint(3) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`,`item_type`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_meta`
--

LOCK TABLES `pm_meta` WRITE;
/*!40000 ALTER TABLE `pm_meta` DISABLE KEYS */;
INSERT INTO `pm_meta` VALUES (4,1,3,'_meta_keywords',''),(5,1,3,'_meta_description',''),(6,2,3,'_meta_keywords',''),(7,2,3,'_meta_description','');
/*!40000 ALTER TABLE `pm_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_notifications`
--

DROP TABLE IF EXISTS `pm_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_notifications` (
  `notification_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activity_type` varchar(50) NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `seen` enum('0','1') NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `to_user_id` (`to_user_id`,`seen`),
  KEY `activity_type` (`activity_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_notifications`
--

LOCK TABLES `pm_notifications` WRITE;
/*!40000 ALTER TABLE `pm_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_pages`
--

DROP TABLE IF EXISTS `pm_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_pages` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `author` int(5) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` smallint(3) NOT NULL DEFAULT '0',
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `views` int(8) unsigned NOT NULL DEFAULT '0',
  `showinmenu` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_pages`
--

LOCK TABLES `pm_pages` WRITE;
/*!40000 ALTER TABLE `pm_pages` DISABLE KEYS */;
INSERT INTO `pm_pages` VALUES (1,'Terms of Agreement','<h2>Code of Conduct</h2>\r\n<p>In using this Service, you must behave in a civil and respectful manner at all times. Further, you will not:</p>\r\n<ul>\r\n<li>Act in a deceptive manner by, among other things, impersonating any person;</li>\r\n<li>Harass or stalk any other person;</li>\r\n<li>Harm or exploit minors;</li>\r\n<li>Distribute \"spam\";</li>\r\n<li>Collect information about others; or</li>\r\n<li>Advertise or solicit others to purchase any product or service within the Site (unless you are an official partner or advertiser and have a written agreement with us).</li>\r\n</ul>\r\n<p>The Site owner has the right, but not the obligation, to monitor all conduct on and content submitted to the Service.</p>\r\n<hr />\r\n<h2>Membership</h2>\r\n<p>REGISTRATION: To fully use the the Service, you must register as a member by providing a user name, password, and valid email address. You must provide complete and accurate registration information and notify us if your information changes. If you are a business, government, or non-profit entity, the person whose email address is associated with the account must have the authority to bind the entity to this Agreement.</p>\r\n<p>USER NAME: We encourage you to use your real name. If you are a business, government, or non-profit entity, you must use the actual name of your organization. You may not use someone else\'s name, a name that violates any third party right, or a name that is obscene or otherwise objectionable.</p>\r\n<p>ACCOUNT SECURITY: You are responsible for all activity that occurs under your account, including any activity by unauthorized users. You must not allow others to use your account. You must safeguard the confidentiality of your password. If you are using a computer that others have access to, you must log out of your account after using the Service.</p>\r\n<hr />\r\n<h2>Content Restrictions</h2>\r\n<p>You may not upload, post, or transmit (collectively, \"submit\") any video, image, text, audio recording, or other work (collectively, \"content\") that:</p>\r\n<ul>\r\n<li>Infringes any third party\'s copyrights or other rights (e.g., trademark, privacy rights, etc.);</li>\r\n<li>Contains sexually explicit content or pornography (provided, however, that non-sexual nudity is permitted);</li>\r\n<li>Contains hateful, defamatory, or discriminatory content or incites hatred against any individual or group;</li>\r\n<li>Exploits minors;</li>\r\n<li>Depicts unlawful acts or extreme violence;</li>\r\n<li>Depicts animal cruelty or extreme violence towards animals;</li>\r\n<li>Promotes fraudulent schemes, multi level marketing (MLM) schemes, get rich quick schemes, online gaming and gambling, cash gifting, work from home businesses, or any other dubious money-making ventures; or Violates any law.</li>\r\n</ul>',1,1366891687,1,'terms-toa',0,'0'),(2,'404 Error','<h3>Sorry, page not found!</h3>\r\n<p>The page you are looking for could not be found. Please check the link you followed to get here and try again.</p>',1,1366891687,1,'404',0,'0');
/*!40000 ALTER TABLE `pm_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_playlist_items`
--

DROP TABLE IF EXISTS `pm_playlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_playlist_items` (
  `list_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `video_id` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_item_id`),
  KEY `list_id` (`list_id`),
  KEY `video_id` (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_playlist_items`
--

LOCK TABLES `pm_playlist_items` WRITE;
/*!40000 ALTER TABLE `pm_playlist_items` DISABLE KEYS */;
INSERT INTO `pm_playlist_items` VALUES (1,3,1,1),(2,2,2,1);
/*!40000 ALTER TABLE `pm_playlist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_playlists`
--

DROP TABLE IF EXISTS `pm_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_playlists` (
  `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_uniq_id` varchar(25) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` smallint(2) NOT NULL DEFAULT '0',
  `items_count` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `visibility` smallint(2) NOT NULL DEFAULT '0',
  `sorting` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `thumb_source` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`list_id`),
  KEY `list_uniq_id` (`list_uniq_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_playlists`
--

LOCK TABLES `pm_playlists` WRITE;
/*!40000 ALTER TABLE `pm_playlists` DISABLE KEYS */;
INSERT INTO `pm_playlists` VALUES (1,'FBA46DCBE461',1,1,0,1528688047,0,'default','','',''),(2,'913554463FAF',1,2,1,1528688047,1,'default','','',''),(3,'23BA3BE660A1',1,3,1,1528688047,1,'default','','',''),(4,'6A6FCDD83A1A',1,4,0,1528688047,0,'date-added-desc','','',''),(5,'0A01E4872993',1,0,0,1528688458,1,'default','123','','');
/*!40000 ALTER TABLE `pm_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_preroll_ads`
--

DROP TABLE IF EXISTS `pm_preroll_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_preroll_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `duration` mediumint(5) unsigned NOT NULL DEFAULT '5',
  `user_group` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `impressions` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `code` text NOT NULL,
  `options` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_preroll_ads`
--

LOCK TABLES `pm_preroll_ads` WRITE;
/*!40000 ALTER TABLE `pm_preroll_ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_preroll_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_ratings`
--

DROP TABLE IF EXISTS `pm_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_ratings` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `total_votes` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `total_value` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `used_ips` longtext,
  `which_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_ratings`
--

LOCK TABLES `pm_ratings` WRITE;
/*!40000 ALTER TABLE `pm_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_reports`
--

DROP TABLE IF EXISTS `pm_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_reports` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `r_type` enum('1','2') NOT NULL DEFAULT '1',
  `entry_id` varchar(20) NOT NULL DEFAULT '',
  `added` varchar(11) NOT NULL DEFAULT '',
  `reason` varchar(100) NOT NULL DEFAULT '',
  `submitted` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_reports`
--

LOCK TABLES `pm_reports` WRITE;
/*!40000 ALTER TABLE `pm_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_searches`
--

DROP TABLE IF EXISTS `pm_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_searches` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `string` varchar(100) NOT NULL DEFAULT '',
  `hits` mediumint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_searches`
--

LOCK TABLES `pm_searches` WRITE;
/*!40000 ALTER TABLE `pm_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_sources`
--

DROP TABLE IF EXISTS `pm_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_sources` (
  `source_id` smallint(2) NOT NULL AUTO_INCREMENT,
  `source_name` varchar(20) NOT NULL DEFAULT '',
  `source_rule` varchar(40) NOT NULL DEFAULT '',
  `url_example` varchar(100) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT '0',
  `flv_player_support` enum('0','1') NOT NULL DEFAULT '0',
  `embed_player_support` enum('0','1') NOT NULL DEFAULT '0',
  `embed_code` text NOT NULL,
  `user_choice` varchar(15) NOT NULL DEFAULT '',
  `vscheck_support` enum('1','0') NOT NULL DEFAULT '0',
  `vscheck_autopilot` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_sources`
--

LOCK TABLES `pm_sources` WRITE;
/*!40000 ALTER TABLE `pm_sources` DISABLE KEYS */;
INSERT INTO `pm_sources` VALUES (1,'localhost','/(.*?)\\.flv/i','',0,'1','0','','flvplayer','1','0'),(2,'other','/(.*?)\\.flv/i','http://www.example.com/uploads/video.flv',0,'1','0','','flvplayer','1','0'),(3,'youtube','/youtube\\./i','http://www.youtube.com/watch?v=[VIDEO ID]',0,'1','1','<iframe src=\"//www.youtube.com/embed/%%yt_id%%?hl=en_US&hd=%%use_hq_vids%%&cc_load_policy=1&rel=0&fs=1&autoplay=%%player_autoplay%%&color2=0x%%player_bgcolor%%&showsearch=0&showinfo=0&iv_load_policy=3&modestbranding=1\" width=\"100%\" height=\"%%player_h%%\" frameborder=\"0\" allowfullscreen></iframe>','flvplayer','1','0'),(5,'dailymotion','/dailymotion\\./i','http://www.dailymotion.com/en/category/[VIDEO ID]_video-title-here',0,'0','1','<iframe frameborder=\"0\" width=\"100%\" height=\"%%player_h%%\" src=\"//www.dailymotion.com/embed/video/%%yt_id%%&autoplay=%%player_autoplay%%&highlight=20A8E1&info=0&logo=0&related=0&startscreen=html&html=1\" allowfullscreen></iframe>','embed','1','0'),(6,'metacafe','/metacafe\\.com/i','http://www.metacafe.com/watch/[VIDEO ID]/video_title_here/',0,'1','1','<embed src=\"//www.metacafe.com/fplayer/%%yt_id%%/video.swf\" width=\"%%player_w%%\" height=\"%%player_h%%\" wmode=\"%%player_wmode%%\" pluginspage=\"//www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" allowFullScreen=\"true\" allowScriptAccess=\"always\" name=\"Metacafe_%%yt_id%%\"> \r\n</embed>','flvplayer','0','0'),(7,'myspace','/myspace\\.com/i','http://www.myspace.com/video/channel/video-title/123456781',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"allowFullScreen\" value=\"true\"/>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"/>\r\n <param name=\"movie\" value=\"//mediaservices.myspace.com/services/media/embed.aspx/m=%%yt_id%%,t=1,mt=video\"/>\r\n <embed src=\"//mediaservices.myspace.com/services/media/embed.aspx/m=%%yt_id%%,t=1,mt=video\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowFullScreen=\"true\" type=\"application/x-shockwave-flash\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','embed','0','0'),(9,'veoh','/veoh\\.com/i','http://www.veoh.com/collection/Artist-or-Group-Name/watch/[VIDEO ID]',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" id=\"veohFlashPlayer\" name=\"veohFlashPlayer\">\r\n <param name=\"movie\" value=\"//www.veoh.com/static/swf/webplayer/WebPlayer.swf?permalinkId=%%yt_id%%&player=videodetailsembedded&videoAutoPlay=%%player_autoplay%%&id=anonymous\"></param>\r\n <param name=\"allowFullScreen\" value=\"true\"></param>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"allowscriptaccess\" value=\"always\"></param>\r\n <embed src=\"//www.veoh.com/static/swf/webplayer/WebPlayer.swf?permalinkId=%%yt_id%%&player=videodetailsembedded&videoAutoPlay=%%player_autoplay%%&id=anonymous\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"%%player_w%%\" height=\"%%player_h%%\" id=\"veohFlashPlayerEmbed\" name=\"veohFlashPlayerEmbed\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','embed','0','0'),(10,'break','/break\\.com/i','http://www.break.com/index/video-title-here.html',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//embed.break.com/%%yt_id%%\"></param>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"allowScriptAccess\" value=\"always\"></param>\r\n <embed src=\"//embed.break.com/%%yt_id%%\" type=\"application/x-shockwave-flash\" allowScriptAccess=\"always\" wmode=\"%%player_wmode%%\" width=\"%%player_w%%\" height=\"%%player_h%%\"></embed>\r\n</object>','flvplayer','0','0'),(11,'myvideo','/myvideo\\.de/i','http://www.myvideo.de/watch/[VIDEO ID]/Video_title_here/',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//www.myvideo.de/movie/%%yt_id%%\"></param>\r\n <param name=\"AllowFullscreen\" value=\"true\"></param>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"AllowScriptAccess\" value=\"always\"></param>\r\n <embed src=\"//www.myvideo.de/movie/%%yt_id%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','flvplayer','0','0'),(71,'nhaccuatui','/nhaccuatui\\.com/i','http://www.nhaccuatui.com/mv4u/xem-clip/cjidlr07OG3N/phai-lam-the-nao-wanbi-tuan-anh.html',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"%%url_flv%%\" />\r\n <param name=\"quality\" value=\"high\" />\r\n <param name=\"wmode\" value=\"%%player_wmode%%\" />\r\n <param name=\"allowscriptaccess\" value=\"always\" />\r\n <embed src=\"%%url_flv%%\" allowscriptaccess=\"always\" quality=\"high\" wmode=\"%%player_wmode%%\" type=\"application/x-shockwave-flash\" width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n </embed>\r\n</object>','embed','0','0'),(72,'kure','/kure\\.tv/i','http://www.kure.tv/otomobil/494-surucu/bmw-z4-test-surusu/151-Bolum/87652/',0,'0','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//www.kure.tv/VideoEmbed?ID=%%yt_id%%\" hspace=\"0\" vspace=\"0\" scrolling=\"no\" frameborder=\"0\" allowfullscreen=\"true\"></iframe>','embed','0','0'),(43,'windows media player','/-(.*?)\\.(wmv|asf|wma)/i','http://www.example.com/video.wmv',0,'0','1','<object id=\"wmv\" width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6\" type=\"application/x-oleobject\">\r\n<param name=\"URL\" value=\"%%url_flv%%\">\r\n<param name=\"AutoStart\" value=\"true\">\r\n<param name=\"ShowControls\" value=\"true\">\r\n<param name=\"ShowStatusBar\" value=\"false\">\r\n<param name=\"ShowDisplay\" value=\"false\">\r\n<param name=\"EnableFullScreenControls\" value=\"true\">\r\n<param name=\"FullScreenMode\" value=\"true\">\r\n<param name=\"wmode\" value=\"%%player_wmode%%\"></param> \r\n<embed type=\"application/x-mplayer2\" src=\"%%url_flv%%\" name=\"MediaPlayer\"\r\nwidth=\"%%player_w%%\" height=\"%%player_h%%\" ShowControls=\"1\" ShowStatusBar=\"0\" ShowDisplay=\"0\" AutoStart=\"%%player_autoplay%%\" EnableFullScreenControls=\"1\" FullScreenMode=\"1\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','embed','0','0'),(69,'veevr','/veevr\\.com/i','http://veevr.com/videos/videoID',0,'0','1','<iframe src=\"//veevr.com/embed/%%yt_id%%?w=%%player_w%%&h=%%player_h%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" scrolling=\"no\" frameborder=\"0\"></iframe>','embed','0','0'),(70,'123video.nl','/123video\\.nl/i','http://www.123video.nl/playvideos.asp?MovieID=1234567',0,'0','1','<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"//fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0\" width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//www.123video.nl/123video_emb.swf?mediaSrc=%%yt_id%%\"></param>\r\n <param name=\"quality\" value=\"high\"></param>\r\n <param name=\"allowScriptAccess\" value=\"always\"></param>\r\n <param name=\"allowFullScreen\" value=\"true\"></param>\r\n <embed src=\"//www.123video.nl/123video_emb.swf?mediaSrc=%%yt_id%%\" quality=\"high\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowfullscreen=\"true\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" pluginspage=\"//www.macromedia.com/go/getflashplayer\" />\r\n</object>','embed','0','0'),(16,'vimeo','/vimeo\\.com/i','http://vimeo.com/[VIDEO ID]',0,'1','1','<iframe src=\"//player.vimeo.com/video/%%yt_id%%?color=20A8E1&autoplay=%%player_autoplay%%&title=0&byline=0&badge=0\" width=\"100%\" height=\"%%player_h%%\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','flvplayer','1','0'),(17,'trilulilu','/trilulilu\\.ro/i','http://www.trilulilu.ro/user/[VIDEO ID]',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\"> <param name=\"wmode\" value=\"%%player_wmode%%\"></param> <param name=\"movie\" value=\"//embed.trilulilu.ro/video/%%username%%/%%yt_id%%.swf\"></param> <param name=\"allowFullScreen\" value=\"true\"></param> <param name=\"allowscriptaccess\" value=\"always\"></param> <param name=\"flashvars\" value=\"username=%%username%%&hash=%%yt_id%%&color=0x%%player_bgcolor%%\"></param> <embed src=\"//embed.trilulilu.ro/video/%%username%%/%%yt_id%%.swf\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"%%player_w%%\" height=\"%%player_h%%\" wmode=\"%%player_wmode%%\" flashvars=\"username=%%username%%&hash=%%yt_id%%&color=0x%%player_bgcolor%%\"></embed> </object>','flvplayer','0','0'),(18,'bliptv','/blip\\.tv/i','http://blip.tv/user/video-title-[VIDEO ID]',0,'1','1','<embed src=\"//blip.tv/play/%%yt_id%%\" type=\"application/x-shockwave-flash\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowscriptaccess=\"always\" allowfullscreen=\"true\" wmode=\"%%player_wmode%%\"></embed> ','embed','0','0'),(19,'sevenload','/sevenload\\.com/i','http://en.sevenload.com/videos/[VIDEO ID]-Video-title-here',0,'1','1','<object type=\"application/x-shockwave-flash\" data=\"//static.sevenload.com/swf/player/player.swf?configPath=http%3A%2F%2Fflash.sevenload.com%2Fplayer%3FportalId%3Den%26autoplay%3D%%player_autoplay%%%26mute%3D0%26itemId%3D%%yt_id%%&locale=en_US&autoplay=%%player_autoplay%%\" width=\"%%player_w%%\" height=\"%%player_h%%\"> <param name=\"allowFullscreen\" value=\"true\" /> <param name=\"allowScriptAccess\" value=\"always\" /> <param name=\"movie\" value=\"//static.sevenload.com/swf/player/player.swf?configPath=http%3A%2F%2Fflash.sevenload.com%2Fplayer%3FportalId%3Den%26autoplay%3D%%player_autoplay%%%26mute%3D0%26itemId%3D%%yt_id%%&locale=en_US&autoplay=%%player_autoplay%%\" />','flvplayer','0','0'),(20,'funnyordie','/funnyordie\\.com/i','http://www.funnyordie.com/videos/[VIDEO ID]',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" id=\"ordie_player_%%yt_id%%\">\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"movie\" value=\"//player.ordienetworks.com/flash/fodplayer.swf\" />\r\n <param name=\"flashvars\" value=\"key=%%yt_id%%\" />\r\n <param name=\"allowfullscreen\" value=\"true\" />\r\n <param name=\"allowscriptaccess\" value=\"always\"></param>\r\n <embed width=\"%%player_w%%\" height=\"%%player_h%%\" flashvars=\"key=%%yt_id%%\" allowfullscreen=\"true\" allowscriptaccess=\"always\" quality=\"high\" src=\"//player.ordienetworks.com/flash/fodplayer.swf\" name=\"ordie_player_%%yt_id%%\" type=\"application/x-shockwave-flash\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','flvplayer','0','0'),(68,'clip.vn','/clip\\.vn//i','http://clip.vn/watch/Video-title,videoID',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//clip.vn/w/%%yt_id%%\"/>\r\n <param name=\"allowFullScreen\" value=\"true\"/>\r\n <param name=\"allowScriptAccess\" value=\"always\"/>\r\n <embed type=\"application/x-shockwave-flash\" allowFullScreen=\"true\" allowScriptAccess=\"always\" width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//clip.vn/w/%%yt_id%%\"></embed>\r\n</object>','embed','0','0'),(23,'filebox','/filebox\\.ro/i','http://www.filebox.ro/video/play_video.php?key=[VIDEO ID]',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <embed type=\"application/x-shockwave-flash\" src=\"//www.filebox.ro/video/FileboxPlayer_provider.php\" style=\"\" id=\"mediaplayer\" name=\"mediaplayer\" quality=\"high\" allowfullscreen=\"true\" wmode=\"%%player_wmode%%\" flashvars=\"source_script=//videoserver325.filebox.ro/get_video.php&key=%%yt_id%%&autostart=%%player_autoplay%%&getLink=//fbx.ro/v/%%yt_id%%&splash=//imageserver.filebox.ro/get_splash.php?key=%%yt_id%%&link=\" height=\"%%player_h%%\" width=\"%%player_w%%\">\r\n</object>','embed','0','0'),(24,'youku','/youku\\.com/i','http://v.youku.com/v_show/id_[VIDEO ID].html',0,'0','1','<embed src=\"//player.youku.com/player.php/sid/%%yt_id%%=/v.swf\" quality=\"high\" width=\"%%player_w%%\" height=\"%%player_h%%\" align=\"middle\" allowScriptAccess=\"sameDomain\" type=\"application/x-shockwave-flash\" wmode=\"%%player_wmode%%\"></embed>','embed','0','0'),(67,'tudou','/tudou\\.com/i','http://www.tudou.com/programs/view/video-id/',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//www.tudou.com/v/%%yt_id%%/v.swf\"></param>\r\n <param value=\"true\" name=\"allowfullscreen\"></param>\r\n <param value=\"always\" name=\"allowscriptaccess\"></param>\r\n <param value=\"opaque\" name=\"%%player_wmode%%\"></param>\r\n <embed src=\"//www.tudou.com/v/%%yt_id%%/v.swf\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" wmode=\"%%player_wmode%%\" width=\"%%player_w%%\" height=\"%%player_h%%\"></embed>\r\n</object>','embed','0','0'),(66,'publicdomainflicks','/publicdomainflicks\\.com/i','http://www.publicdomainflicks.com/0123-video-title/',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//www.publicdomainflicks.com/flvplayer.swf\"></param>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"allowFullScreen\" value=\"true\"></param>\r\n <param name=\"allowScriptAccess\" value=\"always\"></param>\r\n <param name=\"flashvars\" value=\"file=%%url_flv%%&autostart=%%player_autoplay%%&volume=80\"></param>\r\n <embed src=\"//www.publicdomainflicks.com/flvplayer.swf\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowscriptaccess=\"always\" allowfullscreen=\"true\" flashvars=\"file=%%url_flv%%&autostart=%%player_autoplay%%&volume=80\"/>\r\n</object>','flvplayer','0','0'),(30,'liveleak','/liveleak\\.com/i','http://www.liveleak.com/view?i=[VIDEO ID]',0,'0','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//www.liveleak.com/ll_embed?f=%%yt_id%%\" frameborder=\"0\" allowfullscreen></iframe>','embed','0','0'),(32,'supervideo','/balsas\\.lt/i','http://video.balsas.lt/video/[VIDEO ID]',0,'0','1','<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0\" width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n<param name=\"allowScriptAccess\" value=\"always\" />\r\n<param name=\"allowFullScreen\" value=\"true\" />\r\n<param name=\"movie\" value=\"//video.balsas.lt/pimg/Site/Flash/player.swf?configFile=//video.balsas.lt/Videos/getConfig/%%yt_id%%\" />\r\n<param name=\"quality\" value=\"high\" />\r\n<param name=\"bgcolor\" value=\"#%%player_bgcolor%%\" />\r\n<param name=\"flashvars\" value=\"configFile=//video.balsas.lt/Videos/getConfig/%%yt_id%%\"/>\r\n<embed src=\"//video.balsas.lt/pimg/Site/Flash/player.swf?configFile=//video.balsas.lt/Videos/getConfig/%%yt_id%%\" quality=\"high\" bgcolor=\"#%%player_bgcolor%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowScriptAccess=\"always\" allowFullScreen=\"true\" type=\"application/x-shockwave-flash\" pluginspage=\"//www.macromedia.com/go/getflashplayer\" /></object>\r\n','embed','0','0'),(65,'peteava','/peteava\\.ro/i','http://www.peteava.ro/id-123456-video-title',0,'0','1','<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"%%player_w%%\" height=\"%%player_h%%\" id=\"swf_player_id_for_ie_who_sucks\">\r\n <param name=\"movie\" value=\"//www.peteava.ro/static/swf/player.swf\">\r\n <param name=\"allowfullscreen\" value=\"true\">\r\n <param name=\"allowscriptaccess\" value=\"always\">\r\n <param name=\"menu\" value=\"false\">\r\n <param name=\"flashvars\" value=\"streamer=//content.peteava.ro/stream.php&file=%%yt_id%%_standard.mp4&image=//storage2.peteava.ro/serve/thumbnail/%%yt_id%%/playerstandard&hd_file=&hd_image=//storage2.peteava.ro/serve/thumbnail/%%yt_id%%/playerhigh&autostart=%%player_autoplay%%\">\r\n <embed src=\"//www.peteava.ro/static/swf/player.swf\" id=\"__ptv_pl_%%yt_id%%_%%player_w%%_%%player_h%%__\" name=\"__ptv_pl_%%yt_id%%_%%player_w%%_%%player_h%%__\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowscriptaccess=\"always\" menu=\"false\" allowfullscreen=\"true\" \r\n flashvars=\"streamer=//content.peteava.ro/stream.php&file=%%yt_id%%_standard.mp4&image=//storage2.peteava.ro/serve/thumbnail/%%yt_id%%/playerstandard&hd_file=&hd_image=//storage2.peteava.ro/serve/thumbnail/%%yt_id%%/playerhigh&autostart=%%player_autoplay%%\"/>\r\n</object>','embed','0','0'),(35,'musicme','/musicme\\.com/i','http://www.musicme.com/#/Patrick-Bruel/videos/Epk-Patrick-Bruel-[VIDEO ID].html',0,'0','1','<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" width=\"%%player_w%%\" height=\"%%player_h%%\" id=\"musicmevideo%%yt_id%%\">\r\n <param name=\"movie\" value=\"//www.musicme.com/_share/vplayer.swf?cb=%%yt_id%%\"></param>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"allowScriptAccess\" value=\"always\">\r\n <param name=\"bgcolor\" value=\"#000000\" />\r\n <embed src=\"//www.musicme.com/_share/vplayer.swf?cb=%%yt_id%%\" type=\"application/x-shockwave-flash\" width=\"%%player_w%%\" height=\"%%player_h%%\" bgcolor=\"#000000\" allowScriptAccess=\"always\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','embed','0','0'),(39,'spike','/spike\\.com/i','http://www.spike.com/video/cinemassacre-top-10/[VIDEO ID]',0,'0','1','<embed width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//www.spike.com/efp\" quality=\"high\" bgcolor=\"000000\" name=\"efp\" align=\"middle\" type=\"application/x-shockwave-flash\" pluginspage=\"//www.macromedia.com/go/getflashplayer\" flashvars=\"flvbaseclip=%%yt_id%%\" allowfullscreen=\"true\" wmode=\"%%player_wmode%%\">\r\n</embed> ','embed','0','0'),(64,'videozer','/videozer\\.com/i','http://www.videozer.com/video/abcde',0,'0','1','<object id=\"player\" width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\">\r\n <param name=\"movie\" value=\"//www.videozer.com/embed/%%yt_id%%\"></param>\r\n <param name=\"allowFullScreen\" value=\"true\"></param>\r\n <param name=\"allowscriptaccess\" value=\"always\"></param>\r\n <embed src=\"//www.videozer.com/embed/%%yt_id%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></embed>\r\n</object>','embed','0','0'),(42,'musicplayon','/musicplayon\\.com/i','http://en.musicplayon.com/play?v=[VIDEO ID]Video_Title',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,15,0\">\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <param name=\"movie\" value=\"//en.musicplayon.com/embed?VID=%%yt_id%%&autoPlay=N&hideLeftPanel=Y&bgColor=0x232323&activeColor=0x%%player_bgcolor%%&inactiveColor=0x3C3C3C&titleColor=0x584596&textsColor=0x999999&selectedColor=0x0F0F0F&btnColor=0x000000&rnd=288950\" />\r\n <param name=\"quality\" value=\"high\" />\r\n <param name=\"allowfullscreen\" value=\"true\" />\r\n <param name=\"allowscriptaccess\" value=\"always\" />\r\n <embed width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//en.musicplayon.com/embed?VID=%%yt_id%%&autoPlay=N&hideLeftPanel=Y&bgColor=0x232323&activeColor=0x%%player_bgcolor%%&inactiveColor=0x3C3C3C&titleColor=0x584596&textsColor=0x999999&selectedColor=0x0F0F0F&btnColor=0x000000&rnd=288950\" quality=\"high\" allowfullscreen=\"true\" allowscriptaccess=\"always\" pluginspage=\"//www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\"%%player_wmode%%\"></embed>\r\n</object>','embed','0','0'),(44,'quicktime','/-(.*?)\\.(mov|m2a|m2v|3gp|3g2|m4a|m4v)/i','http://www.example.com/video.mov',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B\" codebase= \"//www.apple.com/qtactivex/qtplugin.cab\">\r\n <param name=\"src\" value=\"%%url_flv%%\" />\r\n <param name=\"autoplay\" value=\"false\" />\r\n <param name=\"controller\" value=\"true\" />\r\n <param name=\"scale\" value=\"tofit\" />\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"></param>\r\n <embed src=\"%%url_flv%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" scale=\"tofit\" wmode=\"%%player_wmode%%\" autoplay=\"false\" controller=\"true\" type=\"video/quicktime\" pluginspage=\"//www.apple.com/quicktime/download/\"></embed>\r\n</object>','embed','0','0'),(45,'yahoomusic','/music\\.yahoo\\.com/i','http://new.music.yahoo.com/videos/LadyGaGa/Bad-Romance--218606963',0,'0','1','<object width=\"%%player_w%%\" id=\"uvp_fop\" height=\"%%player_h%%\" allowFullScreen=\"true\">\r\n <param name=\"movie\" value=\"//d.yimg.com/m/up/fop/embedflv/swf/fop.swf\"/>\r\n <param name=\"flashVars\" value=\"%%url_flv%%\"/>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\"/>\r\n <embed width=\"%%player_w%%\" id=\"uvp_fop\" height=\"%%player_h%%\" allowFullScreen=\"true\" src=\"//d.yimg.com/m/up/fop/embedflv/swf/fop.swf\" type=\"application/x-shockwave-flash\" flashvars=\"%%url_flv%%\" />\r\n</object>','embed','0','0'),(47,'5min','/5min\\.com\\/video/i','http://www.5min.com/Video/Video-Title-[VIDEO ID]',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" id=\"FiveminPlayer\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\">\r\n <param name=\"allowfullscreen\" value=\"true\"/>\r\n <param name=\"allowScriptAccess\" value=\"always\"/>\r\n <param name=\"movie\" value=\"//www.5min.com/Embeded/%%yt_id%%/\"/>\r\n <embed name=\"FiveminPlayer\" src=\"//www.5min.com/Embeded/%%yt_id%%/\" type=\"application/x-shockwave-flash\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowfullscreen=\"true\" allowScriptAccess=\"always\"></embed>\r\n</object>','embed','0','0'),(63,'vplay','/vplay\\.ro/i','http://vplay.ro/watch/abcdef/',0,'0','1','<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0\" width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//i.vplay.ro/f/embed.swf?key=%%yt_id%%\">\r\n <param name=\"allowfullscreen\" value=\"true\">\r\n <param name=\"quality\" value=\"high\">\r\n <embed src=\"//i.vplay.ro/f/embed.swf?key=%%yt_id%%\" quality=\"high\" pluginspage=\"//www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowfullscreen=\"true\" ></embed>\r\n</object>','embed','0','0'),(51,'smotri','/smotri\\.com\\/video/i','http://smotri.com/video/view/?id=[VIDEO ID]',0,'0','1','<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"//pics.smotri.com/scrubber_custom8.swf?file=%%yt_id%%&bufferTime=3&autoStart=false&str_lang=eng&xmlsource=http%3A%2F%2Fpics.smotri.com%2Fcskins%2Fblue%2Fskin_color_black.xml&xmldatasource=http%3A%2F%2Fpics.smotri.com%2Fskin_ng.xml\" />\r\n <param name=\"allowScriptAccess\" value=\"always\" />\r\n <param name=\"allowFullScreen\" value=\"true\" />\r\n <embed src=\"//pics.smotri.com/scrubber_custom8.swf?file=%%yt_id%%&bufferTime=3&autoStart=false&str_lang=eng&xmlsource=http%3A%2F%2Fpics.smotri.com%2Fcskins%2Fblue%2Fskin_color_black.xml&xmldatasource=http%3A%2F%2Fpics.smotri.com%2Fskin_ng.xml\" quality=\"high\" allowscriptaccess=\"always\" allowfullscreen=\"true\" wmode=\"window\" width=\"%%player_w%%\" height=\"%%player_h%%\" type=\"application/x-shockwave-flash\"></embed>\r\n </object>','embed','0','0'),(52,'divx','/(.*?)\\.(avi|divx|mkv)/i','http://www.example.com/video.avi',0,'0','1','<object classid=\"clsid:67DABFBF-D0AB-41fa-9C46-CC0F21721616\" width=\"%%player_w%%\" height=\"%%player_h%%\" codebase=\"//go.divx.com/plugin/DivXBrowserPlugin.cab\"> \n<param name=\"src\" value=\"%%url_flv%%\" />\n<param name=\"autoPlay\" value=\"%%player_autoplay%%\" />\n<param name=\"bannerEnabled\" value=\"false\" />\n<param name=\"previewImage\" value=\"%%yt_thumb%%\" />\n<embed type=\"video/divx\" src=\"%%url_flv%%\" autoPlay=\"%%player_autoplay%%\" previewImage=\"%%yt_thumb%%\" bannerEnabled=\"false\" width=\"%%player_w%%\" height=\"%%player_h%%\" pluginspage=\"//go.divx.com/plugin/download/\"></embed> \n</object>','embed','0','0'),(53,'vbox7','/vbox7\\.com\\/play/i','http://vbox7.com/play:[VIDEO ID]',0,'1','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//vbox7.com/emb/external.php?vid=%%yt_id%%\" frameborder=\"0\" allowfullscreen></iframe>','flvplayer','0','0'),(77,'cloudy.ec','/cloudy\\.ec/i','http://www.cloudy.ec/v/[VIDEO ID]',0,'0','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//www.cloudy.ec/embed.php?id=%%yt_id%%\" frameborder=\"0\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" allowfullscreen></iframe>','embed','0','0'),(54,'livestream','/livestream\\.com/i','http://www.livestream.com/channel_name',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" id=\"lsplayer\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\"><param name=\"movie\" value=\"%%url_flv%%&amp;autoPlay=false\"></param><param name=\"allowScriptAccess\" value=\"always\"></param><param name=\"allowFullScreen\" value=\"true\"></param><embed name=\"lsplayer\" src=\"%%url_flv%%&amp;autoPlay=false\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowScriptAccess=\"always\" allowFullScreen=\"true\" type=\"application/x-shockwave-flash\"></embed></object>','embed','0','0'),(56,'ustream','/ustream\\.tv/i','http://www.ustream.tv/channel/user',0,'0','1','<object type=\"application/x-shockwave-flash\" width=\"%%player_w%%\" height=\"%%player_h%%\" data=\"//www.ustream.tv/flash/viewer.swf\">\r\n <param name=\"flashvars\" value=\"autoplay=true&amp;%%yt_id%%&amp;v3=true&amp;locale=en_US&amp;referrer=unknown&amp;enablejsapi=true\"/>\r\n <param name=\"allowfullscreen\" value=\"true\"/>\r\n <param name=\"allowscriptaccess\" value=\"always\"/>\r\n <param name=\"movie\" value=\"%%url_flv%%\"/>\r\n <embed flashvars=\"autoplay=true&amp;%%yt_id%%&amp;v3=true&amp;locale=en_US&amp;referrer=unknown&amp;enablejsapi=true\" src=\"//www.ustream.tv/flash/viewer.swf\" width=\"%%player_w%%\" height=\"%%player_h%%\" allowfullscreen=\"true\" allowscriptaccess=\"always\" type=\"application/x-shockwave-flash\" />\r\n </object>','embed','0','0'),(57,'mp3','/(.*?)\\.mp3/i','http://www.example.com/file.mp3',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"//download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0\">\r\n <param name=\"scale\" value=\"noscale\" />\r\n <param name=\"allowFullScreen\" value=\"true\" />\r\n <param name=\"allowScriptAccess\" value=\"always\" />\r\n <param name=\"allowNetworking\" value=\"all\" />\r\n <param name=\"bgcolor\" value=\"#%%player_bgcolor%%\" />\r\n <param name=\"wmode\" value=\"%%player_wmode%%\" />\r\n <param name=\"movie\" value=\"%%player_url%%\" />\r\n <param name=\"flashVars\" value=\"&plugins=revolt-1&file=%%url_flv%%&type=sound&image=%%yt_thumb%%&backcolor=%%player_bgcolor%%&frontcolor=FFFFFF&autostart=%%player_autoplay%%&screencolor=000000\" />\r\n <embed src=\"%%player_url%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" scale=\"noscale\" bgcolor=\"#%%player_bgcolor%%\" type=\"application/x-shockwave-flash\" allowFullScreen=\"true\" allowScriptAccess=\"always\" wmode=\"%%player_wmode%%\" flashvars=\"&plugins=revolt-1&file=%%url_flv%%&type=sound&image=%%yt_thumb%%&backcolor=%%player_bgcolor%%&frontcolor=FFFFFF&autostart=%%player_autoplay%%&screencolor=000000\"></embed>\r\n</object>','flvplayer','0','0'),(58,'mynet','/video\\.mynet\\.com/i','http://video.mynet.com/username/video-title/video-id/',0,'1','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"allowfullscreen\" value=\"true\" />\r\n <param name=\"allowscriptaccess\" value=\"always\" />\r\n <param name=\"autoplay\" value=\"%%player_autoplay%%\" />\r\n <param name=\"wmode\" value=\"%%player_wmode%%\" />\r\n <param name=\"movie\" value=\"//video.mynet.com/username/video-title/%%yt_id%%.swf\" />\r\n <embed src=\"//video.mynet.com/username/video-title/%%yt_id%%.swf\" type=\"application/x-shockwave-flash\" wmode=\"%%player_wmode%%\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"%%player_w%%\" height=\"%%player_h%%\" autoplay=\"%%player_autoplay%%\"></embed>\r\n</object>','flvplayer','0','0'),(59,'vidivodo','/vidivodo\\.com/i','http://www.vidivodo.com/video-id/video-title',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"movie\" value=\"%%url_flv%%\" />\r\n <param name=\"allowfullscreen\" value=\"true\" />\r\n <param name=\"allowscriptaccess\" value=\"always\" />\r\n <param name=\"autoplay\" value=\"%%player_autoplay%%\" />\r\n <param name=\"wmode\" value=\"%%player_wmode%%\" />\r\n <param name=\"bgcolor\" value=\"#%%player_bgcolor%%\" />\r\n <embed src=\"%%url_flv%%\" type=\"application/x-shockwave-flash\" wmode=\"%%player_wmode%%\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"%%player_w%%\" height=\"%%player_h%%\" autoplay=\"%%player_autoplay%%\" bgcolor=\"#%%player_bgcolor%%\"></embed>\r\n</object>','embed','0','0'),(61,'izlesene','/izlesene\\.com/i','http://www.izlesene.com/video/video-title/video-id',0,'0','1','<object width=\"%%player_w%%\" height=\"%%player_h%%\">\r\n <param name=\"allowfullscreen\" value=\"true\" />\r\n <param name=\"allowscriptaccess\" value=\"always\" />\r\n <param name=\"wmode\" value=\"%%player_wmode%%\" />\r\n <param name=\"bgcolor\" value=\"#%%player_bgcolor%%\" />\r\n <param name=\"movie\" value=\"//www.izlesene.com/embedplayer.swf?video=%%yt_id%%\" />\r\n <embed src=\"//www.izlesene.com/embedplayer.swf?video=%%yt_id%%\" wmode=\"%%player_wmode%%\" bgcolor=\"#%%player_bgcolor%%\" allowfullscreen=\"true\" allowscriptaccess=\"always\" menu=\"false\" width=\"%%player_w%%\" height=\"%%player_h%%\" type=\"application/x-shockwave-flash\"></embed>\r\n</object>','embed','0','0'),(62,'videobb','/videobb\\./i','http://www.videobb.com/video/video-id',0,'0','1','<object id=\"player\" width=\"%%player_w%%\" height=\"%%player_h%%\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\">\r\n <param name=\"movie\" value=\"%%url_flv%%\"></param>\r\n <param name=\"allowFullScreen\" value=\"true\" ></param>\r\n <param name=\"allowscriptaccess\" value=\"always\"></param>\r\n <param name=\"wmode\" value=\"%%player_wmode%%\" />\r\n <embed src=\"%%url_flv%%\" wmode=\"%%player_wmode%%\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"%%player_w%%\" height=\"%%player_h%%\"></embed>\r\n</object>','embed','0','0'),(73,'mail.ru','/mail\\.ru\\/video/i','http://my.mail.ru/video/mail/radnovomyznakomstvy/176/254.html',0,'0','1','<iframe src=\"//api.video.mail.ru/videos/embed/%%yt_id%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>','embed','0','0'),(74,'vk','/vk\\.(com|ru|me)\\/video/i','http://vk.com/video28908630_165233143',0,'0','1','<iframe src=\"//vk.com/video_ext.php?%%yt_id%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" frameborder=\"0\"></iframe>','embed','0','0'),(75,'rutube','/rutube\\.ru\\/video/i','http://rutube.ru/video/852e974534e3527f16810a7a19c418b0/',0,'0','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//rutube.ru/video/embed/%%yt_id%%\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>','embed','0','0'),(76,'novamov','/novamov\\.com/i','http://www.novamov.com/video/video-id',0,'0','1','<iframe style=\"overflow: hidden; border: 0; width: %%player_w%%px; height: %%player_h%%px;\" src=\"//embed.novamov.com/embed.php?v=%%yt_id%%\" scrolling=\"no\"></iframe>','embed','0','0'),(78,'myvideo.ge','/myvideo\\.ge/i','http://www.myvideo.ge/?video_id=[VIDEO ID]',0,'0','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//embed.myvideo.ge/flv_player/player.php?video_id=%%yt_id%%\" frameborder=\"0\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" allowfullscreen></iframe>','embed','0','0'),(79,'vevo','/vevo\\.com/i','http://www.vevo.com/watch/[VIDEO ID]',0,'0','1','<iframe width=\"%%player_w%%\" height=\"%%player_h%%\" src=\"//cache.vevo.com/assets/html/embed.html?video=%%yt_id%%&autoplay=0\" frameborder=\"0\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" allowfullscreen></iframe>','embed','0','0'),(80,'facebook','/facebook.com/i','https://www.facebook.com/video.php?v=video-id',0,'0','1','<iframe src=\"//www.facebook.com/video/embed?video_id=%%yt_id%%\" width=\"%%player_w%%\" height=\"%%player_h%%\" frameborder=\"0\"></iframe>','embed','0','0'),(81,'imgur','/(.*?)\\imgur\\.com/i','http://imgur.com/[ID]',0,'1','1','<blockquote class=\"imgur-embed-pub\" lang=\"en\" data-id=\"%%yt_id%%\" style=\"width:%%player_w%%px !important;max-width:%%player_w%%px !important; height:%%player_h%%px\"></blockquote><script async src=\"//s.imgur.com/min/embed.js\" charset=\"utf-8\"></script>','embed','0','0'),(82,'gfycat','/gfycat\\.com/i','http://gfycat.com/[ID]',0,'1','1','<iframe src=\"//gfycat.com/ifr/%%yt_id%%\" frameborder=\"0\" scrolling=\"no\" width=\"%%player_w%%\" height=\"%%player_h%%\" style=\"-webkit-backface-visibility: hidden;-webkit-transform: scale(1);\" ></iframe>','flvplayer','0','0');
/*!40000 ALTER TABLE `pm_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_tags`
--

DROP TABLE IF EXISTS `pm_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_tags` (
  `tag_id` int(7) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `tag` varchar(200) NOT NULL DEFAULT '',
  `safe_tag` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `safe_tag` (`safe_tag`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_tags`
--

LOCK TABLES `pm_tags` WRITE;
/*!40000 ALTER TABLE `pm_tags` DISABLE KEYS */;
INSERT INTO `pm_tags` VALUES (1,'14a4e06f8','hudson','hudson'),(2,'14a4e06f8','video','video'),(3,'14a4e06f8','against the grain','against-the-grain'),(4,'ac0266df0','animation','animation'),(5,'ac0266df0','stop-motion','stop-motion');
/*!40000 ALTER TABLE `pm_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_temp`
--

DROP TABLE IF EXISTS `pm_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_temp` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `video_title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `yt_length` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `category` varchar(30) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(5) NOT NULL DEFAULT '0',
  `added` int(10) NOT NULL DEFAULT '0',
  `source_id` mediumint(3) NOT NULL DEFAULT '0',
  `language` mediumint(3) NOT NULL DEFAULT '0',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `yt_id` varchar(50) NOT NULL DEFAULT '',
  `url_flv` varchar(255) NOT NULL DEFAULT '',
  `mp4` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_temp`
--

LOCK TABLES `pm_temp` WRITE;
/*!40000 ALTER TABLE `pm_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_users`
--

DROP TABLE IF EXISTS `pm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(150) NOT NULL DEFAULT '',
  `gender` varchar(10) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `reg_ip` varchar(40) NOT NULL,
  `reg_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_signin` int(10) unsigned NOT NULL DEFAULT '0',
  `last_signin_ip` varchar(40) NOT NULL,
  `email` varchar(150) NOT NULL DEFAULT '',
  `favorite` enum('0','1') NOT NULL DEFAULT '1',
  `power` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `about` text NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'default.gif',
  `activation_key` varchar(20) NOT NULL DEFAULT '',
  `new_password` varchar(32) NOT NULL DEFAULT '',
  `followers_count` int(10) unsigned NOT NULL DEFAULT '0',
  `following_count` int(10) unsigned NOT NULL DEFAULT '0',
  `unread_notifications_count` int(10) unsigned NOT NULL DEFAULT '0',
  `social_links` text NOT NULL,
  `channel_slug` varchar(255) NOT NULL,
  `channel_cover` varchar(255) NOT NULL,
  `channel_verified` enum('0','1') NOT NULL DEFAULT '0',
  `channel_featured` enum('0','1') NOT NULL DEFAULT '0',
  `channel_settings` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `channel_slug` (`channel_slug`),
  KEY `channel_featured` (`channel_featured`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_users`
--

LOCK TABLES `pm_users` WRITE;
/*!40000 ALTER TABLE `pm_users` DISABLE KEYS */;
INSERT INTO `pm_users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','Admin','male','500','127.0.0.1',1528688047,1528688351,'172.18.1.1','admin@example.com','1','1','','default.gif','','',0,0,0,'a:6:{s:7:\"website\";s:0:\"\";s:7:\"youtube\";s:0:\"\";s:8:\"facebook\";s:0:\"\";s:7:\"twitter\";s:0:\"\";s:9:\"instagram\";s:0:\"\";s:11:\"google_plus\";s:0:\"\";}','','','1','1','');
/*!40000 ALTER TABLE `pm_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_users_follow`
--

DROP TABLE IF EXISTS `pm_users_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_users_follow` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `follower_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`follower_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_users_follow`
--

LOCK TABLES `pm_users_follow` WRITE;
/*!40000 ALTER TABLE `pm_users_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_users_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_video_subtitles`
--

DROP TABLE IF EXISTS `pm_video_subtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_video_subtitles` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `language` varchar(100) NOT NULL DEFAULT '',
  `language_tag` varchar(2) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniq_id` (`uniq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_video_subtitles`
--

LOCK TABLES `pm_video_subtitles` WRITE;
/*!40000 ALTER TABLE `pm_video_subtitles` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_video_subtitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_videoads`
--

DROP TABLE IF EXISTS `pm_videoads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_videoads` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `hash` varchar(12) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `flv_url` varchar(255) NOT NULL DEFAULT '',
  `redirect_url` text NOT NULL,
  `redirect_type` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `disable_stats` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_videoads`
--

LOCK TABLES `pm_videoads` WRITE;
/*!40000 ALTER TABLE `pm_videoads` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_videoads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_videos`
--

DROP TABLE IF EXISTS `pm_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_videos` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `video_title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `yt_id` varchar(50) NOT NULL DEFAULT '',
  `yt_length` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `yt_thumb` varchar(255) NOT NULL DEFAULT '',
  `yt_views` int(10) NOT NULL DEFAULT '0',
  `category` varchar(30) NOT NULL DEFAULT '',
  `submitted_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `submitted` varchar(100) NOT NULL DEFAULT '',
  `lastwatched` int(10) unsigned NOT NULL DEFAULT '0',
  `added` int(10) unsigned NOT NULL DEFAULT '0',
  `site_views` int(9) NOT NULL DEFAULT '0',
  `url_flv` varchar(255) NOT NULL DEFAULT '',
  `source_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `language` smallint(2) unsigned NOT NULL DEFAULT '0',
  `age_verification` enum('0','1') NOT NULL DEFAULT '0',
  `last_check` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `restricted` enum('0','1') NOT NULL DEFAULT '0',
  `allow_comments` enum('0','1') NOT NULL DEFAULT '1',
  `allow_embedding` enum('0','1') NOT NULL DEFAULT '1',
  `video_slug` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniq_id` (`uniq_id`),
  KEY `added` (`added`),
  KEY `yt_id` (`yt_id`),
  KEY `featured` (`featured`),
  KEY `submitted_user_id` (`submitted_user_id`),
  FULLTEXT KEY `fulltext_index` (`video_title`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_videos`
--

LOCK TABLES `pm_videos` WRITE;
/*!40000 ALTER TABLE `pm_videos` DISABLE KEYS */;
INSERT INTO `pm_videos` VALUES (1,'14a4e06f8','Hudson - Against The Grain','<p>I\'m asking questions time and time again<br />in a race that never ever ends<br />hanging from my limbs in the swaying breeze<br />im opening I gotta let it go<br /><br />in my life the good and bad they come and go<br />highs and lows are often all that show<br />know it\'s time to go against the grain<br />or it will kill me down below<br />to live in comfort and know its warm embrace<br />reminds me only to quicken up the pace<br />know it\'s time to go against the grain<br />or it will kill me down below<br /><br />singing a song never heard<br />all of a sudden I know every word<br />And I know that there\'s no direction home<br />it\'s right here where all the wild things grow<br /><br />in my life the good and bad they come and go<br />highs and lows are often all that show<br />know it\'s time to go against the grain<br />or it will kill me down below<br />to live in comfort and know its warm embrace<br />reminds me only to quicken up the pace<br />know it\'s time to go against the grain<br />or it will kill me down below<br /><br />The new music video for \'Against The Grain\' from emerging Melbourne indie-folk artist Hudson sees him collaborate with film-maker/animator/VJ Dropbear (aka Jonathan Chong), producing a vibrant and colourful clip based around a mainstay from our humble artistic efforts throughout childhood -- coloured pencils.<br /><br />\'Against The Grain\' is the first single lifted off Hudson\'s debut EP Open Up Slowly released in May 2011</p>','TuBMXS6vU3o',204,'//i.ytimg.com/vi/TuBMXS6vU3o/0.jpg',0,'3',1,'admin',1353582628,1528688047,5,'//www.youtube.com/watch?v=TuBMXS6vU3o',3,1,'0',0,0,'1','0','1','1','hudson-against-the-grain'),(2,'ac0266df0','Post-it Stop Motion','','BpWM0FNPZSs',115,'//i.ytimg.com/vi/BpWM0FNPZSs/0.jpg',0,'1,2',1,'admin',0,1528688047,1,'//www.youtube.com/watch?v=BpWM0FNPZSs',3,1,'0',0,0,'0','0','1','1','');
/*!40000 ALTER TABLE `pm_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_videos_trash`
--

DROP TABLE IF EXISTS `pm_videos_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_videos_trash` (
  `id` mediumint(6) unsigned NOT NULL,
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `video_title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `yt_id` varchar(50) NOT NULL DEFAULT '',
  `yt_length` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `yt_thumb` varchar(255) NOT NULL DEFAULT '',
  `yt_views` int(10) NOT NULL DEFAULT '0',
  `category` varchar(30) NOT NULL DEFAULT '',
  `submitted_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `submitted` varchar(100) NOT NULL DEFAULT '',
  `lastwatched` int(10) unsigned NOT NULL DEFAULT '0',
  `added` int(10) unsigned NOT NULL DEFAULT '0',
  `site_views` int(9) NOT NULL DEFAULT '0',
  `url_flv` varchar(255) NOT NULL DEFAULT '',
  `source_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `language` smallint(2) unsigned NOT NULL DEFAULT '0',
  `age_verification` enum('0','1') NOT NULL DEFAULT '0',
  `last_check` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `restricted` enum('0','1') NOT NULL DEFAULT '0',
  `allow_comments` enum('0','1') NOT NULL DEFAULT '1',
  `allow_embedding` enum('0','1') NOT NULL DEFAULT '1',
  `video_slug` varchar(255) NOT NULL DEFAULT '',
  `mp4` varchar(255) NOT NULL DEFAULT '',
  `direct` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniq_id` (`uniq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_videos_trash`
--

LOCK TABLES `pm_videos_trash` WRITE;
/*!40000 ALTER TABLE `pm_videos_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_videos_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_videos_urls`
--

DROP TABLE IF EXISTS `pm_videos_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pm_videos_urls` (
  `uniq_id` varchar(10) NOT NULL DEFAULT '',
  `mp4` varchar(200) NOT NULL DEFAULT '',
  `direct` varchar(200) NOT NULL DEFAULT '',
  UNIQUE KEY `uniq_id` (`uniq_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_videos_urls`
--

LOCK TABLES `pm_videos_urls` WRITE;
/*!40000 ALTER TABLE `pm_videos_urls` DISABLE KEYS */;
INSERT INTO `pm_videos_urls` VALUES ('14a4e06f8','','http://www.youtube.com/watch?v=TuBMXS6vU3o'),('ac0266df0','','http://www.youtube.com/watch?v=BpWM0FNPZSs');
/*!40000 ALTER TABLE `pm_videos_urls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-11  3:46:35
