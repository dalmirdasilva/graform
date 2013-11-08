-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: graform_development
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,1,1,'2013-10-27 20:10:07','2013-10-27 20:10:07'),(2,1,2,1,'2013-10-27 20:10:09','2013-10-27 20:10:09'),(3,1,3,1,'2013-10-27 20:10:13','2013-10-27 20:10:13'),(4,3,2,3,'2013-10-27 20:11:07','2013-10-27 20:11:07'),(5,3,1,3,'2013-10-27 20:11:08','2013-10-27 20:11:08'),(6,4,2,4,'2013-10-27 20:11:27','2013-10-27 20:11:27'),(7,5,2,5,'2013-10-27 20:11:40','2013-10-27 20:11:40'),(8,6,2,6,'2013-10-27 21:27:12','2013-10-27 21:27:12'),(9,6,1,6,'2013-10-27 21:27:15','2013-10-27 21:27:15'),(10,6,NULL,6,'2013-10-27 21:27:17','2013-10-27 21:27:17'),(11,7,2,7,'2013-10-27 21:27:21','2013-10-27 21:27:21'),(12,8,2,8,'2013-10-27 21:27:25','2013-10-27 21:27:25'),(13,8,1,8,'2013-10-27 21:27:27','2013-10-27 21:27:27'),(14,9,2,9,'2013-10-27 21:27:45','2013-10-27 21:27:45'),(15,9,3,9,'2013-10-27 21:27:46','2013-10-27 21:27:46'),(16,9,1,9,'2013-10-27 21:27:48','2013-10-27 21:27:48'),(17,10,2,10,'2013-10-27 21:27:59','2013-10-27 21:27:59'),(18,10,3,10,'2013-10-27 21:27:59','2013-10-27 21:27:59'),(19,11,2,11,'2013-10-27 21:28:15','2013-10-27 21:28:15'),(20,11,3,11,'2013-10-27 21:28:17','2013-10-27 21:28:17'),(21,12,2,12,'2013-10-27 21:28:23','2013-10-27 21:28:23'),(22,12,3,12,'2013-10-27 21:28:25','2013-10-27 21:28:25'),(23,13,2,13,'2013-10-27 21:28:28','2013-10-27 21:28:28'),(24,15,2,15,'2013-10-28 01:06:23','2013-10-28 01:06:23'),(25,16,2,16,'2013-10-28 01:06:30','2013-10-28 01:06:30'),(26,17,8,17,'2013-11-08 21:30:41','2013-11-08 21:30:41'),(27,17,9,17,'2013-11-08 21:30:44','2013-11-08 21:30:44'),(28,18,8,18,'2013-11-08 21:33:11','2013-11-08 21:33:11'),(29,18,9,18,'2013-11-08 21:33:15','2013-11-08 21:33:15'),(30,18,10,18,'2013-11-08 21:33:19','2013-11-08 21:33:19'),(31,19,8,19,'2013-11-08 21:33:55','2013-11-08 21:33:55'),(32,19,9,19,'2013-11-08 21:33:59','2013-11-08 21:33:59'),(33,19,10,19,'2013-11-08 21:34:02','2013-11-08 21:34:02'),(34,19,11,19,'2013-11-08 21:34:07','2013-11-08 21:34:07');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_types`
--

DROP TABLE IF EXISTS `form_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_types`
--

LOCK TABLES `form_types` WRITE;
/*!40000 ALTER TABLE `form_types` DISABLE KEYS */;
INSERT INTO `form_types` VALUES (1,1,'Conditional','2013-10-27 20:06:34','2013-10-27 20:06:34'),(2,2,'Continuous','2013-10-27 20:06:34','2013-10-27 20:06:34');
/*!40000 ALTER TABLE `form_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `form_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (1,1,1,'jQuery also provides an animation method named','This method signature was deprecated in jQuery 1.8 and removed in jQuery 1.9. jQuery also provides an animation method named .toggle() that toggles the visibility of elements. Whether the animation or the event method is fired depends on the set of arguments passed.\r\n','2013-10-27 20:07:36','2013-10-27 20:07:36');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (9,10,'Carne','2013-11-08 21:31:10','2013-11-08 21:31:14');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
INSERT INTO `question_types` VALUES (1,'Drop down list','2013-10-27 20:06:33','2013-10-27 20:06:33',1),(2,'Single line name','2013-10-27 20:06:33','2013-10-27 20:06:33',2),(3,'Multiple choice','2013-10-27 20:06:33','2013-10-27 20:06:33',3),(4,'Scale','2013-10-27 20:06:33','2013-10-27 20:06:33',4),(5,'Checkboxes','2013-10-27 20:06:33','2013-10-27 20:06:33',5),(6,'Paragraph','2013-10-27 20:06:33','2013-10-27 20:06:33',6);
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `question_type_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (8,1,2,'Qual o seu nome?','2013-11-08 21:28:33','2013-11-08 21:28:57',1),(10,1,5,'O que voce come?','2013-11-08 21:30:57','2013-11-08 21:31:41',3),(12,1,6,'Texto longo:','2013-11-08 21:34:32','2013-11-08 21:34:41',5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (1,1,'2013-10-27 20:10:03','2013-10-27 20:10:03'),(2,1,'2013-10-27 20:10:41','2013-10-27 20:10:41'),(3,1,'2013-10-27 20:11:03','2013-10-27 20:11:03'),(4,1,'2013-10-27 20:11:26','2013-10-27 20:11:26'),(5,1,'2013-10-27 20:11:38','2013-10-27 20:11:38'),(6,1,'2013-10-27 21:26:53','2013-10-27 21:26:53'),(7,1,'2013-10-27 21:27:19','2013-10-27 21:27:19'),(8,1,'2013-10-27 21:27:23','2013-10-27 21:27:23'),(9,1,'2013-10-27 21:27:29','2013-10-27 21:27:29'),(10,1,'2013-10-27 21:27:56','2013-10-27 21:27:56'),(11,1,'2013-10-27 21:28:01','2013-10-27 21:28:01'),(12,1,'2013-10-27 21:28:20','2013-10-27 21:28:20'),(13,1,'2013-10-27 21:28:27','2013-10-27 21:28:27'),(14,1,'2013-10-27 21:29:23','2013-10-27 21:29:23'),(15,1,'2013-10-28 01:06:20','2013-10-28 01:06:20'),(16,1,'2013-10-28 01:06:27','2013-10-28 01:06:27'),(17,1,'2013-11-08 21:30:18','2013-11-08 21:30:18'),(18,1,'2013-11-08 21:33:06','2013-11-08 21:33:06'),(19,1,'2013-11-08 21:33:52','2013-11-08 21:33:52');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `next_question_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES (1,NULL,2,3,1,'2013-10-27 21:27:02','2013-10-28 01:06:17'),(2,NULL,2,4,3,'2013-10-27 21:28:10','2013-10-28 01:06:17'),(3,NULL,2,5,4,'2013-10-28 01:06:14','2013-10-28 01:06:16'),(4,NULL,9,10,7,'2013-11-08 21:32:42','2013-11-08 21:32:56'),(5,NULL,9,11,8,'2013-11-08 21:32:58','2013-11-08 21:33:01'),(7,NULL,10,NULL,10,'2013-11-08 21:33:37','2013-11-08 21:33:37'),(8,NULL,10,NULL,11,'2013-11-08 21:33:41','2013-11-08 21:33:41'),(9,NULL,10,NULL,12,'2013-11-08 21:33:43','2013-11-08 21:33:43');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130822020624'),('20130822132319'),('20130822132408'),('20130822132459'),('20130822133437'),('20130822133909'),('20130822133930'),('20130822134109'),('20130913185640'),('20130913233357'),('20131016234125');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'dalmirdasilva@gmail.com','Dalmir da Silva','$2a$10$.Pvw7AWi0l3ubKvK9Xgw6.Yt0MvFSUD/T98.M7Cr3yvAMCpLhvQ3e','2013-10-27 20:06:50','2013-10-27 20:06:50');
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

-- Dump completed on 2013-11-08 20:20:20
