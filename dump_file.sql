-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: invoicesystem
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('CLNTID0001','Farrah','FarrahRoa@gmail.com','09123458231','Cosmo'),('CLNTID0002','Wencie','WencieSunga@gmail.com','09123878218','Taguanao'),('CLNTID0003','Kim','KimFlores@gmail.com','09236172368','Lumbia'),('CLNTID0004','Yae','yaemiko@gmail.com','09236172368','Inazuma'),('CLNTID0005','Jean','captainjean@gmail.com','09236172368','Mondstadt'),('CLNTID0006','Ayaka','kamisatoayaka@gmail.com','09236172368','Inazuma');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` varchar(10) NOT NULL,
  `client_id` varchar(10) DEFAULT NULL,
  `booking_id` varchar(10) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `client_id` (`client_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `service_booking` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES ('INVID0001','CLNTID0001','BKNGID0001','2024-04-22',5000.00),('INVID0002','CLNTID0002','BKNGID0002','2024-06-17',4000.00),('INVID0003','CLNTID0003','BKNGID0003','2024-08-25',8350.70);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(10) NOT NULL,
  `invoice_id` varchar(10) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('PYMNTID001','INVID0001',5000.00,'2024-04-22'),('PYMNTID002','INVID0002',4000.00,'2024-06-17'),('PYMNTID003','INVID0003',8350.70,'2024-08-25');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_booking`
--

DROP TABLE IF EXISTS `service_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_booking` (
  `booking_id` varchar(10) NOT NULL,
  `client_id` varchar(10) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `service_description` text,
  PRIMARY KEY (`booking_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `service_booking_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_booking`
--

LOCK TABLES `service_booking` WRITE;
/*!40000 ALTER TABLE `service_booking` DISABLE KEYS */;
INSERT INTO `service_booking` VALUES ('BKNGID0001','CLNTID0001','2024-04-23','Twin Bedroom - Connecting'),('BKNGID0002','CLNTID0002','2024-06-18','Standard Single Room'),('BKNGID0003','CLNTID0003','2024-07-26','Deluxe Double Room');
/*!40000 ALTER TABLE `service_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_inquiry`
--

DROP TABLE IF EXISTS `service_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_inquiry` (
  `inquiry_id` varchar(10) NOT NULL,
  `client_id` varchar(10) DEFAULT NULL,
  `inquiry_date` date DEFAULT NULL,
  `inquiry_details` text,
  PRIMARY KEY (`inquiry_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `service_inquiry_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_inquiry`
--

LOCK TABLES `service_inquiry` WRITE;
/*!40000 ALTER TABLE `service_inquiry` DISABLE KEYS */;
INSERT INTO `service_inquiry` VALUES ('INQYID0001','CLNTID0004','2024-07-06','How much is the Twin Bedroom for Two days?'),('INQYID0002','CLNTID0005','2024-01-03','Which room is the cheapest for the week?'),('INQYID0003','CLNTID0006','2024-02-03','Do you have vouchers for the week?');
/*!40000 ALTER TABLE `service_inquiry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-16 17:04:43
