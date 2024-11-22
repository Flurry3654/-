-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: booking
-- ------------------------------------------------------
-- Server version	8.4.2

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-22 22:45:31
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventory_management
-- ------------------------------------------------------
-- Server version	8.4.2

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
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlines` (
  `AirlineID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Code` char(3) NOT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AirlineID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
INSERT INTO `airlines` VALUES (1,'American Airlines','AAL','USA'),(2,'Delta Air Lines','DAL','USA'),(3,'British Airways','BAW','UK'),(4,'Air France','AFR','France'),(5,'Emirates','UAE','UAE'),(6,'All Nippon Airways','ANA','Japan'),(7,'Lufthansa','DLH','Germany'),(8,'Singapore Airlines','SIA','Singapore'),(9,'Qantas','QFA','Australia'),(10,'Air Canada','ACA','Canada');
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `AirportID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Code` char(3) NOT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AirportID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES (1,'John F. Kennedy International Airport','JFK','New York','USA'),(2,'Los Angeles International Airport','LAX','Los Angeles','USA'),(3,'Heathrow Airport','LHR','London','UK'),(4,'Charles de Gaulle Airport','CDG','Paris','France'),(5,'Dubai International Airport','DXB','Dubai','UAE'),(6,'Tokyo Haneda Airport','HND','Tokyo','Japan'),(7,'Frankfurt Airport','FRA','Frankfurt','Germany'),(8,'Singapore Changi Airport','SIN','Singapore','Singapore'),(9,'Sydney Kingsford Smith Airport','SYD','Sydney','Australia'),(10,'Toronto Pearson International Airport','YYZ','Toronto','Canada');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `PassengerID` int NOT NULL,
  `FlightID` int NOT NULL,
  `BookingDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SeatNumber` varchar(5) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,1,'2024-11-17 00:43:42','12A',500.00),(2,2,2,'2024-11-17 00:43:42','14B',450.00),(3,3,3,'2024-11-17 00:43:42','16C',400.00),(4,4,4,'2024-11-17 00:43:42','10D',550.00),(5,5,5,'2024-11-17 00:43:42','18E',600.00),(6,6,6,'2024-11-17 00:43:42','20F',650.00),(7,7,7,'2024-11-17 00:43:42','11A',700.00),(8,8,8,'2024-11-17 00:43:42','13B',480.00),(9,9,9,'2024-11-17 00:43:42','15C',520.00),(10,10,10,'2024-11-17 00:43:42','17D',470.00);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `FlightID` int NOT NULL AUTO_INCREMENT,
  `AirlineID` int NOT NULL,
  `FlightNumber` varchar(10) NOT NULL,
  `DepartureAirportID` int NOT NULL,
  `ArrivalAirportID` int NOT NULL,
  `DepartureTime` datetime NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `PlaneID` int NOT NULL,
  PRIMARY KEY (`FlightID`),
  KEY `AirlineID` (`AirlineID`),
  KEY `DepartureAirportID` (`DepartureAirportID`),
  KEY `ArrivalAirportID` (`ArrivalAirportID`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`AirlineID`) REFERENCES `airlines` (`AirlineID`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`DepartureAirportID`) REFERENCES `airports` (`AirportID`),
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`ArrivalAirportID`) REFERENCES `airports` (`AirportID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,1,'AA100',1,2,'2024-11-18 08:00:00','2024-11-18 11:00:00',1),(2,2,'DL200',2,3,'2024-11-18 09:00:00','2024-11-18 13:00:00',2),(3,3,'BA300',3,4,'2024-11-18 10:00:00','2024-11-18 14:30:00',3),(4,4,'AF400',4,5,'2024-11-18 11:00:00','2024-11-18 16:00:00',4),(5,5,'EK500',5,6,'2024-11-18 12:00:00','2024-11-18 18:00:00',5),(6,6,'NH600',6,7,'2024-11-18 13:00:00','2024-11-18 19:30:00',6),(7,7,'LH700',7,8,'2024-11-18 14:00:00','2024-11-18 20:00:00',7),(8,8,'SQ800',8,9,'2024-11-18 15:00:00','2024-11-18 22:00:00',8),(9,9,'QF900',9,10,'2024-11-18 16:00:00','2024-11-18 23:00:00',9),(10,10,'AC1000',10,1,'2024-11-18 17:00:00','2024-11-19 01:00:00',10);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `PassportNumber` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `PassportNumber` (`PassportNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'John','Doe','P12345678','john.doe@example.com','+123456789'),(2,'Jane','Smith','P87654321','jane.smith@example.com','+987654321'),(3,'Robert','Johnson','P11223344','robert.johnson@example.com','+112233445'),(4,'Emily','Davis','P44332211','emily.davis@example.com','+443322114'),(5,'Michael','Brown','P55667788','michael.brown@example.com','+556677889'),(6,'Sarah','Wilson','P99887766','sarah.wilson@example.com','+998877665'),(7,'David','Clark','P66778899','david.clark@example.com','+667788990'),(8,'Laura','Martinez','P77889900','laura.martinez@example.com','+778899001'),(9,'James','Taylor','P33445566','james.taylor@example.com','+334455667'),(10,'Olivia','Harris','P44556677','olivia.harris@example.com','+445566778');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `PlaneID` int NOT NULL AUTO_INCREMENT,
  `Model` varchar(50) NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`PlaneID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'Boeing 737',180),(2,'Boeing 747',366),(3,'Airbus A320',186),(4,'Airbus A380',853),(5,'Embraer E195',120),(6,'Bombardier CRJ900',90),(7,'Boeing 787 Dreamliner',296),(8,'Airbus A350',325),(9,'ATR 72',70),(10,'Cessna Citation XLS',12);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `PRODUCTID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` text,
  `PRICE` decimal(10,2) NOT NULL,
  `QUANTITY` int DEFAULT '0',
  `SUPPLIERID` int DEFAULT NULL,
  `CREATEDAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATEDAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PRODUCTID`),
  KEY `SUPPLIERID` (`SUPPLIERID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SUPPLIERID`) REFERENCES `suppliers` (`SUPPLIERID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop','High-performance laptop',999.99,30,1,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(2,'Smartphone','Latest smartphone model',799.99,50,2,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(3,'Tablet','Portable tablet with high resolution',499.99,20,3,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(4,'Desk Chair','Ergonomic office chair',150.00,15,4,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(5,'Monitor','27-inch 4K monitor',300.00,25,1,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(6,'Keyboard','Mechanical keyboard',50.00,100,2,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(7,'Mouse','Wireless mouse',25.00,200,3,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(8,'Printer','All-in-one printer',120.00,10,4,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(9,'Router','High-speed internet router',60.00,35,5,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(10,'Headphones','Noise-cancelling headphones',80.00,50,1,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(11,'Speaker','Bluetooth speaker',45.00,60,2,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(12,'Power Bank','10000mAh power bank',20.00,75,3,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(13,'Webcam','HD webcam',35.00,40,4,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(14,'Flash Drive','128GB USB flash drive',15.00,150,5,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(15,'External Hard Drive','1TB external hard drive',80.00,20,1,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(16,'Smartwatch','Water-resistant smartwatch',150.00,30,2,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(17,'Drone','4K camera drone',500.00,5,3,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(18,'Fitness Tracker','Activity tracker with heart monitor',70.00,45,4,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(19,'TV','50-inch 4K Smart TV',400.00,8,5,'2024-10-27 18:59:52','2024-10-27 18:59:52'),(20,'Game Console','Popular gaming console',300.00,10,1,'2024-10-27 18:59:52','2024-10-27 18:59:52');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `RETURNID` int NOT NULL AUTO_INCREMENT,
  `RETURNDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `SALEID` int DEFAULT NULL,
  `USERID` int DEFAULT NULL,
  `PRODUCTID` int DEFAULT NULL,
  `REASON` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RETURNID`),
  KEY `SALEID` (`SALEID`),
  KEY `USERID` (`USERID`),
  KEY `PRODUCTID` (`PRODUCTID`),
  CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`SALEID`) REFERENCES `sales` (`SALEID`) ON DELETE SET NULL,
  CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`) ON DELETE SET NULL,
  CONSTRAINT `returns_ibfk_3` FOREIGN KEY (`PRODUCTID`) REFERENCES `products` (`PRODUCTID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,'2024-10-27 18:59:52',1,1,1,'Defective product'),(2,'2024-10-27 18:59:52',2,2,3,'Wrong item shipped'),(3,'2024-10-27 18:59:52',3,3,4,'Product damaged'),(4,'2024-10-27 18:59:52',4,4,5,'Changed mind'),(5,'2024-10-27 18:59:52',5,5,6,'Incorrect size'),(6,'2024-10-27 18:59:52',6,6,7,'Not as described'),(7,'2024-10-27 18:59:52',7,7,8,'Arrived late'),(8,'2024-10-27 18:59:52',8,8,9,'Duplicate order'),(9,'2024-10-27 18:59:52',9,9,10,'Better price elsewhere'),(10,'2024-10-27 18:59:52',10,10,11,'Didn\'t like the color');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SALEID` int NOT NULL AUTO_INCREMENT,
  `SALEDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USERID` int DEFAULT NULL,
  `TOTAL` decimal(10,2) NOT NULL,
  `PAYMENTMETHOD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SALEID`),
  KEY `USERID` (`USERID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2024-10-27 18:59:52',1,150.00,'Credit Card'),(2,'2024-10-27 18:59:52',2,999.99,'Credit Card'),(3,'2024-10-27 18:59:52',3,80.00,'PayPal'),(4,'2024-10-27 18:59:52',4,120.00,'Debit Card'),(5,'2024-10-27 18:59:52',5,300.00,'Credit Card'),(6,'2024-10-27 18:59:52',6,200.00,'Cash'),(7,'2024-10-27 18:59:52',7,350.00,'Credit Card'),(8,'2024-10-27 18:59:52',8,120.00,'Debit Card'),(9,'2024-10-27 18:59:52',9,75.00,'PayPal'),(10,'2024-10-27 18:59:52',10,45.00,'Cash');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SUPPLIERID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `CONTACTNAME` varchar(100) DEFAULT NULL,
  `CONTACTEMAIL` varchar(100) DEFAULT NULL,
  `CONTACTPHONE` varchar(15) DEFAULT NULL,
  `CREATEDAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SUPPLIERID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Tech Supplies Co.','Alice Smith','alice@techsupplies.com','+1234567890','2024-10-27 18:59:52'),(2,'Office Solutions Ltd.','Bob Johnson','bob@officesolutions.com','+2345678901','2024-10-27 18:59:52'),(3,'Gadget World','Charlie Brown','charlie@gadgetworld.com','+3456789012','2024-10-27 18:59:52'),(4,'Home Essentials','Diana White','diana@homeessentials.com','+4567890123','2024-10-27 18:59:52'),(5,'ElectroMart','Edward Green','edward@electromart.com','+5678901234','2024-10-27 18:59:52');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USERID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `FULLNAME` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CREATEDAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user01','user01@example.com','password01','John Doe','123 Elm St, Springfield','2024-10-27 18:59:52'),(2,'user02','user02@example.com','password02','Jane Smith','456 Oak St, Springfield','2024-10-27 18:59:52'),(3,'user03','user03@example.com','password03','Mary Johnson','789 Pine St, Springfield','2024-10-27 18:59:52'),(4,'user04','user04@example.com','password04','James Brown','321 Maple St, Springfield','2024-10-27 18:59:52'),(5,'user05','user05@example.com','password05','Patricia Green','654 Birch St, Springfield','2024-10-27 18:59:52'),(6,'user06','user06@example.com','password06','Michael White','987 Cedar St, Springfield','2024-10-27 18:59:52'),(7,'user07','user07@example.com','password07','Linda Davis','111 Walnut St, Springfield','2024-10-27 18:59:52'),(8,'user08','user08@example.com','password08','William Martinez','222 Cherry St, Springfield','2024-10-27 18:59:52'),(9,'user09','user09@example.com','password09','Barbara Clark','333 Chestnut St, Springfield','2024-10-27 18:59:52'),(10,'user10','user10@example.com','password10','Richard Lewis','444 Spruce St, Springfield','2024-10-27 18:59:52'),(11,'user11','user11@example.com','password11','Susan Walker','555 Redwood St, Springfield','2024-10-27 18:59:52'),(12,'user12','user12@example.com','password12','Joseph Hall','666 Cypress St, Springfield','2024-10-27 18:59:52'),(13,'user13','user13@example.com','password13','Karen Allen','777 Poplar St, Springfield','2024-10-27 18:59:52'),(14,'user14','user14@example.com','password14','Thomas Young','888 Fir St, Springfield','2024-10-27 18:59:52'),(15,'user15','user15@example.com','password15','Jessica Hernandez','999 Redwood St, Springfield','2024-10-27 18:59:52'),(16,'user16','user16@example.com','password16','Charles King','101 Ash St, Springfield','2024-10-27 18:59:52'),(17,'user17','user17@example.com','password17','Angela Wright','202 Magnolia St, Springfield','2024-10-27 18:59:52'),(18,'user18','user18@example.com','password18','Christopher Scott','303 Dogwood St, Springfield','2024-10-27 18:59:52'),(19,'user19','user19@example.com','password19','Karen Baker','404 Hickory St, Springfield','2024-10-27 18:59:52'),(20,'user20','user20@example.com','password20','Matthew Rivera','505 Alder St, Springfield','2024-10-27 18:59:52'),(21,'user21','user21@example.com','password21','Nancy Harris','606 Buckeye St, Springfield','2024-10-27 18:59:52'),(22,'user22','user22@example.com','password22','Larry Adams','707 Birch St, Springfield','2024-10-27 18:59:52'),(23,'user23','user23@example.com','password23','Sarah Rodriguez','808 Cherry St, Springfield','2024-10-27 18:59:52'),(24,'user24','user24@example.com','password24','Frank Nelson','909 Elm St, Springfield','2024-10-27 18:59:52'),(25,'user25','user25@example.com','password25','Lisa Carter','1010 Maple St, Springfield','2024-10-27 18:59:52'),(26,'user26','user26@example.com','password26','Steven Mitchell','1111 Oak St, Springfield','2024-10-27 18:59:52'),(27,'user27','user27@example.com','password27','Karen Perez','1212 Pine St, Springfield','2024-10-27 18:59:52'),(28,'user28','user28@example.com','password28','Edward Roberts','1313 Cedar St, Springfield','2024-10-27 18:59:52'),(29,'user29','user29@example.com','password29','Alice Turner','1414 Spruce St, Springfield','2024-10-27 18:59:52'),(30,'user30','user30@example.com','password30','Mark Phillips','1515 Fir St, Springfield','2024-10-27 18:59:52'),(31,'user31','user31@example.com','password31','Dorothy Campbell','1616 Redwood St, Springfield','2024-10-27 18:59:52'),(32,'user32','user32@example.com','password32','Donald Parker','1717 Ash St, Springfield','2024-10-27 18:59:52'),(33,'user33','user33@example.com','password33','Carol Evans','1818 Magnolia St, Springfield','2024-10-27 18:59:52'),(34,'user34','user34@example.com','password34','Jason Edwards','1919 Dogwood St, Springfield','2024-10-27 18:59:52'),(35,'user35','user35@example.com','password35','Betty Collins','2020 Buckeye St, Springfield','2024-10-27 18:59:52'),(36,'user36','user36@example.com','password36','Donald Murphy','2121 Birch St, Springfield','2024-10-27 18:59:52'),(37,'user37','user37@example.com','password37','Mary Rivera','2222 Elm St, Springfield','2024-10-27 18:59:52'),(38,'user38','user38@example.com','password38','Jennifer Sanchez','2323 Maple St, Springfield','2024-10-27 18:59:52'),(39,'user39','user39@example.com','password39','James Patterson','2424 Oak St, Springfield','2024-10-27 18:59:52'),(40,'user40','user40@example.com','password40','Robert Alexander','2525 Pine St, Springfield','2024-10-27 18:59:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-22 22:45:31
