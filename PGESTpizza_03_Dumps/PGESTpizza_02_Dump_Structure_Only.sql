CREATE DATABASE  IF NOT EXISTS `OC Pizza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `OC Pizza`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: OC Pizza
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `number` int NOT NULL,
  `extension` varchar(45) NOT NULL,
  `type_of_street` varchar(45) NOT NULL,
  `complementary_informations` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `tel` int NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `pizza_id` int NOT NULL,
  PRIMARY KEY (`id`,`pizza_id`),
  KEY `fk_ingredients_pizza1_idx` (`pizza_id`),
  CONSTRAINT `fk_ingredients_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `line_order`
--

DROP TABLE IF EXISTS `line_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_order` (
  `pizza_id` int NOT NULL,
  `order_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `tva_amount` double NOT NULL,
  PRIMARY KEY (`pizza_id`,`order_id`),
  KEY `fk_pizza_has_order_order1_idx` (`order_id`),
  KEY `fk_pizza_has_order_pizza1_idx` (`pizza_id`),
  CONSTRAINT `fk_pizza_has_order_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_pizza_has_order_pizza1` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `state` tinyint NOT NULL,
  `adress` varchar(45) NOT NULL,
  `payment` double NOT NULL,
  `adress_id` int NOT NULL,
  `bill_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `adress_id1` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_bill1_idx` (`bill_id`),
  KEY `fk_order_customer1_idx` (`customer_id`),
  KEY `fk_order_adress1_idx` (`adress_id1`),
  CONSTRAINT `fk_order_adress1` FOREIGN KEY (`adress_id1`) REFERENCES `adress` (`id`),
  CONSTRAINT `fk_order_bill1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `recipe` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `ingredients` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzeria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  `is_open` tinyint NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pizzeria_order1_idx` (`order_id`),
  CONSTRAINT `fk_pizzeria_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `tel` int NOT NULL,
  `pizzeria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_staff_pizzeria1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_staff_pizzeria1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stock` (
  `pizzeria_id` int NOT NULL,
  `ingredients_id` int NOT NULL,
  `available` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`pizzeria_id`,`ingredients_id`),
  KEY `fk_pizzeria_has_ingredients_ingredients1_idx` (`ingredients_id`),
  KEY `fk_pizzeria_has_ingredients_pizzeria1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_pizzeria_has_ingredients_ingredients1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `fk_pizzeria_has_ingredients_pizzeria1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzeria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'OC Pizza'
--

--
-- Dumping routines for database 'OC Pizza'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-17 10:50:44
