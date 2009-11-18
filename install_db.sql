/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS survival2012;
USE survival2012;

--
-- Definition of table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
CREATE TABLE  `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'attr',
  `group` varchar(100) NOT NULL DEFAULT 'group',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


--
-- Definition of table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE  `banners` (
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
-- Dumping data for table `banners`
--


--
-- Definition of table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE  `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT 'subject',
  `content` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `page_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
LOCK TABLES `comments` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


--
-- Definition of table `containers`
--

DROP TABLE IF EXISTS `containers`;
CREATE TABLE  `containers` (
  `name` varchar(255) NOT NULL DEFAULT 'container',
  `lang` varchar(2) NOT NULL DEFAULT 'en',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id` bigint(20) NOT NULL DEFAULT '0',
  `serial` bigint(20) NOT NULL AUTO_INCREMENT,
  `ord` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE  `customers` (
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
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

--
-- Definition of table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE  `files` (
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
-- Definition of table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE  `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
LOCK TABLES `groups` WRITE;
INSERT INTO `groups` VALUES  (1,'Admin'),
 (4,'Editors');
UNLOCK TABLES;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
CREATE TABLE  `manufactures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0',
  `site` varchar(255) DEFAULT '0',
  `image` varchar(255) DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Definition of table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE  `menus` (
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE  `orders` (
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
-- Definition of table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE  `pages` (
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
  `template_name` varchar(255) NOT NULL DEFAULT 'page',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;


--
-- Definition of table `pages_descriptions`
--

DROP TABLE IF EXISTS `pages_descriptions`;
CREATE TABLE  `pages_descriptions` (
  `page_id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `intro` text,
  `content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) DEFAULT 'en',
  `serial` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`serial`),
  KEY `page_id` (`page_id`) USING BTREE,
  KEY `lang` (`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Definition of table `pages_products`
--

DROP TABLE IF EXISTS `pages_products`;
CREATE TABLE  `pages_products` (
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
  `order_manufacture` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Definition of table `pages_tags`
--

DROP TABLE IF EXISTS `pages_tags`;
CREATE TABLE  `pages_tags` (
  `tag_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;


--
-- Definition of table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE  `permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions` VALUES  (428,1,'AdminPagesController','pages_list_home'),
 (429,1,'AdminPagesController','pages_list_menu'),
 (426,1,'AdminPagesController','pages'),
 (427,1,'AdminPagesController','pages_list'),
 (425,1,'AdminPagesController','index'),
 (423,1,'AdminPagesController','photos'),
 (424,1,'AdminPagesController','upload'),
 (422,1,'AdminPagesController','rm_photo'),
 (420,1,'AdminPagesController','remove'),
 (421,1,'AdminPagesController','attributes'),
 (388,4,'AdminPagesController','index'),
 (387,4,'AdminPagesController','upload'),
 (386,4,'AdminPagesController','photos'),
 (385,4,'AdminPagesController','rm_photo'),
 (384,4,'AdminPagesController','attributes'),
 (383,4,'AdminPagesController','remove'),
 (382,4,'AdminPagesController','edit'),
 (381,4,'AdminPagesController','page_new'),
 (380,4,'AdminPagesController','show'),
 (378,4,'AdminMenusController','order_container'),
 (379,4,'AdminPagesController','dashboard'),
 (377,4,'AdminMenusController','order_menu'),
 (376,4,'AdminMenusController','menus_list'),
 (375,4,'AdminMenusController','menu_remove'),
 (374,4,'AdminMenusController','menu_new'),
 (373,4,'AdminMenusController','menu_edit'),
 (372,4,'AdminMenusController','container_edit'),
 (419,1,'AdminPagesController','edit'),
 (418,1,'AdminPagesController','page_new'),
 (417,1,'AdminPagesController','show'),
 (416,1,'AdminPagesController','dashboard'),
 (415,1,'AdminMenusController','order_container'),
 (414,1,'AdminMenusController','order_menu'),
 (413,1,'AdminMenusController','menus_list'),
 (412,1,'AdminMenusController','menu_remove'),
 (411,1,'AdminMenusController','menu_new'),
 (410,1,'AdminMenusController','menu_edit'),
 (409,1,'AdminMenusController','container_edit'),
 (408,1,'AdminMenusController','containers_new'),
 (407,1,'AdminMenusController','container_remove'),
 (406,1,'AdminMenusController','index'),
 (405,1,'AdminManufacturesController','remove'),
 (404,1,'AdminManufacturesController','manufacture_new'),
 (403,1,'AdminManufacturesController','edit'),
 (402,1,'AdminManufacturesController','manufactures_list'),
 (401,1,'AdminManufacturesController','index'),
 (400,1,'AdminCustomersController','customers_list'),
 (399,1,'AdminCustomersController','index'),
 (371,4,'AdminMenusController','containers_new'),
 (370,4,'AdminMenusController','container_remove'),
 (369,4,'AdminMenusController','index'),
 (389,4,'AdminPagesController','pages'),
 (390,4,'AdminPagesController','pages_list'),
 (391,4,'AdminPagesController','pages_list_home'),
 (392,4,'AdminPagesController','pages_list_menu'),
 (393,4,'AdminPagesController','tag'),
 (394,4,'AdminPagesController','not_permission'),
 (395,4,'AdminTwitterController','index'),
 (396,4,'AdminTwitterController','remove'),
 (397,4,'AdminUsersController','index'),
 (398,4,'AdminUsersController','users_list'),
 (430,1,'AdminPagesController','tag'),
 (431,1,'AdminPagesController','not_permission'),
 (432,1,'AdminSettingsController','index'),
 (433,1,'AdminTwitterController','index'),
 (434,1,'AdminTwitterController','remove'),
 (435,1,'AdminUsersController','index'),
 (436,1,'AdminUsersController','users_list'),
 (437,1,'AdminUsersController','edit'),
 (438,1,'AdminUsersController','new_user'),
 (439,1,'AdminUsersController','remove'),
 (440,1,'AdminUsersController','permissions'),
 (441,1,'AdminUsersController','login'),
 (442,1,'AdminUsersController','logout');
UNLOCK TABLES;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


--
-- Definition of table `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE  `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lang` varchar(2) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photos`
--



--
-- Definition of table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE  `product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attribute_id` int(11) NOT NULL DEFAULT '0',
  `stock` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



--
-- Definition of table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE  `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE  `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL DEFAULT 'username',
  `password` varchar(255) NOT NULL DEFAULT 'password',
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES  (1,'admin','2009-05-22 20:50:57','admin','21232f297a57a5a743894a0e4a801fc3',1),
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
