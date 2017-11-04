# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.49)
# Database: parksms
# Generation Time: 2017-11-04 13:14:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `created`, `modified`)
VALUES
	(1,'admin','admin@admin.com','90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad','2017-06-01 02:18:59','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `idcategories` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`idcategories`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`idcategories`, `label`)
VALUES
	(1,'Gangguan Tramtibum'),
	(3,'Yaya lala');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table daemons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `daemons`;

CREATE TABLE `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table gammu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gammu`;

CREATE TABLE `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `gammu` WRITE;
/*!40000 ALTER TABLE `gammu` DISABLE KEYS */;

INSERT INTO `gammu` (`Version`)
VALUES
	(15);

/*!40000 ALTER TABLE `gammu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table inbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `inbox`;

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  `Status` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `inbox` WRITE;
/*!40000 ALTER TABLE `inbox` DISABLE KEYS */;

INSERT INTO `inbox` (`UpdatedInDB`, `ReceivingDateTime`, `Text`, `SenderNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `RecipientID`, `Processed`, `Status`)
VALUES
	('2017-11-04 18:13:35','2017-10-31 18:22:01','004B00440052002000720069007A00610023003200230074006500730061006A0061','+6285315653000','Default_No_Compression','','+62811078801',-1,'KDR riza#2#tesaja',1,'','true',-1),
	('2017-11-04 18:13:36','2017-10-31 18:35:47','004B00440052002000720069007A00610023003200230074006500730061006A0061','+6285315653000','Default_No_Compression','','+62811078801',-1,'KDR riza#2#tesaja',2,'','true',-1),
	('2017-11-04 18:13:36','2017-10-31 18:39:19','004B00440052002000720069007A00610023003200230074006500730061006A0061','+6285315653000','Default_No_Compression','','+62811078801',-1,'KDR riza#2#tesaja',3,'','true',-1),
	('2017-11-04 18:13:36','2017-10-31 18:44:37','004B00440052002300720069007A00610023003200230074006500730061006A0061','+6285315653000','Default_No_Compression','','+62811078801',-1,'KDR#riza#2#tesaja',4,'','true',-1),
	('2017-11-04 18:13:36','2017-11-02 06:08:06','0054006500720069006D0061006B006100730069006800200042004F005300200049004E00440041004800200041004D0049005200410048002000500065006E0061006D0062006100680061006E002000730061006C0064006F00200076006900610020004D0041004E0044004900520049002000200073006900730061002000730061006C0064006F00200061006E00640061002E0020002400320032002C0033003100300020002B0020003400300030002C0030003000300020003D0020003400320032002C003300310030002300500061006B0065007400200049006E0065007400200058004C002C00200058004C00490035003000200031002E0035002000470042002C00200058004C00490036003000200033002000470042002E0020005400780074','+6285846155792','Default_No_Compression','','+62816124',-1,'Terimakasih BOS INDAH AMIRAH Penambahan saldo via MANDIRI  sisa saldo anda. $22,310 + 400,000 = 422,310#Paket Inet XL, XLI50 1.5 GB, XLI60 3 GB. Txt',5,'','true',-1),
	('2017-11-04 18:13:36','2017-11-04 05:25:46','0055004A0052002000320023003800230069006E00690020006100640061006C006100680020007400650073007400200073006D007300200075006E006A0075006B00200072006100730061','+6285315653000','Default_No_Compression','','+62811078801',-1,'UJR 2#8#ini adalah test sms unjuk rasa',6,'','true',-1),
	('2017-11-04 18:13:36','2017-11-04 05:31:09','0055004A0052002000320023003800230069006E00690020006100640061006C006100680020007400650073007400200073006D007300200075006E006A0075006B00200072006100730061','+6285315653000','Default_No_Compression','','+62811078801',-1,'UJR 2#8#ini adalah test sms unjuk rasa',7,'','true',-1),
	('2017-11-04 18:13:36','2017-11-04 05:41:57','0055004A0052002000320023003800230069006E00690020006100640061006C006100680020007400650073007400200073006D007300200075006E006A0075006B00200072006100730061','+6285315653000','Default_No_Compression','','+62811078801',-1,'UJR 2#8#ini adalah test sms unjuk rasa',8,'','true',-1),
	('2017-11-04 18:13:36','2017-11-04 05:55:02','0055004A0052002000320023003800230069006E00690020006100640061006C006100680020007400650073007400200073006D007300200075006E006A0075006B00200072006100730061','+6285315653000','Default_No_Compression','','+62811078801',-1,'UJR 2#8#ini adalah test sms unjuk rasa',9,'','true',-1),
	('2017-11-04 18:13:36','2017-11-04 06:01:47','0055004A0052002000320023003800230069006E00690020006100640061006C006100680020007400650073007400200073006D007300200075006E006A0075006B00200072006100730061','+6285315653000','Default_No_Compression','','+62811078801',-1,'UJR 2#8#ini adalah test sms unjuk rasa',10,'','true',-1);

/*!40000 ALTER TABLE `inbox` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox` FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table outbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `outbox`;

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  `Retries` int(3) DEFAULT '0',
  `Priority` int(11) DEFAULT '0',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error','Reserved') NOT NULL DEFAULT 'Reserved',
  `StatusCode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`(250))
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;

INSERT INTO `outbox` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `SendBefore`, `SendAfter`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `MultiPart`, `RelativeValidity`, `SenderID`, `SendingTimeOut`, `DeliveryReport`, `CreatorID`, `Retries`, `Priority`, `Status`, `StatusCode`)
VALUES
	('2017-11-04 18:10:39','2017-11-04 18:10:39','2017-11-04 18:10:39','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE KDR RIZA TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',1,'false',-1,NULL,'2017-11-04 18:10:39','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:35','2017-11-04 18:13:35','2017-11-04 18:13:35','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE KDR RIZA TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',2,'false',-1,NULL,'2017-11-04 18:13:35','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE KDR RIZA TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',3,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE KDR TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',4,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285846155792','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE TERIMAKASIH BOS INDAH AMIRAH PENAMBAHAN SALDO VIA MANDIRI  SISA SALDO ANDA. $22,310 + 400,000 = 422,310 TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',5,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE UJR 2 TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',6,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE UJR 2 TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',7,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE UJR 2 TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',8,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE UJR 2 TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',9,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1),
	('2017-11-04 18:13:36','2017-11-04 18:13:36','2017-11-04 18:13:36','23:59:59','00:00:00',NULL,'+6285315653000','Default_No_Compression',NULL,-1,'Maaf FORMAT KODE UJR 2 TIDAK DITEMUKAN, mohon periksa dan ulangi laporan',10,'false',-1,NULL,'2017-11-04 18:13:36','default','',0,0,'Reserved',-1);

/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `outbox_timestamp` BEFORE INSERT ON `outbox` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingTimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.SendingTimeOut = CURRENT_TIMESTAMP();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table outbox_multipart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `outbox_multipart`;

CREATE TABLE `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error','Reserved') NOT NULL DEFAULT 'Reserved',
  `StatusCode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`,`SequencePosition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;



# Dump of table pbk
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pbk`;

CREATE TABLE `pbk` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` varchar(11) NOT NULL DEFAULT '-1',
  `Name` text,
  `Number` text,
  `RwNumber` varchar(10) NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `RtNumber` varchar(10) NOT NULL,
  `suspect` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

LOCK TABLES `pbk` WRITE;
/*!40000 ALTER TABLE `pbk` DISABLE KEYS */;

INSERT INTO `pbk` (`ID`, `GroupID`, `Name`, `Number`, `RwNumber`, `Status`, `createdTime`, `RtNumber`, `suspect`)
VALUES
	(30,'3','Jajang','0939393','21','0',NULL,'12','Keterangan'),
	(31,'1','Ratih','085315653000','2',NULL,NULL,'1','Wife'),
	(32,'1','Lala','93939','3',NULL,'2017-11-04 20:12:56','2','333');

/*!40000 ALTER TABLE `pbk` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pbk_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pbk_groups`;

CREATE TABLE `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `pbk_groups` WRITE;
/*!40000 ALTER TABLE `pbk_groups` DISABLE KEYS */;

INSERT INTO `pbk_groups` (`Name`, `ID`, `phone`)
VALUES
	('PIC Riza',1,'085315653000'),
	('Admin 2',2,'085315653000'),
	('Admin 1',3,'0494040494'),
	('PIC Dadang',4,'085721233926');

/*!40000 ALTER TABLE `pbk_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table phones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phones`;

CREATE TABLE `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `IMSI` varchar(35) NOT NULL,
  `NetCode` varchar(10) DEFAULT 'ERROR',
  `NetName` varchar(35) DEFAULT 'ERROR',
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '-1',
  `Signal` int(11) NOT NULL DEFAULT '-1',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IMEI`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `IMSI`, `NetCode`, `NetName`, `Client`, `Battery`, `Signal`, `Sent`, `Received`)
VALUES
	('','2017-11-04 07:46:00','2017-11-04 06:45:17','2017-11-04 07:46:10','yes','yes','012345678901234','','','','Gammu 1.37.0, Linux, kernel 4.4.0-97-generic (#120-Ubuntu SMP Tue Sep 19 17:28:18 UTC 2017), GCC 5.3',0,0,0,10);

/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `phones_timestamp` BEFORE INSERT ON `phones` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.TimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.TimeOut = CURRENT_TIMESTAMP();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table sentitems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sentitems`;

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL,
  `StatusCode` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `sentitems_timestamp` BEFORE INSERT ON `sentitems` FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table subcategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subcategories`;

CREATE TABLE `subcategories` (
  `idsubcategories` int(11) NOT NULL AUTO_INCREMENT,
  `idcategories` int(11) NOT NULL,
  `idpbk_groups` int(11) NOT NULL,
  `code` varchar(45) NOT NULL,
  `label` varchar(65) NOT NULL,
  PRIMARY KEY (`idsubcategories`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;

INSERT INTO `subcategories` (`idsubcategories`, `idcategories`, `idpbk_groups`, `code`, `label`)
VALUES
	(1,1,1,'UJR','Unjuk rasa Kacida yaya'),
	(2,3,2,'2','Gangguan'),
	(3,3,4,'lala','lala');

/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
