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
INSERT INTO `categories` VALUES ('98af9387-3dab-4615-b7e3-65214d19f379','Cumplimiento',NULL,NULL),('9b87efa2-10ec-4094-92f6-325f383eeb50','Influencer',NULL,NULL),('be54a98c-f3e1-4209-bb4d-467ced1db171','Dominancia',NULL,NULL),('db5d1e2f-2123-4889-9fa7-96669792205d','Estabilidad',NULL,NULL);
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
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('61b93d6a-216d-4956-8398-efda2c5f9455','admin'),('dc32135c-1f1e-4dac-8771-1b91289dd03e','user');
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
INSERT INTO `test` VALUES ('f2c473fc-c772-4bcc-8dba-b08060ef8c83','b5d33685-4eec-429a-86c2-07e3ee8f8797','test1',NULL,'2023-02-06 19:47:46','2023-02-06 19:47:46');
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
INSERT INTO `user_test` VALUES ('7e29e3ea-67b5-4a53-b691-ae9614aa64bd','f2c473fc-c772-4bcc-8dba-b08060ef8c83');
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
  `rol_id` varchar(60) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('b5d33685-4eec-429a-86c2-07e3ee8f8797','dc32135c-1f1e-4dac-8771-1b91289dd03e','prueba@hbtn.io','3a91997270269de6c5d31b38dfc7b75c','prueba','Perez');
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
INSERT INTO `words` VALUES ('1a3119f5-bd89-4ab8-9405-b4f3b98145e1','9b87efa2-10ec-4094-92f6-325f383eeb50','inspirador'),('204de7ed-ece2-4112-84b4-f8238ecfea6b','98af9387-3dab-4615-b7e3-65214d19f379','reservado'),('2d304631-c9a7-48c2-9d59-2eb552ad6155','9b87efa2-10ec-4094-92f6-325f383eeb50','efusivo'),('3bdcf17b-420f-4e25-a999-9d43bdac7e30','be54a98c-f3e1-4209-bb4d-467ced1db171','energetico'),('4b0eb4e2-61bc-48d6-8765-c59cb6ae127e','9b87efa2-10ec-4094-92f6-325f383eeb50','entusiasta'),('4c363e03-32d7-4f6b-b050-880fad54a318','98af9387-3dab-4615-b7e3-65214d19f379','prudente'),('4e8e1995-5374-48a8-a293-bd95dddc136a','98af9387-3dab-4615-b7e3-65214d19f379','reflexivo'),('5a26ed1d-1c30-4537-936b-54f80bc840ff','be54a98c-f3e1-4209-bb4d-467ced1db171','rapido'),('61b903a9-a946-4758-ad28-73fd1a6ea24d','be54a98c-f3e1-4209-bb4d-467ced1db171','exigente'),('6500bec5-c485-41e0-8a18-68ac616ac42f','98af9387-3dab-4615-b7e3-65214d19f379','formal'),('676cd852-aa20-4673-8b04-6809b61c7487','be54a98c-f3e1-4209-bb4d-467ced1db171','independiente'),('69dc9051-4d09-4211-88eb-32d8a8c3d4f0','9b87efa2-10ec-4094-92f6-325f383eeb50','demostrativo'),('734f0d47-42aa-4175-b345-ca8a7a67c9ea','98af9387-3dab-4615-b7e3-65214d19f379','preciso'),('7e29e3ea-67b5-4a53-b691-ae9614aa64bd','98af9387-3dab-4615-b7e3-65214d19f379','ecuanime'),('8e9b81d6-395c-4dd9-9d29-49eee765792c','db5d1e2f-2123-4889-9fa7-96669792205d','discreto'),('93f287f9-4ba7-40dc-a575-b09a44921b42','be54a98c-f3e1-4209-bb4d-467ced1db171','directo'),('a0541912-4760-41e7-9d04-f39163512fb4','9b87efa2-10ec-4094-92f6-325f383eeb50','comunicativo'),('ae1b13a8-37b3-48d0-8513-6db0b7f38e93','db5d1e2f-2123-4889-9fa7-96669792205d','cooperativo'),('defeaccd-20bb-49cd-a9f3-3c294db98d7d','db5d1e2f-2123-4889-9fa7-96669792205d','atento'),('ed14bced-06d8-4b09-baac-9cf6ae8dad81','be54a98c-f3e1-4209-bb4d-467ced1db171','decidido'),('efb01ae3-1cee-4619-8fd2-b794df951b7b','9b87efa2-10ec-4094-92f6-325f383eeb50','sociable'),('f304103d-6827-4a41-9547-5bc180c16f2c','db5d1e2f-2123-4889-9fa7-96669792205d','fiable'),('f9a70cf4-d9b6-453f-a38b-6d6743dabdc9','db5d1e2f-2123-4889-9fa7-96669792205d','paciente');
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

-- Dump completed on 2023-02-06 15:14:16
