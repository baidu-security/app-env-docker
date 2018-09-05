-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: lavalite
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
-- Current Database: `lavalite`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lavalite` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lavalite`;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_categories`
--

DROP TABLE IF EXISTS `block_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci DEFAULT 'hide',
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_categories`
--

LOCK TABLES `block_categories` WRITE;
/*!40000 ALTER TABLE `block_categories` DISABLE KEYS */;
INSERT INTO `block_categories` VALUES (1,'Features','features','Packed with features you can\'t live without.','Visit our <a href=\"https://lavalite.org/docs\" target=\"_blank\">documentation</a> for more information.','show','App\\User',1,'2016/10/31/163917964',NULL,'2016-07-20 07:17:48','2016-11-01 13:08:17');
/*!40000 ALTER TABLE `block_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci DEFAULT 'hide',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,1,'Powered by Laravel 5','','ti-stats-up',0,'We have tried to make use of all features of Laravel 5 which help you to develop the website with all resources available online.​ ','',NULL,'powered-by-laravel-5-5','show',1,'App\\User','2016/07/21/104902202',NULL,NULL,NULL),(2,1,'Configure to your project','','ti-ruler-pencil',0,'Lavalite helps you to configure your Laravel projects easily. It acts as a bootstrapper for your Laravel Content Management System.','',NULL,'configure-to-your-project','show',1,'App\\User','2016/07/21/104854884',NULL,NULL,NULL),(3,1,'Online package builder','','ti-package',0,'The online package builder helps you to build Lavalite packages easily, The downloaded package with basic required files help you to finish your projects quickly.','',NULL,'online-package-builder','show',1,'App\\User','2016/07/21/104846403',NULL,NULL,NULL);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Draft','Calendar') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Draft',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
INSERT INTO `calendars` VALUES (1,'Board Meeting','board-meeting','rgb(60, 141, 188)',NULL,'Calendar','2016-07-19 00:00:00','2016-07-19 01:00:00',NULL,NULL,NULL,1,'App\\User',NULL,NULL,'2016-07-20 08:35:17','2016-07-20 08:38:08'),(2,'ALEXUS bday','alexus-bday','rgb(255, 0, 128)',NULL,'Calendar','2016-07-29 00:00:00','2016-07-29 01:00:00',NULL,NULL,NULL,1,'App\\User',NULL,NULL,'2016-07-20 08:36:42','2016-07-20 08:38:30'),(3,'Conference','conference','rgb(255, 133, 27)',NULL,'Calendar','2016-07-20 00:00:00','2016-07-20 01:00:00',NULL,NULL,NULL,1,'App\\User',NULL,NULL,'2016-07-20 08:37:12','2016-07-20 08:37:37'),(4,'Company meeting','company-meeting','rgb(57, 204, 204)',NULL,'Calendar','2016-07-08 00:00:00','2016-07-08 01:00:00',NULL,NULL,NULL,1,'App\\User',NULL,NULL,'2016-07-20 08:37:28','2016-07-20 08:37:33');
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reporting_to` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('','male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('New','Active','Suspended','Locked') COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`),
  UNIQUE KEY `clients_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,0,'Client','client@lavalite.org','$2y$10$0C79CUj82lDattgsNyRvKOcNd0mlvM7RENALaXuIlcDRZy8JI76H6','FLNallwZlTs5hqNciuO9WEm5YzsUYBHxvOCtCIGbelkoMCjwBGyX1oYBsfNB',NULL,'male','2014-05-15','Super User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://litepie.org',NULL,'Active',NULL,NULL,NULL,NULL,'2015-09-15 00:00:00',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` tinyint(4) DEFAULT NULL,
  `website` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `lat` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Show','Hide') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Renfos Technologies Pvt. Ltd.','+91 484-4011 609','+91 97444 89361','india@lavalite.org',NULL,'http://lavalite.org','INFOPARK TBC\nJNI Stadium Complex, Kaloor\nKochi, Kerala,\nIndia, Pin - 682017','INFOPARK TBC, JNI Stadium Complex','Kaloor','Kochi','Kerala','India',682017,'9.998856897222739','76.30494149737547','Show','headoffice',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `target` enum('_blank','_self') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `uload_folder` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,0,'admin','/admin',NULL,NULL,NULL,'Admin',NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL),(2,0,'user','/user',NULL,NULL,NULL,'User',NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL),(3,0,'client','/client',NULL,NULL,NULL,'Client',NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL),(4,0,'main','',NULL,NULL,NULL,'Main','Website main menu',NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),(5,0,'footer','',NULL,NULL,NULL,'Footer','Footer menu',NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),(6,0,'social','',NULL,NULL,NULL,'Social','Social media menu',NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),(7,1,NULL,'admin/menu/menu','fa fa-bars',NULL,'[\"superuser\"]','Menu',NULL,NULL,6,NULL,NULL,1,NULL,NULL,NULL,NULL),(8,1,NULL,'admin','fa fa-dashboard',NULL,NULL,'Dashboard',NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL),(9,6,NULL,'https://twitter.com/lavalitecms','fa fa-twitter',NULL,NULL,'Twitter',NULL,'_blank',11,NULL,NULL,1,NULL,NULL,NULL,NULL),(10,6,NULL,'https://github.com/LavaLite','fa fa-github',NULL,NULL,'GitHub',NULL,'_blank',12,NULL,NULL,1,NULL,NULL,NULL,NULL),(11,6,NULL,'https://www.facebook.com/lavalite/','fa fa-facebook-square',NULL,NULL,'Facebook',NULL,'_blank',13,NULL,NULL,1,NULL,NULL,NULL,NULL),(18,2,NULL,'user','dashboard',NULL,NULL,'Dashborad',NULL,NULL,50,NULL,NULL,1,NULL,NULL,NULL,NULL),(19,1,NULL,'admin/user/user','fa fa-users',NULL,'[\"superuser\"]','User',NULL,NULL,1999,NULL,NULL,1,NULL,NULL,NULL,NULL),(20,19,NULL,'admin/user/user','fa fa-user',NULL,NULL,'Users',NULL,NULL,1200,NULL,NULL,1,NULL,NULL,NULL,NULL),(21,19,NULL,'admin/user/client','fa fa-user',NULL,NULL,'Clients',NULL,NULL,1202,NULL,NULL,1,NULL,NULL,NULL,NULL),(22,1,'role','admin/roles/role','fa fa-check-circle-o',NULL,'[\"superuser\"]','Roles & Permissions',NULL,NULL,190,NULL,NULL,1,NULL,NULL,NULL,NULL),(23,1,NULL,'admin/message/message','fa fa-envelope-o',NULL,NULL,'Message',NULL,NULL,180,NULL,NULL,1,NULL,NULL,NULL,NULL),(24,2,NULL,'user/message/message','message',NULL,NULL,'Message',NULL,NULL,180,NULL,NULL,1,NULL,NULL,NULL,NULL),(25,1,NULL,'admin/calendar/calendar','fa fa-calendar',NULL,NULL,'Calendars',NULL,NULL,120,NULL,NULL,1,NULL,NULL,NULL,NULL),(26,2,NULL,'user/calendar/calendar','date_range',NULL,NULL,'Calendars',NULL,NULL,120,NULL,NULL,1,NULL,NULL,NULL,NULL),(27,1,NULL,'admin/task/task','fa fa-flag-o',NULL,NULL,'Tasks',NULL,NULL,220,NULL,NULL,1,NULL,NULL,NULL,NULL),(28,2,NULL,'user/task/task','view_week',NULL,NULL,'Tasks',NULL,NULL,220,NULL,NULL,1,NULL,NULL,NULL,NULL),(29,3,NULL,'client/task/task','view_week',NULL,NULL,'Task',NULL,NULL,220,NULL,NULL,1,NULL,NULL,NULL,NULL),(30,1,NULL,'admin/block/block','fa fa-square',NULL,NULL,'Blocks',NULL,NULL,100,NULL,NULL,1,NULL,NULL,NULL,NULL),(31,1,NULL,'admin/contact/contact','fa fa-newspaper-o',NULL,NULL,'Contact',NULL,NULL,190,NULL,NULL,1,NULL,NULL,NULL,NULL),(32,4,NULL,'contact.htm',NULL,NULL,NULL,'Contact',NULL,NULL,190,NULL,NULL,1,NULL,NULL,NULL,NULL),(33,5,NULL,'contact.htm',NULL,NULL,NULL,'Contact',NULL,NULL,190,NULL,NULL,1,NULL,NULL,NULL,NULL),(34,1,NULL,'admin/page/page','fa fa-book',NULL,NULL,'Pages',NULL,NULL,5,NULL,NULL,1,NULL,NULL,NULL,NULL),(35,4,NULL,'about-us.html',NULL,NULL,NULL,'About Us',NULL,NULL,8,NULL,NULL,1,NULL,NULL,NULL,NULL),(36,5,NULL,'about-us.html',NULL,NULL,NULL,'About Us',NULL,NULL,8,NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `from_type` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_type` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `folder` enum('Draft','Inbox','Sent','Junk') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starred` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `readed` enum('Yes','No') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels` mediumtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (18,'2015_01_05_100001_create_clients_table',1),(19,'2015_01_05_100001_create_users_table',1),(20,'2015_01_05_100010_create_password_resets_table',1),(21,'2015_08_05_100011_create_pages_table',1),(22,'2016_07_07_100001_create_tasks_table',1),(23,'2016_07_08_100001_create_messages_table',1),(24,'2016_07_14_100001_create_blocks_table',1),(25,'2016_07_18_100001_create_calendars_table',1),(26,'2017_01_02_100001_create_contacts_table',1),(27,'2017_05_05_100001_create_menus_table',1),(28,'2017_05_23_100001_create_settings_table',1),(29,'2017_11_09_100001_create_roles_table',1),(30,'2017_11_09_100002_create_role_user_table',1),(31,'2017_11_09_100003_create_permissions_table',1),(32,'2017_11_09_100004_create_permission_user_table',1),(33,'2017_11_09_100005_create_permission_role_table',1),(34,'2018_02_05_100001_create_activity_log_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `sub_heading` text COLLATE utf8mb4_unicode_ci,
  `abstract` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `banner` mediumtext COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `compile` tinyint(1) DEFAULT '0',
  `view` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `category` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `order` int(11) DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci DEFAULT 'show',
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','Home','Home',NULL,NULL,'Home Page','Home','Home','Home',NULL,NULL,NULL,'page','default',0,'home','show',NULL,NULL,NULL,NULL),(2,'About Us','About Us','Meet Lavalite',NULL,NULL,'                    <div class=\"about\">\n                        <div class=\"row\">\n                            <div class=\"col-md-12\">\n                                <div class=\"count-numerics\">\n                                    <h2>Our mission is to make insurance<br>work better for businesses of all types and sizes.</h2>\n                                    <ul class=\"list-inline row\">\n                                        <li class=\"col-md-3 col-xs-6\">\n                                            <div class=\"text-center\">\n                                                <div>\n                                                    <figure>1</figure>\n                                                    <span>k+</span>\n                                                </div>\n                                                <h4>Set of pages</h4>\n                                          </div>\n                                        </li>\n                                        <li class=\"col-md-3 col-xs-6\">\n                                            <div class=\"text-center\">\n                                                <div>\n                                                    <figure>53</figure>\n                                                </div>\n                                                <h4>Categories</h4>\n                                            </div>\n                                        </li>\n                                        <li class=\"col-md-3 col-xs-6\">\n                                            <div class=\"text-center\">\n                                                <div>\n                                                    <figure>10</figure>\n                                                    <span>x</span>\n                                                </div>\n                                                <h4>Save time</h4>\n                                            </div>\n                                        </li>\n                                        <li class=\"col-md-3 col-xs-6 s-counter-v1\">\n                                            <div class=\"text-center\">\n                                                <div>\n                                                    <figure>9</figure>\n                                                </div>\n                                                <h4>Formats to use</h4>\n                                            </div>\n                                        </li>\n                                      </ul>\n                                </div>\n                            </div>\n                        </div>\n\n                        <div class=\"row\">\n                            <div class=\"col-md-12\">\n                                <div class=\"promo-section\">\n                                    <div class=\"row mln mrn\">\n                                        <div class=\"col-md-6 pl-0 pr-0\">\n                                            <div class=\"content-section text-center\">\n                                                <h2>Creative Digital Agency</h2>\n                                                <span>You are in good hands.</span>\n                                                <p>It’s important to stay detail oriented with every project we tackle. Staying focused allows us to turn every project we complete into something we love.</p>\n                                                <p>The time has come to bring those ideas and plans to life. This is where we really begin to visualize your napkin sketches and make them into beautiful pixels.</p>\n                                                <h4>— John Doe</h4>\n                                            </div>\n                                        </div>\n                                        <div class=\"col-md-6 pl-0 pr-0 image-section\">\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n\n                        <div class=\"row features-section\">\n                            <div class=\"col-sm-5\">\n                                <div class=\"hor-centered-row\">\n                                    <div class=\"hor-centered-row-col exp-num\"><span>9</span></div>\n                                    <div class=\"hor-centered-row-col exp-year\">\n                                        <h4>\n                                            <span>Years</span>\n                                            <span>Experience</span>\n                                        </h4>\n                                        <p>Front-end Design & Development.</p>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-sm-7\">\n                                <div class=\"row mb40\">\n                                    <div class=\"col-sm-6\">\n                                        <div class=\"feature-item\">\n                                            <i class=\"ti-mobile\"></i>\n                                            <h4>Responsive Layout</h4>\n                                            <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                        </div>\n                                    </div>\n                                    <div class=\"col-sm-6\">\n                                        <div class=\"feature-item\">\n                                            <i class=\"ti-palette\"></i>\n                                            <h4>Fully Customizable</h4>\n                                            <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                        </div>\n                                    </div>\n                                </div>\n\n                                <div class=\"row\">\n                                    <div class=\"col-sm-6\">\n                                        <div class=\"feature-item\">\n                                            <i class=\"ti-cup\"></i>\n                                            <h4>Endless Possibilities</h4>\n                                            <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                        </div>\n                                    </div>\n                                    <div class=\"col-sm-6\">\n                                        <div class=\"feature-item\">\n                                            <i class=\"ti-crown\"></i>\n                                            <h4>Powerful Performance</h4>\n                                            <p>This is where we sit down, grab a cup of coffee and dial in the details.</p>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>','About Us','About Us','This is a started theme for Lavalite cms, you can customize according to your requirement.',NULL,NULL,NULL,'page','default',0,'about-us','show',NULL,NULL,NULL,NULL),(3,'Contact Us','Contact Us','Contact Us',NULL,NULL,'<p><br></p>','Contact Us','Contact Us','Contact Us',NULL,NULL,NULL,'page','default',0,'contact','show',NULL,NULL,NULL,NULL),(4,'Page Not found','Page Not found','Page Not found',NULL,NULL,'<p><br></p>','Page Not found','Page Not found','Page Not found',NULL,NULL,NULL,'page','default',0,'404','show',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191)),
  KEY `password_resets_token_index` (`token`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'View Message','message.message.view',NULL,NULL,NULL,NULL),(2,'Create Message','message.message.create',NULL,NULL,NULL,NULL),(3,'Update Message','message.message.edit',NULL,NULL,NULL,NULL),(4,'Delete Message','message.message.delete',NULL,NULL,NULL,NULL),(5,'View Calendar','calendar.calendar.view',NULL,NULL,NULL,NULL),(6,'Create Calendar','calendar.calendar.create',NULL,NULL,NULL,NULL),(7,'Update Calendar','calendar.calendar.edit',NULL,NULL,NULL,NULL),(8,'Delete Calendar','calendar.calendar.delete',NULL,NULL,NULL,NULL),(9,'View Task','task.task.view',NULL,NULL,NULL,NULL),(10,'Create Task','task.task.create',NULL,NULL,NULL,NULL),(11,'Update Task','task.task.edit',NULL,NULL,NULL,NULL),(12,'Delete Task','task.task.delete',NULL,NULL,NULL,NULL),(13,'View Block','block.block.view',NULL,NULL,NULL,NULL),(14,'Create Block','block.block.create',NULL,NULL,NULL,NULL),(15,'Update Block','block.block.edit',NULL,NULL,NULL,NULL),(16,'Delete Block','block.block.delete',NULL,NULL,NULL,NULL),(17,'View Category','block.category.view',NULL,NULL,NULL,NULL),(18,'Create Category','block.category.create',NULL,NULL,NULL,NULL),(19,'Update Category','block.category.edit',NULL,NULL,NULL,NULL),(20,'Delete Category','block.category.delete',NULL,NULL,NULL,NULL),(21,'View Contact','contact.contact.view',NULL,NULL,NULL,NULL),(22,'Create Contact','contact.contact.create',NULL,NULL,NULL,NULL),(23,'Update Contact','contact.contact.edit',NULL,NULL,NULL,NULL),(24,'Delete Contact','contact.contact.delete',NULL,NULL,NULL,NULL),(25,'View Page','page.page.view',NULL,NULL,NULL,NULL),(26,'Create Page','page.page.create',NULL,NULL,NULL,NULL),(27,'Update Page','page.page.edit',NULL,NULL,NULL,NULL),(28,'Delete Page','page.page.delete',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL),(2,2,1,NULL,NULL),(3,2,2,NULL,NULL),(4,3,3,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super User','superuser',NULL,1,NULL,NULL,NULL),(2,'Admin','admin',NULL,1,NULL,NULL,NULL),(3,'User','user',NULL,1,NULL,NULL,NULL),(4,'Client','client',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `control` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `type` enum('System','Default','User') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'main.company.name','Main','Company','Company name','Lavalite',NULL,'text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'main.company.address','Main','Company','Company address','3481 Melrose Place <br>\nBeverly Hills, CA 90210',NULL,'textarea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'main.company.email','Main','Company','Company address','info@lavalite.org',NULL,'email',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'main.company.logo','Main','Company','Company logo','img/logo.png',NULL,'file',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_required` time DEFAULT NULL,
  `time_taken` time DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,NULL,NULL,NULL,NULL,'testing',NULL,NULL,NULL,'completed',NULL,'testing',NULL,1,'App\\User',NULL,NULL,'2016-07-19 11:43:26','2016-07-19 11:43:58'),(2,NULL,NULL,NULL,NULL,'developing',NULL,NULL,NULL,'to_do',NULL,'developing',NULL,1,'App\\User',NULL,NULL,'2016-07-19 11:43:38','2016-07-19 11:43:38'),(3,NULL,NULL,NULL,NULL,'designing',NULL,NULL,NULL,'in_progress',NULL,'designing',NULL,1,'App\\User',NULL,NULL,'2016-07-19 11:43:53','2016-07-19 11:43:56');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reporting_to` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` enum('','male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `photo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('New','Active','Suspended','Locked') COLLATE utf8mb4_unicode_ci DEFAULT 'New',
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_folder` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,'Super User','admin@admin.com','$2y$10$1t7IcRfgPfU1JYT5TCxFP.vqmdjZ9nqrTlLxSKyIL.vLL3215hLEy','f6rY4Se88Bge5o9nETOFK9Rz46VqKtUVz2j4NcQ8iOjbBp3JgucMVrKzBgwn',NULL,'male','2014-05-15','Super User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://litepie.org',NULL,'Active',NULL,NULL,NULL,NULL,'2015-09-15 00:00:00','2018-08-27 16:24:40'),(2,0,'Admin','admin@lavalite.org','$2y$10$2ayqURjeQEe4CWuA2C3s7ueaySvSjI4KW/14HbOv.gczoOrQZz0zm','bieTmuadTIg5rltuzsMN5ySoWzGnagalolQN5pgQggUwWxvZDpiqg0oOhf47',NULL,'male','2020-05-15','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://litepie.org',NULL,'Active',NULL,NULL,NULL,NULL,'2015-09-15 00:00:00',NULL),(3,0,'User','user@lavalite.org','$2y$10$HJCgmnhcXb00o2nhS/i48e94iZSANnhZtXkdSos9vY9qU3cLwFnj2','aN4AexUZzzxi5bHoi233hL755O6R0vuwPXPTkEwK1JrkMLDyRcjRsnC2tk59',NULL,'male','2014-05-15','User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://litepie.org',NULL,'Active',NULL,NULL,NULL,NULL,'2015-09-15 00:00:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28  1:49:56
