-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DATABASE_NAME
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0ubuntu0.23.10.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_account`
--

LOCK TABLES `addon_account` WRITE;
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` VALUES
('bank_savings','Savings account',0),
('caution','caution',0),
('society_ambulance','EMS',1),
('society_banker','Bank',1),
('society_cardealer','Cardealer',1),
('society_fueler','fueler',1),
('society_mechanic','Mechanic',1),
('society_police','Police',1),
('society_tabac','Marlboro',1),
('society_taxi','Taxi',1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_account_data`
--

LOCK TABLES `addon_account_data` WRITE;
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` VALUES
(1,'society_cardealer',0,NULL),
(2,'society_police',0,NULL),
(3,'society_ambulance',0,NULL),
(4,'society_mechanic',0,NULL),
(5,'society_taxi',0,NULL),
(9,'society_banker',0,NULL),
(12,'society_tabac',0,NULL),
(13,'society_fueler',0,NULL),
(14,'bank_savings',0,'char1:45235a43bcb339f938051de54185ab81b22e6504'),
(15,'caution',0,'char1:45235a43bcb339f938051de54185ab81b22e6504'),
(16,'bank_savings',0,'char1:dc662c61602214ce199f5c5fc4acfce5d4212a46'),
(17,'caution',0,'char1:dc662c61602214ce199f5c5fc4acfce5d4212a46');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inventory`
--

LOCK TABLES `addon_inventory` WRITE;
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` VALUES
('society_ambulance','EMS',1),
('society_cardealer','Cardealer',1),
('society_fueler','fueler',1),
('society_mechanic','Mechanic',1),
('society_police','Police',1),
('society_tabac','Marlboro',1),
('society_taxi','Taxi',1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inventory_items`
--

LOCK TABLES `addon_inventory_items` WRITE;
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banking`
--

DROP TABLE IF EXISTS `banking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banking`
--

LOCK TABLES `banking` WRITE;
/*!40000 ALTER TABLE `banking` DISABLE KEYS */;
/*!40000 ALTER TABLE `banking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardealer_vehicles`
--

DROP TABLE IF EXISTS `cardealer_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardealer_vehicles`
--

LOCK TABLES `cardealer_vehicles` WRITE;
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codem_craft`
--

DROP TABLE IF EXISTS `codem_craft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codem_craft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `weaponname` varchar(50) DEFAULT NULL,
  `weapontime` varchar(50) DEFAULT NULL,
  `weaponlabel` varchar(50) DEFAULT NULL,
  `itemtime` varchar(50) DEFAULT NULL,
  `images` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codem_craft`
--

LOCK TABLES `codem_craft` WRITE;
/*!40000 ALTER TABLE `codem_craft` DISABLE KEYS */;
/*!40000 ALTER TABLE `codem_craft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore`
--

LOCK TABLES `datastore` WRITE;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` VALUES
('property','Property',0),
('society_ambulance','EMS',1),
('society_fueler','fueler',1),
('society_mechanic','Mechanic',1),
('society_police','Police',1),
('society_tabac','Marlboro',1),
('society_taxi','Taxi',1),
('user_ears','Ears',0),
('user_glasses','Glasses',0),
('user_helmet','Helmet',0),
('user_mask','Mask',0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore_data`
--

LOCK TABLES `datastore_data` WRITE;
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` VALUES
(1,'society_police',NULL,'{}'),
(2,'society_ambulance',NULL,'{}'),
(3,'society_mechanic',NULL,'{}'),
(4,'society_taxi',NULL,'{}'),
(5,'property',NULL,'{}'),
(6,'property',NULL,'{}'),
(7,'property',NULL,'{}'),
(8,'property',NULL,'{}'),
(9,'property',NULL,'{}'),
(10,'property',NULL,'{}'),
(16,'property',NULL,'{}'),
(17,'property',NULL,'{}'),
(18,'property',NULL,'{}'),
(19,'property',NULL,'{}'),
(20,'property',NULL,'{}'),
(21,'property',NULL,'{}'),
(22,'property',NULL,'{}'),
(23,'property',NULL,'{}'),
(24,'property',NULL,'{}'),
(25,'property',NULL,'{}'),
(26,'property',NULL,'{}'),
(27,'property',NULL,'{}'),
(28,'property',NULL,'{}'),
(29,'property',NULL,'{}'),
(30,'property',NULL,'{}'),
(31,'property',NULL,'{}'),
(32,'property',NULL,'{}'),
(33,'property',NULL,'{}'),
(34,'property',NULL,'{}'),
(35,'property',NULL,'{}'),
(36,'property',NULL,'{}'),
(37,'property',NULL,'{}'),
(38,'property',NULL,'{}'),
(39,'property',NULL,'{}'),
(40,'property',NULL,'{}'),
(41,'property',NULL,'{}'),
(42,'property',NULL,'{}'),
(43,'property',NULL,'{}'),
(44,'property',NULL,'{}'),
(45,'property',NULL,'{}'),
(46,'property',NULL,'{}'),
(47,'property',NULL,'{}'),
(48,'property',NULL,'{}'),
(49,'property',NULL,'{}'),
(50,'property',NULL,'{}'),
(51,'property',NULL,'{}'),
(52,'property',NULL,'{}'),
(53,'property',NULL,'{}'),
(54,'property',NULL,'{}'),
(55,'property',NULL,'{}'),
(56,'property',NULL,'{}'),
(57,'property',NULL,'{}'),
(58,'property',NULL,'{}'),
(59,'property',NULL,'{}'),
(60,'property',NULL,'{}'),
(61,'property',NULL,'{}'),
(62,'property',NULL,'{}'),
(63,'property',NULL,'{}'),
(64,'property',NULL,'{}'),
(65,'property',NULL,'{}'),
(66,'property',NULL,'{}'),
(67,'property',NULL,'{}'),
(68,'property',NULL,'{}'),
(69,'property',NULL,'{}'),
(70,'property',NULL,'{}'),
(71,'property',NULL,'{}'),
(72,'property',NULL,'{}'),
(73,'property',NULL,'{}'),
(74,'property',NULL,'{}'),
(75,'property',NULL,'{}'),
(76,'property',NULL,'{}'),
(77,'property',NULL,'{}'),
(78,'property',NULL,'{}'),
(79,'property',NULL,'{}'),
(80,'property',NULL,'{}'),
(81,'property',NULL,'{}'),
(82,'property',NULL,'{}'),
(83,'property',NULL,'{}'),
(84,'property',NULL,'{}'),
(85,'property',NULL,'{}'),
(86,'property',NULL,'{}'),
(87,'society_tabac',NULL,'\'{}\''),
(88,'property',NULL,'{}'),
(89,'property',NULL,'{}'),
(90,'property',NULL,'{}'),
(91,'property',NULL,'{}'),
(92,'property',NULL,'{}'),
(93,'property',NULL,'{}'),
(94,'property',NULL,'{}'),
(95,'society_fueler',NULL,'\'{}\''),
(96,'property',NULL,'{}'),
(97,'property',NULL,'{}'),
(98,'property',NULL,'{}'),
(99,'property',NULL,'{}'),
(100,'property',NULL,'{}'),
(101,'property',NULL,'{}'),
(102,'property',NULL,'{}'),
(103,'property',NULL,'{}'),
(104,'property','char1:45235a43bcb339f938051de54185ab81b22e6504','{}'),
(105,'user_ears','char1:45235a43bcb339f938051de54185ab81b22e6504','{}'),
(106,'user_glasses','char1:45235a43bcb339f938051de54185ab81b22e6504','{}'),
(107,'user_helmet','char1:45235a43bcb339f938051de54185ab81b22e6504','{}'),
(108,'user_mask','char1:45235a43bcb339f938051de54185ab81b22e6504','{}'),
(109,'user_ears','char1:dc662c61602214ce199f5c5fc4acfce5d4212a46','{}'),
(110,'user_mask','char1:dc662c61602214ce199f5c5fc4acfce5d4212a46','{}'),
(111,'user_helmet','char1:dc662c61602214ce199f5c5fc4acfce5d4212a46','{}'),
(112,'property','char1:dc662c61602214ce199f5c5fc4acfce5d4212a46','{}'),
(113,'user_glasses','char1:dc662c61602214ce199f5c5fc4acfce5d4212a46','{}'),
(114,'property',NULL,'{}'),
(115,'property',NULL,'{}'),
(116,'property',NULL,'{}'),
(117,'property',NULL,'{}'),
(118,'property',NULL,'{}'),
(119,'property',NULL,'{}'),
(120,'property',NULL,'{}'),
(121,'property',NULL,'{}'),
(122,'property',NULL,'{}'),
(123,'property',NULL,'{}'),
(124,'property',NULL,'{}'),
(125,'property',NULL,'{}'),
(126,'property',NULL,'{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpkeybinds`
--

DROP TABLE IF EXISTS `dpkeybinds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpkeybinds`
--

LOCK TABLES `dpkeybinds` WRITE;
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
INSERT INTO `dpkeybinds` VALUES
('license:45235a43bcb339f938051de54185ab81b22e6504','num4','','num5','','num6','','num7','','num8','','num9',''),
('license:7514054a240a022f1a9e034e8f382d1d89eba226','num4','','num5','','num6','','num7','','num8','','num9',''),
('license:dc662c61602214ce199f5c5fc4acfce5d4212a46','num4','','num5','','num6','','num7','','num8','','num9',''),
('license:dfadbf238b0a9a074b7b5cf78c2def144e8a79c5','num4','','num5','','num6','','num7','','num8','','num9','');
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_types`
--

LOCK TABLES `fine_types` WRITE;
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` VALUES
(1,'Misuse of a horn',30,0),
(2,'Illegally Crossing a continuous Line',40,0),
(3,'Driving on the wrong side of the road',250,0),
(4,'Illegal U-Turn',250,0),
(5,'Illegally Driving Off-road',170,0),
(6,'Refusing a Lawful Command',30,0),
(7,'Illegally Stopping a Vehicle',150,0),
(8,'Illegal Parking',70,0),
(9,'Failing to Yield to the right',70,0),
(10,'Failure to comply with Vehicle Information',90,0),
(11,'Failing to stop at a Stop Sign ',105,0),
(12,'Failing to stop at a Red Light',130,0),
(13,'Illegal Passing',100,0),
(14,'Driving an illegal Vehicle',100,0),
(15,'Driving without a License',1500,0),
(16,'Hit and Run',800,0),
(17,'Exceeding Speeds Over < 5 mph',90,0),
(18,'Exceeding Speeds Over 5-15 mph',120,0),
(19,'Exceeding Speeds Over 15-30 mph',180,0),
(20,'Exceeding Speeds Over > 30 mph',300,0),
(21,'Impeding traffic flow',110,1),
(22,'Public Intoxication',90,1),
(23,'Disorderly conduct',90,1),
(24,'Obstruction of Justice',130,1),
(25,'Insults towards Civilans',75,1),
(26,'Disrespecting of an LEO',110,1),
(27,'Verbal Threat towards a Civilan',90,1),
(28,'Verbal Threat towards an LEO',150,1),
(29,'Providing False Information',250,1),
(30,'Attempt of Corruption',1500,1),
(31,'Brandishing a weapon in city Limits',120,2),
(32,'Brandishing a Lethal Weapon in city Limits',300,2),
(33,'No Firearms License',600,2),
(34,'Possession of an Illegal Weapon',700,2),
(35,'Possession of Burglary Tools',300,2),
(36,'Grand Theft Auto',1800,2),
(37,'Intent to Sell/Distrube of an illegal Substance',1500,2),
(38,'Frabrication of an Illegal Substance',1500,2),
(39,'Possession of an Illegal Substance ',650,2),
(40,'Kidnapping of a Civilan',1500,2),
(41,'Kidnapping of an LEO',2000,2),
(42,'Robbery',650,2),
(43,'Armed Robbery of a Store',650,2),
(44,'Armed Robbery of a Bank',1500,2),
(45,'Assault on a Civilian',2000,3),
(46,'Assault of an LEO',2500,3),
(47,'Attempt of Murder of a Civilian',3000,3),
(48,'Attempt of Murder of an LEO',5000,3),
(49,'Murder of a Civilian',10000,3),
(50,'Murder of an LEO',30000,3),
(51,'Involuntary manslaughter',1800,3),
(52,'Fraud',2000,2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES
('alive_chicken','Living chicken',1,0,1),
('banana_kush_bag','Cannabis banana kush',1,0,1),
('banana_kush_joint','joint banana kush',1,0,1),
('bandage','Bandage',2,0,1),
('blowpipe','Blowtorch',2,0,1),
('blue_dream_bag','Cannabis blue dream',1,0,1),
('blue_dream_joint','joint blue dream',1,0,1),
('bread','Bread',1,0,1),
('cannabis','Cannabis',3,0,1),
('carokit','Body Kit',3,0,1),
('carotool','Tools',2,0,1),
('clothe','Cloth',1,0,1),
('copper','Copper',1,0,1),
('cubancigar','Cigarre cubain',1,0,1),
('cutted_wood','Cut wood',1,0,1),
('davidoffcigar','Cigarre Davidoff',1,0,1),
('diamond','Diamond',1,0,1),
('essence','Gas',1,0,1),
('fabric','Fabric',1,0,1),
('fish','Fish',1,0,1),
('fixkit','Repair Kit',3,0,1),
('fixtool','Repair Tools',2,0,1),
('gazbottle','Gas Bottle',2,0,1),
('gitanes','Cigarettes Yukon',30,0,1),
('gold','Gold',1,0,1),
('iron','Iron',1,0,1),
('lighter','Briquet',1,0,1),
('malbora','Cigarettes Redwood',30,0,1),
('marijuana','Marijuana',2,0,1),
('marlboro','Marlboro',1,0,1),
('marlborocig','Marlboro',1,0,1),
('medikit','Medikit',2,0,1),
('og_kush_bag','Cannabis og kush',1,0,1),
('og_kush_joint','joint og kush',1,0,1),
('packaged_chicken','Chicken fillet',1,0,1),
('packaged_plank','Packaged wood',1,0,1),
('petrol','Oil',1,0,1),
('petrol_raffin','Processed oil',1,0,1),
('phone','Phone',1,0,1),
('purple_haze_bag','Cannabis purple haze',1,0,1),
('purple_haze_joint','joint purple haze',1,0,1),
('radio','Radio',1,0,1),
('redw','RedWood',1,0,1),
('redwcig','Redwood',1,0,1),
('scrapmetal','Ferraille',30,0,1),
('slaughtered_chicken','Slaughtered chicken',1,0,1),
('stone','Stone',1,0,1),
('tabacblond','Tabac Blond',1,0,1),
('tabacblondsec','Tabac Blond Séché',1,0,1),
('tabacbrun','Tabac Brun',1,0,1),
('tabacbrunsec','Tabac Brun Séché',1,0,1),
('washed_stone','Washed stone',1,0,1),
('water','Water',1,0,1),
('wood','Wood',1,0,1),
('wool','Wool',1,0,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) DEFAULT 0,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_grades`
--

LOCK TABLES `job_grades` WRITE;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` VALUES
(1,'unemployed',0,'unemployed','Unemployed',0,'{}','{}'),
(2,'police',0,'recruit','Recruit',0,'{}','{}'),
(3,'police',1,'officer','Officer',0,'{}','{}'),
(4,'police',2,'sergeant','Sergeant',0,'{}','{}'),
(5,'police',3,'lieutenant','Lieutenant',0,'{}','{}'),
(6,'police',4,'boss','Captain',0,'{}','{}'),
(11,'cardealer',0,'recruit','Recruit',0,'{}','{}'),
(12,'cardealer',1,'novice','Novice',0,'{}','{}'),
(13,'cardealer',2,'experienced','Experienced',0,'{}','{}'),
(14,'cardealer',3,'boss','Boss',0,'{}','{}'),
(15,'lumberjack',0,'employee','Employee',0,'{}','{}'),
(16,'fisherman',0,'employee','Employee',0,'{}','{}'),
(18,'reporter',0,'employee','Employee',0,'{}','{}'),
(19,'tailor',0,'employee','Employee',0,'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}','{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(20,'miner',0,'employee','Employee',0,'{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}','{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}'),
(21,'slaughterer',0,'employee','Employee',0,'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}','{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(22,'ambulance',0,'ambulance','Jr. EMT',0,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(23,'ambulance',1,'doctor','EMT',0,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(24,'ambulance',2,'chief_doctor','Sr. EMT',0,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(25,'ambulance',3,'boss','EMT Supervisor',0,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(26,'mechanic',0,'recrue','Recruit',0,'{}','{}'),
(27,'mechanic',1,'novice','Novice',0,'{}','{}'),
(28,'mechanic',2,'experimente','Experienced',0,'{}','{}'),
(29,'mechanic',3,'chief','Leader',0,'{}','{}'),
(30,'mechanic',4,'boss','Boss',0,'{}','{}'),
(31,'taxi',0,'recrue','Recruit',0,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(32,'taxi',1,'novice','Cabby',0,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(33,'taxi',2,'experimente','Experienced',0,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(34,'taxi',3,'uber','Uber Cabby',0,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(35,'taxi',4,'boss','Lead Cabby',0,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(36,'banker',0,'advisor','Consultant',0,'{}','{}'),
(37,'banker',1,'banker','Banker',0,'{}','{}'),
(38,'banker',2,'business_banker','Investment banker',0,'{}','{}'),
(39,'banker',3,'trader','Broker',0,'{}','{}'),
(40,'banker',4,'boss','Boss',0,'{}','{}'),
(41,'tabac',0,'recrue','Tabagiste Marlboro',0,'{}','{}'),
(42,'tabac',1,'gerant','Gérant Marlboro',0,'{}','{}'),
(43,'tabac',2,'boss','Patron Marlboro',0,'{}','{}'),
(44,'fueler',0,'recrue','Intérimaire',0,'{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}','{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(45,'fueler',1,'novice','Chef équipe',0,'{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}','{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(46,'fueler',2,'cdisenior','Adjoint',0,'{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}','{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(47,'fueler',3,'boss','Patron',0,'{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}','{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":13,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES
('ambulance','EMS',0),
('banker','Banker',0),
('cardealer','Cardealer',0),
('fisherman','Fisherman',0),
('fueler','fueler',0),
('lumberjack','Lumberjack',0),
('mechanic','Mechanic',0),
('miner','Miner',0),
('police','LSPD',0),
('reporter','Reporter',0),
('slaughterer','Butcher',0),
('tabac','RedWood inc',0),
('tailor','Tailor',0),
('taxi','Taxi',0),
('unemployed','Chômage',0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_skills`
--

DROP TABLE IF EXISTS `lab_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) NOT NULL,
  `skill_name` varchar(100) NOT NULL,
  `skillValue_1` varchar(50) NOT NULL,
  `skillValue_2` varchar(50) NOT NULL,
  `skillValue_3` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_skills`
--

LOCK TABLES `lab_skills` WRITE;
/*!40000 ALTER TABLE `lab_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES
('boat','Boat License'),
('dmv','Driving Permit'),
('drive','Drivers License'),
('drive_bike','Motorcycle License'),
('drive_truck','Commercial Drivers License'),
('weapon','Weapon License'),
('weed_processing','Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multicharacter_slots`
--

DROP TABLE IF EXISTS `multicharacter_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multicharacter_slots`
--

LOCK TABLES `multicharacter_slots` WRITE;
/*!40000 ALTER TABLE `multicharacter_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `multicharacter_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_vehicles`
--

DROP TABLE IF EXISTS `owned_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `mileage` float DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owned_vehicles`
--

LOCK TABLES `owned_vehicles` WRITE;
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ox_doorlock`
--

DROP TABLE IF EXISTS `ox_doorlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ox_doorlock`
--

LOCK TABLES `ox_doorlock` WRITE;
/*!40000 ALTER TABLE `ox_doorlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ox_doorlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ox_inventory`
--

DROP TABLE IF EXISTS `ox_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ox_inventory`
--

LOCK TABLES `ox_inventory` WRITE;
/*!40000 ALTER TABLE `ox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ox_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rented_vehicles`
--

DROP TABLE IF EXISTS `rented_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rented_vehicles`
--

LOCK TABLES `rented_vehicles` WRITE;
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_moneywash`
--

LOCK TABLES `society_moneywash` WRITE;
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_user_statistics`
--

DROP TABLE IF EXISTS `tp_user_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_user_statistics` (
  `identifier` varchar(46) NOT NULL,
  `name` longtext DEFAULT NULL,
  `deaths` int(11) DEFAULT 0,
  `zombie_kills` int(11) DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_user_statistics`
--

LOCK TABLES `tp_user_statistics` WRITE;
/*!40000 ALTER TABLE `tp_user_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_user_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasure`
--

DROP TABLE IF EXISTS `treasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treasure` (
  `identifier` varchar(46) DEFAULT NULL,
  `treasurename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasure`
--

LOCK TABLES `treasure` WRITE;
/*!40000 ALTER TABLE `treasure` DISABLE KEYS */;
/*!40000 ALTER TABLE `treasure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_licenses`
--

LOCK TABLES `user_licenses` WRITE;
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT '{"x":286.048340,"y":-1350.949462,"z":24.528198}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT 5555,
  `ownedskills` longtext NOT NULL DEFAULT '{}',
  `skillsinfo` longtext NOT NULL DEFAULT '{"skillpoints":0,"skillxp":0,"lastxp":1000,"currentlevel":0}',
  `craftxp` int(11) DEFAULT 0,
  `skills` longtext DEFAULT NULL,
  `rp_xp` int(11) NOT NULL DEFAULT 0,
  `rp_rank` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
('char1:45235a43bcb339f938051de54185ab81b22e6504','{\"money\":1762,\"bank\":0,\"black_money\":0}','admin','[{\"name\":\"scrap_aluminium\",\"count\":11,\"slot\":1},{\"name\":\"spring\",\"count\":6,\"slot\":2},{\"metadata\":{\"durability\":0,\"components\":[]},\"name\":\"WEAPON_KNIFE\",\"count\":1,\"slot\":3},{\"name\":\"medikit\",\"count\":2,\"slot\":4},{\"name\":\"wood_scrap\",\"count\":3,\"slot\":5},{\"name\":\"scrapmetal\",\"count\":4,\"slot\":6},{\"name\":\"copper\",\"count\":6,\"slot\":7},{\"name\":\"gas\",\"count\":2,\"slot\":8},{\"name\":\"screw\",\"count\":8,\"slot\":9},{\"name\":\"money\",\"count\":1762,\"slot\":10},{\"name\":\"radio\",\"count\":1,\"slot\":11},{\"name\":\"burger\",\"count\":5,\"slot\":12},{\"name\":\"cola\",\"count\":5,\"slot\":13},{\"name\":\"gunpowder\",\"count\":8,\"slot\":14},{\"name\":\"iron\",\"count\":8,\"slot\":15},{\"name\":\"cubancigar\",\"count\":2,\"slot\":16},{\"name\":\"radio\",\"count\":1,\"slot\":17},{\"name\":\"fixkit\",\"count\":8,\"slot\":18},{\"name\":\"bread\",\"count\":8,\"slot\":19},{\"name\":\"marlboro\",\"count\":2,\"slot\":20},{\"name\":\"marlborocig\",\"count\":15,\"slot\":21},{\"name\":\"weaponparts\",\"count\":8,\"slot\":22},{\"name\":\"lighter\",\"count\":4,\"slot\":23},{\"name\":\"bandage\",\"count\":2,\"slot\":24},{\"metadata\":{\"size\":[5,1000],\"container\":\"KVE1708297845\"},\"name\":\"paperbag\",\"count\":1,\"slot\":25},{\"name\":\"water\",\"count\":5,\"slot\":26},{\"name\":\"ammo-9\",\"count\":3,\"slot\":27},{\"name\":\"redw\",\"count\":1,\"slot\":28},{\"name\":\"rolling_paper\",\"count\":1,\"slot\":29},{\"name\":\"marijuana\",\"count\":2,\"slot\":30},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_FLASHLIGHT\",\"count\":1,\"slot\":31},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_SWITCHBLADE\",\"count\":1,\"slot\":32},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_BAT\",\"count\":1,\"slot\":33},{\"metadata\":{\"serial\":\"714188ROR574460\",\"components\":[],\"ammo\":0,\"durability\":100,\"registered\":\"Eliot Beringer\"},\"name\":\"WEAPON_FIREWORK\",\"count\":1,\"slot\":34},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_BALL\",\"count\":1,\"slot\":35},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_SMOKEGRENADE\",\"count\":1,\"slot\":36},{\"metadata\":{\"durability\":100,\"components\":[]},\"name\":\"WEAPON_MOLOTOV\",\"count\":1,\"slot\":37},{\"name\":\"radio\",\"count\":1,\"slot\":38}]','unemployed',0,'[]','{\"armor\":0,\"health\":130}','{\"z\":31.908447265625,\"y\":-1371.75830078125,\"x\":298.6681213378906}','Eliot','Beringer','01/05/1990','m',220,'{\"decals_2\":0,\"tshirt_1\":15,\"bodyb_4\":100,\"sun_2\":100,\"hair_color_1\":0,\"bags_2\":0,\"nose_6\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"torso_2\":19,\"beard_1\":1,\"jaw_1\":0,\"eye_color\":5,\"shoes_2\":3,\"age_1\":255,\"beard_3\":0,\"cheeks_3\":0,\"mask_2\":2,\"chest_1\":0,\"lefthand_2\":0,\"cheeks_1\":0,\"bproof_2\":0,\"lip_thickness\":0,\"chest_3\":0,\"lefthand_1\":-1,\"beard_2\":100,\"ears_1\":0,\"eye_squint\":34,\"makeup_3\":255,\"blush_2\":100,\"arms_2\":0,\"torso_1\":373,\"pants_1\":86,\"moles_2\":100,\"nose_4\":0,\"arms\":26,\"neckarm_1\":0,\"chest_4\":0,\"lipstick_3\":0,\"helmet_2\":0,\"sun_1\":255,\"cheeks_2\":0,\"complexion_1\":255,\"chin_3\":0,\"ears_2\":0,\"blemishes_2\":100,\"mask_1\":4,\"neckarm_2\":0,\"bags_1\":0,\"glasses_2\":1,\"blemishes_1\":255,\"bodyb_1\":255,\"chin_1\":0,\"nose_2\":0,\"eyebrows_6\":0,\"righthand_2\":0,\"lipstick_1\":255,\"lipstick_4\":0,\"dad\":2,\"bodyb_3\":255,\"pants_2\":14,\"chin_13\":0,\"nose_1\":-100,\"neck_thickness\":0,\"makeup_1\":255,\"age_2\":100,\"eyebrows_5\":0,\"nose_5\":0,\"face_md_weight\":100,\"eyebrows_3\":0,\"eyebrows_1\":0,\"bodyb_2\":100,\"helmet_1\":-1,\"glasses_1\":1,\"moles_1\":255,\"lipstick_2\":100,\"blush_3\":0,\"nose_3\":0,\"mom\":35,\"hair_1\":50,\"shoes_1\":12,\"hair_2\":0,\"righthand_1\":-1,\"makeup_2\":100,\"beard_4\":0,\"makeup_4\":255,\"makeup_type\":0,\"blush_1\":255,\"eyebrows_2\":100,\"jaw_2\":0,\"chest_2\":100,\"complexion_2\":100,\"decals_1\":0,\"eyebrows_4\":0,\"chin_2\":0,\"sex\":0,\"bproof_1\":0,\"skin_md_weight\":90,\"chin_4\":0}','[{\"val\":0,\"name\":\"drunk\",\"percent\":0.0},{\"val\":298300,\"name\":\"hunger\",\"percent\":29.83},{\"val\":473725,\"name\":\"thirst\",\"percent\":47.3725},{\"val\":300000,\"name\":\"stress\",\"percent\":30.0}]',0,4,0,NULL,'2024-02-18 20:43:55','2024-02-19 02:24:45',NULL,5555,'[\"StarterSkill\"]','{\"skillpoints\":2,\"currentlevel\":2,\"skillxp\":1790,\"lastxp\":2500}',0,'{\"Wheelie\":{\"Stat\":\"MP0_WHEELIE_ABILITY\",\"Current\":0,\"RemoveAmount\":-0.2},\"Shooting\":{\"Stat\":\"MP0_SHOOTING_ABILITY\",\"Current\":0,\"RemoveAmount\":-0.1},\"Stamina\":{\"Stat\":\"MP0_STAMINA\",\"Current\":0,\"RemoveAmount\":-0.5},\"Strength\":{\"Stat\":\"MP0_STRENGTH\",\"Current\":6.2999999999999,\"RemoveAmount\":-0.3},\"Lung Capacity\":{\"Stat\":\"MP0_LUNG_CAPACITY\",\"Current\":0,\"RemoveAmount\":-0.1},\"Driving\":{\"Stat\":\"MP0_DRIVING_ABILITY\",\"Current\":0,\"RemoveAmount\":-0.5}}',11350,6),
('char1:dc662c61602214ce199f5c5fc4acfce5d4212a46','{\"bank\":0,\"money\":1638,\"black_money\":0}','user','[{\"name\":\"fixkit\",\"slot\":1,\"count\":1},{\"name\":\"money\",\"slot\":2,\"count\":1638},{\"name\":\"marlboro\",\"slot\":3,\"count\":2},{\"name\":\"ammo-9\",\"slot\":4,\"count\":1},{\"name\":\"marijuana\",\"slot\":5,\"count\":2},{\"name\":\"lighter\",\"slot\":6,\"count\":2},{\"name\":\"tosti\",\"slot\":7,\"count\":1},{\"metadata\":{\"size\":[5,1000],\"container\":\"UBE1708293411\"},\"name\":\"paperbag\",\"slot\":8,\"count\":1},{\"metadata\":{\"size\":[5,1000],\"container\":\"MXC1708293411\"},\"name\":\"paperbag\",\"slot\":9,\"count\":1},{\"name\":\"screw\",\"slot\":10,\"count\":2},{\"name\":\"copper\",\"slot\":15,\"count\":2}]','unemployed',0,'[]','{\"armor\":0,\"health\":200}','{\"y\":-1444.0087890625,\"x\":295.3318786621094,\"z\":29.920166015625}','Peter','Ohmson','12/07/1992','m',122,'{\"hair_color_2\":0,\"face_md_weight\":20,\"makeup_type\":0,\"shoes_2\":2,\"skin_md_weight\":50,\"righthand_2\":0,\"chest_1\":0,\"hair_1\":0,\"lipstick_3\":0,\"nose_3\":0,\"hair_2\":0,\"chin_2\":0,\"chin_4\":0,\"arms\":4,\"eyebrows_5\":0,\"bags_1\":0,\"bproof_2\":0,\"sex\":0,\"pants_2\":2,\"nose_6\":0,\"blush_3\":0,\"blush_2\":100,\"nose_4\":0,\"eye_squint\":0,\"age_1\":255,\"lefthand_2\":0,\"eyebrows_6\":-10,\"blush_1\":255,\"tshirt_1\":15,\"neckarm_2\":0,\"eyebrows_4\":0,\"hair_color_1\":0,\"cheeks_2\":0,\"arms_2\":0,\"mom\":40,\"blemishes_2\":100,\"neckarm_1\":0,\"nose_2\":0,\"bproof_1\":0,\"moles_1\":255,\"ears_1\":-1,\"makeup_1\":255,\"eye_color\":3,\"chest_4\":0,\"bodyb_4\":100,\"complexion_2\":100,\"nose_5\":0,\"cheeks_3\":0,\"bodyb_1\":255,\"righthand_1\":-1,\"ears_2\":0,\"glasses_2\":2,\"bags_2\":0,\"jaw_2\":0,\"lipstick_1\":255,\"jaw_1\":0,\"beard_3\":0,\"lip_thickness\":0,\"sun_1\":255,\"mask_1\":53,\"complexion_1\":255,\"glasses_1\":24,\"eyebrows_1\":0,\"helmet_1\":-1,\"eyebrows_3\":0,\"mask_2\":0,\"torso_2\":0,\"decals_1\":0,\"beard_1\":18,\"eyebrows_2\":100,\"pants_1\":69,\"lipstick_4\":0,\"lefthand_1\":-1,\"neck_thickness\":0,\"chin_1\":0,\"shoes_1\":1,\"dad\":8,\"bodyb_2\":100,\"chest_2\":100,\"makeup_3\":255,\"tshirt_2\":0,\"nose_1\":0,\"lipstick_2\":100,\"makeup_2\":100,\"sun_2\":100,\"torso_1\":57,\"age_2\":100,\"blemishes_1\":255,\"beard_4\":0,\"helmet_2\":0,\"cheeks_1\":0,\"bodyb_3\":255,\"beard_2\":100,\"makeup_4\":255,\"chin_3\":0,\"chest_3\":0,\"decals_2\":0,\"moles_2\":100}','[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":998400,\"percent\":99.83999999999999},{\"name\":\"thirst\",\"val\":998800,\"percent\":99.88},{\"name\":\"stress\",\"val\":0,\"percent\":0.0}]',0,5,0,NULL,'2024-02-18 21:42:26','2024-02-18 21:57:55',NULL,5555,'{}','{\"currentlevel\":0,\"skillxp\":90,\"skillpoints\":0,\"lastxp\":1000}',0,'{\"Lung Capacity\":{\"Stat\":\"MP0_LUNG_CAPACITY\",\"RemoveAmount\":-0.1,\"Current\":0},\"Stamina\":{\"Stat\":\"MP0_STAMINA\",\"RemoveAmount\":-0.5,\"Current\":19.89999999999999},\"Shooting\":{\"Stat\":\"MP0_SHOOTING_ABILITY\",\"RemoveAmount\":-0.1,\"Current\":0},\"Driving\":{\"Stat\":\"MP0_DRIVING_ABILITY\",\"RemoveAmount\":-0.5,\"Current\":0},\"Strength\":{\"Stat\":\"MP0_STRENGTH\",\"RemoveAmount\":-0.3,\"Current\":12.09999999999999},\"Wheelie\":{\"Stat\":\"MP0_WHEELIE_ABILITY\",\"RemoveAmount\":-0.2,\"Current\":0}}',750,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_categories`
--

DROP TABLE IF EXISTS `vehicle_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_categories`
--

LOCK TABLES `vehicle_categories` WRITE;
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` VALUES
('compacts','Compacts'),
('coupes','Coupés'),
('motorcycles','Motos'),
('muscle','Muscle'),
('offroad','Off Road'),
('sedans','Sedans'),
('sports','Sports'),
('sportsclassics','Sports Classics'),
('super','Super'),
('suvs','SUVs'),
('vans','Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_sold`
--

DROP TABLE IF EXISTS `vehicle_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_sold`
--

LOCK TABLES `vehicle_sold` WRITE;
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES
('Adder','adder',900000,'super'),
('Akuma','AKUMA',7500,'motorcycles'),
('Alpha','alpha',60000,'sports'),
('Ardent','ardent',1150000,'sportsclassics'),
('Asea','asea',5500,'sedans'),
('Autarch','autarch',1955000,'super'),
('Avarus','avarus',18000,'motorcycles'),
('Bagger','bagger',13500,'motorcycles'),
('Baller','baller2',40000,'suvs'),
('Baller Sport','baller3',60000,'suvs'),
('Banshee','banshee',70000,'sports'),
('Banshee 900R','banshee2',255000,'super'),
('Bati 801','bati',12000,'motorcycles'),
('Bati 801RR','bati2',19000,'motorcycles'),
('Bestia GTS','bestiagts',55000,'sports'),
('BF400','bf400',6500,'motorcycles'),
('Bf Injection','bfinjection',16000,'offroad'),
('Bifta','bifta',12000,'offroad'),
('Bison','bison',45000,'vans'),
('Blade','blade',15000,'muscle'),
('Blazer','blazer',6500,'offroad'),
('Blazer Sport','blazer4',8500,'offroad'),
('blazer5','blazer5',1755600,'offroad'),
('Blista','blista',8000,'compacts'),
('BMX (velo)','bmx',160,'motorcycles'),
('Bobcat XL','bobcatxl',32000,'vans'),
('Brawler','brawler',45000,'offroad'),
('Brioso R/A','brioso',18000,'compacts'),
('Btype','btype',62000,'sportsclassics'),
('Btype Hotroad','btype2',155000,'sportsclassics'),
('Btype Luxe','btype3',85000,'sportsclassics'),
('Buccaneer','buccaneer',18000,'muscle'),
('Buccaneer Rider','buccaneer2',24000,'muscle'),
('Buffalo','buffalo',12000,'sports'),
('Buffalo S','buffalo2',20000,'sports'),
('Bullet','bullet',90000,'super'),
('Burrito','burrito3',19000,'vans'),
('Camper','camper',42000,'vans'),
('Carbonizzare','carbonizzare',75000,'sports'),
('Carbon RS','carbonrs',18000,'motorcycles'),
('Casco','casco',30000,'sportsclassics'),
('Cavalcade','cavalcade2',55000,'suvs'),
('Cheetah','cheetah',375000,'super'),
('Chimera','chimera',38000,'motorcycles'),
('Chino','chino',15000,'muscle'),
('Chino Luxe','chino2',19000,'muscle'),
('Cliffhanger','cliffhanger',9500,'motorcycles'),
('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),
('Cognoscenti','cognoscenti',55000,'sedans'),
('Comet','comet2',65000,'sports'),
('Comet 5','comet5',1145000,'sports'),
('Contender','contender',70000,'suvs'),
('Coquette','coquette',65000,'sports'),
('Coquette Classic','coquette2',40000,'sportsclassics'),
('Coquette BlackFin','coquette3',55000,'muscle'),
('Cruiser (velo)','cruiser',510,'motorcycles'),
('Cyclone','cyclone',1890000,'super'),
('Daemon','daemon',11500,'motorcycles'),
('Daemon High','daemon2',13500,'motorcycles'),
('Defiler','defiler',9800,'motorcycles'),
('Deluxo','deluxo',4721500,'sportsclassics'),
('Dominator','dominator',35000,'muscle'),
('Double T','double',28000,'motorcycles'),
('Dubsta','dubsta',45000,'suvs'),
('Dubsta Luxuary','dubsta2',60000,'suvs'),
('Bubsta 6x6','dubsta3',120000,'offroad'),
('Dukes','dukes',28000,'muscle'),
('Dune Buggy','dune',8000,'offroad'),
('Elegy','elegy2',38500,'sports'),
('Emperor','emperor',8500,'sedans'),
('Enduro','enduro',5500,'motorcycles'),
('Entity XF','entityxf',425000,'super'),
('Esskey','esskey',4200,'motorcycles'),
('Exemplar','exemplar',32000,'coupes'),
('F620','f620',40000,'coupes'),
('Faction','faction',20000,'muscle'),
('Faction Rider','faction2',30000,'muscle'),
('Faction XL','faction3',40000,'muscle'),
('Faggio','faggio',1900,'motorcycles'),
('Vespa','faggio2',2800,'motorcycles'),
('Felon','felon',42000,'coupes'),
('Felon GT','felon2',55000,'coupes'),
('Feltzer','feltzer2',55000,'sports'),
('Stirling GT','feltzer3',65000,'sportsclassics'),
('Fixter (velo)','fixter',225,'motorcycles'),
('FMJ','fmj',185000,'super'),
('Fhantom','fq2',17000,'suvs'),
('Fugitive','fugitive',12000,'sedans'),
('Furore GT','furoregt',45000,'sports'),
('Fusilade','fusilade',40000,'sports'),
('Gargoyle','gargoyle',16500,'motorcycles'),
('Gauntlet','gauntlet',30000,'muscle'),
('Gang Burrito','gburrito',45000,'vans'),
('Burrito','gburrito2',29000,'vans'),
('Glendale','glendale',6500,'sedans'),
('Grabger','granger',50000,'suvs'),
('Gresley','gresley',47500,'suvs'),
('GT 500','gt500',785000,'sportsclassics'),
('Guardian','guardian',45000,'offroad'),
('Hakuchou','hakuchou',31000,'motorcycles'),
('Hakuchou Sport','hakuchou2',55000,'motorcycles'),
('Hermes','hermes',535000,'muscle'),
('Hexer','hexer',12000,'motorcycles'),
('Hotknife','hotknife',125000,'muscle'),
('Huntley S','huntley',40000,'suvs'),
('Hustler','hustler',625000,'muscle'),
('Infernus','infernus',180000,'super'),
('Innovation','innovation',23500,'motorcycles'),
('Intruder','intruder',7500,'sedans'),
('Issi','issi2',10000,'compacts'),
('Jackal','jackal',38000,'coupes'),
('Jester','jester',65000,'sports'),
('Jester(Racecar)','jester2',135000,'sports'),
('Journey','journey',6500,'vans'),
('Kamacho','kamacho',345000,'offroad'),
('Khamelion','khamelion',38000,'sports'),
('Kuruma','kuruma',30000,'sports'),
('Landstalker','landstalker',35000,'suvs'),
('RE-7B','le7b',325000,'super'),
('Lynx','lynx',40000,'sports'),
('Mamba','mamba',70000,'sports'),
('Manana','manana',12800,'sportsclassics'),
('Manchez','manchez',5300,'motorcycles'),
('Massacro','massacro',65000,'sports'),
('Massacro(Racecar)','massacro2',130000,'sports'),
('Mesa','mesa',16000,'suvs'),
('Mesa Trail','mesa3',40000,'suvs'),
('Minivan','minivan',13000,'vans'),
('Monroe','monroe',55000,'sportsclassics'),
('The Liberator','monster',210000,'offroad'),
('Moonbeam','moonbeam',18000,'vans'),
('Moonbeam Rider','moonbeam2',35000,'vans'),
('Nemesis','nemesis',5800,'motorcycles'),
('Neon','neon',1500000,'sports'),
('Nightblade','nightblade',35000,'motorcycles'),
('Nightshade','nightshade',65000,'muscle'),
('9F','ninef',65000,'sports'),
('9F Cabrio','ninef2',80000,'sports'),
('Omnis','omnis',35000,'sports'),
('Oppressor','oppressor',3524500,'super'),
('Oracle XS','oracle2',35000,'coupes'),
('Osiris','osiris',160000,'super'),
('Panto','panto',10000,'compacts'),
('Paradise','paradise',19000,'vans'),
('Pariah','pariah',1420000,'sports'),
('Patriot','patriot',55000,'suvs'),
('PCJ-600','pcj',6200,'motorcycles'),
('Penumbra','penumbra',28000,'sports'),
('Pfister','pfister811',85000,'super'),
('Phoenix','phoenix',12500,'muscle'),
('Picador','picador',18000,'muscle'),
('Pigalle','pigalle',20000,'sportsclassics'),
('Prairie','prairie',12000,'compacts'),
('Premier','premier',8000,'sedans'),
('Primo Custom','primo2',14000,'sedans'),
('X80 Proto','prototipo',2500000,'super'),
('Radius','radi',29000,'suvs'),
('raiden','raiden',1375000,'sports'),
('Rapid GT','rapidgt',35000,'sports'),
('Rapid GT Convertible','rapidgt2',45000,'sports'),
('Rapid GT3','rapidgt3',885000,'sportsclassics'),
('Reaper','reaper',150000,'super'),
('Rebel','rebel2',35000,'offroad'),
('Regina','regina',5000,'sedans'),
('Retinue','retinue',615000,'sportsclassics'),
('Revolter','revolter',1610000,'sports'),
('riata','riata',380000,'offroad'),
('Rocoto','rocoto',45000,'suvs'),
('Ruffian','ruffian',6800,'motorcycles'),
('Ruiner 2','ruiner2',5745600,'muscle'),
('Rumpo','rumpo',15000,'vans'),
('Rumpo Trail','rumpo3',19500,'vans'),
('Sabre Turbo','sabregt',20000,'muscle'),
('Sabre GT','sabregt2',25000,'muscle'),
('Sanchez','sanchez',5300,'motorcycles'),
('Sanchez Sport','sanchez2',5300,'motorcycles'),
('Sanctus','sanctus',25000,'motorcycles'),
('Sandking','sandking',55000,'offroad'),
('Savestra','savestra',990000,'sportsclassics'),
('SC 1','sc1',1603000,'super'),
('Schafter','schafter2',25000,'sedans'),
('Schafter V12','schafter3',50000,'sports'),
('Scorcher (velo)','scorcher',280,'motorcycles'),
('Seminole','seminole',25000,'suvs'),
('Sentinel','sentinel',32000,'coupes'),
('Sentinel XS','sentinel2',40000,'coupes'),
('Sentinel3','sentinel3',650000,'sports'),
('Seven 70','seven70',39500,'sports'),
('ETR1','sheava',220000,'super'),
('Shotaro Concept','shotaro',320000,'motorcycles'),
('Slam Van','slamvan3',11500,'muscle'),
('Sovereign','sovereign',22000,'motorcycles'),
('Stinger','stinger',80000,'sportsclassics'),
('Stinger GT','stingergt',75000,'sportsclassics'),
('Streiter','streiter',500000,'sports'),
('Stretch','stretch',90000,'sedans'),
('Stromberg','stromberg',3185350,'sports'),
('Sultan','sultan',15000,'sports'),
('Sultan RS','sultanrs',65000,'super'),
('Super Diamond','superd',130000,'sedans'),
('Surano','surano',50000,'sports'),
('Surfer','surfer',12000,'vans'),
('T20','t20',300000,'super'),
('Tailgater','tailgater',30000,'sedans'),
('Tampa','tampa',16000,'muscle'),
('Drift Tampa','tampa2',80000,'sports'),
('Thrust','thrust',24000,'motorcycles'),
('Tri bike (velo)','tribike3',520,'motorcycles'),
('Trophy Truck','trophytruck',60000,'offroad'),
('Trophy Truck Limited','trophytruck2',80000,'offroad'),
('Tropos','tropos',40000,'sports'),
('Turismo R','turismor',350000,'super'),
('Tyrus','tyrus',600000,'super'),
('Vacca','vacca',120000,'super'),
('Vader','vader',7200,'motorcycles'),
('Verlierer','verlierer2',70000,'sports'),
('Vigero','vigero',12500,'muscle'),
('Virgo','virgo',14000,'muscle'),
('Viseris','viseris',875000,'sportsclassics'),
('Visione','visione',2250000,'super'),
('Voltic','voltic',90000,'super'),
('Voltic 2','voltic2',3830400,'super'),
('Voodoo','voodoo',7200,'muscle'),
('Vortex','vortex',9800,'motorcycles'),
('Warrener','warrener',4000,'sedans'),
('Washington','washington',9000,'sedans'),
('Windsor','windsor',95000,'coupes'),
('Windsor Drop','windsor2',125000,'coupes'),
('Woflsbane','wolfsbane',9000,'motorcycles'),
('XLS','xls',32000,'suvs'),
('Yosemite','yosemite',485000,'muscle'),
('Youga','youga',10800,'vans'),
('Youga Luxuary','youga2',14500,'vans'),
('Z190','z190',900000,'sportsclassics'),
('Zentorno','zentorno',1500000,'super'),
('Zion','zion',36000,'coupes'),
('Zion Cabrio','zion2',45000,'coupes'),
('Zombie','zombiea',9500,'motorcycles'),
('Zombie Luxuary','zombieb',12000,'motorcycles'),
('Z-Type','ztype',220000,'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--

LOCK TABLES `whitelist` WRITE;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-19  5:48:17
