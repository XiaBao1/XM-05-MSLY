/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : 1128

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2022-11-28 18:06:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client_comment
-- ----------------------------
DROP TABLE IF EXISTS `client_comment`;
CREATE TABLE `client_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_number` varchar(16) NOT NULL,
  `house_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_number` (`client_number`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `client_comment_ibfk_1` FOREIGN KEY (`client_number`) REFERENCES `else_users` (`user_number`),
  CONSTRAINT `client_comment_ibfk_2` FOREIGN KEY (`house_id`) REFERENCES `landlord_house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_comment
-- ----------------------------
INSERT INTO `client_comment` VALUES ('1', 'client01', '1', '5', '非常好', null);
INSERT INTO `client_comment` VALUES ('2', 'client02', '1', '4', '很干净', null);
INSERT INTO `client_comment` VALUES ('3', 'client04', '2', '5', '干净又卫生', null);
INSERT INTO `client_comment` VALUES ('4', 'client08', '3', '5', '非常好', null);
INSERT INTO `client_comment` VALUES ('5', 'client09', '4', '5', '非常好', null);

-- ----------------------------
-- Table structure for client_room_record
-- ----------------------------
DROP TABLE IF EXISTS `client_room_record`;
CREATE TABLE `client_room_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `client_number` varchar(16) NOT NULL COMMENT '顾客账号',
  `house_id` int(11) NOT NULL COMMENT '民宿ID',
  `room_number` varchar(16) NOT NULL COMMENT '房间号',
  `check_in_date` datetime DEFAULT NULL COMMENT '预计入住时间',
  `check_out_date` datetime DEFAULT NULL COMMENT '预计退房时间',
  `reserve_in_date` datetime DEFAULT NULL COMMENT '实际入住时间',
  `reserve_out_date` datetime DEFAULT NULL COMMENT '实际退房时间',
  `price` double NOT NULL COMMENT '价格',
  `is_paid` tinyint(1) NOT NULL COMMENT '已付款',
  `is_done` tinyint(1) NOT NULL COMMENT '已完成',
  PRIMARY KEY (`id`),
  KEY `client_number` (`client_number`),
  KEY `house_id` (`house_id`,`room_number`),
  CONSTRAINT `client_room_record_ibfk_1` FOREIGN KEY (`client_number`) REFERENCES `else_users` (`user_number`),
  CONSTRAINT `client_room_record_ibfk_2` FOREIGN KEY (`house_id`, `room_number`) REFERENCES `house_room` (`house_id`, `room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='房间订单';

-- ----------------------------
-- Records of client_room_record
-- ----------------------------
INSERT INTO `client_room_record` VALUES ('1', 'client01', '1', '890790', null, null, null, null, '110', '1', '1');
INSERT INTO `client_room_record` VALUES ('2', 'client02', '1', '890791', null, null, null, null, '120', '1', '1');
INSERT INTO `client_room_record` VALUES ('3', 'client03', '1', '890792', null, null, null, null, '130', '1', '1');
INSERT INTO `client_room_record` VALUES ('4', 'client04', '2', '301', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('5', 'client05', '2', '102', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('6', 'client06', '3', '101', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('7', 'client07', '3', '101', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('8', 'client08', '3', '102', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('9', 'client09', '4', '201', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('10', 'client10', '4', '202', null, null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('11', 'client10', '4', '203', null, null, null, null, '100', '1', '1');

-- ----------------------------
-- Table structure for client_specialty_record
-- ----------------------------
DROP TABLE IF EXISTS `client_specialty_record`;
CREATE TABLE `client_specialty_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_number` varchar(16) NOT NULL,
  `specialty_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `order_time` datetime NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `is_received` tinyint(1) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_number` (`client_number`),
  KEY `specialty_id` (`specialty_id`),
  CONSTRAINT `client_specialty_record_ibfk_1` FOREIGN KEY (`client_number`) REFERENCES `else_users` (`user_number`),
  CONSTRAINT `client_specialty_record_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `house_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_specialty_record
-- ----------------------------
INSERT INTO `client_specialty_record` VALUES ('1', 'client01', '2', '5', '100', '2022-11-14 08:00:00', null, '1', '1', '1');
INSERT INTO `client_specialty_record` VALUES ('2', 'client02', '3', '3', '50', '2022-11-14 08:00:00', null, '1', '1', '1');
INSERT INTO `client_specialty_record` VALUES ('3', 'client03', '4', '8', '20', '2022-11-14 08:00:00', null, '1', '1', '1');

-- ----------------------------
-- Table structure for else_menu
-- ----------------------------
DROP TABLE IF EXISTS `else_menu`;
CREATE TABLE `else_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pre_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(16) NOT NULL COMMENT '菜单名',
  `authority_host` tinyint(1) NOT NULL COMMENT '房主权限',
  `authority_client` tinyint(1) NOT NULL COMMENT '顾客权限',
  `authority_manager` tinyint(1) NOT NULL COMMENT '管理员权限',
  PRIMARY KEY (`id`),
  KEY `pre_id` (`pre_id`),
  CONSTRAINT `else_menu_ibfk_1` FOREIGN KEY (`pre_id`) REFERENCES `else_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of else_menu
-- ----------------------------

-- ----------------------------
-- Table structure for else_roles
-- ----------------------------
DROP TABLE IF EXISTS `else_roles`;
CREATE TABLE `else_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(16) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of else_roles
-- ----------------------------
INSERT INTO `else_roles` VALUES ('1', 'administrator', '2');
INSERT INTO `else_roles` VALUES ('2', 'client', '11');
INSERT INTO `else_roles` VALUES ('3', 'landlord', '3');

-- ----------------------------
-- Table structure for else_users
-- ----------------------------
DROP TABLE IF EXISTS `else_users`;
CREATE TABLE `else_users` (
  `user_number` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `username` varchar(16) NOT NULL,
  `gender` char(1) NOT NULL,
  `register_time` datetime NOT NULL,
  `province` varchar(16) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_number`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `else_users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `else_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of else_users
-- ----------------------------
INSERT INTO `else_users` VALUES ('administrator01', 'administrator01', '王管理员', '男', '2022-11-15 20:00:00', '海南省', '3112123481@163.com', '0', null, '13678668267', '1');
INSERT INTO `else_users` VALUES ('administrator02', 'administrator02', '李管理员', '女', '2022-11-15 20:00:00', '河南省', '3229372819@qq.com', '200', null, '18738293746', '1');
INSERT INTO `else_users` VALUES ('client01', 'client01', '闫顾客', '男', '2022-11-15 20:00:00', '四川省', '8226371937@gmail.com', '50', null, '18373628193', '2');
INSERT INTO `else_users` VALUES ('client02', 'client02', '张顾客', '男', '2022-11-15 20:00:00', '云南省', '7329374628@126.com', '300', null, '13846823846', '2');
INSERT INTO `else_users` VALUES ('client03', 'client03', '万顾客', '男', '2022-11-15 20:00:00', '重庆市', '8372617382@163.com', '3000', null, '18374628927', '2');
INSERT INTO `else_users` VALUES ('client04', 'client04', '罗顾客', '女', '2022-11-15 20:00:00', '四川省', '7316827342@qq.com', '0', null, '18373652437', '2');
INSERT INTO `else_users` VALUES ('client05', 'client05', '季顾客', '女', '2022-11-15 20:00:00', '河北省', '8376153628@163.com', '20', null, '', '2');
INSERT INTO `else_users` VALUES ('client06', 'client06', '周顾客', '女', '2022-11-15 20:00:00', '湖北省', '', '100', null, '', '2');
INSERT INTO `else_users` VALUES ('client07', 'client07', '郑顾客', '女', '2022-11-15 20:00:00', null, '7391739748@126.com', '888', null, '', '2');
INSERT INTO `else_users` VALUES ('client08', 'client08', '陈顾客', '女', '2022-11-15 20:00:00', null, '7362937265@163.com', '0', null, '13592876382', '2');
INSERT INTO `else_users` VALUES ('client09', 'client09', '力顾客', '女', '2022-11-15 20:00:00', '山东省', '', '21', null, '13615271823', '2');
INSERT INTO `else_users` VALUES ('client10', 'client10', '孙顾客', '女', '2022-11-15 20:00:00', '上海市', '', '0', null, '', '2');
INSERT INTO `else_users` VALUES ('client11', 'client11', '胡顾客', '女', '2022-11-15 20:00:00', '北京市', '2339275638@qq.com', '500', null, '17628939270', '2');
INSERT INTO `else_users` VALUES ('landlord01', 'landlord01', '李房东', '男', '2022-11-15 20:00:00', null, '7229382716@126.com', '1000', null, '12328768972', '3');
INSERT INTO `else_users` VALUES ('landlord02', 'landlord02', '刘房东', '男', '2022-11-15 20:00:00', null, '8372615738@163.com', '1200', null, '13782893782', '3');
INSERT INTO `else_users` VALUES ('landlord03', 'landlord03', '熊房东', '女', '2022-11-15 20:00:00', '四川省', null, '0', null, null, '3');

-- ----------------------------
-- Table structure for house_room
-- ----------------------------
DROP TABLE IF EXISTS `house_room`;
CREATE TABLE `house_room` (
  `house_id` int(11) NOT NULL COMMENT '民宿ID',
  `room_number` varchar(16) NOT NULL COMMENT '房间号',
  `price_per_day` int(11) NOT NULL COMMENT '每日价格',
  `standard` varchar(16) NOT NULL COMMENT '房间标准',
  `is_free` tinyint(1) NOT NULL COMMENT '空闲',
  PRIMARY KEY (`house_id`,`room_number`),
  CONSTRAINT `house_room_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `landlord_house` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房间';

-- ----------------------------
-- Records of house_room
-- ----------------------------
INSERT INTO `house_room` VALUES ('1', '890790', '110', '双人间', '1');
INSERT INTO `house_room` VALUES ('1', '890791', '120', '单人间', '1');
INSERT INTO `house_room` VALUES ('1', '890792', '130', '双人间', '1');
INSERT INTO `house_room` VALUES ('1', '890793', '140', '三人间', '1');
INSERT INTO `house_room` VALUES ('2', '101', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('2', '102', '100', '双人间', '1');
INSERT INTO `house_room` VALUES ('2', '201', '100', '双人间', '1');
INSERT INTO `house_room` VALUES ('2', '301', '100', '三人间', '1');
INSERT INTO `house_room` VALUES ('3', '101', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('3', '102', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('3', '103', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('3', '104', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('4', '201', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('4', '202', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('4', '203', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('4', '204', '100', '单人间', '1');

-- ----------------------------
-- Table structure for house_specialty
-- ----------------------------
DROP TABLE IF EXISTS `house_specialty`;
CREATE TABLE `house_specialty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `specialty_name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `inventory` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_specialty_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `landlord_house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_specialty
-- ----------------------------
INSERT INTO `house_specialty` VALUES ('1', '1', '兔头', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('2', '1', '火锅底料', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('3', '1', '凉面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('4', '1', '炸酱面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('5', '2', '兔头', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('6', '2', '火锅底料', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('7', '2', '凉面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('8', '2', '炸酱面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('9', '3', '兔头', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('10', '3', '火锅底料', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('11', '3', '凉面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('12', '3', '炸酱面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('13', '4', '兔头', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('14', '4', '火锅底料', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('15', '4', '凉面', '好吃的', '100', '10');
INSERT INTO `house_specialty` VALUES ('16', '4', '炸酱面', '好吃的', '100', '10');

-- ----------------------------
-- Table structure for landlord_house
-- ----------------------------
DROP TABLE IF EXISTS `landlord_house`;
CREATE TABLE `landlord_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(50) NOT NULL,
  `host_number` varchar(16) NOT NULL,
  `address` varchar(50) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `register_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `host_number` (`host_number`),
  CONSTRAINT `landlord_house_ibfk_1` FOREIGN KEY (`host_number`) REFERENCES `else_users` (`user_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landlord_house
-- ----------------------------
INSERT INTO `landlord_house` VALUES ('1', 'house01', 'landlord01', 'Sichuan', null, '2022-11-15 20:00:00');
INSERT INTO `landlord_house` VALUES ('2', 'house02', 'landlord02', 'Sichuan', null, '2022-11-15 20:00:00');
INSERT INTO `landlord_house` VALUES ('3', 'house03', 'landlord03', 'Sichuan', null, '2022-11-15 20:00:00');
INSERT INTO `landlord_house` VALUES ('4', 'house04', 'landlord03', 'Sichuan', null, '2022-11-15 20:00:00');
