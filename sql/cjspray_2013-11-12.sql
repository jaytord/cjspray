# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: cjspray
# Generation Time: 2013-11-13 04:22:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dealer_only` varchar(100) DEFAULT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table selections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `selections`;

CREATE TABLE `selections` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(100) DEFAULT NULL,
  `part_number` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `exclude` varchar(200) DEFAULT NULL,
  `dealer_only` varchar(100) DEFAULT NULL,
  `list_price` varchar(100) DEFAULT NULL,
  `dealer_price` varchar(100) DEFAULT NULL,
  `cj_price` varchar(100) DEFAULT NULL,
  `cost_price` varchar(100) DEFAULT NULL,
  `option_index` varchar(100) DEFAULT NULL,
  `option_id` varchar(100) DEFAULT NULL,
  `info_index` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `selections` WRITE;
/*!40000 ALTER TABLE `selections` DISABLE KEYS */;

INSERT INTO `selections` (`index`, `id`, `part_number`, `description`, `exclude`, `dealer_only`, `list_price`, `dealer_price`, `cj_price`, `cost_price`, `option_index`, `option_id`, `info_index`)
VALUES
	(1,'1','INIPT105','Gloves, Nitrile, XL - 100 Pack','','0','14.00','14.00','14.00','14.00','1','A',NULL),
	(2,'2','AP71010','Dynasolve CU-6 Gun Cleaner, 1 Gal','','0','78.00','78.00','78.00','78.00','1','A',NULL),
	(3,'3','AP71004','Ecolink Gun Cleaner, 5 Gal','','0','285.00','285.00','285.00','285.00','1','A',NULL),
	(4,'4','1202313','Coverall, XL, WBP, 25/Case','','0','85.00','85.00','85.00','85.00','1','A',NULL),
	(5,'5','41-1497','Fabric Stretch Sock','','0','1.00','1.00','1.00','1.00','1','A',NULL),
	(6,'6','515010','Soft Stretch Protective Hood, Loose, 10 Pack','','0','9.00','9.00','9.00','9.00','1','A',NULL),
	(7,'7','515050','Soft Stretch Protective Hood, Loose, 50 Pack','','0','39.00','39.00','39.00','39.00','1','A',NULL),
	(8,'8','378002','3M 6000 Series Full Face Mask w/ OV Cartridge','','0','155.00','155.00','155.00','155.00','1','A',NULL),
	(9,'9','7142','Lense Covers, 25 Pack','','0','25.00','25.00','25.00','25.00','1','A',NULL),
	(10,'10','6001','Organic Vapor Cartridge, 2 Pack','','0','8.00','8.00','8.00','8.00','1','A',NULL),
	(11,'11','3AY71A','Bung Wrench, 55 Gal','','0','48.00','48.00','48.00','48.00','1','A',NULL),
	(12,'12','206996','Fluid, Graco TSL,1 Gal','','0','93.00','93.00','93.00','93.00','1','A',NULL),
	(13,'13','515662','Band Heater, 55 Gal, 110 V, w/ Thermostat','','0','198.00','198.00','198.00','198.00','1','A',NULL),
	(14,'14','15C381','Dryer, Desiccand, Replacement Cartridge','','0','41.00','41.00','41.00','41.00','1','A',NULL),
	(15,'15','289103M','3M Chemical Sorbent Spill Response Pack, EA','','0','98.00','98.00','98.00','98.00','1','A',NULL),
	(16,'A','','16’ Bumper Pull ','CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC10:CC11:CC12:CC13','0','11,907.00','11,907.00','11,907.00','11,907.00','2','B',NULL),
	(17,'B','','20’ Bumper Pull','','0','18,643.00','18,643.00','18,643.00','18,643.00','2','B',NULL),
	(18,'C','','28’ Gooseneck','','0','23,936.00','23,936.00','23,936.00','23,936.00','2','B',NULL),
	(19,'D','','Custom Box Truck','','0','10,800.00','10,800.00','10,800.00','10,800.00','2','B',NULL),
	(20,'E','','AiMS Trailer','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC10:CC11:CC12:CC13','0','23,930.00','23,930.00','23,930.00','23,930.00','2','B',NULL),
	(21,'0','','No Reactor (Dealer only – Must specify size to be installed)','','0','0.00','0.00','0.00','0.00','3','CC',NULL),
	(22,'1','AP3831','A-25: 6.0 kW Heater','','0','12,390.00','8,673.00','9,912.00','9,912.00','3','CC',NULL),
	(23,'2','AP9025','E-20: 6.0 kW Heater','','0','16,150.00','11,305.00','12,920.00','12,920.00','3','CC',NULL),
	(24,'3','AP9035','E-30: 10.2 kW Heater','BA','0','20,170.00','14,119.00','16,136.00','16,136.00','3','CC',NULL),
	(25,'4','AP9058','E-30: 15.3 kW Heater','BA','0','21,520.00','15,064.00','17,216.00','17,216.00','3','CC',NULL),
	(26,'5','AP5401','H-25: 8.0 kW Heater','BA','0','22,860.00','16,002.00','18,288.00','18,288.00','3','CC',NULL),
	(27,'6','AP5407','H-25: 15.3 kW Heater','BA','0','24,210.00','16,947.00','19,368.00','19,368.00','3','CC',NULL),
	(28,'7','AP3400','H-40: 12.0 kW Heater: 1-ph only','BA','0','33,630.00','23,541.00','26,904.00','26,904.00','3','CC',NULL),
	(29,'8','AP3401','H-40: 15.3 kW Heater: 3-ph only','BA','0','33,630.00','23,541.00','26,904.00','26,904.00','3','CC',NULL),
	(30,'9','AP3407','H-40: 20.4 kW Heater: 3-ph only','BA','0','33,630.00','23,541.00','26,904.00','26,904.00','3','CC',NULL),
	(31,'10','AP9033','E-XP1: 10.2 kW Heater','BA','0','16,930.00','11,851.00','13,544.00','13,544.00','3','CC',NULL),
	(32,'11','AP9036','E-XP2: 15.3 kW Heater','BA','0','22,600.00','15,820.00','18,080.00','18,080.00','3','CC',NULL),
	(33,'12','AP5404','H-XP2: 15.3 kW Heater','BA','0','25,550.00','17,885.00','20,440.00','20,440.00','3','CC',NULL),
	(34,'13','AP3404','H-XP3: 20.4kW Heater: 3-ph only','BA','0','33,630.00','23,541.00','26,904.00','26,904.00','3','CC',NULL),
	(35,'14','','E-30i: Integrated Reactor','BA: BB: BC: BD','0','48,670.00','34,069.00','38,936.00','38,936.00','3','CC',NULL),
	(36,'15','','E-30i: High Heat:  Integrated Reactor','BA: BB: BC: BD','0','51,400.00','35,980.00','41,120.00','41,120.00','3','CC',NULL),
	(37,'16','','E-XP2i: Integrated Reactor','BA: BB: BC: BD','0','52,430.00','36,701.00','41,944.00','41,944.00','3','CC',NULL),
	(38,'0','','50 ft Heated Hose: 2:000 psi (Dealer only)','CC10:CC11:CC12:CC13','0','1,905.00','1,333.50','1,524.00','1,524.00','4','D',NULL),
	(39,'1','','50 ft Heated Hose: 3:500 psi (Dealer only)','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9','0','2,560.00','1,792.00','2,048.00','2,048.00','4','D',NULL),
	(40,'2','','110 ft: 2:000 psi','CC10:CC11:CC12:CC13','0','4,468.00','3,127.60','3,574.40','3,574.40','4','D',NULL),
	(41,'3','','110 ft: 3:500 psi','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9','0','6,037.00','4,225.90','4,829.60','4,829.60','4','D',NULL),
	(42,'4','','160 ft: 2:000 psi','CC10:CC11:CC12:CC13','0','6,373.00','4,461.10','5,098.40','5,098.40','4','D',NULL),
	(43,'5','','160 ft: 3:500 psi','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9','0','8,597.00','6,017.90','6,877.60','6,877.60','4','D',NULL),
	(44,'6','','210 ft: 2:000 psi (A-20: E-20: E-XP1 maximum)','CC10:CC11:CC12:CC13','0','8,278.00','5,794.60','6,622.40','6,622.40','4','D',NULL),
	(45,'7','','210 ft: 3:500 psi (A-20: E-20: E-XP1 maximum)','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9','0','11,157.00','7,809.90','8,925.60','8,925.60','4','D',NULL),
	(46,'8','','260 ft: 2:000 psi','CC1:CC2:CC10:CC11:CC12:CC13','0','10,183.00','7,128.10','8,146.40','8,146.40','4','D',NULL),
	(47,'9','','260 ft: 3:500 psi','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC10','0','13,717.00','9,601.90','10,973.60','10,973.60','4','D',NULL),
	(48,'10','','310 ft: 2:000 psi (E-30: H-25: E-XP2: H-XP2 maximum)','CC1:CC2:CC10:CC11:CC12:CC13','0','12,088.00','8,461.60','9,670.40','9,670.40','4','D',NULL),
	(49,'11','','310 ft: 3:500 psi (E-30: H-25: E-XP2: H-XP2 maximum)','CC1:CC2:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC10','0','16,277.00','11,393.90','13,021.60','13,021.60','4','D',NULL),
	(50,'12','','360 ft: 2:000 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC11:CC12:CC13','0','13,993.00','9,795.10','11,194.40','11,194.40','4','D',NULL),
	(51,'13','','360 ft: 3:500 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12:','0','18,837.00','13,185.90','15,069.60','15,069.60','4','D',NULL),
	(52,'14','','410 ft: 2:000 psi (H-40: H-XP3 maximum)','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC11:CC12:C13','0','15,898.00','11,128.60','12,718.40','12,718.40','4','D',NULL),
	(53,'15','','410 ft: 3:500 psi (H-40: H-XP3 maximum)','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12:','0','13,717.00','9,601.90','10,973.60','10,973.60','4','D',NULL),
	(54,'16','','50 ft: RTD: Heated Hose: 2000 psi (Dealer only) ','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13','0','1,905.00','1,333.50','1,524.00','1,524.00','4','D',NULL),
	(55,'17','','50 ft: RTD: Heated Hose: 3500 psi (Dealer only) ','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13','0','2,560.00','1,792.00','2,048.00','2,048.00','4','D',NULL),
	(56,'18','','110 ft: RTD: 2:000 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC16','0','4,468.00','3,127.60','3,574.40','3,574.40','4','D',NULL),
	(57,'19','','110 ft: RTD: 3:500 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC14: CC15','0','6,037.00','4,225.90','4,829.60','4,829.60','4','D',NULL),
	(58,'20','','160 ft: RTD: 2:000 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC16','0','6,373.00','4,461.10','5,098.40','5,098.40','4','D',NULL),
	(59,'21','','160 ft: RTD: 3:500 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC14: CC15','0','8,597.00','6,017.90','6,877.60','6,877.60','4','D',NULL),
	(60,'22','','210 ft: RTD: 2:000 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC16','0','8,278.00','5,794.60','6,622.40','6,622.40','4','D',NULL),
	(61,'23','','210 ft: RTD: 3:500 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC14: CC15','0','11,157.00','7,809.90','8,925.60','8,925.60','4','D',NULL),
	(62,'24','','260 ft: RTD: 2:000 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC16','0','10,183.00','7,128.10','8,146.40','8,146.40','4','D',NULL),
	(63,'25','','260 ft: RTD: 3:500 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC14: CC15','0','13,717.00','9,601.90','10,973.60','10,973.60','4','D',NULL),
	(64,'26','','310 ft: RTD: 2:000 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC16','0','12,088.00','8,461.60','9,670.40','9,670.40','4','D',NULL),
	(65,'27','','310 ft: RTD: 3:500 psi','CC1:CC2:CC10:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC11:CC12: CC13: CC14: CC15','0','16,277.00','11,393.90','13,021.60','13,021.60','4','D',NULL),
	(66,'0','','None (Dealer only)','','0','0.00','0.00','0.00','0.00','5','EE',NULL),
	(67,'1','246101','Fusion Air Purge: one','','0','2,240.00','1,568.00','1,792.00','1,792.00','5','EE',NULL),
	(68,'2','','Fusion Air Purge: two','','0','4,480.00','3,136.00','3,584.00','3,584.00','5','EE',NULL),
	(69,'3','CS01RD','Fusion Clear Shot: one','','0','2,510.00','1,757.00','2,008.00','2,008.00','5','EE',NULL),
	(70,'4','','Fusion Clear Shot: two','','0','5,020.00','3,514.00','4,016.00','4,016.00','5','EE',NULL),
	(71,'5','247061','Fusion Mechanical Purge: one','','0','2,700.00','1,890.00','2,160.00','2,160.00','5','EE',NULL),
	(72,'6','','Fusion Mechanical Purge: two','','0','5,400.00','3,780.00','4,320.00','4,320.00','5','EE',NULL),
	(73,'7','GCP2R1','Probler P2: one','','0','2,780.00','1,946.00','2,224.00','2,224.00','5','EE',NULL),
	(74,'8','','Probler P2: two','','0','5,560.00','3,892.00','4,448.00','4,448.00','5','EE',NULL),
	(75,'0','','None (Dealer only)','','0','0.00','0.00','0.00','0.00','6','F',NULL),
	(76,'1','','T:1 Feed Pumps','CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC13','0','2,250.00','1,575.00','1,800.00','1,800.00','6','F',NULL),
	(77,'2','295616','T:2 Feed Pumps','BA','0','3,350.00','2,345.00','2,680.00','2,680.00','6','F',NULL),
	(78,'3','','Husky 1040 Feed Pumps (Open cell foam only)','BA: BE','0','2,710.00','1,897.00','2,168.00','2,168.00','6','F',NULL),
	(79,'4','','Triton 308 Feed Pumps (Polyurea only)','BE','0','1,954.00','1,367.80','1,563.20','1,563.20','6','F',NULL),
	(80,'0','','None ','BE','0','0.00','0.00','0.00','0.00','7','GG',NULL),
	(81,'1','','Manifold Circulation Kit only','','0','610.00','366.00','366.00','366.00','7','GG',NULL),
	(82,'2','','Manifold AND Heated Hose Circulation Kit','','0','1,130.00','678.00','678.00','678.00','7','GG',NULL),
	(83,'0','','None ','','0','0.00','0.00','0.00','0.00','8','H',NULL),
	(84,'1','224854','Twistork: Graco: one','','0','1,115.00','947.75','1,003.50','1,003.50','8','H',NULL),
	(85,'2','','Twistork: Graco: two','','0','2,230.00','1,895.50','2,007.00','2,007.00','8','H',NULL),
	(86,'1','','17.5 kW 1-ph gas Portable: Generac','BB:BC:BD: CC1:CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC10:CC11:CC12:CC13: BE','0','2,400.00','2,400.00','2,400.00','2,400.00','9','II',NULL),
	(87,'2','','20 kW 1-ph diesel: Cummins','CC3:CC4:CC5:CC6:CC7:CC8:CC9:CC10:CC11:CC12:CC13: BE','0','10,479.00','10,479.00','10,479.00','10,479.00','9','II',NULL),
	(88,'3','','40 kW 3-ph diesel: Morse','CC7: CC1: BE','0','17,170.00','12,300.00','17,170.00','17,170.00','9','II',NULL),
	(89,'4','','22 kW 1-ph diesel: Perkins (Included w/ Intergrated Reactor)','BA: BB: BC: BD','0','0.00','0.00','0.00','0.00','9','II',NULL),
	(90,'1','','3.5 hp electric: 60 gal vertical','BC: BE','0','1,395.00','1,395.00','1,395.00','1,395.00','10','J',NULL),
	(91,'2','','3.5 hp electric: 60 gal horizontal (gooseneck only)','BA:BB:BD: BE','0','1,395.00','1,395.00','1,395.00','1,395.00','10','J',NULL),
	(92,'3','','5 hp electric: 60 gal vertical','BA:BC: BE','0','1,600.00','1,600.00','1,600.00','1,600.00','10','J',NULL),
	(93,'4','','5 hp electric: 60 gal horizontal (gooseneck only)','BA:BB:BD: BE','0','1,765.00','1,765.00','1,765.00','1,765.00','10','J',NULL),
	(94,'5','','7.5 hp electric: 60 gal vertical','BA:BC: BE','0','2,398.00','2,398.00','2,398.00','2,398.00','10','J',NULL),
	(95,'6','','7.5 hp electric: 60 gal horizontal (gooseneck only)','BA:BB:BD: BE','0','2,498.00','2,498.00','2,498.00','2,498.00','10','J',NULL),
	(96,'7','','Screw Compressor: mounted on 40kW Generator','BA: BE','0','6,410.26','5,681.82','6,410.26','6,410.26','10','J',NULL),
	(97,'8','','5 hp electric Hydrovane compressor','BA: BB: BC: BD','0','4,642.31','4,114.77','4,642.31','4,642.31','10','J',NULL),
	(98,'1','','3 Stage Desiccant Dryaire System','J7: BE','0','420.00','420.00','420.00','420.00','11','KK',NULL),
	(99,'2','','Electric Drier for 3.5 hp compressor','J3:J4:J5:J6:J7: BE','0','935.37','935.37','935.37','935.37','11','KK',NULL),
	(100,'3','','Electric Drier for 5 hp - 7.5 hp compressor','J1:J2:J7: BE','0','977.55','977.55','977.55','977.55','11','KK',NULL),
	(101,'4','','Electric Drier for Screw Compressor: 225 deg F inlet capable','J1:J2:J3:J4:J5:J6: BE','0','2,300.00','2,300.00','2,300.00','2,300.00','11','KK',NULL),
	(102,'5','','Electric Drier for Hydrovane Compressor','BA: BB: BC: BD','0','1,200.00','1,200.00','1,200.00','1,200.00','11','KK',NULL),
	(103,'0','','None','','0','','','','','12','L',NULL),
	(104,'1','','Marthech Grade D System w/ 300\' hose and one mask','BA','0','1,760.00','1,760.00','1,760.00','1,760.00','12','L',NULL),
	(105,'2','','Allegro dual worker portable w/ 100\' hose and one mask','','0','1,305.00','1,305.00','1,305.00','1,305.00','12','L',NULL),
	(106,'0','','None','','0','','','','','13','MM',NULL),
	(107,'1','','110 volt electric','','0','171.00','171.00','171.00','171.00','13','MM',NULL),
	(108,'2','','220 volt electric','','0','319.00','319.00','319.00','319.00','13','MM',NULL),
	(109,'3','','AirTronic Heat System','','0','2,850.00','2,850.00','2,850.00','2,850.00','13','MM',NULL),
	(110,'0','','None','','0','0.00','0.00','0.00','0.00','14','N',NULL),
	(111,'1','','110 volt roof mounted AC w/ heat','','0','650.00','650.00','650.00','650.00','14','N',NULL);

/*!40000 ALTER TABLE `selections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `options`;

CREATE TABLE `options` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(100) DEFAULT NULL,
  `dealer_only` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `label` varchar(400) DEFAULT NULL,
  `info_index` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;

INSERT INTO `options` (`index`, `id`, `dealer_only`, `image`, `label`, `info_index`)
VALUES
	(1,'a','0','fpo-option-image.jpg','Accessories',NULL),
	(2,'b','0','fpo-option-image.jpg','Air%20or%20Hydraulic%20Powered',NULL),
	(3,'cc','0','fpo-option-image.jpg','Reactor',NULL),
	(4,'d','0','fpo-option-image.jpg','Heated%20Hose',NULL),
	(5,'ee','0','fpo-option-image.jpg','Spray%20Gun%20%E2%80%93%20Strongly%20recommend%20purchasing%20two%0Aidentical%20spray%20guns%20%28Specify%20mix%20chamber%20size%29',NULL),
	(6,'f','0','fpo-option-image.jpg','Feed%20Pumps',NULL),
	(7,'gg','0','fpo-option-image.jpg','Circulation%20Kits',NULL),
	(8,'h','0','fpo-option-image.jpg','Agitators%3A%20includes%20regulator%20and%20air%20plumbing',NULL),
	(9,'ii','0','fpo-option-image.jpg','Generator',NULL),
	(10,'j','0','fpo-option-image.jpg','Air%20Comrpessor',NULL),
	(11,'kk','0','fpo-option-image.jpg','Air%20Drying%20Equipment',NULL),
	(12,'l','0','fpo-option-image.jpg','Breathable%20Air',NULL),
	(13,'mm','0','fpo-option-image.jpg','Heaters',NULL),
	(14,'n','0','fpo-option-image.jpg','Air%20Conditioner',NULL);

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `remember_code`, `phone`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`)
VALUES
	(1,X'7F000001','jaytord','59beecdf7fc966e2f17fd8f65a4a9aeb09d4a3d4','jaytord@mac.com','9d029802e28cd9c768e8e62277c0df49ec65c48c',NULL,1268889823,1384054564,1,'Jason','Tordsen','ADMIN');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
