/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 10.1.26-MariaDB : Database - test
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `class_types` */

DROP TABLE IF EXISTS `class_types`;

CREATE TABLE `class_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `class_types` */

insert  into `class_types`(`id`,`name`) values 

(1,'C#'),

(2,'PHP'),

(3,'JS'),

(4,'CSS'),

(5,'MySql');

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `classTypeId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classTypeId` (`classTypeId`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`classTypeId`) REFERENCES `class_types` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `groups` */

insert  into `groups`(`id`,`name`,`classTypeId`) values 

(1,'C# Beginners',1),

(2,'C# Middle',1),

(3,'C# Pro',1),

(4,'PHP Beginners',2),

(5,'PHP Middle',2),

(7,'JS Beginners',3),

(8,'JS Middle',3),

(9,'JS Pro',3),

(10,'CSS Beginners',4),

(11,'CSS Middle',4),

(12,'CSS Pro',4),

(52,'PHP Pro',2);

/*Table structure for table `info_source` */

DROP TABLE IF EXISTS `info_source`;

CREATE TABLE `info_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `info_source` */

insert  into `info_source`(`id`,`name`) values 

(1,'Бігборд'),

(2,'Інтернет'),

(3,'Радіо');
/*Table structure for table `visitors` */

DROP TABLE IF EXISTS `visitors`;

CREATE TABLE `visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creationDate` TIMESTAMP DEFAULT 0,
  `lastName` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `middleName` varchar(256) NOT NULL,
  `balance` decimal(20,10) NOT NULL,
  `infoSourceId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitors_ibfk_1` (`infoSourceId`),
  CONSTRAINT `visitors_ibfk_1` FOREIGN KEY (`infoSourceId`) REFERENCES `info_source` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `visitors` */

insert  into `visitors`(`id`,`creationDate`,`lastName`,`name`,`middleName`,`balance`,`infoSourceId`) values 

(1,1528813706,'Топльний','Петро','','100.0000000000',1),

(2,1528505907,'','Іван','','50.0000000000',1),

(3,1529169169,'Топорний','Олег','','30.0000000000',2),

(4,1528224879,'','Костянтин','','30.0000000000',2),

(5,1529289639,'','Євгеній','','0.0000000000',3),

(6,1528374313,'','Сергій','','0.0000000000',3),

(7,1528379402,'','Иван','','0.0000000000',3),

(8,1528558822,'','Михайло','','0.0000000000',3),

(9,1529440657,'Петрик','Микола','','20.0000000000',1),

(11,1529423574,'Галушка','Саша','','0.0000000000',NULL),

(13,1529284651,'Иванов','Павел','Олегович','0.0000000000',NULL),

(16,1528641285,'Абостроев','Сигізмунд','Иванович','0.0000000000',NULL);

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitorId` int(10) unsigned NOT NULL,
  `paidMoneyAmount` decimal(20,10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `visitorId` (`visitorId`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`visitorId`) REFERENCES `visitors` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `payments` */

insert  into `payments`(`id`,`visitorId`,`paidMoneyAmount`) values 

(1,1,'10.0000000000'),

(2,1,'10.0000000000'),

(3,1,'10.0000000000'),

(4,2,'20.0000000000'),

(5,3,'30.0000000000'),

(6,3,'30.0000000000'),

(7,3,'30.0000000000'),

(8,1,'10.0000000000'),

(9,4,'5.0000000000'),

(10,4,'5.0000000000'),

(11,4,'5.0000000000'),

(12,4,'5.0000000000');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products` */
/*Table structure for table `warehouses` */

DROP TABLE IF EXISTS `warehouses`;

CREATE TABLE `warehouses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `warehouses` */
/*Table structure for table `products_movements` */

DROP TABLE IF EXISTS `products_movements`;

CREATE TABLE `products_movements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned NOT NULL,
  `amount` decimal(20,10) NOT NULL,
  `pricePerItem` decimal(20,10) unsigned NOT NULL,
  `priceTotal` decimal(20,10) NOT NULL,
  `operationType` enum('income','sale','move') NOT NULL,
  `warehouseId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouseId` (`warehouseId`),
  KEY `products_movements_ibfk_1` (`productId`),
  CONSTRAINT `products_movements_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `products_movements_ibfk_2` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products_movements` */


/*Table structure for table `visitors_groups` */

DROP TABLE IF EXISTS `visitors_groups`;

CREATE TABLE `visitors_groups` (
  `visitorId` int(10) unsigned NOT NULL,
  `groupId` int(10) unsigned NOT NULL,
  KEY `visitorId` (`visitorId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `visitors_groups_ibfk_1` FOREIGN KEY (`visitorId`) REFERENCES `visitors` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `visitors_groups_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `visitors_groups` */

insert  into `visitors_groups`(`visitorId`,`groupId`) values 

(3,52),

(6,52),

(9,52),

(4,1),

(5,1),

(6,1),

(7,2),

(8,2),

(9,3),

(1,4),

(2,4),

(2,5),

(8,8),

(7,9);



/*Table structure for table `warehouses_products` */

DROP TABLE IF EXISTS `warehouses_products`;

CREATE TABLE `warehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `warehouseId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned NOT NULL,
  `amountLeft` decimal(20,10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouseId` (`warehouseId`),
  KEY `productId` (`productId`),
  CONSTRAINT `warehouses_products_ibfk_1` FOREIGN KEY (`warehouseId`) REFERENCES `warehouses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `warehouses_products_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `warehouses_products` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
