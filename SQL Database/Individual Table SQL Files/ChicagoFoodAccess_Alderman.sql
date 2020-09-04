-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: ChicagoFoodAccess
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `Alderman`
--

DROP TABLE IF EXISTS `Alderman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alderman` (
  `Ward` int(11) NOT NULL,
  `AldermanName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zipcode` int(11) DEFAULT NULL,
  `WardPhone` varchar(20) DEFAULT NULL,
  `WardFax` varchar(20) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  `LocationCoor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Ward`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alderman`
--

LOCK TABLES `Alderman` WRITE;
/*!40000 ALTER TABLE `Alderman` DISABLE KEYS */;
INSERT INTO `Alderman` VALUES (1,'La Spata, Daniel','1958 North Milwaukee Avenue','Chicago','IL',60647,'(872) 206-2685','(312) 448-8829','info@the1stward.com','https://www.the1stward.com/','(41.917215, -87.68799)'),(2,'Hopkins, Brian','1400 North Ashland Avenue','Chicago','IL',60622,'(312) 643-2299','(773) 270-4688','Ward02@cityofchicago.org','https://www.aldermanhopkins.com/','(41.907081, -87.667668)'),(3,'Dowell, Pat','5046 South State Street','Chicago','IL',60609,'(773) 373-9273','(773) 373-6852','Ward03@cityofchicago.org','http://www.ward03chicago.com','(41.802934, -87.625955)'),(4,'King, Sophia D.','435 East 35th Street','Chicago','IL',60616,'(773) 536-8103','773-536-7296','Ward04@cityofchicago.org','http://www.aldsophiaking.com','(41.831135, -87.61541)'),(5,'Hairston, Leslie A.','2325 East 71st Street','Chicago','IL',60649,'(773) 324-5555','(773) 324-1585','Ward05@cityofchicago.org','http://leslieahairston.com/','(41.766147, -87.567641)'),(6,'Sawyer, Roderick T.','700 East 79th Street','Chicago','IL',60619,'(773) 635-0006','(773) 891-5679','Ward06@cityofchicago.org','http://www.6ward.com','(41.75124, -87.607315)'),(7,'Mitchell, Gregory I.','2249 East 95th Street','Chicago','IL',60617,'(773) 731-7777','(877) 961-4426','Alderman@gregmitchell7thward.org','http://www.gregmitchell7thward.org/','(41.722546, -87.568167)'),(8,'Harris, Michelle A.','8539 South Cottage Grove Avenue','Chicago','IL',60619,'(773) 874-3300','(773) 224-2425','Ward08@cityofchicago.org','http://www.Aldermanmichelleharris.net','(41.7396, -87.604836)'),(9,'Beale, Anthony','34 East 112th Place','Chicago','IL',60628,'(773) 785-1100','(773) 785-2900','Ward09@cityofchicago.org','http://www.Ward09.com','(41.689882, -87.621593)'),(10,'Sadlowski Garza, Susan','10500 South Ewing Avenue, 1st Floor','Chicago','IL',60617,'(773) 768-8138','(773) 368-8176','Ward10@cityofchicago.org','https://www.aldssg.com/','(41.704464, -87.535294)'),(11,'Thompson, Patrick D.','3659 South Halsted Street','Chicago','IL',60609,'(773) 254-6677','(773) 254-6776','Ward11@cityofchicago.org','http://www.ward11.org','(41.827492, -87.646028)'),(12,'Cardenas, George A.','3476 South Archer Avenue','Chicago','IL',60608,'(773) 523-8250','(773) 523-8440','Ward12@cityofchicago.org','http://www.12thwardchicago.com/','(41.830825, -87.677138)'),(13,'Quinn, Marty','6500 South Pulaski Road','Chicago','IL',60629,'(773) 581-8000','(773) 581-9414','Ward13@cityofchicago.org','http://www.madigan-quinn.com/','(41.774549, -87.722735)'),(14,'Burke, Edward M.','2650 West 51st Street','Chicago','IL',60632,'(773) 471-1414','(773) 471-1648','Ward14@cityofchicago.org','','(41.801073, -87.691151)'),(15,'Lopez, Raymond A.','6412 South Ashland Avenue','Chicago','IL',60636,'(773) 823-1539','(773) 424-8720','Ward15@cityofchicago.org','http://www.the15thward.org','(41.777028, -87.664246)'),(16,'Coleman, Stephanie D.','5411 South Ashland Avenue','Chicago','IL',60609,'(773) 306-1981','','Info@16thward.org','https://www.16thward.org','(41.795321, -87.664521)'),(17,'Moore, David H.','1344 West 79th Street','Chicago','IL',60636,'(773) 783-3672','(773) 783-3878','Alderman@17ward.com','http://www.David.Moore@cityofchicago.org','(41.75044, -87.657221)'),(18,'Curtis, Derrick G.','8359 South Pulaski Road','Chicago','IL',60652,'(773) 284-5057','(773) 284-5956','Ward18@cityofchicago.org','','(41.740812, -87.72154)'),(19,'O\'Shea, Matthew J.','10400 South Western Avenue','Chicago','IL',60643,'(773) 238-8766','(773) 672-5133','Ward19@cityofchicago.org','http://the19thward.com/','(41.70449, -87.681569)'),(20,'Taylor, Jeanette B.','5707 South Wentworth Avenue','Chicago','IL',60621,'(773) 966-5336','','Jeanette.Taylor@cityofchicago.org','','(41.7905, -87.630388)'),(21,'Brookins, Jr., Howard','9011 South Ashland Avenue, Unit B','Chicago','IL',60620,'(773) 881-9300','(773) 881-2152','Ward21@cityofchicago.org','http://www.21Chicago.com','(41.729853, -87.662843)'),(22,'Rodriguez, Michael D.','2500 South St. Louis Avenue','Chicago','IL',60623,'(773) 762-1771','(773) 762-1825','Ward22@cityofchicago.org','','(41.845964, -87.712378)'),(23,'Tabares, Silvana','6247 South Archer Avenue','Chicago','IL',60638,'(773) 582-4444','(773) 582-3332','Ward23@cityofchicago.org','','(41.793505, -87.776464)'),(24,'Scott, Jr. Michael','1158 South Keeler Street','Chicago','IL',60624,'(773) 533-2400','(773) 722-2400','Ward24@cityofchicago.org','http://www.aldermanscott.com','(41.86618, -87.730033)'),(25,'Sigcho-Lopez, Byron','1645 South Blue Island Avenue','Chicago','IL',60608,'(773) 523-4100','','Inquiries@25thward.org','https://www.25thward.org','(41.858836, -87.660336)'),(26,'Maldonado, Roberto','2511 West Division Street','Chicago','IL',60622,'(773) 395-0143','(773) 395-0146','Ward26@cityofchicago.org','http://robertomaldonado.com','(41.903011, -87.69)'),(27,'Burnett, Jr., Walter','4 North Western Avenue','Chicago','IL',60612,'(312) 432-1995','(312) 432-1049','Ward27@cityofchicago.org','http://aldermanburnett.com/','(41.881257, -87.686515)'),(28,'Ervin, Jason C.','2622 West Jackson Boulevard, Suite 200A','Chicago','IL',60612,'(773) 533-0900','(773) 522-9842','Ward28@cityofchicago.org','http://www.AldermanErvin.com/','(41.877516, -87.691743)'),(29,'Taliaferro, Chris','6272 West North Avenue','Chicago','IL',60639,'(773) 417-3302','(773) 237-6418','Ward29@cityofchicago.org','http://www.aldtaliaferro.com','(41.909239, -87.782838)'),(30,'Reboyras, Ariel','3559 North Milwaukee Avenue','Chicago','IL',60641,'(773) 794-3095','(773) 794-8576','Ward30@cityofchicago.org','https://www.30thwardchicago.com/','(41.945277, -87.733966)'),(31,'Cardona, Jr., Felix','4606 West Diversey Avenue','Chicago','IL',60639,'(773) 824-2000','(773) 826-2006','Ward31@cityofchicago.org','https://www.felix31.org','(41.93162, -87.74204)'),(32,'Waguespack, Scott','2657 North Clybourn Avenue','Chicago','IL',60614,'(773) 248-1330','(773) 248-1360','Ward32@cityofchicago.org','http://www.ward32.org','(41.929837, -87.675268)'),(33,'Rodriguez Sanchez, Rossana','3001 West Irving Park Road','Chicago','IL',60618,'(773) 840-7880','','Info@33rdward.org','','(41.95392, -87.703301)'),(34,'Austin, Carrie M.','507 West 111th Street','Chicago','IL',60628,'(773) 928-6961','(773) 928-8562','Ward34@cityofchicago.org','http://www.34thward.org','(41.692436, -87.635452)'),(35,'Ramirez-Rosa, Carlos','2934 North Milwaukee Avenue, Unit C','Chicago','IL',60618,'(773) 887-3772','(773) 887-5739','Ward35@cityofchicago.org','http://www.aldermancarlosrosa.org','(41.934652, -87.716556)'),(36,'Villegas, Gilbert','6934 West Diversey Avenue','Chciago','IL',60607,'(773) 745-4636','(773) 745-4638','Ward36@cityofchicago.org','http://www.36thward.org','(41.930830, -87.800830)'),(37,'Mitts, Emma','5344 West North Avenue','Chicago','IL',60651,'(773) 379-0960','(773) 773-0966','Ward37@cityofchicago.org','','(41.909514, -87.759726)'),(38,'Sposato, Nicholas','3821 North Harlem Avenue','Chicago','IL',60634,'(773) 283-3838','(773) 283-3235','Ward38@cityofchicago.org','http://aldermansposato.com/','(41.949577, -87.807131)'),(39,'Nugent, Samantha','4200 West Lawrence Avenue','Chicago','IL',60630,'(773) 736-5594','','','http://www.ward39@cityofchicago.org','(41.968209, -87.733182)'),(40,'Vasquez, Jr., Andres','5620 North Western Avenue','Chicago','IL',60659,'(773) 654-1867','','Info@40thward.org','http://www.40thward.org','(41.983728, -87.689517)'),(41,'Napolitano, Anthony V.','7442 North Harlem Avenue','Chicago','IL',60631,'(773) 631-2241','(773) 631-2479','Ward41@cityofchicago.org','http://www.chicago41.com','(42.016669, -87.806594)'),(42,'Reilly, Brendan','121 North LaSalle Street, Room 200,Office 6','Chcago','IL',60602,'(312) 642-4242','','office@ward42chicago.com','http://www.ward42chicago.com/','(41.883580, -87.632330)'),(43,'Smith, Michele','2523 North Halsted Street','Chicago','IL',60614,'(773) 348-9500','(773) 348-9594','Ward43@cityofchicago.org','http://www.ward43.org/','(41.928003, -87.648822)'),(44,'Tunney, Thomas','3223 North Sheffield Avenue, Suite A','Chicago','IL',60657,'(773) 525-6034','(773) 525-5058','Ward44@cityofchicago.org','http://44thward.org/','(41.940497, -87.654108)'),(45,'Gardiner, James M.','5425 West Lawrence Avenue','Chicago','IL',60630,'(773) 853-0799','','ward45@cityofchicago.org','http://www.aldermangardiner.com','(41.96774, -87.763536)'),(46,'Cappleman, James','4544 North Broadway','Chicago','IL',60640,'(773) 878-4646','(773) 878-4920','Ward46@cityofchicago.org','http://www.James46.org/','(41.964476, -87.656865)'),(47,'Martin, Matthew J.','4243 North Lincoln Avenue','Chicago','IL',60618,'(773) 868-4747','','info@aldermanmartin.com','http://www.aldermanmartin.com','(41.958872, -87.682027)'),(48,'Osterman, Harry','5533 North Broadway','Chicago','IL',60640,'(773) 784-5277','(773) 784-6630','Ward48@cityofchicago.org','http://www.48thward.org','(41.982732, -87.659988)'),(49,'Hadden, Maria E.','1447 West Morse Avenue','Chicago','IL',60626,'(773) 338-5796','','Office@49thward.org','http://www.49thward.org','(42.007933, -87.666963)'),(50,'Silverstein, Debra L.','2949 West Devon Avenue','Chicago','IL',60659,'(773) 262-1050','(773) 381-2970','Ward50@cityofchicago.org','http://50thwardchicago.com','(41.997486, -87.70365)');
/*!40000 ALTER TABLE `Alderman` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-29 14:32:20
