/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.38-MariaDB : Database - tournaments
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tournaments` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tournaments`;

/*Table structure for table `ads_transactions` */

DROP TABLE IF EXISTS `ads_transactions`;

CREATE TABLE `ads_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_id` int(11) NOT NULL DEFAULT '0',
  `video_owner` int(11) NOT NULL DEFAULT '0',
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `time` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `ads_transactions` */

insert  into `ads_transactions`(`id`,`ad_id`,`video_owner`,`amount`,`type`,`time`) values (1,2,0,'0.5','spent','1553468694'),(2,2,0,'0','click','1553468695'),(3,2,0,'0.5','spent','1553530240'),(4,2,0,'0','click','1553530240'),(5,1,0,'0.5','spent','1554017882'),(6,1,0,'0','click','1554017884'),(7,1,0,'0.5','spent','1555686752'),(8,1,0,'0','click','1555686752'),(9,2,1,'0.5','spent','1555750211'),(10,2,1,'0','click','1555750211'),(11,1,1,'0.5','spent','1555763437'),(12,1,1,'0','click','1555763437'),(13,2,1,'0.5','spent','1555805593'),(14,2,1,'0','click','1555805593'),(15,1,1,'0','click','1555810905'),(16,1,1,'0','click','1555812195'),(17,1,1,'0','click','1555812490'),(18,1,1,'0','click','1555812589'),(19,1,1,'0.5','spent','1555855880'),(20,1,1,'0','click','1555855880'),(21,2,1,'0.5','spent','1555855994'),(22,2,1,'0','click','1555855994'),(23,1,1,'0.5','spent','1555856468'),(24,1,1,'0','click','1555856468'),(25,1,1,'0.5','spent','1556040463'),(26,1,1,'0','click','1556040463'),(27,1,1,'0.5','spent','1556068989'),(28,1,1,'0','click','1556068989'),(29,2,1,'0.5','spent','1556069822'),(30,2,1,'0','click','1556069822');

/*Table structure for table `announcement_views` */

DROP TABLE IF EXISTS `announcement_views`;

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `announcement_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `announcement_views` */

/*Table structure for table `announcements` */

DROP TABLE IF EXISTS `announcements`;

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `time` int(32) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `announcements` */

/*Table structure for table `banned` */

DROP TABLE IF EXISTS `banned`;

CREATE TABLE `banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(100) DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `banned` */

/*Table structure for table `comm_replies` */

DROP TABLE IF EXISTS `comm_replies`;

CREATE TABLE `comm_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(15) NOT NULL DEFAULT '0',
  `video_id` int(15) NOT NULL DEFAULT '0',
  `post_id` int(15) NOT NULL DEFAULT '0',
  `text` text,
  `time` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comm_replies` */

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8_unicode_ci,
  `time` int(11) NOT NULL DEFAULT '0',
  `pinned` enum('0','1') CHARACTER SET utf8 DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dis_likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`),
  KEY `post_id` (`post_id`),
  KEY `likes` (`likes`),
  KEY `dis_likes` (`dis_likes`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `comments` */

insert  into `comments`(`id`,`user_id`,`video_id`,`post_id`,`text`,`time`,`pinned`,`likes`,`dis_likes`) values (1,5,2030,0,'dast xosh bra giyan',1551088114,'0',0,0),(4,9,2094,0,'nice',1551224255,'0',1,0),(5,1,10004,0,'Thank you donate!!!',1555888976,'0',0,0),(6,1,0,2,'Ok Good',1556201625,'0',1,0),(7,1,0,2,'uiyiuy',1556237439,'0',1,0),(8,1,3,0,'Ok Good',1556658978,'0',0,0),(9,1,0,4,'OK Good!',1557014129,'0',0,0),(10,1,0,4,'OK Good',1557037419,'0',0,0),(11,21,4,0,'Okay good',1558217867,'0',0,0);

/*Table structure for table `comments_likes` */

DROP TABLE IF EXISTS `comments_likes`;

CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(30) NOT NULL DEFAULT '0',
  `video_id` int(15) NOT NULL DEFAULT '0',
  `post_id` int(15) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_id`),
  KEY `type` (`type`),
  KEY `video_id` (`video_id`),
  KEY `post_id` (`post_id`),
  KEY `reply_id` (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `comments_likes` */

insert  into `comments_likes`(`id`,`user_id`,`comment_id`,`reply_id`,`video_id`,`post_id`,`time`,`type`) values (3,1,7,0,0,0,1557045739,1),(4,1,6,0,0,0,1557045740,1);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `value` (`value`(255))
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'theme','default'),(2,'censored_words',''),(3,'title','GamerDeadZone'),(4,'name','GamerDeadZone'),(5,'keyword','Gamer,Dead,Video,Zhone'),(6,'email','admin12345@gmail.com'),(7,'description','GamerDeadZone web site is esports tournament.'),(8,'validation','off'),(9,'recaptcha','off'),(10,'recaptcha_key',''),(11,'language','english'),(12,'google_app_ID','894317931618-umip9es97g753sir01lg8h7q9rrqd5me.apps.googleusercontent.com'),(13,'google_app_key','wSWmvGHznQ13qFK-wiiKc2-M'),(14,'facebook_app_ID','2345941485417342'),(15,'facebook_app_key','14535a9d3f8248e7ac19c1b11ee2c70d'),(16,'twitter_app_ID','I0j9fVuXIECZgkwT06ynHp0ph'),(17,'twitter_app_key','eiYhDVixNmgZCaC6kTi3aixGqWBAJGpBFNeK271CurpvOKYs1y'),(18,'yt_api','AIzaSyBTwxpmr5EraHyEolTDPiSx7axFS-0CE5s'),(19,'seo_link','off'),(20,'comment_system','default'),(21,'smtp_or_mail','smtp'),(22,'smtp_host','ssl://smtp.gmail.com'),(23,'smtp_username','webexpert12345@outlook.com'),(24,'smtp_password',''),(25,'smtp_encryption','ssl'),(26,'smtp_port','465'),(27,'delete_account','off'),(28,'total_videos','11'),(29,'total_views','30'),(30,'total_users','18'),(31,'total_subs','30'),(32,'total_comments','8'),(33,'total_likes','2'),(34,'total_dislikes','0'),(35,'total_saved','0'),(36,'last_admin_collection','1558188988'),(37,'user_statics','[{&quot;month&quot;:&quot;January&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_users&quot;:4},{&quot;month&quot;:&quot;March&quot;,&quot;new_users&quot;:7},{&quot;month&quot;:&quot;April&quot;,&quot;new_users&quot;:3},{&quot;month&quot;:&quot;May&quot;,&quot;new_users&quot;:1},{&quot;month&quot;:&quot;June&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_users&quot;:0}]'),(38,'videos_statics','[{&quot;month&quot;:&quot;January&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_videos&quot;:8},{&quot;month&quot;:&quot;May&quot;,&quot;new_videos&quot;:3},{&quot;month&quot;:&quot;June&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_videos&quot;:0}]'),(39,'upload_system','on'),(40,'import_system','on'),(41,'resize_video','on'),(42,'autoplay_system','on'),(43,'embed_system','on'),(44,'history_system','on'),(45,'user_registration','on'),(46,'verification_badge','on'),(47,'comments_default_num','10'),(48,'vimeo_api_key',''),(49,'fb_login','on'),(50,'tw_login','on'),(51,'plus_login','on'),(52,'wowonder_app_ID','2b5a73de8fb79b8173ce'),(53,'wowonder_app_key','4a11d1938df5f920b129929f08c2f31e5c69901'),(54,'wowonder_domain_uri',''),(55,'wowonder_site_name',''),(56,'wowonder_login','off'),(57,'wowonder_img',''),(58,'google',''),(59,'last_created_sitemap','25-04-2019'),(60,'is_ok','1'),(61,'pro_pkg_price','3000'),(62,'payment_currency','₹'),(63,'go_pro','on'),(64,'paypal_id','AeZIflBKPFRG0lbz7fbQDDipQvNmdgEAW0STjE1tUlapiLedskIEm0icSmh82EFtqHLLwxINHw0bo9IR'),(65,'paypal_secret','EOVnc5UWapi8h4gGjaL-0ZBmdMwqVWahJgW0S3fOcKldH38LGb-HjZ6KL7vg82h4XFOw8RjdR7KGGmnH'),(66,'paypal_mode','sandbox'),(67,'last_backup','24-03-2019'),(68,'user_ads','on'),(69,'rss_export','on'),(70,'max_upload','10000000000'),(71,'s3_upload','off'),(72,'s3_bucket_name','myamazone'),(73,'amazone_s3_key','AKIAJGVD4RBTHVIKGRAQ'),(74,'amazone_s3_s_key','m0Lq2XWGgQiR1BA2Cx9tP/T2jUsEbqQkCTD15vNG'),(75,'region','us-west-2'),(76,'ad_v_price','0.1'),(77,'ad_c_price','0.5'),(78,'pub_price','0.02'),(79,'usr_v_mon','on'),(80,'apps_api_id','03867a9eeeadb8fb48b5e6152071190b'),(81,'apps_api_key','08696a3ab92331f1f919f6e5abeed545'),(82,'ffmpeg_system','off'),(83,'ffmpeg_binary_file','ffmpeg'),(84,'user_max_upload','1000000000'),(85,'user_max_import','100'),(86,'convert_speed','fast'),(87,'night_mode','night'),(88,'server','ajax'),(89,'article_system','on'),(90,'ftp_host',''),(91,'ftp_port',''),(92,'ftp_username',''),(93,'ftp_password',''),(94,'ftp_upload','off'),(95,'ftp_endpoint',''),(96,'ftp_path','./'),(97,'watermark',''),(98,'ftp_host','localhost'),(99,'ftp_port','21'),(100,'ftp_username',''),(101,'ftp_password',''),(102,'ftp_upload','off'),(103,'ftp_endpoint','storage.wowonder.com'),(104,'ftp_path','./'),(105,'watermark',''),(106,'download_videos','on'),(107,'facebook_import','off'),(108,'donate_system','on'),(109,'approve_videos','off'),(110,'videos_upload_limit','0'),(111,'sell_videos_system','on'),(112,'admin_com_sell_videos','5'),(113,'who_sell','pro_users'),(114,'auto_approve_','no'),(115,'com_type','1'),(116,'upload_system_type','1'),(117,'max_upload_all_users','1000000000'),(118,'max_upload_free_users','1000000000'),(119,'max_upload_pro_users','10000000000'),(120,'player_type','default'),(121,'two_factor_setting','off'),(122,'queue_count','0'),(123,'popular_channels','on'),(124,'twitch_api','twb88q5mhne1gsrwvkhtlugvrqniks'),(125,'twitch_import','off'),(126,'geo_blocking','off'),(127,'server_key','1312a113c58715637a94437389326a49'),(128,'earn_from_ads','on'),(129,'push','0'),(130,'push_id','44dac439-ef98-47a7-86d4-5cd173f77b70'),(131,'push_key','NTdkYzVmNjktMDdiNS00OWU4LWI5NTktYmYwN2FiMzViYTUx'),(132,'recurring_payment','on'),(133,'fastpay_id','+9647501112560'),(134,'fastpay_secret','M!xPl@y$'),(137,'fastpay_mode','live'),(138,'payment_mode','paytm'),(140,'videos_load_limit','20'),(141,'demo_video','on'),(142,'all_create_articles','on'),(143,'movies_videos','on'),(144,'dailymotion_id',''),(145,'cha_api','W8c7Qx8xzK7Rx4QfI4sJisHJtuXWBSsSFP3ukEXb'),(146,'paytm_mode','sandbox'),(147,'paytm_secret','fUvwIPuMafgbBcQv'),(148,'paytm_id','QLMltG13538302005151');

/*Table structure for table `conversations` */

DROP TABLE IF EXISTS `conversations`;

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_one` (`user_one`),
  KEY `user_two` (`user_two`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `conversations` */

insert  into `conversations`(`id`,`user_one`,`user_two`,`time`) values (1,3,1,1553776629),(3,9,1,1551224303),(4,1,9,1551224303),(5,23,1,1555583435),(9,25,1,1555763521),(11,1,21,1557720699);

/*Table structure for table `cron` */

DROP TABLE IF EXISTS `cron`;

CREATE TABLE `cron` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` varchar(100) DEFAULT NULL,
  `count` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cron` */

/*Table structure for table `games` */

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slidershow` int(3) DEFAULT NULL,
  `time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(2) NOT NULL,
  `reclike` int(5) DEFAULT NULL,
  `unlike` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `games_slug_unique` (`tags`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `games` */

insert  into `games`(`id`,`name`,`description`,`tags`,`logo`,`slidershow`,`time`,`active`,`reclike`,`unlike`) values (2,'P U B G','PLAYERUNKNOWN’S BATTLEGROUNDS is a last-man-standing shooter being developed with community feedback. Players must fight to locate weapons and supplies in a massive 8×8 km island to be the lone surviv..','pubg','upload/photos/2019/04/xqKWdNHobZFfXcmhvs9B_23_7a9faabc79031a611d6a749c676a6761_image.png',1,'1556024394',1,226,12),(3,'FIFA 19','FIFA 19 is a football simulation video game developed by EA Vancouver and EA Bucharest, as part of Electronic Arts’ FIFA series. Announced on 6 June 2018 for its E3 2018 press conference, it was relea..','fifa19','upload/photos/2019/04/dGhRudftk26nxXqrgpmL_23_1164c89ae2f230d43e5f09aeb1c267f3_image.png',1,'1556025149',1,52,2),(4,'CS : GO','Counter-Strike: Global Offensive (CS:GO) is an online first-person shooter developed by Hidden Path Entertainment and Valve Corporation. It is the fourth game in the main Counter-Strike franchise.','csgo','upload/photos/2019/04/JdAfsk5XhFc9L7SDMbRU_23_9c241a78423080da2dbf1a0ea07047cb_image.jpg',1,'1556025257',1,44,9),(7,'8 Cool Ball','This is the 8 Cool Ball','8ball','upload/photos/2019/05/MdQkvLLD2aJisucym5qH_09_7d7e1ad98538ff6c2a62f5ad71f9dec8_image.png',1,'1557416060',1,NULL,NULL),(8,'Fortnite','Fortnite is an online video game developed by Epic Games and released in 2017. It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite: Save the World, a cooperative shooter-survival game for up to four players to fight off zombie-like creatures and defend objects with fortifications they can build, Fortnite Battle Royale, a free-to-play battle royale game where up to 100 players fight to be the last person standing, and Fortnite Creative, where players are given complete freedom to create worlds and battle arenas. The first two game modes were released in 2017 as early access titles and Creative was released on December 6, 2018. Save the World is available only for Windows, macOS, PlayStation 4, and Xbox One, while Battle Royale has been released for those platforms and additionally for Nintendo Switch, iOS and Android devices. Playing either Fortnite game requires an Epic Games account on Windows, macOS, iOS, Android, and Nintendo Switch. Playing on PS4 or Xbox does not need an Epic Games account, as players are identified by their PSN or Xbox Live username instead.\r\n\r\nWhile the first two games have been successful for Epic Games, Fortnite Battle Royale became a resounding success, drawing in more than 125 million players in less than a year and earning hundreds of millions of dollars per month, and since has become a cultural phenomenon. ','fortnite','upload/photos/2019/05/SNey3IlKXGkx8RazNWsX_09_544a5dc3bb96ad5b6366362ab2c0d6dc_image.jpg',1,'1557416217',1,NULL,NULL);

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

/*Data for the table `history` */

insert  into `history`(`id`,`user_id`,`video_id`,`time`) values (21,1,614,1550800485),(22,1,587,1550800738),(24,3,614,1550803523),(25,5,1988,1550849565),(26,5,614,1550850584),(27,5,1989,1550851409),(28,5,1990,1550852164),(30,5,1991,1550921977),(31,5,1992,1550922510),(32,1,1992,1550953276),(33,5,1993,1551010343),(34,5,1994,1551015722),(35,1,1994,1551081082),(37,5,2089,1551085907),(38,5,2030,1551087525),(41,1,2030,1551130973),(45,1,1998,1551135810),(47,5,2094,1551188029),(48,5,2095,1551189612),(49,6,2088,1551192458),(50,5,2005,1551210695),(51,9,2094,1551224233),(52,9,1998,1551224273),(53,2,2095,1551458063),(54,5,2096,1551538875),(55,1,2096,1551612573),(56,1,603,1551612583),(57,10,605,1551711344),(59,11,2087,1551773187),(60,11,2086,1551773202),(61,11,1998,1551775609),(62,12,1993,1551777655),(63,12,1989,1551777656),(64,11,2079,1551784320),(65,11,2080,1551784324),(66,13,1998,1551888018),(69,14,1997,1552139410),(72,15,2060,1552167945),(76,5,2100,1552666978),(79,5,2087,1552737306),(80,1,2100,1552739487),(81,5,2101,1552743230),(82,5,2102,1552755079),(84,1,2102,1552825885),(85,5,609,1552850879),(86,1,605,1552887411),(87,1,613,1552887811),(88,1,610,1552887831),(89,5,2103,1552991499),(90,5,2104,1552992540),(91,5,2105,1552992651),(92,5,2106,1552992882),(93,5,2107,1552993067),(94,5,2108,1552993283),(95,5,2109,1552993485),(96,5,2110,1552993650),(97,5,2111,1552993879),(98,5,2112,1552994211),(99,5,2113,1553008263),(100,1,2103,1553043296),(101,1,2110,1553045287),(103,1,567,1553045888),(104,5,2115,1553093904),(105,5,2116,1553094438),(106,5,2117,1553094824),(107,5,2118,1553100360),(109,1,2115,1553198062),(110,1,2118,1553198068),(111,20,2088,1553198139),(112,1,2080,1553294341),(113,23,2120,1553352937),(114,1,2120,1553352968),(115,21,2120,1553353066),(116,21,2096,1553359653),(117,5,2120,1553375340),(118,21,2118,1553468665),(119,5,2121,1553546467),(120,21,2121,1553560658),(121,23,2121,1553607458),(122,23,2047,1553607478),(123,1,2121,1553806065),(124,2,2120,1555054554),(125,21,2047,1555070830),(126,25,2120,1555602891),(127,1,2552,1555672904),(128,1,9999,1555673781),(129,1,1,1555673975),(130,1,10000,1555674794),(131,1,10001,1555674851),(132,1,2,1555675687),(133,1,3,1555676171),(134,1,10002,1555685632),(135,21,10003,1555686610),(136,21,5,1555686686),(137,1,10004,1555691538),(138,1,5,1555745662),(139,25,2,1555763399),(140,1,4,1555763550),(141,21,2,1555805482),(142,21,10004,1555805490),(143,21,3,1555805560),(144,21,4,1555805568),(145,25,3,1555856704),(146,21,10005,1555857339),(147,1,10005,1556026200),(148,1,10006,1556186261),(149,4,10006,1556244721),(150,21,10006,1556849688),(151,21,1,1556922922),(152,1,10008,1557542629),(153,1,10009,1557542774),(154,1,10010,1557542878),(155,21,10009,1557664352),(156,21,10010,1557740189),(157,21,10008,1558217567);

/*Table structure for table `langs` */

DROP TABLE IF EXISTS `langs`;

CREATE TABLE `langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_key` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `english` text,
  PRIMARY KEY (`id`),
  KEY `lang_key` (`lang_key`)
) ENGINE=InnoDB AUTO_INCREMENT=522 DEFAULT CHARSET=utf8;

/*Data for the table `langs` */

insert  into `langs`(`id`,`lang_key`,`type`,`english`) values (1,'login','','Login'),(2,'search_keyword','','Search for videos'),(3,'register','','Register'),(4,'invalid_request','','Invalid request'),(5,'please_check_details','','Please check the details'),(6,'email_sent','','E-mail sent successfully'),(7,'email_not_exist','','E-mail not exist'),(8,'reset_password','','Reset Password'),(9,'account_is_not_active','','Your account is not active yet, please confirm your E-mail.'),(10,'resend_email','','Resend E-mail'),(11,'invalid_username_or_password','','Invalid username or password'),(12,'gender','','Gender'),(13,'gender_is_invalid','','Gender is invalid'),(14,'country','','Country'),(15,'username_is_taken','','Username is taken'),(16,'username_characters_length','','Username must be between 5 / 32'),(17,'username_invalid_characters','','Invalid username characters'),(18,'email_exists','','This e-mail is already in use'),(19,'email_invalid_characters','','E-mail is invalid'),(20,'password_not_match','','Password not match'),(21,'password_is_short','','Password is too short'),(22,'reCaptcha_error','','Please Check the re-captcha.'),(23,'successfully_joined_desc','','Registration successful! We have sent you an email, Please check your inbox/spam to verify your account.'),(24,'change_password','','Change Password'),(25,'404_desc','','The page you were looking for doesn\'t exist.'),(26,'404_title','','404, page not found'),(27,'your_email_address','','Your E-mail address'),(28,'request_new_password','','Request new password'),(29,'got_your_password','','Got your password?'),(30,'login_','','Log In'),(31,'please_wait','','Please wait..'),(32,'welcome_back','','Welcome back!'),(33,'username','','Username'),(34,'password','','Password'),(35,'forgot_your_password','','Forgot your password?'),(36,'sign_up','','Sign Up!'),(37,'new_here','','New here?'),(38,'lets_get_started','','Let\'s get started!'),(39,'email_address','','E-mail address'),(40,'confirm_password','','Confirm Password'),(41,'male','','Male'),(42,'female','','Female'),(43,'already_have_account','','Already have an account?'),(44,'home','','Home'),(45,'upload','','Upload'),(46,'terms_of_use','','Terms of use'),(47,'privacy_policy','','Privacy Policy'),(48,'about_us','','About us'),(49,'language','','Language'),(50,'copyright','','Copyright © {{DATE}} {{CONFIG name}}. All rights reserved.'),(51,'profile','','Profile'),(52,'edit','','Edit'),(53,'settings','','Settings'),(54,'log_out','','Log out'),(55,'featured_video','','Featured video'),(56,'subscribe','','Subscribe'),(57,'views','','Views'),(58,'save','','Save'),(59,'share','','Share'),(60,'embed','','Embed'),(61,'report','','Report'),(62,'published_on','','Published on '),(63,'in','','In'),(64,'top_videos','','Top videos'),(65,'trending','','Trending'),(66,'explore_more','','Explore more'),(67,'year','','year'),(68,'month','','month'),(69,'day','','day'),(70,'hour','','hour'),(71,'minute','','minute'),(72,'second','','second'),(73,'years','','years'),(74,'months','','months'),(75,'days','','days'),(76,'hours','','hours'),(77,'minutes','','minutes'),(78,'seconds','','seconds'),(79,'time_ago','','ago'),(80,'url_not_supported','','URL not supported.'),(81,'no_more_comments','','No more comments found'),(82,'video_not_found_please_try_again','','Video not found, please refresh the page and try again.'),(83,'saved','','Saved'),(84,'no_comments_found','','No comments found'),(85,'import','','Import'),(86,'import_new_video','','Import new video'),(87,'video_url','','Video URL'),(88,'url_desc','','YouTube, Dailymotion, Vimeo URLs'),(89,'fetch_Video','','Fetch Video'),(90,'video_title','','Video Title'),(91,'video_title_help','','Your video title, 2 - 55 characters'),(92,'video_descritpion','','Video Description'),(93,'category','','Category'),(94,'tags','','Tags'),(95,'tags_help','','Tags, seprated by comma'),(96,'publish','','Publish'),(97,'upload_new_video','','Upload new video'),(98,'choose_new_file','','Choose video file..'),(99,'thumbnail','','Thumbnail'),(100,'successfully_uplaoded','','successfully uploaded.'),(101,'reply','','Reply'),(102,'show_more','','Show more'),(103,'comments','','Comments'),(104,'write_your_comment','','Write your comment..'),(105,'fb_comments','','Facebook Comments'),(106,'related_videos','','Related Videos'),(107,'delete_confirmation','','Are you sure you want to delete your comment?'),(108,'subscribed','','Subscribed'),(109,'no_videos_found_subs','','No videos found, subscribe to get started!'),(110,'subscriptions','','Subscriptions'),(111,'no_videos_found_history','','No videos found, watch to get started!'),(112,'history','','History'),(113,'no_videos_found_liked','','No videos found, like to get started!'),(114,'liked_videos','','Liked videos'),(115,'latest_videos','','Latest videos'),(116,'no_videos_found_for_now','','No videos found for now!'),(117,'no_more_videos_to_show','','No more data to show'),(118,'categories','','Categories'),(119,'video_already_exist','','Video is already exist'),(120,'video_saved','','Video successfully updated'),(121,'manage_videos','','Manage Videos'),(122,'search','','Search'),(123,'manage','','Manage'),(124,'edit_video','','Edit video'),(125,'delete_video_confirmation','','Are you sure you want to delete this video? This action can\'t be undo'),(126,'manage_my_videos','','Manage My Videos'),(127,'delete_videos','','Delete video'),(128,'search_results','','Search Results'),(129,'status','','Status'),(130,'active','','Active'),(131,'inactive','','Inactive'),(132,'type','','Type'),(133,'user','','User'),(134,'admin','','Admin'),(135,'verification','','Verification'),(136,'verified','','Verified'),(137,'not_verified','','Not verified'),(138,'setting_updated','','Settings successfully updated!'),(139,'first_name','','First Name'),(140,'last_name','','Last Name'),(141,'about_profile','','About'),(142,'facebook','','Facebook'),(143,'google_plus','','Google+'),(144,'twitter','','Twitter'),(145,'current_password','','Current Passowrd'),(146,'new_password','','New Passowrd'),(147,'confirm_new_password','','Confirm new password'),(148,'current_password_dont_match','','Current password doesn\'t match.'),(149,'new_password_dont_match','','New password doesn\'t match.'),(150,'avatar','','Avatar'),(151,'cover','','Cover'),(152,'your_account_was_deleted','','Your account was deleted'),(153,'avatar_and_cover','','Avatar & Cover'),(154,'general','','General'),(155,'delete_account','','Delete account'),(156,'general_settings','','General Settings'),(157,'password_settings','','Password Settings'),(158,'profile_settings','','Profile Settings'),(159,'videos','','Videos'),(160,'up_next','','Up next'),(161,'autoplay','','Autoplay'),(162,'featured','','Featured'),(163,'saved_videos','','Saved Videos'),(164,'my_channel','','My Channel'),(165,'add_to','','Add to'),(166,'add_to_pl','','Add to playlist'),(167,'create_new','','Create new'),(168,'close','','Close'),(169,'removed_from','','Removed from'),(170,'added_to','','Added to'),(171,'create_new_pl','','Create new playlist'),(172,'pl_name','','Playlist name'),(173,'privacy','','Privacy'),(174,'description','','Description'),(175,'create','','Create'),(176,'cancel','','Cancel'),(177,'pl_name_required','','Play list name is required.'),(178,'play_lists','','PlayLists'),(179,'delete','','Delete'),(180,'confirmation','','Confirmation!'),(181,'confirm_delist','','Are you sure you want to delete this PlayList?'),(182,'yes_del','','Yes,delete it!'),(183,'deleted','','Deleted!'),(184,'was_deleted','','has been deleted!'),(185,'no_lists_found','','No PlayLists Found!'),(186,'public','','Public'),(187,'private','','Private'),(188,'сreated','','Created'),(189,'pl_сreated','','PlayList was successful added!'),(190,'pl_saved','','PlayList was successful saved!'),(191,'watch_later','','Watch later'),(192,'articles','','Articles'),(193,'search_articles','','Search for articles'),(194,'most_popular','','Most popular'),(195,'no_result_for','','Sorry, no results found for'),(196,'no_post_found','','No posts found!'),(197,'related_articles','','Related Articles'),(198,'share_to','','Share to'),(199,'no_more_articles','','No more Articles'),(200,'go_pro','','Go Pro'),(201,'buy_pro_pkg','','Discover more features with {{SITE_NAME}} Pro package!'),(202,'free_mbr','','Free Member'),(203,'pro_mbr','','Pro Member'),(204,'upload_1gb_limit','','Upload up to 1GB limit'),(205,'ads_will_show_up','','Videos ads will show up'),(206,'not_featured_videos','','Not featured videos'),(207,'no_verified_badge','','No verified badge'),(208,'stay_free','','Stay Free'),(209,'upgrade','','Upgrade'),(210,'upload_1tr_limit','','Upload up to 1000GB'),(211,'ads_wont_show_up','','No ads will show up'),(212,'ur_are_featured','','Featured videos'),(213,'verified_badge','','Verified badge'),(214,'congratulations','','Congratulations!'),(215,'uare_pro','','You have successfully upgraded you profile to PRO user!'),(216,'start_features','','Start browsing new features'),(217,'import_limit_reached_upgrade','','You have reached your import limit, upgrade to pro to import unlimited videos!'),(218,'upload_limit_reached_upgrade','','You have reached your upload limit, upgrade to pro to upload unlimited videos!'),(219,'import_limit_reached','','You have reached your import limit'),(220,'upload_limit_reached','','You have reached your upload limit'),(221,'upgrade_now','','Upgrade Now?'),(222,'error','','Error!'),(223,'error_msg','','Something went wrong Please try again later!'),(224,'oops','','Oops'),(225,'write_a_reply','','Write a comment and press ENTER'),(226,'file_is_too_big','','File is too big, Max upload size is'),(227,'ads','','Advertising'),(228,'wallet','','Wallet'),(229,'name','','Name'),(230,'results','','Results'),(231,'spent','','Spent'),(232,'action','','Action'),(233,'clicks','','Clicks'),(234,'create_ad','','Create ad'),(235,'my_balance','','MY BALANCE'),(236,'replenish_my_balance','','Replenish My Balance'),(237,'amount','','Amount'),(238,'replenish','','Replenish'),(239,'create_new_ad','','Create new ad'),(240,'title','','Title'),(241,'select_media','','Select Media'),(242,'pricing','','Pricing'),(243,'placement','','Placement'),(244,'traget_audience','','Target Audience'),(245,'video_ad','','Videos (Format Video / Image)'),(246,'page_ad','','Sidebar (Format Image)'),(247,'cost_click','','Pay Per Click'),(248,'cost_view','','Pay Per Impression'),(249,'invalid_name','','Name must be between 5/32'),(250,'invalid_url','','The URL is invalid. Please enter a valid URL'),(251,'invalid_ad_title','','Ad title must be between 5/100'),(252,'invalid_videoad_media','','Media file is invalid. Please select a valid image / video'),(253,'invalid_pagead_media','','Media file is invalid. Please select a valid image'),(254,'edit_ad','','Edit ad'),(255,'by','','By'),(256,'more_info','','More Info'),(257,'monetization','','Monetization'),(258,'monetization_settings','','Monetization Settings'),(259,'withdrawals','','Withdrawals'),(260,'balance','','Available balance'),(261,'min','','Min'),(262,'submit_withdrawal_request','','Submit withdrawal request'),(263,'cant_request_withdrawal','','You can not submit withdrawal request until the previous requests has been approved / rejected'),(264,'withdrawal_request_amount_is','','Your balance is {{BALANCE}}, the minimum withdrawal request amount is 50:'),(265,'min_withdrawal_request_amount_is','','The minimum withdrawal request is'),(266,'withdrawal_request_sent','','Your withdrawal request has been successfully sent!'),(267,'enabled','','Enabled'),(268,'disabled','','Disabled'),(269,'withdrawals_history','','Withdrawals History'),(270,'rejected','','Rejected'),(271,'accepted','','Accepted'),(272,'requested_at','','Requested at'),(273,'confirm_delete_ad','','Are you sure you want to delete this ad?'),(274,'ad_published','','Your ad has been published successfully'),(275,'ad_saved','','Your changes to the ad were successfully saved'),(276,'pending','','Pending'),(277,'balance_is_0','','Your current wallet balance is: 0, please top up your wallet to continue.'),(278,'top_up','','Top Up'),(279,'earn_mon','','Earn ({{CONFIG pub_price}} {{CONFIG payment_currency}}) for each advertisement click you get from your videos!'),(280,'get_verified','','Get verified'),(281,'u_are_verified','','Congratulations, you are verified. Thanks for verifying your ID'),(282,'verif_request_received','','Your request was received and is pending approval'),(283,'upload_id','','Upload Passport or ID'),(284,'select_id','','Please select a recent picture of your passport or id'),(285,'choose_file','','Choose File'),(286,'submit_request','','Submit request'),(287,'submit_verif_request_error','','You can not submit verification request until the previous requests has been accepted / rejected'),(288,'ivalid_last_name','','Last name is too long!'),(289,'ivalid_image_file','','The Image file is Not valid.please select a valid picture!'),(290,'ivalid_id_file','','The passport/ID picture must be an image'),(291,'verif_request_sent','','Your request was successfully sent and will be in the near future reviwed!'),(292,'unknown_error','','Error: an unknown error occurred. Please try again later'),(293,'ivalid_thumb_file','','Thumbnail image file is invalid. Please select a valid image'),(294,'hide','','Hide'),(295,'message','','Message'),(296,'notifications','','Notifications'),(297,'subscribed_u','','subscribed to your channel'),(298,'unsubscribed_u','','unsubscribed from your channel'),(299,'liked_ur_video','','liked your video'),(300,'disliked_ur_video','','disliked your video'),(301,'commented_ur_video','','commented on your video'),(302,'liked_ur_comment','','liked your comment'),(303,'disliked_ur_comment','','disliked your comment'),(304,'replied_2ur_comment','','replied to your comment'),(305,'cancel_report','','Cancel Report'),(306,'no_more_videos','','No more videos found'),(307,'load_more','','Load more'),(308,'report_zs_video','','Report this video'),(309,'write_vr_summary','','Please write a summary of what this video was about'),(310,'submit','','Submit'),(311,'thank_u','','Thank you'),(312,'we_received_ur_rep','','We have received your report!'),(313,'report_canceled','','Your report has been canceled!'),(314,'comment_pinned','','Comment pinned to top'),(315,'comment_unpinned','','Comment unpinned'),(316,'porcessing_video','','Processing your video - this may take a few minutes'),(317,'video_thumbs','','Video thumbnails'),(318,'ur_video_porcessing','','This video is being converted to few resolutions, it may take a few minutes.'),(319,'this_video_porcessing','','This video is being processed, please come back in few minutes'),(320,'mode','','Mode'),(321,'day_mode','','Day mode'),(322,'night_mode','','Night mode'),(323,'sort_by','Sort By','Sort By'),(324,'top_commnets','','Top Comments'),(325,'last_commnets','','Latest comments'),(326,'darg_drop_video','','Drag & Drop video'),(327,'click_2choose_file','','click to select a file'),(328,'or','','or'),(329,'contact_us','','Contact us'),(330,'email','','E-mail'),(331,'added_new_video','','added a new video'),(332,'added_new_video','','added a new video'),(333,'messages','','Messages'),(334,'are_you_sure_you_want_delete_chat','','Are you sure that you want to delete the conversation?'),(335,'no_messages_found_hi','','No messages were found, say Hi!'),(336,'no_messages_found_channel','','No messages were found, please choose a channel to chat.'),(337,'no_match_found','','No match found'),(338,'message','','Message'),(339,'write_message','','Write your message and hit enter..'),(346,'channels','','Channels'),(347,'recent_articles','','Most recent articles'),(348,'read_more','','Read more'),(349,'removed_history','','Removed from History'),(350,'show_less','','Show less'),(351,'no_users_found','','No users found'),(352,'social_links','','Social links'),(353,'cookie_message','','This website uses cookies to ensure you get the best experience on our website.'),(354,'cookie_dismiss','','Got It!'),(355,'cookie_link','','Learn More'),(356,'terms_accept','','Please agree to the Terms of use & Privacy Policy'),(357,'terms_agreement','','By creating your account, you agree to our'),(358,'no_notifications','','You do not have any notifications'),(359,'unlisted','','Unlisted'),(360,'video_private_text','','This is video private, just the publisher can view it.'),(361,'instagram','','Instagram'),(362,'original','','Original'),(363,'age_restriction','','Age Restriction'),(364,'all_ages','','All ages can view this video'),(365,'only_18','','Only +18'),(366,'not_allowed_change_age','','You are not allowed to change your age more than one time'),(367,'age_restrict_text','','This video is age restricted for viewers under +18'),(368,'age_restrcit_text_2','','Create an account or login to confirm your age.'),(369,'donation_paypal_email','','Donation PayPal Email'),(370,'download','','Download'),(371,'donate','','Donate'),(372,'video_approve_text','','This video is being reviewed, please check back later.'),(373,'_reached_upload_limit','','You have reached your upload limit.'),(374,'delete_some_videos','','Please delete some of your videos in able to upload more.'),(375,'other','Other','Other'),(376,'no_more_s_to_show','No more subscriptions','No more subscriptions'),(377,'sell_videos','Sell videos at any price','Sell videos at any price'),(378,'set_p_v','Price (Leave empty for free videos)','Price (Leave empty for free videos)'),(379,'p_m_than_','Minimum price you can set is','Minimum price you can set is'),(380,'pay_to_see','This video is being sold, you have to purchase the video to watch it.','This video is being sold, you have to purchase the video to watch it.'),(381,'pay','Purchase','Purchase'),(382,'paid_videos','Paid Videos','Paid Videos'),(383,'no_videos_found_paid','No paid videos found','No paid videos found'),(384,'transactions','Transactions','Transactions'),(385,'id','ID','ID'),(386,'payer_name','Payer Name','Payer Name'),(387,'video','Video','Video'),(388,'site_com','Site Commission','Site Commission'),(389,'time','Time','Time'),(390,'paid_to_see','purchased your video','purchased your video'),(391,'video_price','This video price is:','This video price is:'),(392,'purchased','Purchases','Purchases'),(393,'balance_','Balance','Balance'),(394,'video_price_error','The video price should be numeric and greater than','The video price should be numeric and greater than'),(395,'video_verified','This video is verified by our team','This video is verified by our team'),(396,'video_not_available','This video is no longer available','This video is no longer available'),(397,'admin_can_see','You have access to all videos, paid and free as you are an admin.','You have access to all videos, paid and free as you are an admin.'),(398,'net_earn','Net earnings','Net earnings'),(399,'user_upload_limit','User Upload Limit','User Upload Limit'),(400,'user_reached_upload_limit','You have reached your maximum upload limit, if you wish to increase it','You have reached your maximum upload limit, if you wish to increase it'),(401,'please_contact','please contact us','please contact us'),(402,'_reached_max_limit','You have reached your maximum upload limit','You have reached your maximum upload limit'),(403,'upload_up','Upload up to','Upload up to'),(404,'upload_up_no_limit','Upload unlimited videos','Upload unlimited videos'),(405,'two_factor','Two-factor authentication','Two-factor authentication'),(406,'disable','Disable','Disable'),(407,'enable','Enable','Enable'),(408,'sent_two_factor_email','We have sent you the confirmation code to your email address.','We have sent you the confirmation code to your email address.'),(409,'confirm_code','Confirmation Code','Confirmation Code'),(410,'wrong_confirm_code','Wrong confirmation code','Wrong confirmation code'),(411,'two_factor_description','','Turn on 2-step login to level-up your account\'s security, Once turned on, you\'ll use both your password and a 6-digit security code sent to your email to log in.'),(412,'upload_date','Upload Date','Upload Date'),(413,'last_hour','Last hour','Last hour'),(414,'today','Today','Today'),(415,'this_week','This week','This week'),(416,'this_month','This month','This month'),(417,'this_year','This year','This year'),(418,'video_studio','Video Studio','Video Studio'),(419,'view_analytics','View Analytics','View Analytics'),(420,'likes','Likes','Likes'),(421,'dislikes','Dislikes','Dislikes'),(422,'video_analytics','Video Analytics','Video Analytics'),(423,'total_likes','Total Likes','Total Likes'),(424,'total_dislikes','Total Dislikes','Total Dislikes'),(425,'total_views','Total Views','Total Views'),(426,'view_report','View report','View report'),(427,'dashboard','Dashboard','Dashboard'),(428,'latest_comments','Latest Comments','Latest Comments'),(429,'total_comments','Total Comments','Total Comments'),(430,'total_comments_today','Comments Today','Comments Today'),(431,'total_comments_month','Comments This Month','Comments This Month'),(432,'total_comments_year','Comments This Year','Comments This Year'),(433,'edit_comment','Edit Comment','Edit Comment'),(434,'channel_analytics','Channel Analytics','Channel Analytics'),(435,'total_sub','Total Subscribers','Total Subscribers'),(436,'the_most_viewed','Most Viewed Videos','Most Viewed Videos'),(437,'the_most_liked','Most Liked Videos','Most Liked Videos'),(438,'the_most_disliked','Most Disliked Videos','Most Disliked Videos'),(439,'the_most_commented','Most Commented Videos','Most Commented Videos'),(440,'last_month','This month compared to last month','This month compared to last month'),(441,'subscribers','Subscribers','Subscribers'),(442,'total_earn','Total Earnings','Total Earnings'),(443,'earnings','Earnings','Earnings'),(444,'ur_video_queue','Your video is being added to queue, please check back in few minutes.','Your video is being added to queue, please check back in few minutes.'),(445,'this_video_queue','This video is being added to queue, please check back in few minutes.','This video is being added to queue, please check back in few minutes.'),(446,'sort_by','Sort By','Sort By'),(447,'assign_to_user','Assign To User','Assign To User'),(448,'user_not_exists','User is not exist','User is not exist'),(449,'popular_channels','Popular Channels','Popular Channels'),(450,'no_more_channels_to_show','No more channels to show','No more channels to show'),(451,'no_channels_found_for_now','No channels found','No channels found'),(452,'filter_by','Filter By','Filter By'),(453,'sub_category','Sub Category','Sub Category'),(454,'none','None','None'),(455,'all','All','All'),(456,'video_not_available_location','This video is not available in your location.','This video is not available in your location.'),(457,'geo_blocking','Geo Blocking','Geo Blocking'),(458,'unknown_location','Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.','Your location is unknown, therefore this video was blocked.\\r\\nYou may try again later.'),(459,'ads_earnings','Ads Earnings','Ads Earnings'),(460,'videos_earnings','Video Earnings','Video Earnings'),(461,'sales_earnings','Sales Earning','Sales Earning'),(462,'ads_analytics','Ads Analytics','Ads Analytics'),(463,'all_time','All Time','All Time'),(464,'analytics','Analytics','Analytics'),(465,'1','category','Film &amp; Animation'),(466,'3','category','Music'),(467,'4','category','Pets & Animals'),(468,'5','category','Sports'),(469,'6','category','Travel & Events'),(470,'7','category','Gaming'),(471,'8','category','People & Blogs'),(472,'9','category','Comedy'),(473,'10','category','Entertainment'),(474,'11','category','News & Politics'),(475,'12','category','How-to & Style'),(476,'13','category','Non-profits & Activism'),(477,'phone_number','','PhoneNumber'),(479,'create_article','','Create article'),(480,'create_new_article','','Create new article'),(481,'descritpion','','Description'),(482,'the_article','','The article'),(483,'short_title','','The title should be more than 5 characters'),(484,'short_description','','The description should be more than 15 characters'),(485,'image_not_valid','','The Image file is not valid, please select a valid image.'),(486,'category_not_valid','','Invalid category, Please check your details.'),(487,'reviewed_article','','Thank you, your article has been submitted, and it\'s being reviewed, please check back later.'),(488,'my_articles','','My articles'),(489,'delete_article_text','','Are you sure you want to delete this article? This action can\'t be undo'),(490,'edit_article','','Edit article'),(491,'movies','','Movies'),(492,'is_movie','','Is it a movie?'),(493,'yes','','Yes'),(494,'no','','No'),(495,'movie_title','','Movie title'),(496,'stars','','Stars'),(497,'by_comma','','Separated by comma,'),(498,'producer','','Producer'),(499,'release','','Release'),(500,'rating_btween','','(Between 1 -> 10)'),(501,'duration','','Duration'),(502,'quality','','Quality'),(503,'rating','','Rating'),(504,'rent_price','','Rent Price (Leave empty for free videos)'),(505,'rent_text','','Or you can rent it for 24 hour'),(506,'rent','','Rent'),(507,'video_expire','','This video will expire at '),(508,'rent_video','','Rent this movie'),(509,'cover_size','','For movies, the cover size should not be more than 400x570.'),(510,'movies_text','','To watch this movie, you have to purchase it.'),(511,'transfer_earnings','','Transfer earnings to wallet'),(512,'transfer_money','','Transfer money to wallet, so you would be able to use them for ads.'),(513,'withdrawal_earnings','','Once the amount is transferred, you won\'t be able to withdrawal them.'),(514,'cant_transfer','','Your balance is {{balance}}, You can\'t transfer'),(515,'transfer','','Transfer'),(516,'balance_transferred','','Your balance was transferred.'),(517,'max_can_transfer','','The maximum amount that you can transfer is'),(518,'most_active','','Most active'),(519,'no_movies_found','','No movies found'),(520,'movies_page_search','','What you would like to watch?'),(521,'pay_to_see_video','','More to watch! to continue watching this video, you have to purchase it.');

/*Table structure for table `likes_dislikes` */

DROP TABLE IF EXISTS `likes_dislikes`;

CREATE TABLE `likes_dislikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`),
  KEY `type` (`type`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `likes_dislikes` */

insert  into `likes_dislikes`(`id`,`user_id`,`video_id`,`post_id`,`type`,`time`) values (4,1,0,4,1,1557014136),(5,1,0,2,1,1557045647);

/*Table structure for table `lists` */

DROP TABLE IF EXISTS `lists`;

CREATE TABLE `lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `privacy` int(11) NOT NULL DEFAULT '1',
  `views` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(3000) NOT NULL DEFAULT '',
  `time` int(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`(255)),
  KEY `user_id` (`user_id`),
  KEY `privacy` (`privacy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `lists` */

insert  into `lists`(`id`,`list_id`,`user_id`,`name`,`description`,`privacy`,`views`,`icon`,`time`) values (1,'q2Jcf2FwzNf6wpd',21,'bnvhgsfjkddhjksdfhsdjkfhsdjkfh..','sdajkfhsdjkfhjkfhjk',1,0,'',1558217857);

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seen` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `from_deleted` int(11) NOT NULL DEFAULT '0',
  `to_deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `seen` (`seen`),
  KEY `time` (`time`),
  KEY `from_deleted` (`from_deleted`),
  KEY `to_deleted` (`to_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `messages` */

insert  into `messages`(`id`,`from_id`,`to_id`,`text`,`seen`,`time`,`from_deleted`,`to_deleted`) values (2,9,1,'hi',1551300567,1551224304,0,0),(6,21,1,'Hi.',1556849812,1556849764,1,0),(7,21,1,'Hello',1556849812,1556849773,1,0),(8,21,1,'Do you manager for this webserver?',1556849812,1556849788,1,0),(9,1,21,'no...............',1556849908,1556849821,0,1),(10,1,21,'Hi',1556849908,1556849881,0,1),(11,21,1,'why',1556849915,1556849915,1,0),(12,1,21,'Do you understand?',1556849925,1556849925,0,1),(13,21,1,'I don&#039;t npw',1556849950,1556849949,1,0),(14,21,1,'What do you mean?',1556849972,1556849972,1,0),(15,1,21,'What do you mean?',1556849993,1556849993,0,1),(16,1,21,'...',1557720721,1557720679,0,1),(17,1,21,'Why <br> without response you?',1557720721,1557720699,0,1);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notifier_id` int(11) NOT NULL DEFAULT '0',
  `recipient_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `text` text,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `sent_push` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `type` (`type`),
  KEY `seen` (`seen`),
  KEY `notifier_id` (`notifier_id`),
  KEY `time` (`time`),
  KEY `video_id` (`video_id`),
  KEY `sent_push` (`sent_push`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`notifier_id`,`recipient_id`,`video_id`,`type`,`text`,`url`,`seen`,`time`,`sent_push`) values (10,0,21,0,'tournament_checkout','Checkout the DOTA 2 Tournaments Key:[sDoCmesr3iYIRbKYnceX]','tournament_read?id=1&checkout=sDoCmesr3iYIRbKYnceX','1557739501','1557330958',0),(11,0,21,0,'tournament_checkout','Checkout the DOTA 2 Tournaments  [Key: xBYzOLAQiTcwUM9LvhtV]','tournament_read?id=1&checkout=xBYzOLAQiTcwUM9LvhtV','1557739501','1557331071',0),(12,0,21,0,'tournament_checkout','Checkout the DOTA 2 Tournaments  [Key: BruOXkGkGjkDWRBfS5mh]','tournament_read?id=1&checkout=BruOXkGkGjkDWRBfS5mh','1557739501','1557331142',0),(13,21,1,10006,'paid_to_see',NULL,'watch/31QMpa1LpBILk9X','1558117121','1557418915',0),(14,1,2,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(15,1,3,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(16,1,4,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(17,1,5,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(18,1,9,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(19,1,13,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(20,1,15,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(21,1,6,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(22,1,23,10008,'added_video',NULL,'watch/sN5UPOurUoNZcUp','0','1557542629',0),(23,1,2,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(24,1,3,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(25,1,4,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(26,1,5,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(27,1,9,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(28,1,13,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(29,1,15,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(30,1,6,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(31,1,23,10009,'added_video',NULL,'watch/ejB58N5sKJOJ4Im','0','1557542774',0),(32,1,2,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(33,1,3,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(34,1,4,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(35,1,5,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(36,1,9,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(37,1,13,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(38,1,15,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(39,1,6,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(40,1,23,10010,'added_video',NULL,'watch/LojyRSAniTZHN4j','0','1557542877',0),(41,1,21,0,'refresh_rank','Your rank has been updated. You got 500 point and $ 500 as a tournament pool.','','1557739501','1557572002',0),(42,21,1,0,'subscribed_u',NULL,'@TorMix','0','1558217841',0),(43,21,1,0,'unsubscribed_u',NULL,'@TorMix','0','1558217842',0),(44,21,1,0,'subscribed_u',NULL,'@TorMix','0','1558217843',0),(45,21,1,0,'unsubscribed_u',NULL,'@TorMix','0','1558217843',0),(46,21,1,0,'subscribed_u',NULL,'@TorMix','0','1558217844',0),(47,21,1,4,'commented_ur_video',NULL,'watch/IEW3m4V1tzKKCbc&cl=11','0','1558217867',0);

/*Table structure for table `participant` */

DROP TABLE IF EXISTS `participant`;

CREATE TABLE `participant` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tourid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `time` varchar(100) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  `join` int(2) NOT NULL DEFAULT '0',
  `checkout` varchar(500) DEFAULT NULL,
  `report` int(2) DEFAULT '0',
  `reportimg` varchar(500) DEFAULT '',
  `curpoint` varchar(50) DEFAULT '0',
  `curpool` varchar(50) DEFAULT '0',
  `alert` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `participant` */

insert  into `participant`(`id`,`tourid`,`userid`,`time`,`state`,`join`,`checkout`,`report`,`reportimg`,`curpoint`,`curpool`,`alert`) values (1,4,21,'1557611507',1,1,'BruOXkGkGjkDWRBfS5mh',1,'upload/photos/2019/05/sHXZXGXhaKNGMbjE2wX9_09_c08ca54cda644f04a95db0ef5eb8e204_image.jpg','500','500',1),(2,4,1,'1557372645',1,1,'Ar3OXkGkGjkDWRBfS5mh',1,'upload/photos/2019/05/sHXZXGXhaKNGMbjE2wX9_09_c08ca54cda644f04a95db0ef5eb8e204_image.jpg','0','0',1),(3,1,1,'1557720659',0,1,NULL,0,'','0','0',0);

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(200) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL DEFAULT '0',
  `date` varchar(100) NOT NULL DEFAULT '',
  `expire` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `expire` (`expire`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`),
  KEY `amount` (`amount`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payments` */

insert  into `payments`(`id`,`user_id`,`type`,`amount`,`date`,`expire`) values (1,21,'pro',3000,'5/2019','1559553482');

/*Table structure for table `phone_verification_requests` */

DROP TABLE IF EXISTS `phone_verification_requests`;

CREATE TABLE `phone_verification_requests` (
  `userid` int(10) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `phone_verification_requests` */

insert  into `phone_verification_requests`(`userid`,`phonenumber`,`code`,`time`) values (21,'917895908266','87515','1557711673');

/*Table structure for table `platform_game` */

DROP TABLE IF EXISTS `platform_game`;

CREATE TABLE `platform_game` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `platform_game` */

/*Table structure for table `platforms` */

DROP TABLE IF EXISTS `platforms`;

CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `platforms` */

insert  into `platforms`(`id`,`name`,`short_name`) values (4,'EPIC GAMES',NULL),(7,'MOBILE',NULL),(8,'ORIGIN',NULL),(9,'PC',NULL),(10,'PS3',NULL),(11,'PS4',NULL),(12,'PUBG EMULATOR',NULL),(13,'PUBG MOBILE',NULL),(15,'STEAM',NULL),(16,'XBOX360',NULL),(17,'XBOXONE',NULL);

/*Table structure for table `play_list` */

DROP TABLE IF EXISTS `play_list`;

CREATE TABLE `play_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id` varchar(500) NOT NULL DEFAULT '',
  `video_id` varchar(500) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`(255)),
  KEY `video_id` (`video_id`(255))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `play_list` */

insert  into `play_list`(`id`,`list_id`,`video_id`,`user_id`) values (2,'YTpTpYR2W1eaVFV','2113',5),(3,'vfO5IQbvbgki2Yt','2112',5),(4,'vfO5IQbvbgki2Yt','2111',5),(5,'vfO5IQbvbgki2Yt','2110',5),(6,'juMC36EFj2OiDjs','2110',5),(7,'vfO5IQbvbgki2Yt','2109',5),(8,'xhzHrJtZRjcbD88','2109',5),(9,'vfO5IQbvbgki2Yt','2108',5),(10,'6qtQejyUIElpAYP','2108',5),(11,'vfO5IQbvbgki2Yt','2107',5),(12,'xhzHrJtZRjcbD88','2107',5),(13,'3LlAxxzSz4slsc7','2107',5),(14,'3LlAxxzSz4slsc7','2106',5),(15,'vfO5IQbvbgki2Yt','2106',5),(16,'juMC36EFj2OiDjs','2105',5),(17,'SDnq1TNFq4jbnLN','2105',5),(18,'xhzHrJtZRjcbD88','2104',5),(19,'3LlAxxzSz4slsc7','2104',5),(20,'vfO5IQbvbgki2Yt','2104',5),(21,'xhzHrJtZRjcbD88','2103',5),(22,'8YpTdA9WQbCGeyg','2103',5),(23,'SDnq1TNFq4jbnLN','2102',5),(24,'juMC36EFj2OiDjs','2102',5),(25,'qbQXv1ci4zbJOFE','2101',5),(26,'SDnq1TNFq4jbnLN','2100',5),(27,'qbQXv1ci4zbJOFE','2096',5),(28,'AMzUEcSv4VrFe3F','2095',5),(29,'qbQXv1ci4zbJOFE','2094',5),(30,'IvEgUTMEzz8gKsN','1994',5),(31,'SDnq1TNFq4jbnLN','1993',5),(32,'vfO5IQbvbgki2Yt','1992',5),(33,'SDnq1TNFq4jbnLN','1991',5),(34,'IvEgUTMEzz8gKsN','1990',5),(35,'AMzUEcSv4VrFe3F','1989',5),(36,'SDnq1TNFq4jbnLN','1988',5),(37,'YTpTpYR2W1eaVFV','2115',5),(38,'vfO5IQbvbgki2Yt','2116',5),(39,'juMC36EFj2OiDjs','2116',5),(40,'juMC36EFj2OiDjs','2117',5),(41,'vfO5IQbvbgki2Yt','2117',5),(42,'AMzUEcSv4VrFe3F','2118',5),(43,'qbQXv1ci4zbJOFE','2121',5),(47,'jG36sFmTqy6DEY9','3',1),(48,'jG36sFmTqy6DEY9','10006',1);

/*Table structure for table `profile_fields` */

DROP TABLE IF EXISTS `profile_fields`;

CREATE TABLE `profile_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `options` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` text COLLATE utf8_unicode_ci,
  `length` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT '0',
  `profile_page` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `registration_page` (`registration_page`),
  KEY `active` (`active`),
  KEY `profile_page` (`profile_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `profile_fields` */

/*Table structure for table `pt_posts` */

DROP TABLE IF EXISTS `pt_posts`;

CREATE TABLE `pt_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `category` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(3000) NOT NULL DEFAULT '',
  `text` text,
  `tags` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `shared` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `views` (`views`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`(255)),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `pt_posts` */

insert  into `pt_posts`(`id`,`title`,`description`,`category`,`image`,`text`,`tags`,`time`,`user_id`,`active`,`views`,`shared`) values (2,'Small Game','This is a Small Game.','10','upload/photos/2019/04/gaN5vdYlqMwOtKMUktaZ_23_63a7393182793c2330f5f3b49ceb9b9d_image.jpg','&lt;p&gt;Rha!!!!&lt;/p&gt;','12345','1557192681',1,'0',85,0),(4,'Top Game appera!','Currently, the top game appears like a comet and it keeps us rolling.','7','upload/photos/2019/05/SztoTbasMk99ls1VjyLm_04_f5458caba66cc7678541160fe5030c66_image.png','&lt;h1&gt;&lt;strong&gt;Topic News&lt;/strong&gt;&lt;/h1&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Currently, the top game appears like a comet and it keeps us rolling.&lt;/p&gt;','pubg,pubg mobile','1557014018',1,'',5,1);

/*Table structure for table `queue` */

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `video_res` varchar(20) NOT NULL DEFAULT '',
  `processing` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `processing` (`processing`),
  KEY `video_res` (`video_res`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `queue` */

/*Table structure for table `reports` */

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(15) NOT NULL DEFAULT '0',
  `article_id` int(15) NOT NULL DEFAULT '0',
  `ad_id` int(15) NOT NULL DEFAULT '0',
  `comment_id` int(20) NOT NULL DEFAULT '0',
  `reply_id` int(25) NOT NULL DEFAULT '0',
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `text` text,
  `time` varchar(50) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `article_id` (`article_id`),
  KEY `ad_id` (`ad_id`),
  KEY `profile_id` (`profile_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reports` */

/*Table structure for table `saved_videos` */

DROP TABLE IF EXISTS `saved_videos`;

CREATE TABLE `saved_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `saved_videos` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `platform` (`platform`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`session_id`,`user_id`,`platform`,`time`) values (5,'72bf6ce92f363e9a912d38208355efe71d8f9cdc15507940252eb1d42172db54f24fe1108d4eb61c1d',4,'web',1550794025),(6,'2bd4bd6ea9b41862ea6af97937ff87b2aba10fc61550842158e4bf381cd640b3ddde311bda27aae4b7',5,'web',1550842158),(7,'d36e2a6f93443f1ab33321474ce072a6397abc16155084316047159790703bb354de0b6b48a9c07875',1,'web',1550843160),(8,'261de52d0f0ca137e21f0a100c3da99c749a6e771550867011efa9ff5a8dea6de3e944596b5d957527',5,'web',1550867011),(9,'7a2d9adaa1d27514f286b37b12deb5f3e27c574b1551039057ce15903d062034f9033d40bfb58b891f',5,'web',1551039057),(12,'905e042c5d801285693a045df64b20b24034645015511353839ac984ac84c86d9a066d84b87c12f60b',1,'web',1551135383),(20,'e540ed597ed603398fe0c2041b43bbf49a6c61911551224218b869e4ae3282eb7e514fb3898500d111',9,'web',1551224218),(21,'32aff1e0a1ef7549575ce539b4d1c9b36ce6e8171551224555298de5485daac6f0f010e782cd75f3a0',9,'web',1551224555),(22,'8bf6f70b60e5b0b45745df49def70abe4a9aaf1e155124503836717108442ff94e8e217071ffc1effb',1,'web',1551245038),(23,'f402188b389ee219c250bbc700f63b7eeb0232dd1551300707fbaefe51f70b63483beebbd6864b88e7',5,'web',1551300707),(24,'f116eec76f790f72228a9b11caf9aef70a6c7eba15515127825a0bfe0490fef613a3cf6360162a6591',2,'web',1551512782),(26,'bafb2851bd2ec24a9ecb7f30a5ae84a8084a7cf115517103593b7a0144578605cc0a2ba2ced08087ff',10,'web',1551710359),(27,'fccfe4cba533150dbbf2a3f84ddec47eb73a938515517109155e41bcbf6c60931153ad46aff483309c',5,'web',1551710915),(28,'edb9cbe0bc232ae6ec219fefcf57dfbf0adaec8a1551772301d7de6c84ce7c4dcca1f24fc240fda4cd',11,'web',1551772301),(29,'d508e1f95edc2ac5d977732108d4ca131447077915517755802d18bb117c58a98719262db89d006bd3',11,'web',1551775580),(30,'ec663b90854398b9da1b61517974a749815b50601551777652014ce2693801ce3388d1953b4e74064b',12,'web',1551777652),(31,'11a0e9d92b553a1f99211fea8259cecf397c1ad61551810853f056d0345d4baaab56cd28d482b86f94',13,'web',1551810853),(32,'631775c9ef0975190f0cf1a0d4ae898c604645f31552135225d28b91eb150592a9c3a1a0f662aefb40',5,'web',1552135225),(33,'d33d053ac6430fcaafaf0a49d69014b4268de0891552139248da37e5344d4a42f5dce2ec86d24d0817',14,'web',1552139248),(35,'aed40f60390818c04fcf64817ec84f96724482781552167921763b15d13547798838a54df24b83fb22',15,'web',1552167921),(36,'6d9861d17bd08c494c022139005d860dc21a785e155216802052a74a7ff9915ce1a1e88cc12521d02e',1,'web',1552168020),(38,'b67f822edf38ba91fc1545aefc323b783ef64d9e1552569730dd353277fdd933326924df701d1c7a43',8,'web',1552569730),(39,'d5b9dc84354cc73a5992fbf58338dd8fde133ad21552570733f6cbcc0de76dadbd7f6c3262815a656a',8,'phone',1552570733),(40,'d5b9dc84354cc73a5992fbf58338dd8fde133ad21552570733f6cbcc0de76dadbd7f6c3262815a656a',8,'web',1552570733),(41,'7c2c0d8c0664dd1f9f8311d261633088272b3ad81552596863c649b9ea0044978de3ace4987b838f24',16,'phone',1552596863),(42,'7c2c0d8c0664dd1f9f8311d261633088272b3ad81552596863c649b9ea0044978de3ace4987b838f24',16,'web',1552596863),(44,'e41091852f2b296ba4c076a53c51979abfc4bfc91552726691d50c204c581246971d380f776ea74e8e',5,'phone',1552726691),(45,'e41091852f2b296ba4c076a53c51979abfc4bfc91552726691d50c204c581246971d380f776ea74e8e',5,'web',1552726691),(46,'3c3d4ac0608e1c36666a23fbc4795e1d11e682fc155273942232b63ca6ee0de2c4df18d2c813d07d6e',1,'web',1552739422),(47,'884556be30cc66846fd0a4cd41d0488d1811e6c71552743031afb8ea3f6cdbfb58deefe205ad31fa52',5,'web',1552743031),(48,'6fb41ee1058719baaa69a9da1b3c5e4d55994bf01552767658790abffe9884726fb5d695d1ddc3b63f',17,'phone',1552767658),(49,'6fb41ee1058719baaa69a9da1b3c5e4d55994bf01552767658790abffe9884726fb5d695d1ddc3b63f',17,'web',1552767658),(50,'9895c31cbf3ff66a3c5827f2de78a5d194702bec15527701518863f6c4aace55cea71988527d627e27',18,'phone',1552770151),(51,'9895c31cbf3ff66a3c5827f2de78a5d194702bec15527701518863f6c4aace55cea71988527d627e27',18,'web',1552770151),(52,'1ce92197d5150f18368defb9459b35e8e9017cd61552825997c9312d3c71aa4c28223d53658bdced5f',5,'web',1552825997),(53,'d77b95cb95d7627eaa1a224f535c9963e0a76ac31552842555ce9ea792a02f75eac9b2a65237f77822',2,'web',1552842555),(54,'57cf00d88fa48f067620ef9eaf06d4f705d0e9d815528489503e8c42c494960f7ff429b40b97f1e780',2,'phone',1552848950),(55,'57cf00d88fa48f067620ef9eaf06d4f705d0e9d815528489503e8c42c494960f7ff429b40b97f1e780',2,'web',1552848950),(57,'5b7e9c6810e78c7e69cb74e2f50c0b8d584afda51553043892baa2096d65b78457571bdaae3cf8615b',6,'web',1553043892),(58,'81644f879b3a52c9281e3c75670f5e2639379fe31553045750eb771dff38b42e4c5435bf6164c6bd47',19,'web',1553045750),(59,'27513da5c148e7a133e9cef7e77d09a8d1dddf8515531981060d6f7c9c15f2fab6e6032babc0c9abe4',20,'web',1553198106),(60,'46d24dd7366cb3cf288887d0710dce107ceade2f15532622322b607236fe2da4b892a766cdd83e6e5d',21,'web',1553262232),(61,'d6d318d93ad115681a96b8ddf046271e900b259a1553342513e877e405664386656073f08f6e6ec69c',22,'web',1553342513),(62,'d4af4af93843e55dc557a2f41c743512d359d464155334612687ad461036b1a76e56016ce88a03c78f',1,'web',1553346126),(63,'f5e7599272d0073761f354f4d4b44135113ce5d915533485422681c2e1856e728b51d9623804b5b3c0',1,'web',1553348542),(66,'81ad816218f3f05c0ef1e1c52d2a6c50077dd24d15533531145a5bf170d71d3c443ee6b7dd0138b3dd',21,'web',1553353114),(68,'ccfc8c04b485e15ce3b8624ed9d3ff004cc069221553434579a996f4e3e5faaece989b639e32096408',1,'web',1553434579),(69,'2795de3787a1a814c96659405de98e664069d4aa15534350634c125503fbcd92603f53828e6c2f2f80',21,'web',1553435063),(70,'b5df61ee34f5cf4c03f8bde21a9617f9f4eb928015535341484beb133065e2014ec2187607cca67613',1,'web',1553534148),(71,'abe7b9f4dd48eadc08f16bf649067809fca54baa1553578974681fcb0bbdee8d468bc7dfe0c833b237',1,'phone',1553578974),(72,'abe7b9f4dd48eadc08f16bf649067809fca54baa1553578974681fcb0bbdee8d468bc7dfe0c833b237',1,'web',1553578974),(73,'3f59a18a0fbf82be773aa245ea33cf56e7a87bf215535998080829d342908850f145d289742f7b5ab3',24,'phone',1553599808),(74,'3f59a18a0fbf82be773aa245ea33cf56e7a87bf215535998080829d342908850f145d289742f7b5ab3',24,'web',1553599808),(75,'10576c19c92c7ae6298d69ed07daf0293fcca7ec15536074477565c3bb9608d45033d5b2a38cd12884',23,'web',1553607447),(76,'7018b7b2a1a594fc13da6b2e58362421e128a39e1553691009a4d1fa023a6c2622173bea710e6ef5e0',5,'phone',1553691009),(77,'7018b7b2a1a594fc13da6b2e58362421e128a39e1553691009a4d1fa023a6c2622173bea710e6ef5e0',5,'web',1553691009),(78,'6101b88864b446d09d1ec7f303967cc0b6efeb091553698722698574aabfc7342a1bd1468030e2cc49',1,'web',1553698722),(79,'672f0a5f9bbfab32228b40a828f02374e6c32849155369886585ad277193dc44d1b1ddcc7564874380',21,'web',1553698865),(80,'fc9ff4fe7480bcbc341dcb1f460f0f522d45add41553699345645392d9a01b962e0954de635d26cd74',1,'web',1553699345),(81,'ee9cf3931f34ea88fabfd0822fbac4ba2891e1941553705604f96c0fe712840c6420b84cab5a3cd2ac',21,'web',1553705604),(82,'280857acced4f64ed69455fd8312c75b227c55b615537186724ff5c132f7176bfeb1fe47bdb118e0f0',1,'web',1553718672),(83,'30b2c74e1f9057d196a3422ad66f603b497477fd155377658923cad391b91019340892437ac385d528',1,'web',1553776589),(85,'15ae23dce08ba67da26caeb9e4b4321ac7f84ec71554118197f114befff3350cda8321590284a8c7b6',23,'phone',1554118197),(86,'15ae23dce08ba67da26caeb9e4b4321ac7f84ec71554118197f114befff3350cda8321590284a8c7b6',23,'web',1554118197),(88,'85d2ac69187a2024646860ef80ec2ca1b4e348e21554230222861a73db350d60c837b317e38c5ac2c4',21,'web',1554230222),(89,'b63a0db15dbe9c90862e25175688f0bdd4d946c51554283716a8b7e146d91f48f15538662b58360889',21,'web',1554283716),(90,'681a7a9053cf0ecb3e84ce880e115730f3f8aa92155446345061c213f5f984f8930a7f46265b01fe12',5,'web',1554463450),(91,'666f3e392689b02eeb2dc15d19641eae58face1515550707067015c34a7bccd39fd8d0d5979ee2d514',21,'web',1555070706),(92,'bbf402e4a8755d228701ea3da488f0bf4f39488815552728949246b7e349dd8e50b59f297ba049ddf9',1,'web',1555272894),(93,'b5449c47261d9082540c5cdbebf37c36a591c0a915552767965ba8c21bc38fe2a61d833a06aa180465',23,'web',1555276796),(97,'eb79e2e2f393c3294747032248fda937865fe031155545115892dd8013c780fa3272c20d070372b5c6',1,'web',1555451158),(98,'b802d5c460085a2bae78fe9d2715a49ba13fa00b15554819589fadc4f30aa89417da66c193414f4d7f',1,'web',1555481958),(100,'b1c140648288e2a4d0c023b3fd5082378e6e07991555575128a4a0bced385c284c3d0c75066d4b2615',1,'web',1555575128),(153,'3a3413932d1bac55184998ce46fe66bd98cefed0155592191156986863ef906caa484c1ba744b2371a',1,'web',1555921911),(155,'28c8e89fb5758a5fcb24d672fd656f9197e3456e1555928809e693e712d25215f1576a81815bb2050e',1,'web',1555928809),(164,'b877e7ba42cc51da7ef255e248516168482c7eba15560699228e37b726b76f8538248b963a5cbf50d7',1,'web',1556069922),(165,'a9162b959d55f75abf17f3b0f44d0a240a6809d3155607100930104a2438fefcdcbc0d73a4187c9148',1,'web',1556071009),(191,'f89d6ebd7823406efcffde21f5afff258ee8af6d15567981883651701e6bff85c48fe5328235350bc3',1,'web',1556798188),(192,'70de81671347ceae446bb2069f887b855fe8e6071556798640bdefec863b2d8772206a2a93170a28c1',1,'web',1556798640),(199,'f3f63bcd7d30fecbb1ae0c41e4fc7ebea8531f7015568499039c29f8c080460013e33b8dd151f62e35',21,'web',1556849903),(243,'4b27daecca1d88e2ce987290b19e5a27c22e7938155772071527aeedc33e6b48beb5e4bd617e413929',21,'web',1557720715),(251,'cd0c60869b35618eccdda2912a378dad51b524a01558214267b28381ac32dc25709ab3f0ccc8580450',21,'web',1558214267);

/*Table structure for table `site_ads` */

DROP TABLE IF EXISTS `site_ads`;

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `placement` (`placement`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `site_ads` */

insert  into `site_ads`(`id`,`placement`,`code`,`active`) values (1,'header','',0),(2,'footer','',0),(3,'watch_side_bar','',0),(4,'watch_comments','',0);

/*Table structure for table `subscriptions` */

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subscriber_id` (`subscriber_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `subscriptions` */

insert  into `subscriptions`(`id`,`user_id`,`subscriber_id`,`time`,`active`) values (1,1,2,1550747514,1),(2,1,3,1550759638,1),(3,3,1,1550799542,1),(4,1,4,1550799989,1),(5,4,1,1550800006,1),(7,5,1,1551081106,1),(8,1,5,1551085913,1),(10,6,1,1551135896,1),(11,5,6,1551192514,1),(12,2,5,1551211058,1),(13,5,9,1551224241,1),(14,1,9,1551224279,1),(15,5,10,1551710444,1),(16,10,5,1551710924,1),(17,4,10,1551711476,1),(19,5,11,1551773218,1),(21,1,13,1551888042,1),(22,5,13,1551888047,1),(23,13,5,1551899927,1),(24,1,15,1552167934,1),(25,5,16,1552599702,1),(27,5,2,1552851698,1),(28,1,6,1553043918,1),(29,4,6,1553043968,1),(32,23,21,1553468596,1),(33,21,5,1553546564,1),(34,1,23,1553607594,1),(35,23,1,1555275650,1),(36,21,1,1556065804,1),(37,28,21,1556489826,1),(40,1,21,1558217844,1);

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `createid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `gameid` int(10) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `active` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `team` */

insert  into `team`(`id`,`createid`,`name`,`description`,`gameid`,`image`,`time`,`active`) values (2,1,'DOTA2 TEAM','This is a DOTA2 TEAM. <br> <br> <br>lkjlj',5,'upload/photos/2019/04/svkWZWybodb7pcpUaz4p_25_a4ea8738240eacdca27863574c1cc914_image.jpeg','1556193586',1),(3,1,'Battle Ground team','Our is a battleground team.',2,'upload/photos/2019/04/Oj5lx8DHUpbaCgFr6tOD_26_1ccb4f90f94060493fcadfa753d72d7c_image.jpg','1556260539',1),(4,21,'Tormix Team','This is a Tormix Super Team',5,'upload/photos/2019/04/UcbVuXBheTQECVeM8dWk_29_814dd562f04b4366306fde5a7210518b_image.jpg','1556505015',1);

/*Table structure for table `team_invite` */

DROP TABLE IF EXISTS `team_invite`;

CREATE TABLE `team_invite` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `teamid` int(10) NOT NULL,
  `time` varchar(100) DEFAULT NULL,
  `accept` int(3) NOT NULL DEFAULT '0',
  `resend` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `team_invite` */

insert  into `team_invite`(`id`,`userid`,`teamid`,`time`,`accept`,`resend`) values (1,28,4,'1556489784',1,0),(2,21,3,'1556634269',1,0);

/*Table structure for table `terms` */

DROP TABLE IF EXISTS `terms`;

CREATE TABLE `terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `terms` */

insert  into `terms`(`id`,`type`,`text`) values (1,'terms_of_use','&lt;h4&gt;1. Participation in GamerDeadZone:&lt;/h4&gt; &lt;br&gt; &lt;br&gt;    GamerDeadZone is an Esports League where competitors (players)will play against each other using PC, PlayStation or other game consoles. &lt;br&gt;    Tournament will be held at a venue decide by the organizer . GamerDeadZone reserves the right to disqualify players who don’t comply the game rules. &lt;br&gt;    Tournament venue will be communicated by way of the official GamerDeadZone website, www.ultimatebattle.in &lt;br&gt;    The format of Tournament will be available on the website and a separate copy will also be communicated to the finalists individually. &lt;br&gt;    If any player reaching final who is minor must be accompanied by at least one adult, whether parent or legal guardian. &lt;br&gt;    The winner ‘s of the Event will be awarded a trophy, a certificate and a cash prize of $Amount. &lt;br&gt;    All prizes are non-transferable or exchangeable and no cash alternatives will be offered. &lt;br&gt;    GamerDeadZone reserves the right to withdraw any prize at any time at its sole discretion. &lt;br&gt; &lt;br&gt;&lt;h4&gt;2. General Provisions:&lt;/h4&gt; &lt;br&gt; &lt;br&gt;    GamerDeadZone will contact the finalists of the tournament via email to inform them of their qualification for the Tournament grand final. &lt;br&gt;    By participating Tournament, each player agrees and acknowledges that neither The GamerDeadZone nor their respective affiliates, subsidiaries, parents, representatives, advertising promotion and publicity agencies in any way responsible or liable for any damages, loss or injury. &lt;br&gt;    Player would be solely responsible for lost, incomplete, incorrect, damaged, delayed or misdirected applications. &lt;br&gt;    Employees of The GamerDeadZone and their respective affiliates, subsidiaries, parents, representatives, advertising, promotion and publicity agencies and the immediate families of each are not eligible to participate in the open tournament. &lt;br&gt;    The players agree and acknowledge that that giving and taking bribes and manipulating results in any manner could lead to criminal proceedings. &lt;br&gt;    All disputes in connection with this term and condition document, including disputes as to its conclusion, binding effect, amendment and termination, are to be settled between the parties by negotiation. If no solution can be reached, such disputes shall be exclusively resolved by tribunal limited to New Delhi jurisdiction. &lt;br&gt;    The expenses incurred on travel to reach the tournament venue would be borne by the player and not the organizers. &lt;br&gt;    Any prize(s) or trophy(s) pictured in contest materials are for illustration purpose only. Actual prizes may vary from any pictured prize. The GamerDeadZone reserves the right to make changes to the list of prizes at its sole discretion. &lt;br&gt; &lt;br&gt;&lt;h4&gt;3. Legal Provisions:&lt;/h4&gt; &lt;br&gt; &lt;br&gt;    Violation of any part of Tournament, terms and conditions may result in sanctions and / or loss of winner status. GamerDeadZone reserves the right to sanction any player in competition at any level, any time for any reason. &lt;br&gt;    The ‘sanction’ term mentioned in 3.1 may be in form of Player I) warning; ii) reprimand; iii) fine; iv) return of an award (including prize money); v) caution; vi) disqualification. &lt;br&gt;    The participant (player) assumes sole liability for injuries and/or damage to property caused or claimed to be caused by participating in Tournament. &lt;br&gt;    The GamerDeadZone retains every right use participant’s name, still or moving image on GamerDeadZone’s websites in and all publicity and advertising for Tournament without additional notification or compensation. &lt;br&gt;    To participate in Tournament, the player(s) needs to provide The GamerDeadZone with personal data comprising name, address, age, email address and nationality. &lt;br&gt;    Player(s) acknowledge and agree that the personal data provided to The GamerDeadZone will be used, processed and stored for purposes relating to the proper organization of the Tournament. &lt;br&gt;    In addition to it, the ‘player’ acknowledges and agrees to GamerDeadZone’s use and disclosure of player’s personal data to affiliates, employees,agents, representatives and and third party organizations for the purpose of proper organization of the Tournament. &lt;br&gt;    Player also acknowledges and agrees to The GamerDeadZone’s use of personal data if required to do so by law enforcement agencies to comply with legal process. &lt;br&gt; &lt;br&gt;&lt;h4&gt;4. Commercial Rights&lt;/h4&gt; &lt;br&gt; &lt;br&gt;    Players shall not associate themselves with Tournament in any commercial manner, nor use any intellectual property rights of The GamerDeadZone, nor shall they permit any third parties to do so. &lt;br&gt;    Players shall not carry out or facilitate any promotional or marketing activity at tournament venue. &lt;br&gt;    The recording, altering, dissemination or any other exploitation of images of the tournament is strictly prohibited. &lt;br&gt;    By participating in the contest, you agree and acknowledge that The GamerDeadZone, its bodies, officers, agents, employees, volunteers, sponsors and any other affiliate body working on its behalf have no liability whatsoever for any injuries, loss or damage. &lt;br&gt;    Please note: The GamerDeadZone doesn’t make, nor is in any manner responsible for any warranty, representations, guarantees, expressed or implied related to the quality, conditions, fitness or merchant ability of any aspects of the prize. &lt;br&gt;    Any and all rights in relation to the tournament are the exclusive property of The GamerDeadZone. Players are prohibited to reproduce any information and data in any format without the prior consent of The GamerDeadZone. &lt;br&gt;    The GamerDeadZone reserves the rights to bring changes or alter game pattern to enhance the contest. Details of such changes will be published on the contest website. &lt;br&gt;    The GamerDeadZone, at its sole discretion, may suspend a participant, disqualify any application, amend rules or provision at any time in the event of circumstances beyond the its control. &lt;br&gt;    The GamerDeadZone’s decision in connection with any aspect of the contest shall be final and enforceable. &lt;br&gt;    Winners for the Tournament contest will be selected as per the methods stipulated in game rules. &lt;br&gt;    Any legal dispute between you and The GamerDeadZone in relation to the contest or provisions shall be governed by and interpreted in accordance with the laws of India. &lt;br&gt; &lt;br&gt;&lt;h4&gt;5. Event Platform&lt;/h4&gt; &lt;br&gt; &lt;br&gt;    GamerDeadZone is also an online platform where users can find Events &amp; Services, which shall include, but are not limited to setting out their preferences in relation to the activities they wish to partake in and Customers can book these services or learn about these Services. The Website works on the model of listing of Service Providers and enabling them to showcase their profile. The Website also has a provision for the Users to provide their ratings and reviews on the quality of services. The Users of the Website are also allowed to post questions or queries regarding certain events on the Platform and these questions shall be visible to the Users of the Website in general and the responses to such questions/queries shall also be public.Players shall not carry out or facilitate any promotional or marketing activity at tournament venue. &lt;br&gt;    The content and images used on this site are copyright protected and copyrights vests with the respective owners. The usage of the content and images on this website is intended to promote the works and no endorsement of the artist shall be implied. Unauthorized use is prohibited and punishable by law. &lt;br&gt;    Events Listed on Website are on the information basis with the motive of Publicity and Marketing only, thus GamerDeadZone is not liable for any Fraudulent or inappropriate information except for the Events which are powered by GamerDeadZone(Brain Pulse Technologies Pvt Ltd.).&lt;br&gt;&lt;br&gt;'),(2,'privacy_policy','&lt;h2&gt;Who we are?&lt;/h2&gt;Provide name and contact details of the data controller. This will typically be your business or you, if you are a sole trader. Where applicable, you should include the identity and contact details of the controller’s representative and/or the data protection officer.   &lt;br&gt;&lt;h2&gt;What information do we collect?&lt;/h2&gt; Specify the types of personal information you collect, eg names, addresses, user names, etc. You should include specific details on: &lt;br&gt;how you collect data (eg when a user registers, purchases or uses your services, completes a contact form, signs up to a newsletter, etc)  &lt;br&gt;what specific data you collect through each of the data collection method &lt;br&gt;if you collect data from third parties, you must specify categories of data and source &lt;br&gt;if you process sensitive personal data or financial information, and how you handle this  &lt;br&gt;&lt;br&gt;You may want to provide the user with relevant definitions in relation to personal data and sensitive personal data.  &lt;br&gt;&lt;br&gt;&lt;h2&gt;How do we use personal information?&lt;/h2&gt;Describe in detail all the service- and business-related purposes for which you will process data. For example, this may include things like: &lt;br&gt;personalisation of content, business information or user experience &lt;br&gt;account set up and administration &lt;br&gt;delivering marketing and events communication &lt;br&gt;carrying out polls and surveys &lt;br&gt;internal research and development purposes &lt;br&gt;providing goods and services &lt;br&gt;legal obligations (eg prevention of fraud) &lt;br&gt;meeting internal audit requirements &lt;br&gt;&lt;br&gt;Please note this list is not exhaustive. You will need to record all purposes for which you process personal data.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;What legal basis do we have for processing your personal data?&lt;/h2&gt;Describe the relevant processing conditions contained within the GDPR. There are six possible legal grounds:  &lt;br&gt;consent &lt;br&gt;contract &lt;br&gt;legitimate interests &lt;br&gt;vital interests &lt;br&gt;public task  &lt;br&gt;legal obligation &lt;br&gt;&lt;br&gt;Provide detailed information on all grounds that apply to your processing, and why. If you rely on consent, explain how individuals can withdraw and manage their consent. If you rely on legitimate interests, explain clearly what these are. &lt;br&gt; &lt;br&gt;If you’re processing special category personal data, you will have to satisfy at least one of the six processing conditions, as well as additional requirements for processing under the GDPR. Provide information on all additional grounds that apply.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;When do we share personal data?&lt;/h2&gt;Explain that you will treat personal data confidentially and describe the circumstances when you might disclose or share it. Eg, when necessary to provide your services or conduct your business operations, as outlined in your purposes for processing. You should provide information on: &lt;br&gt;how you will share the data &lt;br&gt;what safeguards you will have in place &lt;br&gt;what parties you may share the data with and why &lt;br&gt; &lt;br&gt;&lt;h2&gt;Where do we store and process personal data?&lt;/h2&gt; If applicable, explain if you intend to store and process data outside of the data subject’s home country. Outline the steps you will take to ensure the data is processed according to your privacy policy and the applicable law of the country where data is located. &lt;br&gt; &lt;br&gt;If you transfer data outside the European Economic Area, outline the measures you will put in place to provide an appropriate level of data privacy protection. Eg contractual clauses, data transfer agreements, etc. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How do we secure personal data?&lt;/h2&gt; Describe your approach to data security and the technologies and procedures you use to protect personal information. For example, these may be measures: &lt;br&gt;to protect data against accidental loss &lt;br&gt;to prevent unauthorised access, use, destruction or disclosure &lt;br&gt;to ensure business continuity and disaster recovery &lt;br&gt;to restrict access to personal information &lt;br&gt;to conduct privacy impact assessments in accordance with the law and your business policies &lt;br&gt;to train staff and contractors on data security &lt;br&gt;to manage third party risks, through use of contracts and security reviews &lt;br&gt; &lt;br&gt;Please note this list is not exhaustive. You should record all mechanisms you rely on to protect personal data. You should also state if your organisation adheres to certain accepted standards or regulatory requirements. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How long do we keep your personal data for?&lt;/h2&gt; &lt;br&gt;Provide specific information on the length of time you will keep the information for in relation to each processing purpose. The GDPR requires you to retain data for no longer than reasonably necessary. Include details of your data or records retention schedules, or link to additional resources where these are published. &lt;br&gt; &lt;br&gt;If you cannot state a specific period, you need to set out the criteria you will apply to determine how long to keep the data for (eg local laws, contractual obligations, etc) &lt;br&gt; &lt;br&gt;You should also outline how you securely dispose of data after you no longer need it. &lt;br&gt;&lt;br&gt;&lt;h2&gt;Your rights in relation to personal data&lt;/h2&gt; Under the GDPR, you must respect the right of data subjects to access and control their personal data. In your privacy notice, you must outline their rights in respect of: &lt;br&gt;access to personal information  &lt;br&gt;correction and deletion &lt;br&gt;withdrawal of consent (if processing data on condition of consent) &lt;br&gt;data portability &lt;br&gt;restriction of processing and objection &lt;br&gt;lodging a complaint with the Information Commissioner’s Office &lt;br&gt; &lt;br&gt;You should explain how individuals can exercise their rights, and how you plan to respond to subject data requests. State if any relevant exemptions may apply and set out any identity verification procedures you may rely on. &lt;br&gt; &lt;br&gt;Include details of the circumstances where data subject rights may be limited, eg if fulfilling the data subject request may expose personal data about another person, or if you’re asked to delete data which you are required to keep by law.  &lt;br&gt; &lt;br&gt;&lt;h2&gt;Use of automated decision-making and profiling&lt;/h2&gt; Where you use profiling or other automated decision-making, you must disclose this in your privacy policy. In such cases, you must provide details on existence of any automated decision-making, together with information about the logic involved, and the likely significance and consequences of the processing of the individual. &lt;br&gt; &lt;br&gt;&lt;h2&gt;How to contact us?&lt;/h2&gt; Explain how data subject can get in touch if they have questions or concerns about your privacy practices, their personal information, or if they wish to file a complaint. Describe all ways in which they can contact you – eg online, by email or postal mail. &lt;br&gt;&gt; &lt;br&gt;If applicable, you may also include information on: &lt;br&gt; &lt;br&gt;&lt;h2&gt;Use of cookies and other technologies&lt;/h2&gt; You may include a link to further information, or describe within the policy if you intend to set and use cookies, tracking and similar technologies to store and manage user preferences on your website, advertise, enable content or otherwise analyse user and usage data. Provide information on what types of cookies and technologies you use, why you use them and how an individual can control and manage them. &lt;br&gt; &lt;br&gt;Linking to other websites / third party content &lt;br&gt;If you link to external sites and resources from your website, be specific on whether this constitutes endorsement, and if you take any responsibility for the content (or information contained within) any linked website. &lt;br&gt;&lt;br&gt;You may wish to consider adding other optional clauses to your privacy policy, depending on your business’ circumstances.'),(3,'about','&lt;h4&gt;1- Write about your website here.&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.          &lt;br&gt;&lt;br&gt;          &lt;h4&gt;2- Random title&lt;/h4&gt;          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod          tempor incididunt ut labore et dxzcolore magna aliqua. Ut enim ad minim veniam,          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

/*Table structure for table `tournaments` */

DROP TABLE IF EXISTS `tournaments`;

CREATE TABLE `tournaments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `rule` text NOT NULL,
  `platform` varchar(100) NOT NULL,
  `gameid` int(3) NOT NULL,
  `type` varchar(50) NOT NULL,
  `feetype` varchar(50) NOT NULL,
  `eventfee` varchar(50) DEFAULT NULL,
  `pool` varchar(50) NOT NULL,
  `maxnumber` int(4) NOT NULL,
  `startdate` varchar(80) NOT NULL,
  `image` varchar(200) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `time` varchar(50) NOT NULL,
  `createid` int(5) NOT NULL,
  `joincount` int(5) DEFAULT '0',
  `state` varchar(50) NOT NULL DEFAULT 'OPEN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tournaments` */

insert  into `tournaments`(`id`,`title`,`description`,`rule`,`platform`,`gameid`,`type`,`feetype`,`eventfee`,`pool`,`maxnumber`,`startdate`,`image`,`active`,`time`,`createid`,`joincount`,`state`) values (1,'DOTA 2','This is a DOTA 2 Game','&lt;div class=&quot;jsx-4288270166 modal-body&quot;&gt;\r\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\r\n&lt;p&gt;&lt;strong&gt;Decisions taken by the GamingMonk Admin team will be final and binding and will not be reversed under any circumstances.&lt;/strong&gt;&lt;strong&gt;&lt;br /&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Violation of any of the rules mentioned below will be eligible for a DQ. The admin team will determine if a DQ will be levied or not.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;strong&gt;Game Rules:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Server : Custom Match Lobby ID and password will be provided 15 mins prior to match start time via Email, SMS &amp;amp; shall also be displayed on update score page.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Qualifier Format: Single Match Classic Erangel/Sanhok/Vikendi.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Emulator is Not allowed any player found using emulator will forfeit the tournament and will be banned from all future tournaments.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Top 10 players from every match of 100 Players will be awarded the prizes.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Format: Single Match Normal Custom Game.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Map :Erangel/Sanhok/Vikendi (SEA Solo TPP)&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;All players are expected to have read and accepted the rules&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Tournament admins has the last decision on any problem that may occur.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Teaming is Not allowed.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;Players will be banned if found teaming.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Final Scoring:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Points will be awarded as per below standings for each match:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;1st - 300&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;2nd - 225&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;3rd - 190&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;4th - 165&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;5th - 145&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;6th - 130&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;7th - 115&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;8th - 100&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;9th - 85&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;10th - 70&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;11th - 12th - 60&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;13th - 15th - 50&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;16th - 20th - 40&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;For every kill, a player will be awarded bonus 10 points.&lt;/span&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr class=&quot;jsx-4288270166&quot; /&gt;\r\n&lt;p class=&quot;jsx-4288270166 lead&quot;&gt;How to Play?&lt;/p&gt;\r\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\r\n&lt;p&gt;&lt;strong&gt;How to Join the custom Match lobby?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Hover below the &amp;ldquo;Start&amp;rdquo; button on the upper left corner of your screen (where game mode and server region is set).&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Then click on the bottom option that looks like a &amp;ldquo;Home&amp;rdquo; symbol. &lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;This will let you view a list of custom matches.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Search for the match lobby with given lobby ID &amp;amp; enter the password to join.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;How to play this tournament?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;As soon as the fixtures Group are generated, please visit the fixtures tab under your joined tournament &amp;amp; look for your name &amp;amp; group.&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Join our PUBG Mobile Support discord channel for dedicated game support.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;The players have 15 minutes from the scheduled match start time to show-up and be ready in the lobby.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Failure to do so will result in a forfeit and the match shall progress.&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Any issues should be reported directly in the discord channel to the admin.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;We highly suggest that players check their connection for the match before joining the lobby.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Rematch will not take place for any disconnections whatsoever.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If a player&amp;rsquo;s connection to the server becomes unreasonable during a game (lag spikes), the Game must be played.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If any player disconnects during the match they forfeit the game unless they are able to reconnect back to the session.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;How do I get the custom Match Info?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Custom Match Name and password will be provided 15 mins prior to match start time via Email / SMS &amp;amp; will also be displayed on your update score page.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;','PC',5,'online','fee_free','','100',100,'05/08/2019 9:40 PM','upload/photos/2019/04/yqpiBg6zdwboRlkgLvkV_30_eeb76b1f5ed2c5cd44b6b4e706f7ce9c_image.jpg',1,'1556631154',1,2,'LIVE'),(2,'P U B G [Battle Grounds]','This is a Battle Grounds PUBG MOBILE GAME.','&lt;div class=&quot;jsx-4288270166 modal-body&quot;&gt;\r\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\r\n&lt;p&gt;&lt;strong&gt;Decisions taken by the GamingMonk Admin team will be final and binding and will not be reversed under any circumstances.&lt;/strong&gt;&lt;strong&gt;&lt;br /&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Violation of any of the rules mentioned below will be eligible for a DQ. The admin team will determine if a DQ will be levied or not.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;strong&gt;Game Rules:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Server : Custom Match Lobby ID and password will be provided 15 mins prior to match start time via Email, SMS &amp;amp; shall also be displayed on update score page.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Qualifier Format: Single Match Classic Erangel/Sanhok/Vikendi.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Emulator is Not allowed any player found using emulator will forfeit the tournament and will be banned from all future tournaments.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Top 10 players from every match of 100 Players will be awarded the prizes.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Format: Single Match Normal Custom Game.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Map :Erangel/Sanhok/Vikendi (SEA Solo TPP)&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;All players are expected to have read and accepted the rules&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Tournament admins has the last decision on any problem that may occur.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Teaming is Not allowed.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;Players will be banned if found teaming.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Final Scoring:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Points will be awarded as per below standings for each match:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;1st - 300&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;2nd - 225&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;3rd - 190&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;4th - 165&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;5th - 145&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;6th - 130&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;7th - 115&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;8th - 100&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;9th - 85&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;10th - 70&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;11th - 12th - 60&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;13th - 15th - 50&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;16th - 20th - 40&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;For every kill, a player will be awarded bonus 10 points.&lt;/span&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr class=&quot;jsx-4288270166&quot; /&gt;\r\n&lt;p class=&quot;jsx-4288270166 lead&quot;&gt;How to Play?&lt;/p&gt;\r\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\r\n&lt;p&gt;&lt;strong&gt;How to Join the custom Match lobby?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Hover below the &amp;ldquo;Start&amp;rdquo; button on the upper left corner of your screen (where game mode and server region is set).&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Then click on the bottom option that looks like a &amp;ldquo;Home&amp;rdquo; symbol. &lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;This will let you view a list of custom matches.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Search for the match lobby with given lobby ID &amp;amp; enter the password to join.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;How to play this tournament?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;As soon as the fixtures Group are generated, please visit the fixtures tab under your joined tournament &amp;amp; look for your name &amp;amp; group.&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Join our PUBG Mobile Support discord channel for dedicated game support.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;The players have 15 minutes from the scheduled match start time to show-up and be ready in the lobby.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Failure to do so will result in a forfeit and the match shall progress.&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Any issues should be reported directly in the discord channel to the admin.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;We highly suggest that players check their connection for the match before joining the lobby.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Rematch will not take place for any disconnections whatsoever.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If a player&amp;rsquo;s connection to the server becomes unreasonable during a game (lag spikes), the Game must be played.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If any player disconnects during the match they forfeit the game unless they are able to reconnect back to the session.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;How do I get the custom Match Info?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Custom Match Name and password will be provided 15 mins prior to match start time via Email / SMS &amp;amp; will also be displayed on your update score page.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;','OBILE,XBOX360,XBOXONE',2,'online','fee_free','','1200',150,'05/04/2019 3:30 PM','upload/photos/2019/04/2sxnZlidGxC5nLXe8k8A_30_16a20a61093fcdaa88eb2d2e39590d87_image.jpg',1,'1556633340',1,1,'LIVE'),(3,'P U B G  [Battle Grounds]','This is a P U B G  [Battle Grounds] *** TOP STAR','&lt;div class=&quot;jsx-4288270166 modal-body&quot;&gt;\r\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\r\n&lt;p&gt;&lt;strong&gt;Decisions taken by the GamingMonk Admin team will be final and binding and will not be reversed under any circumstances.&lt;/strong&gt;&lt;strong&gt;&lt;br /&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Violation of any of the rules mentioned below will be eligible for a DQ. The admin team will determine if a DQ will be levied or not.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;strong&gt;Game Rules:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Server : Custom Match Lobby ID and password will be provided 15 mins prior to match start time via Email, SMS &amp;amp; shall also be displayed on update score page.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Qualifier Format: Single Match Classic Erangel/Sanhok/Vikendi.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Emulator is Not allowed any player found using emulator will forfeit the tournament and will be banned from all future tournaments.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Top 10 players from every match of 100 Players will be awarded the prizes.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Format: Single Match Normal Custom Game.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Map :Erangel/Sanhok/Vikendi (SEA Solo TPP)&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;All players are expected to have read and accepted the rules&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Tournament admins has the last decision on any problem that may occur.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Teaming is Not allowed.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;Players will be banned if found teaming.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Final Scoring:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Points will be awarded as per below standings for each match:&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;1st - 300&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;2nd - 225&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;3rd - 190&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;4th - 165&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;5th - 145&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;6th - 130&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;7th - 115&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;8th - 100&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;9th - 85&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;10th - 70&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;11th - 12th - 60&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;13th - 15th - 50&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;16th - 20th - 40&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;For every kill, a player will be awarded bonus 10 points.&lt;/span&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;hr class=&quot;jsx-4288270166&quot; /&gt;\r\n&lt;p class=&quot;jsx-4288270166 lead&quot;&gt;How to Play?&lt;/p&gt;\r\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\r\n&lt;p&gt;&lt;strong&gt;How to Join the custom Match lobby?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Hover below the &amp;ldquo;Start&amp;rdquo; button on the upper left corner of your screen (where game mode and server region is set).&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Then click on the bottom option that looks like a &amp;ldquo;Home&amp;rdquo; symbol. &lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;This will let you view a list of custom matches.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Search for the match lobby with given lobby ID &amp;amp; enter the password to join.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;How to play this tournament?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;As soon as the fixtures Group are generated, please visit the fixtures tab under your joined tournament &amp;amp; look for your name &amp;amp; group.&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Join our PUBG Mobile Support discord channel for dedicated game support.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;The players have 15 minutes from the scheduled match start time to show-up and be ready in the lobby.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Failure to do so will result in a forfeit and the match shall progress.&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;ul&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Any issues should be reported directly in the discord channel to the admin.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;We highly suggest that players check their connection for the match before joining the lobby.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Rematch will not take place for any disconnections whatsoever.&lt;/strong&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If a player&amp;rsquo;s connection to the server becomes unreasonable during a game (lag spikes), the Game must be played.&lt;/span&gt;&lt;/li&gt;\r\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If any player disconnects during the match they forfeit the game unless they are able to reconnect back to the session.&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;strong&gt;How do I get the custom Match Info?&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Custom Match Name and password will be provided 15 mins prior to match start time via Email / SMS &amp;amp; will also be displayed on your update score page.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;','MOBILE,PUBG MOBILE',1,'online','fee_free','','2000',50,'05/02/2019 3:30 AM','upload/photos/2019/04/onJpzhrmfkSrucTGExVA_30_6f5cca8cdab61db7cce4a157eab3501f_image.jpg',1,'1556633678',1,0,'LIVE'),(4,'P U B G [Battle Grounds]  Super Top Star ****','This is a  P U B G Games.  <br> <br>Are you Okay?','&lt;div class=&quot;jsx-4288270166 modal-body&quot;&gt;\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\n&lt;p&gt;&lt;strong&gt;Decisions taken by the GamingMonk Admin team will be final and binding and will not be reversed under any circumstances.&lt;/strong&gt;&lt;strong&gt;&lt;br /&gt;&lt;br /&gt;&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;Violation of any of the rules mentioned below will be eligible for a DQ. The admin team will determine if a DQ will be levied or not.&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;&lt;br /&gt;&lt;/strong&gt;&lt;strong&gt;Game Rules:&lt;/strong&gt;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Server : Custom Match Lobby ID and password will be provided 15 mins prior to match start time via Email, SMS &amp;amp; shall also be displayed on update score page.&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Qualifier Format: Single Match Classic Erangel/Sanhok/Vikendi.&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Emulator is Not allowed any player found using emulator will forfeit the tournament and will be banned from all future tournaments.&lt;/strong&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Top 10 players from every match of 100 Players will be awarded the prizes.&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Format: Single Match Normal Custom Game.&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Map :Erangel/Sanhok/Vikendi (SEA Solo TPP)&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;All players are expected to have read and accepted the rules&lt;/strong&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Tournament admins has the last decision on any problem that may occur.&lt;/strong&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;ul&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Teaming is Not allowed.&lt;/strong&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/ul&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;&lt;strong&gt;Players will be banned if found teaming.&lt;/strong&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;Final Scoring:&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;Points will be awarded as per below standings for each match:&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;1st - 300&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;2nd - 225&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;3rd - 190&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;4th - 165&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;5th - 145&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;6th - 130&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;7th - 115&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;8th - 100&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;9th - 85&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;10th - 70&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;11th - 12th - 60&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;13th - 15th - 50&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;16th - 20th - 40&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;For every kill, a player will be awarded bonus 10 points.&lt;/span&gt;&lt;/p&gt;\n&lt;/div&gt;\n&lt;hr class=&quot;jsx-4288270166&quot; /&gt;\n&lt;p class=&quot;jsx-4288270166 lead&quot;&gt;How to Play?&lt;/p&gt;\n&lt;div class=&quot;jsx-4288270166&quot;&gt;\n&lt;p&gt;&lt;strong&gt;How to Join the custom Match lobby?&lt;/strong&gt;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Hover below the &amp;ldquo;Start&amp;rdquo; button on the upper left corner of your screen (where game mode and server region is set).&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Then click on the bottom option that looks like a &amp;ldquo;Home&amp;rdquo; symbol. &lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;This will let you view a list of custom matches.&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Search for the match lobby with given lobby ID &amp;amp; enter the password to join.&lt;/span&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;&lt;strong&gt;How to play this tournament?&lt;/strong&gt;&lt;/p&gt;\n&lt;ul&gt;\n&lt;li&gt;&lt;strong&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;As soon as the fixtures Group are generated, please visit the fixtures tab under your joined tournament &amp;amp; look for your name &amp;amp; group.&lt;/span&gt;&lt;/strong&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;Join our PUBG Mobile Support discord channel for dedicated game support.&lt;/span&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;The players have 15 minutes from the scheduled match start time to show-up and be ready in the lobby.&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li&gt;Failure to do so will result in a forfeit and the match shall progress.&amp;nbsp;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;ul&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Any issues should be reported directly in the discord channel to the admin.&lt;/strong&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;We highly suggest that players check their connection for the match before joining the lobby.&lt;/strong&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;strong&gt;Rematch will not take place for any disconnections whatsoever.&lt;/strong&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If a player&amp;rsquo;s connection to the server becomes unreasonable during a game (lag spikes), the Game must be played.&lt;/span&gt;&lt;/li&gt;\n&lt;li style=&quot;font-weight: 400;&quot;&gt;&lt;span style=&quot;font-weight: 400;&quot;&gt;If any player disconnects during the match they forfeit the game unless they are able to reconnect back to the session.&lt;/span&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p&gt;&lt;strong&gt;How do I get the custom Match Info?&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;Custom Match Name and password will be provided 15 mins prior to match start time via Email / SMS &amp;amp; will also be displayed on your update score page.&lt;/strong&gt;&lt;/p&gt;\n&lt;/div&gt;\n&lt;/div&gt;','MOBILE,PUBG EMULATOR,PUBG MOBILE,XBOX360,XBOXONE',2,'online','fee_paid','50','5000',500,'05/10/2019 3:30 AM','upload/photos/2019/05/qPH4Yj6GtFhLwpdrie7q_02_0645234b15113a5f0d9b51d8ec744fd6_image.jpg',1,'1556819107',1,3,'COMPLETED'),(5,'PUBG MOBLIE','This is a battle ground game.','&lt;h2 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;Pool &amp;amp; Point&lt;/strong&gt;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;1. 1000 INR &amp;amp; 2000 Point&lt;/strong&gt;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;2. 500 INR&amp;nbsp; &amp;amp; 1000 Point&lt;/strong&gt;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;3. 100 INR &amp;amp; 500 Point&lt;/strong&gt;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h2&gt;\n&lt;h2 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;The results of the match are sent to the management team in a screenshot.&lt;/strong&gt;&lt;/h2&gt;','MOBILE',2,'online','fee_paid','100','2000',10,'05/16/2019 3:30 PM','upload/photos/2019/05/6iprCo4O3lgYFLsE4I2N_15_6b94dfd740b712a469d825f658e71d75_image.jpg',1,'1557933941',1,0,'OPEN'),(6,'PUBG MOBLIE','This is a battleground game.','&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;Pool &amp;amp; Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;1. 1000 INR &amp;amp; 2000 Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;2. 500 INR&amp;nbsp; &amp;amp; 1000 Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;3. 100 INR &amp;amp; 500 Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;The results of the match are sent to the management team in a screenshot.&lt;/strong&gt;&lt;/h3&gt;','MOBILE',2,'online','fee_free','','1000',10,'05/30/2019 4:00 AM','upload/photos/2019/05/GMTEreTGv4aIaZDZ95vO_15_b1f87697d457ce1ae7b8d03ea51f3b79_image.jpg',1,'1557934260',1,0,'OPEN'),(7,'PUBG MOBLIE','This is a  battlegrounds super game.','&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;Pool &amp;amp; Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;1. 1000 INR &amp;amp; 2000 Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;2. 500 INR&amp;nbsp; &amp;amp; 1000 Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;3. 100 INR &amp;amp; 500 Point&lt;/strong&gt;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&amp;nbsp;&lt;/h3&gt;\n&lt;h3 style=&quot;text-align: left;&quot;&gt;&lt;strong&gt;The results of the match are sent to the management team in a screenshot.&lt;/strong&gt;&lt;/h3&gt;','MOBILE,PUBG MOBILE',2,'online','fee_paid','100','2000',10,'06/08/2019 5:00 PM','upload/photos/2019/05/VlAActxKUnsXNozkiUzH_15_4072f225d7208b333c757a5557232011_image.jpg',1,'1557962166',1,0,'OPEN');

/*Table structure for table `typings` */

DROP TABLE IF EXISTS `typings`;

CREATE TABLE `typings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `user_one` (`user_one`),
  KEY `user_two` (`user_two`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `typings` */

/*Table structure for table `user_ads` */

DROP TABLE IF EXISTS `user_ads`;

CREATE TABLE `user_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  `results` int(11) NOT NULL DEFAULT '0',
  `spent` varchar(20) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `audience` text,
  `category` varchar(50) NOT NULL DEFAULT '',
  `media` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(3000) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(50) NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `headline` varchar(1000) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `location` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `location` (`location`(255)),
  KEY `placement` (`placement`),
  KEY `user_id` (`user_id`),
  KEY `category` (`category`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user_ads` */

insert  into `user_ads`(`id`,`name`,`results`,`spent`,`status`,`audience`,`category`,`media`,`url`,`user_id`,`placement`,`posted`,`headline`,`description`,`location`,`type`) values (1,'TorMix',11,'3.5',1,'0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,238,239,240,241,242','video','upload/videos/2019/03/JtOUnQX3ehJq3yY7ZuYI_20_b1e7fceb0db252c088a36990508d17f0_video.mp4','https%3A%2F%2Ftormix.net',1,'1','1553043089','First Kurdish Social netwrk','TorMix First and biggest Kurdish Social network','','1'),(2,'TorMix',6,'3',1,'0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,238,239,240,241,242','image','upload/photos/2019/03/x72FYg4EeqL6ljA4Iibg_20_805eb231ccbae7a59def9db7838b46c2_image.jpg','https%3A%2F%2Ftormix.net',1,'2','1553043275','Join TorMix Now !','TorMix First and biggest Kurdish Social Network !','','1');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ip_address` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'male',
  `email_code` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `phone_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `device_id` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `language` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT 'english',
  `avatar` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-avatar.jpg',
  `cover` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `src` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `about` text COLLATE utf8_unicode_ci,
  `google` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '0',
  `verified` int(11) NOT NULL DEFAULT '0',
  `last_active` int(11) NOT NULL DEFAULT '0',
  `registered` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `is_pro` int(11) NOT NULL DEFAULT '0',
  `imports` int(11) NOT NULL DEFAULT '0',
  `uploads` int(11) NOT NULL DEFAULT '0',
  `wallet` double(15,2) NOT NULL DEFAULT '0.00',
  `balance` double(15,2) NOT NULL DEFAULT '0.00',
  `video_mon` int(10) NOT NULL DEFAULT '0',
  `age_changed` int(11) NOT NULL DEFAULT '0',
  `donation_paypal_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_upload_limit` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `two_factor` int(11) NOT NULL DEFAULT '0',
  `last_month` text CHARACTER SET utf8,
  `active_time` int(50) NOT NULL DEFAULT '0',
  `active_expire` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `phonenumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ranking` int(10) DEFAULT '0',
  `point` double(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `password` (`password`),
  KEY `last_active` (`last_active`),
  KEY `admin` (`admin`),
  KEY `active` (`active`),
  KEY `registered` (`registered`),
  KEY `is_pro` (`is_pro`),
  KEY `wallet` (`wallet`),
  KEY `balance` (`balance`),
  KEY `video_mon` (`video_mon`),
  KEY `active_time` (`active_time`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`ip_address`,`password`,`first_name`,`last_name`,`gender`,`email_code`,`phone_code`,`device_id`,`language`,`avatar`,`cover`,`src`,`country_id`,`age`,`about`,`google`,`facebook`,`twitter`,`instagram`,`active`,`admin`,`verified`,`last_active`,`registered`,`is_pro`,`imports`,`uploads`,`wallet`,`balance`,`video_mon`,`age_changed`,`donation_paypal_email`,`user_upload_limit`,`two_factor`,`last_month`,`active_time`,`active_expire`,`phonenumber`,`ranking`,`point`) values (1,'RuyunL','webexpert12345@gmail.com','::1','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','ruyun','Li.','male','','','91cbd324-f2d1-4c08-b5d1-811caeca618d','english','upload/photos/2019/04/XkhnQO828g5vJYKm6Ieo_23_04b1f6c420c6065c7cfe5e51fb908d14_image.png','upload/photos/2019/04/yklAToVha7Xw9FBAHaMm_23_04b1f6c420c6065c7cfe5e51fb908d14_image.jpg','',45,22,'Web Designer&amp; Web Developer&amp; Programmer       <br>CEO &amp; Founder &amp; Owner MixPlay      <br>CEO &amp; Founder &amp; Owner TorMix Net       <br>CTO at Scientific Level Company       <br>CTO at Collins International Institute-Erbil       <br>Former CEO at Shalaw IT       <br>Former Owner at It Center Soran       <br>Former Accountant &amp; Cashier at Golden Market       <br>i ❤ my Computer       <br>Unforgettable date','Shalawkoy','','Shalawkoy','Shalawkoy',1,1,1,1558214115,'00/0000',1,6,93260238,0.00,4557.60,1,0,'farmansmaquly@gmail.com','unlimited',0,'{\"likes\":0,\"dislikes\":0,\"views\":13,\"comments\":2,\"update_time\":1559347140}',11628,'1555718340','+918472784167',2,100.00),(2,'FarmanSmaquly','farmansmaquly@gmail.com','130.193.234.91','29e74ef759368a2af01cd3832757d19f49b4b8c7','farman','smaquly','male','126bb0af03f309ea94eb1b69c434bfa0ab1f70c9','','fc156151-c8f5-4356-8507-986c4918a75b','kurdish','','','',102,0,'','https://plus.google.com/u/0/+FarmanSmaquly','https://www.facebook.com/FarmanSmaquly','https://twitter.com/Farman_Smaquly','https://www.instagram.com/farmansmaquly/',1,0,1,1555054563,'2019/2',1,0,24280095,0.00,450.00,0,0,'','1000000000',0,NULL,1698,'1555113540','',17,NULL),(3,'Barzy','barzy@gmail.com','130.193.255.168','1f4a04e5543d8760660bb080226040b987b88d47','','','male','8050539676d5edf557fda01de4588170d8d69699','','','kurdish','','','',0,0,NULL,'','','','',1,0,0,1550843125,'2019/2',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',2,100.00),(4,'SK_Music','redwan@gmail.com','::1','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','SK','Music','male','bf585581203bce9c9bb8cf633588cf3483169b72','','','kurdish','upload/photos/2019/04/oCksEfQzvGUaJgeCweSh_26_bc7b6bf1067a1d79019edb0a79649c90_image.jpg','upload/photos/2019/04/bf8naUVz9Kjx195opoXH_26_0e5ee886b31e88e4e4e6350cf872deba_image.jpg','',0,25,'SK MUSIC First MixPlay Channel','','','','',1,0,0,1556245323,'2019/2',1,16,0,0.00,0.00,0,0,'skmusic@gmail.com','unlimited',0,NULL,0,'0','',16,NULL),(5,'ehsan_tech','ehsan@tormix.net','159.255.162.2','0203684055051bec20938455c2915f2ba7d9a746','Ehsan','IT','male','c659b1f1c8c2b1f8f8fe7edcbec3a3be','','309c6dae-5426-40c9-bc0c-63b8fb1594e4','persian','','','',102,17,'I´M Moderator at tormix.net &amp;amp; Admin at department Badini &amp;amp; Persian &amp;amp; Admin at socials media TorMix &amp;amp; I´M Writer At Organization TechEye, &lt;br&gt; TorMix The best and largest social network on kurdistan &amp;amp; iraq','','http://www.facebook.com/ehsan01IT/','http://www.twitter.com/IT_Frame1/','http://www.instagram.com/ehsan_tech1/',1,1,1,1554757127,'2019/2',1,17,631400982,0.00,0.00,0,0,'','unlimited',0,NULL,294,'1555113540','+9647504103583',15,NULL),(13,'Aroo_music','hallogiyan098@gmail.com','159.255.162.2','3566647d7b18c5545e2a749345cdfbce8730e4bb','','','male','a04ae2e4823486bc65d0f85bf05bddecbbeeab92','','','kurdish','upload/photos/2019/03/zZASyjiJUaEJdBEpvGyb_05_cfdac1922b66128869d1ca5a8d9a586e_image.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,0,1554057445,'2019/3',0,0,1219223,0.00,0.00,0,0,'','0',0,NULL,312,'1554508740','',14,NULL),(18,'gashbin','gashbinmhamad740@gmail.com','','4555f6cbe7c0275206b51d0619f66fb395ee33f8','','','male','e1951a0b5e271b6f5fafb8e75828669673d76be6','','1fd2362d-0b3a-4e83-b744-6c2fe52bcc8a','english','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,0,1552770151,'2019/3',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',13,NULL),(20,'Testtest','test@gmail.com','212.237.121.156','231dddf79145625efaaacfa102e08bd09c5aede8','','','male','268749e6bc61d7c1395a22344ef1072a162e6403','','','kurdish','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,0,1553198106,'2019/3',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',12,NULL),(21,'TorMix','tormixnet@gmail.com','::1','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','tor','mix','male','5caa75b55c06e4ea69aced1555cda448d95c6293','','','english','upload/photos/2019/04/7gWtJkaSXmw63TdknMtz_23_ad44519c6a0711919d6577d82dd8fd69_image.jpg','upload/photos/2019/04/ikIqeCTwRSgFQkvfrdGZ_23_ba3de4f4c11977e4e031806c131045e1_image.png','',102,23,'I don&#039;t know?','453','4536','tormixnet','tormixnet',1,0,0,1558271179,'2019/3',1,1,7874944,3450.00,4900.00,0,0,'admin@123.com','unlimited',0,'{\"likes\":0,\"dislikes\":0,\"views\":5,\"comments\":0,\"update_time\":1559347140}',8916,'1555718340','+917895908266',1,4090.00),(22,'Hawkarkhoshnaw','hawkarxoshnaw341@gmail.com','185.106.29.218','4b3fc819f6a8f7752bfc22a010707cc2ce66a01f','','','male','24a90613c750b5244819c53f5951d502d8912f45','','','kurdish','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,1,1553342612,'2019/3',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',11,NULL),(23,'test','tes1t@gmail.com','212.237.120.229','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3','','','male','711434c6d7fc17d7d6548ff61e1e2c3fe4ec3366','','5c472edc-4560-4d5e-b547-d814fe1d2b1c','english','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,1,1555276796,'2019/3',1,0,8354599,0.00,0.00,0,0,'dasdffwf@gmail.com','0',0,NULL,6,'1555718340','',10,NULL),(24,'Rashed','Rashedbakr211@gmail.com','','7f6c9c17c42ba35d0536596b15c8e11603363514','','','male','6bbe9b86d9a3c09a1613f09689492296786b74c3','','8bc07b2b-4959-4fb5-9625-b6b7dbff3903','english','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,0,1553599807,'2019/3',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',4,NULL),(25,'ffstar','admin@123.com','192.168.200.28','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','','','male','08dc22960ca2f3502aa095a1fd889caf57a69717','','','english','upload/photos/2019/04/hcpgQpAX6Gxnmg7gUdwN_20_6603b074feac46de175585919ceae0e7_image.jpg','upload/photos/2019/04/eyasj5fOIgKMLqxdZg8S_20_6603b074feac46de175585919ceae0e7_image.jpg','',0,0,NULL,'','','','',1,0,0,1556069458,'2019/4',0,0,0,0.00,100.00,0,0,'','0',0,'{\"likes\":0,\"dislikes\":0,\"views\":0,\"comments\":0,\"update_time\":1556668740}',0,'0','',5,NULL),(26,'stormstar','stormstar@123.com','::1','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','','','male','aba388b12dc2a6b7bbd7e39f52f02512b31ed220','','','english','','','',0,0,NULL,'','','','',0,0,0,1555640854,'2019/4',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',6,NULL),(27,'76589','admin1111@123.com','::1','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','','','male','2372a2ad3715db5faaf219fcf2f9a2478595a655','','','english','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',0,0,0,1555642167,'2019/4',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',7,NULL),(28,'Haoxiong','haoxiong0123@gmail.com','::1','461f8f1acfdf1b9e3f9b4a6cfc6e8bb8e1d8a626','David','Zhang','female','8b8b5b1a65c4c57303e9b031142854696be268be','','','english','upload/photos/2019/04/iuSq4UQS1gMJEGnPKWUG_23_8c020645949d51812c532bb0b6dfdf30_image.jpg','upload/photos/2019/04/9Bb69a8HkAGwXxEzor2s_23_2de302887aa506fdda6c7d0b68a69a2a_image.jpg','Google',1,25,'','','','','',1,0,0,1556506555,'0000/00',0,0,0,0.00,0.00,0,1,'','0',0,'{\"likes\":0,\"dislikes\":0,\"views\":0,\"comments\":0,\"update_time\":1556668740}',0,'0','',8,NULL),(29,'fstar','fstar@admin.com','::1','7c4a8d09ca3762af61e59520943dc26494f8941b','','','male','7b605aaee7b84a90b1dfb0ed9292a1306ccccbe4','','','english','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',1,0,0,1557423122,'2019/5',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',9,NULL),(30,'','','','','','','male','','','','english','upload/photos/d-avatar.jpg','upload/photos/d-cover.jpg','',0,0,NULL,'','','','',0,0,0,0,'0000/00',0,0,0,0.00,0.00,0,0,'','0',0,NULL,0,'0','',18,NULL);

/*Table structure for table `usr_prof_fields` */

DROP TABLE IF EXISTS `usr_prof_fields`;

CREATE TABLE `usr_prof_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `fid_2` varchar(32) NOT NULL DEFAULT '',
  `fid_3` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usr_prof_fields` */

/*Table structure for table `verification_requests` */

DROP TABLE IF EXISTS `verification_requests`;

CREATE TABLE `verification_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `message` text,
  `media_file` text,
  `time` varchar(100) NOT NULL DEFAULT '0',
  `type` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `verification_requests` */

/*Table structure for table `video_ads` */

DROP TABLE IF EXISTS `video_ads`;

CREATE TABLE `video_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_link` varchar(400) NOT NULL DEFAULT '',
  `name` varchar(300) NOT NULL DEFAULT '',
  `ad_media` varchar(400) NOT NULL DEFAULT '',
  `ad_image` varchar(400) NOT NULL DEFAULT '',
  `skip_seconds` int(11) NOT NULL DEFAULT '0',
  `vast_type` varchar(30) NOT NULL DEFAULT '',
  `vast_xml_link` varchar(700) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `video_ads` */

/*Table structure for table `videos` */

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `short_id` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `thumbnail` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/thumbnail.jpg',
  `video_location` varchar(3000) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `youtube` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `vimeo` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `daily` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(100) NOT NULL DEFAULT '',
  `twitch` varchar(100) NOT NULL DEFAULT '',
  `twitch_type` varchar(50) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '0',
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `duration` varchar(33) CHARACTER SET latin1 NOT NULL DEFAULT '00:00',
  `size` int(50) NOT NULL DEFAULT '0',
  `converted` int(5) NOT NULL DEFAULT '1',
  `category_id` varchar(100) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `registered` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `privacy` int(11) NOT NULL DEFAULT '0',
  `age_restriction` int(11) NOT NULL DEFAULT '1',
  `type` varchar(100) NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL DEFAULT '1',
  `240p` int(11) NOT NULL DEFAULT '0',
  `360p` int(11) NOT NULL DEFAULT '0',
  `480p` int(11) NOT NULL DEFAULT '0',
  `720p` int(11) NOT NULL DEFAULT '0',
  `1080p` int(11) NOT NULL DEFAULT '0',
  `2048p` int(11) NOT NULL DEFAULT '0',
  `4096p` int(11) NOT NULL DEFAULT '0',
  `sell_video` varchar(11) NOT NULL DEFAULT '0',
  `sub_category` varchar(100) NOT NULL DEFAULT '',
  `geo_blocking` varchar(200) NOT NULL DEFAULT '',
  `demo` varchar(3000) NOT NULL DEFAULT '',
  `is_movie` int(11) NOT NULL DEFAULT '0',
  `stars` varchar(200) NOT NULL DEFAULT '',
  `producer` varchar(200) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `movie_release` varchar(4) NOT NULL DEFAULT '',
  `quality` varchar(11) NOT NULL DEFAULT '',
  `rating` varchar(11) NOT NULL DEFAULT '',
  `rent_price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_id_2` (`video_id`),
  KEY `youtube_id` (`youtube`),
  KEY `vimeo` (`vimeo`),
  KEY `daily` (`daily`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `featured` (`featured`),
  KEY `registered` (`registered`),
  KEY `views` (`views`),
  KEY `time` (`time`),
  KEY `order1` (`category_id`,`id`),
  KEY `order2` (`id`,`views`),
  KEY `240p` (`240p`),
  KEY `360p` (`360p`),
  KEY `480p` (`480p`),
  KEY `720p` (`720p`),
  KEY `1080p` (`1080p`),
  KEY `4096p` (`4096p`),
  KEY `2048` (`2048p`),
  KEY `privacy` (`privacy`),
  KEY `short_id` (`short_id`),
  KEY `age_restriction` (`age_restriction`),
  KEY `approved` (`approved`),
  KEY `twitch` (`twitch`),
  KEY `sub_category` (`sub_category`),
  KEY `geo_blocking` (`geo_blocking`),
  KEY `sell_video` (`sell_video`),
  KEY `is_movie` (`is_movie`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `tags` (`tags`)
) ENGINE=MyISAM AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `videos` */

insert  into `videos`(`id`,`video_id`,`user_id`,`short_id`,`title`,`description`,`thumbnail`,`video_location`,`youtube`,`vimeo`,`daily`,`facebook`,`twitch`,`twitch_type`,`time`,`time_date`,`active`,`tags`,`duration`,`size`,`converted`,`category_id`,`views`,`featured`,`registered`,`privacy`,`age_restriction`,`type`,`approved`,`240p`,`360p`,`480p`,`720p`,`1080p`,`2048p`,`4096p`,`sell_video`,`sub_category`,`geo_blocking`,`demo`,`is_movie`,`stars`,`producer`,`country`,`movie_release`,`quality`,`rating`,`rent_price`) values (3,'sLVv2azPWhRrJb2',1,'tJtorR','Sniper','That&#039;s good!!','upload/photos/2019/04/R9NRX5xJydR5VzYz5ym8_23_2607236584057e3d028d88a52d8ca19b_image.jpg','upload/videos/2019/04/D64KbLAiOhZ3UHsfXSPJ_19_8a72318e091bfd70ae874ae0bdc3ab8f_video.mov','','','','','','',1555674793,'2019-04-19 21:53:13',0,'gamer2','0:11',1124992,1,'7',4,1,'2019/4',0,1,'',1,0,0,0,0,0,0,0,'0','0','[]','1',0,'','','','','','',0),(2,'hEflLpYRPTkVNiW',3,'u1ifyr','Race','Good!!','upload/photos/2019/04/XWkmSj5h5GuxPzKRcfLg_23_ed5e148de70671448f8f3fbcf678759e_image.jpg','upload/videos/2019/04/7FIG9xOGSAO3W9z5Nlk4_19_2876696be05258f2767c3ddcf047bc38_video.mov','','','','','','',1555674850,'2019-04-19 21:54:10',0,'gamer3','0:11',1124992,1,'7',4,1,'2019/4',0,1,'',1,0,0,0,0,0,0,0,'5','0','','1',0,'','','','','','',0),(10004,'E1GsbfLi3j7SCIH',1,'Eq8D3w','MyPlayer','ok','upload/photos/2019/04/fLe7ACSBZFfIZuZszd9g_23_f3b30c58946b6a05841f75920febb75d_image.jpg','upload/videos/2019/04/3SEBHlAG5bZhRLpwxZZd_19_a67d63ecee41c00b38bb8e051bbef921_video.mov','','','','','','',1555691537,'2019-04-20 02:32:17',0,'mygame','4:34',26861620,1,'9',2,1,'2019/4',0,1,'',1,0,0,0,0,0,0,0,'7','0','','',0,'','','','','','',0),(10005,'GpbHFDEeyqABwzG',21,'eGqQUO','Super Play','OK Good','upload/photos/2019/04/gfIVfmg42a2OzlgENTkb_23_2908c3fb8ef326a658480710e2f14a4d_image.jpg','upload/videos/2019/04/vIJS2HK4B94jn5E6ltKg_21_e03a047b04ed647ec737059a72499cc5_video.mov','','','','','','',1555857339,'2019-04-22 00:35:39',0,'ok','0:11',1124992,1,'5',2,1,'2019/4',1,1,'',1,0,0,0,0,0,0,0,'0','0','[]','',0,'','','','','','',0),(4,'IEW3m4V1tzKKCbc',1,'EJzdUW','BattleGrounds','This is BattleGroundsGame....','upload/photos/2019/04/fksh6rouPzOxRmCku93n_23_ab66cc0b05d218e9df57999329452ef4_image.jpg','upload/videos/2019/04/jiRkYrfsGoxuC3MC2LkT_19_a9eb81034c7ec80b8ffafef11ceef3a1_video.mov','','','','','','',1555685631,'2019-04-20 00:53:51',0,'gameing','0:11',1124992,1,'7',5,1,'2019/4',0,1,'',1,0,0,0,0,0,0,0,'0','0','[]','1',0,'','','','','','',0),(5,'Qr6z1pXiqrT1T86',21,'LgSlAk','NewGamer','THis is a gamer','upload/photos/2019/04/GKtHYqkkYpzdBdMszsfb_23_3377b44177559359c7b9b19a57b40579_image.jpg','http%3A%2F%2Flocalhost%2F1.mov','','','','','','',1555686609,'2019-04-20 01:10:09',0,'newgamer','00:00',0,1,'7',3,1,'2019/4',0,1,'4',1,0,0,0,0,0,0,0,'0','0','[]','1',0,'','','','','','',0),(1,'TBJ4GQQFyMMNsje',21,'RAHdYe','Super','That&#039;s very good!!!','upload/photos/2019/04/SzlCHzYnf4mXmk9E2GRl_23_9c650a08b56386fe4c267cfeb6830848_image.jpeg','upload/videos/2019/04/9uXJHaeo6RrStbTjFlDV_19_c6057af4f41f1a320594328c2fd138cd_video.mov','','','','','','',1555672903,'2019-04-19 21:21:43',0,'gamer1','0:11',1124992,1,'7',3,1,'2019/4',0,1,'',1,0,0,0,0,0,0,0,'0','0','[]','1',0,'','','','','','',0),(10006,'31QMpa1LpBILk9X',1,'kMKxfK','Popular Video','This is a game popular video....','upload/photos/2019/04/wcFUhgYMpvSPYNW8A7ND_25_256d6e2293f11aa7e2dad671972a57f3_image.jpg','upload/videos/2019/04/TwUwSIpT1HiMl7FKbnB2_25_414f07e2cb4d4ce5264f1a5ef81828b9_video.mov','','','','','','',1556186260,'2019-04-25 19:57:40',0,'populargame','0:11',1124992,1,'7',2,1,'2019/4',0,1,'',1,0,0,0,0,0,0,0,'4','0','','',0,'','','','','','',0),(10008,'sN5UPOurUoNZcUp',1,'FtgEGU','Cartoon','This is a cartoon.','upload/photos/2019/05/obZKLFBIjC7W8hxTNhLW_11_6fa6f75e8a9733795371f9384e3c384f_image.jpg','upload/videos/2019/05/QtfLhrBSgK1xn8wb6JRf_11_e70f176daf90ec48f7c78245f8a030ac_video.mp4','','','','','','',1557542629,'2019-05-11 12:43:49',0,'cartton','0:10',788493,1,'1',2,1,'2019/5',0,1,'',1,0,0,0,0,0,0,0,'0','0','','',0,'','','','','','',0),(10009,'ejB58N5sKJOJ4Im',1,'SQTJuc','Super Robot','This is a description about super robot.','upload/photos/2019/05/9KXOiF6oJe2TV5JaxN2i_11_0bba20240501b347ec8aaecb27b45b64_image.png','upload/videos/2019/05/JBUKQnaaKvqUdRjZTllB_11_42c4c4234c7f18a1c37c4224921c3773_video.mp4','','','','','','',1557542774,'2019-05-11 12:46:14',0,'robot','1:04',21904374,1,'1',2,1,'2019/5',0,1,'',1,0,0,0,0,0,0,0,'0','0','','',0,'','','','','','',0),(10010,'LojyRSAniTZHN4j',1,'JR8Ygh','Motion Detection','This is a motion detection','upload/photos/2019/05/3qzAqPAQjZS3dKC62KBs_11_c6a8483cabd71d4dfcb35443999fd550_image.jpg','upload/videos/2019/05/xYCbU9aFKNID5Cg6QWSw_11_1c0fd20d1221f270ba171e9ac55faa02_video.mp4','','','','','','',1557542877,'2019-05-11 12:47:57',0,'detection','4:12',24932783,1,'1',2,1,'2019/5',0,1,'',1,0,0,0,0,0,0,0,'0','0','','',0,'','','','','','',0);

/*Table structure for table `videos_transactions` */

DROP TABLE IF EXISTS `videos_transactions`;

CREATE TABLE `videos_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `paid_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `amount` varchar(11) NOT NULL DEFAULT '0',
  `admin_com` varchar(11) NOT NULL DEFAULT '0',
  `currency` varchar(11) NOT NULL DEFAULT 'USD',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `videos_transactions` */

insert  into `videos_transactions`(`id`,`user_id`,`paid_id`,`video_id`,`amount`,`admin_com`,`currency`,`time`,`type`) values (4,1,21,10006,'4','5','USD_PERCENT','1557418915','');

/*Table structure for table `views` */

DROP TABLE IF EXISTS `views`;

CREATE TABLE `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL DEFAULT '0',
  `fingerprint` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `user_id` (`user_id`),
  KEY `fingerprint` (`fingerprint`(255)),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8;

/*Data for the table `views` */

insert  into `views`(`id`,`video_id`,`fingerprint`,`user_id`,`time`) values (1,93,'24e4481c17d9a6665088b77e79849762836e7ab7',1,'1550702508'),(2,99,'24e4481c17d9a6665088b77e79849762836e7ab7',1,'1550702661'),(3,96,'24e4481c17d9a6665088b77e79849762836e7ab7',1,'1550702677'),(4,99,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',0,'1550729172'),(5,99,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',3,'1550759643'),(6,98,'24e4481c17d9a6665088b77e79849762836e7ab7',0,'1550793841'),(7,100,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798238'),(8,101,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798266'),(9,102,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798287'),(10,103,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798313'),(11,104,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798327'),(12,105,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798344'),(13,106,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798369'),(14,107,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798400'),(15,108,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798420'),(16,109,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798435'),(17,110,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798540'),(18,111,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798604'),(19,112,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798622'),(20,113,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798641'),(21,114,'24e4481c17d9a6665088b77e79849762836e7ab7',4,'1550798660'),(22,614,'24e4481c17d9a6665088b77e79849762836e7ab7',1,'1550800490'),(23,587,'24e4481c17d9a6665088b77e79849762836e7ab7',1,'1550800742'),(24,828,'24e4481c17d9a6665088b77e79849762836e7ab7',1,'1550801795'),(25,614,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',3,'1550803526'),(26,614,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',0,'1550838556'),(27,1988,'adeeac62664deaa4cec52e73dab6d65706569d5c',5,'1550849573'),(28,614,'adeeac62664deaa4cec52e73dab6d65706569d5c',5,'1550850586'),(29,1989,'adeeac62664deaa4cec52e73dab6d65706569d5c',5,'1550851413'),(30,1990,'adeeac62664deaa4cec52e73dab6d65706569d5c',5,'1550852168'),(31,1990,'f02564f54701b553efa65adb3c3b235ee6c4614a',0,'1550857740'),(32,611,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1550869377'),(33,1991,'281d0aa181ac6635546de7aac071a2ac9537ee98',5,'1550921981'),(34,1992,'281d0aa181ac6635546de7aac071a2ac9537ee98',5,'1550922514'),(35,1992,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1550953278'),(36,1993,'ca384ba3e7bae44915c18fd26fbc2f713735477e',5,'1551010349'),(37,1994,'281d0aa181ac6635546de7aac071a2ac9537ee98',5,'1551015726'),(38,599,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551040532'),(39,1994,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1551081084'),(40,1995,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1551081653'),(41,2089,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551085908'),(42,2030,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551087525'),(43,2090,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551127012'),(44,2091,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551127166'),(45,2030,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1551130976'),(46,2092,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1551135441'),(47,2093,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1551135692'),(48,1998,'6413fe7dcb3fd0ebf8f468d126a101f4e484ca46',1,'1551135811'),(49,614,'238dfec1abca9944fd507f253fd2e9c41672adf6',0,'1551175255'),(50,613,'238dfec1abca9944fd507f253fd2e9c41672adf6',0,'1551175261'),(51,610,'238dfec1abca9944fd507f253fd2e9c41672adf6',0,'1551175265'),(52,602,'238dfec1abca9944fd507f253fd2e9c41672adf6',0,'1551175275'),(53,1990,'238dfec1abca9944fd507f253fd2e9c41672adf6',0,'1551175427'),(54,1994,'1ee8bfbca0b230c9f6eafedf88741cb2ecf4a8cc',0,'1551181309'),(55,2093,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551187339'),(56,2094,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551188030'),(57,2095,'d6714f08fd9daf31c6b2730438e0f3dd8d21986c',5,'1551189614'),(58,2088,'a5a87939c47f95a8003d48075e4f1c64958323ca',6,'1551192459'),(59,2005,'1d9254110e6218a7b3eb3e0e93839bd5f191f1ba',5,'1551210697'),(60,2094,'a5a87939c47f95a8003d48075e4f1c64958323ca',9,'1551224234'),(61,2094,'715a5f34f01bd872af475af59b41f5c1959400ac',0,'1551262995'),(62,2087,'bb7c6f515a212b6107f0a571075f41105aab9169',0,'1551371371'),(63,2087,'b6f65597b0ed474aef2b03b2a777957fd2bc99db',0,'1551371388'),(64,2055,'b6f65597b0ed474aef2b03b2a777957fd2bc99db',0,'1551371402'),(65,2083,'57d47a6245a5278f4514ece53063a5c50957362a',0,'1551382048'),(66,2086,'57d47a6245a5278f4514ece53063a5c50957362a',0,'1551382101'),(67,609,'f0c732e6de0ee05d1685a2e32349530b47f47eea',0,'1551391099'),(68,2095,'f18ff3e1fcfb22b9a601a70c75aa0141a4fe9814',2,'1551458064'),(69,2094,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469499'),(70,1994,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469554'),(71,1993,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469577'),(72,1990,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469633'),(73,1989,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469652'),(74,613,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469693'),(75,612,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469705'),(76,610,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469714'),(77,611,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469720'),(78,609,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469732'),(79,1992,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469793'),(80,2030,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469808'),(81,2084,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469866'),(82,2085,'13c48d8dd20bfff5c13c3fd86c3041d829e4ee74',0,'1551469889'),(83,1990,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551482336'),(84,2096,'83f6e1326ac701852dbc7e9adb4c7b19097572ff',5,'1551538879'),(85,2086,'1ed19a48449557781aef4fcd1c03a44c789c3940',0,'1551563106'),(86,2096,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',1,'1551612575'),(87,603,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',1,'1551612584'),(88,2096,'f577cc452a575cb5b02575fa001546d1ee8469dd',0,'1551669353'),(89,609,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721175'),(90,614,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721181'),(91,608,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721214'),(92,612,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721278'),(93,606,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721340'),(94,600,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721410'),(95,599,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721487'),(96,596,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721520'),(97,588,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721576'),(98,589,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721656'),(99,601,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721703'),(100,603,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551721925'),(101,2096,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551722015'),(102,568,'c33c0724d396f0f7c2f6b4a43a0918a08f614ffb',0,'1551722041'),(103,2097,'45c41a5515d0c38650b32c382350645dc24a2081',11,'1551772460'),(104,2087,'45c41a5515d0c38650b32c382350645dc24a2081',11,'1551773188'),(105,2086,'45c41a5515d0c38650b32c382350645dc24a2081',11,'1551773204'),(106,1994,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551775919'),(107,2079,'b90626efae0f46922e2f78371079b0585599da10',11,'1551784326'),(108,2080,'b90626efae0f46922e2f78371079b0585599da10',11,'1551784331'),(109,2096,'1a520e7e2b360c46757e5cf60a6c892edd3a780a',0,'1551796639'),(110,2089,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551808786'),(111,2087,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551821853'),(112,2086,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551823576'),(113,2085,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551824696'),(114,1992,'9864e63e17de1079f759e54e1e6024d0c3155da4',0,'1551832084'),(115,2094,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1551869561'),(116,2096,'67a8406fb100ae185f5c38d2db99d4a27a925c30',0,'1551880980'),(117,2097,'1d9254110e6218a7b3eb3e0e93839bd5f191f1ba',5,'1551899943'),(118,2094,'3204483b36dff0c4cb564f123a46400c28f31965',0,'1551907099'),(119,2074,'3204483b36dff0c4cb564f123a46400c28f31965',0,'1551907156'),(120,614,'efe017917369bb03394e13ac36c39a248aeed7d8',0,'1552051655'),(121,612,'efe017917369bb03394e13ac36c39a248aeed7d8',0,'1552051678'),(122,1990,'a99e4c0b37670492cd8307add083e161f2efb874',0,'1552072090'),(123,2096,'a99e4c0b37670492cd8307add083e161f2efb874',0,'1552076790'),(124,609,'a99e4c0b37670492cd8307add083e161f2efb874',0,'1552077767'),(125,614,'371bf1211339dca660dc9c256ea2ef4b9e18cede',0,'1552080289'),(126,614,'372d7a902a14e5efc8005019710ff61cacfd8088',0,'1552080306'),(127,599,'a99e4c0b37670492cd8307add083e161f2efb874',0,'1552081744'),(128,1997,'f741ce8d1e6a2968b92b204b46ac9f2aff22ba67',14,'1552139411'),(129,614,'edff4894ff922eb212477c1b3494c428d825f86d',0,'1552157138'),(130,610,'edff4894ff922eb212477c1b3494c428d825f86d',0,'1552157172'),(131,605,'edff4894ff922eb212477c1b3494c428d825f86d',0,'1552157218'),(132,604,'edff4894ff922eb212477c1b3494c428d825f86d',0,'1552157242'),(133,609,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552161702'),(134,2098,'52539094369606f56dfada72a40b4ac891adc45e',1,'1552167734'),(135,2060,'52539094369606f56dfada72a40b4ac891adc45e',15,'1552167946'),(136,582,'a99e4c0b37670492cd8307add083e161f2efb874',0,'1552190819'),(137,2098,'a0be6caa42e218dcc2f21cbd56e9a59f4d94145a',5,'1552215747'),(138,609,'ef9b38b06037fac91aa219a71d3b6c14804463a3',0,'1552225266'),(139,2096,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552226172'),(140,2088,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552227459'),(141,2044,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552228544'),(142,594,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552233654'),(143,2069,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552240463'),(144,574,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552243304'),(145,2057,'9864e63e17de1079f759e54e1e6024d0c3155da4',0,'1552243887'),(146,2058,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552247849'),(147,2064,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552249557'),(148,607,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552254097'),(149,2076,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552258073'),(150,578,'eb16a5e7e784c69492bea816641b8de40feeb42b',0,'1552259783'),(151,2049,'29391b81ea55d78a71c1c90984ef4cc3645a4c6e',0,'1552268064'),(152,610,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552268878'),(153,2040,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552276834'),(154,600,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552277956'),(155,1989,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552280799'),(156,2082,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552281380'),(157,2000,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552284776'),(158,2023,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552286979'),(159,2072,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552287609'),(160,2025,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552290449'),(161,609,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552295395'),(162,2049,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552330959'),(163,575,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552392304'),(164,1997,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552396293'),(165,602,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552399689'),(166,2097,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552400822'),(167,580,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552420134'),(168,613,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552425244'),(169,2022,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552429794'),(170,595,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552431491'),(171,601,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552433208'),(172,2079,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552440255'),(173,589,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552483192'),(174,2074,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552500789'),(175,611,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552501358'),(176,2002,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552505335'),(177,608,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552505905'),(178,2070,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552507048'),(179,2067,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552507622'),(180,2003,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552508173'),(181,2066,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552508739'),(182,2017,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552511211'),(183,2011,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552511580'),(184,612,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552512149'),(185,2038,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552514755'),(186,2043,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552515327'),(187,2015,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552516478'),(188,2019,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552536918'),(189,569,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552540900'),(190,2078,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552547130'),(191,2087,'fb2661eaf5ab9809629fb8544dd53f1ad7530faa',0,'1552548244'),(192,2041,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552549416'),(193,2053,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552552256'),(194,2071,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552553377'),(195,2013,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552553948'),(196,2005,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552554679'),(197,583,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552555148'),(198,2062,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552583379'),(199,2077,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552583945'),(200,610,'659f2c7fe50c5c106bc11174480a3a813438220d',0,'1552585119'),(201,608,'659f2c7fe50c5c106bc11174480a3a813438220d',0,'1552585125'),(202,2099,'60375b57d42ce73a0097fdb76c3ca465100bc8c1',16,'1552597502'),(203,606,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552610646'),(204,2080,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552618602'),(205,2047,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552648140'),(206,2009,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552653826'),(207,2100,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1552666980'),(208,2037,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552671418'),(209,2099,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552682241'),(210,2099,'f10c5e54bd2ef9cc5abdd03328f4ff058b12327d',0,'1552682261'),(211,589,'6d275becd0e176ad98760ddeb972c615751c3c50',0,'1552683772'),(212,2048,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552687901'),(213,589,'d59db41796fbdb842833c7f65109ff8c721f6a4b',0,'1552693366'),(214,2035,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552696410'),(215,614,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552705248'),(216,601,'9a8a95e7a0a8bf2bcd3ab5ea11ba9001a8517fae',0,'1552723790'),(217,608,'663a82259b78808382d15e18603e8a5a03c62158',0,'1552727760'),(218,2068,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552733253'),(219,569,'7e2f450984f532a30a81d4a7aa011d0654ce690c',0,'1552733472'),(220,2099,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1552737114'),(221,614,'aaf9eca2696a4f64e59b1ff39a5676a7c9dae4f8',0,'1552737194'),(222,2087,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1552737306'),(223,2094,'d51a2a50585c267ed1d8defb9233ae474bf792be',0,'1552737959'),(224,1990,'d51a2a50585c267ed1d8defb9233ae474bf792be',0,'1552738681'),(225,571,'d51a2a50585c267ed1d8defb9233ae474bf792be',0,'1552738705'),(226,607,'d51a2a50585c267ed1d8defb9233ae474bf792be',0,'1552738720'),(227,2100,'d51a2a50585c267ed1d8defb9233ae474bf792be',1,'1552739488'),(228,2101,'b268373eaad15e2649283091473eb363574c2978',5,'1552743232'),(229,2102,'b268373eaad15e2649283091473eb363574c2978',5,'1552755084'),(230,580,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1552756412'),(231,2102,'07f99a64f11a56de540442b895561a9f7420be77',0,'1552756417'),(232,2032,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552771307'),(233,573,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552774133'),(234,574,'bf5332f28b2342381c9dab66ebbdbea93ae77c85',0,'1552774424'),(235,2054,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552784364'),(236,593,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552824326'),(237,2102,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',0,'1552825224'),(238,2102,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552825513'),(239,2102,'e3207a59d5de788a14ae9fdc5b5ecfca15a784d0',0,'1552825807'),(240,2102,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1552825888'),(241,2102,'5603e590a37869f1d5a1a92274ab977242f1fe84',0,'1552829160'),(242,2063,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552830173'),(243,570,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552844590'),(244,2101,'17b0086a321f31a845f2b0d7381b012be06829e5',0,'1552850873'),(245,609,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1552850880'),(246,582,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552856518'),(247,579,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552858791'),(248,576,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552862767'),(249,2100,'d097c21eb29bea2f94a593a9b69ce2de885b4cc6',0,'1552863487'),(250,568,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552865609'),(251,588,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552867889'),(252,2052,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552871293'),(253,585,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552872991'),(254,603,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552881513'),(255,596,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552886624'),(256,598,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552887193'),(257,605,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',1,'1552887411'),(258,613,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',1,'1552887811'),(259,610,'391b7b0120d201a22267e5ef065ccfe0b6b58cc7',1,'1552887835'),(260,2024,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552888327'),(261,2006,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552890628'),(262,2039,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552894006'),(263,1996,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552895724'),(264,2008,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1552901405'),(265,1990,'96af1bb896b8c303b2b44d7b068bc0c425726eb4',0,'1552906967'),(266,2100,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552909342'),(267,591,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552921272'),(268,590,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552925247'),(269,609,'cd72134906f80a405122d328d9a1e7ed8b079b23',0,'1552925963'),(270,612,'cd72134906f80a405122d328d9a1e7ed8b079b23',0,'1552925993'),(271,594,'f99602f17fbfc0a70651bf5459029a7e49aae59c',0,'1552929896'),(272,608,'f99602f17fbfc0a70651bf5459029a7e49aae59c',0,'1552930137'),(273,584,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552930933'),(274,2060,'30aedd0be711abb4ab5607b5233fb6a96da3378a',0,'1552933121'),(275,2071,'30aedd0be711abb4ab5607b5233fb6a96da3378a',0,'1552933144'),(276,2096,'30aedd0be711abb4ab5607b5233fb6a96da3378a',0,'1552933203'),(277,609,'74f408c01116144db8f58b54aaff2133b694cb0b',0,'1552942312'),(278,613,'74f408c01116144db8f58b54aaff2133b694cb0b',0,'1552942334'),(279,609,'fa151c133caa55cc35952043abb53781569cbd9e',0,'1552942356'),(280,609,'8ce1d728843f0ef940653b0a68017b9a68c68ded',0,'1552942954'),(281,614,'8ce1d728843f0ef940653b0a68017b9a68c68ded',0,'1552942989'),(282,605,'1a66dd200325db934fad2c394eb7dc342500aa5e',0,'1552955027'),(283,2036,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552965578'),(284,2096,'ce22b37046281700353b09029706f77a8779f650',0,'1552985176'),(285,592,'179a904cc161834a1eef12926e1a85c226522c21',0,'1552991139'),(286,2103,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552991501'),(287,2104,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552992542'),(288,2105,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552992653'),(289,2106,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552992884'),(290,2107,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552993069'),(291,2108,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552993285'),(292,2109,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552993487'),(293,2110,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552993651'),(294,2111,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552993880'),(295,2112,'b90f5ad01ed8d7068ea7b32876ac6a30c235d2de',5,'1552994213'),(296,578,'810d7dc99218d9135bebfe95e484b74f257a4df5',0,'1552996773'),(297,609,'f2ae38991b679bf143bce4d06689760d63be1942',0,'1553000985'),(298,2113,'889f833b4e96ac474841e6730c0b3553b8513090',5,'1553008270'),(299,2087,'f5e1e44990b09a9c9bfc3e32e00c09bdaca63bc8',0,'1553028008'),(300,2103,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1553043297'),(301,2110,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1553045288'),(302,2114,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1553045408'),(303,567,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1553045888'),(304,609,'d00531561203a81dd12f395586835b0a67b0e70f',0,'1553067824'),(305,2115,'889f833b4e96ac474841e6730c0b3553b8513090',5,'1553093906'),(306,2116,'889f833b4e96ac474841e6730c0b3553b8513090',5,'1553094440'),(307,2117,'889f833b4e96ac474841e6730c0b3553b8513090',5,'1553094826'),(308,2118,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1553100361'),(309,2119,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1553100690'),(310,2119,'b415d9e30cae5fd54cfe94acb9b540b5a64d97aa',0,'1553100872'),(311,2020,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1553104752'),(312,609,'77c8ef2c96f486366ea7f33607f7c6d0bff14dc0',0,'1553110169'),(313,609,'e777494c3a596acbce1e5b5788a0d5fa751b784a',0,'1553112419'),(314,614,'e777494c3a596acbce1e5b5788a0d5fa751b784a',0,'1553112451'),(315,2095,'e777494c3a596acbce1e5b5788a0d5fa751b784a',0,'1553112467'),(316,588,'e7825cd5e4a8d0e629271902c27b7edf0e74f287',0,'1553131474'),(317,2118,'358e49b50aa55f7c960908b1031eed83a0b47889',0,'1553177273'),(318,2103,'358e49b50aa55f7c960908b1031eed83a0b47889',0,'1553177318'),(319,2113,'358e49b50aa55f7c960908b1031eed83a0b47889',0,'1553177338'),(320,2088,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553180610'),(321,609,'d0c6746aa51157d9d70d09dbae6be8cdb4232abd',0,'1553190833'),(322,609,'9c523148e3598d9e4a88119a283f016d1758ff74',0,'1553195187'),(323,2115,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1553198063'),(324,2118,'68695d3625667f65c085b75a0342a0e933b34d5c',1,'1553198069'),(325,2088,'68695d3625667f65c085b75a0342a0e933b34d5c',20,'1553198140'),(326,2103,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553217867'),(327,2118,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553218987'),(328,2096,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553220069'),(329,2117,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553221254'),(330,2113,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553222396'),(331,2115,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553224090'),(332,2095,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553225687'),(333,2116,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553226939'),(334,2118,'758632f668e6f990c8d7a943cfe803c8d3427d1d',0,'1553258824'),(335,585,'7c6456be34639d3ff7cc5ddc78744396584e3f8d',0,'1553258888'),(336,596,'7c6456be34639d3ff7cc5ddc78744396584e3f8d',0,'1553258927'),(337,608,'7c6456be34639d3ff7cc5ddc78744396584e3f8d',0,'1553259005'),(338,588,'7c6456be34639d3ff7cc5ddc78744396584e3f8d',0,'1553259053'),(339,2094,'758632f668e6f990c8d7a943cfe803c8d3427d1d',0,'1553259226'),(340,2115,'e15270be20a3f321e93d5ef4c78ed813f9c94fc7',0,'1553294315'),(341,2080,'e15270be20a3f321e93d5ef4c78ed813f9c94fc7',1,'1553294341'),(342,2108,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553304756'),(343,2109,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553305315'),(344,2111,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553307589'),(345,2110,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553308154'),(346,2106,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553310451'),(347,2102,'fd5bac58bfe10b2fab97921dd0f7a3dd91ded617',0,'1553339303'),(348,2120,'e15270be20a3f321e93d5ef4c78ed813f9c94fc7',23,'1553352940'),(349,2120,'e15270be20a3f321e93d5ef4c78ed813f9c94fc7',1,'1553352969'),(350,2096,'e15270be20a3f321e93d5ef4c78ed813f9c94fc7',21,'1553359655'),(351,2120,'ba2a43b3de9fe71739a8f38ac58f116d9e441db9',5,'1553375347'),(352,2118,'455836827497050e48d0fd3b184b72c8817e753f',0,'1553439512'),(353,2118,'cc21a4c205625b55adc3ab71f9c00d9bc7301c3d',0,'1553465423'),(354,2118,'6c81cda43c3b40133d4c72d37c6ec3b60e68428f',21,'1553468666'),(355,2096,'b38ea8698fd17728be15acc147e0bc797723cf62',0,'1553509712'),(356,2118,'fed041864dd4b5c494517f93b69fd2495aadae53',0,'1553524554'),(357,2121,'19ab393959265ec7d399255e2c0108287475fbe9',5,'1553546483'),(358,2121,'3d4d69deca55aa5cb10bb9ddc3fb3c7bac1c9a99',21,'1553560659'),(359,2121,'21fa5eb4b92fb45e69d264006ac2bfc60c964f68',23,'1553607460'),(360,2047,'21fa5eb4b92fb45e69d264006ac2bfc60c964f68',23,'1553607479'),(361,2121,'179a904cc161834a1eef12926e1a85c226522c21',0,'1553695089'),(362,2121,'46640c7bb3e570676751d06d9cad10cbbbb03dc6',1,'1553806095'),(363,2096,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1553813161'),(364,2121,'d4b173f762e0635d6f68534ae9e4e0ab043ed6b0',0,'1553981344'),(365,2096,'826132ca94dabfdf2949a5f1f48231adc7e42060',0,'1554152847'),(366,2047,'98755be1d144456ae8e071705bd4160e5549f0f0',0,'1554231654'),(367,2118,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1554381977'),(368,2121,'30aedd0be711abb4ab5607b5233fb6a96da3378a',0,'1554383777'),(369,2118,'30aedd0be711abb4ab5607b5233fb6a96da3378a',0,'1554383821'),(370,2047,'30aedd0be711abb4ab5607b5233fb6a96da3378a',0,'1554383857'),(371,2121,'4cd3a08b1be87619160ece917ca08071b9f863b9',0,'1554569474'),(372,2047,'81da23b89a1d96d5c3c3463fdbc6c1d5c1dc70a9',0,'1554580773'),(373,2096,'a7361c603910bccb096adfb130eea05167c72039',0,'1554670291'),(374,2121,'a7361c603910bccb096adfb130eea05167c72039',0,'1554670331'),(375,2121,'571a2cd35950fe2e6c2753aca11379159213e705',0,'1554966014'),(376,2118,'571a2cd35950fe2e6c2753aca11379159213e705',0,'1554966065'),(377,2096,'e0ad132c04c8c4502d093ef98893678a12e61a6b',0,'1554969088'),(378,2121,'af9701b9d728ea9c49ebf862ed114c64b2c48553',0,'1554971940'),(379,2121,'640127511cadc84a88fb4c184c23061c428e5174',0,'1554992919'),(380,2121,'173f6f7c7d8f29bc67860f61f3383db1dd88d689',0,'1555002064'),(381,2047,'3d4d69deca55aa5cb10bb9ddc3fb3c7bac1c9a99',21,'1555070831'),(382,2121,'bc6c14164f43ae2d3bfdcb2121ab1702c57b0125',0,'1555072348'),(383,2121,'b05a288a8e6392452b2956ea48ee59e85301e002',0,'1555116528'),(384,2118,'b05a288a8e6392452b2956ea48ee59e85301e002',0,'1555116561'),(385,2121,'0d12c8e756f9a518a6543392bd77b2dbf5a19b68',0,'1555160660'),(386,2121,'5b7b39e00ec7433180461242c3f75201607fa65b',0,'1555177509'),(387,2096,'5b7b39e00ec7433180461242c3f75201607fa65b',0,'1555177516'),(388,2118,'3f0ea7a0ee11dc08afd9930a214b7b278fa25881',0,'1555180184'),(389,2096,'96513e1c8253f06a5675d6b0b667784b102c7ae9',0,'1555189755'),(390,2121,'96513e1c8253f06a5675d6b0b667784b102c7ae9',0,'1555189802'),(391,2118,'96513e1c8253f06a5675d6b0b667784b102c7ae9',0,'1555189873'),(392,2096,'35f06774031f5f497efd62e16f9f2688b346a3fa',0,'1555264502'),(393,2096,'9525a2c7ee462412d08cc45de4ff7539ff2fbe5e',0,'1555320434'),(394,2096,'d0a5a843ca5a0db757df024da8c5354a250b2ea3',0,'1555330639'),(395,2121,'d0a5a843ca5a0db757df024da8c5354a250b2ea3',0,'1555330666'),(396,2096,'bb1c1ff0d062d1aeee4310969a041041d3afff77',0,'1555445891'),(397,2538,'5b61756c8879b1d5d5e8bccd8794488386871b1c',0,'1555483342'),(398,2047,'5b61756c8879b1d5d5e8bccd8794488386871b1c',0,'1555483367'),(399,2096,'5b61756c8879b1d5d5e8bccd8794488386871b1c',0,'1555483383'),(400,2121,'5b61756c8879b1d5d5e8bccd8794488386871b1c',0,'1555483393'),(401,2546,'d6d3ac1f8e81b994d1d6572600e1890a46bfbb30',0,'1555557830'),(402,2546,'2b36bd70fbb05e39206133f38665c3556df95c0d',0,'1555557871'),(403,2120,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1555599693'),(404,2120,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',25,'1555607435'),(405,2552,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555672904'),(406,9999,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555673782'),(407,1,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555673976'),(408,10000,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555674795'),(409,10001,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555674852'),(410,2,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555675688'),(411,3,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555676172'),(412,10002,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555685634'),(413,10003,'4bf8e7b1197e11b7ceea20d7f5022597361bfbce',21,'1555686611'),(414,5,'4bf8e7b1197e11b7ceea20d7f5022597361bfbce',21,'1555686687'),(415,10004,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555691540'),(416,5,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1555745663'),(417,2,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',25,'1555763401'),(418,4,'4bf8e7b1197e11b7ceea20d7f5022597361bfbce',1,'1555763551'),(419,10004,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1555805578'),(420,2,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1555805598'),(421,4,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1555850844'),(422,3,'4bf8e7b1197e11b7ceea20d7f5022597361bfbce',21,'1555855860'),(423,3,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',25,'1555856705'),(424,10005,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1555857340'),(425,10005,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1556026200'),(426,4,'9a91dbd5be770f74133754aea2d5db101ef2f7dc',0,'1556068988'),(427,4,'652ce33b43404dda3fd918b68db254cc2a72371b',0,'1556069806'),(428,10006,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1556186262'),(429,1,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1556922923'),(430,10006,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',21,'1556961582'),(431,10007,'f642f9f0d824b88c0e23fea5f47fdfe907621cae',1,'1557046911'),(432,10008,'8ded692c91a1e930bfa61950bce84eae80e85003',1,'1557542630'),(433,10009,'8ded692c91a1e930bfa61950bce84eae80e85003',1,'1557542775'),(434,10010,'8ded692c91a1e930bfa61950bce84eae80e85003',1,'1557542879'),(435,10009,'3d4d69deca55aa5cb10bb9ddc3fb3c7bac1c9a99',21,'1557664352'),(436,10010,'8ded692c91a1e930bfa61950bce84eae80e85003',21,'1557740189'),(437,10008,'3d4d69deca55aa5cb10bb9ddc3fb3c7bac1c9a99',21,'1558217567');

/*Table structure for table `watch_later` */

DROP TABLE IF EXISTS `watch_later`;

CREATE TABLE `watch_later` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(30) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `watch_later` */

insert  into `watch_later`(`id`,`user_id`,`video_id`,`time`) values (4,1,3,'1556801329'),(6,1,10006,'1557455496');

/*Table structure for table `withdrawal_requests` */

DROP TABLE IF EXISTS `withdrawal_requests`;

CREATE TABLE `withdrawal_requests` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `withdrawal_requests` */

insert  into `withdrawal_requests`(`id`,`user_id`,`email`,`amount`,`currency`,`requested`,`status`) values (5,1,'+9647507308774','1050','IQD','1555635799',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
