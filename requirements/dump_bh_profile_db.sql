-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: bh_profile_db
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Current Database: `bh_profile_db`
--

DROP DATABASE IF EXISTS bh_profile_db;


CREATE DATABASE IF NOT EXISTS bh_profile_db;
CREATE USER IF NOT EXISTS 'bh_profile_dev'@'localhost' IDENTIFIED BY 'bh_profile_pwd';
GRANT ALL ON `bh_profile_db`.* TO 'bh_profile_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'bh_profile_dev'@'localhost';
FLUSH PRIVILEGES;


USE `bh_profile_db`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `file_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('16222f5a-2979-4fe5-8532-9d410095a093','Influencer','',''),('46e92702-33de-4635-8816-c5ea3131dbc9','Estabilidad','',''),('bdef23f4-6753-47cf-b28a-6a96b3956439','Cumplimiento','',''),('d4a1bc01-a89f-4b26-b254-260bbf3424e2','Dominancia','','');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `result` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
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
  `email` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `is_user` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4184c2a4-095d-4bc1-b0b6-cc5a947b8999','prueba@hbtn.io','prueba','Perez',1);
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
  `category_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `words_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES ('02b074c7-a556-4702-9688-02babcdac88a','d4a1bc01-a89f-4b26-b254-260bbf3424e2','independiente'),('09f5601c-c90b-4945-a52f-db8e7d5e46bd','16222f5a-2979-4fe5-8532-9d410095a093','sociable'),('1b38613f-a240-4f54-8f16-7b0e00451455','46e92702-33de-4635-8816-c5ea3131dbc9','cooperativo'),('23cbde4c-315a-4b07-ad54-55e11a353713','16222f5a-2979-4fe5-8532-9d410095a093','entusiasta'),('26d35aeb-b3af-4301-aa8d-ec8ddfbfd013','bdef23f4-6753-47cf-b28a-6a96b3956439','pruedente'),('29083d24-d471-445b-83a9-166b474e6f65','46e92702-33de-4635-8816-c5ea3131dbc9','fiable'),('2a0c7f78-1179-449a-8ff6-5b5ec6fbbdd4','16222f5a-2979-4fe5-8532-9d410095a093','comunicativo'),('458befeb-1e75-4248-9558-8a3e0970cecd','d4a1bc01-a89f-4b26-b254-260bbf3424e2','energetico'),('4beb2003-bbfc-453b-befb-ab7369c116c3','16222f5a-2979-4fe5-8532-9d410095a093','efusivo'),('4c7941cf-8fbd-4e3c-92a7-33961ed5c780','d4a1bc01-a89f-4b26-b254-260bbf3424e2','rapido'),('60fffd13-4cba-4189-a650-fcea7aff8580','d4a1bc01-a89f-4b26-b254-260bbf3424e2','decidido'),('622152bc-2d95-4d2e-8119-f413dec4ee68','46e92702-33de-4635-8816-c5ea3131dbc9','atento'),('71170594-2642-448f-bd72-1110f3c077d6','16222f5a-2979-4fe5-8532-9d410095a093','demostrativo'),('76da84ef-e293-443e-a60c-e670c6f1529b','bdef23f4-6753-47cf-b28a-6a96b3956439','reflexivo'),('8a39628a-95af-4ae6-ae6d-e27c976d6895','bdef23f4-6753-47cf-b28a-6a96b3956439','reservado'),('a569aa85-bdb0-4f81-88ae-56bba3c8b991','46e92702-33de-4635-8816-c5ea3131dbc9','paciente'),('a9f0ce82-1d66-48d2-afd0-73a2f38baa38','bdef23f4-6753-47cf-b28a-6a96b3956439','preciso'),('aff2947d-b5b4-49c4-bdc3-5729ac2b0bc9','16222f5a-2979-4fe5-8532-9d410095a093','inspirador'),('bacdff62-f92f-4ba1-bb3e-3edb28345a0a','d4a1bc01-a89f-4b26-b254-260bbf3424e2','directo'),('c66a178e-afd8-40fc-b4d5-8cf9fedf65cd','46e92702-33de-4635-8816-c5ea3131dbc9','discreto'),('cb4c4e01-368e-4435-9437-89123848656f','46e92702-33de-4635-8816-c5ea3131dbc9','ecuanime'),('f1bfdcc9-0639-4eee-a51e-7897bf41a22d','bdef23f4-6753-47cf-b28a-6a96b3956439','formal'),('fee74d00-2f2d-4754-a22c-a57cc2f48ebd','d4a1bc01-a89f-4b26-b254-260bbf3424e2','exigente');
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

-- Dump completed on 2023-02-18 22:32:17
