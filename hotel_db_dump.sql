-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: hotel_db
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_info` (
  `cust_id` varchar(20) NOT NULL,
  `cust_pw` varchar(20) DEFAULT NULL,
  `cust_kor_last_name` varchar(30) DEFAULT NULL,
  `cust_kor_first_name` varchar(30) DEFAULT NULL,
  `cust_eng_last_name` varchar(30) DEFAULT NULL,
  `cust_eng_first_name` varchar(30) DEFAULT NULL,
  `cust_birth` date DEFAULT NULL,
  `cust_country` varchar(20) DEFAULT NULL,
  `cust_region` varchar(20) DEFAULT NULL,
  `cust_cell_ccc` varchar(10) DEFAULT NULL,
  `cust_cell_no` int DEFAULT NULL,
  `cust_card_type` varchar(10) DEFAULT NULL,
  `cust_card_no` char(16) DEFAULT NULL,
  `cust_card_vlddate` date DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_mgt`
--

DROP TABLE IF EXISTS `customer_mgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_mgt` (
  `cust_id` varchar(20) NOT NULL,
  `mbrship_mbr` tinyint(1) DEFAULT NULL,
  `mbrship_date` date DEFAULT NULL,
  `cust_svy` varchar(50) DEFAULT NULL,
  `cust_pf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  CONSTRAINT `c_info_mgt` FOREIGN KEY (`cust_id`) REFERENCES `customer_info` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_mgt`
--

LOCK TABLES `customer_mgt` WRITE;
/*!40000 ALTER TABLE `customer_mgt` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_mgt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `fclt_id` char(10) NOT NULL,
  `fclt_name` varchar(20) NOT NULL,
  `fclt_open_time` char(5) DEFAULT NULL,
  `fclt_close_time` char(5) DEFAULT NULL,
  `fclt_event` varchar(50) DEFAULT NULL,
  `fclt_for_mbrship` varchar(20) DEFAULT NULL,
  `hotel_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`fclt_id`),
  KEY `hotel_fclt` (`hotel_id`),
  CONSTRAINT `hotel_fclt` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_statement`
--

DROP TABLE IF EXISTS `financial_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_statement` (
  `date` date DEFAULT NULL,
  `daily_report` int DEFAULT NULL,
  `hotel_id` char(10) DEFAULT NULL,
  KEY `hotel_fs` (`hotel_id`),
  CONSTRAINT `hotel_fs` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_statement`
--

LOCK TABLES `financial_statement` WRITE;
/*!40000 ALTER TABLE `financial_statement` DISABLE KEYS */;
/*!40000 ALTER TABLE `financial_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_id` char(10) NOT NULL,
  `hotel_name` varchar(20) NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` varchar(20) NOT NULL,
  `prod_name` varchar(20) NOT NULL,
  `prod_brand` varchar(20) DEFAULT NULL,
  `prod_from` varchar(20) DEFAULT NULL,
  `prod_stock` int DEFAULT NULL,
  `prod_price` int DEFAULT NULL,
  `hotel_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `hotel_prod` (`hotel_id`),
  CONSTRAINT `hotel_prod` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `rsvt_id` varchar(20) NOT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `count_room_needed` int DEFAULT NULL,
  `extra_req` varchar(50) DEFAULT NULL,
  `cust_id` varchar(20) DEFAULT NULL,
  `room_id` char(20) DEFAULT NULL,
  `hotel_id` char(10) DEFAULT NULL,
  `staff_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`rsvt_id`),
  KEY `cust_rsvt` (`cust_id`),
  KEY `hotel_rsvt` (`hotel_id`),
  KEY `room_rsvt` (`room_id`),
  KEY `staff_rsvt` (`staff_id`),
  CONSTRAINT `cust_rsvt` FOREIGN KEY (`cust_id`) REFERENCES `customer_info` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_rsvt` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_rsvt` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_rsvt` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` char(20) NOT NULL,
  `room_type` varchar(20) DEFAULT NULL,
  `room_bed_type` varchar(20) DEFAULT NULL,
  `room_no` char(4) DEFAULT NULL,
  `room_view` blob,
  `room_fee` int DEFAULT NULL,
  `room_amenity` varchar(50) DEFAULT NULL,
  `room_gp` blob,
  `room_user_limit` int DEFAULT NULL,
  `room_toilet_no` int DEFAULT NULL,
  `room_smoke` tinyint(1) DEFAULT NULL,
  `room_chkin` date DEFAULT NULL,
  `room_chkout` date DEFAULT NULL,
  `staff_id` char(10) DEFAULT NULL,
  `hotel_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `staff_room` (`staff_id`),
  KEY `hotel_room` (`hotel_id`),
  CONSTRAINT `hotel_room` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_room` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_info`
--

DROP TABLE IF EXISTS `staff_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_info` (
  `staff_id` char(10) NOT NULL,
  `staff_pw` varchar(20) DEFAULT NULL,
  `staff_kor_last_name` varchar(30) DEFAULT NULL,
  `staff_kor_first_name` varchar(30) DEFAULT NULL,
  `staff_eng_last_name` varchar(30) DEFAULT NULL,
  `staff_eng_first_name` varchar(30) DEFAULT NULL,
  `staff_birth` date DEFAULT NULL,
  `staff_title` varchar(10) DEFAULT NULL,
  `staff_cell_no` int DEFAULT NULL,
  `staff_task` varchar(20) DEFAULT NULL,
  `staff_salary` int DEFAULT NULL,
  `hotel_id` char(10) DEFAULT NULL,
  `fclt_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `hotel_staff` (`hotel_id`),
  KEY `fclt_staff` (`fclt_id`),
  CONSTRAINT `fclt_staff` FOREIGN KEY (`fclt_id`) REFERENCES `facility` (`fclt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hotel_staff` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_info`
--

LOCK TABLES `staff_info` WRITE;
/*!40000 ALTER TABLE `staff_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_mgt`
--

DROP TABLE IF EXISTS `staff_mgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_mgt` (
  `staff_id` char(10) DEFAULT NULL,
  `staff_task_session` varchar(20) DEFAULT NULL,
  `staff_rating` varchar(20) DEFAULT NULL,
  KEY `s_info_mgt` (`staff_id`),
  CONSTRAINT `s_info_mgt` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_mgt`
--

LOCK TABLES `staff_mgt` WRITE;
/*!40000 ALTER TABLE `staff_mgt` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_mgt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11  1:55:00
