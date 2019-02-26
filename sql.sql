/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.1.73-community : Database - ingRun02
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ingRun02` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ingRun02`;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`id`,`name`,`sex`,`phone`,`address`) values 
(1,'test01','男','12345678999','4dfs32132'),
(2,'客户2','男','41651324891','address'),
(4,'客户3','女','123456456',''),
(5,'test','男','12345678999','4dfs32132'),
(6,'test','男','12345678999','4dfs32132');

/*Table structure for table `factorysite` */

DROP TABLE IF EXISTS `factorysite`;

CREATE TABLE `factorysite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `factorysite` */

insert  into `factorysite`(`id`,`name`,`address`) values 
(1,'戴桥','戴桥'),
(2,'白山','白山');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`name`,`type`) values 
(1,'渔网铅坠350','350#'),
(2,'渔网铅坠300','300#'),
(3,'渔网铅坠200','200#'),
(4,'渔网铅坠250','250#'),
(5,'渔网铅坠400','400#'),
(6,'渔网铅坠1400','1400#'),
(9,'渔网铅坠500','500#'),
(10,'渔网铅坠600','600#'),
(11,'渔网铅坠300（长）','300#'),
(12,'渔网铅坠900','900#'),
(13,'渔网铅坠200','200#'),
(14,'渔网铅坠200','200#');

/*Table structure for table `handlers` */

DROP TABLE IF EXISTS `handlers`;

CREATE TABLE `handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `handlers` */

insert  into `handlers`(`id`,`name`,`sex`,`phone`,`address`) values 
(1,'admin',NULL,'123456789',NULL);

/*Table structure for table `merge_goods_warehouse` */

DROP TABLE IF EXISTS `merge_goods_warehouse`;

CREATE TABLE `merge_goods_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`,`warehouse_id`),
  KEY `warehouse_id` (`warehouse_id`),
  CONSTRAINT `merge_goods_warehouse_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `merge_goods_warehouse_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `merge_goods_warehouse` */

insert  into `merge_goods_warehouse`(`id`,`goods_id`,`warehouse_id`,`sum`) values 
(1,3,2,2600),
(2,2,1,800),
(3,2,2,600),
(4,3,1,600),
(11,6,1,200),
(17,6,2,100),
(18,5,1,600),
(19,1,2,400),
(20,10,1,200),
(21,12,1,400);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`) values 
(1,'admin','123456'),
(2,'ingRun','123456');

/*Table structure for table `warehouse` */

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `warehouse` */

insert  into `warehouse`(`id`,`name`,`address`) values 
(1,'货车','-'),
(2,'槐林仓库','槐林'),
(3,'白山厂地','白山');

/*Table structure for table `warehouse_log` */

DROP TABLE IF EXISTS `warehouse_log`;

CREATE TABLE `warehouse_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `factory_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `out_put` varchar(100) NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `sum` varchar(100) NOT NULL,
  `current_inventory` varchar(100) DEFAULT NULL,
  `handlers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `handlers_id` (`handlers_id`),
  CONSTRAINT `warehouse_log_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_log_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warehouse_log_ibfk_3` FOREIGN KEY (`handlers_id`) REFERENCES `handlers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `warehouse_log` */

insert  into `warehouse_log`(`id`,`goods_id`,`warehouse_id`,`factory_id`,`client_id`,`out_put`,`date`,`sum`,`current_inventory`,`handlers_id`) values 
(21,6,1,1,0,'入库','2019-02-02 16:52:10','100','400',1),
(22,2,1,-1,2,'出库','2019-02-03 11:46:50','200','400',1),
(25,6,1,1,0,'入库','2019-02-05 14:36:20','100','100',1),
(26,6,1,1,0,'入库','2019-02-05 14:38:00','100','500',1),
(27,6,1,-1,1,'出库','2019-02-05 14:38:19','200','300',1),
(28,3,2,2,0,'入库','2019-02-05 15:49:35','800','1600',1),
(30,3,2,-1,2,'出库','2019-02-05 16:12:48','200','1400',1),
(31,6,1,-1,2,'出库','2019-02-08 13:03:21','100','200',1),
(32,6,2,-1,2,'出库','2019-02-08 13:26:18','100','100',1),
(33,5,1,2,0,'入库','2019-02-08 13:31:21','600','600',1),
(34,1,2,2,0,'入库','2019-02-08 13:34:17','400','400',1),
(35,10,1,1,0,'入库','2019-02-08 15:38:46','200','200',1),
(36,12,1,2,0,'入库','2019-02-08 16:34:27','500','500',1),
(37,12,1,-1,1,'出库','2019-02-08 16:34:39','100','400',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
