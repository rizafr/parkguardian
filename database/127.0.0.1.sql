-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2017 at 06:02 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gammu`
--
DROP DATABASE `gammu`;
CREATE DATABASE `gammu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gammu`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `username` (`username`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `created`, `modified`) VALUES
(1, 'admin', 'admin@admin.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '2017-06-01 02:18:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `daemons`
--

DROP TABLE IF EXISTS `daemons`;
CREATE TABLE IF NOT EXISTS `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

DROP TABLE IF EXISTS `gammu`;
CREATE TABLE IF NOT EXISTS `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(11);

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
CREATE TABLE IF NOT EXISTS `inbox` (
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
  `newComing` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`UpdatedInDB`, `ReceivingDateTime`, `Text`, `SenderNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `RecipientID`, `Processed`, `newComing`) VALUES
('2017-06-01 03:55:45', '2017-05-27 08:15:01', '0052006500670020006B00610064006500720023006A0061006A0061006E00670023003300230031002300310037', '+6285721233926', 'Default_No_Compression', '', '+62816124', -1, 'Reg kader#jajang#3#1#17', 1, 'modem', 'false', 0),
('2017-06-01 03:55:46', '2017-05-27 08:31:45', '0052006500670020006B00610064006500720023006A0061006A0061006E00670023003300230031002300310037', '+6285721233926', 'Default_No_Compression', '', '+62816124', -1, 'Reg kader#jajang#3#1#17', 2, 'modem', 'false', 0),
('2017-06-01 03:55:46', '2017-05-27 08:37:22', '005400650073', '+6285721233926', 'Default_No_Compression', '', '+62816124', -1, 'Tes', 3, 'modem', 'false', 0),
('2017-06-01 03:57:52', '2017-06-01 03:56:47', '00530065006C0061006D00610074002C00200041006E006400610020006D0065006E00640061007000610074006B0061006E0020006B0075006F007400610020005400730065006C002000730065006200650073006100720020003200300053004D0053002E002000430065006B0020006B0075006F007400610020006400690020002A00380038003800230020006100740061007500200061006B0073006500730020004D0079002000540065006C006B006F006D00730065006C0020004100700070002E', 'TELKOMSEL', 'Default_No_Compression', '', '+6281100000', 1, 'Selamat, Anda mendapatkan kuota Tsel sebesar 20SMS. Cek kuota di *888# atau akses My Telkomsel App.', 4, 'modem', 'false', 0),
('2017-06-01 03:59:53', '2017-06-01 03:59:50', '005200650067002000700061007300690065006E0023006D0061006D006100640023003300230031002300310037', '+6285721233926', 'Default_No_Compression', '', '+62816124', -1, 'Reg pasien#mamad#3#1#17', 5, 'modem', 'false', 0);

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
CREATE TABLE IF NOT EXISTS `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
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
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

DROP TABLE IF EXISTS `outbox_multipart`;
CREATE TABLE IF NOT EXISTS `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`,`SequencePosition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

DROP TABLE IF EXISTS `pbk`;
CREATE TABLE IF NOT EXISTS `pbk` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL,
  `RwNumber` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Birth` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `pbk`
--

INSERT INTO `pbk` (`ID`, `GroupID`, `Name`, `Number`, `RwNumber`, `Status`, `Birth`) VALUES
(1, 2, 'Riza', '085721233926', '1', '1', '23'),
(6, 2, 'JAJANG', '', '3', '1', '17'),
(7, 2, 'JAJANG', '', '3', '1', '17'),
(8, 2, 'JAJANG', '', '3', '1', '17'),
(9, 2, 'JAJANG', '', '3', '1', '17'),
(10, 1, 'MAMAD', '', '3', '1', '17'),
(11, 2, 'JAJANG', '', '3', '1', '17'),
(12, 2, 'JAJANG', '', '3', '1', '17'),
(13, 1, 'MAMAD', '', '3', '1', '17');

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

DROP TABLE IF EXISTS `pbk_groups`;
CREATE TABLE IF NOT EXISTS `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pbk_groups`
--

INSERT INTO `pbk_groups` (`Name`, `ID`) VALUES
('Kader', 1),
('Pasien', 2);

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
CREATE TABLE IF NOT EXISTS `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '0',
  `Signal` int(11) NOT NULL DEFAULT '0',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IMEI`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('modem', '2017-06-01 04:02:27', '2017-06-01 03:55:43', '2017-06-01 04:02:37', 'yes', 'yes', '012345678901234', 'Gammu 1.28.90, Windows XP SP3, GCC 4.4, MinGW 3.13', 0, 45, 18, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

DROP TABLE IF EXISTS `sentitems`;
CREATE TABLE IF NOT EXISTS `sentitems` (
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
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sentitems`
--

INSERT INTO `sentitems` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `DeliveryDateTime`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('2017-06-01 03:55:50', '0000-00-00 00:00:00', '2017-06-01 03:55:50', NULL, '005400650073', '085721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Tes', 1, 'modem', 1, 'SendingOKNoReport', -1, 55, 255, ''),
('2017-06-01 03:55:53', '0000-00-00 00:00:00', '2017-06-01 03:55:53', NULL, '007400650073', '085721233926', 'Default_No_Compression', '', '+6281100000', -1, 'tes', 2, 'modem', 1, 'SendingOKNoReport', -1, 56, 255, ''),
('2017-06-01 03:56:27', '0000-00-00 00:00:00', '2017-06-01 03:56:27', NULL, '006B006900720069006D00200070006500730061006E', '085721233926', 'Default_No_Compression', '', '+6281100000', -1, 'kirim pesan', 3, 'modem', 1, 'SendingOKNoReport', -1, 57, 255, ''),
('2017-06-01 03:57:02', '0000-00-00 00:00:00', '2017-06-01 03:57:02', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 4, 'modem', 1, 'SendingOKNoReport', -1, 58, 255, ''),
('2017-06-01 03:57:05', '0000-00-00 00:00:00', '2017-06-01 03:57:05', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 5, 'modem', 1, 'SendingOKNoReport', -1, 59, 255, ''),
('2017-06-01 03:57:09', '0000-00-00 00:00:00', '2017-06-01 03:57:09', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 6, 'modem', 1, 'SendingOKNoReport', -1, 60, 255, ''),
('2017-06-01 03:57:12', '0000-00-00 00:00:00', '2017-06-01 03:57:12', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 7, 'modem', 1, 'SendingOKNoReport', -1, 61, 255, ''),
('2017-06-01 03:58:17', '0000-00-00 00:00:00', '2017-06-01 03:58:17', NULL, '004D00610061006600200046004F0052004D0041005400200052004500470049005300540052004100530049002000530041004C00410048002C0020006D006F0068006F006E00200070006500720069006B00730061002000640061006E00200075006C0061006E0067006900200072006500670069007300740072006100730069', 'TELKOMSEL', 'Default_No_Compression', '', '+6281100000', -1, 'Maaf FORMAT REGISTRASI SALAH, mohon periksa dan ulangi registrasi', 10, 'modem', 1, 'SendingError', -1, -1, 255, ''),
('2017-06-01 03:58:21', '0000-00-00 00:00:00', '2017-06-01 03:58:21', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 9, 'modem', 1, 'SendingOKNoReport', -1, 62, 255, ''),
('2017-06-01 03:58:25', '0000-00-00 00:00:00', '2017-06-01 03:58:25', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 8, 'modem', 1, 'SendingOKNoReport', -1, 63, 255, ''),
('2017-06-01 04:00:30', '0000-00-00 00:00:00', '2017-06-01 04:00:30', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C00610068002000740065007200640061006600740061007200200073006500620061006700610069002000500041005300490045004E', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai PASIEN', 14, 'modem', 1, 'SendingOKNoReport', -1, 64, 255, ''),
('2017-06-01 04:00:33', '0000-00-00 00:00:00', '2017-06-01 04:00:33', NULL, '004D00610061006600200046004F0052004D0041005400200052004500470049005300540052004100530049002000530041004C00410048002C0020006D006F0068006F006E00200070006500720069006B00730061002000640061006E00200075006C0061006E0067006900200072006500670069007300740072006100730069', 'TELKOMSEL', 'Default_No_Compression', '', '+6281100000', -1, 'Maaf FORMAT REGISTRASI SALAH, mohon periksa dan ulangi registrasi', 13, 'modem', 1, 'SendingError', -1, -1, 255, ''),
('2017-06-01 04:00:38', '0000-00-00 00:00:00', '2017-06-01 04:00:38', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 12, 'modem', 1, 'SendingOKNoReport', -1, 65, 255, ''),
('2017-06-01 04:00:41', '0000-00-00 00:00:00', '2017-06-01 04:00:41', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 11, 'modem', 1, 'SendingOKNoReport', -1, 66, 255, ''),
('2017-06-01 04:00:44', '0000-00-00 00:00:00', '2017-06-01 04:00:44', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 15, 'modem', 1, 'SendingOKNoReport', -1, 67, 255, ''),
('2017-06-01 04:00:48', '0000-00-00 00:00:00', '2017-06-01 04:00:48', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C006100680020007400650072006400610066007400610072002000730065006200610067006100690020004B0041004400450052', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai KADER', 16, 'modem', 1, 'SendingOKNoReport', -1, 68, 255, ''),
('2017-06-01 04:00:51', '0000-00-00 00:00:00', '2017-06-01 04:00:51', NULL, '004D00610061006600200046004F0052004D0041005400200052004500470049005300540052004100530049002000530041004C00410048002C0020006D006F0068006F006E00200070006500720069006B00730061002000640061006E00200075006C0061006E0067006900200072006500670069007300740072006100730069', 'TELKOMSEL', 'Default_No_Compression', '', '+6281100000', -1, 'Maaf FORMAT REGISTRASI SALAH, mohon periksa dan ulangi registrasi', 17, 'modem', 1, 'SendingError', -1, -1, 255, ''),
('2017-06-01 04:00:56', '0000-00-00 00:00:00', '2017-06-01 04:00:56', NULL, '0054006500720069006D00610020006B0061007300690068002C0020005300640072002E0020002000740065006C00610068002000740065007200640061006600740061007200200073006500620061006700610069002000500041005300490045004E', '+6285721233926', 'Default_No_Compression', '', '+6281100000', -1, 'Terima kasih, Sdr.  telah terdaftar sebagai PASIEN', 18, 'modem', 1, 'SendingOKNoReport', -1, 69, 255, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
