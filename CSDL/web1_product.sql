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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `product_description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Product1','images/p-1.jpg',329,NULL),(2,1,'Product2','images/p-2.jpg',329,NULL),(3,1,'Product3','images/p-3.jpg',329,NULL),(4,1,'Product4','images/p-4.jpg',329,NULL),(5,1,'Product5','images/p-5.jpg',329,NULL),(6,1,'Product6','images/p-6.jpg',329,NULL),(7,1,'Product7','images/p-7.jpg',329,NULL),(8,1,'product8','images/p-8.jpg',329,NULL),(9,1,'Product9','images/p-9.jpg',329,NULL),(10,2,'Product10','images/p-10.jpg',329,NULL),(11,2,'Product11','images/p-11.jpg',329,NULL),(12,2,'Product12','images/p-12.jpg',329,NULL),(13,2,'Product13','images/p-13.jpg',329,NULL),(14,2,'Product14','images/p-14.jpg',329,NULL),(15,2,'Product15','images/p-15.jpg',329,NULL),(16,2,'Product16','images/p-16.jpg',329,NULL),(17,2,'Product17','images/p-17.jpg',329,NULL),(18,2,'Product18','images/p-18.jpg',329,NULL),(19,3,'product19','images/p-1.png',328,NULL),(20,3,'product20','images/p-2.png',556,NULL),(21,3,'product21','images/p-3.png',332,NULL),(22,3,'product22','images/p-4.png',NULL,NULL),(23,3,'product23','images/p-5.png',NULL,NULL),(24,3,'product24','images/p-6.png',NULL,NULL),(25,3,'product25','images/p-7.png',NULL,NULL),(26,3,'product26','images/p-8.png',NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-30 21:47:05
