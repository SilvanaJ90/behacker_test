-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: bh_profile_db
-- ------------------------------------------------------
-- Server version	8.0.32-0buntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
DROP DATABASE IF EXISTS bh_profile_db;
-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS bh_profile_db;
CREATE USER IF NOT EXISTS 'bh_profile_dev'@'localhost' IDENTIFIED BY 'bh_profile_pwd';
GRANT ALL ON `bh_profile_db`.* TO 'bh_profile_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bh_profile_dev'@'localhost';
FLUSH PRIVILEGES;

use bh_profile_db;


DROP TABLE IF EXISTS `categories`;

use bh_profile_db;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `file` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('187a2f5b-b139-4e7a-add6-b0637d1cd7f7','2023-01-29 12:49:23','2023-01-29 12:49:23','Influencers',NULL,NULL),('5d2837d0-522a-4b21-8d82-846e224ef8b9','2023-01-29 12:45:30','2023-01-29 12:45:30','Compliance',NULL,NULL),('62f6ea95-0aeb-4d1c-a917-94f1e3438407','2023-01-29 12:48:15','2023-01-29 12:48:15','Stability',NULL,NULL),('cc55f762-6bf4-425d-a483-0d3cb288d7c1','2023-01-29 12:46:32','2023-01-29 12:46:32','Dominance',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('069611c3-c495-490d-ba6e-6ceee0ee53d5','2023-01-29 14:57:20','2023-01-29 14:57:20','admin'),('d7ac97a8-5fa5-4aed-96e2-6be43a25ccdd','2023-01-29 14:57:50','2023-01-29 14:57:50','user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `result` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('fd7d4fae-b60d-4415-9162-ae07f22ba448','2023-01-29 15:39:57','2023-01-29 15:39:57','ffc6e939-95da-49fd-a121-a7c043b5ceaf','profile 01',NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test`
--

DROP TABLE IF EXISTS `user_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_test` (
  `words_id` varchar(60) NOT NULL,
  `test_id` varchar(60) NOT NULL,
  PRIMARY KEY (`words_id`,`test_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `user_test_ibfk_1` FOREIGN KEY (`words_id`) REFERENCES `words` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_test_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test`
--

LOCK TABLES `user_test` WRITE;
/*!40000 ALTER TABLE `user_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `roles_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_id` (`roles_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('def59ae6-f63d-4d8d-86fd-543d02e21a18','2023-01-29 15:07:04','2023-01-29 15:07:04','admin@test.io','4fbd41a36dac3cd79aa1041c9648ab89','pepito','perez','069611c3-c495-490d-ba6e-6ceee0ee53d5'),('ffc6e939-95da-49fd-a121-a7c043b5ceaf','2023-01-29 15:02:24','2023-01-29 15:02:24','gui@hbtn.io','f4ce007d8e84e0910fbdd7a06fa1692d','Guillaume','Snow','d7ac97a8-5fa5-4aed-96e2-6be43a25ccdd');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `categories_id` varchar(60) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `words_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES ('0602cb58-a691-4c4b-b0e7-ec5989d281d1','2023-01-29 13:59:26','2023-01-29 13:59:26','5d2837d0-522a-4b21-8d82-846e224ef8b9','precise'),('0afdf042-1c85-4522-8790-61cff9d148ff','2023-01-29 13:59:51','2023-01-29 13:59:51','5d2837d0-522a-4b21-8d82-846e224ef8b9','reserved'),('0faf8b00-011f-406f-a790-05a9bb6855e4','2023-01-29 14:05:55','2023-01-29 14:05:55','62f6ea95-0aeb-4d1c-a917-94f1e3438407','cooperative'),('22822766-dd58-46e5-8b6e-29e23aac8628','2023-01-29 14:00:24','2023-01-29 14:00:24','5d2837d0-522a-4b21-8d82-846e224ef8b9','formal'),('331dc5d2-106c-4626-a1c4-85be1db4e8a2','2023-01-29 14:06:08','2023-01-29 14:06:08','62f6ea95-0aeb-4d1c-a917-94f1e3438407','discreet'),('404bf0db-f06c-4e1f-856e-c4892befd7df','2023-01-29 12:51:28','2023-01-29 12:51:28','cc55f762-6bf4-425d-a483-0d3cb288d7c1','energetico'),('47cd69ac-25e8-41c9-8332-f7a47c370b3a','2023-01-29 14:07:47','2023-01-29 14:07:47','187a2f5b-b139-4e7a-add6-b0637d1cd7f7','enthusiastic'),('4f85dcda-80a2-4215-b751-93d7f5b498a1','2023-01-29 14:36:26','2023-01-29 14:36:26','5d2837d0-522a-4b21-8d82-846e224ef8b9','pruedent'),('519c1b73-85f1-4c6b-beb6-c5bf1d7e0658','2023-01-29 12:51:58','2023-01-29 12:51:58','cc55f762-6bf4-425d-a483-0d3cb288d7c1','quickly'),('6e008aa8-ac0b-4662-aee9-002d79b72571','2023-01-29 12:50:58','2023-01-29 12:50:58','cc55f762-6bf4-425d-a483-0d3cb288d7c1','decided'),('74d6b259-e04b-414c-8885-52125ddc898d','2023-01-29 14:05:45','2023-01-29 14:05:45','62f6ea95-0aeb-4d1c-a917-94f1e3438407','patient'),('77be4be1-ff79-456d-9798-2cba25497feb','2023-01-29 12:53:42','2023-01-29 12:53:42','cc55f762-6bf4-425d-a483-0d3cb288d7c1','demanding'),('7941f359-83ba-4c73-8518-beeab9260d42','2023-01-29 14:05:33','2023-01-29 14:05:33','62f6ea95-0aeb-4d1c-a917-94f1e3438407','equanimous'),('8f414ca3-4a5f-4ae4-957b-32ba49ae829c','2023-01-29 14:07:57','2023-01-29 14:07:57','187a2f5b-b139-4e7a-add6-b0637d1cd7f7','communicative'),('aaa78460-9ae4-4b2f-a519-4b4ebb725287','2023-01-29 14:01:19','2023-01-29 14:01:19','5d2837d0-522a-4b21-8d82-846e224ef8b9','reflective'),('cef74567-494b-4b70-b986-7cdaacb4b589','2023-01-29 12:53:13','2023-01-29 12:53:13','cc55f762-6bf4-425d-a483-0d3cb288d7c1','independent'),('d0049c34-00bb-4209-8882-2e801431563d','2023-01-29 14:01:48','2023-01-29 14:01:48','5d2837d0-522a-4b21-8d82-846e224ef8b9','pruedent'),('d234fb50-dec2-4135-aa9c-116883f59544','2023-01-29 14:08:34','2023-01-29 14:08:34','187a2f5b-b139-4e7a-add6-b0637d1cd7f7','inspiring'),('d4e2eb63-d309-4a06-9262-a2c600585355','2023-01-29 14:04:43','2023-01-29 14:04:43','62f6ea95-0aeb-4d1c-a917-94f1e3438407','attentive'),('d88cc794-649f-4dd2-bd36-198fc8df1b17','2023-01-29 14:07:37','2023-01-29 14:07:37','187a2f5b-b139-4e7a-add6-b0637d1cd7f7','effusive'),('dd5af840-5973-4181-b81f-8bb659a6df02','2023-01-29 14:08:07','2023-01-29 14:08:07','187a2f5b-b139-4e7a-add6-b0637d1cd7f7','demonstrative'),('edfc9f91-236d-49dd-afde-2ed9ef2cfab8','2023-01-29 12:52:50','2023-01-29 12:52:50','cc55f762-6bf4-425d-a483-0d3cb288d7c1','direct'),('faea8e32-e9b5-443f-aef5-ad7520e432e5','2023-01-29 14:08:22','2023-01-29 14:08:22','187a2f5b-b139-4e7a-add6-b0637d1cd7f7','sociable'),('fbb1e9da-09d7-4e95-8d33-e8f870c9d852','2023-01-29 14:06:20','2023-01-29 14:06:20','62f6ea95-0aeb-4d1c-a917-94f1e3438407','reliable');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-29 12:10:40
