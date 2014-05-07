# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.6.16)
# Database: cjspray
# Generation Time: 2014-04-03 03:42:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dealer_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dealer_types`;

CREATE TABLE `dealer_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `dealer_types` WRITE;
/*!40000 ALTER TABLE `dealer_types` DISABLE KEYS */;

INSERT INTO `dealer_types` (`id`, `name`)
VALUES
	(1,'CJ Spray Dealer'),
	(2,'Graco Dealer');

/*!40000 ALTER TABLE `dealer_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dealers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dealers`;

CREATE TABLE `dealers` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '1',
  `company_name` varchar(100) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;

INSERT INTO `dealers` (`index`, `username`, `password`, `email`, `phone`, `created_on`, `last_login`, `active`, `company_name`, `logo`, `type_id`)
VALUES
	(1,'cjsdealer','5571d5d9fd75a9123ecd1b30275474616e81769e','CJ%20Spray%20Dealer','','2014-03-24 21:30:18',NULL,1,'Dealer','',2),
	(2,'jaytord','5571d5d9fd75a9123ecd1b30275474616e81769e','Sherwin%20Williams','','2014-03-24 21:30:18',NULL,1,'Dealer','sherwin.png',2),
	(3,'cbryntesen','5571d5d9fd75a9123ecd1b30275474616e81769e','Chris%20Bryntesen','','2014-03-24 21:30:18',NULL,1,'Dealer','',2),
	(4,'rhino','5571d5d9fd75a9123ecd1b30275474616e81769e','Rhino','','2014-03-24 21:30:18',NULL,1,'Dealer','rhino.png',2),
	(5,'basf','5571d5d9fd75a9123ecd1b30275474616e81769e','BASF','','2014-03-24 21:30:18',NULL,1,'Dealer','',2),
	(6,'diamondliners','5571d5d9fd75a9123ecd1b30275474616e81769e','Diamond%20Liners','','2014-03-24 21:30:18',NULL,1,'Dealer','diamond.png',2),
	(7,'johnson','5571d5d9fd75a9123ecd1b30275474616e81769e','Johnson','','2014-03-24 21:30:18',NULL,1,'Dealer','',2),
	(8,'swd','5571d5d9fd75a9123ecd1b30275474616e81769e','SWD','','2014-03-24 21:30:18',NULL,1,'Dealer','swd.png',2),
	(9,'polysource','5571d5d9fd75a9123ecd1b30275474616e81769e','Polysource','','2014-03-24 21:30:18',NULL,1,'Dealer','polysource.png',1),
	(10,'swrep','5571d5d9fd75a9123ecd1b30275474616e81769e','SWREP','','2014-03-24 21:30:18',NULL,1,'Dealer','',1),
	(11,'csi','5571d5d9fd75a9123ecd1b30275474616e81769e','CSI','','2014-03-24 21:30:18',NULL,1,'Dealer','csi.png',1),
	(12,'idi','5571d5d9fd75a9123ecd1b30275474616e81769e','IDI','','2014-03-24 21:30:18',NULL,1,'Dealer','idi.png',1),
	(13,'paintpumppros','5571d5d9fd75a9123ecd1b30275474616e81769e','Paint%20Pump%20Pros','','2014-03-24 21:30:18',NULL,1,'Dealer','paint_pump_pros.png',1);

/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(10) DEFAULT NULL,
  `dealer_only` varchar(100) DEFAULT NULL,
  `description` text,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`index`, `id`, `dealer_only`, `description`, `image`)
VALUES
	(1,'B','0','Use%20this%20configurator%20tool%20to%20help%20build%20and%20price%20your%20own%20customized%20CJ%20Spray%20Mobile%20Spray%20Rig.%20For%20more%20detailed%20information%20see%20our%20Mobile%20Spray%20Rigs%20brochure.%20If%20you%20have%20any%20questions%20or%20need%20advice%20please%20call.%3Cbr%20%2F%3E%3Cbr%20%2F%3E1-888-CJSPRAY%20%28888-257-7729%29','info/cover.jpg'),
	(2,'B-A','0','16%E2%80%99%20Spray%20foam%20starter%20rig%20with%20Graco%20Reactor%20E20.%20Plenty%20of%20power%20for%20residential%20insulation%2C%20without%20sacraficing%20performance%20or%20reliability.%20Standard%20features%20include%3A%3Cbr%20%2F%3E%3Cbr%20%2F%3E%3Cul%3E%3Cli%3E7%2C000%20lb%20gvw%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EFully%20insulated%20walls%20and%20ceiling%20with%20SPF%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EGenerator%20mounted%20in%20%E2%80%9Cdog%20house%E2%80%9D%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EGalvanized%20steel%20work%20bench%2C%20vise%2C%20blow%20gun%2C%20and%20overhead%20aluminum%20premium%20cabinet%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBarrel%20brace%20system%20for%20two%20sets%20of%20material%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EEpoxy%20floor%20coating%2C%20white%20board%20walls%2C%20white%20ceiling%20board%2C%20and%20premium%20white%20aluminum%20trim%20throughout%20trailer%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3E48%20in.%20curbside%20door%20with%20hose%20hatch%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ERear%20ramp%20door%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBogey%20wheels%20at%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%3C%2Ful%3E','info/PC030203.jpg'),
	(3,'B-B','0','20%E2%80%99%20Premium%20Rigs%20for%20foam%20and%20coating%20applications%20offer%20high%20performance%20and%20a%20proffesional%20apperance.%20Compact%2020%E2%80%99%20layout%20is%20manuverable%20and%20can%20be%20handled%20with%20smaller%20pick-up%20trucks.%20Standard%20features%20include%3A%3Cbr%20%2F%3E%3Cbr%20%2F%3E%3Cul%3E%3Cli%3E14%2C000%20lb%20gvw%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBarrel%20brace%20system%20for%20two%20sets%20of%20material%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%20and%20first%20aid%20kit%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EElectric%20brakes%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBogey%20wheels%20in%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3E48%20in%20curb%20side%20door%20with%20hose%20hatch%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ERear%20swinging%20barn%20doors%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ESparte%20tire%20mounted%20on%20nose%3C%2Fli%3E%3C%2Ful%3E','info/P1070126.jpg'),
	(4,'B-C','0','The%2028%20ft%20Gooseneck%20trailer%20proveds%20more%20rrom%20and%20has%20larger%20axeos%20to%20carry%20more%20material.%20The%20gooseneck%20provides%20greater%20maneuverabiliy%20at%20the%20job-site%20and%20easier%20towing%20down%20the%20road%3Cbr%20%2F%3E%3Cbr%20%2F%3E%3Cul%3E%3Cli%3E16%2C000%20lb%20gvw%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBarrel%20brace%20system%20for%20three%20sets%20of%20material%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%2C%20and%20first%20aid%20kit%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EElectric%20brakes%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBogey%20wheels%20in%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3E48%20in%20curb%20side%20door%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ERear%20swinging%20barn%20doors%20with%20hose%20hatch%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ESparte%20tire%20mounted%20in%20cab%20over%3C%2Fli%3E%3C%2Ful%3E','info/DSC_0107.jpg'),
	(5,'B-D','0','Suppy%20your%20own%20box%20truck%20and%20have%20CJ%20Spray%20customize%20it%20for%20your%20application.%20Box%20trucks%20are%20easy%20to%20maneuver%20and%20can%20reach%20areas%20in%20rugged%20job%20site%20that%20trailers%20cannot.%20They%20are%20capable%20of%20hauling%20heavy%20loads%20and%20are%20easy%20to%20park%20where%20space%20is%20limited.%20Contact%20CJ%20Spray%20for%20truck%20requirements.%20Standard%20installed%20features%20include%3A%3Cbr%20%2F%3E%3Cbr%20%2F%3E%3Cul%3E%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EBarrel%20brace%20system%20for%20two%20or%20three%20sets%20of%20material%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%3Cbr%20%2F%3E%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%2C%20and%20first%20aid%20kit%3C%2Fli%3E%3C%2Ful%3E','info/Sprayer_Pics_018.jpg'),
	(6,'CC','0','What%20Graco%20Reactor%20is%20right%20for%20you%20depends%20on%20your%20application%20and%20plan.%20There%20are%20two%20main%20categories%20of%20Reactors%3A%20Foam%20and%20Coatings.%20They%20are%20both%20similar%20and%20do%20the%20same%20thing%2C%20but%20coating%20proportioners%20are%20capable%20of%20higher%20pressures%20to%20atomize%20heavier%20coatings.%20The%20additional%20pressure%20requires%20more%20horsepower%2C%20so%20Reactors%20for%20coatings%20cost%20more%20than%20Reactors%20for%20foam.%20%3Cbr%20%2F%3E%09%3Cbr%20%2F%3EWithin%20those%20two%20categories%20we%20also%20have%20three%20types%20of%20Reactors%3A%20Air%2C%20Electric%2C%20and%20Hydraulic%2C%20which%20refers%20to%20how%20the%20pumps%20are%20driven.%20Air%20operated%20Reactors%20use%20an%20air%20motor%20to%20drive%20the%20pump%20lowers%20which%20requires%20a%20large%20air%20compressor%20that%20makes%20them%20uncommon%20in%20mobile%20rig%20applications.%20Electric%20Reactors%20are%20a%20great%20balance%20of%20performance%20and%20price%20and%20have%20quickly%20become%20the%20most%20popular%20in%20the%20market%20place.%20Hydraulic%20Reactors%20have%20great%20durability%20and%20can%20have%20higher%20outputs%20than%20the%20electric%20series%20Reactors.%20Along%20with%20the%20hydraulics%20comes%20a%20higher%20price%20tag.','info/3_reactors.jpg'),
	(7,'CC-1','0','Air-Driven%20Reactor%20provides%2020%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Great%20for%20residential%20foam%20applications%2C%20but%20has%20a%20high%20air%20consumption%20of%2027%20cfm.','info/ReactorE_20.jpg'),
	(8,'CC-10','0','Electric-Driven%20Reactor%20provides%201.0%20gpm%20and%202%2C500%20psi.%20Ideal%20for%20low%20output%20coating%20applications.','info/ReactorE_XP1.jpg'),
	(9,'CC-11','0','Electric-Driven%20Reactor%20provides%202.0%20gpm%20and%203%2C500%20psi.','info/ReactorE_XP2.jpg'),
	(10,'CC-12','0','Hydraulic-Driven%20Reactor%20provides%201.5%20gpm%20and%203%2C500%20psi.','info/Reactor_HXP2.jpg'),
	(11,'CC-13','0','Hydraulic-Driven%20Reactor%20provides%202.8%20gpm%20and%203%2C500%20psi.','info/Reactor_HXP3.jpg'),
	(12,'CC-2','0','Electric-Driven%20Reactor%20provides%2020%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Great%20choice%20for%20residential%20foam%20applications.','info/ReactorE_20.jpg'),
	(13,'CC-3','0','Electric-Driven%20Reactor%20provides%2030%20lb%2Fmin%20output%20and%202%2C000%20psi.%20E30%E2%80%99s%20added%20output%20is%20noticeable%20on%20larger%20jobs.','info/ReactorE_30.jpg'),
	(14,'CC-4','0','Electric-Driven%20Reactor%20provides%2030%20lb%2Fmin%20output%20and%202%2C000%20psi.%20E30%E2%80%99s%20added%20output%20is%20noticeable%20on%20larger%20jobs.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info/ReactorE_30.jpg'),
	(15,'CC-5','0','Hydraulic-Driven%20Reactor%20provides%2022%20lb%2Fmin%20output%20and%202%2C000%20psi.','info/Reactor_H25.jpg'),
	(16,'CC-6','0','Hydraulic-Driven%20Reactor%20provides%2022%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info/Reactor_H25.jpg'),
	(17,'CC-7','0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Single%20phase%20is%20not%20ideal%20for%20mobile%20trailers.','info/Reactor_H40_Right.jpg'),
	(18,'CC-8','0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Typically%20used%20in%20roofing%20and%20other%20high%20flow%20applications.','info/Reactor_H40_Right.jpg'),
	(19,'CC-9','0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Typically%20used%20in%20roofing%20and%20other%20high%20flow%20applications.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info/Reactor_H40_Right.jpg'),
	(20,'D','0','Graco%20heated%20hose%20is%20sold%20in%2050%20foot%20sections.%20Also%20included%20is%20the%2010%20ft%20whip%20hose%2C%20and%20fluid%20temperature%20sensor.%20The%20maximum%20hose%20length%20you%20can%20use%20depends%20on%20what%20Reactor%20you%20select.','info/P1070123.jpg'),
	(21,'D-1','0','Graco%20distributors%20can%20order%20the%20trailer%20with%20only%2050%E2%80%99%20of%20heated%20hose%2C%20which%20is%20installed%20in%20the%20trailer%20to%20run%20from%20the%20Reactor%20to%20the%20hose%20wrap.','info/Heated_Hose.jpg'),
	(22,'D-10','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(23,'D-11','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(24,'D-12','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(25,'D-13','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(26,'D-14','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(27,'D-2','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable','info/Heated_Hose.jpg'),
	(28,'D-3','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(29,'D-4','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(30,'D-5','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(31,'D-6','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(32,'D-7','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(33,'D-8','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(34,'D-9','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(35,'EE','0','Strongly%20recommend%20purchasing%20two%20identical%20spray%20guns.%20Choose%20which%20gun%20is%20best%20for%20you%2C%20but%20then%20buy%20TWO.%20When%20spraying%20products%20that%20set-up%20in%20seconds%20have%20a%20second%20gun%20is%20a%20must.%20It%20prevents%20down%20time%2C%20reduces%20wear%20and%20tear%2C%20and%20makes%20trouble%20shooting%20equipment%20much%20easier.','info/FusionCS_Gopher136.jpg'),
	(36,'EE-1','0','The%20Graco%20Fusion%20Air%20Purge%20Gun%20is%20the%20most%20common%202k%20gun%20sold%20today.%20Durable%2C%20easy%20to%20use%2C%20and%20quick%20to%20disassemble%20and%20repair%20have%20made%20this%20a%20good%20choice%20for%20any%20foam%20or%20coatings%20contractor.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/11487.jpg'),
	(37,'EE-3','0','The%20Graco%20Clear%20Shot%20Gun%20is%20the%20newest%20gun%20on%20the%20market%20and%20features%20new%20Clear%20Shot%20technology%20that%20keeps%20the%20mix%20chamber%20cleaner.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/Graco_FusionCS_001.jpg'),
	(38,'EE-7','0','The%20Graco%20Probler%20P2%20came%20from%20GlasCraft%20and%20is%20a%20good%20air%20purge%20gun%20for%20both%20foam%20and%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/P2_Picture.jpg'),
	(39,'F','0','Mobile%20systems%20require%20feed%20pumps%20to%20push%20material%20from%2055%20gallon%20drums%20to%20the%20Reactor%20proportioner.%20Stick%20pumps%20such%20as%20the%20Graco%20T%3A1%20and%20T2%20have%20become%20the%20most%20popular%20choice%20for%20foam%20and%20coating%20contractors.','info/P1070133.jpg'),
	(40,'F-1','0','Graco%20T%3A1%20Stick%20pumps%20are%20ideal%20for%20foam%20or%20coating%20applications%20with%20lower%20flow%20rate%20Reactors.','info/T1x2_pumps.jpg'),
	(41,'F-2','0','Graco%20T%3A2%20Stick%20pumps%20are%20ideal%20for%20foam%20or%20coating%20applications%20with%20higher%20flow%20rate%20Reactors.','info/15258.jpg'),
	(42,'F-3','0','Graco%20diaphragm%20Husky%20pumps%20mount%20on%20wall%20and%20are%20common%20for%201%2F2%20lb%20foams%20that%20do%20not%20use%20245fa%20blowing%20agents.','info/Husky_1050.jpg'),
	(43,'F-4','0','Graco%20Triton%20pumps%20are%20common%20in%20lower%20viscosity%20coatings.','info/triton.jpg'),
	(44,'GG','0','Circulation%20kits%20are%20vital%20to%20any%20mobile%20spray%20rig.%20The%20manifold%20circulation%20kit%20reduces%20material%20waste%20and%20helps%20keep%20your%20rig%20clean%20and%20safe.%20The%20heated%20hose%20circulation%20kit%20is%20extremely%20important%20if%20your%20rig%20will%20sit%20idle%20for%20periods%20of%20two%20weeks%20or%20more.','info/P1070087.jpg'),
	(45,'GG-0','0','No%20circulation%20kit%20is%20installed.%20Graco%E2%80%99s%20stock%20tubing%20runs%20from%20circulation%20manifold%20to%20the%20floor.%20Customer%20supplies%20waste%20pails.',''),
	(46,'GG-1','0','Manifold%20circulation%20kit%20includes%20return%20hoses%20from%20manifold%20back%20to%2055%20gallon%20drum%2C%20sst%20return%20tubes%2C%20and%20desiccant%20dryers.','info/P1070068.jpg'),
	(47,'GG-2','0','Addition%20of%20the%20heated%20hose%20circulation%20kit%20allows%20easy%20circulation%20of%20material%20throughout%20heated%20hose%20-%20reducing%20isocyanate%20crystallization.%20Product%20should%20be%20circulated%20after%20being%20static%20in%20lines%20for%20two%20weeks.%20Heated%20hose%20circulation%20kit%20also%20allows%20for%20faster%20heating%20of%20hoses%20when%20using%20coatings%2C%20or%20foam%20without%20245fa%20blowing%20agent.','info/P1070104.jpg'),
	(48,'H','0','Includes%20regulator%20and%20air%20plumbing.%20Agitators%20are%20not%20required%20for%20most%201.8%20lb%20and%20heavier%20foams.%20They%20are%20common%20when%20using%201%2F2%20lb%20foam%20or%20most%20coatings.%20Check%20with%20your%20material%20supplier%20if%20an%20agitator%20is%20required%20for%20the%20resin.','info/Twistork_Agitator_in_Barrel_app.jpg'),
	(49,'H-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(50,'H-1','0','Graco%20Twistork%20agitator%20is%20mounted%20directly%20in%202%20in%20bung%20opening.','info/Twistork_Agitator.jpg'),
	(51,'H-2','0','Graco%20Twistork%20agitator%20is%20mounted%20directly%20in%202%20in%20bung%20opening.','info/Twistork_Agitator_in_Barrel_app.jpg'),
	(52,'II','0','CJ%20Spray%20configured%20rigs%20use%20generators%20and%20will%20only%20make%20shore%20power%20rigs%20after%20personal%20consulation.%20Generators%20increase%20production%2C%20provide%20clean%20power%20to%20Reactors%2C%20and%20reduce%20personal%20interaction%20with%20dangerous%20electrical%20power.%20The%20right%20generator%20depends%20on%20the%20power%20required%20by%20the%20equipment%20in%20the%20spray%20rig.%20There%20are%20two%20major%20electrical%20components%20in%20each%20rig%3A%20the%20Reactor%20and%20the%20air%20compressor.%20%3Cbr%20%2F%3E%3Cbr%20%2F%3EReactors%20have%20electric%20motors%20and%20very%20large%20electric%20heaters%20that%20can%20draw%20a%20lot%20of%20power.%20Electric%20air%20compressors%20also%20draw%20a%20lot%20of%20power%2C%20especially%20at%20start%20up.%20We%20set%20all%20of%20our%20compressors%20to%20run%20continuously%20so%20they%20do%20not%20turn%20on%20or%20off%2C%20which%20provides%20cleaner%20and%20more%20consistent%20power%20to%20the%20Reactor.%20The%20generator%20should%20still%20be%20sized%20to%20handle%20the%20initiall%20start-up%20of%20the%20compressor.%20There%20are%20also%20other%20electrical%20demands%20inside%20the%20trailer%20that%20add%20up%20such%20as%20compressed%20air%20driers%2C%20heater%2C%20lights%2C%20grinders%2C%20and%20air%20conditioners.%20To%20properly%20size%20the%20generator%20add%20up%20the%20electrical%20requirements%20and%20provide%20a%2025%25%20cushion.%20In%20most%20applications%20the%20E20%20Reactor%20requires%20a%2020%20kW%20generator%20and%20everything%20larger.','info/40_kW_Gen.jpg'),
	(53,'II-1','0','Gas%20operated%20generators%20are%20low%20cost%2C%20but%20do%20not%20provide%20long%20lasting%20durability.%20They%20also%20have%20low%20power%20output%20making%20them%20limited%20to%20E-20%20and%20A-20%20Reactors.%20The%20gas%20generator%20is%20only%20available%20in%20the%2016%20ft%20trailer%20and%20is%20mounted%20in%20the%20%E2%80%9Cdog%20house%E2%80%9D%20on%20our%20EZ%20slide%20system.','info/17_5_kw_gas_generator.jpg'),
	(54,'II-2','0','Small%20diesel%20powered%20generator%20is%20powerful%2C%20durable%2C%20and%20compact%3B%20making%20it%20capable%20of%20fitting%20in%20the%20%E2%80%9Cdog%20house%E2%80%9D%20of%20the%2016%20ft%20trailer.%20Upgrading%20from%20the%20gas%20generator%20to%20this%20diesel%20will%20add%20years%20of%20trouble%20free%20performance%20and%20reliability.','info/20_kW_Diesel.jpg'),
	(55,'II-3','0','John%20Deere%20powered%20diesel%20generator%20provides%20enough%20power%20for%20any%20Graco%20Reactor.%20Has%20optional%20screw%20compressor%20%28see%20air%20compressor%20section%20next%29%20that%20mounts%20directly%20to%20generator%20saving%20space%20and%20power%20draw.','info/40_kW_Gen.jpg'),
	(56,'J','0','Like%20sizing%20a%20generator%2C%20the%20right%20compressor%20will%20be%20dependent%20on%20the%20air%20requirement%20%28scfm%29%20of%20the%20tools%20you%20use.%20Mobile%20spray%20rigs%20use%20several%20pieces%20of%20air%20operated%20equipment%2C%20all%20of%20which%20put%20a%20demand%20on%20the%20air%20compressor.%20The%20drum%20pumps%2C%20spray%20guns%2C%20agitators%20%28optional%29%2C%20and%20fresh%20air%20supply%20systems%20%28optional%29%20all%20require%20compressed%20air.%20Other%20tools%20in%20your%20trade%20may%20also%20require%20compressed%20air.%20For%20example%20scarfers%20used%20in%20the%20foam%20industry%20can%20require%20up%20to%2030%20scfm%20of%20air.%20Another%20consideration%20is%20space%20and%20weight.%20%3Cbr%20%2F%3E%3Cbr%20%2F%3ECJ%20Spray%20offers%20two%20types%20of%20compressors%3A%20electric%20driven%20piston%20compressors%20and%20a%20belt%20driven%20screw%20compressor%20mounted%20on%20the%20generator.%20Electric%20compressors%20are%20cost%20effective%20and%20are%20available%20on%20vertical%20or%20horizontal%20mounted%20tanks.%20Verticle%20tanks%20are%20used%20in%20our%2016%20ft%2C%2020%20ft%2C%20and%20box%20truck%20models%2C%20and%20the%20horizontal%20tanks%20are%20mounted%20above%20the%20cab%20over%20of%20our%20gooseneck%20trailers.%20Our%20screw%20compressor%20option%20is%20mounted%20on%20our%2040%20kW%20generator%20and%20runs%20directly%20off%20the%20diesel%20engine%2C%20so%20there%20is%20no%20electrical%20requirement.%20In%20most%20applications%20a%20tank%20is%20not%20required%20saving%20value%20weight%20and%20space%20making%20the%20screw%20compressor%20a%20great%20option%20for%2020%20ft%20bumper%20pull%20trailers.','info/PC030198.jpg'),
	(57,'J-1','0','18.1%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info/electric_compressor_c_aire.jpg'),
	(58,'J-2','0','18.1%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info/Sprayer_Pics_023.jpg'),
	(59,'J-3','0','17.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info/electric_compressor_c_aire.jpg'),
	(60,'J-4','0','17.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info/Sprayer_Pics_023.jpg'),
	(61,'J-5','0','23.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info/electric_compressor_c_aire.jpg'),
	(62,'J-6','0','23.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info/Sprayer_Pics_023.jpg'),
	(63,'J-7','0','40%20scfm%20%40%20120%20psi.%20Mounted%20directly%20to%20generator%20running%20off%20crankshaft%20of%20engine%2C%20so%20it%20pulls%20no%20electrical%20power%20from%20generator.%20No%20air%20tank%20is%20required%20due%20to%20high%20output.%20Screw%20compressor%20saves%20room%20and%20reduces%20weight.','info/DSC_0023.jpg'),
	(64,'KK','0','The%20moisture%20sensitivity%20of%20isocyanate%20makes%20clean%2C%20dry%20air%20a%20priority%20for%20any%20mobile%20spray%20rig.','info/electric_refridg_air_dryer.jpg'),
	(65,'KK-1','0','Moisture%20trap%2C%20coalescer%2C%20and%20desiccant%20beads%20remove%20moisture%20and%20oil%20from%20compressed%20air.','info/dessicant_air_dryer.jpg'),
	(66,'KK-2','0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info/Sharpe_Dryaire.jpg'),
	(67,'KK-3','0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info/Sharpe_Dryaire.jpg'),
	(68,'KK-4','0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info/electric_refridg_air_dryer.jpg'),
	(69,'L','0','Respiratory%20protection%20is%20vital%20while%20spraying.%20Fresh%20air%20breathing%20systems%20offer%20additional%20protection%20compared%20to%20cartridge%20respirators.%20Fresh%20air%20supplied%20systems%20blow%20clean%20air%20out%20around%20cracks%20between%20face%20and%20facemask.%20When%20using%20standard%20cartridge%20respirators%20you%20are%20breathing%20in%20from%20around%20those%20cracks.','info/P4150091.jpg'),
	(70,'L-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(71,'L-1','0','Mounted%20on%20interior%20wall%20of%20trailer%20creates%20OSHA%20approved%20breathable%20air%20from%20air%20compressor%20mounted%20in%20trailer.%20Includes%20carbon%20monoxide%20detector.%20300%20feet%20of%20Grade%20D%20breathable%20air%20line%20and%203M%20full%20face%20mask%20with%20back%20mounted%20%E2%80%9CY%E2%80%9D%20adapter%20is%20included.%20Hose%20wrap%20is%20mounted%20on%20barn%20door.%20Has%20capability%20of%20running%20several%20masks.','info/martech_fresh_air_supply.jpg'),
	(72,'L-2','0','110%20Volt%20portable%20ambient%20air%20compressor%20comes%20with%20100%20feet%20of%20hose%20and%203M%20full%20face%20mask%20with%20back%20mounted%20%E2%80%9CY%E2%80%9D%20adapter.%20Can%20run%20two%20masks%20off%20this%20compressor.','info/Allegro.jpg'),
	(73,'MM','0','Keep%20material%20and%20work%20space%20warm%20with%20heaters.','info/wall_heater.jpg'),
	(74,'MM-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(75,'MM-1','0','Runs%20off%20generator%20or%20shore%20power%20hook-up.%20Mounts%20flush%20in%20dividing%20wall.%20Includes%20thermostat.','info/Electric_Heater_110.jpg'),
	(76,'MM-2','0','More%20BTUs%2C%20but%20runs%20off%20generator%20only.%20Mounts%20flush%20in%20dividing%20wall.%20Includes%20thermostat.','info/Wall_Heater_240.jpg'),
	(77,'MM-3','0','Can%20run%2024%20hours%20a%20day%2C%207%20days%20a%20week.%20Runs%20on%20diesel%20fuel%20and%2012%20volt%20dc%20power.%20Burns%20only%20one%20gallon%20of%20fuel%20per%2016%20hours%2C%20and%20can%20run%20for%2048%20hours%20without%20charge.%20Battery%20will%20charge%20off%20generator%20or%20shore%20power.%20Great%20option%20for%20contractors%20that%20travel%20long%20distances%2C%20do%20a%20lot%20of%20commercial%2Findustrial%20work%2C%20or%20do%20not%20have%20a%20heated%20facility%20to%20park%20in.','info/airtronic_heater.jpg'),
	(78,'N','0','Air%20conditioners%20are%20not%20just%20for%20your%20comfort.%20245fa%20blowing%20agent%20found%20in%20many%20foams%20will%20easily%20froth%20when%20hot.%20Installing%20an%20air%20conditioner%20in%20your%20mobile%20rig%20can%20keep%20your%20material%20cool%20and%20help%20prevent%20frothing%20which%20leads%20to%20equipment%20problems%20and%20lower%20yields%20from%20your%20SPF.%20If%20you%20are%20a%20insulation%20contractor%20in%20hot%20southern%20climates%20an%20air%20conditioner%20is%20a%20must.','info/air_conditioner.jpg'),
	(79,'N-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(80,'N-1','0','Roof%20mounted%20air%20conditioner%20runs%20on%20110%20Volt%20power%20and%20can%20provide%20some%20heat%20in%20cool%20weather.','info/air_conditioner.jpg');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
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
	(1,'A','0','fpo-option-image.jpg','Accessories',NULL),
	(2,'B','0','fpo-option-image.jpg','Air%20or%20Hydraulic%20Powered','1'),
	(3,'CC','0','fpo-option-image.jpg','Reactor','6'),
	(4,'D','0','fpo-option-image.jpg','Heated%20Hose','20'),
	(5,'EE','0','fpo-option-image.jpg','Spray%20Gun','35'),
	(6,'F','0','fpo-option-image.jpg','Feed%20Pumps','39'),
	(7,'GG','0','fpo-option-image.jpg','Circulation%20Kits','44'),
	(8,'H','0','fpo-option-image.jpg','Agitators%3A%20includes%20regulator%20and%20air%20plumbing','48'),
	(9,'II','0','fpo-option-image.jpg','Generator','52'),
	(10,'J','0','fpo-option-image.jpg','Air%20Comrpessor','56'),
	(11,'KK','0','fpo-option-image.jpg','Air%20Drying%20Equipment','64'),
	(12,'L','0','fpo-option-image.jpg','Breathable%20Air','69'),
	(13,'MM','0','fpo-option-image.jpg','Heaters','73'),
	(14,'N','0','fpo-option-image.jpg','Air%20Conditioner','78');

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_types`;

CREATE TABLE `product_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;

INSERT INTO `product_types` (`id`, `name`)
VALUES
	(1,'CJ Spray'),
	(2,'Graco');

/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table promocodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `promocodes`;

CREATE TABLE `promocodes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `promocodes` WRITE;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;

INSERT INTO `promocodes` (`id`, `title`, `discount`, `code`)
VALUES
	(1,'Demo%2020%25%20Off',0.2,'DEMO20'),
	(2,'Demo%2010%25%20Off',0.1,'DEMO10');

/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table selections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `selections`;

CREATE TABLE `selections` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_index` varchar(100) DEFAULT NULL,
  `option_id` varchar(100) DEFAULT NULL,
  `id` varchar(100) DEFAULT NULL,
  `info_index` varchar(100) DEFAULT NULL,
  `part_number` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `exclude` varchar(800) DEFAULT NULL,
  `dealer_only` varchar(100) DEFAULT NULL,
  `list_price` decimal(10,2) DEFAULT NULL,
  `dealer_price` decimal(10,2) DEFAULT NULL,
  `cj_price` decimal(10,2) DEFAULT NULL,
  `graco_price` decimal(10,2) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `product_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `selections` WRITE;
/*!40000 ALTER TABLE `selections` DISABLE KEYS */;

INSERT INTO `selections` (`index`, `option_index`, `option_id`, `id`, `info_index`, `part_number`, `description`, `exclude`, `dealer_only`, `list_price`, `dealer_price`, `cj_price`, `graco_price`, `image`, `product_type`)
VALUES
	(1,'1','A','1',NULL,'INIPT105','Gloves%2C%20Nitrile%2C%20XL%20-%20100%20Pack','','0',14.00,14.00,14.00,14.00,'',1),
	(2,'1','A','2',NULL,'AP71010','Dynasolve%20CU-6%20Gun%20Cleaner%2C%201%20Gal','','0',78.00,78.00,78.00,78.00,'',1),
	(3,'1','A','3',NULL,'AP71004','Ecolink%20Gun%20Cleaner%2C%205%20Gal','','0',285.00,285.00,285.00,285.00,'',1),
	(4,'1','A','4',NULL,'1202313','Coverall%2C%20XL%2C%20WBP%2C%2025%2FCase','','0',85.00,85.00,85.00,85.00,'',1),
	(5,'1','A','5',NULL,'41-1497','Fabric%20Stretch%20Sock','','0',1.00,1.00,1.00,1.00,'',1),
	(6,'1','A','6',NULL,'515010','Soft%20Stretch%20Protective%20Hood%2C%20Loose%2C%2010%20Pack','','0',9.00,9.00,9.00,9.00,'',1),
	(7,'1','A','7',NULL,'515050','Soft%20Stretch%20Protective%20Hood%2C%20Loose%2C%2050%20Pack','','0',39.00,39.00,39.00,39.00,'',1),
	(8,'1','A','8',NULL,'378002','3M%206000%20Series%20Full%20Face%20Mask%20w%2F%20OV%20Cartridge','','0',155.00,155.00,155.00,155.00,'',1),
	(9,'1','A','9',NULL,'7142','Lense%20Covers%2C%2025%20Pack','','0',25.00,25.00,25.00,25.00,'',1),
	(10,'1','A','10',NULL,'6001','Organic%20Vapor%20Cartridge%2C%202%20Pack','','0',8.00,8.00,8.00,8.00,'',1),
	(11,'1','A','11',NULL,'3AY71A','Bung%20Wrench%2C%2055%20Gal','','0',48.00,48.00,48.00,48.00,'',1),
	(12,'1','A','12',NULL,'206996','Fluid%2C%20Graco%20TSL%2C1%20Gal','','0',93.00,93.00,93.00,93.00,'',1),
	(13,'1','A','13',NULL,'515662','Band%20Heater%2C%2055%20Gal%2C%20110%20V%2C%20w%2F%20Thermostat','','0',198.00,198.00,198.00,198.00,'',1),
	(14,'1','A','14',NULL,'15C381','Dryer%2C%20Desiccand%2C%20Replacement%20Cartridge','','0',41.00,41.00,41.00,41.00,'',1),
	(15,'1','A','15',NULL,'289103M','3M%20Chemical%20Sorbent%20Spill%20Response%20Pack%2C%20EA','','0',98.00,98.00,98.00,98.00,'',1),
	(16,'2','B','A','2','','16%E2%80%99%20Bumper%20Pull','CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48:F-2:F-3:II-4:J-2:J-3:J-4:J-5:J-6:J-7:J-8:KK-5:L-1','0',15265.38,13531.00,15265.38,13531.00,'16BumperPull.jpg',1),
	(17,'2','B','B','3','','20%E2%80%99%20Bumper%20Pull','CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48:II-1:II-4:J-2:J-4:J-6:J-8:KK-5','0',23901.28,21185.00,23901.28,21185.00,'20BumperPull.jpg',1),
	(18,'2','B','C','4','','28%E2%80%99%20Gooseneck','CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48:II-1:II-4:J-1:J-3:J-5:J-8:KK-5','0',30687.18,27200.00,30687.18,27200.00,'28Gooseneck.jpg',1),
	(19,'2','B','D','5','','Custom%20Box%20Truck','CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48:II-1:II-4:J-2:J-4:J-6:J-8:KK-5','0',13846.15,12273.00,13846.15,12273.00,'BoxTruck.jpg',1),
	(20,'2','B','E',NULL,'','AiMS%20Trailer','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40:F-3:F-4:GG-0:II-1:II-2:II-3:J-1:J-2:J-3:J-4:J-5:J-6:J-7:KK-1:KK-2:KK-3:KK-4','0',35191.18,30679.00,35191.18,30679.00,'AimsTrailer.jpg',1),
	(21,'3','CC','1','7','AP2614','A-25%2C%20AP%3A%206.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-E:D-2:D-4:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:II-3','0',16430.00,11501.00,13144.00,9858.00,'',2),
	(22,'3','CC','2','12','CS2614','A-25%2C%20CS%3A%206.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-E:D-2:D-4:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36','0',16700.00,11690.00,13360.00,10020.00,'',2),
	(23,'3','CC','3','13','P22614','A-25%2C%20P2%3A%206.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-E:D-2:D-4:D-6:D-8:D-10:D-11:D-12:D-13:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36','0',16960.00,11872.00,13568.00,10176.00,'',2),
	(24,'3','CC','4','14','AP9025','E-20%2C%20AP%3A%206.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-E:D-2:D-4:D-6:D-8:D-10:D-11:D-12:D-13:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36','0',20980.00,14686.00,16784.00,12588.00,'',2),
	(25,'3','CC','5','15','CS9025','E-20%2C%20CS%3A%206.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-E:D-2:D-4:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36','0',21250.00,14875.00,17000.00,12750.00,'',2),
	(26,'3','CC','6','16','P29025','E-20%2C%20P2%3A%206.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-E:D-2:D-4:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36','0',21510.00,15057.00,17208.00,12906.00,'',2),
	(27,'3','CC','7','17','AP2010','E-30%2C%20R2%2C%20AP%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2:II-3','0',25180.00,17626.00,20144.00,15108.00,'',2),
	(28,'3','CC','8','18','CS2010','E-30%2C%20R2%2C%20CS%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',25450.00,17815.00,20360.00,15270.00,'',2),
	(29,'3','CC','9','19','P22010','E-30%2C%20R2%2C%20P2%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',25710.00,17997.00,20568.00,15426.00,'',2),
	(30,'3','CC','10','8','AP2011','E-30%2C%20R2%2C%20AP%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',26570.00,18599.00,21256.00,15942.00,'',2),
	(31,'3','CC','11','9','CS2011','E-30%2C%20R2%20CS%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',26840.00,18788.00,21472.00,16104.00,'',2),
	(32,'3','CC','12','10','P22011','E-30%2C%20R2%2C%20P2%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',27100.00,18970.00,21680.00,16260.00,'',2),
	(33,'3','CC','13','11','AP2110','E-30%2C%20R2%20Elite%2C%20AP%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',27180.00,19026.00,21744.00,16308.00,'',2),
	(34,'3','CC','14',NULL,'CS2110','E-30%2C%20R2%20Elite%2C%20CS%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',27450.00,19215.00,21960.00,16470.00,'',2),
	(35,'3','CC','15',NULL,'P22110','E-30%2C%20R2%20Elite%20P2%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',27710.00,19397.00,22168.00,16626.00,'',2),
	(36,'3','CC','16',NULL,'AP2111','E-30%2C%20R2%20Elite%2C%20AP%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',28570.00,19999.00,22856.00,17142.00,'',2),
	(37,'3','CC','17',NULL,'CS2111','E-30%2C%20R2%20Elite%2C%20CS%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',28840.00,20188.00,23072.00,17304.00,'',2),
	(38,'3','CC','18',NULL,'P22111','E-30%2C%20R2%20Elite%2C%20P2%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',29100.00,20370.00,23280.00,17460.00,'',2),
	(39,'3','CC','19',NULL,'AP5401','H-25%2C%20AP%3A%208.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',27170.00,19019.00,21736.00,16302.00,'',2),
	(40,'3','CC','20',NULL,'CS5401','H-25%2C%20CS%3A%208.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',27440.00,19208.00,21952.00,16464.00,'',2),
	(41,'3','CC','21',NULL,'P25401','H-25%2C%20P2%3A%208.0%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',27700.00,19390.00,22160.00,16620.00,'',2),
	(42,'3','CC','22',NULL,'AP5407','H-25%2C%20AP%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',28480.00,19936.00,22784.00,17088.00,'',2),
	(43,'3','CC','23',NULL,'CS5407','H-25%2C%20CS%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',28750.00,20125.00,23000.00,17250.00,'',2),
	(44,'3','CC','24',NULL,'P25407','H-25%2C%20P2%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',29010.00,20307.00,23208.00,17406.00,'',2),
	(45,'3','CC','25',NULL,'AP3400','H-40%2C%20AP%3A%2012.0%20kW%20Heater%3A%201-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',37730.00,26411.00,30184.00,22638.00,'',2),
	(46,'3','CC','26',NULL,'P23400','H-40%2C%20P2%3A%2012.0%20kW%20Heater%3A%201-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',38260.00,26782.00,30608.00,22956.00,'',2),
	(47,'3','CC','27',NULL,'AP3401','H-40%2C%20AP%3A%2015.3%20kW%20Heater%3A%203-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',37730.00,26411.00,30184.00,22638.00,'',2),
	(48,'3','CC','28',NULL,'P23401','H-40%2C%20P2%3A%2015.3%20kW%20Heater%3A%203-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',38260.00,26782.00,30608.00,22956.00,'',2),
	(49,'3','CC','29',NULL,'AP3407','H-40%2C%20AP20.4%20kW%20Heater%3A%203-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',37730.00,26411.00,30184.00,22638.00,'',2),
	(50,'3','CC','30',NULL,'P23407','H-40%2C%20P220.4%20kW%20Heater%3A%203-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',38260.00,26782.00,30608.00,22956.00,'',2),
	(51,'3','CC','31',NULL,'AP9033','E-XP1%2C%20AP%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',22040.00,15428.00,17632.00,13224.00,'',2),
	(52,'3','CC','32',NULL,'P29033','E-XP1%2C%20P2%3A%2010.2%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-8:D-10:D-12:D-14:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:D-28:D-29:D-30:D-31:D-32:D-33:D-34:D-35:D-36:F-1:II-1:II-2','0',22570.00,15799.00,18056.00,13542.00,'',2),
	(53,'3','CC','33',NULL,'AP2012','E-XP2%2C%20R2%2C%20AP%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',27900.00,19530.00,22320.00,16740.00,'',2),
	(54,'3','CC','34',NULL,'P22012','E-XP2%2C%20R2%2C%20P2%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',28430.00,19901.00,22744.00,17058.00,'',2),
	(55,'3','CC','35',NULL,'AP2112','E-XP2%2C%20R2%20Elite%2C%20AP%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',29900.00,20930.00,23920.00,17940.00,'',2),
	(56,'3','CC','36',NULL,'P22112','E-XP2%2C%20R2%20Elite%2C%20P2%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',30430.00,21301.00,24344.00,18258.00,'',2),
	(57,'3','CC','37',NULL,'AP5404','H-XP2%2C%20AP%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',30730.00,21511.00,24584.00,18438.00,'',2),
	(58,'3','CC','38',NULL,'P25404','H-XP2%2C%20P2%3A%2015.3%20kW%20Heater%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',31260.00,21882.00,25008.00,18756.00,'',2),
	(59,'3','CC','39',NULL,'AP3404','H-XP3%2C%20AP%3A%2020.4kW%20Heater%3A%203-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',38410.00,26887.00,30728.00,23046.00,'',2),
	(60,'3','CC','40',NULL,'P23404','H-XP3%2C%20P2%3A%2020.4kW%20Heater%3A%203-ph%20only%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-E:D-17:D-19:D-21:D-23:D-25:D-27:D-29:D-31:D-33:D-35:F-1:II-1:II-2','0',38940.00,27258.00,31152.00,23364.00,'',2),
	(61,'3','CC','41',NULL,'AP2079','E-30i%2C%20AP%2C%20Elite%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',54260.00,37982.00,43408.00,32556.00,'',2),
	(62,'3','CC','42',NULL,'CS2079','E-30i%2C%20CS%2C%20Elite%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',54530.00,38171.00,43624.00,32718.00,'',2),
	(63,'3','CC','43',NULL,'P22079','E-30i%2C%20P2%2C%20Elite%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',54790.00,38353.00,43832.00,32874.00,'',2),
	(64,'3','CC','44',NULL,'AP2080','E-30i%2C%20AP%2C%20Elite%2C%20High%20Heat%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',57070.00,39949.00,45656.00,34242.00,'',2),
	(65,'3','CC','45',NULL,'CS2080','E-30i%2C%20CS%2C%20Elite%2C%20High%20Heat%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20CS','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',57340.00,40138.00,45872.00,34404.00,'',2),
	(66,'3','CC','46',NULL,'P22080','E-30i%2C%20P2%2C%20Elite%2C%20High%20Heat%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-18:D-20:D-22:D-24:D-26:D-28:D-30:D-32:D-34:D-36:F-1:II-1:II-2','0',57600.00,40320.00,46080.00,34560.00,'',2),
	(67,'3','CC','47',NULL,'AP2081','E-XP2i%2C%20AP%2C%20Elite%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20Fusion%20AP','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:II-1:II-2','0',58890.00,41223.00,47112.00,35334.00,'',2),
	(68,'3','CC','48',NULL,'P22081','E-XP2i%2C%20P2%2C%20Elite%3A%20Integrated%20Reactor%2C%2050%27%20Hose%2C%2010%27%20Whip%20%26%20P2%20','B-A:B-B:B-C:B-D:D-0:D-1:D-2:D-3:D-4:D-5:D-6:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:II-1:II-2','0',59420.00,41594.00,47536.00,35652.00,'',2),
	(69,'4','D','1','21','','110%20ft%3A%202%3A000%20psi','CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',1945.00,1361.50,1556.00,1167.00,'',2),
	(70,'4','D','2','27','','110%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',2610.00,1827.00,2088.00,1566.00,'',2),
	(71,'4','D','3','28','','160%20ft%3A%202%3A000%20psi','CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',3890.00,2723.00,3112.00,2334.00,'',2),
	(72,'4','D','4','29','','160%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',5220.00,3654.00,4176.00,3132.00,'',2),
	(73,'4','D','5','30','','210%20ft%3A%202%3A000%20psi','CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',5835.00,4084.50,4668.00,3501.00,'',2),
	(74,'4','D','6','31','','210%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',7830.00,5481.00,6264.00,4698.00,'',2),
	(75,'4','D','7','32','','260%20ft%3A%202%3A000%20psi','CC-1:CC-2:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',7780.00,5446.00,6224.00,4668.00,'',2),
	(76,'4','D','8','33','','260%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',10440.00,7308.00,8352.00,6264.00,'',2),
	(77,'4','D','9','34','','310%20ft%3A%202%3A000%20psi','CC-1:CC-2:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',9725.00,6807.50,7780.00,5835.00,'',2),
	(78,'4','D','10','22','','310%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',13050.00,9135.00,10440.00,7830.00,'',2),
	(79,'4','D','11','23','','360%20ft%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',11670.00,8169.00,9336.00,7002.00,'',2),
	(80,'4','D','12','24','','360%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',15660.00,10962.00,12528.00,9396.00,'',2),
	(81,'4','D','13','25','','410%20ft%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',13615.00,9530.50,10892.00,8169.00,'',2),
	(82,'4','D','14','26','','410%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48','0',18270.00,12789.00,14616.00,10962.00,'',2),
	(83,'4','D','17',NULL,'','110%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',1945.00,1361.50,1556.00,1167.00,'',2),
	(84,'4','D','18',NULL,'','110%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',2610.00,1827.00,2088.00,1566.00,'',2),
	(85,'4','D','19',NULL,'','160%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',3890.00,2723.00,3112.00,2334.00,'',2),
	(86,'4','D','20',NULL,'','160%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',5220.00,3654.00,4176.00,3132.00,'',2),
	(87,'4','D','21',NULL,'','210%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',5835.00,4084.50,4668.00,3501.00,'',2),
	(88,'4','D','22',NULL,'','210%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',7830.00,5481.00,6264.00,4698.00,'',2),
	(89,'4','D','23',NULL,'','260%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',7780.00,5446.00,6224.00,4668.00,'',2),
	(90,'4','D','24',NULL,'','260%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',10440.00,7308.00,8352.00,6264.00,'',2),
	(91,'4','D','25',NULL,'','310%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',9725.00,6807.50,7780.00,5835.00,'',2),
	(92,'4','D','26',NULL,'','310%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',13050.00,9135.00,10440.00,7830.00,'',2),
	(93,'4','D','27',NULL,'','110%20ft%3A%20RTD%3A%202%3A000%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',2170.00,1519.00,1736.00,1302.00,'',2),
	(94,'4','D','28',NULL,'','110%20ft%3A%20RTD%3A%203%3A500%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',2850.00,1995.00,2280.00,1710.00,'',2),
	(95,'4','D','29',NULL,'','160%20ft%3A%20RTD%3A%202%3A000%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',4340.00,3038.00,3472.00,2604.00,'',2),
	(96,'4','D','30',NULL,'','160%20ft%3A%20RTD%3A%203%3A500%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',5700.00,3990.00,4560.00,3420.00,'',2),
	(97,'4','D','31',NULL,'','210%20ft%3A%20RTD%3A%202%3A000%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',6510.00,4557.00,5208.00,3906.00,'',2),
	(98,'4','D','32',NULL,'','210%20ft%3A%20RTD%3A%203%3A500%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',8550.00,5985.00,6840.00,5130.00,'',2),
	(99,'4','D','33',NULL,'','260%20ft%3A%20RTD%3A%202%3A000%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',8680.00,6076.00,6944.00,5208.00,'',2),
	(100,'4','D','34',NULL,'','260%20ft%3A%20RTD%3A%203%3A500%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',11400.00,7980.00,9120.00,6840.00,'',2),
	(101,'4','D','35',NULL,'','310%20ft%3A%20RTD%3A%202%3A000%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40','0',10850.00,7595.00,8680.00,6510.00,'',2),
	(102,'4','D','36',NULL,'','310%20ft%3A%20RTD%3A%203%3A500%20psi%2C%20Extreme%20Cover','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',14250.00,9975.00,11400.00,8550.00,'',2),
	(103,'5','EE','1','36','246101','Extra%20Fusion%20Air%20Purge','','0',2280.00,1596.00,1824.00,1368.00,'',2),
	(104,'5','EE','3','37','CS01RD','Extra%20Fusion%20Clear%20Shot','','0',2560.00,1792.00,2048.00,1536.00,'',2),
	(105,'5','EE','7','38','GCP2R1','Extra%20Probler%20P2','','0',2840.00,1988.00,2272.00,1704.00,'',2),
	(106,'6','F','1','40','','T%3A1%20Feed%20Pumps','CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46','0',2300.00,1610.00,1840.00,1380.00,'',2),
	(107,'6','F','2','41','295616','T%3A2%20Feed%20Pumps','B-A','0',3420.00,2394.00,2736.00,2052.00,'',2),
	(108,'6','F','3','42','','Husky%201040%20Feed%20Pumps%20%28Open%20cell%20foam%20only%29','B-A:B-E','0',2780.00,1946.00,2224.00,1668.00,'',2),
	(109,'6','F','4','43','','Triton%20308%20Feed%20Pumps%20%28Polyurea%20only%29','B-E','0',1895.00,1326.50,1516.00,1137.00,'',2),
	(110,'7','GG','0','45','','None','B-E','0',0.00,0.00,0.00,0.00,'',0),
	(111,'7','GG','1','46','','Manifold%20Circulation%20Kit%20only','','0',643.33,439.00,514.66,439.00,'',0),
	(112,'7','GG','2','47','','Manifold%20AND%20Heated%20Hose%20Circulation%20Kit','','0',1203.33,820.00,962.66,820.00,'',0),
	(113,'8','H','0','49','','None','','0',0.00,0.00,0.00,0.00,'',2),
	(114,'8','H','1','50','224854','Twistork%3A%20Graco%3A%20one','','0',1145.00,801.50,916.00,687.00,'',2),
	(115,'8','H','2','51','','Twistork%3A%20Graco%3A%20two','','0',2290.00,1603.00,1832.00,1374.00,'',2),
	(116,'9','II','1','53','','17.5%20kW%201-ph%20Gas%20Portable','B-B:B-C:B-D:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48:B-E','0',3076.92,2727.00,3076.92,2727.00,'',0),
	(117,'9','II','2','54','','20%20kW%201-ph%20Diesel','CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:CC-17:CC-18:CC-19:CC-20:CC-21:CC-22:CC-23:CC-24:CC-25:CC-26:CC-27:CC-28:CC-29:CC-30:CC-31:CC-32:CC-33:CC-34:CC-35:CC-36:CC-37:CC-38:CC-39:CC-40:CC-41:CC-42:CC-43:CC-44:CC-45:CC-46:CC-47:CC-48:B-E','0',13434.62,11908.00,13434.62,11908.00,'',0),
	(118,'9','II','3','55','','40%20kW%203-ph%20Diesel','CC-7:CC-1:B-E','0',17170.00,13977.00,17170.00,13977.00,'',0),
	(119,'9','II','4',NULL,'','22%20kW%201-ph%20Diesel%3A%20Perkins%20%28Included%20w%2F%20Intergrated%20Reactor%29','B-A:B-B:B-C:B-D','0',0.00,0.00,0.00,0.00,'',0),
	(120,'10','J','1','57','','3.5%20hp%20electric%3A%2060%20gal%20vertical','B-C:B-E:KK-3:KK-4','0',1788.46,1585.00,1788.46,1585.00,'',0),
	(121,'10','J','2','58','','3.5%20hp%20electric%3A%2060%20gal%20horizontal%20%28gooseneck%20only%29','B-A:B-B:B-D:B-E:KK-3:KK-4','0',1788.46,1585.00,1788.46,1585.00,'',0),
	(122,'10','J','3','59','','5%20hp%20electric%3A%2060%20gal%20vertical','B-A:B-C:B-E:KK-2:KK-4','0',2051.28,1818.00,2051.28,1818.00,'',0),
	(123,'10','J','4','60','','5%20hp%20electric%3A%2060%20gal%20horizontal%20%28gooseneck%20only%29','B-A:B-B:B-D:B-E:KK-2:KK-4','0',2262.82,2006.00,2262.82,2006.00,'',0),
	(124,'10','J','5','61','','7.5%20hp%20electric%3A%2060%20gal%20vertical','B-A:B-C:B-E:KK-2:KK-4','0',3074.36,2725.00,3074.36,2725.00,'',0),
	(125,'10','J','6','62','','7.5%20hp%20electric%3A%2060%20gal%20horizontal%20%28gooseneck%20only%29','B-A:B-B:B-D:B-E:KK-2:KK-4','0',3202.56,2839.00,3202.56,2839.00,'',0),
	(126,'10','J','7','63','','Screw%20Compressor%3A%20mounted%20on%2040kW%20Generator','B-A:B-E:KK-1:KK-2:KK-3','0',6410.26,5682.00,6410.26,5682.00,'',0),
	(127,'10','J','8',NULL,'','5%20hp%20electric%20Hydrovane%20compressor','B-A:B-B:B-C:B-D','0',4642.31,4115.00,4642.31,4115.00,'',0),
	(128,'11','KK','1','65','','3%20Stage%20Desiccant%20Dryaire%20System','J-7:B-E','0',538.46,477.00,538.46,477.00,'',0),
	(129,'11','KK','2','66','','Electric%20Drier%20for%203.5%20hp%20compressor','J-3:J-4:J-5:J-6:J-7:B-E','0',1199.19,1063.00,1199.19,1063.00,'',0),
	(130,'11','KK','3','67','','Electric%20Drier%20for%205%20hp%20-%207.5%20hp%20compressor','J-1:J-2:J-7:B-E','0',1253.27,1111.00,1253.27,1111.00,'',0),
	(131,'11','KK','4','68','','Electric%20Drier%20for%20Screw%20Compressor%3A%20225%20deg%20F%20inlet%20capable','J-1:J-2:J-3:J-4:J-5:J-6:B-E','0',2948.72,2614.00,2948.72,2614.00,'',0),
	(132,'11','KK','5',NULL,'','Electric%20Drier%20for%20Hydrovane%20Compressor','B-A:B-B:B-C:B-D','0',1538.46,1364.00,1538.46,1364.00,'',0),
	(133,'12','L','0','70','','None','','0',0.00,0.00,0.00,0.00,'',0),
	(134,'12','L','1','71','','Marthech%20Grade%20D%20System%20w%2F%20300%27%20hose%20and%20one%20mask','B-A','0',2821.00,2468.00,2256.41,2468.00,'',0),
	(135,'12','L','2','72','','Allegro%20dual%20worker%20portable%20w%2F%20100%27%20hose%20and%20one%20mask','','0',1673.08,1483.00,1673.08,1483.00,'',0),
	(136,'13','MM','0','74','','None','','0',0.00,0.00,0.00,0.00,'',0),
	(137,'13','MM','1','75','','110%20volt%20electric','','0',219.23,194.00,219.23,194.00,'',0),
	(138,'13','MM','2','76','','220%20volt%20electric','','0',408.97,363.00,408.97,363.00,'',0),
	(139,'13','MM','3','77','','AirTronic%20Heat%20System','','0',3653.85,3239.00,3653.85,3239.00,'',0),
	(140,'14','N','0','79','','None','','0',0.00,0.00,0.00,0.00,'',0),
	(141,'14','N','1','80','','110%20volt%20roof%20mounted%20AC%20w%2F%20heat','','0',833.33,739.00,833.33,739.00,'',0);

/*!40000 ALTER TABLE `selections` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
