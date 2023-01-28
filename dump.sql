-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: test_profile_db
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
--

DROP TABLE IF EXISTS `categories`;
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
INSERT INTO `categories` VALUES ('17ee7aba-1126-4bc9-b679-cbf2ba68f533','2023-01-28 02:49:11','2023-01-28 02:49:11','Estabilidad',NULL,NULL),('232cd682-b3ce-4fd9-93b8-bd4aaa04eb50','2023-01-28 02:47:36','2023-01-28 02:47:36','cumplimiento',NULL,NULL),('3f223dc2-140d-4cf0-a73f-8b539a32406c','2023-01-28 16:35:42','2023-01-28 16:35:42','Cumplimiento',NULL,NULL),('ab1179f4-2c51-4397-b18e-14cda568b9e8','2023-01-28 16:37:40','2023-01-28 16:37:40','Cumplimiento',NULL,NULL),('d6c64fb0-aa2c-45f5-a61c-b832c5310f6a','2023-01-28 02:49:05','2023-01-28 02:49:05','Dominancia',NULL,NULL);
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
INSERT INTO `roles` VALUES ('0ef56fe7-f0cf-4374-a246-167054560906','2023-01-28 03:35:47','2023-01-28 03:35:47','admin'),('5c0c9869-4470-4b19-87be-1cd5d6faa9ef','2023-01-28 03:36:09','2023-01-28 03:36:09','user');
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
INSERT INTO `test` VALUES ('52b9c828-a92f-4207-88e5-7537bd7adeaf','2023-01-28 04:20:15','2023-01-28 04:20:15','b82fedbe-2056-4fa2-a34e-556ebf709217','profile',NULL);
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
INSERT INTO `user_test` VALUES ('b5e3f654-afd9-43bb-bc19-94af83bf2d0c','52b9c828-a92f-4207-88e5-7537bd7adeaf');
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
INSERT INTO `users` VALUES ('b82fedbe-2056-4fa2-a34e-556ebf709217','2023-01-28 03:40:49','2023-01-28 03:40:49','gui@hbtn.io','f4ce007d8e84e0910fbdd7a06fa1692d','Guillaume','Snow','5c0c9869-4470-4b19-87be-1cd5d6faa9ef');
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
INSERT INTO `words` VALUES ('1e8f95c5-d637-4bc6-98ee-adf1f67ea332','2023-01-28 03:01:05','2023-01-28 03:01:05','17ee7aba-1126-4bc9-b679-cbf2ba68f533','ecuanime'),('20ba8a05-ddcd-4a8f-9ed6-45830d5cf857','2023-01-28 16:35:42','2023-01-28 16:35:42','3f223dc2-140d-4cf0-a73f-8b539a32406c','Dominancia'),('28ba7296-f685-4380-87a8-cbf00ff34b0d','2023-01-28 03:02:55','2023-01-28 03:02:55','d6c64fb0-aa2c-45f5-a61c-b832c5310f6a','energetico'),('5cb9777b-9732-4162-a832-28c008179cb8','2023-01-28 03:00:04','2023-01-28 03:00:04','17ee7aba-1126-4bc9-b679-cbf2ba68f533','atento'),('8766ce1d-7e5d-4344-ad5e-354c53871536','2023-01-28 16:37:40','2023-01-28 16:37:40','ab1179f4-2c51-4397-b18e-14cda568b9e8','preciso'),('8818c220-a40f-471f-857f-87fdfbf0f3c1','2023-01-28 03:02:35','2023-01-28 03:02:35','d6c64fb0-aa2c-45f5-a61c-b832c5310f6a','decidido'),('b5e3f654-afd9-43bb-bc19-94af83bf2d0c','2023-01-28 03:01:42','2023-01-28 03:01:42','232cd682-b3ce-4fd9-93b8-bd4aaa04eb50','preciso'),('b7380468-8871-4215-8454-67498e3f8400','2023-01-28 03:02:03','2023-01-28 03:02:03','232cd682-b3ce-4fd9-93b8-bd4aaa04eb50','reservado');
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

-- Dump completed on 2023-01-28 11:57:40
