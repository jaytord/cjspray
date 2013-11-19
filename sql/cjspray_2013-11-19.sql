# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: cjspray
# Generation Time: 2013-11-19 14:52:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `dealers` WRITE;
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;

INSERT INTO `dealers` (`index`, `username`, `password`, `email`, `phone`, `created_on`, `last_login`, `active`, `company_name`)
VALUES
	(11,'jaytord','z9sK3r0VasvikbiEp6FGczAa2ocRa4coi0CwzoxvmiVXBpz/laH9IwMjW30eehlKfL4Axdqlsq4cj3Q5u8+o8g==','jaytord@mac.com','9172805010','2013-11-17 22:24:16',NULL,1,'Company A'),
	(12,'demo','fHM9V3/i7o5PJ7XIDGyBOJl5DothcSKbJm3PzbaHVlqE35ls/LAVmab2Nola0Qv9uvLBjpnZAQ6U3gRLHplSmA==','demo@cjspray.com','9172805010','2013-11-19 00:01:18',NULL,1,'Demo Dealer');

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
	(1,'B','0','Use%20this%20configurator%20tool%20to%20help%20build%20and%20price%20your%20own%20customized%20CJ%20Spray%20Mobile%20Spray%20Rig.%20For%20more%20detailed%20information%20see%20our%20Mobile%20Spray%20Rigs%20brochure.%20If%20you%20have%20any%20questions%20or%20need%20advice%20please%20call.%5Cn%5Cn1-888-CJSPRAY%20%28888-257-7729%29','info/cover.jpg'),
	(2,'B-A','0','16%E2%80%99%20Spray%20foam%20starter%20rig%20with%20Graco%20Reactor%20E20.%20Plenty%20of%20power%20for%20residential%20insulation%2C%20without%20sacraficing%20performance%20or%20reliability.%20Standard%20features%20include%3A%5Cn%5Cn%3Cul%3E%3Cli%3E7%2C000%20lb%20gvw%3C%2Fli%3E%5Cn%3Cli%3EFully%20insulated%20walls%20and%20ceiling%20with%20SPF%3C%2Fli%3E%5Cn%3Cli%3EGenerator%20mounted%20in%20%E2%80%9Cdog%20house%E2%80%9D%3C%2Fli%3E%5Cn%3Cli%3EGalvanized%20steel%20work%20bench%2C%20vise%2C%20blow%20gun%2C%20and%20overhead%20aluminum%20premium%20cabinet%3C%2Fli%3E%5Cn%3Cli%3EBarrel%20brace%20system%20for%20two%20sets%20of%20material%3C%2Fli%3E%5Cn%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%5Cn%3Cli%3EEpoxy%20floor%20coating%2C%20white%20board%20walls%2C%20white%20ceiling%20board%2C%20and%20premium%20white%20aluminum%20trim%20throughout%20trailer%3C%2Fli%3E%5Cn%3Cli%3E48%20in.%20curbside%20door%20with%20hose%20hatch%3C%2Fli%3E%5Cn%3Cli%3ERear%20ramp%20door%3C%2Fli%3E%5Cn%3Cli%3EBogey%20wheels%20at%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%5Cn%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%5Cn%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%3C%2Ful%3E','info/PC030203.jpg'),
	(3,'B-B','0','20%E2%80%99%20Premium%20Rigs%20for%20foam%20and%20coating%20applications%20offer%20high%20performance%20and%20a%20proffesional%20apperance.%20Compact%2020%E2%80%99%20layout%20is%20manuverable%20and%20can%20be%20handled%20with%20smaller%20pick-up%20trucks.%20Standard%20features%20include%3A%5Cn%5Cn%3Cul%3E%3Cli%3E14%2C000%20lb%20gvw%3C%2Fli%3E%5Cn%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%5Cn%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%5Cn%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%5Cn%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%5Cn%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%5Cn%3Cli%3EBarrel%20brace%20system%20for%20two%20sets%20of%20material%3C%2Fli%3E%5Cn%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%5Cn%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%20and%20first%20aid%20kit%3C%2Fli%3E%5Cn%3Cli%3EElectric%20brakes%3C%2Fli%3E%5Cn%3Cli%3EBogey%20wheels%20in%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%5Cn%3Cli%3E48%20in%20curb%20side%20door%20with%20hose%20hatch%3C%2Fli%3E%5Cn%3Cli%3ERear%20swinging%20barn%20doors%3C%2Fli%3E%5Cn%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%5Cn%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%5Cn%3Cli%3ESparte%20tire%20mounted%20on%20nose%3C%2Fli%3E%3C%2Ful%3E','info/P1070126.jpg'),
	(4,'B-C','0','The%2028%20ft%20Gooseneck%20trailer%20proveds%20more%20rrom%20and%20has%20larger%20axeos%20to%20carry%20more%20material.%20The%20gooseneck%20provides%20greater%20maneuverabiliy%20at%20the%20job-site%20and%20easier%20towing%20down%20the%20road%5Cn%5Cn%3Cul%3E%3Cli%3E16%2C000%20lb%20gvw%3C%2Fli%3E%5Cn%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%5Cn%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%5Cn%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%5Cn%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%5Cn%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%5Cn%3Cli%3EBarrel%20brace%20system%20for%20three%20sets%20of%20material%3C%2Fli%3E%5Cn%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%5Cn%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%2C%20and%20first%20aid%20kit%3C%2Fli%3E%5Cn%3Cli%3EElectric%20brakes%3C%2Fli%3E%5Cn%3Cli%3EBogey%20wheels%20in%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%5Cn%3Cli%3E48%20in%20curb%20side%20door%3C%2Fli%3E%5Cn%3Cli%3ERear%20swinging%20barn%20doors%20with%20hose%20hatch%3C%2Fli%3E%5Cn%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%5Cn%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%5Cn%3Cli%3ESparte%20tire%20mounted%20in%20cab%20over%3C%2Fli%3E%3C%2Ful%3E','info/DSC_0107.jpg'),
	(5,'B-D','0','Suppy%20your%20own%20box%20truck%20and%20have%20CJ%20Spray%20customize%20it%20for%20your%20application.%20Box%20trucks%20are%20easy%20to%20maneuver%20and%20can%20reach%20areas%20in%20rugged%20job%20site%20that%20trailers%20cannot.%20They%20are%20capable%20of%20hauling%20heavy%20loads%20and%20are%20easy%20to%20park%20where%20space%20is%20limited.%20Contact%20CJ%20Spray%20for%20truck%20requirements.%20Standard%20installed%20features%20include%3A%5Cn%5Cn%3Cul%3E%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%5Cn%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%5Cn%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%5Cn%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%5Cn%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%5Cn%3Cli%3EBarrel%20brace%20system%20for%20two%20or%20three%20sets%20of%20material%3C%2Fli%3E%5Cn%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%5Cn%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%2C%20and%20first%20aid%20kit%3C%2Fli%3E%3C%2Ful%3E','info/Sprayer_Pics_018.jpg'),
	(6,'CC','0','What%20Graco%20Reactor%20is%20right%20for%20you%20depends%20on%20your%20application%20and%20plan.%20There%20are%20two%20main%20categories%20of%20Reactors%3A%20Foam%20and%20Coatings.%20They%20are%20both%20similar%20and%20do%20the%20same%20thing%2C%20but%20coating%20proportioners%20are%20capable%20of%20higher%20pressures%20to%20atomize%20heavier%20coatings.%20The%20additional%20pressure%20requires%20more%20horsepower%2C%20so%20Reactors%20for%20coatings%20cost%20more%20than%20Reactors%20for%20foam.%20%5Cn%09%5CnWithin%20those%20two%20categories%20we%20also%20have%20three%20types%20of%20Reactors%3A%20Air%2C%20Electric%2C%20and%20Hydraulic%2C%20which%20refers%20to%20how%20the%20pumps%20are%20driven.%20Air%20operated%20Reactors%20use%20an%20air%20motor%20to%20drive%20the%20pump%20lowers%20which%20requires%20a%20large%20air%20compressor%20that%20makes%20them%20uncommon%20in%20mobile%20rig%20applications.%20Electric%20Reactors%20are%20a%20great%20balance%20of%20performance%20and%20price%20and%20have%20quickly%20become%20the%20most%20popular%20in%20the%20market%20place.%20Hydraulic%20Reactors%20have%20great%20durability%20and%20can%20have%20higher%20outputs%20than%20the%20electric%20series%20Reactors.%20Along%20with%20the%20hydraulics%20comes%20a%20higher%20price%20tag.','info/3_reactors.jpg'),
	(7,'CC-0','0','Graco%20distributors%20can%20order%20the%20trailer%20without%20a%20Reactor.%20CJ%20Spray%20will%20have%20the%20trailer%20completely%20ready%20for%20your%20installation%20of%20the%20Reactor.%20Wiring%2C%20fluid%20and%20air%20plumbing%20will%20all%20be%20terminated%20to%20the%20point%20of%20installation.%20Must%20specify%20what%20Reactor%20will%20be%20installed%20at%20time%20of%20order.',''),
	(8,'CC-1','0','Air-Driven%20Reactor%20provides%2020%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Great%20for%20residential%20foam%20applications%2C%20but%20has%20a%20high%20air%20consumption%20of%2027%20cfm.','info/ReactorE_20.jpg'),
	(9,'CC-10','0','Electric-Driven%20Reactor%20provides%201.0%20gpm%20and%202%2C500%20psi.%20Ideal%20for%20low%20output%20coating%20applications.','info/ReactorE_XP1.jpg'),
	(10,'CC-11','0','Electric-Driven%20Reactor%20provides%202.0%20gpm%20and%203%2C500%20psi.','info/ReactorE_XP2.jpg'),
	(11,'CC-12','0','Hydraulic-Driven%20Reactor%20provides%201.5%20gpm%20and%203%2C500%20psi.','info/Reactor_HXP2.jpg'),
	(12,'CC-13','0','Hydraulic-Driven%20Reactor%20provides%202.8%20gpm%20and%203%2C500%20psi.','info/Reactor_HXP3.jpg'),
	(13,'CC-2','0','Electric-Driven%20Reactor%20provides%2020%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Great%20choice%20for%20residential%20foam%20applications.','info/ReactorE_20.jpg'),
	(14,'CC-3','0','Electric-Driven%20Reactor%20provides%2030%20lb%2Fmin%20output%20and%202%2C000%20psi.%20E30%E2%80%99s%20added%20output%20is%20noticeable%20on%20larger%20jobs.','info/ReactorE_30.jpg'),
	(15,'CC-4','0','Electric-Driven%20Reactor%20provides%2030%20lb%2Fmin%20output%20and%202%2C000%20psi.%20E30%E2%80%99s%20added%20output%20is%20noticeable%20on%20larger%20jobs.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info/ReactorE_30.jpg'),
	(16,'CC-5','0','Hydraulic-Driven%20Reactor%20provides%2022%20lb%2Fmin%20output%20and%202%2C000%20psi.','info/Reactor_H25.jpg'),
	(17,'CC-6','0','Hydraulic-Driven%20Reactor%20provides%2022%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info/Reactor_H25.jpg'),
	(18,'CC-7','0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Single%20phase%20is%20not%20ideal%20for%20mobile%20trailers.','info/Reactor_H40_Right.jpg'),
	(19,'CC-8','0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Typically%20used%20in%20roofing%20and%20other%20high%20flow%20applications.','info/Reactor_H40_Right.jpg'),
	(20,'CC-9','0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Typically%20used%20in%20roofing%20and%20other%20high%20flow%20applications.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info/Reactor_H40_Right.jpg'),
	(21,'D','0','Graco%20heated%20hose%20is%20sold%20in%2050%20foot%20sections.%20Also%20included%20is%20the%2010%20ft%20whip%20hose%2C%20and%20fluid%20temperature%20sensor.%20The%20maximum%20hose%20length%20you%20can%20use%20depends%20on%20what%20Reactor%20you%20select.','info/P1070123.jpg'),
	(22,'D-0','0','Graco%20distributors%20can%20order%20the%20trailer%20with%20only%2050%E2%80%99%20of%20heated%20hose%2C%20which%20is%20installed%20in%20the%20trailer%20to%20run%20from%20the%20Reactor%20to%20the%20hose%20wrap.','info/Heated_Hose.jpg'),
	(23,'D-1','0','Graco%20distributors%20can%20order%20the%20trailer%20with%20only%2050%E2%80%99%20of%20heated%20hose%2C%20which%20is%20installed%20in%20the%20trailer%20to%20run%20from%20the%20Reactor%20to%20the%20hose%20wrap.','info/Heated_Hose.jpg'),
	(24,'D-10','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(25,'D-11','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(26,'D-12','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(27,'D-13','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(28,'D-14','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(29,'D-15','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(30,'D-2','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable','info/Heated_Hose.jpg'),
	(31,'D-3','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(32,'D-4','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(33,'D-5','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(34,'D-6','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(35,'D-7','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(36,'D-8','0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(37,'D-9','0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info/Heated_Hose.jpg'),
	(38,'EE','0','Strongly%20recommend%20purchasing%20two%20identical%20spray%20guns.%20Choose%20which%20gun%20is%20best%20for%20you%2C%20but%20then%20buy%20TWO.%20When%20spraying%20products%20that%20set-up%20in%20seconds%20have%20a%20second%20gun%20is%20a%20must.%20It%20prevents%20down%20time%2C%20reduces%20wear%20and%20tear%2C%20and%20makes%20trouble%20shooting%20equipment%20much%20easier.','info/FusionCS_Gopher136.jpg'),
	(39,'EE-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(40,'EE-1','0','The%20Graco%20Fusion%20Air%20Purge%20Gun%20is%20the%20most%20common%202k%20gun%20sold%20today.%20Durable%2C%20easy%20to%20use%2C%20and%20quick%20to%20disassemble%20and%20repair%20have%20made%20this%20a%20good%20choice%20for%20any%20foam%20or%20coatings%20contractor.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/11487.jpg'),
	(41,'EE-2','0','The%20Graco%20Fusion%20Air%20Purge%20Gun%20is%20the%20most%20common%202k%20gun%20sold%20today.%20Durable%2C%20easy%20to%20use%2C%20and%20quick%20to%20disassemble%20and%20repair%20have%20made%20this%20a%20good%20choice%20for%20any%20foam%20or%20coatings%20contractor.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/Double_Fusion_Guns_rt.jpg'),
	(42,'EE-3','0','The%20Graco%20Clear%20Shot%20Gun%20is%20the%20newest%20gun%20on%20the%20market%20and%20features%20new%20Clear%20Shot%20technology%20that%20keeps%20the%20mix%20chamber%20cleaner.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/Graco_FusionCS_001.jpg'),
	(43,'EE-4','0','The%20Graco%20Clear%20Shot%20Gun%20is%20the%20newest%20gun%20on%20the%20market%20and%20features%20new%20Clear%20Shot%20technology%20that%20keeps%20the%20mix%20chamber%20cleaner.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/FusionCS_Gopher_093.jpg'),
	(44,'EE-5','0','The%20Graco%20Mechanical%20Purge%20Gun%20improves%20mixing%20and%20is%20a%20common%20choice%20for%20difficult%20to%20mix%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/FusionMP_app.jpg'),
	(45,'EE-6','0','The%20Graco%20Mechanical%20Purge%20Gun%20improves%20mixing%20and%20is%20a%20common%20choice%20for%20difficult%20to%20mix%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/FusionMP_app.jpg'),
	(46,'EE-7','0','The%20Graco%20Probler%20P2%20came%20from%20GlasCraft%20and%20is%20a%20good%20air%20purge%20gun%20for%20both%20foam%20and%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/P2_Picture.jpg'),
	(47,'EE-8','0','The%20Graco%20Probler%20P2%20came%20from%20GlasCraft%20and%20is%20a%20good%20air%20purge%20gun%20for%20both%20foam%20and%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info/P2_Picture.jpg'),
	(48,'F','0','Mobile%20systems%20require%20feed%20pumps%20to%20push%20material%20from%2055%20gallon%20drums%20to%20the%20Reactor%20proportioner.%20Stick%20pumps%20such%20as%20the%20Graco%20T%3A1%20and%20T2%20have%20become%20the%20most%20popular%20choice%20for%20foam%20and%20coating%20contractors.','info/P1070133.jpg'),
	(49,'F-0','0','Fluid%20and%20air%20pluming%20are%20installed%20for%20quick%20assembly.%20Extra%20charge%20will%20apply%20for%20wall%20mount%20brackets%20if%20you%20are%20using%20Husky%201040%20pumps.',''),
	(50,'F-1','0','Graco%20T%3A1%20Stick%20pumps%20are%20ideal%20for%20foam%20or%20coating%20applications%20with%20lower%20flow%20rate%20Reactors.','info/T1x2_pumps.jpg'),
	(51,'F-2','0','Graco%20T%3A2%20Stick%20pumps%20are%20ideal%20for%20foam%20or%20coating%20applications%20with%20higher%20flow%20rate%20Reactors.','info/15258.jpg'),
	(52,'F-3','0','Graco%20diaphragm%20Husky%20pumps%20mount%20on%20wall%20and%20are%20common%20for%201%2F2%20lb%20foams%20that%20do%20not%20use%20245fa%20blowing%20agents.','info/Husky_1050.jpg'),
	(53,'F-4','0','Graco%20Triton%20pumps%20are%20common%20in%20lower%20viscosity%20coatings.','info/triton.jpg'),
	(54,'GG','0','Circulation%20kits%20are%20vital%20to%20any%20mobile%20spray%20rig.%20The%20manifold%20circulation%20kit%20reduces%20material%20waste%20and%20helps%20keep%20your%20rig%20clean%20and%20safe.%20The%20heated%20hose%20circulation%20kit%20is%20extremely%20important%20if%20your%20rig%20will%20sit%20idle%20for%20periods%20of%20two%20weeks%20or%20more.','info/P1070087.jpg'),
	(55,'GG-0','0','No%20circulation%20kit%20is%20installed.%20Graco%E2%80%99s%20stock%20tubing%20runs%20from%20circulation%20manifold%20to%20the%20floor.%20Customer%20supplies%20waste%20pails.',''),
	(56,'GG-1','0','Manifold%20circulation%20kit%20includes%20return%20hoses%20from%20manifold%20back%20to%2055%20gallon%20drum%2C%20sst%20return%20tubes%2C%20and%20desiccant%20dryers.','info/P1070068.jpg'),
	(57,'GG-2','0','Addition%20of%20the%20heated%20hose%20circulation%20kit%20allows%20easy%20circulation%20of%20material%20throughout%20heated%20hose%20-%20reducing%20isocyanate%20crystallization.%20Product%20should%20be%20circulated%20after%20being%20static%20in%20lines%20for%20two%20weeks.%20Heated%20hose%20circulation%20kit%20also%20allows%20for%20faster%20heating%20of%20hoses%20when%20using%20coatings%2C%20or%20foam%20without%20245fa%20blowing%20agent.','info/P1070104.jpg'),
	(58,'H','0','Includes%20regulator%20and%20air%20plumbing.%20Agitators%20are%20not%20required%20for%20most%201.8%20lb%20and%20heavier%20foams.%20They%20are%20common%20when%20using%201%2F2%20lb%20foam%20or%20most%20coatings.%20Check%20with%20your%20material%20supplier%20if%20an%20agitator%20is%20required%20for%20the%20resin.','info/Twistork_Agitator_in_Barrel_app.jpg'),
	(59,'H-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(60,'H-1','0','Graco%20Twistork%20agitator%20is%20mounted%20directly%20in%202%20in%20bung%20opening.','info/Twistork_Agitator.jpg'),
	(61,'H-2','0','Graco%20Twistork%20agitator%20is%20mounted%20directly%20in%202%20in%20bung%20opening.','info/Twistork_Agitator_in_Barrel_app.jpg'),
	(62,'II','0','CJ%20Spray%20configured%20rigs%20use%20generators%20and%20will%20only%20make%20shore%20power%20rigs%20after%20personal%20consulation.%20Generators%20increase%20production%2C%20provide%20clean%20power%20to%20Reactors%2C%20and%20reduce%20personal%20interaction%20with%20dangerous%20electrical%20power.%20The%20right%20generator%20depends%20on%20the%20power%20required%20by%20the%20equipment%20in%20the%20spray%20rig.%20There%20are%20two%20major%20electrical%20components%20in%20each%20rig%3A%20the%20Reactor%20and%20the%20air%20compressor.%20%5Cn%5CnReactors%20have%20electric%20motors%20and%20very%20large%20electric%20heaters%20that%20can%20draw%20a%20lot%20of%20power.%20Electric%20air%20compressors%20also%20draw%20a%20lot%20of%20power%2C%20especially%20at%20start%20up.%20We%20set%20all%20of%20our%20compressors%20to%20run%20continuously%20so%20they%20do%20not%20turn%20on%20or%20off%2C%20which%20provides%20cleaner%20and%20more%20consistent%20power%20to%20the%20Reactor.%20The%20generator%20should%20still%20be%20sized%20to%20handle%20the%20initiall%20start-up%20of%20the%20compressor.%20There%20are%20also%20other%20electrical%20demands%20inside%20the%20trailer%20that%20add%20up%20such%20as%20compressed%20air%20driers%2C%20heater%2C%20lights%2C%20grinders%2C%20and%20air%20conditioners.%20To%20properly%20size%20the%20generator%20add%20up%20the%20electrical%20requirements%20and%20provide%20a%2025%25%20cushion.%20In%20most%20applications%20the%20E20%20Reactor%20requires%20a%2020%20kW%20generator%20and%20everything%20larger.','info/40_kW_Gen.jpg'),
	(63,'II-1','0','Gas%20operated%20generators%20are%20low%20cost%2C%20but%20do%20not%20provide%20long%20lasting%20durability.%20They%20also%20have%20low%20power%20output%20making%20them%20limited%20to%20E-20%20and%20A-20%20Reactors.%20The%20gas%20generator%20is%20only%20available%20in%20the%2016%20ft%20trailer%20and%20is%20mounted%20in%20the%20%E2%80%9Cdog%20house%E2%80%9D%20on%20our%20EZ%20slide%20system.','info/17_5_kw_gas_generator.jpg'),
	(64,'II-2','0','Small%20diesel%20powered%20generator%20is%20powerful%2C%20durable%2C%20and%20compact%3B%20making%20it%20capable%20of%20fitting%20in%20the%20%E2%80%9Cdog%20house%E2%80%9D%20of%20the%2016%20ft%20trailer.%20Upgrading%20from%20the%20gas%20generator%20to%20this%20diesel%20will%20add%20years%20of%20trouble%20free%20performance%20and%20reliability.','info/20_kW_Diesel.jpg'),
	(65,'II-3','0','John%20Deere%20powered%20diesel%20generator%20provides%20enough%20power%20for%20any%20Graco%20Reactor.%20Has%20optional%20screw%20compressor%20%28see%20air%20compressor%20section%20next%29%20that%20mounts%20directly%20to%20generator%20saving%20space%20and%20power%20draw.','info/40_kW_Gen.jpg'),
	(66,'J','0','Like%20sizing%20a%20generator%2C%20the%20right%20compressor%20will%20be%20dependent%20on%20the%20air%20requirement%20%28scfm%29%20of%20the%20tools%20you%20use.%20Mobile%20spray%20rigs%20use%20several%20pieces%20of%20air%20operated%20equipment%2C%20all%20of%20which%20put%20a%20demand%20on%20the%20air%20compressor.%20The%20drum%20pumps%2C%20spray%20guns%2C%20agitators%20%28optional%29%2C%20and%20fresh%20air%20supply%20systems%20%28optional%29%20all%20require%20compressed%20air.%20Other%20tools%20in%20your%20trade%20may%20also%20require%20compressed%20air.%20For%20example%20scarfers%20used%20in%20the%20foam%20industry%20can%20require%20up%20to%2030%20scfm%20of%20air.%20Another%20consideration%20is%20space%20and%20weight.%20%5Cn%5CnCJ%20Spray%20offers%20two%20types%20of%20compressors%3A%20electric%20driven%20piston%20compressors%20and%20a%20belt%20driven%20screw%20compressor%20mounted%20on%20the%20generator.%20Electric%20compressors%20are%20cost%20effective%20and%20are%20available%20on%20vertical%20or%20horizontal%20mounted%20tanks.%20Verticle%20tanks%20are%20used%20in%20our%2016%20ft%2C%2020%20ft%2C%20and%20box%20truck%20models%2C%20and%20the%20horizontal%20tanks%20are%20mounted%20above%20the%20cab%20over%20of%20our%20gooseneck%20trailers.%20Our%20screw%20compressor%20option%20is%20mounted%20on%20our%2040%20kW%20generator%20and%20runs%20directly%20off%20the%20diesel%20engine%2C%20so%20there%20is%20no%20electrical%20requirement.%20In%20most%20applications%20a%20tank%20is%20not%20required%20saving%20value%20weight%20and%20space%20making%20the%20screw%20compressor%20a%20great%20option%20for%2020%20ft%20bumper%20pull%20trailers.','info/PC030198.jpg'),
	(67,'J-1','0','18.1%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info/electric_compressor_c_aire.jpg'),
	(68,'J-2','0','18.1%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info/Sprayer_Pics_023.jpg'),
	(69,'J-3','0','17.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info/electric_compressor_c_aire.jpg'),
	(70,'J-4','0','17.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info/Sprayer_Pics_023.jpg'),
	(71,'J-5','0','23.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info/electric_compressor_c_aire.jpg'),
	(72,'J-6','0','23.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info/Sprayer_Pics_023.jpg'),
	(73,'J-7','0','40%20scfm%20%40%20120%20psi.%20Mounted%20directly%20to%20generator%20running%20off%20crankshaft%20of%20engine%2C%20so%20it%20pulls%20no%20electrical%20power%20from%20generator.%20No%20air%20tank%20is%20required%20due%20to%20high%20output.%20Screw%20compressor%20saves%20room%20and%20reduces%20weight.','info/DSC_0023.jpg'),
	(74,'KK','0','The%20moisture%20sensitivity%20of%20isocyanate%20makes%20clean%2C%20dry%20air%20a%20priority%20for%20any%20mobile%20spray%20rig.','info/electric_refridg_air_dryer.jpg'),
	(75,'KK-1','0','Moisture%20trap%2C%20coalescer%2C%20and%20desiccant%20beads%20remove%20moisture%20and%20oil%20from%20compressed%20air.','info/dessicant_air_dryer.jpg'),
	(76,'KK-2','0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info/Sharpe_Dryaire.jpg'),
	(77,'KK-3','0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info/Sharpe_Dryaire.jpg'),
	(78,'KK-4','0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info/electric_refridg_air_dryer.jpg'),
	(79,'L','0','Respiratory%20protection%20is%20vital%20while%20spraying.%20Fresh%20air%20breathing%20systems%20offer%20additional%20protection%20compared%20to%20cartridge%20respirators.%20Fresh%20air%20supplied%20systems%20blow%20clean%20air%20out%20around%20cracks%20between%20face%20and%20facemask.%20When%20using%20standard%20cartridge%20respirators%20you%20are%20breathing%20in%20from%20around%20those%20cracks.','info/P4150091.jpg'),
	(80,'L-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(81,'L-1','0','Mounted%20on%20interior%20wall%20of%20trailer%20creates%20OSHA%20approved%20breathable%20air%20from%20air%20compressor%20mounted%20in%20trailer.%20Includes%20carbon%20monoxide%20detector.%20300%20feet%20of%20Grade%20D%20breathable%20air%20line%20and%203M%20full%20face%20mask%20with%20back%20mounted%20%E2%80%9CY%E2%80%9D%20adapter%20is%20included.%20Hose%20wrap%20is%20mounted%20on%20barn%20door.%20Has%20capability%20of%20running%20several%20masks.','info/martech_fresh_air_supply.jpg'),
	(82,'L-2','0','110%20Volt%20portable%20ambient%20air%20compressor%20comes%20with%20100%20feet%20of%20hose%20and%203M%20full%20face%20mask%20with%20back%20mounted%20%E2%80%9CY%E2%80%9D%20adapter.%20Can%20run%20two%20masks%20off%20this%20compressor.','info/Allegro.jpg'),
	(83,'MM','0','Keep%20material%20and%20work%20space%20warm%20with%20heaters.','info/wall_heater.jpg'),
	(84,'MM-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(85,'MM-1','0','Runs%20off%20generator%20or%20shore%20power%20hook-up.%20Mounts%20flush%20in%20dividing%20wall.%20Includes%20thermostat.','info/Electric_Heater_110.jpg'),
	(86,'MM-2','0','More%20BTUs%2C%20but%20runs%20off%20generator%20only.%20Mounts%20flush%20in%20dividing%20wall.%20Includes%20thermostat.','info/Wall_Heater_240.jpg'),
	(87,'MM-3','0','Can%20run%2024%20hours%20a%20day%2C%207%20days%20a%20week.%20Runs%20on%20diesel%20fuel%20and%2012%20volt%20dc%20power.%20Burns%20only%20one%20gallon%20of%20fuel%20per%2016%20hours%2C%20and%20can%20run%20for%2048%20hours%20without%20charge.%20Battery%20will%20charge%20off%20generator%20or%20shore%20power.%20Great%20option%20for%20contractors%20that%20travel%20long%20distances%2C%20do%20a%20lot%20of%20commercial%2Findustrial%20work%2C%20or%20do%20not%20have%20a%20heated%20facility%20to%20park%20in.','info/airtronic_heater.jpg'),
	(88,'N','0','Air%20conditioners%20are%20not%20just%20for%20your%20comfort.%20245fa%20blowing%20agent%20found%20in%20many%20foams%20will%20easily%20froth%20when%20hot.%20Installing%20an%20air%20conditioner%20in%20your%20mobile%20rig%20can%20keep%20your%20material%20cool%20and%20help%20prevent%20frothing%20which%20leads%20to%20equipment%20problems%20and%20lower%20yields%20from%20your%20SPF.%20If%20you%20are%20a%20insulation%20contractor%20in%20hot%20southern%20climates%20an%20air%20conditioner%20is%20a%20must.','info/air_conditioner.jpg'),
	(89,'N-0','0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.',''),
	(90,'N-1','0','Roof%20mounted%20air%20conditioner%20runs%20on%20110%20Volt%20power%20and%20can%20provide%20some%20heat%20in%20cool%20weather.','info/air_conditioner.jpg');

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
	(4,'D','0','fpo-option-image.jpg','Heated%20Hose','21'),
	(5,'EE','0','fpo-option-image.jpg','Spray%20Gun','38'),
	(6,'F','0','fpo-option-image.jpg','Feed%20Pumps','48'),
	(7,'GG','0','fpo-option-image.jpg','Circulation%20Kits','54'),
	(8,'H','0','fpo-option-image.jpg','Agitators%3A%20includes%20regulator%20and%20air%20plumbing','58'),
	(9,'II','0','fpo-option-image.jpg','Generator','62'),
	(10,'J','0','fpo-option-image.jpg','Air%20Comrpessor','66'),
	(11,'KK','0','fpo-option-image.jpg','Air%20Drying%20Equipment','74'),
	(12,'L','0','fpo-option-image.jpg','Breathable%20Air','79'),
	(13,'MM','0','fpo-option-image.jpg','Heaters','83'),
	(14,'N','0','fpo-option-image.jpg','Air%20Conditioner','88');

/*!40000 ALTER TABLE `options` ENABLE KEYS */;
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
  `exclude` varchar(200) DEFAULT NULL,
  `dealer_only` varchar(100) DEFAULT NULL,
  `list_price` decimal(10,2) DEFAULT NULL,
  `dealer_price` decimal(10,2) DEFAULT NULL,
  `cj_price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `selections` WRITE;
/*!40000 ALTER TABLE `selections` DISABLE KEYS */;

INSERT INTO `selections` (`index`, `option_index`, `option_id`, `id`, `info_index`, `part_number`, `description`, `exclude`, `dealer_only`, `list_price`, `dealer_price`, `cj_price`, `cost_price`, `image`)
VALUES
	(1,'1','A','1',NULL,'INIPT105','Gloves%2C%20Nitrile%2C%20XL%20-%20100%20Pack','','0',14.00,14.00,14.00,14.00,''),
	(2,'1','A','2',NULL,'AP71010','Dynasolve%20CU-6%20Gun%20Cleaner%2C%201%20Gal','','0',78.00,78.00,78.00,78.00,''),
	(3,'1','A','3',NULL,'AP71004','Ecolink%20Gun%20Cleaner%2C%205%20Gal','','0',285.00,285.00,285.00,285.00,''),
	(4,'1','A','4',NULL,'1202313','Coverall%2C%20XL%2C%20WBP%2C%2025%2FCase','','0',85.00,85.00,85.00,85.00,''),
	(5,'1','A','5',NULL,'41-1497','Fabric%20Stretch%20Sock','','0',1.00,1.00,1.00,1.00,''),
	(6,'1','A','6',NULL,'515010','Soft%20Stretch%20Protective%20Hood%2C%20Loose%2C%2010%20Pack','','0',9.00,9.00,9.00,9.00,''),
	(7,'1','A','7',NULL,'515050','Soft%20Stretch%20Protective%20Hood%2C%20Loose%2C%2050%20Pack','','0',39.00,39.00,39.00,39.00,''),
	(8,'1','A','8',NULL,'378002','3M%206000%20Series%20Full%20Face%20Mask%20w%2F%20OV%20Cartridge','','0',155.00,155.00,155.00,155.00,''),
	(9,'1','A','9',NULL,'7142','Lense%20Covers%2C%2025%20Pack','','0',25.00,25.00,25.00,25.00,''),
	(10,'1','A','10',NULL,'6001','Organic%20Vapor%20Cartridge%2C%202%20Pack','','0',8.00,8.00,8.00,8.00,''),
	(11,'1','A','11',NULL,'3AY71A','Bung%20Wrench%2C%2055%20Gal','','0',48.00,48.00,48.00,48.00,''),
	(12,'1','A','12',NULL,'206996','Fluid%2C%20Graco%20TSL%2C1%20Gal','','0',93.00,93.00,93.00,93.00,''),
	(13,'1','A','13',NULL,'515662','Band%20Heater%2C%2055%20Gal%2C%20110%20V%2C%20w%2F%20Thermostat','','0',198.00,198.00,198.00,198.00,''),
	(14,'1','A','14',NULL,'15C381','Dryer%2C%20Desiccand%2C%20Replacement%20Cartridge','','0',41.00,41.00,41.00,41.00,''),
	(15,'1','A','15',NULL,'289103M','3M%20Chemical%20Sorbent%20Spill%20Response%20Pack%2C%20EA','','0',98.00,98.00,98.00,98.00,''),
	(16,'2','B','A','2','','16%E2%80%99%20Bumper%20Pull%20','CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:CC-14:CC-15:CC-16:F-2:F-3:II-4:J-2:J-3:J-4:J-5:J-6:J-7:J-8:KK-5:L-1','0',11907.00,11907.00,11907.00,11907.00,'16BumperPull.jpg'),
	(17,'2','B','B','3','','20%E2%80%99%20Bumper%20Pull','CC-14:CC-15:CC-16:II-1:II-4:J-2:J-4:J-6:J-8:KK-5','0',18643.00,18643.00,18643.00,18643.00,'20BumperPull.jpg'),
	(18,'2','B','C','4','','28%E2%80%99%20Gooseneck','CC-14:CC-15:CC-16:II-1:II-4:J-1:J-3:J-5:J-8:KK-5','0',23936.00,23936.00,23936.00,23936.00,'28Gooseneck.jpg'),
	(19,'2','B','D','5','','Custom%20Box%20Truck','CC-14:CC-15:CC-16:II-1:II-4:J-2:J-4:J-6:J-8:KK-5','0',10800.00,10800.00,10800.00,10800.00,'BoxTruck.jpg'),
	(20,'2','B','E',NULL,'','AiMS%20Trailer','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:F-3:F-4:GG-0:II-1:II-2:II-3:J-1:J-2:J-3:J-4:J-5:J-6:J-7:KK-1:KK-2:KK-3:KK-4','0',23930.00,23930.00,23930.00,23930.00,'AimsTrailer.jpg'),
	(21,'3','CC','0','7','','No%20Reactor%20%28Dealer%20only%29','','0',0.00,0.00,0.00,0.00,''),
	(22,'3','CC','1','8','AP3831','A-25%3A%206.0%20kW%20Heater','B-E:D-1:D-3:D-5:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:II-1:II-3','0',12390.00,8673.00,9912.00,7434.00,''),
	(23,'3','CC','2','13','AP9025','E-20%3A%206.0%20kW%20Heater','B-E:D-1:D-3:D-5:D-7:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27','0',16150.00,11305.00,12920.00,9690.00,''),
	(24,'3','CC','3','14','AP9035','E-30%3A%2010.2%20kW%20Heater','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',20170.00,14119.00,16136.00,12102.00,''),
	(25,'3','CC','4','15','AP9058','E-30%3A%2015.3%20kW%20Heater','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',21520.00,15064.00,17216.00,12912.00,''),
	(26,'3','CC','5','16','AP5401','H-25%3A%208.0%20kW%20Heater','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',22860.00,16002.00,18288.00,13716.00,''),
	(27,'3','CC','6','17','AP5407','H-25%3A%2015.3%20kW%20Heater','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',24210.00,16947.00,19368.00,14526.00,''),
	(28,'3','CC','7','18','AP3400','H-40%3A%2012.0%20kW%20Heater%3A%201-ph%20only','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-13:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2:II-3','0',33630.00,23541.00,26904.00,20178.00,''),
	(29,'3','CC','8','19','AP3401','H-40%3A%2015.3%20kW%20Heater%3A%203-ph%20only','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-13:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',33630.00,23541.00,26904.00,20178.00,''),
	(30,'3','CC','9','20','AP3407','H-40%3A%2020.4%20kW%20Heater%3A%203-ph%20only','B-A:B-E:D-1:D-3:D-5:D-7:D-9:D-11:D-13:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',33630.00,23541.00,26904.00,20178.00,''),
	(31,'3','CC','10','9','AP9033','E-XP1%3A%2010.2%20kW%20Heater','B-A:B-E:D-0:D-2:D-4:D-6:D-8:D-9:D-10:D-11:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:II-1:II-2','0',16930.00,11851.00,13544.00,10158.00,''),
	(32,'3','CC','11','10','AP9036','E-XP2%3A%2015.3%20kW%20Heater','B-A:B-E:D-0:D-2:D-4:D-6:D-8:D-10:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:II-1:II-2','0',22600.00,15820.00,18080.00,13560.00,''),
	(33,'3','CC','12','11','AP5404','H-XP2%3A%2015.3%20kW%20Heater','B-A:B-E:D-0:D-2:D-4:D-6:D-8:D-10:D-12:D-13:D-14:D-15:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:II-1:II-2','0',25550.00,17885.00,20440.00,15330.00,''),
	(34,'3','CC','13','12','AP3404','H-XP3%3A%2020.4kW%20Heater%3A%203-ph%20only','B-A:B-E:D-0:D-2:D-4:D-6:D-8:D-10:D-12:D-14:D-16:D-17:D-18:D-19:D-20:D-21:D-22:D-23:D-24:D-25:D-26:D-27:F-1:II-1:II-2','0',33630.00,23541.00,26904.00,20178.00,''),
	(35,'3','CC','14',NULL,'','E-30i%3A%20Integrated%20Reactor','B-A:B-B:B-C:B-D:D-19:D-21:D-23:D-25:D-27','0',48670.00,34069.00,38936.00,29202.00,''),
	(36,'3','CC','15',NULL,'','E-30i%3A%20High%20Heat%3A%20%20Integrated%20Reactor','B-A:B-B:B-C:B-D:D-19:D-21:D-23:D-25:D-27','0',51400.00,35980.00,41120.00,30840.00,''),
	(37,'3','CC','16',NULL,'','E-XP2i%3A%20Integrated%20Reactor','B-A:B-B:B-C:B-D:D-18:D-20:D-22:D-24:D-26','0',52430.00,36701.00,41944.00,31458.00,''),
	(38,'4','D','0','22','','50%20ft%20Heated%20Hose%3A%202%3A000%20psi%20%28Dealer%20only%29','CC-10:CC-11:CC-12:CC-13','0',1905.00,1333.50,1524.00,1143.00,''),
	(39,'4','D','1','23','','50%20ft%20Heated%20Hose%3A%203%3A500%20psi%20%28Dealer%20only%29','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9','0',2560.00,1792.00,2048.00,1536.00,''),
	(40,'4','D','2','30','','110%20ft%3A%202%3A000%20psi','CC-10:CC-11:CC-12:CC-13','0',4468.00,3127.60,3574.40,2680.80,''),
	(41,'4','D','3','31','','110%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9','0',6037.00,4225.90,4829.60,3622.20,''),
	(42,'4','D','4','32','','160%20ft%3A%202%3A000%20psi','CC-10:CC-11:CC-12:CC-13','0',6373.00,4461.10,5098.40,3823.80,''),
	(43,'4','D','5','33','','160%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9','0',8597.00,6017.90,6877.60,5158.20,''),
	(44,'4','D','6','34','','210%20ft%3A%202%3A000%20psi%20%28A-20%3A%20E-20%3A%20E-XP1%20maximum%29','CC-10:CC-11:CC-12:CC-13','0',8278.00,5794.60,6622.40,4966.80,''),
	(45,'4','D','7','35','','210%20ft%3A%203%3A500%20psi%20%28A-20%3A%20E-20%3A%20E-XP1%20maximum%29','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9','0',11157.00,7809.90,8925.60,6694.20,''),
	(46,'4','D','8','36','','260%20ft%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-11:CC-12:CC-13','0',10183.00,7128.10,8146.40,6109.80,''),
	(47,'4','D','9','37','','260%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10','0',13717.00,9601.90,10973.60,8230.20,''),
	(48,'4','D','10','24','','310%20ft%3A%202%3A000%20psi%20%28E-30%3A%20H-25%3A%20E-XP2%3A%20H-XP2%20maximum%29','CC-1:CC-2:CC-10:CC-11:CC-12:CC-13','0',12088.00,8461.60,9670.40,7252.80,''),
	(49,'4','D','11','25','','310%20ft%3A%203%3A500%20psi%20%28E-30%3A%20H-25%3A%20E-XP2%3A%20H-XP2%20maximum%29','CC-1:CC-2:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10','0',16277.00,11393.90,13021.60,9766.20,''),
	(50,'4','D','12','26','','360%20ft%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-11:CC-12:CC-13','0',13993.00,9795.10,11194.40,8395.80,''),
	(51,'4','D','13','27','','360%20ft%3A%203%3A500%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12','0',18837.00,13185.90,15069.60,11302.20,''),
	(52,'4','D','14','28','','410%20ft%3A%202%3A000%20psi%20%28H-40%3A%20H-XP3%20maximum%29','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-11:CC-12:CC-13','0',15898.00,11128.60,12718.40,9538.80,''),
	(53,'4','D','15','29','','410%20ft%3A%203%3A500%20psi%20%28H-40%3A%20H-XP3%20maximum%29','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12','0',13717.00,9601.90,10973.60,8230.20,''),
	(54,'4','D','16',NULL,'','50%20ft%3A%20RTD%3A%20Heated%20Hose%3A%202000%20psi%20%28Dealer%20only%29%20','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13','0',1905.00,1333.50,1524.00,1143.00,''),
	(55,'4','D','17',NULL,'','50%20ft%3A%20RTD%3A%20Heated%20Hose%3A%203500%20psi%20%28Dealer%20only%29%20','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13','0',2560.00,1792.00,2048.00,1536.00,''),
	(56,'4','D','18',NULL,'','110%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-16','0',4468.00,3127.60,3574.40,2680.80,''),
	(57,'4','D','19',NULL,'','110%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-14:CC-15','0',6037.00,4225.90,4829.60,3622.20,''),
	(58,'4','D','20',NULL,'','160%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-16','0',6373.00,4461.10,5098.40,3823.80,''),
	(59,'4','D','21',NULL,'','160%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-14:CC-15','0',8597.00,6017.90,6877.60,5158.20,''),
	(60,'4','D','22',NULL,'','210%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-16','0',8278.00,5794.60,6622.40,4966.80,''),
	(61,'4','D','23',NULL,'','210%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-14:CC-15','0',11157.00,7809.90,8925.60,6694.20,''),
	(62,'4','D','24',NULL,'','260%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-16','0',10183.00,7128.10,8146.40,6109.80,''),
	(63,'4','D','25',NULL,'','260%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-14:CC-15','0',13717.00,9601.90,10973.60,8230.20,''),
	(64,'4','D','26',NULL,'','310%20ft%3A%20RTD%3A%202%3A000%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-16','0',12088.00,8461.60,9670.40,7252.80,''),
	(65,'4','D','27',NULL,'','310%20ft%3A%20RTD%3A%203%3A500%20psi','CC-1:CC-2:CC-10:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-11:CC-12:CC-13:CC-14:CC-15','0',16277.00,11393.90,13021.60,9766.20,''),
	(66,'5','EE','0','39','','None%20%28Dealer%20only%29','','0',0.00,0.00,0.00,0.00,''),
	(67,'5','EE','1','40','246101','Fusion%20Air%20Purge%3A%20one','','0',2240.00,1568.00,1792.00,1344.00,''),
	(68,'5','EE','2','41','','Fusion%20Air%20Purge%3A%20two','','0',4480.00,3136.00,3584.00,2688.00,''),
	(69,'5','EE','3','42','CS01RD','Fusion%20Clear%20Shot%3A%20one','','0',2510.00,1757.00,2008.00,1506.00,''),
	(70,'5','EE','4','43','','Fusion%20Clear%20Shot%3A%20two','','0',5020.00,3514.00,4016.00,3012.00,''),
	(71,'5','EE','5','44','247061','Fusion%20Mechanical%20Purge%3A%20one','','0',2700.00,1890.00,2160.00,1620.00,''),
	(72,'5','EE','6','45','','Fusion%20Mechanical%20Purge%3A%20two','','0',5400.00,3780.00,4320.00,3240.00,''),
	(73,'5','EE','7','46','GCP2R1','Probler%20P2%3A%20one','','0',2780.00,1946.00,2224.00,1668.00,''),
	(74,'5','EE','8','47','','Probler%20P2%3A%20two','','0',5560.00,3892.00,4448.00,3336.00,''),
	(75,'6','F','0','49','','None%20%28Dealer%20only%29','','0',0.00,0.00,0.00,0.00,''),
	(76,'6','F','1','50','','T%3A1%20Feed%20Pumps','CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-13','0',2250.00,1575.00,1800.00,1350.00,''),
	(77,'6','F','2','51','295616','T%3A2%20Feed%20Pumps','B-A','0',3350.00,2345.00,2680.00,2010.00,''),
	(78,'6','F','3','52','','Husky%201040%20Feed%20Pumps%20%28Open%20cell%20foam%20only%29','B-A:B-E','0',2710.00,1897.00,2168.00,1626.00,''),
	(79,'6','F','4','53','','Triton%20308%20Feed%20Pumps%20%28Polyurea%20only%29','B-E','0',1954.00,1367.80,1563.20,1172.40,''),
	(80,'7','GG','0','55','','None%20','B-E','0',0.00,0.00,0.00,0.00,''),
	(81,'7','GG','1','56','','Manifold%20Circulation%20Kit%20only','','0',610.00,366.00,366.00,366.00,''),
	(82,'7','GG','2','57','','Manifold%20AND%20Heated%20Hose%20Circulation%20Kit','','0',1130.00,678.00,678.00,678.00,''),
	(83,'8','H','0','59','','None%20','','0',0.00,0.00,0.00,0.00,''),
	(84,'8','H','1','60','224854','Twistork%3A%20Graco%3A%20one','','0',1115.00,947.75,1003.50,836.25,''),
	(85,'8','H','2','61','','Twistork%3A%20Graco%3A%20two','','0',2230.00,1895.50,2007.00,1672.50,''),
	(86,'9','II','1','63','','17.5%20kW%201-ph%20gas%20Portable%3A%20Generac','B-B:B-C:B-D:CC-1:CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:B-E','0',2400.00,2400.00,2400.00,2400.00,''),
	(87,'9','II','2','64','','20%20kW%201-ph%20diesel%3A%20Cummins','CC-3:CC-4:CC-5:CC-6:CC-7:CC-8:CC-9:CC-10:CC-11:CC-12:CC-13:B-E','0',10479.00,10479.00,10479.00,10479.00,''),
	(88,'9','II','3','65','','40%20kW%203-ph%20diesel%3A%20Morse','CC-7:CC-1:B-E','0',17170.00,12300.00,17170.00,12300.00,''),
	(89,'9','II','4',NULL,'','22%20kW%201-ph%20diesel%3A%20Perkins%20%28Included%20w%2F%20Intergrated%20Reactor%29','B-A:B-B:B-C:B-D','0',0.00,0.00,0.00,0.00,''),
	(90,'10','J','1','67','','3.5%20hp%20electric%3A%2060%20gal%20vertical','B-C:B-E:KK-3:KK-4','0',1395.00,1395.00,1395.00,1395.00,''),
	(91,'10','J','2','68','','3.5%20hp%20electric%3A%2060%20gal%20horizontal%20%28gooseneck%20only%29','B-A:B-B:B-D:B-E:KK-3:KK-4','0',1395.00,1395.00,1395.00,1395.00,''),
	(92,'10','J','3','69','','5%20hp%20electric%3A%2060%20gal%20vertical','B-A:B-C:B-E:KK-2:KK-4','0',1600.00,1600.00,1600.00,1600.00,''),
	(93,'10','J','4','70','','5%20hp%20electric%3A%2060%20gal%20horizontal%20%28gooseneck%20only%29','B-A:B-B:B-D:B-E:KK-2:KK-4','0',1765.00,1765.00,1765.00,1765.00,''),
	(94,'10','J','5','71','','7.5%20hp%20electric%3A%2060%20gal%20vertical','B-A:B-C:B-E:KK-2:KK-4','0',2398.00,2398.00,2398.00,2398.00,''),
	(95,'10','J','6','72','','7.5%20hp%20electric%3A%2060%20gal%20horizontal%20%28gooseneck%20only%29','B-A:B-B:B-D:B-E:KK-2:KK-4','0',2498.00,2498.00,2498.00,2498.00,''),
	(96,'10','J','7','73','','Screw%20Compressor%3A%20mounted%20on%2040kW%20Generator','B-A:B-E:KK-1:KK-2:KK-3','0',6410.26,5681.82,6410.26,5000.00,''),
	(97,'10','J','8',NULL,'','5%20hp%20electric%20Hydrovane%20compressor','B-A:B-B:B-C:B-D','0',4642.31,4114.77,4642.31,3621.00,''),
	(98,'11','KK','1','75','','3%20Stage%20Desiccant%20Dryaire%20System','J-7:B-E','0',420.00,420.00,420.00,420.00,''),
	(99,'11','KK','2','76','','Electric%20Drier%20for%203.5%20hp%20compressor','J-3:J-4:J-5:J-6:J-7:B-E','0',935.37,935.37,935.37,935.37,''),
	(100,'11','KK','3','77','','Electric%20Drier%20for%205%20hp%20-%207.5%20hp%20compressor','J-1:J-2:J-7:B-E','0',977.55,977.55,977.55,977.55,''),
	(101,'11','KK','4','78','','Electric%20Drier%20for%20Screw%20Compressor%3A%20225%20deg%20F%20inlet%20capable','J-1:J-2:J-3:J-4:J-5:J-6:B-E','0',2300.00,2300.00,2300.00,2300.00,''),
	(102,'11','KK','5',NULL,'','Electric%20Drier%20for%20Hydrovane%20Compressor','B-A:B-B:B-C:B-D','0',1200.00,1200.00,1200.00,1200.00,''),
	(103,'12','L','0','80','','None','','0',0.00,0.00,0.00,0.00,''),
	(104,'12','L','1','81','','Marthech%20Grade%20D%20System%20w%2F%20300%27%20hose%20and%20one%20mask','B-A','0',1760.00,1760.00,1760.00,1760.00,''),
	(105,'12','L','2','82','','Allegro%20dual%20worker%20portable%20w%2F%20100%27%20hose%20and%20one%20mask','','0',1305.00,1305.00,1305.00,1305.00,''),
	(106,'13','MM','0','84','','None','','0',0.00,0.00,0.00,0.00,''),
	(107,'13','MM','1','85','','110%20volt%20electric','','0',171.00,171.00,171.00,171.00,''),
	(108,'13','MM','2','86','','220%20volt%20electric','','0',319.00,319.00,319.00,319.00,''),
	(109,'13','MM','3','87','','AirTronic%20Heat%20System','','0',2850.00,2850.00,2850.00,2850.00,''),
	(110,'14','N','0','89','','None','','0',0.00,0.00,0.00,0.00,''),
	(111,'14','N','1','90','','110%20volt%20roof%20mounted%20AC%20w%2F%20heat','','0',650.00,650.00,650.00,650.00,'');

/*!40000 ALTER TABLE `selections` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
