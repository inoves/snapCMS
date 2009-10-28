-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.24-rc


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema snapsframework_dev
--

CREATE DATABASE IF NOT EXISTS snapsframework_dev;
USE snapsframework_dev;

--
-- Definition of table `snapsframework_dev`.`attributes`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`attributes`;
CREATE TABLE  `snapsframework_dev`.`attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'attr',
  `group` varchar(100) NOT NULL DEFAULT 'group',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`attributes`
--

/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
LOCK TABLES `attributes` WRITE;
INSERT INTO `snapsframework_dev`.`attributes` VALUES  (1,'G','len'),
 (2,'P','len'),
 (3,'M','len');
UNLOCK TABLES;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`banners`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`banners`;
CREATE TABLE  `snapsframework_dev`.`banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `clicks` bigint(20) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`banners`
--

/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
LOCK TABLES `banners` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`comments`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`comments`;
CREATE TABLE  `snapsframework_dev`.`comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT 'subject',
  `content` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `page_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
LOCK TABLES `comments` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`containers`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`containers`;
CREATE TABLE  `snapsframework_dev`.`containers` (
  `name` varchar(255) NOT NULL DEFAULT 'container',
  `lang` varchar(2) NOT NULL DEFAULT 'en',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id` bigint(20) NOT NULL DEFAULT '0',
  `serial` bigint(20) NOT NULL AUTO_INCREMENT,
  `ord` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`containers`
--

/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
LOCK TABLES `containers` WRITE;
INSERT INTO `snapsframework_dev`.`containers` VALUES  ('Empresa','pt',1,3,5,1,1),
 ('Company','en',1,3,6,1,1),
 ('Compania','es',1,3,7,1,1),
 ('Produtos','pt',1,4,15,2,1),
 ('Products','en',1,4,16,2,1),
 ('Mercadorias','es',1,4,17,2,1),
 ('Topo','pt',1,5,18,0,0),
 ('Top','en',1,5,19,0,0),
 ('Topo','es',1,5,20,0,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`customers`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`customers`;
CREATE TABLE  `snapsframework_dev`.`customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT 'username',
  `password` varchar(255) NOT NULL DEFAULT 'password',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
LOCK TABLES `customers` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`files`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`files`;
CREATE TABLE  `snapsframework_dev`.`files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `common_id` bigint(20) DEFAULT NULL,
  `public` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`files`
--

/*!40000 ALTER TABLE `files` DISABLE KEYS */;
LOCK TABLES `files` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`groups`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`groups`;
CREATE TABLE  `snapsframework_dev`.`groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
LOCK TABLES `groups` WRITE;
INSERT INTO `snapsframework_dev`.`groups` VALUES  (1,'Admin'),
 (4,'Editors');
UNLOCK TABLES;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`manufactures`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`manufactures`;
CREATE TABLE  `snapsframework_dev`.`manufactures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0',
  `site` varchar(255) DEFAULT '0',
  `image` varchar(255) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`manufactures`
--

/*!40000 ALTER TABLE `manufactures` DISABLE KEYS */;
LOCK TABLES `manufactures` WRITE;
INSERT INTO `snapsframework_dev`.`manufactures` VALUES  (1,'Standoff','www.standoff.en','14.jpg','Standoff Super');
UNLOCK TABLES;
/*!40000 ALTER TABLE `manufactures` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`menus`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`menus`;
CREATE TABLE  `snapsframework_dev`.`menus` (
  `name` varchar(255) NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT '0',
  `typeof` varchar(80) NOT NULL DEFAULT 'intro',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `container_id` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) NOT NULL DEFAULT '0',
  `serial` bigint(20) NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) NOT NULL DEFAULT 'en',
  `ord` int(11) DEFAULT '0',
  `value_typeof` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serial`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`menus`
--

/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
LOCK TABLES `menus` WRITE;
INSERT INTO `snapsframework_dev`.`menus` VALUES  ('Skate',1,'','intro','2009-05-27 17:47:43',0,4,3,7,'pt',1,''),
 ('Sk8',1,'','intro','2009-05-27 17:47:43',0,4,3,8,'en',1,''),
 ('Skatee',1,'','intro','2009-05-27 17:47:43',0,4,3,9,'es',1,''),
 ('Pranchas',1,'','intro','2009-05-27 17:48:41',0,4,4,10,'pt',0,''),
 ('Boards',1,'','intro','2009-05-27 17:48:41',0,4,4,11,'en',0,''),
 ('Planchas',1,'','intro','2009-05-27 17:48:41',0,4,4,12,'es',0,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`orders`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`orders`;
CREATE TABLE  `snapsframework_dev`.`orders` (
  `id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `ZIP` varchar(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `descont` float DEFAULT NULL,
  `delivery_type` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `payment_data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
LOCK TABLES `orders` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`pages`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`pages`;
CREATE TABLE  `snapsframework_dev`.`pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `show_home` tinyint(1) DEFAULT '1',
  `menu_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `product` tinyint(1) DEFAULT '0',
  `order_home` int(11) DEFAULT '0',
  `order_menu` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `show_gallery` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`pages`
--

/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
LOCK TABLES `pages` WRITE;
INSERT INTO `snapsframework_dev`.`pages` VALUES  (16,1,4,0,1,1,0,0,'2009-06-08 16:38:05',1),
 (17,1,4,0,1,1,-3,-1,'2009-06-08 16:41:09',0),
 (18,1,4,NULL,1,1,0,0,'2009-06-08 16:43:33',1),
 (19,0,3,0,0,0,0,0,'2009-06-08 16:57:47',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`pages_descriptions`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`pages_descriptions`;
CREATE TABLE  `snapsframework_dev`.`pages_descriptions` (
  `page_id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `intro` text,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) DEFAULT 'en',
  `serial` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`serial`),
  KEY `page_id` (`page_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`pages_descriptions`
--

/*!40000 ALTER TABLE `pages_descriptions` DISABLE KEYS */;
LOCK TABLES `pages_descriptions` WRITE;
INSERT INTO `snapsframework_dev`.`pages_descriptions` VALUES  (16,'Prancha de surf EcoRip Super competiÃ§Ã£o','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.\r\n\r\nCras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:38:05','pt',37),
 (16,'Board EcoRip','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:38:05','en',38),
 (16,'Prancha EcoRip','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.\r\n\r\nCras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.\r\n\r\nCras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:38:05','es',39),
 (17,'EcoRip Modelo 22','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.\r\n\r\nCras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:41:09','pt',40),
 (17,'EcoRip Model 22','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','','2009-06-08 16:41:09','en',41),
 (17,'EcoRip Model 22','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.\r\n\r\nCras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:41:09','es',42),
 (18,'Long Board Manu','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:43:33','pt',43),
 (18,'Long Board Manu','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','2009-06-08 16:43:33','en',44),
 (18,'Long board Manu','Cras faucibus nisi at nisl posuere non placerat mi porttitor. Integer sed metus vel velit consectetur adipiscing. Nulla eros augue, bibendum vel dapibus et, congue id tortor. Nunc tempor magna ac lacus congue aliquam. Aenean ornare, eros ac egestas vestibulum, turpis tellus feugiat dui, sed adipiscing sapien purus eu diam. Aliquam dictum hendrerit nisi, quis lobortis lorem tempor ac. Fusce diam erat, venenatis vel mollis ut, auctor id ligula. In purus purus, sodales vitae luctus quis, vulputate vel felis. Donec non dictum arcu. Quisque rhoncus lacus a diam ultrices sodales.','','2009-06-08 16:43:33','es',45),
 (19,'Como comprar','','','2009-06-08 16:57:47','pt',46),
 (19,'About us','','','2009-06-08 16:57:47','en',47),
 (19,'como comprare','','','2009-06-08 16:57:47','es',48),
 (16,'','','','2009-09-05 14:10:47','fr',49),
 (17,'','','','2009-09-05 14:15:19','fr',50),
 (19,'','','','2009-09-06 00:42:36','fr',51);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pages_descriptions` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`pages_products`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`pages_products`;
CREATE TABLE  `snapsframework_dev`.`pages_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `price` double(10,3) unsigned DEFAULT '0.000',
  `manufacture_id` int(10) unsigned DEFAULT '0',
  `reference` varchar(255) DEFAULT NULL,
  `show_old_price` tinyint(1) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `promo_flag` tinyint(1) unsigned DEFAULT '0',
  `new_flag` tinyint(3) unsigned DEFAULT '0',
  `old_price` double(10,3) unsigned DEFAULT '0.000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`pages_products`
--

/*!40000 ALTER TABLE `pages_products` DISABLE KEYS */;
LOCK TABLES `pages_products` WRITE;
INSERT INTO `snapsframework_dev`.`pages_products` VALUES  (16,16,356.000,0,'board0001',0,'2009-06-08 16:38:05',1,1,0.000),
 (17,17,358.000,0,'board0002',0,'2009-06-08 16:41:09',0,0,0.000),
 (18,18,690.000,NULL,'',0,'2009-06-08 16:43:33',0,0,0.000),
 (19,19,0.000,0,'',0,'2009-06-08 16:57:47',0,0,0.000);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pages_products` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`pages_tags`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`pages_tags`;
CREATE TABLE  `snapsframework_dev`.`pages_tags` (
  `tag_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`pages_tags`
--

/*!40000 ALTER TABLE `pages_tags` DISABLE KEYS */;
LOCK TABLES `pages_tags` WRITE;
INSERT INTO `snapsframework_dev`.`pages_tags` VALUES  (18,18,119),
 (19,18,120),
 (16,16,134),
 (17,16,135),
 (17,17,136),
 (16,17,137),
 (14,19,138);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pages_tags` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`permissions`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`permissions`;
CREATE TABLE  `snapsframework_dev`.`permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`permissions`
--

/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
LOCK TABLES `permissions` WRITE;
INSERT INTO `snapsframework_dev`.`permissions` VALUES  (107,1,'AdminMenusController','containers_new'),
 (106,1,'AdminMenusController','container_remove'),
 (105,1,'AdminMenusController','index'),
 (104,1,'AdminManufacturesController','remove'),
 (103,1,'AdminManufacturesController','new_manufacture'),
 (102,1,'AdminManufacturesController','edit'),
 (101,1,'AdminManufacturesController','manufactures_list'),
 (100,1,'AdminManufacturesController','index'),
 (288,4,'AdminUsersController','new_user'),
 (284,4,'AdminPagesController','not_permission'),
 (285,4,'AdminTwitterController','index'),
 (286,4,'AdminTwitterController','remove'),
 (287,4,'AdminUsersController','index'),
 (282,4,'AdminPagesController','pages_list_menu'),
 (283,4,'AdminPagesController','tag'),
 (281,4,'AdminPagesController','pages_list_home'),
 (280,4,'AdminPagesController','pages_list'),
 (279,4,'AdminPagesController','pages'),
 (278,4,'AdminPagesController','index'),
 (277,4,'AdminPagesController','upload'),
 (276,4,'AdminPagesController','photos'),
 (275,4,'AdminPagesController','rm_photo'),
 (274,4,'AdminPagesController','attributes'),
 (273,4,'AdminPagesController','remove'),
 (272,4,'AdminPagesController','edit'),
 (108,1,'AdminMenusController','container_edit'),
 (109,1,'AdminMenusController','menu_edit'),
 (110,1,'AdminMenusController','menu_new'),
 (111,1,'AdminMenusController','menu_remove'),
 (112,1,'AdminMenusController','menus_list'),
 (113,1,'AdminMenusController','order_menu'),
 (114,1,'AdminMenusController','order_container'),
 (115,1,'AdminPagesController','dashboard'),
 (116,1,'AdminPagesController','show'),
 (117,1,'AdminPagesController','page_new'),
 (118,1,'AdminPagesController','edit'),
 (119,1,'AdminPagesController','remove'),
 (120,1,'AdminPagesController','attributes'),
 (121,1,'AdminPagesController','rm_photo'),
 (122,1,'AdminPagesController','photos'),
 (123,1,'AdminPagesController','upload'),
 (124,1,'AdminPagesController','index'),
 (125,1,'AdminPagesController','pages'),
 (126,1,'AdminPagesController','pages_list'),
 (127,1,'AdminPagesController','pages_list_home'),
 (128,1,'AdminPagesController','pages_list_menu'),
 (129,1,'AdminPagesController','tag'),
 (130,1,'AdminPagesController','not_permission'),
 (131,1,'AdminTwitterController','index'),
 (132,1,'AdminTwitterController','remove'),
 (133,1,'AdminUsersController','index'),
 (134,1,'AdminUsersController','users_list'),
 (135,1,'AdminUsersController','edit'),
 (136,1,'AdminUsersController','new_user'),
 (137,1,'AdminUsersController','remove'),
 (138,1,'AdminUsersController','permissions'),
 (139,1,'AdminUsersController','login'),
 (140,1,'AdminUsersController','logout'),
 (271,4,'AdminPagesController','page_new'),
 (270,4,'AdminPagesController','show'),
 (269,4,'AdminPagesController','dashboard');
UNLOCK TABLES;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`photos`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`photos`;
CREATE TABLE  `snapsframework_dev`.`photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lang` varchar(2) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`photos`
--

/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
LOCK TABLES `photos` WRITE;
INSERT INTO `snapsframework_dev`.`photos` VALUES  (28,'DSCF5081.JPG','Prancha EcoRip',NULL,16),
 (29,'DSCF5114.JPG','Prancha EcoRip 22',NULL,17),
 (30,'DSCF4996.JPG','',NULL,18),
 (31,'DSCF5098.JPG','Prancha 1',NULL,16),
 (32,'DSCF5096.JPG','prancha 3',NULL,16),
 (33,'DSCF5015.JPG','',NULL,17),
 (34,'2516022406_67f630ea59.jpg','',NULL,17);
UNLOCK TABLES;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`product_attributes`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`product_attributes`;
CREATE TABLE  `snapsframework_dev`.`product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attribute_id` int(11) NOT NULL DEFAULT '0',
  `stock` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`product_attributes`
--

/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
LOCK TABLES `product_attributes` WRITE;
INSERT INTO `snapsframework_dev`.`product_attributes` VALUES  (1,17,1,0.00),
 (3,17,3,0.00);
UNLOCK TABLES;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`tags`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`tags`;
CREATE TABLE  `snapsframework_dev`.`tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
LOCK TABLES `tags` WRITE;
INSERT INTO `snapsframework_dev`.`tags` VALUES  (9,'company'),
 (10,'news'),
 (11,'about'),
 (13,'home'),
 (14,''),
 (15,'actives'),
 (16,'boards'),
 (17,'pranchas'),
 (18,'longboard'),
 (19,'prancha board');
UNLOCK TABLES;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


--
-- Definition of table `snapsframework_dev`.`users`
--

DROP TABLE IF EXISTS `snapsframework_dev`.`users`;
CREATE TABLE  `snapsframework_dev`.`users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL DEFAULT 'username',
  `password` varchar(255) NOT NULL DEFAULT 'password',
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snapsframework_dev`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `snapsframework_dev`.`users` VALUES  (1,'Steven','2009-05-22 20:50:57','stvkoch','1d7b217127d82ea1eac7e3b92090a463',1),
 (2,'Snapuser','2009-08-31 16:45:13','teste','1d7b217127d82ea1eac7e3b92090a463',4);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
