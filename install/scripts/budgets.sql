-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: webdata.c5ead0upvfbe.us-west-2.rds.amazonaws.com    Database: budgets
-- ------------------------------------------------------
-- Server version	8.0.28

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Current Database: `budgets`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `budgets` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `budgets`;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_type` (
  `account_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_type_id` int DEFAULT NULL,
  `sub_account_id` int DEFAULT NULL,
  `account_name` varchar(80) DEFAULT NULL,
  `has_sub_acts` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`),
  KEY `account_type_id` (`account_type_id`),
  KEY `sub_account_id` (`sub_account_id`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`account_type_id`),
  CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`sub_account_id`) REFERENCES `sub_accounts` (`sub_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street1` varchar(80) DEFAULT NULL,
  `street2` varchar(80) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `prov_id` int DEFAULT NULL,
  `postal_code` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `city_id` (`city_id`),
  KEY `prov_id` (`prov_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `citys` (`city_id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`prov_id`) REFERENCES `prov` (`prov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(80) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `accountno` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`bank_id`),
  CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `budget_amnt` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`budget_id`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`budget_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citys`
--

DROP TABLE IF EXISTS `citys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citys` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `prov_id` int DEFAULT NULL,
  `city_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1739 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citys`
--

LOCK TABLES `citys` WRITE;
/*!40000 ALTER TABLE `citys` DISABLE KEYS */;
INSERT INTO `citys` VALUES (1,9,'Toronto'),(2,11,'Montréal'),(3,2,'Vancouver'),(4,1,'Calgary'),(5,1,'Edmonton'),(6,9,'Ottawa'),(7,9,'Mississauga'),(8,3,'Winnipeg'),(9,11,'Quebec city_name'),(10,9,'Hamilton'),(11,9,'Brampton'),(12,2,'Surrey'),(13,9,'Kitchener'),(14,11,'Laval'),(15,6,'Halifax'),(16,9,'London'),(17,2,'Victoria'),(18,9,'Markham'),(19,9,'St. Catharines'),(20,9,'Niagara Falls'),(21,9,'Vaughan'),(22,11,'Gatineau'),(23,9,'Windsor'),(24,12,'Saskatoon'),(25,11,'Longueuil'),(26,2,'Burnaby'),(27,12,'Regina'),(28,2,'Richmond'),(29,9,'Richmond Hill'),(30,9,'Oakville'),(31,9,'Burlington'),(32,9,'Barrie'),(33,9,'Oshawa'),(34,11,'Sherbrooke'),(35,11,'Saguenay'),(36,11,'Lévis'),(37,2,'Kelowna'),(38,2,'Abbotsford'),(39,2,'Coquitlam'),(40,11,'Trois-Rivières'),(41,9,'Guelph'),(42,9,'Cambridge'),(43,9,'Whitby'),(44,9,'Ajax'),(45,2,'Langley'),(46,2,'Saanich'),(47,11,'Terrebonne'),(48,9,'Milton'),(49,5,'St. John\'s'),(50,4,'Moncton'),(51,9,'Thunder Bay'),(52,4,'Dieppe'),(53,9,'Waterloo'),(54,2,'Delta'),(55,9,'Chatham'),(56,1,'Red Deer'),(57,2,'Kamloops'),(58,9,'Brantford'),(59,6,'Cape Breton'),(60,1,'Lethbridge'),(61,11,'Saint-Jean-sur-Richelieu'),(62,9,'Clarington'),(63,9,'Pickering'),(64,2,'Nanaimo'),(65,9,'Sudbury'),(66,2,'North Vancouver'),(67,11,'Brossard'),(68,11,'Repentigny'),(69,9,'Newmarket'),(70,2,'Chilliwack'),(71,2,'White Rock'),(72,2,'Maple Ridge'),(73,9,'Peterborough'),(74,9,'Kawartha Lakes'),(75,2,'Prince George'),(76,9,'Sault Ste. Marie'),(77,9,'Sarnia'),(78,1,'Wood Buffalo'),(79,2,'New Westminster'),(80,11,'Châteauguay'),(81,11,'Saint-Jérôme'),(82,11,'Drummondville'),(83,4,'Saint John'),(84,9,'Caledon'),(85,1,'St. Albert'),(86,11,'Granby'),(87,1,'Medicine Hat'),(88,1,'Grande Prairie'),(89,9,'St. Thomas'),(90,1,'Airdrie'),(91,9,'Halton Hills'),(92,11,'Saint-Hyacinthe'),(93,11,'Lac-Brome'),(94,2,'Port Coquitlam'),(95,4,'Fredericton'),(96,11,'Blainville'),(97,9,'Aurora'),(98,9,'Welland'),(99,9,'North Bay'),(100,11,'Beloeil'),(101,9,'Belleville'),(102,11,'Mirabel'),(103,11,'Shawinigan'),(104,11,'Dollard-des-Ormeaux'),(105,3,'Brandon'),(106,11,'Rimouski'),(107,9,'Cornwall'),(108,9,'Stouffville'),(109,9,'Georgina'),(110,11,'Victoriaville'),(111,2,'Vernon'),(112,2,'Duncan'),(113,11,'Saint-Eustache'),(114,9,'Quinte West'),(115,10,'Charlottetown'),(116,11,'Mascouche'),(117,2,'West Vancouver'),(118,11,'Salaberry-de-Valleyfield'),(119,11,'Rouyn-Noranda'),(120,9,'Timmins'),(121,11,'Sorel-Tracy'),(122,9,'New Tecumseth'),(123,9,'Woodstock'),(124,11,'Boucherville'),(125,2,'Mission'),(126,11,'Vaudreuil-Dorion'),(127,9,'Brant'),(128,9,'Lakeshore'),(129,9,'Innisfil'),(130,12,'Prince Albert'),(131,2,'Langford Station'),(132,9,'Bradford West Gwillimbury'),(133,2,'Campbell River'),(134,1,'Spruce Grove'),(135,12,'Moose Jaw'),(136,2,'Penticton'),(137,2,'Port Moody'),(138,9,'Leamington'),(139,2,'East Kelowna'),(140,11,'Côte-Saint-Luc'),(141,11,'Val-d’Or'),(142,9,'Owen Sound'),(143,9,'Stratford'),(144,12,'Lloydminster'),(145,11,'Pointe-Claire'),(146,9,'Orillia'),(147,11,'Alma'),(148,9,'Orangeville'),(149,9,'Fort Erie'),(150,9,'LaSalle'),(151,11,'Sainte-Julie'),(152,1,'Leduc'),(153,2,'North Cowichan'),(154,11,'Chambly'),(155,1,'Okotoks'),(156,11,'Sept-Îles'),(157,9,'Centre Wellington'),(158,11,'Saint-Constant'),(159,9,'Grimsby'),(160,11,'Boisbriand'),(161,5,'Conception Bay South'),(162,11,'Saint-Bruno-de-Montarville'),(163,11,'Sainte-Thérèse'),(164,1,'Cochrane'),(165,11,'Thetford Mines'),(166,2,'Courtenay'),(167,11,'Magog'),(168,13,'Whitehorse'),(169,9,'Woolwich'),(170,9,'Clarence-Rockland'),(171,1,'Fort Saskatchewan'),(172,9,'East Gwillimbury'),(173,9,'Lincoln'),(174,11,'La Prairie'),(175,9,'Tecumseh'),(176,5,'Mount Pearl Park'),(177,9,'Amherstburg'),(178,11,'Saint-Lambert'),(179,9,'Brockville'),(180,9,'Collingwood'),(181,9,'Scugog'),(182,9,'Kingsville'),(183,11,'Baie-Comeau'),(184,5,'Paradise'),(185,9,'Uxbridge'),(186,9,'Essa'),(187,11,'Candiac'),(188,9,'Oro-Medonte'),(189,11,'Varennes'),(190,9,'Strathroy-Caradoc'),(191,9,'Wasaga Beach'),(192,6,'New Glasgow'),(193,9,'Wilmot'),(194,9,'Essex'),(195,2,'Fort St. John'),(196,11,'Kirkland'),(197,11,'L’Assomption'),(198,11,'Westmount'),(199,11,'Saint-Lazare'),(200,1,'Chestermere'),(201,9,'Huntsville'),(202,5,'Corner Brook'),(203,4,'Riverview'),(204,1,'Lloydminster'),(205,11,'Joliette'),(206,7,'Yellowknife'),(207,2,'Squamish'),(208,11,'Mont-Royal'),(209,11,'Rivière-du-Loup'),(210,9,'Cobourg'),(211,2,'Cranbrook'),(212,11,'Beaconsfield'),(213,9,'Springwater'),(214,11,'Dorval'),(215,9,'Thorold'),(216,1,'Camrose'),(217,9,'South Frontenac'),(218,2,'Pitt Meadows'),(219,9,'Port Colborne'),(220,4,'Quispamsis'),(221,11,'Mont-Saint-Hilaire'),(222,4,'Bathurst'),(223,11,'Saint-Augustin-de-Desmaures'),(224,2,'Oak Bay'),(225,11,'Sainte-Marthe-sur-le-Lac'),(226,2,'Salmon Arm'),(227,2,'Port Alberni'),(228,2,'Esquimalt'),(229,11,'Deux-Montagnes'),(230,4,'Miramichi'),(231,9,'Niagara-on-the-Lake'),(232,11,'Saint-Lin--Laurentides'),(233,1,'Beaumont'),(234,9,'Middlesex Centre'),(235,6,'Inverness'),(236,1,'Stony Plain'),(237,9,'Petawawa'),(238,9,'Pelham'),(239,9,'Selwyn'),(240,9,'Loyalist'),(241,9,'Midland'),(242,2,'Colwood'),(243,2,'Central Saanich'),(244,11,'Sainte-Catherine'),(245,9,'Port Hope'),(246,11,'L’Ancienne-Lorette'),(247,11,'Saint-Basile-le-Grand'),(248,12,'Swift Current'),(249,4,'Edmundston'),(250,9,'Russell'),(251,9,'North Grenville'),(252,12,'Yorkton'),(253,4,'Tracadie'),(254,9,'Bracebridge'),(255,9,'Greater Napanee'),(256,9,'Tillsonburg'),(257,3,'Steinbach'),(258,3,'Hanover'),(259,2,'Terrace'),(260,3,'Springfield'),(261,11,'Gaspé'),(262,9,'Kenora'),(263,1,'Cold Lake'),(264,10,'Summerside'),(265,2,'Comox'),(266,1,'Sylvan Lake'),(267,11,'Pincourt'),(268,9,'West Lincoln'),(269,11,'Matane'),(270,1,'Brooks'),(271,11,'Sainte-Anne-des-Plaines'),(272,9,'West Nipissing / Nipissing Ouest'),(273,11,'Rosemère'),(274,11,'Mistassini'),(275,5,'Grand Falls'),(276,9,'Clearview'),(277,9,'St. Clair'),(278,1,'Canmore'),(279,12,'North Battleford'),(280,9,'Pembroke'),(281,11,'Mont-Laurier'),(282,1,'Strathmore'),(283,9,'Saugeen Shores'),(284,3,'Thompson'),(285,11,'Lavaltrie'),(286,1,'High River'),(287,9,'Severn'),(288,11,'Sainte-Sophie'),(289,11,'Saint-Charles-Borromée'),(290,3,'Portage La Prairie'),(291,9,'Thames Centre'),(292,9,'Mississippi Mills'),(293,2,'Powell River'),(294,9,'South Glengarry'),(295,9,'North Perth'),(296,11,'Mercier'),(297,9,'South Stormont'),(298,11,'Saint-Colomban'),(299,1,'Lacombe'),(300,2,'Sooke'),(301,2,'Dawson Creek'),(302,2,'Lake Country'),(303,9,'Trent Hills'),(304,11,'Sainte-Marie'),(305,9,'Guelph/Eramosa'),(306,6,'Truro'),(307,11,'Amos'),(308,9,'The Nation / La Nation'),(309,9,'Ingersoll'),(310,3,'Winkler'),(311,1,'Wetaskiwin'),(312,9,'Central Elgin'),(313,11,'Lachute'),(314,9,'West Grey'),(315,2,'Parksville'),(316,11,'Cowansville'),(317,11,'Bécancour'),(318,9,'Gravenhurst'),(319,9,'Perth East'),(320,2,'Prince Rupert'),(321,11,'Prévost'),(322,11,'Sainte-Adèle'),(323,6,'Kentville'),(324,11,'Beauharnois'),(325,11,'Les Îles-de-la-Madeleine'),(326,9,'Wellington North'),(327,3,'St. Andrews'),(328,9,'Carleton Place'),(329,2,'Whistler'),(330,9,'Brighton'),(331,9,'Tiny'),(332,5,'Gander'),(333,2,'Sidney'),(334,4,'Rothesay'),(335,9,'Brock'),(336,2,'Summerland'),(337,11,'Val-des-Monts'),(338,3,'Taché'),(339,11,'Montmagny'),(340,9,'Erin'),(341,9,'Kincardine'),(342,9,'North Dundas'),(343,9,'Wellesley'),(344,12,'Estevan'),(345,2,'North Saanich'),(346,12,'Warman'),(347,11,'La Tuque'),(348,9,'Norwich'),(349,9,'Meaford'),(350,9,'Adjala-Tosorontio'),(351,9,'Hamilton Township'),(352,3,'St. Clements'),(353,11,'Saint-Amable'),(354,12,'Weyburn'),(355,9,'South Dundas'),(356,11,'L’Île-Perrot'),(357,11,'Notre-Dame-de-l\'Île-Perrot'),(358,2,'Williams Lake'),(359,9,'Elliot Lake'),(360,11,'Cantley'),(361,2,'Nelson'),(362,9,'Lambton Shores'),(363,9,'Mapleton'),(364,9,'Georgian Bluffs'),(365,11,'Rawdon'),(366,4,'Campbellton'),(367,2,'View Royal'),(368,2,'Coldstream'),(369,6,'Chester'),(370,6,'Queens'),(371,3,'Selkirk'),(372,11,'Saint-Félicien'),(373,9,'Hawkesbury'),(374,11,'Roberval'),(375,11,'Sainte-Agathe-des-Monts'),(376,9,'North Dumfries'),(377,9,'Rideau Lakes'),(378,2,'Sechelt'),(379,9,'North Glengarry'),(380,9,'South Huron'),(381,11,'Marieville'),(382,9,'Tay'),(383,9,'Temiskaming Shores'),(384,1,'Hinton'),(385,11,'Saint-Sauveur'),(386,2,'Quesnel'),(387,9,'Elizabethtown-Kitley'),(388,1,'Morinville'),(389,9,'Grey Highlands'),(390,10,'Stratford'),(391,9,'Alfred and Plantagenet'),(392,11,'Mont-Tremblant'),(393,12,'Martensville'),(394,11,'Saint-Raymond'),(395,6,'Amherst'),(396,9,'Ramara'),(397,11,'Bois-des-Filion'),(398,9,'Leeds and the Thousand Islands'),(399,11,'Carignan'),(400,9,'Brockton'),(401,9,'Laurentian Valley'),(402,3,'East St. Paul'),(403,11,'Lorraine'),(404,11,'Sainte-Julienne'),(405,1,'Blackfalds'),(406,9,'Malahide'),(407,4,'Oromocto'),(408,1,'Olds'),(409,9,'Huron East'),(410,3,'Stanley'),(411,9,'Penetanguishene'),(412,2,'Qualicum Beach'),(413,11,'Notre-Dame-des-Prairies'),(414,9,'West Perth'),(415,9,'Cavan Monaghan'),(416,9,'Arnprior'),(417,9,'Smiths Falls'),(418,11,'Pont-Rouge'),(419,9,'Champlain'),(420,11,'Coaticook'),(421,9,'Minto'),(422,3,'Morden'),(423,9,'Mono'),(424,12,'Corman Park No. 344'),(425,2,'Ladysmith'),(426,6,'Bridgewater'),(427,3,'Dauphin'),(428,11,'Otterburn Park'),(429,1,'Taber'),(430,9,'South Bruce Peninsula'),(431,1,'Edson'),(432,11,'Farnham'),(433,9,'Kapuskasing'),(434,11,'La Malbaie'),(435,9,'Renfrew'),(436,1,'Coaldale'),(437,5,'Portugal Cove-St. Philip\'s'),(438,9,'Zorra'),(439,2,'Kitimat'),(440,9,'Shelburne'),(441,5,'Happy Valley'),(442,11,'Saint-Hippolyte'),(443,2,'Castlegar'),(444,6,'Church Point'),(445,1,'Drumheller'),(446,9,'Kirkland Lake'),(447,6,'Argyle'),(448,5,'Torbay'),(449,11,'La Pêche'),(450,1,'Banff'),(451,1,'Innisfail'),(452,11,'Nicolet'),(453,3,'Rockwood'),(454,9,'Drummond/North Elmsley'),(455,9,'Dryden'),(456,8,'Iqaluit'),(457,9,'Fort Frances'),(458,11,'La Sarre'),(459,2,'Trail'),(460,11,'Chandler'),(461,9,'Stone Mills'),(462,9,'Hanover'),(463,9,'South-West Oxford'),(464,11,'Acton Vale'),(465,11,'Bromont'),(466,9,'Beckwith'),(467,9,'Goderich'),(468,9,'Plympton-Wyoming'),(469,9,'Central Huron'),(470,11,'Rigaud'),(471,11,'Louiseville'),(472,11,'Chibougamau'),(473,9,'Aylmer'),(474,11,'Delson'),(475,2,'Kimberley'),(476,9,'Blandford-Blenheim'),(477,9,'Bayham'),(478,9,'Augusta'),(479,9,'Puslinch'),(480,11,'Beauport'),(481,11,'Saint-Rémi'),(482,9,'St. Marys'),(483,1,'Drayton Valley'),(484,1,'Ponoka'),(485,5,'Labrador city_name'),(486,11,'Donnacona'),(487,9,'Southgate'),(488,9,'McNab/Braeside'),(489,3,'Macdonald'),(490,11,'Hampstead'),(491,11,'Baie-Saint-Paul'),(492,2,'Merritt'),(493,9,'Bluewater'),(494,9,'East Zorra-Tavistock'),(495,11,'Brownsburg'),(496,11,'Stoneham-et-Tewkesbury'),(497,11,'Asbestos'),(498,9,'Huron-Kinloss'),(499,11,'Coteau-du-Lac'),(500,9,'The Blue Mountains'),(501,9,'Whitewater Region'),(502,9,'Edwardsburgh/Cardinal'),(503,11,'Sainte-Anne-des-Monts'),(504,11,'Old Chelsea'),(505,9,'North Stormont'),(506,9,'Alnwick/Haldimand'),(507,1,'Peace River'),(508,9,'Arran-Elderslie'),(509,11,'Saint-Zotique'),(510,11,'Val-Shefford'),(511,9,'Douro-Dummer'),(512,11,'Plessisville'),(513,3,'Ritchot'),(514,9,'Otonabee-South Monaghan'),(515,4,'Shediac'),(516,1,'Slave Lake'),(517,11,'Port-Cartier'),(518,11,'Saint-Lambert-de-Lauzon'),(519,6,'Barrington'),(520,1,'Rocky Mountain House'),(521,9,'Chatsworth'),(522,5,'Stephenville'),(523,9,'Muskoka Falls'),(524,1,'Devon'),(525,6,'Yarmouth'),(526,11,'Boischatel'),(527,9,'Parry Sound'),(528,11,'Pointe-Calumet'),(529,4,'Beaubassin East / Beaubassin-est'),(530,9,'Wainfleet'),(531,9,'Cramahe'),(532,11,'Beauceville'),(533,9,'North Middlesex'),(534,11,'Amqui'),(535,11,'Sainte-Catherine-de-la-Jacques-Cartier'),(536,5,'Clarenville'),(537,11,'Mont-Joli'),(538,9,'Dysart et al'),(539,1,'Wainwright'),(540,11,'Contrecoeur'),(541,4,'Beresford'),(542,11,'Saint-Joseph-du-Lac'),(543,2,'Hope'),(544,3,'Gimli'),(545,4,'Douglas'),(546,11,'Saint-Apollinaire'),(547,9,'Hindon Hill'),(548,11,'Les Cèdres'),(549,3,'La Broquerie'),(550,2,'Kent'),(551,9,'Tweed'),(552,11,'Saint-Félix-de-Valois'),(553,5,'Bay Roberts'),(554,12,'Melfort'),(555,1,'Bonnyville'),(556,1,'Stettler'),(557,11,'Saint-Calixte'),(558,11,'Lac-Mégantic'),(559,9,'Perth'),(560,9,'Oliver Paipoonge'),(561,12,'Humboldt'),(562,11,'Charlemagne'),(563,11,'Pontiac'),(564,1,'St. Paul'),(565,9,'Petrolia'),(566,9,'Southwest Middlesex'),(567,9,'Front of Yonge'),(568,1,'Vegreville'),(569,11,'Sainte-Brigitte-de-Laval'),(570,11,'Princeville'),(571,11,'Verchères'),(572,3,'The Pas'),(573,11,'Saint-Césaire'),(574,12,'La Ronge'),(575,9,'Tay Valley'),(576,9,'South Bruce'),(577,11,'McMasterville'),(578,1,'Redcliff'),(579,1,'Crowsnest Pass'),(580,11,'Saint-Philippe'),(581,11,'Richelieu'),(582,11,'Notre-Dame-du-Mont-Carmel'),(583,11,'L\'Ange-Gardien'),(584,11,'Sainte-Martine'),(585,11,'Saint-Pie'),(586,2,'Peachland'),(587,9,'Ashfield-Colborne-Wawanosh'),(588,9,'Trent Lakes'),(589,2,'Northern Rockies'),(590,11,'Cookshire'),(591,3,'West St. Paul'),(592,11,'Windsor'),(593,11,'L’Epiphanie'),(594,2,'Creston'),(595,2,'Smithers'),(596,10,'Cornwall'),(597,12,'Meadow Lake'),(598,9,'Lanark Highlands'),(599,4,'Sackville'),(600,4,'Grand Falls'),(601,9,'Cochrane'),(602,5,'Marystown'),(603,9,'Sioux Lookout'),(604,1,'Didsbury'),(605,11,'Saint-Honoré'),(606,2,'Fernie'),(607,5,'Deer Lake'),(608,4,'Woodstock'),(609,11,'Val-David'),(610,12,'Flin Flon'),(611,11,'Hudson'),(612,9,'Gananoque'),(613,3,'Brokenhead'),(614,11,'Saint-Paul'),(615,4,'Burton'),(616,2,'Spallumcheen'),(617,1,'Westlock'),(618,11,'Témiscouata-sur-le-Lac'),(619,11,'Shannon'),(620,2,'Osoyoos'),(621,11,'Montréal-Ouest'),(622,9,'Hearst'),(623,11,'Saint-Henri'),(624,3,'Ste. Anne'),(625,6,'Antigonish'),(626,9,'Espanola'),(627,9,'West Elgin'),(628,3,'Flin Flon (Part)'),(629,4,'Grand Bay-Westfield'),(630,11,'Sainte-Anne-de-Bellevue'),(631,9,'North Huron'),(632,2,'Oliver'),(633,11,'Saint-Roch-de-l\'Achigan'),(634,9,'Stirling-Rawdon'),(635,11,'Chisasibi'),(636,5,'Carbonear'),(637,4,'Saint Marys'),(638,11,'Chertsey'),(639,2,'Armstrong'),(640,3,'Stonewall'),(641,4,'Shippagan'),(642,11,'Lanoraie'),(643,4,'Memramcook'),(644,9,'Centre Hastings'),(645,11,'Warwick'),(646,9,'East Ferris'),(647,4,'Hanwell'),(648,11,'Saint-Joseph-de-Beauce'),(649,2,'Metchosin'),(650,9,'Lucan Biddulph'),(651,11,'Rivière-Rouge'),(652,9,'Greenstone'),(653,11,'Saint-Mathias-sur-Richelieu'),(654,3,'Neepawa'),(655,2,'Gibsons'),(656,12,'Kindersley'),(657,1,'Jasper'),(658,1,'Barrhead'),(659,11,'Les Coteaux'),(660,12,'Melville'),(661,11,'Saint-Germain-de-Grantham'),(662,9,'Iroquois Falls'),(663,9,'Havelock-Belmont-Methuen'),(664,3,'Cornwallis'),(665,11,'Saint-Boniface'),(666,12,'Edenwold No. 158'),(667,4,'Coverdale'),(668,2,'Vanderhoof'),(669,9,'Southwold'),(670,5,'Goulds'),(671,4,'Saint Stephen'),(672,11,'Waterloo'),(673,12,'Nipawin'),(674,11,'Neuville'),(675,11,'Saint-Cyrille-de-Wendover'),(676,9,'Central Frontenac'),(677,11,'Mont-Orford'),(678,11,'Saint-Jean-de-Matha'),(679,9,'Seguin'),(680,9,'Tyendinaga'),(681,4,'Hampton'),(682,4,'Sussex'),(683,2,'Grand Forks'),(684,11,'La Pocatière'),(685,4,'Caraquet'),(686,11,'Saint-Étienne-des-Grès'),(687,3,'Altona'),(688,6,'Stellarton'),(689,6,'Wolfville'),(690,4,'New Maryland'),(691,2,'Port Hardy'),(692,11,'Saint-Donat'),(693,11,'Château-Richer'),(694,9,'Madawaska Valley'),(695,9,'Deep River'),(696,9,'Asphodel-Norwood'),(697,9,'Red Lake'),(698,11,'Métabetchouan-Lac-à-la-Croix'),(699,11,'Berthierville'),(700,1,'Vermilion'),(701,3,'Niverville'),(702,9,'Hastings Highlands'),(703,1,'Carstairs'),(704,11,'Danville'),(705,5,'Channel-Port aux Basques'),(706,12,'Battleford'),(707,11,'Lac-Etchemin'),(708,11,'Saint-Antonin'),(709,11,'Saint-Jacques'),(710,3,'Swan River'),(711,11,'Sutton'),(712,9,'Northern Bruce Peninsula'),(713,11,'L’Islet-sur-Mer'),(714,11,'Carleton-sur-Mer'),(715,11,'Oka'),(716,9,'Prescott'),(717,9,'Amaranth'),(718,9,'Marmora and Lake'),(719,11,'Maniwaki'),(720,11,'Morin-Heights'),(721,4,'Dundas'),(722,11,'Napierville'),(723,11,'Crabtree'),(724,9,'Bancroft'),(725,11,'Saint-Tite'),(726,9,'Howick'),(727,9,'Dutton/Dunwich'),(728,9,'Callander'),(729,4,'Simonds'),(730,11,'Baie-d’Urfé'),(731,11,'New Richmond'),(732,9,'Perth South'),(733,11,'Roxton Pond'),(734,2,'Sparwood'),(735,1,'Claresholm'),(736,9,'Breslau'),(737,9,'Montague'),(738,2,'Cumberland'),(739,11,'Beaupré'),(740,11,'Saint-André-Avellin'),(741,11,'Saint-Ambroise-de-Kildare'),(742,11,'East Angus'),(743,2,'Rossland'),(744,2,'Mackenzie'),(745,2,'Golden'),(746,1,'Raymond'),(747,11,'Saint-Adolphe-d\'Howard'),(748,9,'Warwick'),(749,2,'Bowen Island'),(750,9,'Bonnechere Valley'),(751,6,'Windsor'),(752,1,'Pincher Creek'),(753,4,'Alnwick'),(754,6,'Westville'),(755,2,'Fruitvale'),(756,5,'Pasadena'),(757,11,'Saint-Prosper'),(758,11,'Ormstown'),(759,1,'Cardston'),(760,2,'Westbank'),(761,3,'De Salaberry'),(762,3,'Headingley'),(763,1,'Grande Cache'),(764,4,'Atholville'),(765,11,'Saint-Agapit'),(766,12,'Prince Albert No. 461'),(767,9,'Casselman'),(768,11,'Saint-Ambroise'),(769,7,'Hay River'),(770,11,'Mistissini'),(771,4,'Studholm'),(772,2,'Lumby'),(773,11,'Saint-Faustin--Lac-Carré'),(774,9,'Morris-Turnberry'),(775,5,'Placentia'),(776,11,'Saint-Pascal'),(777,9,'Mulmur'),(778,9,'Blind River'),(779,11,'Dunham'),(780,11,'Havre-Saint-Pierre'),(781,11,'Saint-Anselme'),(782,11,'Trois-Pistoles'),(783,11,'Grande-Rivière'),(784,9,'Powassan'),(785,11,'Malartic'),(786,5,'Bonavista'),(787,3,'Killarney - Turtle Mountain'),(788,3,'Woodlands'),(789,5,'Lewisporte'),(790,11,'Saint-Denis-de-Brompton'),(791,2,'Invermere'),(792,4,'Salisbury'),(793,3,'Bifrost-Riverton'),(794,12,'Buckland No. 491'),(795,3,'Cartier'),(796,11,'Sainte-Anne-des-Lacs'),(797,9,'Highlands East'),(798,3,'Alexander'),(799,11,'Sainte-Claire'),(800,11,'Percé'),(801,11,'Saint-Jean-Port-Joli'),(802,9,'East Hawkesbury'),(803,4,'Bright'),(804,1,'Penhold'),(805,11,'Saint-André-d\'Argenteuil'),(806,11,'Saint-Côme--Linière'),(807,11,'Saint-Sulpice'),(808,9,'Marathon'),(809,11,'Forestville'),(810,7,'Inuvik'),(811,11,'Richmond'),(812,2,'Lake Cowichan'),(813,9,'Sables-Spanish Rivers'),(814,3,'Hillsburg-Roblin-Shell River'),(815,6,'Port Hawkesbury'),(816,1,'Three Hills'),(817,3,'Lorette'),(818,11,'Paspebiac'),(819,11,'Saint-Thomas'),(820,11,'Saint-Jean-Baptiste'),(821,11,'Portneuf'),(822,6,'Pictou'),(823,12,'Tisdale'),(824,9,'Lake of Bays'),(825,1,'High Level'),(826,1,'Gibbons'),(827,5,'Bishops Falls'),(828,3,'WestLake-Gladstone'),(829,11,'Normandin'),(830,11,'Saint-Alphonse-Rodriguez'),(831,3,'Beauséjour'),(832,4,'Dalhousie'),(833,11,'Saint-Alphonse-de-Granby'),(834,3,'Lac du Bonnet'),(835,11,'Clermont'),(836,3,'Virden'),(837,11,'Compton'),(838,12,'White city_name'),(839,2,'Ellison'),(840,11,'Mont-Saint-Grégoire'),(841,4,'Wellington'),(842,9,'Merrickville'),(843,11,'Saint-Liboire'),(844,11,'Dégelis'),(845,3,'Morris'),(846,11,'Saint-Alexis-des-Monts'),(847,11,'Cap-Saint-Ignace'),(848,11,'Saint-Anaclet-de-Lessard'),(849,3,'Carman'),(850,9,'Athens'),(851,9,'Melancthon'),(852,11,'Cap Santé'),(853,5,'Harbour Grace'),(854,2,'Houston'),(855,9,'Adelaide-Metcalfe'),(856,1,'Crossfield'),(857,5,'Springdale'),(858,1,'Fort Macleod'),(859,1,'Athabasca'),(860,2,'Enderby'),(861,11,'Saint-Ferréol-les-Neiges'),(862,9,'Laurentian Hills'),(863,9,'Grand Valley'),(864,11,'Senneterre'),(865,11,'Sainte-Marie-Madeleine'),(866,9,'Admaston/Bromley'),(867,11,'Saint-Gabriel-de-Valcartier'),(868,9,'North Algona Wilberforce'),(869,4,'Kingston'),(870,9,'Wawa'),(871,11,'Saint-Christophe-d\'Arthabaska'),(872,11,'Sainte-Mélanie'),(873,11,'Ascot Corner'),(874,9,'Horton'),(875,11,'Saint-Michel'),(876,5,'Botwood'),(877,11,'Saint-Paul-d\'Abbotsford'),(878,11,'Saint-Marc-des-Carrières'),(879,11,'Stanstead'),(880,11,'Sainte-Anne-de-Beaupré'),(881,11,'Sainte-Luce'),(882,11,'Saint-Gabriel'),(883,8,'Rankin Inlet'),(884,12,'Vanscoy No. 345'),(885,2,'Cedar'),(886,2,'Princeton'),(887,12,'La Loche'),(888,4,'Kingsclear'),(889,11,'Ferme-Neuve'),(890,11,'Thurso'),(891,11,'Adstock'),(892,9,'Shuniah'),(893,9,'Enniskillen'),(894,11,'Yamachiche'),(895,11,'Saint-Maurice'),(896,11,'Bonaventure'),(897,11,'Val-Morin'),(898,11,'Pohénégamook'),(899,4,'Wakefield'),(900,11,'Stoke'),(901,11,'Sainte-Marguerite-du-Lac-Masson'),(902,11,'Saint-Prime'),(903,11,'Kuujjuaq'),(904,9,'Atikokan'),(905,11,'Grenville-sur-la-Rouge'),(906,3,'North Cypress-Langford'),(907,11,'Sainte-Anne-de-Sorel'),(908,11,'Macamic'),(909,1,'Sundre'),(910,11,'Rougemont'),(911,11,'Piedmont'),(912,1,'Grimshaw'),(913,11,'Lac-des-Écorces'),(914,9,'Northeastern Manitoulin and the Islands'),(915,12,'Pelican Narrows'),(916,9,'McDougall'),(917,1,'Black Diamond'),(918,11,'Saint-Pamphile'),(919,11,'Bedford'),(920,11,'Weedon-Centre'),(921,11,'Lacolle'),(922,11,'Saint-Gabriel-de-Brandon'),(923,2,'Errington'),(924,1,'Coalhurst'),(925,9,'French River / Rivière des Français'),(926,8,'Arviat'),(927,11,'Saint-David-de-Falardeau'),(928,9,'Markstay'),(929,5,'Spaniards Bay'),(930,4,'Cocagne'),(931,11,'Saint-Bruno'),(932,2,'Chetwynd'),(933,11,'Laurier-Station'),(934,11,'Saint-Anicet'),(935,11,'Saint-Mathieu-de-Beloeil'),(936,11,'Cap-Chat'),(937,1,'Sexsmith'),(938,11,'Notre-Dame-de-Lourdes'),(939,11,'Ville-Marie'),(940,11,'Saint-Isidore'),(941,4,'Shippegan'),(942,9,'East Garafraxa'),(943,2,'Pemberton'),(944,12,'Unity'),(945,1,'Rimbey'),(946,1,'High Prairie'),(947,1,'Turner Valley'),(948,1,'Hanna'),(949,7,'Fort Smith'),(950,11,'Maria'),(951,11,'Saint-Chrysostome'),(952,9,'Greater Madawaska'),(953,6,'Berwick'),(954,11,'Saint-Damase'),(955,4,'Lincoln'),(956,11,'Disraeli'),(957,11,'Sainte-Victoire-de-Sorel'),(958,12,'Meadow Lake No. 588'),(959,2,'Elkford'),(960,9,'Georgian Bay'),(961,11,'Saint-Alexandre'),(962,11,'Hérbertville'),(963,12,'Moosomin'),(964,9,'North Kawartha'),(965,11,'Sainte-Thècle'),(966,6,'Trenton'),(967,11,'Fermont'),(968,12,'Esterhazy'),(969,11,'Wickham'),(970,11,'La Présentation'),(971,1,'Beaverlodge'),(972,11,'Sainte-Catherine-de-Hatley'),(973,11,'Saint-Basile'),(974,11,'Saint-Raphaël'),(975,5,'Holyrood'),(976,11,'Gracefield'),(977,11,'Saint-Martin'),(978,11,'Causapscal'),(979,11,'Brigham'),(980,9,'Perry'),(981,11,'Port-Daniel--Gascons'),(982,12,'Rosetown'),(983,3,'Minnedosa'),(984,11,'Labelle'),(985,11,'Huntingdon'),(986,11,'Hébertville'),(987,9,'Black River-Matheson'),(988,11,'Saint-Michel-des-Saints'),(989,3,'Dufferin'),(990,11,'Saint-Victor'),(991,2,'Sicamous'),(992,4,'Cap Pele'),(993,3,'Kelsey'),(994,9,'Killaloe, Hagarty and Richards'),(995,9,'Alvinston'),(996,12,'Dundurn No. 314'),(997,11,'Saint-Éphrem-de-Beauce'),(998,12,'Assiniboia'),(999,11,'Témiscaming'),(1000,1,'Magrath'),(1001,11,'Sainte-Geneviève-de-Berthier'),(1002,4,'Buctouche'),(1003,4,'Grand Manan'),(1004,11,'Sainte-Madeleine'),(1005,3,'Boissevain'),(1006,11,'Scott'),(1007,11,'Sainte-Croix'),(1008,9,'Algonquin Highlands'),(1009,11,'Valcourt'),(1010,4,'Saint George'),(1011,4,'Paquetville'),(1012,11,'Saint-Dominique'),(1013,2,'Clearwater'),(1014,9,'Addington Highlands'),(1015,2,'Lillooet'),(1016,5,'Burin'),(1017,5,'Grand Bank'),(1018,11,'Léry'),(1019,4,'Minto'),(1020,12,'Rosthern No. 403'),(1021,2,'Chase'),(1022,11,'Mansfield-et-Pontefract'),(1023,11,'Saint-Denis'),(1024,12,'Outlook'),(1025,3,'Mitchell'),(1026,11,'Saint-Gédéon-de-Beauce'),(1027,11,'Saint-Léonard-d\'Aston'),(1028,6,'Lunenburg'),(1029,4,'Northesk'),(1030,11,'Albanel'),(1031,5,'St. Anthony'),(1032,11,'Pessamit'),(1033,11,'Maskinongé'),(1034,11,'Saint-Charles-de-Bellechasse'),(1035,5,'Fogo Island'),(1036,11,'East Broughton'),(1037,6,'Lantz'),(1038,1,'Calmar'),(1039,2,'Highlands'),(1040,11,'Saint-Polycarpe'),(1041,5,'Logy Bay-Middle Cove-Outer Cove'),(1042,11,'Deschambault'),(1043,12,'Canora'),(1044,4,'Upper Miramichi'),(1045,2,'Anmore'),(1046,4,'Hardwicke'),(1047,11,'Saint-Côme'),(1048,11,'Waskaganish'),(1049,5,'Twillingate'),(1050,4,'Saint-Quentin'),(1051,11,'Lebel-sur-Quévillon'),(1052,12,'Pilot Butte'),(1053,1,'Nanton'),(1054,11,'Pierreville'),(1055,5,'New-Wes-Valley'),(1056,4,'Pennfield Ridge'),(1057,3,'West Interlake'),(1058,12,'Biggar'),(1059,12,'Britannia No. 502'),(1060,4,'Kent'),(1061,5,'Wabana'),(1062,11,'Saint-Gilles'),(1063,11,'Wendake'),(1064,11,'Saint-Bernard'),(1065,11,'Sainte-Cécile-de-Milton'),(1066,11,'Saint-Roch-de-Richelieu'),(1067,11,'Saint-Nazaire'),(1068,11,'Saint-Elzéar'),(1069,11,'Hinchinbrooke'),(1070,11,'Saint-François-Xavier-de-Brompton'),(1071,11,'Papineauville'),(1072,3,'Prairie View'),(1073,2,'Cowichan Bay'),(1074,11,'Saint-Ignace-de-Loyola'),(1075,9,'Central Manitoulin'),(1076,12,'Maple Creek'),(1077,5,'Glovertown'),(1078,1,'Tofield'),(1079,9,'Madoc'),(1080,11,'Upton'),(1081,11,'Sainte-Anne-de-Sabrevois'),(1082,2,'Logan Lake'),(1083,11,'Sainte-Anne-de-la-Pérade'),(1084,11,'Saint-Damien-de-Buckland'),(1085,8,'Baker Lake'),(1086,2,'Saltair'),(1087,5,'Pouch Cove'),(1088,11,'Saint-Ferdinand'),(1089,2,'Port McNeill'),(1090,6,'Digby'),(1091,11,'Manouane'),(1092,11,'Saint-Gervais'),(1093,9,'Neebing'),(1094,1,'Redwater'),(1095,11,'Saint-Alexandre-de-Kamouraska'),(1096,11,'Saint-Marc-sur-Richelieu'),(1097,11,'Mandeville'),(1098,11,'Caplan'),(1099,9,'Point Edward'),(1100,4,'Allardville'),(1101,11,'Waterville'),(1102,11,'Saint-Damien'),(1103,11,'Lac-Nominingue'),(1104,11,'Obedjiwan'),(1105,12,'Rama'),(1106,3,'McCreary'),(1107,3,'Deloraine-Winchester'),(1108,3,'Oakland-Wawanesa'),(1109,3,'Brenda-Waskada'),(1110,3,'Russell-Binscarth'),(1111,3,'Ellice-Archie'),(1112,3,'Souris-Glenwood'),(1113,3,'Riverdale'),(1114,3,'Pembina'),(1115,3,'Wallace-Woodworth'),(1116,3,'Lorne'),(1117,3,'Ethelbert'),(1118,3,'Yellowhead'),(1119,3,'Swan Valley West'),(1120,3,'Grey'),(1121,3,'Gilbert Plains'),(1122,3,'Norfolk-Treherne'),(1123,3,'Hamiota'),(1124,3,'Emerson-Franklin'),(1125,3,'Sifton'),(1126,3,'Rossburn'),(1127,3,'Grand View'),(1128,3,'Grassland'),(1129,3,'Louise'),(1130,3,'Ste. Rose'),(1131,3,'Cartwright-Roblin'),(1132,3,'Mossey River'),(1133,3,'Lakeshore'),(1134,3,'Riding Mountain West'),(1135,3,'Clanwilliam-Erickson'),(1136,3,'Glenboro-South Cypress'),(1137,3,'North Norfolk'),(1138,3,'Reinland'),(1139,3,'Minitonas-Bowsman'),(1140,5,'Kippens'),(1141,12,'Blucher'),(1142,11,'Hatley'),(1143,11,'Saint-Gédéon'),(1144,11,'Kingsey Falls'),(1145,1,'Provost'),(1146,4,'Saint-Charles'),(1147,9,'Mattawa'),(1148,2,'Tumbler Ridge'),(1149,11,'Terrasse-Vaudreuil'),(1150,11,'L\'Ascension-de-Notre-Seigneur'),(1151,1,'Bow Island'),(1152,11,'Barraute'),(1153,2,'One Hundred Mile House'),(1154,4,'Kedgwick'),(1155,5,'Gambo'),(1156,11,'Saint-Liguori'),(1157,9,'Bonfield'),(1158,11,'Pointe-Lebel'),(1159,4,'Saint Mary'),(1160,11,'Saint-Patrice-de-Sherrington'),(1161,1,'Fox Creek'),(1162,9,'Dawn-Euphemia'),(1163,9,'Chapleau'),(1164,11,'Saint-Esprit'),(1165,4,'Westfield Beach'),(1166,10,'Montague'),(1167,11,'Mashteuiatsh'),(1168,11,'Saint-François-du-Lac'),(1169,4,'Eel River Crossing'),(1170,11,'Saint-Fulgence'),(1171,1,'Millet'),(1172,11,'Vallée-Jonction'),(1173,11,'Saint-Georges-de-Cacouna'),(1174,12,'Lumsden No. 189'),(1175,9,'Manitouwadge'),(1176,9,'Wellington'),(1177,12,'Swift Current No. 137'),(1178,2,'Tofino'),(1179,12,'Fort Qu’Appelle'),(1180,1,'Vulcan'),(1181,12,'Indian Head'),(1182,4,'Petit Rocher'),(1183,5,'Wabush'),(1184,11,'Saint-Fabien'),(1185,12,'Watrous'),(1186,9,'North Frontenac'),(1187,11,'Lac-Supérieur'),(1188,11,'Les Escoumins'),(1189,4,'Richibucto'),(1190,11,'Rivière-Beaudette'),(1191,11,'Saint-Barthélemy'),(1192,2,'Nisga\'a'),(1193,11,'Austin'),(1194,11,'Saint-Mathieu'),(1195,11,'Saint-Paul-de-l\'Île-aux-Noix'),(1196,12,'Orkney No. 244'),(1197,7,'Behchokò'),(1198,11,'Saint-Joseph-de-Coleraine'),(1199,11,'Saint-Cyprien-de-Napierville'),(1200,11,'Sayabec'),(1201,1,'Valleyview'),(1202,11,'Déléage'),(1203,11,'Potton'),(1204,11,'Sainte-Béatrix'),(1205,11,'Sainte-Justine'),(1206,11,'Eastman'),(1207,11,'Saint-Valérien-de-Milton'),(1208,11,'Saint-Cuthbert'),(1209,11,'Saint-Blaise-sur-Richelieu'),(1210,6,'Middleton'),(1211,4,'Maugerville'),(1212,12,'Dalmeny'),(1213,12,'Kamsack'),(1214,12,'Lumsden'),(1215,5,'Trinity Bay North'),(1216,11,'Saint-Michel-de-Bellechasse'),(1217,11,'Sainte-Angèle-de-Monnoir'),(1218,1,'Picture Butte'),(1219,11,'Sacré-Coeur-Saguenay'),(1220,4,'Saint-Louis'),(1221,5,'Victoria'),(1222,11,'Saint-Robert'),(1223,3,'Armstrong'),(1224,11,'Saint-Pierre-de-l\'Île-d\'Orléans'),(1225,11,'La Guadeloupe'),(1226,4,'Saint Andrews'),(1227,2,'Burns Lake'),(1228,11,'Povungnituk'),(1229,4,'Manners Sutton'),(1230,11,'Gore'),(1231,9,'Deseronto'),(1232,1,'Lamont'),(1233,11,'Chambord'),(1234,11,'Dudswell'),(1235,12,'Wynyard'),(1236,8,'Cambridge Bay'),(1237,11,'Saint-Narcisse'),(1238,9,'Frontenac Islands'),(1239,11,'Waswanipi'),(1240,11,'Inukjuak'),(1241,3,'Piney'),(1242,9,'Komoka'),(1243,11,'Saint-Zacharie'),(1244,11,'Hemmingford'),(1245,6,'Shelburne'),(1246,11,'Saint-Clet'),(1247,3,'Carberry'),(1248,4,'Brighton'),(1249,4,'Saint-Antoine'),(1250,2,'Warfield'),(1251,4,'Northampton'),(1252,11,'Saint-Ours'),(1253,5,'Stephenville Crossing'),(1254,11,'Sainte-Anne-de-la-Pocatière'),(1255,2,'Ucluelet'),(1256,11,'Saint-Placide'),(1257,2,'Barrière'),(1258,3,'Fisher'),(1259,9,'Nipissing'),(1260,11,'Sainte-Clotilde'),(1261,12,'Shaunavon'),(1262,4,'Wicklow'),(1263,4,'Southesk'),(1264,11,'Nouvelle'),(1265,12,'Rosthern'),(1266,11,'Yamaska'),(1267,4,'Neguac'),(1268,5,'Flat Rock'),(1269,8,'Igloolik'),(1270,3,'Grunthal'),(1271,2,'Naramata'),(1272,11,'Saint-Élie-de-Caxton'),(1273,3,'Blumenort'),(1274,4,'Balmoral'),(1275,11,'Price'),(1276,3,'Rosedale'),(1277,11,'Saint-Jacques-le-Mineur'),(1278,9,'Huron Shores'),(1279,11,'Champlain'),(1280,3,'Whitehead'),(1281,11,'Saint-Antoine-sur-Richelieu'),(1282,11,'Saint-Pacôme'),(1283,11,'Saint-Stanislas-de-Kostka'),(1284,11,'Frontenac'),(1285,3,'Stuartburn'),(1286,11,'Yamaska-Est'),(1287,11,'Sainte-Émélie-de-l\'Énergie'),(1288,11,'Saint-Charles-sur-Richelieu'),(1289,11,'Saint-Joseph-de-Sorel'),(1290,9,'Nipigon'),(1291,11,'Rivière-Blanche'),(1292,11,'Sainte-Hélène-de-Bagot'),(1293,11,'Franklin Centre'),(1294,5,'Harbour Breton'),(1295,5,'Massey Drive'),(1296,11,'Mille-Isles'),(1297,12,'Wilton No. 472'),(1298,11,'Lyster'),(1299,3,'Oakview'),(1300,12,'Balgonie'),(1301,3,'Harrison Park'),(1302,10,'Kensington'),(1303,5,'Witless Bay'),(1304,8,'Pond Inlet'),(1305,2,'Royston'),(1306,11,'Sainte-Clotilde-de-Horton'),(1307,9,'Burford'),(1308,11,'Fossambault-sur-le-Lac'),(1309,11,'Saint-Benoît-Labre'),(1310,2,'Coombs'),(1311,9,'Terrace Bay'),(1312,11,'Chapais'),(1313,11,'Saint-Honoré-de-Shenley'),(1314,11,'Cleveland'),(1315,9,'Macdonald, Meredith and Aberdeen Additional'),(1316,11,'Messines'),(1317,11,'Saint-Jean-de-Dieu'),(1318,2,'Nakusp'),(1319,4,'Florenceville'),(1320,11,'Saint-Antoine-de-Tilly'),(1321,2,'Lakeview'),(1322,5,'Humbermouth'),(1323,2,'Fort St. James'),(1324,11,'Saint-François-de-la-Rivière-du-Sud'),(1325,4,'Saint-Jacques'),(1326,11,'Uashat'),(1327,4,'Perth'),(1328,11,'Eeyou Istchee Baie-James'),(1329,12,'Shellbrook No. 493'),(1330,11,'Shawville'),(1331,11,'Saint-Lucien'),(1332,11,'Lambton'),(1333,11,'Saint-Laurent-de-l\'Île-d\'Orléans'),(1334,11,'Saint-Flavien'),(1335,11,'Grenville'),(1336,11,'Chute-aux-Outardes'),(1337,11,'Sainte-Marcelline-de-Kildare'),(1338,11,'Saint-Félix-de-Kingsey'),(1339,5,'Upper Island Cove'),(1340,4,'Glenelg'),(1341,11,'Sainte-Élisabeth'),(1342,2,'Ashcroft'),(1343,5,'Clarkes Beach'),(1344,11,'Saint-Bernard-de-Lacolle'),(1345,4,'Belledune'),(1346,11,'Saint-Guillaume'),(1347,11,'Venise-en-Québec'),(1348,11,'Maliotenam'),(1349,11,'Ripon'),(1350,2,'Hilliers'),(1351,4,'Saint-Joseph'),(1352,11,'Saint-Paulin'),(1353,1,'Bon Accord'),(1354,4,'Saint David'),(1355,11,'Saint-Albert'),(1356,11,'Matagami'),(1357,4,'Springfield'),(1358,11,'Amherst'),(1359,11,'Notre-Dame-du-Laus'),(1360,4,'St. George'),(1361,1,'Wembley'),(1362,3,'Victoria'),(1363,1,'Springbrook'),(1364,11,'Saint-Tite-des-Caps'),(1365,12,'Hudson Bay'),(1366,3,'Pinawa'),(1367,9,'Brudenell, Lyndoch and Raglan'),(1368,12,'Carlyle'),(1369,2,'Keremeos'),(1370,11,'Val-Joli'),(1371,2,'Gold River'),(1372,11,'Saint-Casimir'),(1373,5,'Bay Bulls'),(1374,12,'Langham'),(1375,12,'Frenchman Butte'),(1376,4,'Gordon'),(1377,8,'Kugluktuk'),(1378,11,'Saint-Malachie'),(1379,4,'Southampton'),(1380,11,'Salluit'),(1381,8,'Pangnirtung'),(1382,11,'Saint-Louis-de-Gonzague'),(1383,9,'Moosonee'),(1384,9,'Englehart'),(1385,11,'Saint-Urbain'),(1386,11,'Tring-Jonction'),(1387,4,'Nauwigewauk'),(1388,11,'Pointe-à-la-Croix'),(1389,4,'Denmark'),(1390,11,'Saint-Joachim'),(1391,12,'Torch River No. 488'),(1392,11,'Saint-Théodore-d\'Acton'),(1393,2,'Grindrod'),(1394,11,'L’ Îsle-Verte'),(1395,2,'Harrison Hot Springs'),(1396,11,'Palmarolle'),(1397,11,'Henryville'),(1398,4,'Sussex Corner'),(1399,11,'Saint-Odilon-de-Cranbourne'),(1400,3,'Pipestone'),(1401,11,'Laurierville'),(1402,11,'La Doré'),(1403,11,'Lac-au-Saumon'),(1404,11,'Wotton'),(1405,3,'Prairie Lakes'),(1406,1,'Elk Point'),(1407,12,'Shellbrook'),(1408,11,'Wemindji'),(1409,8,'Cape Dorset'),(1410,9,'Strong'),(1411,9,'Lappe'),(1412,11,'Rivière-Héva'),(1413,11,'Fort-Coulonge'),(1414,5,'Irishtown-Summerside'),(1415,11,'Godmanchester'),(1416,12,'Macklin'),(1417,9,'Armour'),(1418,11,'Saint-Simon'),(1419,3,'St. François Xavier'),(1420,11,'Tingwick'),(1421,11,'Saint-Aubert'),(1422,11,'Saint-Mathieu-du-Parc'),(1423,1,'Wabasca'),(1424,11,'Ragueneau'),(1425,11,'Notre-Dame-du-Bon-Conseil'),(1426,3,'Wasagamack'),(1427,11,'Saint-Ubalde'),(1428,12,'Creighton'),(1429,5,'Fortune'),(1430,9,'Faraday'),(1431,11,'Berthier-sur-Mer'),(1432,11,'Frampton'),(1433,9,'Magnetawan'),(1434,11,'New Carlisle'),(1435,12,'Laird No. 404'),(1436,4,'Petitcodiac'),(1437,2,'Popkum'),(1438,4,'Norton'),(1439,12,'Canwood No. 494'),(1440,11,'Wentworth-Nord'),(1441,4,'Bas Caraquet'),(1442,11,'Sainte-Ursule'),(1443,13,'Dawson'),(1444,11,'Nantes'),(1445,11,'Lac-aux-Sables'),(1446,6,'Stewiacke'),(1447,2,'Taylor'),(1448,3,'Rosser'),(1449,12,'Estevan No. 5'),(1450,6,'Falmouth'),(1451,11,'Vaudreuil-sur-le-Lac'),(1452,3,'Grahamdale'),(1453,4,'Cardwell'),(1454,1,'Two Hills'),(1455,12,'Spiritwood No. 496'),(1456,1,'Legal'),(1457,11,'Amulet'),(1458,11,'Hérouxville'),(1459,11,'Pointe-des-Cascades'),(1460,4,'Weldford'),(1461,3,'Reynolds'),(1462,3,'St. Laurent'),(1463,2,'Lions Bay'),(1464,11,'L\'Isle-aux-Allumettes'),(1465,9,'Emo'),(1466,11,'Sainte-Brigide-d\'Iberville'),(1467,11,'Les Éboulements'),(1468,2,'Dunsmuir'),(1469,11,'Pointe-aux-Outardes'),(1470,9,'Smooth Rock Falls'),(1471,12,'Oxbow'),(1472,2,'Telkwa'),(1473,8,'Gjoa Haven'),(1474,11,'Sainte-Barbe'),(1475,1,'Mayerthorpe'),(1476,11,'Saint-Louis-du-Ha! Ha!'),(1477,3,'Powerview-Pine Falls'),(1478,5,'Baie Verte'),(1479,11,'Saint-Édouard'),(1480,4,'Charlo'),(1481,4,'Hillsborough'),(1482,1,'Bruederheim'),(1483,5,'Burgeo'),(1484,12,'Wadena'),(1485,4,'Richmond'),(1486,1,'Swan Hills'),(1487,12,'Wilkie'),(1488,4,'Saint-Léonard'),(1489,11,'Rivière-Bleue'),(1490,11,'Noyan'),(1491,12,'Ile-à-la-Crosse'),(1492,3,'Landmark'),(1493,11,'Saint-Hugues'),(1494,9,'Chisholm'),(1495,11,'Sainte-Anne-du-Sault'),(1496,11,'La Conception'),(1497,11,'Saint-Valère'),(1498,2,'Sorrento'),(1499,4,'Lamèque'),(1500,9,'Thessalon'),(1501,11,'L\'Isle-aux-Coudres'),(1502,1,'Nobleford'),(1503,11,'Larouche'),(1504,12,'South Qu\'Appelle No. 157'),(1505,3,'Elton'),(1506,11,'Lorrainville'),(1507,9,'Conestogo'),(1508,4,'Upham'),(1509,9,'St.-Charles'),(1510,11,'Sainte-Lucie-des-Laurentides'),(1511,11,'Saint-Alexis'),(1512,3,'Gillam'),(1513,11,'Roxton Falls'),(1514,3,'Montcalm'),(1515,11,'Clarendon'),(1516,12,'Mervin No. 499'),(1517,11,'Saint-Ludger'),(1518,3,'Coldwell'),(1519,11,'Saint-Arsène'),(1520,11,'Racine'),(1521,11,'Saint-Majorique-de-Grantham'),(1522,11,'Saint-Zénon'),(1523,11,'Saint-Armand'),(1524,11,'Saint-Édouard-de-Lotbinière'),(1525,3,'Alonsa'),(1526,11,'Listuguj'),(1527,1,'Bowden'),(1528,9,'St. Joseph'),(1529,12,'Osler'),(1530,11,'Saint-Hubert-de-Rivière-du-Loup'),(1531,11,'Saint-Jude'),(1532,5,'Dildo'),(1533,11,'La Minerve'),(1534,12,'Lanigan'),(1535,12,'Lajord No. 128'),(1536,9,'Moonbeam'),(1537,11,'Notre-Dame-des-Pins'),(1538,11,'Saint-Alban'),(1539,11,'Saint-Pierre-les-Becquets'),(1540,3,'Arborg'),(1541,1,'Vauxhall'),(1542,9,'Bayfield'),(1543,12,'Beaver River'),(1544,1,'Irricana'),(1545,11,'Labrecque'),(1546,4,'New Bandon'),(1547,11,'Wemotaci'),(1548,11,'Sainte-Hénédine'),(1549,11,'L\'Anse-Saint-Jean'),(1550,1,'Bassano'),(1551,6,'Parrsboro'),(1552,2,'Kaleden'),(1553,5,'St. George\'s'),(1554,7,'Fort Simpson'),(1555,11,'Akwesasne'),(1556,11,'L’Avenir'),(1557,9,'Ignace'),(1558,9,'Claremont'),(1559,3,'Teulon'),(1560,4,'Peel'),(1561,4,'Musquash'),(1562,11,'Notre-Dame-du-Portage'),(1563,5,'St. Lawrence'),(1564,6,'Oxford'),(1565,3,'Minto-Odanah'),(1566,5,'St. Alban\'s'),(1567,4,'Saint James'),(1568,11,'Saint-Norbert-d\'Arthabaska'),(1569,1,'Manning'),(1570,3,'Glenella-Lansdowne'),(1571,11,'Saint-Hilarion'),(1572,11,'Saint-Siméon'),(1573,11,'Saint-Barnabé'),(1574,11,'Sainte-Félicité'),(1575,3,'Two Borders'),(1576,4,'Queensbury'),(1577,11,'Bury'),(1578,11,'Lac-Bouchette'),(1579,11,'Saint-Lazare-de-Bellechasse'),(1580,11,'Saint-Michel-du-Squatec'),(1581,11,'Saint-Joachim-de-Shefford'),(1582,3,'St-Pierre-Jolys'),(1583,11,'Grand-Remous'),(1584,11,'Saint-Gabriel-de-Rimouski'),(1585,9,'Armstrong'),(1586,4,'Rogersville'),(1587,12,'Langenburg'),(1588,11,'Sainte-Marie-Salomé'),(1589,12,'Moose Jaw No. 161'),(1590,11,'Saint-Cyprien'),(1591,12,'Maidstone'),(1592,11,'Très-Saint-Sacrement'),(1593,12,'Battle River No. 438'),(1594,10,'Miltonvale Park'),(1595,4,'McAdam'),(1596,11,'Saints-Anges'),(1597,11,'Saint-Urbain-Premier'),(1598,5,'Centreville-Wareham-Trinity'),(1599,10,'Alberton'),(1600,3,'Winnipeg Beach'),(1601,11,'Sainte-Agathe-de-Lotbinière'),(1602,2,'Salmo'),(1603,12,'Kipling'),(1604,9,'Sagamok'),(1605,11,'Trécesson'),(1606,9,'Tara'),(1607,11,'Grande-Vallée'),(1608,4,'Bertrand'),(1609,4,'Newcastle'),(1610,11,'Mont-Carmel'),(1611,4,'Saint Martins'),(1612,11,'Saint-Eugène'),(1613,11,'Notre-Dame-des-Neiges'),(1614,4,'Saint-André'),(1615,6,'Centreville'),(1616,3,'Roland'),(1617,11,'Saint-Léon-de-Standon'),(1618,11,'Saint-Modeste'),(1619,12,'Carnduff'),(1620,9,'Carling'),(1621,1,'Eckville'),(1622,5,'Nain'),(1623,9,'Hillsburgh'),(1624,12,'Foam Lake'),(1625,11,'Sainte-Sabine'),(1626,11,'Saint-Maxime-du-Mont-Louis'),(1627,11,'Blanc-Sablon'),(1628,9,'Cobalt'),(1629,12,'Gravelbourg'),(1630,9,'South River'),(1631,12,'Hudson Bay No. 394'),(1632,9,'McKellar'),(1633,11,'Frelighsburg'),(1634,12,'Buffalo Narrows'),(1635,11,'Ayer’s Cliff'),(1636,11,'Les Méchins'),(1637,11,'Sainte-Marguerite'),(1638,11,'Saint-Claude'),(1639,12,'Air Ronge'),(1640,4,'Chipman'),(1641,11,'Girardville'),(1642,11,'Saint-Bruno-de-Guigues'),(1643,12,'Grenfell'),(1644,4,'Dorchester'),(1645,9,'South Algonquin'),(1646,2,'Windermere'),(1647,11,'Saint-Narcisse-de-Beaurivage'),(1648,11,'Saint-René-de-Matane'),(1649,11,'Sainte-Jeanne-d\'Arc'),(1650,11,'Plaisance'),(1651,11,'Roxton-Sud'),(1652,12,'St. Louis No. 431'),(1653,2,'Youbou'),(1654,1,'Duchess'),(1655,11,'Saint-Frédéric'),(1656,1,'Viking'),(1657,9,'Sioux Narrows-Nestor Falls'),(1658,1,'Whitecourt'),(1659,8,'Repulse Bay'),(1660,11,'Montréal-Est'),(1661,9,'King'),(1662,12,'Regina Beach'),(1663,11,'Saint-Patrice-de-Beaurivage'),(1664,2,'Ootischenia'),(1665,9,'Hensall'),(1666,1,'Bentley'),(1667,4,'Durham'),(1668,11,'Sainte-Marthe'),(1669,11,'Notre-Dame-du-Nord'),(1670,12,'Pinehouse'),(1671,11,'Saint-Aimé-des-Lacs'),(1672,11,'Lac-Drolet'),(1673,12,'Preeceville'),(1674,12,'Maple Creek No. 111'),(1675,5,'Harbour Main-Chapel\'s Cove-Lakeview'),(1676,11,'Saint-Wenceslas'),(1677,12,'Weyburn No. 67'),(1678,12,'Birch Hills'),(1679,6,'Wedgeport'),(1680,12,'Kerrobert'),(1681,4,'Havelock'),(1682,12,'Eston'),(1683,11,'Sainte-Geneviève-de-Batiscan'),(1684,11,'Saint-Justin'),(1685,11,'Saint-Norbert'),(1686,9,'Schreiber'),(1687,1,'Trochu'),(1688,4,'Botsford'),(1689,11,'Riviere-Ouelle'),(1690,4,'Greenwich'),(1691,11,'Stukely-Sud'),(1692,11,'Saint-Georges-de-Clarenceville'),(1693,11,'Sainte-Thérèse-de-Gaspé'),(1694,9,'Beachburg'),(1695,11,'Desbiens'),(1696,8,'Clyde River'),(1697,11,'La Macaza'),(1698,10,'Souris'),(1699,12,'Kindersley No. 290'),(1700,9,'Laird'),(1701,1,'Falher'),(1702,11,'Saint-Vallier'),(1703,11,'Coleraine'),(1704,3,'Melita'),(1705,4,'Noonan'),(1706,11,'Sainte-Pétronille'),(1707,12,'Delisle'),(1708,11,'Bristol'),(1709,6,'Mahone Bay'),(1710,12,'Waldheim'),(1711,11,'Saint-Sylvestre'),(1712,8,'Taloyoak'),(1713,1,'Onoway'),(1714,11,'Saint-Stanislas'),(1715,10,'Malpeque'),(1716,9,'Plantagenet'),(1717,11,'Longue-Rive'),(1718,3,'Argyle'),(1719,12,'Davidson'),(1720,4,'Plaster Rock'),(1721,4,'Wilmot'),(1722,2,'Valemount'),(1723,11,'Saint-Léonard-de-Portneuf'),(1724,1,'Alberta Beach'),(1725,11,'Saint-Narcisse-de-Rimouski'),(1726,11,'Saint-Bonaventure'),(1727,12,'Longlaketon No. 219'),(1728,9,'Papineau-Cameron'),(1729,9,'Assiginack'),(1730,11,'Brébeuf'),(1731,2,'Hudson Hope'),(1732,9,'Prince'),(1733,11,'Baie-du-Febvre'),(1734,11,'Durham-Sud'),(1735,11,'Melbourne'),(1736,12,'Nipawin No. 487'),(1737,12,'Duck Lake No. 463'),(1738,1,'Oyen');
/*!40000 ALTER TABLE `citys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prov`
--

DROP TABLE IF EXISTS `prov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prov` (
  `prov_id` int NOT NULL AUTO_INCREMENT,
  `province` varchar(80) DEFAULT NULL,
  `prov_short` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prov`
--

LOCK TABLES `prov` WRITE;
/*!40000 ALTER TABLE `prov` DISABLE KEYS */;
INSERT INTO `prov` VALUES (1,'Alberta','AB'),(2,'British Columbia','BC'),(3,'Manitoba','MB'),(4,'New Brunswick','NB'),(5,'Newfoundland and Labrador','NL'),(6,'Nova Scotia','NS'),(7,'Northwest Territories','NT'),(8,'Nunavut','NU'),(9,'Ontario','ON'),(10,'Prince Edward Island','PE'),(11,'Quebec','QC'),(12,'Saskatchewan','SK'),(13,'Yukon','YT');
/*!40000 ALTER TABLE `prov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `bank_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `means_id` int DEFAULT NULL,
  `trans_date` varchar(11) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `debit_amnt` decimal(12,2) DEFAULT NULL,
  `credit_amnt` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`register_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_accounts`
--

DROP TABLE IF EXISTS `sub_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_accounts` (
  `sub_account_id` int NOT NULL AUTO_INCREMENT,
  `sub_account_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sub_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_accounts`
--

LOCK TABLES `sub_accounts` WRITE;
/*!40000 ALTER TABLE `sub_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernames`
--

DROP TABLE IF EXISTS `usernames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernames` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(40) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `password_reset` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `usernames_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernames`
--

LOCK TABLES `usernames` WRITE;
/*!40000 ALTER TABLE `usernames` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernames` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-26  9:12:06
