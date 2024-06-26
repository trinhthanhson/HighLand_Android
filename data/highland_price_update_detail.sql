-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: highland
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `price_update_detail`
--

DROP TABLE IF EXISTS `price_update_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_update_detail` (
  `price_update_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `price_new` int DEFAULT NULL,
  `price_old` int DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  PRIMARY KEY (`price_update_detail_id`),
  KEY `FKqqg6x7ou2wg76hybqnfmtnkcd` (`product_id`),
  KEY `FKnj2eq1uaj86owx8uuyndsocmt` (`created_by`),
  CONSTRAINT `FKnj2eq1uaj86owx8uuyndsocmt` FOREIGN KEY (`created_by`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `FKqqg6x7ou2wg76hybqnfmtnkcd` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_update_detail`
--

LOCK TABLES `price_update_detail` WRITE;
/*!40000 ALTER TABLE `price_update_detail` DISABLE KEYS */;
INSERT INTO `price_update_detail` VALUES (1,'2024-04-08 03:35:50',1,55000,55000,'GM990D','2024-04-23 05:49:50',1),(2,'2024-04-08 03:48:33',1,29000,29000,'C2JVP0','2024-04-26 06:09:38',2),(3,'2024-04-08 03:50:26',1,29000,29000,'A40XV7','2024-04-23 05:25:03',1),(4,'2024-04-08 03:52:49',1,49000,49000,'9XBWAY','2024-04-23 05:23:01',1),(5,'2024-04-08 03:53:44',1,35000,35000,'ZZRAYU','2024-04-23 05:54:08',1),(6,'2024-04-08 03:54:50',1,45000,45000,'JAMKTC','2024-04-23 05:50:22',1),(7,'2024-04-08 03:56:28',1,59000,59000,'OOCC4O','2024-04-23 05:51:39',1),(8,'2024-04-08 03:59:20',1,45000,45000,'RDGCIL','2024-04-23 05:52:55',1),(9,'2024-04-08 04:02:28',1,45000,45000,'WFWQOH','2024-04-23 05:53:32',1),(10,'2024-04-08 04:04:45',1,45000,45000,'QKC10G','2024-04-23 05:52:38',1),(11,'2024-04-23 06:00:05',1,45000,45000,'HBTHUR','2024-04-23 06:00:54',1),(12,'2024-04-23 06:05:24',1,35000,35000,'AKO985','2024-04-23 06:05:24',1),(13,'2024-04-23 06:06:43',1,39000,39000,'Q7CYYT','2024-04-26 06:08:33',2),(14,'2024-04-23 06:07:38',1,38000,38000,'FBLR1X','2024-04-23 07:43:35',1),(15,'2024-04-26 06:14:28',2,45000,45000,'JFTDJQ','2024-04-26 06:14:28',2),(16,'2024-04-26 06:16:14',2,50000,50000,'C2D0R0','2024-04-26 06:16:14',2);
/*!40000 ALTER TABLE `price_update_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 22:48:24
