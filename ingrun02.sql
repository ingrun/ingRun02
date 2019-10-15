/*
Navicat MySQL Data Transfer

Source Server         : ingRun02
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : ingrun02

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-10-15 09:25:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'test01', '男', '12345678999', '4dfs32132');
INSERT INTO `client` VALUES ('2', '客户2', '男', '41651324891', 'address');
INSERT INTO `client` VALUES ('4', '客户3', '女', '123456456', '');
INSERT INTO `client` VALUES ('5', 'test02', '男', '12345678999', '4dfs32132');

-- ----------------------------
-- Table structure for factorysite
-- ----------------------------
DROP TABLE IF EXISTS `factorysite`;
CREATE TABLE `factorysite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factorysite
-- ----------------------------
INSERT INTO `factorysite` VALUES ('1', '戴桥', '戴桥');
INSERT INTO `factorysite` VALUES ('2', '白山', '白山');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '渔网铅坠350', '350#');
INSERT INTO `goods` VALUES ('2', '渔网铅坠300', '300#');
INSERT INTO `goods` VALUES ('3', '渔网铅坠200', '200#');
INSERT INTO `goods` VALUES ('4', '渔网铅坠250', '250#');
INSERT INTO `goods` VALUES ('5', '渔网铅坠400', '400#');
INSERT INTO `goods` VALUES ('6', '渔网铅坠1400', '1400#');
INSERT INTO `goods` VALUES ('9', '渔网铅坠500', '500#');
INSERT INTO `goods` VALUES ('10', '渔网铅坠600', '600#');
INSERT INTO `goods` VALUES ('11', '渔网铅坠300（长）', '300#');
INSERT INTO `goods` VALUES ('12', '渔网铅坠900', '900#');

-- ----------------------------
-- Table structure for handlers
-- ----------------------------
DROP TABLE IF EXISTS `handlers`;
CREATE TABLE `handlers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of handlers
-- ----------------------------
INSERT INTO `handlers` VALUES ('1', 'admin', null, '123456789', null);

-- ----------------------------
-- Table structure for merge_goods_warehouse
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of merge_goods_warehouse
-- ----------------------------
INSERT INTO `merge_goods_warehouse` VALUES ('1', '3', '2', '1600');
INSERT INTO `merge_goods_warehouse` VALUES ('2', '2', '1', '1300');
INSERT INTO `merge_goods_warehouse` VALUES ('3', '2', '2', '2750');
INSERT INTO `merge_goods_warehouse` VALUES ('4', '3', '1', '600');
INSERT INTO `merge_goods_warehouse` VALUES ('11', '6', '1', '200');
INSERT INTO `merge_goods_warehouse` VALUES ('17', '6', '2', '100');
INSERT INTO `merge_goods_warehouse` VALUES ('18', '5', '1', '600');
INSERT INTO `merge_goods_warehouse` VALUES ('19', '1', '2', '1500');
INSERT INTO `merge_goods_warehouse` VALUES ('20', '10', '1', '200');
INSERT INTO `merge_goods_warehouse` VALUES ('21', '12', '1', '400');
INSERT INTO `merge_goods_warehouse` VALUES ('24', '10', '2', '300');
INSERT INTO `merge_goods_warehouse` VALUES ('25', '4', '1', '200');
INSERT INTO `merge_goods_warehouse` VALUES ('26', '9', '2', '200');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_uindex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456');
INSERT INTO `user` VALUES ('2', 'ingRun', '123456');
INSERT INTO `user` VALUES ('3', 'test', '123456');
INSERT INTO `user` VALUES ('6', 'test01', '123456');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', '货车', '-');
INSERT INTO `warehouse` VALUES ('2', '槐林仓库', '槐林');
INSERT INTO `warehouse` VALUES ('3', '白山厂地', '白山');

-- ----------------------------
-- Table structure for warehouse_log
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse_log
-- ----------------------------
INSERT INTO `warehouse_log` VALUES ('21', '6', '1', '1', '0', '入库', '2019-02-02 16:52:10', '100', '400', '1');
INSERT INTO `warehouse_log` VALUES ('22', '2', '1', '-1', '2', '出库', '2019-02-03 11:46:50', '200', '400', '1');
INSERT INTO `warehouse_log` VALUES ('25', '6', '1', '1', '0', '入库', '2019-02-05 14:36:20', '100', '100', '1');
INSERT INTO `warehouse_log` VALUES ('26', '6', '1', '1', '0', '入库', '2019-02-05 14:38:00', '100', '500', '1');
INSERT INTO `warehouse_log` VALUES ('27', '6', '1', '-1', '1', '出库', '2019-02-05 14:38:19', '200', '300', '1');
INSERT INTO `warehouse_log` VALUES ('28', '3', '2', '2', '0', '入库', '2019-02-05 15:49:35', '800', '1600', '1');
INSERT INTO `warehouse_log` VALUES ('30', '3', '2', '-1', '2', '出库', '2019-02-05 16:12:48', '200', '1400', '1');
INSERT INTO `warehouse_log` VALUES ('31', '6', '1', '-1', '2', '出库', '2019-02-08 13:03:21', '100', '200', '1');
INSERT INTO `warehouse_log` VALUES ('32', '6', '2', '-1', '2', '出库', '2019-02-08 13:26:18', '100', '100', '1');
INSERT INTO `warehouse_log` VALUES ('33', '5', '1', '2', '0', '入库', '2019-02-08 13:31:21', '600', '600', '1');
INSERT INTO `warehouse_log` VALUES ('34', '1', '2', '2', '0', '入库', '2019-02-08 13:34:17', '400', '400', '1');
INSERT INTO `warehouse_log` VALUES ('35', '10', '1', '1', '0', '入库', '2019-02-08 15:38:46', '200', '200', '1');
INSERT INTO `warehouse_log` VALUES ('36', '12', '1', '2', '0', '入库', '2019-02-08 16:34:27', '500', '500', '1');
INSERT INTO `warehouse_log` VALUES ('37', '12', '1', '-1', '1', '出库', '2019-02-08 16:34:39', '100', '400', '1');
INSERT INTO `warehouse_log` VALUES ('38', '2', '2', '2', '0', '入库', '2019-03-18 17:17:05', '300', '900', '1');
INSERT INTO `warehouse_log` VALUES ('39', '2', '2', '1', '0', '入库', '2019-03-27 00:20:49', '200', '1100', '1');
INSERT INTO `warehouse_log` VALUES ('40', '1', '2', '1', '0', '入库', '2019-03-27 00:21:01', '200', '600', '1');
INSERT INTO `warehouse_log` VALUES ('41', '10', '2', '2', '0', '入库', '2019-03-27 00:21:12', '300', '300', '1');
INSERT INTO `warehouse_log` VALUES ('42', '2', '2', '-1', '1', '出库', '2019-03-27 00:21:22', '100', '1000', '1');
INSERT INTO `warehouse_log` VALUES ('43', '2', '2', '-1', '2', '出库', '2019-03-27 00:21:36', '50', '950', '1');
INSERT INTO `warehouse_log` VALUES ('44', '2', '2', '1', '0', '入库', '2019-03-27 00:22:02', '600', '1550', '1');
INSERT INTO `warehouse_log` VALUES ('45', '2', '1', '1', '0', '入库', '2019-04-04 16:13:16', '200', '1000', '1');
INSERT INTO `warehouse_log` VALUES ('46', '2', '2', '2', '0', '入库', '2019-04-04 17:17:35', '300', '1850', '1');
INSERT INTO `warehouse_log` VALUES ('47', '2', '2', '2', '0', '入库', '2019-04-04 17:17:50', '200', '2050', '1');
INSERT INTO `warehouse_log` VALUES ('48', '2', '2', '-1', '4', '出库', '2019-04-04 17:18:01', '600', '1450', '1');
INSERT INTO `warehouse_log` VALUES ('49', '2', '2', '1', '0', '入库', '2019-04-04 17:18:18', '1200', '2650', '1');
INSERT INTO `warehouse_log` VALUES ('50', '2', '2', '-1', '4', '出库', '2019-04-04 17:18:36', '500', '2150', '1');
INSERT INTO `warehouse_log` VALUES ('51', '2', '2', '2', '0', '入库', '2019-04-11 11:28:13', '200', '2750', '1');
INSERT INTO `warehouse_log` VALUES ('52', '4', '1', '1', '0', '入库', '2019-04-18 14:43:20', '200', '200', '1');
INSERT INTO `warehouse_log` VALUES ('53', '2', '2', '2', '0', '入库', '2019-04-19 18:28:06', '200', '2950', '1');
INSERT INTO `warehouse_log` VALUES ('54', '2', '2', '-1', '2', '出库', '2019-04-19 18:32:29', '200', '2750', '1');
INSERT INTO `warehouse_log` VALUES ('55', '2', '1', '1', '0', '入库', '2019-05-21 21:04:34', '200', '1300', '1');
INSERT INTO `warehouse_log` VALUES ('56', '3', '2', '-1', '1', '出库', '2019-05-21 21:22:47', '1000', '1600', '1');
