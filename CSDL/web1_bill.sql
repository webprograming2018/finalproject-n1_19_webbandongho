-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: web1
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bill` (
  `bill_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `soDT` varchar(45) DEFAULT NULL,
  `dongGoi` varchar(45) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `ngay` varchar(45) DEFAULT NULL,
  `gio` varchar(45) DEFAULT NULL,
  `tuan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1546165449164,2,664,'cham','Báº¯c Ninh','01766666','thongthuong','2018-12-30 10:24:09','30','17','4'),(1546167038352,2,332,'cham','Báº¯c Ninh','01766666','thongthuong','2018-12-30 10:50:38','30','17','4'),(1546168556624,2,332,'cham','Báº¯c Ninh','01766666','thongthuong','2018-12-30 11:15:57','30','18','4'),(1546169563435,2,332,'cham','Báº¯c Ninh','01766666','thongthuong','2018-12-30 11:32:43','30','18','4'),(1546169633504,2,332,'cham','Báº¯c Ninh','01766666','thongthuong','2018-12-30 11:33:54','30','18','4'),(1546173787081,9,660,'cham','Báº¯c Ninh','0355569281','thongthuong','2018-12-30 12:43:07','30','19','4'),(1546174158031,9,708,'nhanh','Bắc Ninh','0355569281','thongthuong','2018-12-30 12:49:18','30','19','4');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-30 21:47:06
