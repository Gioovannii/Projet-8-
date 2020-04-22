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
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'champs elysées','paris','75001',12,' ','street','  '),(2,'de la paix','paris','75003',15,'  ','street','  '),(3,'de la commanderie','marseille','13001',35,'  ','place ','  ');
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2020-02-23'),(2,'2020-10-21'),(3,'2020-11-30');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'giovanni','gaffe',193804381,'giova@gmail.com'),(2,'james','gaffe',612763456,'james@me.com'),(3,'luc','gaffe',354783295,'luc@me.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'gorgonzola','4',1),(2,'zucchinni','2',2),(3,'mozzarella','3',3);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `line_order`
--

LOCK TABLES `line_order` WRITE;
/*!40000 ALTER TABLE `line_order` DISABLE KEYS */;
INSERT INTO `line_order` VALUES (1,1,3,36,19.6),(2,2,2,25,19.6),(3,3,4,43,19.6);
/*!40000 ALTER TABLE `line_order` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2020-03-12',1,'some adress',12,1,1,1,1),(2,'2020-08-30',1,'another adress',35,2,2,2,2),(3,'2020-11-21',1,'director familly',0,3,3,3,3);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'4 cheeses','go to gym','place all cheese with emental on the top',12,'gorgonzolla, emmental, camembert'),(2,'4 seasons','discover','make 4 distinct area',12,'eggplant, zucchini, chef choice'),(3,'marguarita','classic','do not put too much cheese',9,'tomato sauce and mozzarella');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,'main adress','crunchy pizza',192834543,1,3),(2,'secondary adress','hello pizza',145982301,1,1),(3,'another restaurant','pizza party',178324560,1,2);
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'director','steve','jobs','steve@me.com',189236321,1),(2,'waiter','zinedine','zidane','zz@me.com',128310943,2),(3,'pizzaiolo','marco ','verratti','marci@me.com',921943245,3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
INSERT INTO `Stock` VALUES (1,1,34,78),(2,2,45,120),(3,3,21,430);
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2020-03-17 10:49:10
