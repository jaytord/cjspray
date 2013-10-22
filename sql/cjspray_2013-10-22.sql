# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.29)
# Database: cjspray
# Generation Time: 2013-10-22 20:27:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `description`)
VALUES
	(1,'admin','Administrator'),
	(2,'members','General User');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`index`, `dealer_only`, `description`, `image`, `title`)
VALUES
	(1,'0','Optional%20accessories%20to%20make%20your%20job%20easier.%20%20These%20items%20can%20always%20be%20purchased%20separately%20later.','',NULL),
	(2,'0','Good%20balance%20of%20solvent%20resistance%20and%20feel.','info%2Fdermamedgloveimage_425_detail.jpg',NULL),
	(3,'0','Gun%20cleaner%20for%20quick%20cleans%20on%20the%20jobsite.','',NULL),
	(4,'0','Gun%20cleaner%20for%20complete%20gun%20tear%20downs%20and%20soaks.','',NULL),
	(5,'0','25%20Pack%20of%20coveralls.%20%20Elastic%20wrist%20and%20ankles.%20%20No%20hood.','info%2FCoverall.jpg',NULL),
	(6,'0','Old%20fashioned%20stretch%20sock.','info%2FFarbic_Strech_Sock.jpg',NULL),
	(7,'0','Foam%20sock%20is%20cool%20and%20inexpensive.','info%2FP4150094.JPG',NULL),
	(8,'0','Foam%20sock%20is%20cool%20and%20inexpensive.','info%2FP4150094.JPG',NULL),
	(9,'0','3M%20full%20face%20mask%20can%20be%20used%20with%20cartridges%20or%20hook-up%20to%20fresh%20air%20supply%20with%20additional%20back%20mounted%20%22Y%22%20adapter.','info%2F3M_Full_Face_Mask.jpg',NULL),
	(10,'0','3M%20tear-offs%20for%206000%20series%20mask.','info%2FTear_offs.jpg',NULL),
	(11,'0','3M%20Organic%20Vapor%20Cartridge%20of%206000%20and%207000%20series%20masks.','info%2F6001.jpg',NULL),
	(12,'0','Open%20bung%20plugs%20from%2055%20gallon%20drums%20with%20ease.','info%2FBung_Wrench.jpg',NULL),
	(13,'0','Extra%20Throat%20Seal%20Liquid%20for%20wet%20cup%20of%20Reactors.','info%2F206996_TSL_1gallon.jpg',NULL),
	(14,'0','110%20Volt%20band%20warmers%20help%20heat%2055%20gallon%20drums%20in%20cool%20weather.','info%2Fband_warmer.jpg',NULL),
	(15,'0','Replacement%20desiccant%20cartridges.','info%2FP1070068.JPG',NULL),
	(16,'0','Help%20contain%20spills%20with%20this%203M%20kit.','info%2FChemical_Spill_Kit.jpg',NULL),
	(17,'0','Use%20this%20configurator%20tool%20to%20help%20build%20and%20price%20your%20own%20customized%20CJ%20Spray%20Mobile%20Spray%20Rig.%20For%20more%20detailed%20information%20see%20our%20Mobile%20Spray%20Rigs%20brochure.%20If%20you%20have%20any%20questions%20or%20need%20advice%20please%20call.%0A%0A1-888-CJSPRAY%20%28888-257-7729%29','info%2Fcover.jpg',NULL),
	(18,'0','16%20ft%20Spray%20foam%20starter%20rig%20with%20Graco%20Reactor%20E20.%20Plenty%20of%20power%20for%20residential%20insulation%2C%20without%20sacrificing%20performance%20or%20reliability.%20Standard%20features%20include%3A%0A%0A%3Cul%3E%3Cli%3E9%2C990%20lb%20gvw%3C%2Fli%3E%0A%3Cli%3EFully%20insulated%20walls%20and%20ceiling%20with%20SPF%3C%2Fli%3E%0A%3Cli%3EGenerator%20mounted%20in%20%22dog%20house%22%3C%2Fli%3E%0A%3Cli%3EGalvanized%20steel%20work%20bench%2C%20vise%2C%20blow%20gun%2C%20and%20overhead%20aluminum%20premium%20cabinet%3C%2Fli%3E%0A%3Cli%3EBarrel%20brace%20system%20for%20two%20sets%20of%20material%3C%2Fli%3E%0A%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%0A%3Cli%3EEpoxy%20floor%20coating%2C%20white%20board%20walls%2C%20white%20ceiling%20board%2C%20and%20premium%20white%20aluminum%20trim%20throughout%20trailer%3C%2Fli%3E%0A%3Cli%3E48%20in.%20curbside%20door%20with%20hose%20hatch%3C%2Fli%3E%0A%3Cli%3ERear%20ramp%20door%3C%2Fli%3E%0A%3Cli%3EBogey%20wheels%20at%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%0A%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%0A%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%3C%2Ful%3E','info%2FPC030203.jpg',NULL),
	(19,'0','20%20ft%20Premium%20Rigs%20for%20foam%20and%20coating%20applications%20offer%20high%20performance%20and%20a%20professional%20appearance.%20Compact%2020%20ft%20layout%20is%20manuverable%20and%20can%20be%20handled%20with%20smaller%20pick-up%20trucks.%20Standard%20features%20include%3A%0A%0A%3Cul%3E%3Cli%3E14%2C000%20lb%20gvw%3C%2Fli%3E%0A%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%0A%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%0A%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%0A%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%0A%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%0A%3Cli%3EBarrel%20brace%20system%20for%20two%20sets%20of%20material%3C%2Fli%3E%0A%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%0A%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%20and%20first%20aid%20kit%3C%2Fli%3E%0A%3Cli%3EElectric%20brakes%3C%2Fli%3E%0A%3Cli%3EBogey%20wheels%20in%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%0A%3Cli%3E48%20in%20curb%20side%20door%20with%20hose%20hatch%3C%2Fli%3E%0A%3Cli%3ERear%20swinging%20barn%20doors%3C%2Fli%3E%0A%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%0A%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%0A%3Cli%3ESpare%20tire%20mounted%20on%20nose%3C%2Fli%3E%3C%2Ful%3E','info%2FP1070126.jpg',NULL),
	(20,'0','The%2028%20ft%20Gooseneck%20trailer%20provides%20more%20room%20and%20has%20larger%20axels%20to%20carry%20more%20material.%20The%20gooseneck%20provides%20greater%20maneuverability%20at%20the%20job-site%20and%20easier%20towing%20down%20the%20road%0A%0A%3Cul%3E%3Cli%3E16%2C000%20lb%20gvw%3C%2Fli%3E%0A%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%0A%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%0A%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%0A%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%0A%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%0A%3Cli%3EBarrel%20brace%20system%20for%20three%20sets%20of%20material%3C%2Fli%3E%0A%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%0A%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%2C%20and%20first%20aid%20kit%3C%2Fli%3E%0A%3Cli%3EElectric%20brakes%3C%2Fli%3E%0A%3Cli%3EBogey%20wheels%20in%20rear%20of%20trailer%20to%20prevent%20damage%3C%2Fli%3E%0A%3Cli%3E48%20in%20curb%20side%20door%3C%2Fli%3E%0A%3Cli%3ERear%20swinging%20barn%20doors%20with%20hose%20hatch%3C%2Fli%3E%0A%3Cli%3ERV%20style%20locks%20and%20latches%3C%2Fli%3E%0A%3Cli%3ELED%20lights%20and%20accents%3C%2Fli%3E%0A%3Cli%3ESpare%20tire%20mounted%20in%20cab%20over%3C%2Fli%3E%3C%2Ful%3E','info%2FDSC_0107.jpg',NULL),
	(21,'0','Supply%20your%20own%20box%20truck%20and%20have%20CJ%20Spray%20customize%20it%20for%20your%20application.%20Box%20trucks%20are%20easy%20to%20maneuver%20and%20can%20reach%20areas%20in%20rugged%20job%20site%20that%20trailers%20cannot.%20They%20are%20capable%20of%20hauling%20heavy%20loads%20and%20are%20easy%20to%20park%20where%20space%20is%20limited.%20Contact%20CJ%20Spray%20for%20truck%20requirements.%20Standard%20installed%20features%20include%3A%0A%0A%3Cul%3E%3Cli%3EUrethane%20foam%20insulation%20sprayed%20in%20walls%2C%20ceiling%20and%20floor%3C%2Fli%3E%0A%3Cli%3EWhite%20board%20walls%20and%20ceiling%2C%20with%20white%20aluminum%20trim%20accent%20for%20a%20professional%20fit%20and%20finish%3C%2Fli%3E%0A%3Cli%3EGalvanized%20steel%20work%20bench%20with%20vise%2C%20blow%20gun%2C%20grinder%2C%20overhead%20aluminum%20cabinet%20with%20light%2C%20and%206-drawer%20tool%20box%3C%2Fli%3E%0A%3Cli%3EDiamond%20plate%20floor%20in%20spray%20room%3C%2Fli%3E%0A%3Cli%3EShore%20power%20hook-up%2C%20110%20volt%3C%2Fli%3E%0A%3Cli%3EBarrel%20brace%20system%20for%20two%20or%20three%20sets%20of%20material%3C%2Fli%3E%0A%3Cli%3EHeated%20hose%20wrap%3C%2Fli%3E%0A%3Cli%3ETwo%20fire%20extinguishers%2C%20eye%20wash%20station%2C%20and%20first%20aid%20kit%3C%2Fli%3E%3C%2Ful%3E','info%2FSprayer_Pics_018.jpg',NULL),
	(22,'0','What%20Graco%20Reactor%20is%20right%20for%20you%20depends%20on%20your%20application%20and%20plan.%20There%20are%20two%20main%20categories%20of%20Reactors%3A%20Foam%20and%20Coatings.%20They%20are%20both%20similar%20and%20do%20the%20same%20thing%2C%20but%20coating%20proportioners%20are%20capable%20of%20higher%20pressures%20to%20atomize%20heavier%20coatings.%20The%20additional%20pressure%20requires%20more%20horsepower%2C%20so%20Reactors%20for%20coatings%20cost%20more%20than%20Reactors%20for%20foam.%20%0A%09%0AWithin%20those%20two%20categories%20we%20also%20have%20three%20types%20of%20Reactors%3A%20Air%2C%20Electric%2C%20and%20Hydraulic%2C%20which%20refers%20to%20how%20the%20pumps%20are%20driven.%20Air%20operated%20Reactors%20use%20an%20air%20motor%20to%20drive%20the%20pump%20lowers%20which%20requires%20a%20large%20air%20compressor%20that%20makes%20them%20uncommon%20in%20mobile%20rig%20applications.%20Electric%20Reactors%20are%20a%20great%20balance%20of%20performance%20and%20price%20and%20have%20quickly%20become%20the%20most%20popular%20in%20the%20market%20place.%20Hydraulic%20Reactors%20have%20great%20durability%20and%20can%20have%20higher%20outputs%20than%20the%20electric%20series%20Reactors.%20Along%20with%20the%20hydraulics%20comes%20a%20higher%20price%20tag.','info%2F3_reactors.jpg',NULL),
	(23,'0','Graco%20distributors%20can%20order%20the%20trailer%20without%20a%20Reactor.%20CJ%20Spray%20will%20have%20the%20trailer%20completely%20ready%20for%20your%20installation%20of%20the%20Reactor.%20Wiring%2C%20fluid%20and%20air%20plumbing%20will%20all%20be%20terminated%20to%20the%20point%20of%20installation.%20Must%20specify%20what%20Reactor%20will%20be%20installed%20at%20time%20of%20order.','',NULL),
	(24,'0','Air-Driven%20Reactor%20provides%2020%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Great%20for%20residential%20foam%20applications%2C%20but%20has%20a%20high%20air%20consumption%20of%2027%20cfm.','info%2FReactorE_20.jpg',NULL),
	(25,'0','Electric-Driven%20Reactor%20provides%2020%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Great%20choice%20for%20residential%20foam%20applications.','info%2FReactorE_20.jpg',NULL),
	(26,'0','Electric-Driven%20Reactor%20provides%2030%20lb%2Fmin%20output%20and%202%2C000%20psi.%20E30%E2%80%99s%20added%20output%20is%20noticeable%20on%20larger%20jobs.','info%2FReactorE_30.jpg',NULL),
	(27,'0','Electric-Driven%20Reactor%20provides%2030%20lb%2Fmin%20output%20and%202%2C000%20psi.%20E30%E2%80%99s%20added%20output%20is%20noticeable%20on%20larger%20jobs.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info%2FReactorE_30.jpg',NULL),
	(28,'0','Hydraulic-Driven%20Reactor%20provides%2022%20lb%2Fmin%20output%20and%202%2C000%20psi.','info%2FReactor_H25.jpg',NULL),
	(29,'0','Hydraulic-Driven%20Reactor%20provides%2022%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info%2FReactor_H25.jpg',NULL),
	(30,'0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Single%20phase%20is%20not%20ideal%20for%20mobile%20trailers.','info%2FReactor_H40_Right.jpg',NULL),
	(31,'0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Typically%20used%20in%20roofing%20and%20other%20high%20flow%20applications.','info%2FReactor_H40_Right.jpg',NULL),
	(32,'0','Hydraulic-Driven%20Reactor%20provides%2045%20lb%2Fmin%20output%20and%202%2C000%20psi.%20Typically%20used%20in%20roofing%20and%20other%20high%20flow%20applications.%20Larger%20heaters%20can%20be%20needed%20in%20cold%20environments%20or%20coating%20applications.','info%2FReactor_H40_Right.jpg',NULL),
	(33,'0','Electric-Driven%20Reactor%20provides%201.0%20gpm%20and%202%2C500%20psi.%20Ideal%20for%20low%20output%20coating%20applications.','info%2FReactorE_XP1.jpg',NULL),
	(34,'0','Electric-Driven%20Reactor%20provides%202.0%20gpm%20and%203%2C500%20psi.','info%2FReactorE_XP2.jpg',NULL),
	(35,'0','Hydraulic-Driven%20Reactor%20provides%201.5%20gpm%20and%203%2C500%20psi.','info%2FReactor_HXP2.jpg',NULL),
	(36,'0','Hydraulic-Driven%20Reactor%20provides%202.8%20gpm%20and%203%2C500%20psi.','info%2FReactor_HXP3.jpg',NULL),
	(37,'0','Have%20CJ%20Spray%20install%20your%20Graco%20equipment.%20%20Price%20includes%20installing%20Reactor%2C%20Heated%20Hose%2C%20Feed%20Pumps%2C%20and%20Guns.','',NULL),
	(38,'0','Graco%20heated%20hose%20is%20sold%20in%2050%20foot%20sections.%20Also%20included%20is%20the%2010%20ft%20whip%20hose%2C%20and%20fluid%20temperature%20sensor.%20The%20maximum%20hose%20length%20you%20can%20use%20depends%20on%20what%20Reactor%20you%20select.','info%2FP1070123.jpg',NULL),
	(39,'0','Graco%20distributors%20can%20order%20the%20trailer%20with%20only%2050%27%20of%20heated%20hose%2C%20which%20is%20installed%20in%20the%20trailer%20to%20run%20from%20the%20Reactor%20to%20the%20hose%20wrap.','info%2FHeated_Hose.jpg',NULL),
	(40,'0','Graco%20distributors%20can%20order%20the%20trailer%20with%20only%2050%27%20of%20heated%20hose%2C%20which%20is%20installed%20in%20the%20trailer%20to%20run%20from%20the%20Reactor%20to%20the%20hose%20wrap.','info%2FHeated_Hose.jpg',NULL),
	(41,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable','info%2FHeated_Hose.jpg',NULL),
	(42,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(43,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(44,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(45,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(46,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(47,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(48,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(49,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(50,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(51,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(52,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(53,'0','2%2C000%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(54,'0','3%2C500%20psi%20rated%20heated%20hose%20with%20scuff%20jacket%20and%20DIN%20cable.','info%2FHeated_Hose.jpg',NULL),
	(55,'0','Strongly%20recommend%20purchasing%20two%20identical%20spray%20guns.%20Choose%20which%20gun%20is%20best%20for%20you%2C%20but%20then%20buy%20TWO.%20When%20spraying%20products%20that%20set-up%20in%20seconds%20have%20a%20second%20gun%20is%20a%20must.%20It%20prevents%20down%20time%2C%20reduces%20wear%20and%20tear%2C%20and%20makes%20trouble%20shooting%20equipment%20much%20easier.','info%2FFusionCS_Gopher136.jpg',NULL),
	(56,'0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.','',NULL),
	(57,'0','The%20Graco%20Fusion%20Air%20Purge%20Gun%20is%20the%20most%20common%202k%20gun%20sold%20today.%20Durable%2C%20easy%20to%20use%2C%20and%20quick%20to%20disassemble%20and%20repair%20have%20made%20this%20a%20good%20choice%20for%20any%20foam%20or%20coatings%20contractor.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2F11487.jpg',NULL),
	(58,'0','The%20Graco%20Fusion%20Air%20Purge%20Gun%20is%20the%20most%20common%202k%20gun%20sold%20today.%20Durable%2C%20easy%20to%20use%2C%20and%20quick%20to%20disassemble%20and%20repair%20have%20made%20this%20a%20good%20choice%20for%20any%20foam%20or%20coatings%20contractor.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FDouble_Fusion_Guns_rt.jpg',NULL),
	(59,'0','The%20Graco%20Clear%20Shot%20Gun%20is%20the%20newest%20gun%20on%20the%20market%20and%20features%20new%20Clear%20Shot%20technology%20that%20keeps%20the%20mix%20chamber%20cleaner.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FGraco_FusionCS_001.jpg',NULL),
	(60,'0','The%20Graco%20Clear%20Shot%20Gun%20is%20the%20newest%20gun%20on%20the%20market%20and%20features%20new%20Clear%20Shot%20technology%20that%20keeps%20the%20mix%20chamber%20cleaner.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FFusionCS_Gopher_093.jpg',NULL),
	(61,'0','The%20Graco%20Mechanical%20Purge%20Gun%20improves%20mixing%20and%20is%20a%20common%20choice%20for%20difficult%20to%20mix%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FFusionMP_app.jpg',NULL),
	(62,'0','The%20Graco%20Mechanical%20Purge%20Gun%20improves%20mixing%20and%20is%20a%20common%20choice%20for%20difficult%20to%20mix%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FFusionMP_app.jpg',NULL),
	(63,'0','The%20Graco%20Probler%20P2%20came%20from%20GlasCraft%20and%20is%20a%20good%20air%20purge%20gun%20for%20both%20foam%20and%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FP2_Picture.jpg',NULL),
	(64,'0','The%20Graco%20Probler%20P2%20came%20from%20GlasCraft%20and%20is%20a%20good%20air%20purge%20gun%20for%20both%20foam%20and%20coatings.%20Available%20in%20either%20round%20or%20flat%20patterns.','info%2FP2_Picture.jpg',NULL),
	(65,'0','Mobile%20systems%20require%20feed%20pumps%20to%20push%20material%20from%2055%20gallon%20drums%20to%20the%20Reactor%20proportioner.%20Stick%20pumps%20such%20as%20the%20Graco%20T%3A1%20and%20T2%20have%20become%20the%20most%20popular%20choice%20for%20foam%20and%20coating%20contractors.','info%2FP1070133.jpg',NULL),
	(66,'0','Fluid%20and%20air%20pluming%20are%20installed%20for%20quick%20assembly.%20Extra%20charge%20will%20apply%20for%20wall%20mount%20brackets%20if%20you%20are%20using%20Husky%201050%20pumps.','',NULL),
	(67,'0','Graco%20T%3A1%20Stick%20pumps%20are%20ideal%20for%20foam%20or%20coating%20applications%20with%20lower%20flow%20rate%20Reactors.','info%2FT1x2_pumps.jpg',NULL),
	(68,'0','Graco%20T%3A2%20Stick%20pumps%20are%20ideal%20for%20foam%20or%20coating%20applications%20with%20higher%20flow%20rate%20Reactors.','info%2F15258.jpg',NULL),
	(69,'0','Graco%20diaphragm%20Husky%20pumps%20mount%20on%20wall%20and%20are%20common%20for%201%2F2%20lb%20foams%20that%20do%20not%20use%20245fa%20blowing%20agents.','info%2FHusky_1050.jpg',NULL),
	(70,'0','Graco%20Triton%20pumps%20are%20common%20in%20lower%20viscosity%20coatings.','info%2Ftriton.jpg',NULL),
	(71,'0','Circulation%20kits%20are%20vital%20to%20any%20mobile%20spray%20rig.%20The%20manifold%20circulation%20kit%20reduces%20material%20waste%20and%20helps%20keep%20your%20rig%20clean%20and%20safe.%20The%20heated%20hose%20circulation%20kit%20is%20extremely%20important%20if%20your%20rig%20will%20sit%20idle%20for%20periods%20of%20two%20weeks%20or%20more.','info%2FP1070087.jpg',NULL),
	(72,'0','No%20circulation%20kit%20is%20installed.%20Graco%E2%80%99s%20stock%20tubing%20runs%20from%20circulation%20manifold%20to%20the%20floor.%20Customer%20supplies%20waste%20pails.','',NULL),
	(73,'0','Manifold%20circulation%20kit%20includes%20return%20hoses%20from%20manifold%20back%20to%2055%20gallon%20drum%2C%20sst%20return%20tubes%2C%20and%20desiccant%20dryers.','info%2FP1070068.jpg',NULL),
	(74,'0','Addition%20of%20the%20heated%20hose%20circulation%20kit%20allows%20easy%20circulation%20of%20material%20throughout%20heated%20hose%20-%20reducing%20isocyanate%20crystallization.%20Product%20should%20be%20circulated%20after%20being%20static%20in%20lines%20for%20two%20weeks.%20Heated%20hose%20circulation%20kit%20also%20allows%20for%20faster%20heating%20of%20hoses%20when%20using%20coatings%2C%20or%20foam%20without%20245fa%20blowing%20agent.','info%2FP1070104.jpg',NULL),
	(75,'0','Includes%20regulator%20and%20air%20plumbing.%20Agitators%20are%20not%20required%20for%20most%201.8%20lb%20and%20heavier%20foams.%20They%20are%20common%20when%20using%201%2F2%20lb%20foam%20or%20most%20coatings.%20Check%20with%20your%20material%20supplier%20if%20an%20agitator%20is%20required%20for%20the%20resin.','info%2FTwistork_Agitator-in-Barrel_app.jpg',NULL),
	(76,'0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.','',NULL),
	(77,'0','Graco%20Twistork%20agitator%20is%20mounted%20directly%20in%202%20in%20bung%20opening.','info%2FTwistork_Agitator.jpg',NULL),
	(78,'0','Graco%20Twistork%20agitator%20is%20mounted%20directly%20in%202%20in%20bung%20opening.','info%2FTwistork_Agitator-in-Barrel_app.jpg',NULL),
	(79,'0','CJ%20Spray%20configured%20rigs%20use%20generators%20and%20will%20only%20make%20shore%20power%20rigs%20after%20personal%20consulation.%20Generators%20increase%20production%2C%20provide%20clean%20power%20to%20Reactors%2C%20and%20reduce%20personal%20interaction%20with%20dangerous%20electrical%20power.%20The%20right%20generator%20depends%20on%20the%20power%20required%20by%20the%20equipment%20in%20the%20spray%20rig.%20There%20are%20two%20major%20electrical%20components%20in%20each%20rig%3A%20the%20Reactor%20and%20the%20air%20compressor.%20%0A%0AReactors%20have%20electric%20motors%20and%20very%20large%20electric%20heaters%20that%20can%20draw%20a%20lot%20of%20power.%20Electric%20air%20compressors%20also%20draw%20a%20lot%20of%20power%2C%20especially%20at%20start%20up.%20We%20set%20all%20of%20our%20compressors%20to%20run%20continuously%20so%20they%20do%20not%20turn%20on%20or%20off%2C%20which%20provides%20cleaner%20and%20more%20consistent%20power%20to%20the%20Reactor.%20The%20generator%20should%20still%20be%20sized%20to%20handle%20the%20initiall%20start-up%20of%20the%20compressor.%20There%20are%20also%20other%20electrical%20demands%20inside%20the%20trailer%20that%20add%20up%20such%20as%20compressed%20air%20driers%2C%20heater%2C%20lights%2C%20grinders%2C%20and%20air%20conditioners.%20To%20properly%20size%20the%20generator%20add%20up%20the%20electrical%20requirements%20and%20provide%20a%2025%25%20cushion.%20In%20most%20applications%20the%20E20%20Reactor%20requires%20a%2020%20kW%20generator%20and%20everything%20larger.','info%2F40_kW_Gen.jpg',NULL),
	(80,'0','Gas%20operated%20generators%20are%20low%20cost%2C%20but%20do%20not%20provide%20long%20lasting%20durability.%20They%20also%20have%20low%20power%20output%20making%20them%20limited%20to%20E-20%20and%20A-20%20Reactors.%20The%20gas%20generator%20is%20only%20available%20in%20the%2016%20ft%20trailer%20and%20is%20mounted%20in%20the%20%22dog%20house%22%20on%20our%20EZ%20slide%20system.','info%2F17_5_kw_gas_generator.jpg',NULL),
	(81,'0','Small%20diesel%20powered%20generator%20is%20powerful%2C%20durable%2C%20and%20compact%3B%20making%20it%20capable%20of%20fitting%20in%20the%20%22dog%20house%22%20of%20the%2016%20ft%20trailer.%20Upgrading%20from%20the%20gas%20generator%20to%20this%20diesel%20will%20add%20years%20of%20trouble%20free%20performance%20and%20reliability.','info%2F20_kW_Diesel.jpg',NULL),
	(82,'0','John%20Deere%20powered%20diesel%20generator%20provides%20enough%20power%20for%20any%20Graco%20Reactor.%20Has%20optional%20screw%20compressor%20%28see%20air%20compressor%20section%20next%29%20that%20mounts%20directly%20to%20generator%20saving%20space%20and%20power%20draw.','info%2F40_kW_Gen.jpg',NULL),
	(83,'0','Like%20sizing%20a%20generator%2C%20the%20right%20compressor%20will%20be%20dependent%20on%20the%20air%20requirement%20%28scfm%29%20of%20the%20tools%20you%20use.%20Mobile%20spray%20rigs%20use%20several%20pieces%20of%20air%20operated%20equipment%2C%20all%20of%20which%20put%20a%20demand%20on%20the%20air%20compressor.%20The%20drum%20pumps%2C%20spray%20guns%2C%20agitators%20%28optional%29%2C%20and%20fresh%20air%20supply%20systems%20%28optional%29%20all%20require%20compressed%20air.%20Other%20tools%20in%20your%20trade%20may%20also%20require%20compressed%20air.%20For%20example%20scarfers%20used%20in%20the%20foam%20industry%20can%20require%20up%20to%2030%20scfm%20of%20air.%20Another%20consideration%20is%20space%20and%20weight.%20%0A%0ACJ%20Spray%20offers%20two%20types%20of%20compressors%3A%20electric%20driven%20piston%20compressors%20and%20a%20belt%20driven%20screw%20compressor%20mounted%20on%20the%20generator.%20Electric%20compressors%20are%20cost%20effective%20and%20are%20available%20on%20vertical%20or%20horizontal%20mounted%20tanks.%20Verticle%20tanks%20are%20used%20in%20our%2016%20ft%2C%2020%20ft%2C%20and%20box%20truck%20models%2C%20and%20the%20horizontal%20tanks%20are%20mounted%20above%20the%20cab%20over%20of%20our%20gooseneck%20trailers.%20Our%20screw%20compressor%20option%20is%20mounted%20on%20our%2040%20kW%20generator%20and%20runs%20directly%20off%20the%20diesel%20engine%2C%20so%20there%20is%20no%20electrical%20requirement.%20In%20most%20applications%20a%20tank%20is%20not%20required%20saving%20value%20weight%20and%20space%20making%20the%20screw%20compressor%20a%20great%20option%20for%2020%20ft%20bumper%20pull%20trailers.','info%2FPC030198.jpg',NULL),
	(84,'0','18.1%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info%2Felectric_compressor_c_aire.jpg',NULL),
	(85,'0','17.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info%2Felectric_compressor_c_aire.jpg',NULL),
	(86,'0','17.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info%2FSprayer_Pics_023.jpg',NULL),
	(87,'0','23.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20vertical%20tank.%20110%20Volt%20automatic%20tank%20drain%20included.','info%2Felectric_compressor_c_aire.jpg',NULL),
	(88,'0','23.5%20scfm%20%40%20120%20psi.%2060%20Gallon%20horizontal%20tank%20is%20mounted%20remotely%20in%20cab-over.%20110%20Volt%20automatic%20tank%20drain%20included.','info%2FSprayer_Pics_023.jpg',NULL),
	(89,'0','40%20scfm%20%40%20120%20psi.%20Mounted%20directly%20to%20generator%20running%20off%20crankshaft%20of%20engine%2C%20so%20it%20pulls%20no%20electrical%20power%20from%20generator.%20No%20air%20tank%20is%20required%20due%20to%20high%20output.%20Screw%20compressor%20saves%20room%20and%20reduces%20weight.','info%2FDSC_0023.jpg',NULL),
	(90,'0','The%20moisture%20sensitivity%20of%20isocyanate%20makes%20clean%2C%20dry%20air%20a%20priority%20for%20any%20mobile%20spray%20rig.','info%2Felectric_refridg_air_dryer.jpg',NULL),
	(91,'0','Moisture%20trap%2C%20coalescer%2C%20and%20desiccant%20beads%20remove%20moisture%20and%20oil%20from%20compressed%20air.','info%2Fdessicant_air_dryer.jpg',NULL),
	(92,'0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info%2FSharpe_Dryaire.jpg',NULL),
	(93,'0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info%2FSharpe_Dryaire.jpg',NULL),
	(94,'0','110%20Volt%20electric%20air%20dryer%20removes%20moisture%20from%20compressed%20air%20without%20the%20need%20of%20disposable%20desiccant%20beads.','info%2Felectric_refridg_air_dryer.jpg',NULL),
	(95,'0','Respiratory%20protection%20is%20vital%20while%20spraying.%20Fresh%20air%20breathing%20systems%20offer%20additional%20protection%20compared%20to%20cartridge%20respirators.%20Fresh%20air%20supplied%20systems%20blow%20clean%20air%20out%20around%20cracks%20between%20face%20and%20facemask.%20When%20using%20standard%20cartridge%20respirators%20you%20are%20breathing%20in%20from%20around%20those%20cracks.','info%2FP4150091.jpg',NULL),
	(96,'0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.','',NULL),
	(97,'0','Mounted%20on%20interior%20wall%20of%20trailer%20creates%20OSHA%20approved%20breathable%20air%20from%20air%20compressor%20mounted%20in%20trailer.%20Includes%20carbon%20monoxide%20detector.%20300%20feet%20of%20Grade%20D%20breathable%20air%20line%20and%203M%20full%20face%20mask%20with%20back%20mounted%20%22Y%22%20adapter%20is%20included.%20Hose%20wrap%20is%20mounted%20on%20barn%20door.%20Has%20capability%20of%20running%20several%20masks.','info%2Fmartech_fresh_air_supply.jpg',NULL),
	(98,'0','110%20Volt%20portable%20ambient%20air%20compressor%20comes%20with%20100%20feet%20of%20hose%20and%203M%20full%20face%20mask%20with%20back%20mounted%20%22Y%22%20adapter.%20Can%20run%20two%20masks%20off%20this%20compressor.','info%2FAllegro.jpg',NULL),
	(99,'0','Keep%20material%20and%20work%20space%20warm%20with%20heaters.','info%2Fwall_heater.jpg',NULL),
	(100,'0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.','',NULL),
	(101,'0','Runs%20off%20generator%20or%20shore%20power%20hook-up.%20Mounts%20flush%20in%20dividing%20wall.%20Includes%20thermostat.','info%2FElectric-Heater_110.jpg',NULL),
	(102,'0','More%20BTUs%2C%20but%20runs%20off%20generator%20only.%20Mounts%20flush%20in%20dividing%20wall.%20Includes%20thermostat.','info%2FWall-Heater_240.jpg',NULL),
	(103,'0','Can%20run%2024%20hours%20a%20day%2C%207%20days%20a%20week.%20Runs%20on%20diesel%20fuel%20and%2012%20volt%20dc%20power.%20Burns%20only%20one%20gallon%20of%20fuel%20per%2016%20hours%2C%20and%20can%20run%20for%2048%20hours%20without%20charge.%20Battery%20will%20charge%20off%20generator%20or%20shore%20power.%20Great%20option%20for%20contractors%20that%20travel%20long%20distances%2C%20do%20a%20lot%20of%20commercial%2Findustrial%20work%2C%20or%20do%20not%20have%20a%20heated%20facility%20to%20park%20in.','info%2Fairtronic_heater.jpg',NULL),
	(104,'0','Air%20conditioners%20are%20not%20just%20for%20your%20comfort.%20245fa%20blowing%20agent%20found%20in%20many%20foams%20will%20easily%20froth%20when%20hot.%20Installing%20an%20air%20conditioner%20in%20your%20mobile%20rig%20can%20keep%20your%20material%20cool%20and%20help%20prevent%20frothing%20which%20leads%20to%20equipment%20problems%20and%20lower%20yields%20from%20your%20SPF.%20If%20you%20are%20a%20insulation%20contractor%20in%20hot%20southern%20climates%20an%20air%20conditioner%20is%20a%20must.','info%2Fair_conditioner.jpg',NULL),
	(105,'0','No%20additional%20information%20available%20for%20this%20selection%20at%20this%20time.','',NULL),
	(106,'0','Roof%20mounted%20air%20conditioner%20runs%20on%20110%20Volt%20power%20and%20can%20provide%20some%20heat%20in%20cool%20weather.','info%2Fair_conditioner.jpg',NULL);

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table login_attempts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table option_choices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `option_choices`;

CREATE TABLE `option_choices` (
  `index` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` varchar(100) DEFAULT NULL,
  `dealer_only` varchar(100) DEFAULT NULL,
  `dealer_price` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `label` varchar(400) DEFAULT NULL,
  `option_index` varchar(100) DEFAULT NULL,
  `option_id` varchar(100) DEFAULT NULL,
  `info_index` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `option_choices` WRITE;
/*!40000 ALTER TABLE `option_choices` DISABLE KEYS */;

INSERT INTO `option_choices` (`index`, `id`, `dealer_only`, `dealer_price`, `price`, `image`, `label`, `option_index`, `option_id`, `info_index`)
VALUES
	(1,'inipt105','0','0','14','','Gloves%2C%20Nitrile%2C%20XL%20-%2050%20Pack','1','a','2'),
	(2,'ap71010','0','0','78','','Dynasolve%20CU-6%20Gun%20Cleaner%2C%201%20Gal','1','a','3'),
	(3,'ap71004','0','0','285','','Ecolink%20Gun%20Cleaner%2C%205%20Gal','1','a','4'),
	(4,'1202313','0','0','85','','Coverall%2C%20XL%2C%20WBP%2C%2025%2FCase','1','a','5'),
	(5,'41-1497','0','0','1','','Fabric%20Stretch%20Sock','1','a','6'),
	(6,'515010','0','0','9','','Soft%20Stretch%20Protective%20Hood%2C%20Loose%2C%2010%20Pack','1','a','7'),
	(7,'515050','0','0','39','','Soft%20Stretch%20Protective%20Hood%2C%20Loose%2C%2050%20Pack','1','a','8'),
	(8,'378002','0','0','155','','3M%206000%20Series%20Full%20Face%20Mask%20w%2F%20OV%20Cartridge','1','a','9'),
	(9,'7142','0','0','25','','Lense%20Covers%2C%2025%20Pack','1','a','10'),
	(10,'6001','0','0','8','','Organic%20Vapor%20Cartridge%2C%202%20Pack','1','a','11'),
	(11,'3ay71a','0','0','48','','Bung%20Wrench%2C%2055%20Gal','1','a','12'),
	(12,'206996','0','0','93','','Fluid%2C%20Graco%20TSL%2C1%20Gal','1','a','13'),
	(13,'515662','0','0','198','','Band%20Heater%2C%2055%20Gal%2C%20110%20V%2C%20w%2F%20Thermostat','1','a','14'),
	(14,'15c381','0','0','41','','Dryer%2C%20Desiccant%2C%20Replacement%20Cartridge','1','a','15'),
	(15,'289103m','0','0','98','','3M%20Chemical%20Sorbent%20Spill%20Response%20Pack%2C%20EA','1','a','16'),
	(16,'a','0','13531','15265.38','16BumperPull.jpg','16%27%20Bumper%20Pull','2','b','18'),
	(17,'b','0','21185','23901.28','20BumperPull.jpg','20%27%20Bumper%20Pull','2','b','19'),
	(18,'c','0','27200','30687.18','28Gooseneck.jpg','28%27%20Gooseneck','2','b','20'),
	(19,'d','0','12273','13846.15','BoxTruck.jpg','Custom%20Box%20Truck','2','b','21'),
	(20,'e','0','30679','35191.18','AimsTrailer.jpg','AiMS%20Trailer','2','b',NULL),
	(21,'14','1','915','0','','Provided%20By%20Distributor%20%28Install%20Only%29','3','cc','37'),
	(22,'0','1','0','0','','None','3','cc','23'),
	(23,'1','0','8673','9912','','A-25%2C%206.0%20kW%20Heater','3','cc','24'),
	(24,'2','0','11305','12920','','E-20%2C%206.5%20kW%20Heater','3','cc','25'),
	(25,'3','0','14119','16136','','E-30%2C%2010.2%20kW%20Heater','3','cc','26'),
	(26,'4','0','15064','17216','','E-30%2C%2015.3%20kW%20Heater','3','cc','27'),
	(27,'5','0','16002','18288','','H-25%2C%208.0%20kW%20Heater','3','cc','28'),
	(28,'6','0','16947','19368','','H-25%2C%2015.3%20kW%20Heater','3','cc','29'),
	(29,'7','0','23541','26904','','H-40%2C%2012.0%20kW%20Heater','3','cc','30'),
	(30,'8','0','23541','26904','','H-40%2C%2015.3%20kW%20Heater','3','cc','31'),
	(31,'9','0','23541','26904','','H-40%2C%2020.4%20kW%20Heater','3','cc','32'),
	(32,'10','0','11851','13544','','E-XP1%2C%2010.2%20kW%20Heater','3','cc','33'),
	(33,'11','0','15820','18080','','E-XP2%2C%2015.3%20kW%20Heater','3','cc','34'),
	(34,'12','0','17885','20440','','H-XP2%2C%2015.3%20kW%20Heater','3','cc','35'),
	(35,'13','0','23541','26904','','H-XP3%2C%2020.4%20kW%20Heater','3','cc','36'),
	(36,'0','1','1334','1524','','50%20ft%20Heated%20Hose%2C%202%2C000%20psi','4','d','39'),
	(37,'1','1','1792','2048','','50%20ft%20Heated%20Hose%2C%203%2C500%20psi','4','d','40'),
	(38,'2','0','3128','3574.40','','110%20ft%2C%202%2C000%20psi','4','d','41'),
	(39,'3','0','4226','4829.60','','110%20ft%2C%203%2C500%20psi','4','d','42'),
	(40,'4','0','4461','5098.40','','160%20ft%2C%202%2C000%20psi','4','d','43'),
	(41,'5','0','6018','6877.60','','160%20ft%2C%203%2C500%20psi','4','d','44'),
	(42,'6','0','5795','6622.40','','210%20ft%2C%202%2C000%20psi','4','d','45'),
	(43,'7','0','7810','8925.60','','210%20ft%2C%203%2C500%20psi','4','d','46'),
	(44,'8','0','7128','8146.40','','260%20ft%2C%202%2C000%20psi','4','d','47'),
	(45,'9','0','9602','10973.60','','260%20ft%2C%203%2C500%20psi','4','d','48'),
	(46,'10','0','8462','9670.40','','310%20ft%2C%202%2C000%20psi','4','d','49'),
	(47,'11','0','11394','13021.60','','310%20ft%2C%203%2C500%20psi','4','d','50'),
	(48,'12','0','9795','11194.40','','360%20ft%2C%202%2C000%20psi','4','d','51'),
	(49,'13','0','13186','15069.60','','360%20ft%2C%203%2C500%20psi','4','d','52'),
	(50,'14','0','11129','12718.40','','410%20ft%2C%202%2C00%20psi','4','d','53'),
	(51,'15','0','14978','17117.60','','410%20ft%2C%203%2C500%20psi','4','d','54'),
	(52,'0','1','0','0','','None','5','ee','56'),
	(53,'1','0','1568','1792','','Fusion%20Air%20Purge%2C%20one','5','ee','57'),
	(54,'2','0','3136','3584','','Fusion%20Air%20Purge%2C%20two','5','ee','58'),
	(55,'3','0','1757','2008','','Fusion%20Clear%20Shot%2C%20one','5','ee','59'),
	(56,'4','0','3514','4016','','Fusion%20Clear%20Shot%2C%20two','5','ee','60'),
	(57,'5','0','1890','2160','','Fusion%20Mechanical%20Purge%2C%20one','5','ee','61'),
	(58,'6','0','3780','4320','','Fusion%20Mechanical%20Purge%2C%20two','5','ee','62'),
	(59,'7','0','1946','2224','','Probler%20P2%2C%20one','5','ee','63'),
	(60,'8','0','3892','4448','','Probler%20P2%2C%20two','5','ee','64'),
	(61,'0','1','0','0','','None','6','f','66'),
	(62,'1','0','1575','1800','','T%3A1%20Feed%20Pumps','6','f','67'),
	(63,'2','0','2345','2680','','T%3A2%20Feed%20Pumps','6','f','68'),
	(64,'3','0','1897','2168','','Husky%201050%20Feed%20Pumps','6','f','69'),
	(65,'4','0','1368','1563.20','','Triton%20308%20Feed%20Pumps','6','f','70'),
	(66,'0','0','0','0','','None','7','gg','72'),
	(67,'1','0','416','469.23','','Manifold%20Circulation%20Kit%20only','7','gg','73'),
	(68,'2','0','770','869.23','','Manifold%20AND%20Heated%20Hose%20Circulation%20Kit','7','gg','74'),
	(69,'0','0','0','0','','None','8','h','76'),
	(70,'1','0','743','669','','Twistork%2C%20Graco%2C%20one','8','h','77'),
	(71,'2','0','1487','1338','','Twistork%2C%20Graco%2C%20two','8','h','78'),
	(72,'1','0','2727','3076.92','','17.5%20kW%201-ph%20gas%20Portable%2C%20Generac','9','ii','80'),
	(73,'2','0','11908','13434.62','','20%20kW%201-ph%20diesel%2C%20Cummins','9','ii','81'),
	(74,'3','0','13977','17170','','40%20kW%203-ph%20diesel','9','ii','82'),
	(75,'1','0','1585','1788.46','','3.5%20hp%20electric%2C%2060%20gal%20vertical','10','j','84'),
	(76,'3','0','1818','2051.28','','5%20hp%20electric%2C%2060%20gal%20vertical','10','j','85'),
	(77,'4','0','2006','2262.82','','5%20hp%20electric%2C%2060%20gal%20horizontal','10','j','86'),
	(78,'5','0','2725','3074.36','','7.5%20hp%20electric%2C%2060%20gal%20vertical','10','j','87'),
	(79,'6','0','2839','3202.56','','7.5%20hp%20electric%2C%2060%20gal%20horizontal','10','j','88'),
	(80,'7','0','5682','6410.26','','Screw%20Compressor%2C%20mounted%20on%2040kW%20Morse%20Generator','10','j','89'),
	(81,'8','0','1350','1690','','3.5%20hp%20gas%2C%2060%20gal%20vertical','10','j',NULL),
	(82,'1','0','477','538.46','','3%20Stage%20Desiccant%20Dryaire%20System','11','kk','91'),
	(83,'2','0','1063','1199.19','','Electric%20Drier%20for%203.5%20hp%20compressor','11','kk','92'),
	(84,'3','0','1111','1253.27','','Electric%20Drier%20for%205%20hp%20-%207.5%20hp%20compressor','11','kk','93'),
	(85,'4','0','2614','2948.72','','Electric%20Drier%20for%20Screw%20Compressor','11','kk','94'),
	(86,'0','0','0','0','','None','12','l','96'),
	(87,'1','0','2000','2256.41','','Marthech%20Grade%20D%20System','12','l','97'),
	(88,'2','0','1483','1673.08','','Allegro%20dual%20worker%20portable','12','l','98'),
	(89,'0','0','0','0','','None','13','mm','100'),
	(90,'1','0','194','219.23','','110%20volt%20electric','13','mm','101'),
	(91,'2','0','363','408.97','','220%20volt%20electric','13','mm','102'),
	(92,'3','0','3627','4695','','AirTronic%20Heat%20System','13','mm','103'),
	(93,'0','0','0','0','','None','14','n','105'),
	(94,'1','0','739','833.33','','110%20volt%20roof%20mounted%20w%2F%20heat','14','n','106');

/*!40000 ALTER TABLE `option_choices` ENABLE KEYS */;
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
	(1,'a','0','fpo-option-image.jpg','Accessories','1'),
	(2,'b','0','fpo-option-image.jpg','Air%20or%20Hydraulic%20Powered','17'),
	(3,'cc','0','fpo-option-image.jpg','Reactor','22'),
	(4,'d','0','fpo-option-image.jpg','Heated%20Hose','38'),
	(5,'ee','0','fpo-option-image.jpg','Spray%20Gun','55'),
	(6,'f','0','fpo-option-image.jpg','Feed%20Pumps','65'),
	(7,'gg','0','fpo-option-image.jpg','Circulation%20Kits','71'),
	(8,'h','0','fpo-option-image.jpg','Agitators','75'),
	(9,'ii','0','fpo-option-image.jpg','Generator','79'),
	(10,'j','0','fpo-option-image.jpg','Air%20Compressor','83'),
	(11,'kk','0','fpo-option-image.jpg','Air%20Drying%20Equipment','90'),
	(12,'l','0','fpo-option-image.jpg','Breathable%20Air','95'),
	(13,'mm','0','fpo-option-image.jpg','Heater','99'),
	(14,'n','0','fpo-option-image.jpg','Air%20Conditioner','104');

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
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`)
VALUES
	(1,X'7F000001','administrator','59beecdf7fc966e2f17fd8f65a4a9aeb09d4a3d4','9462e8eee0','admin@admin.com','',NULL,NULL,NULL,1268889823,1382472196,1,'Admin','istrator','ADMIN','0');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`)
VALUES
	(1,1,1),
	(2,1,2);

/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
