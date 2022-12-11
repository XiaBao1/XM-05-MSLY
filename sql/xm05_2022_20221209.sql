/*
Navicat MySQL Data Transfer

Source Server         : ylxteach
Source Server Version : 50151
Source Host           : www.ylxteach.net:3366
Source Database       : xm05_2022

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2022-12-09 11:34:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client_room_comment
-- ----------------------------
DROP TABLE IF EXISTS `client_room_comment`;
CREATE TABLE `client_room_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_record_id` int(11) NOT NULL COMMENT '订单ID',
  `score` float(5,1) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_room_comment_ibfk_1` (`room_record_id`),
  CONSTRAINT `client_room_comment_ibfk_1` FOREIGN KEY (`room_record_id`) REFERENCES `client_room_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_room_comment
-- ----------------------------
INSERT INTO `client_room_comment` VALUES ('1', '1', '5.0', '非常好', null);
INSERT INTO `client_room_comment` VALUES ('2', '2', '4.0', '很干净', null);
INSERT INTO `client_room_comment` VALUES ('3', '3', '5.0', '干净又卫生', null);
INSERT INTO `client_room_comment` VALUES ('4', '4', '3.0', '非常好', null);
INSERT INTO `client_room_comment` VALUES ('5', '5', '5.0', '非常好', null);

-- ----------------------------
-- Table structure for client_room_record
-- ----------------------------
DROP TABLE IF EXISTS `client_room_record`;
CREATE TABLE `client_room_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `client_number` bigint(20) NOT NULL COMMENT '顾客账号',
  `room_id` int(11) NOT NULL COMMENT '房间ID',
  `check_in_date` datetime DEFAULT NULL COMMENT '预计入住时间',
  `check_out_date` datetime DEFAULT NULL COMMENT '预计退房时间',
  `reserve_in_date` datetime DEFAULT NULL COMMENT '实际入住时间',
  `reserve_out_date` datetime DEFAULT NULL COMMENT '实际退房时间',
  `price` double NOT NULL COMMENT '价格',
  `is_paid` tinyint(1) NOT NULL COMMENT '已付款',
  `is_done` tinyint(1) NOT NULL COMMENT '已完成',
  PRIMARY KEY (`id`),
  KEY `client_room_record_ibfk_1` (`client_number`),
  CONSTRAINT `client_room_record_ibfk_1` FOREIGN KEY (`client_number`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='房间订单';

-- ----------------------------
-- Records of client_room_record
-- ----------------------------
INSERT INTO `client_room_record` VALUES ('1', '1', '1', '2022-12-21 11:56:27', '2022-12-21 11:56:27', '2022-12-21 11:56:27', '2022-12-21 11:56:27', '110', '1', '1');
INSERT INTO `client_room_record` VALUES ('2', '3', '2', '2022-12-21 11:56:32', null, null, null, '120', '1', '1');
INSERT INTO `client_room_record` VALUES ('3', '4', '3', '2022-12-07 19:00:33', null, null, null, '130', '1', '1');
INSERT INTO `client_room_record` VALUES ('4', '5', '4', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('5', '6', '5', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('6', '7', '6', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('7', '8', '7', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('8', '8', '8', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('9', '10', '9', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('10', '11', '10', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('11', '12', '11', '2022-11-01 19:00:46', null, null, null, '100', '1', '1');
INSERT INTO `client_room_record` VALUES ('15', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('16', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('17', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('18', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('19', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('20', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('21', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('22', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('23', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('24', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('25', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('26', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('27', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('28', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('29', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('30', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('31', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('32', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('33', '5', '16', '2022-11-01 19:00:46', null, null, null, '100', '1', '0');
INSERT INTO `client_room_record` VALUES ('34', '5', '16', '2022-12-08 19:00:42', null, null, null, '100', '1', '0');

-- ----------------------------
-- Table structure for client_specialty_comment
-- ----------------------------
DROP TABLE IF EXISTS `client_specialty_comment`;
CREATE TABLE `client_specialty_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialty_record_id` int(11) NOT NULL COMMENT '订单ID',
  `score` float(5,1) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_specialty_comment_ibfk_1` (`specialty_record_id`),
  CONSTRAINT `client_specialty_comment_ibfk_1` FOREIGN KEY (`specialty_record_id`) REFERENCES `client_specialty_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_specialty_comment
-- ----------------------------
INSERT INTO `client_specialty_comment` VALUES ('1', '1', '5.0', '非常好', null);
INSERT INTO `client_specialty_comment` VALUES ('2', '2', '4.0', '很干净', null);
INSERT INTO `client_specialty_comment` VALUES ('3', '3', '5.0', '干净又卫生', null);
INSERT INTO `client_specialty_comment` VALUES ('4', '4', '5.0', '非常好', null);
INSERT INTO `client_specialty_comment` VALUES ('5', '5', '5.0', '非常好', null);

-- ----------------------------
-- Table structure for client_specialty_record
-- ----------------------------
DROP TABLE IF EXISTS `client_specialty_record`;
CREATE TABLE `client_specialty_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `client_number` bigint(20) NOT NULL COMMENT '顾客ID',
  `specialty_id` int(11) NOT NULL COMMENT '特产ID',
  `quantity` int(11) NOT NULL COMMENT '订货量',
  `price` double NOT NULL COMMENT '订单价格',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `finish_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `is_received` tinyint(1) NOT NULL COMMENT '是否收获',
  `is_paid` tinyint(1) NOT NULL COMMENT '是否付款',
  `is_done` tinyint(1) NOT NULL COMMENT '订单是否完成',
  PRIMARY KEY (`id`),
  KEY `client_specialty_record_ibfk_1` (`client_number`),
  KEY `client_specialty_record_ibfk_2` (`specialty_id`),
  CONSTRAINT `client_specialty_record_ibfk_1` FOREIGN KEY (`client_number`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `client_specialty_record_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `house_specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_specialty_record
-- ----------------------------
INSERT INTO `client_specialty_record` VALUES ('1', '1', '2', '5', '100', '2022-11-14 08:00:00', '2022-12-08 23:15:23', '1', '1', '1');
INSERT INTO `client_specialty_record` VALUES ('2', '3', '3', '3', '50', '2022-11-14 08:00:00', '2022-11-15 23:15:50', '1', '1', '1');
INSERT INTO `client_specialty_record` VALUES ('3', '5', '4', '8', '20', '2022-11-14 08:00:00', '2022-12-08 23:15:56', '1', '1', '1');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'house_room', 'buyroom', '', null, 'BuyRoom', 'crud', 'com.ruoyi.system', 'system', 'buyroom', '房间订购', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1073\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"在线订购\",\"treeCode\":\"\"}', 'admin', '2022-12-02 21:17:17', '', '2022-12-02 21:59:38', '');
INSERT INTO `gen_table` VALUES ('2', 'client_room_record', '民宿房间订单', '', null, 'ClientRoomRecord', 'crud', 'com.ruoyi.clienthomeorder', 'clienthomeorder', 'homeorder', '民宿订单', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1077\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"民宿订单\",\"treeCode\":\"\"}', 'admin', '2022-12-03 15:33:14', '', '2022-12-06 20:34:30', '');
INSERT INTO `gen_table` VALUES ('3', 'user_todolist', '待办事项', '', null, 'UserTodolist', 'crud', 'com.ruoyi.usertodolist', 'usertodolist', 'todolist', '我的待办', 'yyt', '0', '/', '{\"parentMenuId\":\"1068\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"待办事项\",\"treeCode\":\"\"}', 'admin', '2022-12-03 17:58:03', '', '2022-12-08 16:20:00', '');
INSERT INTO `gen_table` VALUES ('4', 'client_specialty_record', '特产订单管理', '', null, 'ClientSpecialtyRecord', 'crud', 'com.ruoyi.clientspecialtyorder', 'clientspecialtyorder', 'clientorder', '订单', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1079\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"订单管理\",\"treeCode\":\"\"}', 'admin', '2022-12-08 20:46:06', '', '2022-12-08 23:23:56', '');
INSERT INTO `gen_table` VALUES ('5', 'sys_user', '用户信息表', null, null, 'SysUser', 'crud', 'com.ruoyi.system', 'system', 'user', '用户信息', 'ruoyi', '0', '/', null, 'admin', '2022-12-09 10:25:12', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-12-02 21:17:17', null, '2022-12-02 21:59:38');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'house_id', '民宿ID', 'int(11)', 'Long', 'houseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-12-02 21:17:18', null, '2022-12-02 21:59:38');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'room_number', '房间号', 'varchar(16)', 'String', 'roomNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-12-02 21:17:18', null, '2022-12-02 21:59:38');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'price_per_day', '每日价格', 'int(11)', 'Long', 'pricePerDay', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-12-02 21:17:18', null, '2022-12-02 21:59:38');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'standard', '房间标准', 'varchar(16)', 'String', 'standard', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-12-02 21:17:18', null, '2022-12-02 21:59:38');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'is_free', '空闲', 'tinyint(1)', 'Integer', 'isFree', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-12-02 21:17:18', null, '2022-12-02 21:59:39');
INSERT INTO `gen_table_column` VALUES ('7', '2', 'id', '订单ID', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-12-03 15:33:14', null, '2022-12-06 20:34:30');
INSERT INTO `gen_table_column` VALUES ('8', '2', 'client_number', '顾客账号', 'bigint(20)', 'Long', 'clientNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-12-03 15:33:15', null, '2022-12-06 20:34:30');
INSERT INTO `gen_table_column` VALUES ('9', '2', 'room_id', '房间ID', 'int(11)', 'Long', 'roomId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-12-03 15:33:15', null, '2022-12-06 20:34:31');
INSERT INTO `gen_table_column` VALUES ('10', '2', 'check_in_date', '预计入住时间', 'datetime', 'Date', 'checkInDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2022-12-03 15:33:15', null, '2022-12-06 20:34:31');
INSERT INTO `gen_table_column` VALUES ('11', '2', 'check_out_date', '预计退房时间', 'datetime', 'Date', 'checkOutDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2022-12-03 15:33:15', null, '2022-12-06 20:34:31');
INSERT INTO `gen_table_column` VALUES ('12', '2', 'reserve_in_date', '实际入住时间', 'datetime', 'Date', 'reserveInDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2022-12-03 15:33:15', null, '2022-12-06 20:34:31');
INSERT INTO `gen_table_column` VALUES ('13', '2', 'reserve_out_date', '实际退房时间', 'datetime', 'Date', 'reserveOutDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2022-12-03 15:33:16', null, '2022-12-06 20:34:31');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'price', '价格', 'double', 'Long', 'price', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-12-03 15:33:16', null, '2022-12-06 20:34:31');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'is_paid', '已付款', 'tinyint(1)', 'Integer', 'isPaid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_is_paid', '9', 'admin', '2022-12-03 15:33:16', null, '2022-12-06 20:34:32');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'is_done', '已完成', 'tinyint(1)', 'Integer', 'isDone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_is_done', '10', 'admin', '2022-12-03 15:33:16', null, '2022-12-06 20:34:32');
INSERT INTO `gen_table_column` VALUES ('17', '3', 'id', '', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-12-03 17:58:03', null, '2022-12-08 16:20:00');
INSERT INTO `gen_table_column` VALUES ('18', '3', 'user_number', '账号', 'varchar(30)', 'String', 'userNumber', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '2', 'admin', '2022-12-03 17:58:03', null, '2022-12-08 16:20:00');
INSERT INTO `gen_table_column` VALUES ('19', '3', 'content', '内容', 'varchar(50)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-12-03 17:58:04', null, '2022-12-08 16:20:00');
INSERT INTO `gen_table_column` VALUES ('20', '3', 'ddl_time', '截止时间', 'datetime', 'Date', 'ddlTime', '0', '0', null, '1', '1', '1', '1', 'BETWEEN', 'datetime', '', '4', 'admin', '2022-12-03 17:58:04', null, '2022-12-08 16:20:01');
INSERT INTO `gen_table_column` VALUES ('21', '3', 'status', '待办事项状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'todolist_status', '5', 'admin', '2022-12-03 17:58:04', null, '2022-12-08 16:20:01');
INSERT INTO `gen_table_column` VALUES ('22', '4', 'id', '订单ID', 'int(11)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-12-08 20:46:07', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('23', '4', 'client_number', '顾客ID', 'bigint(20)', 'Long', 'clientNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-12-08 20:46:07', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('24', '4', 'specialty_id', '特产ID', 'int(11)', 'Long', 'specialtyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-12-08 20:46:07', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('25', '4', 'quantity', '订货量', 'int(11)', 'Long', 'quantity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-12-08 20:46:08', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('26', '4', 'price', '订单价格', 'double', 'Long', 'price', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-12-08 20:46:08', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('27', '4', 'order_time', '下单时间', 'datetime', 'Date', 'orderTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2022-12-08 20:46:08', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('28', '4', 'finish_time', '订单完成时间', 'datetime', 'Date', 'finishTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2022-12-08 20:46:08', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('29', '4', 'is_received', '是否收获', 'tinyint(1)', 'Integer', 'isReceived', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_is_received', '8', 'admin', '2022-12-08 20:46:08', null, '2022-12-08 23:23:56');
INSERT INTO `gen_table_column` VALUES ('30', '4', 'is_paid', '是否付款', 'tinyint(1)', 'Integer', 'isPaid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_is_paid', '9', 'admin', '2022-12-08 20:46:09', null, '2022-12-08 23:23:57');
INSERT INTO `gen_table_column` VALUES ('31', '4', 'is_done', '订单是否完成', 'tinyint(1)', 'Integer', 'isDone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_is_done', '10', 'admin', '2022-12-08 20:46:09', null, '2022-12-08 23:23:57');
INSERT INTO `gen_table_column` VALUES ('32', '5', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-12-09 10:25:12', '', null);
INSERT INTO `gen_table_column` VALUES ('33', '5', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-12-09 10:25:13', '', null);
INSERT INTO `gen_table_column` VALUES ('34', '5', 'login_name', '登录账号', 'varchar(30)', 'String', 'loginName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-12-09 10:25:13', '', null);
INSERT INTO `gen_table_column` VALUES ('35', '5', 'user_name', '用户昵称', 'varchar(30)', 'String', 'userName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2022-12-09 10:25:13', '', null);
INSERT INTO `gen_table_column` VALUES ('36', '5', 'user_type', '用户类型（00系统用户 01注册用户）', 'varchar(2)', 'String', 'userType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2022-12-09 10:25:13', '', null);
INSERT INTO `gen_table_column` VALUES ('37', '5', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-12-09 10:25:13', '', null);
INSERT INTO `gen_table_column` VALUES ('38', '5', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-12-09 10:25:13', '', null);
INSERT INTO `gen_table_column` VALUES ('39', '5', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '8', 'admin', '2022-12-09 10:25:14', '', null);
INSERT INTO `gen_table_column` VALUES ('40', '5', 'avatar', '头像路径', 'varchar(100)', 'String', 'avatar', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2022-12-09 10:25:14', '', null);
INSERT INTO `gen_table_column` VALUES ('41', '5', 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2022-12-09 10:25:14', '', null);
INSERT INTO `gen_table_column` VALUES ('42', '5', 'salt', '盐加密', 'varchar(20)', 'String', 'salt', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2022-12-09 10:25:14', '', null);
INSERT INTO `gen_table_column` VALUES ('43', '5', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '12', 'admin', '2022-12-09 10:25:14', '', null);
INSERT INTO `gen_table_column` VALUES ('44', '5', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '13', 'admin', '2022-12-09 10:25:14', '', null);
INSERT INTO `gen_table_column` VALUES ('45', '5', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2022-12-09 10:25:15', '', null);
INSERT INTO `gen_table_column` VALUES ('46', '5', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '15', 'admin', '2022-12-09 10:25:15', '', null);
INSERT INTO `gen_table_column` VALUES ('47', '5', 'pwd_update_date', '密码最后更新时间', 'datetime', 'Date', 'pwdUpdateDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2022-12-09 10:25:15', '', null);
INSERT INTO `gen_table_column` VALUES ('48', '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '17', 'admin', '2022-12-09 10:25:15', '', null);
INSERT INTO `gen_table_column` VALUES ('49', '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '18', 'admin', '2022-12-09 10:25:15', '', null);
INSERT INTO `gen_table_column` VALUES ('50', '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '19', 'admin', '2022-12-09 10:25:15', '', null);
INSERT INTO `gen_table_column` VALUES ('51', '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '20', 'admin', '2022-12-09 10:25:16', '', null);
INSERT INTO `gen_table_column` VALUES ('52', '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '21', 'admin', '2022-12-09 10:25:16', '', null);
INSERT INTO `gen_table_column` VALUES ('53', '5', 'money', '账户余额', 'int(11)', 'Long', 'money', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '22', 'admin', '2022-12-09 10:25:16', '', null);
INSERT INTO `gen_table_column` VALUES ('54', '5', 'province', '省份', 'varchar(11)', 'String', 'province', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '23', 'admin', '2022-12-09 10:25:16', '', null);

-- ----------------------------
-- Table structure for house_room
-- ----------------------------
DROP TABLE IF EXISTS `house_room`;
CREATE TABLE `house_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL COMMENT '民宿ID',
  `room_number` varchar(16) NOT NULL COMMENT '房间号',
  `price_per_day` int(11) NOT NULL COMMENT '每日价格',
  `standard` varchar(16) NOT NULL COMMENT '房间标准',
  `is_free` tinyint(1) NOT NULL COMMENT '空闲',
  PRIMARY KEY (`id`),
  KEY `house_room_ibfk_1` (`house_id`),
  CONSTRAINT `house_room_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `landlord_house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='房间';

-- ----------------------------
-- Records of house_room
-- ----------------------------
INSERT INTO `house_room` VALUES ('1', '1', '890790', '110', '双人间', '1');
INSERT INTO `house_room` VALUES ('2', '1', '890791', '120', '单人间', '1');
INSERT INTO `house_room` VALUES ('3', '1', '890792', '130', '双人间', '1');
INSERT INTO `house_room` VALUES ('4', '1', '890793', '140', '三人间', '1');
INSERT INTO `house_room` VALUES ('5', '2', '101', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('6', '2', '102', '100', '双人间', '1');
INSERT INTO `house_room` VALUES ('7', '2', '201', '100', '双人间', '1');
INSERT INTO `house_room` VALUES ('8', '2', '301', '100', '三人间', '1');
INSERT INTO `house_room` VALUES ('9', '2', '101', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('10', '3', '102', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('11', '3', '103', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('12', '3', '104', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('13', '3', '201', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('14', '4', '202', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('15', '4', '203', '100', '单人间', '1');
INSERT INTO `house_room` VALUES ('16', '4', '204', '100', '单人间', '0');
INSERT INTO `house_room` VALUES ('17', '3', '2', '3', '单人间', '0');

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
  KEY `house_specialty_ibfk_1` (`house_id`),
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
  `host_number` bigint(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `score` float(5,1) DEFAULT NULL,
  `register_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `landlord_house_ibfk_1` (`host_number`),
  CONSTRAINT `landlord_house_ibfk_1` FOREIGN KEY (`host_number`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of landlord_house
-- ----------------------------
INSERT INTO `landlord_house` VALUES ('1', 'house01', '3', 'beijing', null, '2022-11-15 20:00:00');
INSERT INTO `landlord_house` VALUES ('2', 'house02', '4', 'Sichuan', null, '2022-11-15 20:00:00');
INSERT INTO `landlord_house` VALUES ('3', 'house03', '6', 'Sichuan', null, '2022-11-15 20:00:00');
INSERT INTO `landlord_house` VALUES ('4', 'house04', '6', 'Sichuan', null, '2022-11-15 20:00:00');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-yellow', 'Y', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 20:55:13', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 20:55:27', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'topnav', 'Y', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 20:34:53', '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES ('10', '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-11-30 19:00:25', '', null, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-11-30 19:00:25', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-11-30 19:00:25', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-11-30 19:00:25', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('30', '1', '未付款', '0', 'sys_user_is_paid', '', '', 'Y', '0', 'admin', '2022-12-03 15:37:56', 'admin', '2022-12-03 15:41:20', '用户未付款');
INSERT INTO `sys_dict_data` VALUES ('31', '2', '已付款', '1', 'sys_user_is_paid', '', '', 'Y', '0', 'admin', '2022-12-03 15:38:51', 'admin', '2022-12-03 15:41:26', '用户已付款');
INSERT INTO `sys_dict_data` VALUES ('32', '1', '未完成', '0', 'sys_user_is_done', '', '', 'Y', '0', 'admin', '2022-12-03 15:40:37', 'admin', '2022-12-03 15:42:14', '用户未完成订单');
INSERT INTO `sys_dict_data` VALUES ('33', '2', '已完成', '1', 'sys_user_is_done', null, null, 'Y', '0', 'admin', '2022-12-03 15:42:07', '', null, '用户已完成订单');
INSERT INTO `sys_dict_data` VALUES ('34', '0', '待完成', '0', 'todolist_status', '', 'primary', 'Y', '0', 'admin', '2022-12-03 17:18:51', 'admin', '2022-12-08 17:46:32', '待完成');
INSERT INTO `sys_dict_data` VALUES ('35', '1', '已完成', '1', 'todolist_status', '', 'success', 'N', '0', 'admin', '2022-12-03 17:19:09', 'admin', '2022-12-08 17:47:02', '已完成');
INSERT INTO `sys_dict_data` VALUES ('36', '2', '已收到', '1', 'sys_user_is_received', '', '', 'Y', '0', 'admin', '2022-12-08 20:49:18', 'admin', '2022-12-08 20:49:47', '用户已经收到特产');
INSERT INTO `sys_dict_data` VALUES ('37', '1', '未收到', '0', 'sys_user_is_received', null, null, 'Y', '0', 'admin', '2022-12-08 20:50:06', '', null, '用户还没有收到特产');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-11-30 19:00:25', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-11-30 19:00:25', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-11-30 19:00:25', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-11-30 19:00:25', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-11-30 19:00:25', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-11-30 19:00:25', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-11-30 19:00:25', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-11-30 19:00:25', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-11-30 19:00:25', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-11-30 19:00:25', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '用户是否付款', 'sys_user_is_paid', '0', 'admin', '2022-12-03 15:36:49', 'admin', '2022-12-03 15:39:21', '用户付款列表');
INSERT INTO `sys_dict_type` VALUES ('12', '订单状态', 'sys_user_is_done', '0', 'admin', '2022-12-03 15:40:12', '', null, '用户是否已经完成订单');
INSERT INTO `sys_dict_type` VALUES ('13', '待办事项状态', 'todolist_status', '0', 'admin', '2022-12-03 17:16:55', 'admin', '2022-12-03 17:17:25', '待办事项模块');
INSERT INTO `sys_dict_type` VALUES ('14', '特产收到状态', 'sys_user_is_received', '0', 'admin', '2022-12-08 20:48:18', '', null, '用户是否已经收到特产');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-11-30 19:00:25', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('1', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-01 17:19:06');
INSERT INTO `sys_logininfor` VALUES ('2', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-01 17:19:11');
INSERT INTO `sys_logininfor` VALUES ('3', 'administraor', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-01 17:19:31');
INSERT INTO `sys_logininfor` VALUES ('4', 'administraor', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-01 17:19:36');
INSERT INTO `sys_logininfor` VALUES ('5', 'administraor', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-01 17:19:42');
INSERT INTO `sys_logininfor` VALUES ('6', 'administraor01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-01 17:19:48');
INSERT INTO `sys_logininfor` VALUES ('7', 'administrator01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-01 17:20:05');
INSERT INTO `sys_logininfor` VALUES ('8', 'administrator01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-01 17:21:00');
INSERT INTO `sys_logininfor` VALUES ('9', 'administrator01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-01 17:23:46');
INSERT INTO `sys_logininfor` VALUES ('10', 'administrator01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-01 17:24:01');
INSERT INTO `sys_logininfor` VALUES ('11', 'administrator01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2022-12-01 17:25:13');
INSERT INTO `sys_logininfor` VALUES ('12', 'administrator01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-01 17:25:16');
INSERT INTO `sys_logininfor` VALUES ('13', 'landlord01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-01 17:25:28');
INSERT INTO `sys_logininfor` VALUES ('14', 'landlord01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-01 17:25:35');
INSERT INTO `sys_logininfor` VALUES ('15', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-01 17:36:35');
INSERT INTO `sys_logininfor` VALUES ('16', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-01 17:41:08');
INSERT INTO `sys_logininfor` VALUES ('17', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 17:41:15');
INSERT INTO `sys_logininfor` VALUES ('18', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 17:51:55');
INSERT INTO `sys_logininfor` VALUES ('19', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 19:11:12');
INSERT INTO `sys_logininfor` VALUES ('20', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 20:26:09');
INSERT INTO `sys_logininfor` VALUES ('21', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 20:31:57');
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-01 21:04:22');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 21:04:44');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 21:22:37');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-01 21:29:54');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 21:30:06');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 21:39:34');
INSERT INTO `sys_logininfor` VALUES ('28', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 21:42:48');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 21:46:08');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-01 22:07:31');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-02 00:04:29');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 00:04:34');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 11:03:24');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 11:13:57');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 11:28:19');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 11:32:45');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 11:36:07');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 20:58:21');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-02 21:02:54');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 21:02:59');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 21:32:37');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 21:42:25');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 22:05:40');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 22:28:13');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 22:40:12');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 23:17:30');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 23:27:05');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-02 23:57:50');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-02 23:57:53');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 00:03:08');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 00:28:37');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 01:01:32');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 10:48:57');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 11:20:08');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 11:24:28');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 13:22:45');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 13:27:29');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-03 13:43:42');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-03 13:43:47');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 13:43:49');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 13:44:48');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 13:44:59');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 13:55:03');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 14:26:32');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 14:29:42');
INSERT INTO `sys_logininfor` VALUES ('66', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 14:52:29');
INSERT INTO `sys_logininfor` VALUES ('67', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 14:54:09');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 15:28:58');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 15:51:53');
INSERT INTO `sys_logininfor` VALUES ('70', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 15:54:32');
INSERT INTO `sys_logininfor` VALUES ('71', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 16:02:47');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 16:32:00');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 16:36:23');
INSERT INTO `sys_logininfor` VALUES ('74', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 16:39:54');
INSERT INTO `sys_logininfor` VALUES ('75', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 16:53:51');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 17:13:30');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 17:22:56');
INSERT INTO `sys_logininfor` VALUES ('78', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 17:57:42');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:17:42');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:20:00');
INSERT INTO `sys_logininfor` VALUES ('81', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:20:15');
INSERT INTO `sys_logininfor` VALUES ('82', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:22:45');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-03 18:31:40');
INSERT INTO `sys_logininfor` VALUES ('84', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:31:45');
INSERT INTO `sys_logininfor` VALUES ('85', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:32:57');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 18:57:38');
INSERT INTO `sys_logininfor` VALUES ('87', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-03 20:14:29');
INSERT INTO `sys_logininfor` VALUES ('88', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 20:14:36');
INSERT INTO `sys_logininfor` VALUES ('89', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 21:04:53');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 21:06:12');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 21:08:54');
INSERT INTO `sys_logininfor` VALUES ('92', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 21:59:33');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 22:12:58');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-03 22:17:04');
INSERT INTO `sys_logininfor` VALUES ('95', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-04 19:14:23');
INSERT INTO `sys_logininfor` VALUES ('96', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-04 19:18:34');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 17:00:39');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-05 17:06:33');
INSERT INTO `sys_logininfor` VALUES ('99', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 17:06:40');
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 19:20:26');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 19:47:52');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 19:54:11');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 19:58:27');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:02:35');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:05:09');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-05 20:07:51');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:08:05');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:21:54');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:22:55');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-05 20:29:22');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:29:43');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:39:43');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-05 20:46:55');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:47:00');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:49:34');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 20:56:38');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 21:32:26');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 21:41:07');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 21:49:14');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 22:15:59');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 22:37:24');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 22:58:43');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 23:31:56');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 23:36:02');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 23:48:28');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 00:16:40');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 00:39:09');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 11:11:06');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 11:19:22');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 11:49:44');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 11:58:40');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 12:02:05');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 12:18:31');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 12:20:50');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:04:48');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 15:06:46');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:06:55');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 15:13:42');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:13:49');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 15:14:05');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:14:09');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 15:15:30');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin0', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-06 15:15:39');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin01', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:15:44');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:20:46');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 15:39:48');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin_new', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:40:00');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin_new', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 15:51:09');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin_new', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 15:51:13');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin_new', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-06 15:51:17');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:51:38');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:55:24');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:57:07');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 15:59:10');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 15:59:14');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:02:52');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:12:32');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:22:09');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 16:22:45');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin_new', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:22:56');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin_new', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 16:23:11');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:24:40');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin01', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2022-12-06 16:27:02');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:30:09');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin01', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2022-12-06 16:31:23');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin01', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码错误', '2022-12-06 16:31:29');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 16:33:20');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin01', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2022-12-06 16:54:04');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin_new', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-12-06 16:55:32');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin_new', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-12-06 16:56:57');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 17:01:15');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 17:03:43');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 17:09:46');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 17:38:25');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 17:54:46');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 17:57:36');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 19:25:21');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 19:27:14');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 19:29:25');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 19:32:32');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 19:57:25');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:01:50');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:02:27');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:03:40');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:06:09');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:06:20');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:09:22');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:09:39');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:11:45');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:11:53');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:13:09');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 20:14:29');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:14:34');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:16:32');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-06 20:18:22');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:18:24');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:19:34');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:21:35');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:22:52');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:25:16');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:28:21');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:29:01');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:32:18');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:34:57');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:39:43');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:44:25');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:47:00');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:47:42');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:48:29');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:49:11');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:50:46');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:50:56');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:52:07');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 20:53:32');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:53:35');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:56:45');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 20:59:09');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:00:10');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:00:58');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:04:35');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:07:12');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:09:47');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:10:29');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 21:16:44');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-06 21:16:48');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:16:51');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:20:50');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:22:58');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:25:57');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:27:53');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:39:48');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:46:18');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:53:53');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:54:19');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:57:10');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 21:59:31');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 22:01:29');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 22:03:14');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 22:17:38');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 22:23:52');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 22:24:19');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-06 22:26:09');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 22:40:28');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 22:44:36');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 23:08:40');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 23:57:10');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:14:03');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:15:56');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:19:21');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:20:23');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-08 00:22:41');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:22:43');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:24:01');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:25:20');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:26:42');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:27:42');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:29:41');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:30:55');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:36:52');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:39:43');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:40:51');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:44:16');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:46:51');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:49:20');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:51:34');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:52:48');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 00:53:55');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:09:27');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:58:37');
INSERT INTO `sys_logininfor` VALUES ('270', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 10:40:22');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:11:13');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:17:15');
INSERT INTO `sys_logininfor` VALUES ('273', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:18:08');
INSERT INTO `sys_logininfor` VALUES ('274', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:25:20');
INSERT INTO `sys_logininfor` VALUES ('275', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:30:00');
INSERT INTO `sys_logininfor` VALUES ('276', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:32:58');
INSERT INTO `sys_logininfor` VALUES ('277', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:37:07');
INSERT INTO `sys_logininfor` VALUES ('278', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-08 11:38:54');
INSERT INTO `sys_logininfor` VALUES ('279', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:38:57');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:39:22');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:48:51');
INSERT INTO `sys_logininfor` VALUES ('282', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:49:32');
INSERT INTO `sys_logininfor` VALUES ('283', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:50:12');
INSERT INTO `sys_logininfor` VALUES ('284', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:53:15');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:55:18');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 11:55:27');
INSERT INTO `sys_logininfor` VALUES ('287', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 12:01:23');
INSERT INTO `sys_logininfor` VALUES ('288', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 12:33:18');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 13:03:40');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 13:19:53');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-08 13:29:51');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-08 13:29:54');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 13:29:56');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 14:43:47');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-08 14:45:28');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 15:53:51');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 16:00:18');
INSERT INTO `sys_logininfor` VALUES ('298', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:06:18');
INSERT INTO `sys_logininfor` VALUES ('299', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:23:06');
INSERT INTO `sys_logininfor` VALUES ('300', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:23:54');
INSERT INTO `sys_logininfor` VALUES ('301', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:24:56');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:32:59');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:35:48');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:36:15');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:38:20');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 17:43:07');
INSERT INTO `sys_logininfor` VALUES ('307', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:00:27');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:11:30');
INSERT INTO `sys_logininfor` VALUES ('309', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:25:17');
INSERT INTO `sys_logininfor` VALUES ('310', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:32:58');
INSERT INTO `sys_logininfor` VALUES ('311', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:34:55');
INSERT INTO `sys_logininfor` VALUES ('312', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:38:12');
INSERT INTO `sys_logininfor` VALUES ('313', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:40:11');
INSERT INTO `sys_logininfor` VALUES ('314', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:46:28');
INSERT INTO `sys_logininfor` VALUES ('315', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:50:41');
INSERT INTO `sys_logininfor` VALUES ('316', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:55:14');
INSERT INTO `sys_logininfor` VALUES ('317', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-08 18:57:25');
INSERT INTO `sys_logininfor` VALUES ('318', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 18:57:30');
INSERT INTO `sys_logininfor` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:01:31');
INSERT INTO `sys_logininfor` VALUES ('320', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:02:17');
INSERT INTO `sys_logininfor` VALUES ('321', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:04:39');
INSERT INTO `sys_logininfor` VALUES ('322', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:07:42');
INSERT INTO `sys_logininfor` VALUES ('323', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:10:23');
INSERT INTO `sys_logininfor` VALUES ('324', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:12:50');
INSERT INTO `sys_logininfor` VALUES ('325', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:16:15');
INSERT INTO `sys_logininfor` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:16:45');
INSERT INTO `sys_logininfor` VALUES ('327', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:32:32');
INSERT INTO `sys_logininfor` VALUES ('328', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:33:11');
INSERT INTO `sys_logininfor` VALUES ('329', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:33:52');
INSERT INTO `sys_logininfor` VALUES ('330', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:35:26');
INSERT INTO `sys_logininfor` VALUES ('331', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:36:18');
INSERT INTO `sys_logininfor` VALUES ('332', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:38:22');
INSERT INTO `sys_logininfor` VALUES ('333', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:39:24');
INSERT INTO `sys_logininfor` VALUES ('334', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:39:47');
INSERT INTO `sys_logininfor` VALUES ('335', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:44:06');
INSERT INTO `sys_logininfor` VALUES ('336', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:45:58');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:46:16');
INSERT INTO `sys_logininfor` VALUES ('338', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:48:01');
INSERT INTO `sys_logininfor` VALUES ('339', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:58:41');
INSERT INTO `sys_logininfor` VALUES ('340', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 19:59:54');
INSERT INTO `sys_logininfor` VALUES ('341', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 20:12:01');
INSERT INTO `sys_logininfor` VALUES ('342', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 20:30:46');
INSERT INTO `sys_logininfor` VALUES ('343', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 20:40:08');
INSERT INTO `sys_logininfor` VALUES ('344', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 20:43:33');
INSERT INTO `sys_logininfor` VALUES ('345', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 20:44:05');
INSERT INTO `sys_logininfor` VALUES ('346', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:02:06');
INSERT INTO `sys_logininfor` VALUES ('347', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:05:13');
INSERT INTO `sys_logininfor` VALUES ('348', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:06:47');
INSERT INTO `sys_logininfor` VALUES ('349', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:10:46');
INSERT INTO `sys_logininfor` VALUES ('350', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:16:01');
INSERT INTO `sys_logininfor` VALUES ('351', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:19:21');
INSERT INTO `sys_logininfor` VALUES ('352', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:20:44');
INSERT INTO `sys_logininfor` VALUES ('353', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:27:43');
INSERT INTO `sys_logininfor` VALUES ('354', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:31:43');
INSERT INTO `sys_logininfor` VALUES ('355', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:33:09');
INSERT INTO `sys_logininfor` VALUES ('356', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:34:05');
INSERT INTO `sys_logininfor` VALUES ('357', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:40:49');
INSERT INTO `sys_logininfor` VALUES ('358', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 21:52:04');
INSERT INTO `sys_logininfor` VALUES ('359', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 22:08:49');
INSERT INTO `sys_logininfor` VALUES ('360', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 22:09:13');
INSERT INTO `sys_logininfor` VALUES ('361', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 22:42:59');
INSERT INTO `sys_logininfor` VALUES ('362', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 22:48:06');
INSERT INTO `sys_logininfor` VALUES ('363', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 22:49:28');
INSERT INTO `sys_logininfor` VALUES ('364', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 22:58:36');
INSERT INTO `sys_logininfor` VALUES ('365', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:02:51');
INSERT INTO `sys_logininfor` VALUES ('366', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:05:48');
INSERT INTO `sys_logininfor` VALUES ('367', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:11:08');
INSERT INTO `sys_logininfor` VALUES ('368', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:13:18');
INSERT INTO `sys_logininfor` VALUES ('369', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:16:56');
INSERT INTO `sys_logininfor` VALUES ('370', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:17:42');
INSERT INTO `sys_logininfor` VALUES ('371', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:20:22');
INSERT INTO `sys_logininfor` VALUES ('372', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:22:38');
INSERT INTO `sys_logininfor` VALUES ('373', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:23:13');
INSERT INTO `sys_logininfor` VALUES ('374', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:26:15');
INSERT INTO `sys_logininfor` VALUES ('375', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:29:31');
INSERT INTO `sys_logininfor` VALUES ('376', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:32:22');
INSERT INTO `sys_logininfor` VALUES ('377', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:34:54');
INSERT INTO `sys_logininfor` VALUES ('378', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:36:22');
INSERT INTO `sys_logininfor` VALUES ('379', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:42:51');
INSERT INTO `sys_logininfor` VALUES ('380', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 23:44:51');
INSERT INTO `sys_logininfor` VALUES ('381', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 09:46:14');
INSERT INTO `sys_logininfor` VALUES ('382', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:21:43');
INSERT INTO `sys_logininfor` VALUES ('383', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:28:01');
INSERT INTO `sys_logininfor` VALUES ('384', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:30:26');
INSERT INTO `sys_logininfor` VALUES ('385', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:39:03');
INSERT INTO `sys_logininfor` VALUES ('386', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:41:44');
INSERT INTO `sys_logininfor` VALUES ('387', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:43:19');
INSERT INTO `sys_logininfor` VALUES ('388', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:44:44');
INSERT INTO `sys_logininfor` VALUES ('389', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:55:46');
INSERT INTO `sys_logininfor` VALUES ('390', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 11:00:52');
INSERT INTO `sys_logininfor` VALUES ('391', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 11:01:31');
INSERT INTO `sys_logininfor` VALUES ('392', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 11:28:56');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1186 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-11-30 19:00:25', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '12', '#', 'menuItem', 'M', '1', '1', '', 'fa fa-video-camera', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 21:32:01', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '13', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-02 21:11:41', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '14', 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 18:06:50', '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-11-30 19:00:25', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-11-30 19:00:25', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-11-30 19:00:25', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'menuItem', 'C', '1', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 20:32:50', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'menuItem', 'C', '1', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 20:33:02', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'menuItem', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-03 15:35:07', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'menuItem', 'C', '1', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-11-30 19:00:25', 'admin', '2022-12-01 21:31:03', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-11-30 19:00:25', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-11-30 19:00:25', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-11-30 19:00:25', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-11-30 19:00:25', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-11-30 19:00:25', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-11-30 19:00:25', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-11-30 19:00:25', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-11-30 19:00:25', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-11-30 19:00:25', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-11-30 19:00:25', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-11-30 19:00:25', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-11-30 19:00:25', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '115', '1', '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '115', '2', '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '115', '3', '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '115', '4', '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '115', '5', '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_menu` VALUES ('1068', '待办事项', '0', '10', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-book', 'admin', '2022-12-01 17:43:03', 'admin', '2022-12-01 20:37:27', '');
INSERT INTO `sys_menu` VALUES ('1069', '个人中心', '0', '2', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-address-book-o', 'admin', '2022-12-01 18:08:08', 'admin', '2022-12-01 20:38:08', '');
INSERT INTO `sys_menu` VALUES ('1070', '热门榜单', '0', '3', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-globe', 'admin', '2022-12-01 18:10:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('1071', '民宿热门榜单', '1070', '1', '#', 'menuItem', 'C', '0', '1', null, 'fa fa-university', 'admin', '2022-12-01 18:12:00', '', null, '');
INSERT INTO `sys_menu` VALUES ('1072', '特产热门榜单', '1070', '2', '/yk/top_speciality', 'menuItem', 'C', '0', '1', 'yk:top_speciality:view', 'fa fa-tag', 'admin', '2022-12-01 18:13:35', 'admin', '2022-12-02 11:07:36', '');
INSERT INTO `sys_menu` VALUES ('1073', '在线订购', '0', '4', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-shopping-cart', 'admin', '2022-12-01 18:15:24', 'admin', '2022-12-01 18:17:19', '');
INSERT INTO `sys_menu` VALUES ('1075', '特产订购', '1073', '2', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-tag', 'admin', '2022-12-01 18:16:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('1076', '历史订单', '0', '5', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-bar-chart', 'admin', '2022-12-01 18:17:49', '', null, '');
INSERT INTO `sys_menu` VALUES ('1079', '订单管理', '0', '6', '#', 'menuItem', 'M', '0', '1', null, 'fa fa-database', 'admin', '2022-12-01 18:21:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1082', '房源管理', '0', '7', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-key', 'admin', '2022-12-01 18:25:08', 'admin', '2022-12-01 20:37:02', '');
INSERT INTO `sys_menu` VALUES ('1083', '特产管理', '0', '8', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-tags', 'admin', '2022-12-01 18:25:53', 'admin', '2022-12-01 20:37:11', '');
INSERT INTO `sys_menu` VALUES ('1084', '天气数据', '0', '9', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bolt', 'admin', '2022-12-01 18:26:23', 'admin', '2022-12-01 20:37:19', '');
INSERT INTO `sys_menu` VALUES ('1085', '驾驶舱', '0', '11', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-automobile', 'admin', '2022-12-01 18:27:06', 'admin', '2022-12-01 20:37:33', '');
INSERT INTO `sys_menu` VALUES ('1086', '我的信息', '1069', '1', '/system/user/profile', 'menuItem', 'C', '0', '1', '', 'fa fa-address-card', 'admin', '2022-12-01 20:39:47', 'admin', '2022-12-05 17:16:21', '');
INSERT INTO `sys_menu` VALUES ('1089', '上传特产', '1083', '1', '#', 'menuItem', 'C', '0', '1', null, 'fa fa-plus-square', 'admin', '2022-12-01 20:47:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('1090', '我的特产', '1083', '2', '#', 'menuItem', 'C', '0', '1', null, 'fa fa-truck', 'admin', '2022-12-01 20:48:59', '', null, '');
INSERT INTO `sys_menu` VALUES ('1091', '天气查询', '1084', '1', '#', 'menuItem', 'C', '0', '1', null, 'fa fa-thermometer-4', 'admin', '2022-12-01 20:50:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('1093', '数据监控', '1085', '1', '#', 'menuItem', 'C', '0', '1', '', 'fa fa-area-chart', 'admin', '2022-12-01 20:51:53', 'admin', '2022-12-01 20:52:15', '');
INSERT INTO `sys_menu` VALUES ('1094', '导出', '1072', '1', '#', 'menuItem', 'F', '0', '1', 'yk:top_speciality:export', '#', 'admin', '2022-12-02 11:19:24', '', null, '');
INSERT INTO `sys_menu` VALUES ('1095', '我的房源', '1082', '1', '/system/room', 'menuItem', 'C', '0', '1', 'system:room:view', 'fa fa-bank', 'admin', '2022-12-02 21:35:09', 'admin', '2022-12-03 14:08:09', '房子管理菜单');
INSERT INTO `sys_menu` VALUES ('1096', '房子管理查询', '1095', '1', '#', '', 'F', '0', '1', 'system:room:list', '#', 'admin', '2022-12-02 21:35:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1097', '房子管理新增', '1095', '2', '#', '', 'F', '0', '1', 'system:room:add', '#', 'admin', '2022-12-02 21:35:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1098', '房子管理修改', '1095', '3', '#', '', 'F', '0', '1', 'system:room:edit', '#', 'admin', '2022-12-02 21:35:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1099', '房子管理删除', '1095', '4', '#', '', 'F', '0', '1', 'system:room:remove', '#', 'admin', '2022-12-02 21:35:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1100', '房子管理导出', '1095', '5', '#', '', 'F', '0', '1', 'system:room:export', '#', 'admin', '2022-12-02 21:35:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('1101', '民宿订购', '1073', '1', '/system/buyroom', 'menuItem', 'C', '0', '1', 'system:buyroom:view', 'fa fa-bank', 'admin', '2022-12-02 22:00:53', 'admin', '2022-12-03 13:46:12', '房间订购菜单');
INSERT INTO `sys_menu` VALUES ('1102', '房间订购查询', '1101', '1', '#', '', 'F', '0', '1', 'system:buyroom:list', '#', 'admin', '2022-12-02 22:00:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1103', '房间订购新增', '1101', '2', '#', '', 'F', '0', '1', 'system:buyroom:add', '#', 'admin', '2022-12-02 22:00:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1104', '房间订购修改', '1101', '3', '#', '', 'F', '0', '1', 'system:buyroom:edit', '#', 'admin', '2022-12-02 22:00:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1105', '房间订购删除', '1101', '4', '#', '', 'F', '0', '1', 'system:buyroom:remove', '#', 'admin', '2022-12-02 22:00:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1106', '房间订购导出', '1101', '5', '#', '', 'F', '0', '1', 'system:buyroom:export', '#', 'admin', '2022-12-02 22:00:53', '', null, '');
INSERT INTO `sys_menu` VALUES ('1131', '民宿订单', '1079', '1', '/landlordhomeorder/landlordorder', 'menuItem', 'C', '0', '1', 'landlordhomeorder:landlordorder:view', 'fa fa-bank', 'admin', '2022-12-03 16:50:26', 'admin', '2022-12-08 10:51:47', '房东管理菜单');
INSERT INTO `sys_menu` VALUES ('1132', '房东管理查询', '1131', '1', '#', '', 'F', '0', '1', 'landlordhomemanagement:homemanagement:list', '#', 'admin', '2022-12-03 16:50:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1133', '房东管理新增', '1131', '2', '#', '', 'F', '0', '1', 'landlordhomemanagement:homemanagement:add', '#', 'admin', '2022-12-03 16:50:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1134', '房东管理修改', '1131', '3', '#', '', 'F', '0', '1', 'landlordhomemanagement:homemanagement:edit', '#', 'admin', '2022-12-03 16:50:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1135', '房东管理删除', '1131', '4', '#', '', 'F', '0', '1', 'landlordhomemanagement:homemanagement:remove', '#', 'admin', '2022-12-03 16:50:26', '', null, '');
INSERT INTO `sys_menu` VALUES ('1136', '房东管理导出', '1131', '5', '#', '', 'F', '0', '1', 'landlordhomemanagement:homemanagement:export', '#', 'admin', '2022-12-03 16:50:27', '', null, '');
INSERT INTO `sys_menu` VALUES ('1155', '我的待办', '1068', '1', '/usertodolist/todolist', 'menuItem', 'C', '0', '1', 'usertodolist:todolist:view', 'fa fa-check-square-o', 'admin', '2022-12-05 21:33:18', 'admin', '2022-12-05 23:12:40', '我的待办菜单');
INSERT INTO `sys_menu` VALUES ('1156', '我的待办查询', '1155', '1', '#', '', 'F', '0', '1', 'usertodolist:todolist:list', '#', 'admin', '2022-12-05 21:33:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1157', '我的待办新增', '1155', '2', '#', '', 'F', '0', '1', 'usertodolist:todolist:add', '#', 'admin', '2022-12-05 21:33:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1158', '我的待办修改', '1155', '3', '#', '', 'F', '0', '1', 'usertodolist:todolist:edit', '#', 'admin', '2022-12-05 21:33:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1159', '我的待办删除', '1155', '4', '#', '', 'F', '0', '1', 'usertodolist:todolist:remove', '#', 'admin', '2022-12-05 21:33:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1160', '我的待办导出', '1155', '5', '#', '', 'F', '0', '1', 'usertodolist:todolist:export', '#', 'admin', '2022-12-05 21:33:18', '', null, '');
INSERT INTO `sys_menu` VALUES ('1161', '用户统计', '100', '10', '#', 'menuItem', 'F', '0', '1', 'system:user:statistics', '#', 'admin', '2022-12-06 17:31:03', 'admin', '2022-12-06 17:32:32', '');
INSERT INTO `sys_menu` VALUES ('1162', '民宿订单', '1076', '1', '/clienthomeorder/homeorder', 'menuItem', 'C', '0', '1', 'clienthomeorder:homeorder:view', 'fa fa-bank', 'admin', '2022-12-06 20:35:31', 'admin', '2022-12-08 10:44:30', '民宿订单菜单');
INSERT INTO `sys_menu` VALUES ('1163', '民宿订单查询', '1162', '1', '#', '', 'F', '0', '1', 'clienthomeorder:homeorder:list', '#', 'admin', '2022-12-06 20:35:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('1164', '民宿订单新增', '1162', '2', '#', '', 'F', '0', '1', 'clienthomeorder:homeorder:add', '#', 'admin', '2022-12-06 20:35:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('1165', '民宿订单修改', '1162', '3', '#', '', 'F', '0', '1', 'clienthomeorder:homeorder:edit', '#', 'admin', '2022-12-06 20:35:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('1166', '民宿订单删除', '1162', '4', '#', '', 'F', '0', '1', 'clienthomeorder:homeorder:remove', '#', 'admin', '2022-12-06 20:35:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('1167', '民宿订单导出', '1162', '5', '#', '', 'F', '0', '1', 'clienthomeorder:homeorder:export', '#', 'admin', '2022-12-06 20:35:32', '', null, '');
INSERT INTO `sys_menu` VALUES ('1168', '特产订单', '1076', '1', '/clientspecialtyorder/clientorder', 'menuItem', 'C', '0', '1', 'clientspecialtyorder:clientorder:view', 'fa fa-tag', 'admin', '2022-12-08 20:53:39', 'admin', '2022-12-08 23:28:12', '特产菜单');
INSERT INTO `sys_menu` VALUES ('1169', '特产查询', '1168', '1', '#', '', 'F', '0', '1', 'clientspecialtyorder:specialtyorder:list', '#', 'admin', '2022-12-08 20:53:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('1170', '特产新增', '1168', '2', '#', '', 'F', '0', '1', 'clientspecialtyorder:specialtyorder:add', '#', 'admin', '2022-12-08 20:53:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('1171', '特产修改', '1168', '3', '#', '', 'F', '0', '1', 'clientspecialtyorder:specialtyorder:edit', '#', 'admin', '2022-12-08 20:53:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('1172', '特产删除', '1168', '4', '#', '', 'F', '0', '1', 'clientspecialtyorder:specialtyorder:remove', '#', 'admin', '2022-12-08 20:53:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('1173', '特产导出', '1168', '5', '#', '', 'F', '0', '1', 'clientspecialtyorder:specialtyorder:export', '#', 'admin', '2022-12-08 20:53:39', '', null, '');
INSERT INTO `sys_menu` VALUES ('1180', '特产订单', '1079', '1', '/landlordspecialtyorder/specialtyorder', 'menuItem', 'C', '0', '1', 'landlordspecialtyorder:specialtyorder:view', 'fa fa-tag', 'admin', '2022-12-08 21:14:01', 'admin', '2022-12-08 21:16:50', '订单菜单');
INSERT INTO `sys_menu` VALUES ('1181', '订单查询', '1180', '1', '#', '', 'F', '0', '1', 'landlordspecialtyorder:specialtyorder:list', '#', 'admin', '2022-12-08 21:14:01', '', null, '');
INSERT INTO `sys_menu` VALUES ('1182', '订单新增', '1180', '2', '#', '', 'F', '0', '1', 'landlordspecialtyorder:specialtyorder:add', '#', 'admin', '2022-12-08 21:14:01', '', null, '');
INSERT INTO `sys_menu` VALUES ('1183', '订单修改', '1180', '3', '#', '', 'F', '0', '1', 'landlordspecialtyorder:specialtyorder:edit', '#', 'admin', '2022-12-08 21:14:01', '', null, '');
INSERT INTO `sys_menu` VALUES ('1184', '订单删除', '1180', '4', '#', '', 'F', '0', '1', 'landlordspecialtyorder:specialtyorder:remove', '#', 'admin', '2022-12-08 21:14:01', '', null, '');
INSERT INTO `sys_menu` VALUES ('1185', '订单导出', '1180', '5', '#', '', 'F', '0', '1', 'landlordspecialtyorder:specialtyorder:export', '#', 'admin', '2022-12-08 21:14:01', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-11-30 19:00:25', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-11-30 19:00:25', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"待办事项\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:43:03');
INSERT INTO `sys_oper_log` VALUES ('2', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1063', '127.0.0.1', '内网IP', '1063', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:49:04');
INSERT INTO `sys_oper_log` VALUES ('3', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1064', '127.0.0.1', '内网IP', '1064', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:49:10');
INSERT INTO `sys_oper_log` VALUES ('4', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1065', '127.0.0.1', '内网IP', '1065', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:49:14');
INSERT INTO `sys_oper_log` VALUES ('5', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1066', '127.0.0.1', '内网IP', '1066', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:49:17');
INSERT INTO `sys_oper_log` VALUES ('6', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1067', '127.0.0.1', '内网IP', '1067', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:49:21');
INSERT INTO `sys_oper_log` VALUES ('7', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1062', '127.0.0.1', '内网IP', '1062', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 17:49:24');
INSERT INTO `sys_oper_log` VALUES ('8', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"12\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:05:56');
INSERT INTO `sys_oper_log` VALUES ('9', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"13\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:06:13');
INSERT INTO `sys_oper_log` VALUES ('10', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"13\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:06:13');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', '0', null, '2022-12-01 18:06:22');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"14\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:06:51');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1068\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"待办事项\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:07:22');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人中心\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-address-book-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:08:08');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"热门榜单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:10:13');
INSERT INTO `sys_oper_log` VALUES ('16', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿热门榜单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-university\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:12:00');
INSERT INTO `sys_oper_log` VALUES ('17', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1070\"],\"menuType\":[\"C\"],\"menuName\":[\"特产热门榜单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:13:35');
INSERT INTO `sys_oper_log` VALUES ('18', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"在线订购\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-legal\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:15:24');
INSERT INTO `sys_oper_log` VALUES ('19', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"M\"],\"menuName\":[\"民俗订购\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:15:56');
INSERT INTO `sys_oper_log` VALUES ('20', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1073\"],\"menuType\":[\"M\"],\"menuName\":[\"特产订购\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:16:45');
INSERT INTO `sys_oper_log` VALUES ('21', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1074\"],\"parentId\":[\"1073\"],\"menuType\":[\"M\"],\"menuName\":[\"民宿订购\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:16:57');
INSERT INTO `sys_oper_log` VALUES ('22', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1073\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"在线订购\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-shopping-cart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:17:19');
INSERT INTO `sys_oper_log` VALUES ('23', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"历史订单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bar-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:17:49');
INSERT INTO `sys_oper_log` VALUES ('24', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:18:41');
INSERT INTO `sys_oper_log` VALUES ('25', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:19:28');
INSERT INTO `sys_oper_log` VALUES ('26', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1069\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人中心\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-address-book-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:20:29');
INSERT INTO `sys_oper_log` VALUES ('27', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"订单管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-database\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:21:24');
INSERT INTO `sys_oper_log` VALUES ('28', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1068\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"待办事项\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:21:41');
INSERT INTO `sys_oper_log` VALUES ('29', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:22:23');
INSERT INTO `sys_oper_log` VALUES ('30', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:23:09');
INSERT INTO `sys_oper_log` VALUES ('31', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"房源管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-key\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:25:08');
INSERT INTO `sys_oper_log` VALUES ('32', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"特产管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-tags\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:25:53');
INSERT INTO `sys_oper_log` VALUES ('33', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"天气数据\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-bolt\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:26:23');
INSERT INTO `sys_oper_log` VALUES ('34', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"驾驶舱\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"fa fa-automobile\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 18:27:06');
INSERT INTO `sys_oper_log` VALUES ('35', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:32:51');
INSERT INTO `sys_oper_log` VALUES ('36', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:33:02');
INSERT INTO `sys_oper_log` VALUES ('37', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', '1', 'admin', null, '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"8\"],\"configName\":[\"主框架页-菜单导航显示风格\"],\"configKey\":[\"sys.index.menuStyle\"],\"configValue\":[\"topnav\"],\"configType\":[\"Y\"],\"remark\":[\"菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:34:53');
INSERT INTO `sys_oper_log` VALUES ('38', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1082\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"房源管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-key\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:37:02');
INSERT INTO `sys_oper_log` VALUES ('39', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1083\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"特产管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-tags\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:37:12');
INSERT INTO `sys_oper_log` VALUES ('40', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1084\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"天气数据\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-bolt\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:37:19');
INSERT INTO `sys_oper_log` VALUES ('41', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1068\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"待办事项\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:37:27');
INSERT INTO `sys_oper_log` VALUES ('42', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1085\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"驾驶舱\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"fa fa-automobile\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:37:33');
INSERT INTO `sys_oper_log` VALUES ('43', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:38:01');
INSERT INTO `sys_oper_log` VALUES ('44', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1069\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人中心\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-address-book-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:38:08');
INSERT INTO `sys_oper_log` VALUES ('45', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1069\"],\"menuType\":[\"C\"],\"menuName\":[\"我的信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:39:47');
INSERT INTO `sys_oper_log` VALUES ('46', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1082\"],\"menuType\":[\"C\"],\"menuName\":[\"上传房源\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:41:13');
INSERT INTO `sys_oper_log` VALUES ('47', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1082\"],\"menuType\":[\"C\"],\"menuName\":[\"我的房源\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-home\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:45:41');
INSERT INTO `sys_oper_log` VALUES ('48', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1087\"],\"parentId\":[\"1082\"],\"menuType\":[\"C\"],\"menuName\":[\"上传房源\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-plus-square\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:46:38');
INSERT INTO `sys_oper_log` VALUES ('49', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1083\"],\"menuType\":[\"C\"],\"menuName\":[\"上传特产\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-plus-square\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:47:42');
INSERT INTO `sys_oper_log` VALUES ('50', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1083\"],\"menuType\":[\"C\"],\"menuName\":[\"我的特产\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-truck\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:49:00');
INSERT INTO `sys_oper_log` VALUES ('51', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1084\"],\"menuType\":[\"C\"],\"menuName\":[\"天气查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-thermometer-4\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:50:14');
INSERT INTO `sys_oper_log` VALUES ('52', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"我的代办\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calendar-check-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:51:02');
INSERT INTO `sys_oper_log` VALUES ('53', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1085\"],\"menuType\":[\"C\"],\"menuName\":[\"数据监控\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:51:53');
INSERT INTO `sys_oper_log` VALUES ('54', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1093\"],\"parentId\":[\"1085\"],\"menuType\":[\"C\"],\"menuName\":[\"数据监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-area-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:52:15');
INSERT INTO `sys_oper_log` VALUES ('55', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', '1', 'admin', null, '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-yellow\"],\"configType\":[\"Y\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:55:13');
INSERT INTO `sys_oper_log` VALUES ('56', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', '1', 'admin', null, '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"3\"],\"configName\":[\"主框架页-侧边栏主题\"],\"configKey\":[\"sys.index.sideTheme\"],\"configValue\":[\"theme-light\"],\"configType\":[\"Y\"],\"remark\":[\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 20:55:27');
INSERT INTO `sys_oper_log` VALUES ('57', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-sun-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 21:31:04');
INSERT INTO `sys_oper_log` VALUES ('58', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"12\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 21:32:02');
INSERT INTO `sys_oper_log` VALUES ('59', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"13\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-01 21:32:09');
INSERT INTO `sys_oper_log` VALUES ('60', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1092\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"我的待办\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calendar-check-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 00:07:50');
INSERT INTO `sys_oper_log` VALUES ('61', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1072\"],\"parentId\":[\"1070\"],\"menuType\":[\"C\"],\"menuName\":[\"特产热门榜单\"],\"url\":[\"/yk/top_speciality\"],\"target\":[\"menuItem\"],\"perms\":[\"yk:top_speciality:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 11:07:36');
INSERT INTO `sys_oper_log` VALUES ('62', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1072\"],\"menuType\":[\"F\"],\"menuName\":[\"导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"yk:top_speciality:export\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 11:19:24');
INSERT INTO `sys_oper_log` VALUES ('63', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', null, '1', '导出Excel失败，请联系网站管理员！', '2022-12-02 11:24:43');
INSERT INTO `sys_oper_log` VALUES ('64', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"d9c489c8-e124-4f57-9b81-2f7e5fdfbfae_用户数据.xlsx\",\"code\":0}', '0', null, '2022-12-02 11:28:27');
INSERT INTO `sys_oper_log` VALUES ('65', '热门特产', '5', 'com.ruoyi.yk.controller.TopSpecialityController.export()', 'POST', '1', 'admin', null, '/yk/top_speciality/export', '127.0.0.1', '内网IP', '{\"specialtyName\":[\"\"],\"price\":[\"\"],\"sale\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"778f9d84-32d8-484b-9d52-395d5c201a00_热门特产.xlsx\",\"code\":0}', '0', null, '2022-12-02 11:32:59');
INSERT INTO `sys_oper_log` VALUES ('66', '热门特产', '5', 'com.ruoyi.yk.controller.TopSpecialityController.export()', 'POST', '1', 'admin', null, '/yk/top_speciality/export', '127.0.0.1', '内网IP', '{\"specialtyName\":[\"\"],\"price\":[\"\"],\"sale\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"55141c04-7cf5-4ccc-937c-0af32fa4549d_热门特产.xlsx\",\"code\":0}', '0', null, '2022-12-02 11:36:17');
INSERT INTO `sys_oper_log` VALUES ('67', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"13\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 21:11:42');
INSERT INTO `sys_oper_log` VALUES ('68', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"house_room\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 21:17:19');
INSERT INTO `sys_oper_log` VALUES ('69', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"house_room\"],\"tableComment\":[\"room\"],\"className\":[\"HouseRoom\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"民宿ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"houseId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"roomNumber\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"每日价格\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"pricePerDay\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"房间标准\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"standard\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnCo', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 21:24:42');
INSERT INTO `sys_oper_log` VALUES ('70', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/house_room', '127.0.0.1', '内网IP', '\"house_room\"', null, '0', null, '2022-12-02 21:24:45');
INSERT INTO `sys_oper_log` VALUES ('71', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"house_room\"],\"tableComment\":[\"room\"],\"className\":[\"HouseRoom\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"民宿ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"houseId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"roomNumber\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"每日价格\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"pricePerDay\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"房间标准\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"standard\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnCo', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 21:33:09');
INSERT INTO `sys_oper_log` VALUES ('72', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/house_room', '127.0.0.1', '内网IP', '\"house_room\"', null, '0', null, '2022-12-02 21:33:12');
INSERT INTO `sys_oper_log` VALUES ('73', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"house_room\"],\"tableComment\":[\"buyroom\"],\"className\":[\"BuyRoom\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"民宿ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"houseId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间号\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"roomNumber\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"每日价格\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"pricePerDay\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"房间标准\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"standard\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnC', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 21:59:39');
INSERT INTO `sys_oper_log` VALUES ('74', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/house_room', '127.0.0.1', '内网IP', '\"house_room\"', null, '0', null, '2022-12-02 21:59:46');
INSERT INTO `sys_oper_log` VALUES ('75', '热门特产', '5', 'com.ruoyi.yk.controller.TopSpecialityController.export()', 'POST', '1', 'admin', null, '/yk/top_speciality/export', '127.0.0.1', '内网IP', '{\"specialtyName\":[\"\"],\"price\":[\"\"],\"sale\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"aa300c48-c2df-450d-8dd4-d8730190776f_热门特产.xlsx\",\"code\":0}', '0', null, '2022-12-02 22:28:34');
INSERT INTO `sys_oper_log` VALUES ('76', '房间订购', '2', 'com.ruoyi.system.controller.BuyRoomController.editSave()', 'POST', '1', 'admin', null, '/system/buyroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"]}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\system\\BuyRoomMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.BuyRoomMapper.updateBuyRoom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update house_room                    where id = ?\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3', '2022-12-02 23:18:53');
INSERT INTO `sys_oper_log` VALUES ('77', '房子管理', '2', 'com.ruoyi.system.controller.HouseRoomController.editSave()', 'POST', '1', 'admin', null, '/system/room/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"houseId\":[\"1\"],\"roomNumber\":[\"890790\"],\"pricePerDay\":[\"110\"],\"standard\":[\"双人间\"],\"isFree\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-02 23:19:14');
INSERT INTO `sys_oper_log` VALUES ('78', '房间订购', '2', 'com.ruoyi.system.controller.BuyRoomController.editSave()', 'POST', '1', 'admin', null, '/system/buyroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"]}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\system\\BuyRoomMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.BuyRoomMapper.updateBuyRoom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update house_room                    where id = ?\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3', '2022-12-02 23:19:30');
INSERT INTO `sys_oper_log` VALUES ('79', '房间订购', '2', 'com.ruoyi.system.controller.BuyRoomController.editSave()', 'POST', '1', 'admin', null, '/system/buyroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"]}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\system\\BuyRoomMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.BuyRoomMapper.updateBuyRoom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update house_room                    where id = ?\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3', '2022-12-02 23:19:43');
INSERT INTO `sys_oper_log` VALUES ('80', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"测试用户\"],\"phonenumber\":[\"17212345678\"],\"email\":[\"sja@qq.com\"],\"loginName\":[\"12345\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"ab\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:36:13');
INSERT INTO `sys_oper_log` VALUES ('81', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:37:44');
INSERT INTO `sys_oper_log` VALUES ('82', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:38:15');
INSERT INTO `sys_oper_log` VALUES ('83', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:38:35');
INSERT INTO `sys_oper_log` VALUES ('84', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', '1', 'admin', null, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"17\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:38:46');
INSERT INTO `sys_oper_log` VALUES ('85', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:38:50');
INSERT INTO `sys_oper_log` VALUES ('86', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', '1', 'admin', null, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"17\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:38:56');
INSERT INTO `sys_oper_log` VALUES ('87', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"测试用\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"12345\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:45:24');
INSERT INTO `sys_oper_log` VALUES ('88', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:45:30');
INSERT INTO `sys_oper_log` VALUES ('89', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1074', '127.0.0.1', '内网IP', '1074', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:45:43');
INSERT INTO `sys_oper_log` VALUES ('90', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1101\"],\"parentId\":[\"1073\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订购\"],\"url\":[\"/system/buyroom\"],\"target\":[\"menuItem\"],\"perms\":[\"system:buyroom:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:46:12');
INSERT INTO `sys_oper_log` VALUES ('91', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"测试用户\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"12345\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 13:47:08');
INSERT INTO `sys_oper_log` VALUES ('92', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"e3886ff5-68f0-4969-8628-4760d937a9eb_用户数据.xlsx\",\"code\":0}', '0', null, '2022-12-03 13:51:50');
INSERT INTO `sys_oper_log` VALUES ('93', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"ec8cd432-b2d6-40de-bca2-94853a1267e3_用户数据.xlsx\",\"code\":0}', '0', null, '2022-12-03 13:55:10');
INSERT INTO `sys_oper_log` VALUES ('94', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1087', '127.0.0.1', '内网IP', '1087', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 14:07:04');
INSERT INTO `sys_oper_log` VALUES ('95', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1088', '127.0.0.1', '内网IP', '1088', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 14:07:16');
INSERT INTO `sys_oper_log` VALUES ('96', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1095\"],\"parentId\":[\"1082\"],\"menuType\":[\"C\"],\"menuName\":[\"我的房源\"],\"url\":[\"/system/room\"],\"target\":[\"menuItem\"],\"perms\":[\"system:room:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 14:08:09');
INSERT INTO `sys_oper_log` VALUES ('97', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"client_room_record\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:33:17');
INSERT INTO `sys_oper_log` VALUES ('98', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:35:07');
INSERT INTO `sys_oper_log` VALUES ('99', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', null, '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"用户是否付款\"],\"dictType\":[\"snsnns\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:36:49');
INSERT INTO `sys_oper_log` VALUES ('100', '字典类型', '2', 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', '1', 'admin', null, '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"11\"],\"dictName\":[\"用户是否付款\"],\"dictType\":[\"sys_user_is_paid\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:37:17');
INSERT INTO `sys_oper_log` VALUES ('101', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"1\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_paid\"],\"cssClass\":[\"未付款\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:37:56');
INSERT INTO `sys_oper_log` VALUES ('102', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"未付款\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_paid\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:38:19');
INSERT INTO `sys_oper_log` VALUES ('103', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"未付款\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_paid\"],\"cssClass\":[\"用户未付款\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:38:32');
INSERT INTO `sys_oper_log` VALUES ('104', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已付款\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_user_is_paid\"],\"cssClass\":[\"用户已付款\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:38:52');
INSERT INTO `sys_oper_log` VALUES ('105', '字典类型', '2', 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', '1', 'admin', null, '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"11\"],\"dictName\":[\"用户是否付款\"],\"dictType\":[\"sys_user_is_paid\"],\"status\":[\"0\"],\"remark\":[\"用户付款列表\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:39:21');
INSERT INTO `sys_oper_log` VALUES ('106', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', null, '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"订单状态\"],\"dictType\":[\"sys_user_is_done\"],\"status\":[\"0\"],\"remark\":[\"用户是否已经完成订单\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:40:12');
INSERT INTO `sys_oper_log` VALUES ('107', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未付款\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_done\"],\"cssClass\":[\"用户还没有付款\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:40:38');
INSERT INTO `sys_oper_log` VALUES ('108', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"未付款\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_paid\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户未付款\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:41:20');
INSERT INTO `sys_oper_log` VALUES ('109', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"31\"],\"dictLabel\":[\"已付款\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_user_is_paid\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户已付款\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:41:27');
INSERT INTO `sys_oper_log` VALUES ('110', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"未完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_done\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户还未完成订单\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:41:49');
INSERT INTO `sys_oper_log` VALUES ('111', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_user_is_done\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户已完成订单\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:42:08');
INSERT INTO `sys_oper_log` VALUES ('112', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"未完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_done\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户未完成订单\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:42:14');
INSERT INTO `sys_oper_log` VALUES ('113', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:46:36');
INSERT INTO `sys_oper_log` VALUES ('114', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:47:21');
INSERT INTO `sys_oper_log` VALUES ('115', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-03 15:47:32');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:52:49');
INSERT INTO `sys_oper_log` VALUES ('117', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-03 15:53:04');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1113', '127.0.0.1', '内网IP', '1113', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', '0', null, '2022-12-03 15:55:24');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1114', '127.0.0.1', '内网IP', '1114', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:55:31');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1115', '127.0.0.1', '内网IP', '1115', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:55:49');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1116', '127.0.0.1', '内网IP', '1116', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:56:01');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1117', '127.0.0.1', '内网IP', '1117', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:56:16');
INSERT INTO `sys_oper_log` VALUES ('123', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1118', '127.0.0.1', '内网IP', '1118', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:56:29');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1113', '127.0.0.1', '内网IP', '1113', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 15:56:41');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1107', '127.0.0.1', '内网IP', '1107', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', '0', null, '2022-12-03 16:03:07');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1108', '127.0.0.1', '内网IP', '1108', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:03:14');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1109', '127.0.0.1', '内网IP', '1109', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:03:34');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1110', '127.0.0.1', '内网IP', '1110', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:03:44');
INSERT INTO `sys_oper_log` VALUES ('129', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1111', '127.0.0.1', '内网IP', '1111', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:03:56');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1112', '127.0.0.1', '内网IP', '1112', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:04:05');
INSERT INTO `sys_oper_log` VALUES ('131', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1107', '127.0.0.1', '内网IP', '1107', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:04:13');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:06:30');
INSERT INTO `sys_oper_log` VALUES ('133', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-03 16:06:35');
INSERT INTO `sys_oper_log` VALUES ('134', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:35:25');
INSERT INTO `sys_oper_log` VALUES ('135', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:36:29');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-03 16:36:31');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:49:36');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 16:49:54');
INSERT INTO `sys_oper_log` VALUES ('139', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-03 16:50:08');
INSERT INTO `sys_oper_log` VALUES ('140', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', null, '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"待办事项状态\"],\"dictType\":[\"todolist_status\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:16:55');
INSERT INTO `sys_oper_log` VALUES ('141', '字典类型', '2', 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', 'POST', '1', 'admin', null, '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"13\"],\"dictName\":[\"待办事项状态\"],\"dictType\":[\"todolist_status\"],\"status\":[\"0\"],\"remark\":[\"待办事项模块\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:17:26');
INSERT INTO `sys_oper_log` VALUES ('142', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"待完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:18:51');
INSERT INTO `sys_oper_log` VALUES ('143', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:19:09');
INSERT INTO `sys_oper_log` VALUES ('144', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:25:24');
INSERT INTO `sys_oper_log` VALUES ('145', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', '1', 'admin', null, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"9\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:25:59');
INSERT INTO `sys_oper_log` VALUES ('146', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"user_todolist\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 17:58:04');
INSERT INTO `sys_oper_log` VALUES ('147', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"user_todolist\"],\"tableComment\":[\"待办事项\"],\"className\":[\"UserTodolist\"],\"functionAuthor\":[\"yyt\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"账号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userNumber\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"20\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"ddlTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"21\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"待办事项状态\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"status\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"radio\"],\"columns[4].dictType\":[\"todolist_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.usertodolist\"],\"moduleName\":[\"usertodolist\"],\"businessName\":[\"todolist\"],\"functionName\":[\"我的待办\"],\"params[parentMenuId]\":[\"1068\"],\"params[parentMenuName]\":[\"待办事项\"],\"genType\":[\"0\"],\"genPath\":', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 18:01:23');
INSERT INTO `sys_oper_log` VALUES ('148', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/user_todolist', '127.0.0.1', '内网IP', '\"user_todolist\"', null, '0', null, '2022-12-03 18:01:30');
INSERT INTO `sys_oper_log` VALUES ('149', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 18:28:15');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1092', '127.0.0.1', '内网IP', '1092', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 18:54:44');
INSERT INTO `sys_oper_log` VALUES ('151', '热门特产', '5', 'com.ruoyi.yk.controller.TopSpecialityController.export()', 'POST', '1', 'admin', null, '/yk/top_speciality/export', '127.0.0.1', '内网IP', '{\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"6bc9f1ec-a00d-42cc-a158-7b2ec71eeb81_热门特产.xlsx\",\"code\":0}', '0', null, '2022-12-03 21:06:52');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1144', '127.0.0.1', '内网IP', '1144', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:00:07');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1145', '127.0.0.1', '内网IP', '1145', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:00:12');
INSERT INTO `sys_oper_log` VALUES ('154', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1146', '127.0.0.1', '内网IP', '1146', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:00:31');
INSERT INTO `sys_oper_log` VALUES ('155', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1147', '127.0.0.1', '内网IP', '1147', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:00:37');
INSERT INTO `sys_oper_log` VALUES ('156', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1148', '127.0.0.1', '内网IP', '1148', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:00:42');
INSERT INTO `sys_oper_log` VALUES ('157', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1143', '127.0.0.1', '内网IP', '1143', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:01:05');
INSERT INTO `sys_oper_log` VALUES ('158', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1125', '127.0.0.1', '内网IP', '1125', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', '0', null, '2022-12-03 22:01:25');
INSERT INTO `sys_oper_log` VALUES ('159', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1126', '127.0.0.1', '内网IP', '1126', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:01:32');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1120', '127.0.0.1', '内网IP', '1120', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:02:15');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1121', '127.0.0.1', '内网IP', '1121', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:02:22');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1122', '127.0.0.1', '内网IP', '1122', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:02:29');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1123', '127.0.0.1', '内网IP', '1123', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:02:36');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1124', '127.0.0.1', '内网IP', '1124', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:02:50');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1119', '127.0.0.1', '内网IP', '1119', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:02:58');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1127', '127.0.0.1', '内网IP', '1127', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:03:16');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1128', '127.0.0.1', '内网IP', '1128', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:03:59');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1129', '127.0.0.1', '内网IP', '1129', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:04:11');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1130', '127.0.0.1', '内网IP', '1130', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:04:18');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1125', '127.0.0.1', '内网IP', '1125', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:04:31');
INSERT INTO `sys_oper_log` VALUES ('171', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-03 22:07:51');
INSERT INTO `sys_oper_log` VALUES ('172', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-03 22:11:27');
INSERT INTO `sys_oper_log` VALUES ('173', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1086\"],\"parentId\":[\"1069\"],\"menuType\":[\"C\"],\"menuName\":[\"我的信息\"],\"url\":[\"#/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 17:15:39');
INSERT INTO `sys_oper_log` VALUES ('174', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1086\"],\"parentId\":[\"1069\"],\"menuType\":[\"C\"],\"menuName\":[\"我的信息\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 17:16:21');
INSERT INTO `sys_oper_log` VALUES ('175', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"user_todolist\"],\"tableComment\":[\"待办事项\"],\"className\":[\"UserTodolist\"],\"functionAuthor\":[\"yyt\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"账号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"20\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"ddlTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"21\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"待办事项状态\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"status\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"radio\"],\"columns[4].dictType\":[\"todolist_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.usertodolist\"],\"moduleName\":[\"usertodolist\"],\"businessName\":[\"todolist\"],\"functionName\":[\"我的待办\"],\"params[parentMenuId]\":[\"1068\"],\"par', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 21:09:50');
INSERT INTO `sys_oper_log` VALUES ('176', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"user_todolist\"],\"tableComment\":[\"待办事项\"],\"className\":[\"UserTodolist\"],\"functionAuthor\":[\"yyt\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"账号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"20\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"ddlTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"21\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"待办事项状态\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"status\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"upload\"],\"columns[4].dictType\":[\"todolist_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.usertodolist\"],\"moduleName\":[\"usertodolist\"],\"businessName\":[\"todolist\"],\"functionName\":[\"我的待办\"],\"params[parentMenuId]\":[\"1068\"],\"pa', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 21:27:07');
INSERT INTO `sys_oper_log` VALUES ('177', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/user_todolist', '127.0.0.1', '内网IP', '\"user_todolist\"', null, '0', null, '2022-12-05 21:27:17');
INSERT INTO `sys_oper_log` VALUES ('178', '我的待办', '2', 'com.ruoyi.usertodolist.controller.UserTodolistController.editSave()', 'POST', '1', 'admin', null, '/usertodolist/todolist/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"content\":[\"看电影吧\"],\"ddlTime\":[\"2022-11-16\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 21:43:04');
INSERT INTO `sys_oper_log` VALUES ('179', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"user_todolist\"],\"tableComment\":[\"待办事项\"],\"className\":[\"UserTodolist\"],\"functionAuthor\":[\"yyt\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"账号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"20\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"ddlTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"21\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"待办事项状态\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"status\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"checkbox\"],\"columns[4].dictType\":[\"todolist_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.usertodolist\"],\"moduleName\":[\"usertodolist\"],\"businessName\":[\"todolist\"],\"functionName\":[\"我的待办\"],\"params[parentMenuId]\":[\"1068\"],\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 21:44:02');
INSERT INTO `sys_oper_log` VALUES ('180', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/user_todolist', '127.0.0.1', '内网IP', '\"user_todolist\"', null, '0', null, '2022-12-05 21:44:10');
INSERT INTO `sys_oper_log` VALUES ('181', '我的待办', '2', 'com.ruoyi.usertodolist.controller.UserTodolistController.editSave()', 'POST', '1', 'admin', null, '/usertodolist/todolist/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"content\":[\"看电影吧\"],\"ddlTime\":[\"2022-11-16\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 21:49:39');
INSERT INTO `sys_oper_log` VALUES ('182', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"ddlTime\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', null, '1', '导出Excel失败，请联系网站管理员！', '2022-12-05 21:50:07');
INSERT INTO `sys_oper_log` VALUES ('183', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"textsex\":[\"0\"],\"province\":[\"四川省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:10:40');
INSERT INTO `sys_oper_log` VALUES ('184', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1155\"],\"parentId\":[\"1068\"],\"menuType\":[\"C\"],\"menuName\":[\"我的待办\"],\"url\":[\"/usertodolist/todolist\"],\"target\":[\"menuItem\"],\"perms\":[\"usertodolist:todolist:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check-square-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:12:40');
INSERT INTO `sys_oper_log` VALUES ('185', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668268\"],\"email\":[\"3112123482@163.com\"],\"sex\":[\"0\"],\"province\":[\"四川省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:24:25');
INSERT INTO `sys_oper_log` VALUES ('186', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"四川省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:32:12');
INSERT INTO `sys_oper_log` VALUES ('187', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"女\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:33:51');
INSERT INTO `sys_oper_log` VALUES ('188', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"未知\"],\"province\":[\"海南省\"]}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\r\n### The error may exist in file [C:\\Users\\13038\\Desktop\\XM-05-MSLY\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user     SET login_name = ?,     user_name = ?,     user_type = ?,     email = ?,     phonenumber = ?,     sex = ?,          password = ?,     salt = ?,     status = ?,     login_ip = ?,     login_date = ?,     pwd_update_date = ?,          remark = ?,    money = ?,    province = ?,     update_time = sysdate()     where user_id = ?\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1', '2022-12-05 23:34:03');
INSERT INTO `sys_oper_log` VALUES ('189', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:34:16');
INSERT INTO `sys_oper_log` VALUES ('190', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"女\"],\"province\":[\"四川省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:36:11');
INSERT INTO `sys_oper_log` VALUES ('191', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:36:21');
INSERT INTO `sys_oper_log` VALUES ('192', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"\"],\"userName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"sex\":[\"\"],\"province\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-05 23:48:35');
INSERT INTO `sys_oper_log` VALUES ('193', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"\"],\"userName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"sex\":[\"\"],\"province\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:17:19');
INSERT INTO `sys_oper_log` VALUES ('194', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"女\"],\"province\":[\"四川省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:18:37');
INSERT INTO `sys_oper_log` VALUES ('195', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:23:47');
INSERT INTO `sys_oper_log` VALUES ('196', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"\"],\"userName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"sex\":[\"\"],\"province\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:24:35');
INSERT INTO `sys_oper_log` VALUES ('197', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:26:00');
INSERT INTO `sys_oper_log` VALUES ('198', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"\"],\"userName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"sex\":[\"\"],\"province\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:26:09');
INSERT INTO `sys_oper_log` VALUES ('199', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:27:12');
INSERT INTO `sys_oper_log` VALUES ('200', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"loginName\":[\"\"],\"userName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"sex\":[\"\"],\"province\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:27:20');
INSERT INTO `sys_oper_log` VALUES ('201', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:28:47');
INSERT INTO `sys_oper_log` VALUES ('202', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"money\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:29:13');
INSERT INTO `sys_oper_log` VALUES ('203', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"money\":[\"200\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:31:41');
INSERT INTO `sys_oper_log` VALUES ('204', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"money\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:31:49');
INSERT INTO `sys_oper_log` VALUES ('205', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"money\":[\"200\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:32:42');
INSERT INTO `sys_oper_log` VALUES ('206', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"money\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 00:39:22');
INSERT INTO `sys_oper_log` VALUES ('207', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', '1', 'admin', null, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"9\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 11:20:08');
INSERT INTO `sys_oper_log` VALUES ('208', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"宋管理员\"],\"province\":[\"江苏\"],\"phonenumber\":[\"17212345678\"],\"email\":[\"debug@qq.com\"],\"loginName\":[\"admin01\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', null, '1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.NumberFormatException: For input string: \"江苏\"\r\n### The error may exist in file [C:\\Users\\29872\\Desktop\\yk-project\\test\\XM-05-MSLY\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser\r\n### The error occurred while executing an update\r\n### Cause: java.lang.NumberFormatException: For input string: \"江苏\"', '2022-12-06 11:59:36');
INSERT INTO `sys_oper_log` VALUES ('209', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"宋管理员\"],\"province\":[\"江苏\"],\"phonenumber\":[\"17212345678\"],\"email\":[\"debug@qq.com\"],\"loginName\":[\"admin01\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 12:02:48');
INSERT INTO `sys_oper_log` VALUES ('210', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', null, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"20\"],\"loginName\":[\"admin01\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 15:13:37');
INSERT INTO `sys_oper_log` VALUES ('211', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"测试用户\"],\"province\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"test_admin\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 15:21:19');
INSERT INTO `sys_oper_log` VALUES ('212', '用户管理', '3', 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', '1', 'admin', null, '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21,20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 15:38:16');
INSERT INTO `sys_oper_log` VALUES ('213', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"新增管理员\"],\"province\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"admin_new\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 15:38:43');
INSERT INTO `sys_oper_log` VALUES ('214', '房子管理', '5', 'com.ruoyi.system.controller.HouseRoomController.export()', 'POST', '1', 'admin', null, '/system/room/export', '127.0.0.1', '内网IP', '{\"houseId\":[\"\"],\"roomNumber\":[\"\"],\"pricePerDay\":[\"\"],\"standard\":[\"\"],\"isFree\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"bda9d82a-8566-4358-b1b0-1a260a4f38eb_房子管理数据.xlsx\",\"code\":0}', '0', null, '2022-12-06 16:33:31');
INSERT INTO `sys_oper_log` VALUES ('215', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"userId\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"ca941313-6abc-4a31-a347-5fe414857d83_用户数据.xlsx\",\"code\":0}', '0', null, '2022-12-06 17:10:45');
INSERT INTO `sys_oper_log` VALUES ('216', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1005', '127.0.0.1', '内网IP', '1005', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', '0', null, '2022-12-06 17:30:25');
INSERT INTO `sys_oper_log` VALUES ('217', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"menuType\":[\"F\"],\"menuName\":[\"用户统计\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"@RequiresPermissions(\\\"\\\")\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 17:31:04');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1161\"],\"parentId\":[\"100\"],\"menuType\":[\"F\"],\"menuName\":[\"用户统计\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:user:statistics\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 17:32:33');
INSERT INTO `sys_oper_log` VALUES ('219', '我的待办', '3', 'com.ruoyi.usertodolist.controller.UserTodolistController.remove()', 'POST', '1', 'admin', null, '/usertodolist/todolist/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 19:50:45');
INSERT INTO `sys_oper_log` VALUES ('220', '我的待办', '2', 'com.ruoyi.usertodolist.controller.UserTodolistController.editSave()', 'POST', '1', 'admin', null, '/usertodolist/todolist/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"content\":[\"看电影\"],\"ddlTime\":[\"2022-12-23\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 19:53:28');
INSERT INTO `sys_oper_log` VALUES ('221', '我的待办', '3', 'com.ruoyi.usertodolist.controller.UserTodolistController.remove()', 'POST', '1', 'admin', null, '/usertodolist/todolist/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 19:54:20');
INSERT INTO `sys_oper_log` VALUES ('222', '我的待办', '3', 'com.ruoyi.usertodolist.controller.UserTodolistController.remove()', 'POST', '1', 'admin', null, '/usertodolist/todolist/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5,7,8,9,10,11,12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 19:54:43');
INSERT INTO `sys_oper_log` VALUES ('223', '我的待办', '3', 'com.ruoyi.usertodolist.controller.UserTodolistController.remove()', 'POST', '1', 'admin', null, '/usertodolist/todolist/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13,14,15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 19:54:56');
INSERT INTO `sys_oper_log` VALUES ('224', '我的待办', '1', 'com.ruoyi.usertodolist.controller.UserTodolistController.addSave()', 'POST', '1', 'admin', null, '/usertodolist/todolist/add', '127.0.0.1', '内网IP', '{\"userNumber\":[\"admin\"],\"content\":[\"做核酸\"],\"ddlTime\":[\"2022-11-14\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 19:55:52');
INSERT INTO `sys_oper_log` VALUES ('225', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"ddlTime\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', null, '1', '导出Excel失败，请联系网站管理员！', '2022-12-06 19:58:31');
INSERT INTO `sys_oper_log` VALUES ('226', '房子管理', '1', 'com.ruoyi.system.controller.HouseRoomController.addSave()', 'POST', '1', 'admin', null, '/system/room/add', '127.0.0.1', '内网IP', '{\"houseId\":[\"2\"],\"roomNumber\":[\"4\"],\"pricePerDay\":[\"777\"],\"standard\":[\"双人间1\"],\"isFree\":[\"1\"]}', null, '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'houseId != null and houseId in (select id from landlord_house where host_number=6)\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: houseId != null and houseId in (select id from landlord_house where host_number=6) [org.apache.ibatis.ognl.ParseException: Encountered \" <IDENT> \"id \"\" at line 1, column 40.\r\nWas expecting one of:\r\n    \",\" ...\r\n    \"=\" ...\r\n    \"?\" ...\r\n    \"||\" ...\r\n    \"or\" ...\r\n    \"&&\" ...\r\n    \"and\" ...\r\n    \"|\" ...\r\n    \"bor\" ...\r\n    \"^\" ...\r\n    \"xor\" ...\r\n    \"&\" ...\r\n    \"band\" ...\r\n    \"==\" ...\r\n    \"eq\" ...\r\n    \"!=\" ...\r\n    \"neq\" ...\r\n    \"<\" ...\r\n    \"lt\" ...\r\n    \">\" ...\r\n    \"gt\" ...\r\n    \"<=\" ...\r\n    \"lte\" ...\r\n    \">=\" ...\r\n    \"gte\" ...\r\n    \"in\" ...\r\n    \"not\" ...\r\n    \"<<\" ...\r\n    \"shl\" ...\r\n    \">>\" ...\r\n    \"shr\" ...\r\n    \">>>\" ...\r\n    \"ushr\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"*\" ...\r\n    \"/\" ...\r\n    \"%\" ...\r\n    \"instanceof\" ...\r\n    \".\" ...\r\n    \"(\" ...\r\n    \")\" ...\r\n    \"[\" ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    \"(\" ...\r\n    ]', '2022-12-06 20:03:00');
INSERT INTO `sys_oper_log` VALUES ('227', '房子管理', '1', 'com.ruoyi.system.controller.HouseRoomController.addSave()', 'POST', '1', 'admin', null, '/system/room/add', '127.0.0.1', '内网IP', '{\"houseId\":[\"3\"],\"roomNumber\":[\"4\"],\"pricePerDay\":[\"777\"],\"standard\":[\"双人间1\"],\"isFree\":[\"1\"]}', null, '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'houseId != null and houseId in (select id from landlord_house where host_number=6)\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: houseId != null and houseId in (select id from landlord_house where host_number=6) [org.apache.ibatis.ognl.ParseException: Encountered \" <IDENT> \"id \"\" at line 1, column 40.\r\nWas expecting one of:\r\n    \",\" ...\r\n    \"=\" ...\r\n    \"?\" ...\r\n    \"||\" ...\r\n    \"or\" ...\r\n    \"&&\" ...\r\n    \"and\" ...\r\n    \"|\" ...\r\n    \"bor\" ...\r\n    \"^\" ...\r\n    \"xor\" ...\r\n    \"&\" ...\r\n    \"band\" ...\r\n    \"==\" ...\r\n    \"eq\" ...\r\n    \"!=\" ...\r\n    \"neq\" ...\r\n    \"<\" ...\r\n    \"lt\" ...\r\n    \">\" ...\r\n    \"gt\" ...\r\n    \"<=\" ...\r\n    \"lte\" ...\r\n    \">=\" ...\r\n    \"gte\" ...\r\n    \"in\" ...\r\n    \"not\" ...\r\n    \"<<\" ...\r\n    \"shl\" ...\r\n    \">>\" ...\r\n    \"shr\" ...\r\n    \">>>\" ...\r\n    \"ushr\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"*\" ...\r\n    \"/\" ...\r\n    \"%\" ...\r\n    \"instanceof\" ...\r\n    \".\" ...\r\n    \"(\" ...\r\n    \")\" ...\r\n    \"[\" ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    \"(\" ...\r\n    ]', '2022-12-06 20:03:25');
INSERT INTO `sys_oper_log` VALUES ('228', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', null, '1', 'Index 0 out of bounds for length 0', '2022-12-06 20:04:37');
INSERT INTO `sys_oper_log` VALUES ('229', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,0,0]', '0', null, '2022-12-06 20:06:28');
INSERT INTO `sys_oper_log` VALUES ('230', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1150', '127.0.0.1', '内网IP', '1150', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:06:51');
INSERT INTO `sys_oper_log` VALUES ('231', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1154', '127.0.0.1', '内网IP', '1154', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:07:00');
INSERT INTO `sys_oper_log` VALUES ('232', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1153', '127.0.0.1', '内网IP', '1153', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:07:09');
INSERT INTO `sys_oper_log` VALUES ('233', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1152', '127.0.0.1', '内网IP', '1152', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:07:17');
INSERT INTO `sys_oper_log` VALUES ('234', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1151', '127.0.0.1', '内网IP', '1151', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:07:25');
INSERT INTO `sys_oper_log` VALUES ('235', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,15,1,0]', '0', null, '2022-12-06 20:09:29');
INSERT INTO `sys_oper_log` VALUES ('236', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,15,1,0]', '0', null, '2022-12-06 20:12:01');
INSERT INTO `sys_oper_log` VALUES ('237', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,1]', '0', null, '2022-12-06 20:16:54');
INSERT INTO `sys_oper_log` VALUES ('238', '房子管理', '1', 'com.ruoyi.system.controller.HouseRoomController.addSave()', 'POST', '1', 'admin', null, '/system/room/add', '127.0.0.1', '内网IP', '{\"houseId\":[\"2\"],\"roomNumber\":[\"2\"],\"pricePerDay\":[\"3\"],\"standard\":[\"单人间\"],\"isFree\":[\"0\"]}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException: Column \'house_id\' cannot be null\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\system\\HouseRoomMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.HouseRoomMapper.insertHouseRoom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into house_room          ( house_id,             room_number,             price_per_day,             standard,             is_free )           values ( IF(? IN (select id from landlord_house where host_number=6),?,null),             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException: Column \'house_id\' cannot be null\n; Column \'house_id\' cannot be null; nested exception is com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException: Column \'house_id\' cannot be null', '2022-12-06 20:25:42');
INSERT INTO `sys_oper_log` VALUES ('239', '房子管理', '1', 'com.ruoyi.system.controller.HouseRoomController.addSave()', 'POST', '1', 'admin', null, '/system/room/add', '127.0.0.1', '内网IP', '{\"houseId\":[\"3\"],\"roomNumber\":[\"2\"],\"pricePerDay\":[\"3\"],\"standard\":[\"单人间\"],\"isFree\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:25:57');
INSERT INTO `sys_oper_log` VALUES ('240', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,1]', '0', null, '2022-12-06 20:28:12');
INSERT INTO `sys_oper_log` VALUES ('241', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1149', '127.0.0.1', '内网IP', '1149', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:29:45');
INSERT INTO `sys_oper_log` VALUES ('242', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,1]', '0', null, '2022-12-06 20:30:39');
INSERT INTO `sys_oper_log` VALUES ('243', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:34:07');
INSERT INTO `sys_oper_log` VALUES ('244', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"client_room_record\"],\"tableComment\":[\"民宿房间订单\"],\"className\":[\"ClientRoomRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"7\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"8\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客账号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"9\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"房间ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"roomId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"10\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"预计入住时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"checkInDate\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"11\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"预计退房时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"checkOutDate\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"12\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"实际入住时间\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 20:34:32');
INSERT INTO `sys_oper_log` VALUES ('245', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_room_record', '127.0.0.1', '内网IP', '\"client_room_record\"', null, '0', null, '2022-12-06 20:34:40');
INSERT INTO `sys_oper_log` VALUES ('246', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', null, '1', '', '2022-12-06 20:47:20');
INSERT INTO `sys_oper_log` VALUES ('247', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', '1', 'admin', null, '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', null, '1', '导出Excel失败，请联系网站管理员！', '2022-12-06 20:47:28');
INSERT INTO `sys_oper_log` VALUES ('248', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,1]', '0', null, '2022-12-06 20:49:21');
INSERT INTO `sys_oper_log` VALUES ('249', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', null, '1', '', '2022-12-06 20:51:13');
INSERT INTO `sys_oper_log` VALUES ('250', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', null, '1', '', '2022-12-06 20:53:44');
INSERT INTO `sys_oper_log` VALUES ('251', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:00:23');
INSERT INTO `sys_oper_log` VALUES ('252', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"ddlTime\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"9f7e3547-b423-48b3-aca9-30af8046b98f_我的待办数据.xlsx\",\"code\":0}', '0', null, '2022-12-06 21:11:02');
INSERT INTO `sys_oper_log` VALUES ('253', '民宿订单', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.addSave()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/add', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"1\"],\"roomId\":[\"1\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"110\"],\"isPaid\":[\"0\"],\"isDone\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:23:37');
INSERT INTO `sys_oper_log` VALUES ('254', '民宿订单', '3', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.remove()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:23:48');
INSERT INTO `sys_oper_log` VALUES ('255', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,1]', '0', null, '2022-12-06 21:27:23');
INSERT INTO `sys_oper_log` VALUES ('256', '民宿订单', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.addSave()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/add', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"1\"],\"roomId\":[\"1\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"1\"],\"isPaid\":[\"0\"],\"isDone\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:28:07');
INSERT INTO `sys_oper_log` VALUES ('257', '民宿订单', '3', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.remove()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:28:20');
INSERT INTO `sys_oper_log` VALUES ('258', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:33:54');
INSERT INTO `sys_oper_log` VALUES ('259', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:35:54');
INSERT INTO `sys_oper_log` VALUES ('260', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:36:04');
INSERT INTO `sys_oper_log` VALUES ('261', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:36:12');
INSERT INTO `sys_oper_log` VALUES ('262', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"2\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:36:26');
INSERT INTO `sys_oper_log` VALUES ('263', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"1\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:36:52');
INSERT INTO `sys_oper_log` VALUES ('264', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668267\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:40:08');
INSERT INTO `sys_oper_log` VALUES ('265', '重置密码', '2', 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', '1', 'admin', null, '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:40:26');
INSERT INTO `sys_oper_log` VALUES ('266', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"Song\"],\"province\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"admin_song\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:40:30');
INSERT INTO `sys_oper_log` VALUES ('267', '重置密码', '2', 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', '1', 'admin', null, '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:40:37');
INSERT INTO `sys_oper_log` VALUES ('268', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"money\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:41:09');
INSERT INTO `sys_oper_log` VALUES ('269', '民宿订单', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.addSave()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/add', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"1\"],\"roomId\":[\"1\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"1\"],\"isPaid\":[\"0\"],\"isDone\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:54:53');
INSERT INTO `sys_oper_log` VALUES ('270', '民宿订单', '3', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.remove()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"14\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-06 21:55:08');
INSERT INTO `sys_oper_log` VALUES ('271', '用户管理', '1', 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"新增顾客\"],\"province\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"clientadd\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:00:00');
INSERT INTO `sys_oper_log` VALUES ('272', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', null, '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"24\"],\"deptId\":[\"\"],\"userName\":[\"新增房东\"],\"province\":[\"\"],\"phonenumber\":[\"18012345677\"],\"email\":[\"11@qq.com\"],\"loginName\":[\"clientadd\"],\"role\":[\"2\"],\"sex\":[\"0\"],\"money\":[\"20\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:01:44');
INSERT INTO `sys_oper_log` VALUES ('273', '重置密码', '2', 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', '1', 'admin', null, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"24\"],\"loginName\":[\"clientadd\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:02:19');
INSERT INTO `sys_oper_log` VALUES ('274', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1162\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"/clienthomeorder/homeorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clienthomeorder:homeorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"修改菜单\'民宿订单\'失败，菜单名称已存在\",\"code\":500}', '0', null, '2022-12-08 10:42:18');
INSERT INTO `sys_oper_log` VALUES ('275', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1162\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"订单\"],\"url\":[\"/clienthomeorder/homeorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clienthomeorder:homeorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:43:17');
INSERT INTO `sys_oper_log` VALUES ('276', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1162\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"订单\"],\"url\":[\"/clienthomeorder/homeorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clienthomeorder:homeorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:44:12');
INSERT INTO `sys_oper_log` VALUES ('277', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1077', '127.0.0.1', '内网IP', '1077', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:44:19');
INSERT INTO `sys_oper_log` VALUES ('278', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1162\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"/clienthomeorder/homeorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clienthomeorder:homeorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:44:30');
INSERT INTO `sys_oper_log` VALUES ('279', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1131\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"房东管理\"],\"url\":[\"/landlordhomemanagement/homemanagement\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordhomemanagement:homemanagement:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:45:58');
INSERT INTO `sys_oper_log` VALUES ('280', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1131\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"房东管理\"],\"url\":[\"/landlordhomemanagement/homemanagement\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordhomemanagement:homemanagement:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:46:14');
INSERT INTO `sys_oper_log` VALUES ('281', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1080', '127.0.0.1', '内网IP', '1080', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:46:22');
INSERT INTO `sys_oper_log` VALUES ('282', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1131\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"/landlordhomemanagement/homemanagement\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordhomemanagement:homemanagement:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:46:32');
INSERT INTO `sys_oper_log` VALUES ('283', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1131\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"/landlordhomeorder/landlordorder\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordhomemanagement:homemanagement:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:51:17');
INSERT INTO `sys_oper_log` VALUES ('284', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1131\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"民宿订单\"],\"url\":[\"/landlordhomeorder/landlordorder\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordhomeorder:landlordorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 10:51:47');
INSERT INTO `sys_oper_log` VALUES ('285', '房子管理', '5', 'com.ruoyi.system.controller.HouseRoomController.export()', 'POST', '1', 'admin', null, '/system/room/export', '127.0.0.1', '内网IP', '{\"houseId\":[\"\"],\"roomNumber\":[\"\"],\"pricePerDay\":[\"\"],\"standard\":[\"\"],\"isFree\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', null, '1', '导出Excel失败，请联系网站管理员！', '2022-12-08 11:37:21');
INSERT INTO `sys_oper_log` VALUES ('286', '房子管理', '5', 'com.ruoyi.system.controller.HouseRoomController.export()', 'POST', '1', 'admin', null, '/system/room/export', '127.0.0.1', '内网IP', '{\"houseId\":[\"\"],\"roomNumber\":[\"\"],\"pricePerDay\":[\"\"],\"standard\":[\"\"],\"isFree\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"31f70019-6e58-47d8-bfff-db8d78d55d98_房子管理数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 11:39:19');
INSERT INTO `sys_oper_log` VALUES ('287', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 11:53:36');
INSERT INTO `sys_oper_log` VALUES ('288', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 14:43:59');
INSERT INTO `sys_oper_log` VALUES ('289', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', '1', 'admin', null, '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"loginName\":[\"admin\"],\"userName\":[\"王管理员\"],\"phonenumber\":[\"13678668211\"],\"email\":[\"3112123481@163.com\"],\"sex\":[\"0\"],\"province\":[\"海南省\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 15:54:14');
INSERT INTO `sys_oper_log` VALUES ('290', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"待完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"default\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:03:51');
INSERT INTO `sys_oper_log` VALUES ('291', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"35\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"default\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:04:06');
INSERT INTO `sys_oper_log` VALUES ('292', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"35\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"default\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:06:45');
INSERT INTO `sys_oper_log` VALUES ('293', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"待完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"yellow\"],\"dictSort\":[\"0\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:15:31');
INSERT INTO `sys_oper_log` VALUES ('294', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"35\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:17:24');
INSERT INTO `sys_oper_log` VALUES ('295', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"35\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:17:38');
INSERT INTO `sys_oper_log` VALUES ('296', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"待完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"yellow\"],\"dictSort\":[\"0\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:18:10');
INSERT INTO `sys_oper_log` VALUES ('297', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"待完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:18:23');
INSERT INTO `sys_oper_log` VALUES ('298', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"35\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:18:38');
INSERT INTO `sys_oper_log` VALUES ('299', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"user_todolist\"],\"tableComment\":[\"待办事项\"],\"className\":[\"UserTodolist\"],\"functionAuthor\":[\"yyt\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"账号\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"内容\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"content\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"20\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"ddlTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"BETWEEN\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"21\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"待办事项状态\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"status\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"todolist_status\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.usertodolist\"],\"moduleName\":[\"usertodolist\"],\"businessName\":[\"todolist\"],\"functionName\":[\"我的待办\"],\"params[parentMenuId]\":[\"1068\"],\"pa', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 16:20:01');
INSERT INTO `sys_oper_log` VALUES ('300', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/user_todolist', '127.0.0.1', '内网IP', '\"user_todolist\"', null, '0', null, '2022-12-08 16:20:07');
INSERT INTO `sys_oper_log` VALUES ('301', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 17:23:23');
INSERT INTO `sys_oper_log` VALUES ('302', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"content\":[\"\"],\"params[beginDdlTime]\":[\"\"],\"params[endDdlTime]\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"9d2838a7-f8be-4530-9674-69d20fee187a_我的待办数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 17:36:43');
INSERT INTO `sys_oper_log` VALUES ('303', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"待完成\"],\"dictValue\":[\"0\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"0\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"待完成\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 17:46:33');
INSERT INTO `sys_oper_log` VALUES ('304', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"35\"],\"dictLabel\":[\"已完成\"],\"dictValue\":[\"1\"],\"dictType\":[\"todolist_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"success\"],\"isDefault\":[\"N\"],\"status\":[\"0\"],\"remark\":[\"已完成\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 17:47:03');
INSERT INTO `sys_oper_log` VALUES ('305', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"content\":[\"\"],\"params[beginDdlTime]\":[\"\"],\"params[endDdlTime]\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"2d4c38ed-1461-40a9-bd2a-e0c067e225d3_我的待办数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 17:47:39');
INSERT INTO `sys_oper_log` VALUES ('306', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"content\":[\"\"],\"params[beginDdlTime]\":[\"\"],\"params[endDdlTime]\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"7a633492-55ef-4657-b96f-d4258a388dfb_我的待办数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 18:01:09');
INSERT INTO `sys_oper_log` VALUES ('307', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"content\":[\"\"],\"params[beginDdlTime]\":[\"\"],\"params[endDdlTime]\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"a74c4ec7-6caf-4649-87df-09c98467c412_我的待办数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 18:12:00');
INSERT INTO `sys_oper_log` VALUES ('308', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 18:33:14');
INSERT INTO `sys_oper_log` VALUES ('309', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 18:34:10');
INSERT INTO `sys_oper_log` VALUES ('310', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 18:56:01');
INSERT INTO `sys_oper_log` VALUES ('311', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 19:34:01');
INSERT INTO `sys_oper_log` VALUES ('312', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 19:48:14');
INSERT INTO `sys_oper_log` VALUES ('313', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 20:12:10');
INSERT INTO `sys_oper_log` VALUES ('314', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 20:30:53');
INSERT INTO `sys_oper_log` VALUES ('315', '历史订单统计', '1', 'com.ruoyi.landlordhomeorder.controller.LandlordRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordhomeorder/landlordorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 20:31:01');
INSERT INTO `sys_oper_log` VALUES ('316', '历史订单统计', '1', 'com.ruoyi.landlordhomeorder.controller.LandlordRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordhomeorder/landlordorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 20:31:12');
INSERT INTO `sys_oper_log` VALUES ('317', '房子管理', '5', 'com.ruoyi.web.system.controller.HouseRoomController.export()', 'POST', '1', 'admin', null, '/system/room/export', '127.0.0.1', '内网IP', '{\"houseId\":[\"\"],\"roomNumber\":[\"\"],\"pricePerDay\":[\"\"],\"standard\":[\"\"],\"isFree\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"9523663d-9464-431b-be8d-a9b0f40763c1_房子管理数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 20:40:50');
INSERT INTO `sys_oper_log` VALUES ('318', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 20:44:20');
INSERT INTO `sys_oper_log` VALUES ('319', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"client_specialty_record\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:46:09');
INSERT INTO `sys_oper_log` VALUES ('320', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', '1', 'admin', null, '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"特产收到状态\"],\"dictType\":[\"sys_user_is_received\"],\"status\":[\"0\"],\"remark\":[\"用户是否已经收到特产\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:48:18');
INSERT INTO `sys_oper_log` VALUES ('321', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"已收到\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_received\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户已经收到特产\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:49:18');
INSERT INTO `sys_oper_log` VALUES ('322', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', 'POST', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"36\"],\"dictLabel\":[\"已收到\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_user_is_received\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户已经收到特产\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:49:48');
INSERT INTO `sys_oper_log` VALUES ('323', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', '1', 'admin', null, '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"未收到\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_user_is_received\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"用户还没有收到特产\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:50:07');
INSERT INTO `sys_oper_log` VALUES ('324', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"民俗特产历史订单\"],\"className\":[\"ClientSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:52:56');
INSERT INTO `sys_oper_log` VALUES ('325', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 20:53:01');
INSERT INTO `sys_oper_log` VALUES ('326', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1078\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:54:12');
INSERT INTO `sys_oper_log` VALUES ('327', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1168\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"特产\"],\"url\":[\"/clientspecialtyorder/specialtyorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clientspecialtyorder:specialtyorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:54:22');
INSERT INTO `sys_oper_log` VALUES ('328', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 20:56:12');
INSERT INTO `sys_oper_log` VALUES ('329', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"民俗特产历史订单\"],\"className\":[\"ClientSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:57:02');
INSERT INTO `sys_oper_log` VALUES ('330', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 20:57:05');
INSERT INTO `sys_oper_log` VALUES ('331', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"民俗特产历史订单\"],\"className\":[\"ClientSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:58:43');
INSERT INTO `sys_oper_log` VALUES ('332', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 20:58:46');
INSERT INTO `sys_oper_log` VALUES ('333', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"民俗特产历史订单\"],\"className\":[\"ClientSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 20:59:33');
INSERT INTO `sys_oper_log` VALUES ('334', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 20:59:42');
INSERT INTO `sys_oper_log` VALUES ('335', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1078', '127.0.0.1', '内网IP', '1078', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:02:31');
INSERT INTO `sys_oper_log` VALUES ('336', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1168\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"/clientspecialtyorder/specialtyorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clientspecialtyorder:specialtyorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:02:44');
INSERT INTO `sys_oper_log` VALUES ('337', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"特产订单管理\"],\"className\":[\"LandlordSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:10:11');
INSERT INTO `sys_oper_log` VALUES ('338', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 21:10:20');
INSERT INTO `sys_oper_log` VALUES ('339', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"特产订单管理\"],\"className\":[\"LandlordSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:12:13');
INSERT INTO `sys_oper_log` VALUES ('340', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1175', '127.0.0.1', '内网IP', '1175', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:12:27');
INSERT INTO `sys_oper_log` VALUES ('341', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1176', '127.0.0.1', '内网IP', '1176', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:12:34');
INSERT INTO `sys_oper_log` VALUES ('342', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1177', '127.0.0.1', '内网IP', '1177', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:12:42');
INSERT INTO `sys_oper_log` VALUES ('343', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1178', '127.0.0.1', '内网IP', '1178', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:12:50');
INSERT INTO `sys_oper_log` VALUES ('344', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1179', '127.0.0.1', '内网IP', '1179', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:12:57');
INSERT INTO `sys_oper_log` VALUES ('345', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1174', '127.0.0.1', '内网IP', '1174', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:13:05');
INSERT INTO `sys_oper_log` VALUES ('346', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"特产订单管理\"],\"className\":[\"LandlordSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:13:25');
INSERT INTO `sys_oper_log` VALUES ('347', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 21:13:28');
INSERT INTO `sys_oper_log` VALUES ('348', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1081\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:16:25');
INSERT INTO `sys_oper_log` VALUES ('349', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1180\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"订单\"],\"url\":[\"/landlordspecialtyorder/specialtyorder\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordspecialtyorder:specialtyorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:16:35');
INSERT INTO `sys_oper_log` VALUES ('350', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/1081', '127.0.0.1', '内网IP', '1081', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:16:41');
INSERT INTO `sys_oper_log` VALUES ('351', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1180\"],\"parentId\":[\"1079\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"/landlordspecialtyorder/specialtyorder\"],\"target\":[\"menuItem\"],\"perms\":[\"landlordspecialtyorder:specialtyorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:16:50');
INSERT INTO `sys_oper_log` VALUES ('352', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:20:58');
INSERT INTO `sys_oper_log` VALUES ('353', '民宿订单', '5', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.export()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/export', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"\"],\"roomId\":[\"\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"\"],\"isPaid\":[\"\"],\"isDone\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"e164193a-e2c7-43be-9af6-e1691c564cd2_民宿订单数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 21:31:31');
INSERT INTO `sys_oper_log` VALUES ('354', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:31:49');
INSERT INTO `sys_oper_log` VALUES ('355', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 21:33:29');
INSERT INTO `sys_oper_log` VALUES ('356', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:34:13');
INSERT INTO `sys_oper_log` VALUES ('357', '我的待办', '5', 'com.ruoyi.usertodolist.controller.UserTodolistController.export()', 'POST', '1', 'admin', null, '/usertodolist/todolist/export', '127.0.0.1', '内网IP', '{\"content\":[\"\"],\"params[beginDdlTime]\":[\"\"],\"params[endDdlTime]\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"3efd9f00-c098-48cf-977d-3f78ec7b0396_我的待办数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 21:34:47');
INSERT INTO `sys_oper_log` VALUES ('358', '特产', '5', 'com.ruoyi.clientspecialtyorder.controller.ClientSpecialtyRecordController.export()', 'POST', '1', 'admin', null, '/clientspecialtyorder/specialtyorder/export', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"\"],\"specialtyId\":[\"\"],\"quantity\":[\"\"],\"price\":[\"\"],\"orderTime\":[\"\"],\"finishTime\":[\"\"],\"isReceived\":[\"\"],\"isPaid\":[\"\"],\"isDone\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"f88ec4fb-300c-432f-b646-0b4df51eb5da_特产数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 21:36:52');
INSERT INTO `sys_oper_log` VALUES ('359', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:39:40');
INSERT INTO `sys_oper_log` VALUES ('360', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:40:54');
INSERT INTO `sys_oper_log` VALUES ('361', '民宿订单', '5', 'com.ruoyi.landlordhomeorder.controller.LandlordRoomRecordController.export()', 'POST', '1', 'admin', null, '/landlordhomeorder/landlordorder/export', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"\"],\"roomId\":[\"\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"\"],\"isPaid\":[\"\"],\"isDone\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"3ed2e1a1-d98e-44b3-9cab-847c33c0c6be_民宿订单数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 21:41:03');
INSERT INTO `sys_oper_log` VALUES ('362', '历史订单统计', '1', 'com.ruoyi.landlordhomeorder.controller.LandlordRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordhomeorder/landlordorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 21:42:30');
INSERT INTO `sys_oper_log` VALUES ('363', '订单', '5', 'com.ruoyi.landlordspecialtyorder.controller.LandlordSpecialtyRecordController.export()', 'POST', '1', 'admin', null, '/landlordspecialtyorder/specialtyorder/export', '127.0.0.1', '内网IP', '{\"clientNumber\":[\"\"],\"specialtyId\":[\"\"],\"quantity\":[\"\"],\"price\":[\"\"],\"orderTime\":[\"\"],\"finishTime\":[\"\"],\"isReceived\":[\"\"],\"isPaid\":[\"\"],\"isDone\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"da2c0875-a32e-4ca5-b6a7-d66193c87770_订单数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 21:46:23');
INSERT INTO `sys_oper_log` VALUES ('364', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"特产订单管理\"],\"className\":[\"LandlordSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:48:45');
INSERT INTO `sys_oper_log` VALUES ('365', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"特产订单管理\"],\"className\":[\"LandlordSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 21:49:00');
INSERT INTO `sys_oper_log` VALUES ('366', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 21:50:12');
INSERT INTO `sys_oper_log` VALUES ('367', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:56:37');
INSERT INTO `sys_oper_log` VALUES ('368', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 21:58:45');
INSERT INTO `sys_oper_log` VALUES ('369', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 22:00:39');
INSERT INTO `sys_oper_log` VALUES ('370', '房子管理', '5', 'com.ruoyi.web.system.controller.HouseRoomController.export()', 'POST', '1', 'admin', null, '/system/room/export', '127.0.0.1', '内网IP', '{\"houseId\":[\"\"],\"roomNumber\":[\"\"],\"pricePerDay\":[\"\"],\"standard\":[\"\"],\"isFree\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"f4afc480-d3f6-494b-bef6-535bdce244a1_房子管理数据.xlsx\",\"code\":0}', '0', null, '2022-12-08 22:11:14');
INSERT INTO `sys_oper_log` VALUES ('371', '历史订单统计', '1', 'com.ruoyi.landlordhomeorder.controller.LandlordRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordhomeorder/landlordorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 23:07:36');
INSERT INTO `sys_oper_log` VALUES ('372', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 23:07:43');
INSERT INTO `sys_oper_log` VALUES ('373', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:13:26');
INSERT INTO `sys_oper_log` VALUES ('374', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 23:13:56');
INSERT INTO `sys_oper_log` VALUES ('375', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 23:14:28');
INSERT INTO `sys_oper_log` VALUES ('376', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 23:14:59');
INSERT INTO `sys_oper_log` VALUES ('377', '用户统计', '1', 'com.ruoyi.web.controller.system.SysUserController.statisticsData()', 'POST', '1', 'admin', null, '/system/user/statistics', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,15,3]', '0', null, '2022-12-08 23:15:14');
INSERT INTO `sys_oper_log` VALUES ('378', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:15:29');
INSERT INTO `sys_oper_log` VALUES ('379', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:17:52');
INSERT INTO `sys_oper_log` VALUES ('380', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:19:01');
INSERT INTO `sys_oper_log` VALUES ('381', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:20:02');
INSERT INTO `sys_oper_log` VALUES ('382', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:20:35');
INSERT INTO `sys_oper_log` VALUES ('383', '特产订单统计', '1', 'com.ruoyi.landlordspecialtyorder.controller.LandlordSpecialtyRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordspecialtyorder/specialtyorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,1,2]', '0', null, '2022-12-08 23:22:48');
INSERT INTO `sys_oper_log` VALUES ('384', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:23:20');
INSERT INTO `sys_oper_log` VALUES ('385', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"client_specialty_record\"],\"tableComment\":[\"特产订单管理\"],\"className\":[\"ClientSpecialtyRecord\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"22\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"订单ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"23\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"顾客ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"clientNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"24\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"特产ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"specialtyId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"25\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"订货量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"quantity\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"26\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"订单价格\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"price\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"27\"],\"columns[5]', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 23:23:57');
INSERT INTO `sys_oper_log` VALUES ('386', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/client_specialty_record', '127.0.0.1', '内网IP', '\"client_specialty_record\"', null, '0', null, '2022-12-08 23:24:02');
INSERT INTO `sys_oper_log` VALUES ('387', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0;\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:24:31');
INSERT INTO `sys_oper_log` VALUES ('388', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1168\"],\"parentId\":[\"1076\"],\"menuType\":[\"C\"],\"menuName\":[\"特产订单\"],\"url\":[\"/clientspecialtyorder/clientorder\"],\"target\":[\"menuItem\"],\"perms\":[\"clientspecialtyorder:clientorder:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-tag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-08 23:28:12');
INSERT INTO `sys_oper_log` VALUES ('389', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\r\n### The error may exist in file [C:\\Users\\28920\\Documents\\GitHub\\XM-05-MSLY\\ruoyi-admin\\target\\classes\\mapper\\yk\\HouseRoomMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count (*) from house_room where house_id in (select id from landlord_house where host_number=6) and is_free=0\r\n### Cause: com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*) from house_room where house_id in (select id from landlord_house where host_n\' at line 1', '2022-12-08 23:29:41');
INSERT INTO `sys_oper_log` VALUES ('390', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', null, '1', 'class java.lang.Long cannot be cast to class java.lang.Integer (java.lang.Long and java.lang.Integer are in module java.base of loader \'bootstrap\')', '2022-12-08 23:35:01');
INSERT INTO `sys_oper_log` VALUES ('391', '房源统计', '1', 'com.ruoyi.web.system.controller.HouseRoomController.statisticsData()', 'POST', '1', 'admin', null, '/system/room/statistics', '127.0.0.1', '内网IP', '', '[2,6]', '0', null, '2022-12-08 23:36:29');
INSERT INTO `sys_oper_log` VALUES ('392', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 23:43:09');
INSERT INTO `sys_oper_log` VALUES ('393', '历史订单统计', '1', 'com.ruoyi.landlordhomeorder.controller.LandlordRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordhomeorder/landlordorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,27,4]', '0', null, '2022-12-08 23:43:38');
INSERT INTO `sys_oper_log` VALUES ('394', '特产订单统计', '1', 'com.ruoyi.landlordspecialtyorder.controller.LandlordSpecialtyRecordController.statisticsData()', 'POST', '1', 'admin', null, '/landlordspecialtyorder/specialtyorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,1,2]', '0', null, '2022-12-08 23:43:48');
INSERT INTO `sys_oper_log` VALUES ('395', '历史订单统计', '1', 'com.ruoyi.clientspecialtyorder.controller.ClientSpecialtyRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clientspecialtyorder/clientorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,1,2]', '0', null, '2022-12-08 23:44:58');
INSERT INTO `sys_oper_log` VALUES ('396', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,0,1]', '0', null, '2022-12-09 10:22:13');
INSERT INTO `sys_oper_log` VALUES ('397', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-09 10:25:16');
INSERT INTO `sys_oper_log` VALUES ('398', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,0,1]', '0', null, '2022-12-09 10:44:39');
INSERT INTO `sys_oper_log` VALUES ('399', '用户管理', '2', 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', '1', 'admin', null, '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"24\"],\"deptId\":[\"\"],\"userName\":[\"新增顾客\"],\"province\":[\"江苏\"],\"phonenumber\":[\"18012345677\"],\"email\":[\"11@qq.com\"],\"loginName\":[\"clientadd\"],\"role\":[\"3\"],\"sex\":[\"0\"],\"money\":[\"20\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-12-09 10:45:20');
INSERT INTO `sys_oper_log` VALUES ('400', '历史订单统计', '1', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.statisticsData()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/eCharts', '127.0.0.1', '内网IP', '', '[0,0,0,0,0,0,0,0,0,0,0,1]', '0', null, '2022-12-09 10:46:46');
INSERT INTO `sys_oper_log` VALUES ('401', '民宿订单', '5', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.export()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/export', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"roomId\":[\"\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"\"],\"isPaid\":[\"\"],\"isDone\":[\"1\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"4162cc81-f46c-4165-8dd7-4f8e378765b9_民宿订单数据.xlsx\",\"code\":0}', '0', null, '2022-12-09 10:46:56');
INSERT INTO `sys_oper_log` VALUES ('402', '民宿订单', '5', 'com.ruoyi.clienthomeorder.controller.ClientRoomRecordController.export()', 'POST', '1', 'admin', null, '/clienthomeorder/homeorder/export', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"roomId\":[\"\"],\"checkInDate\":[\"\"],\"checkOutDate\":[\"\"],\"reserveInDate\":[\"\"],\"reserveOutDate\":[\"\"],\"price\":[\"\"],\"isPaid\":[\"\"],\"isDone\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"bad76d1d-4b85-4669-b6cf-929692b12c2b_民宿订单数据.xlsx\",\"code\":0}', '0', null, '2022-12-09 10:55:59');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-11-30 19:00:25', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-11-30 19:00:25', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2022-11-30 19:00:25', '', null, '管理员');
INSERT INTO `sys_role` VALUES ('2', '房东', 'landlord', '2', '2', '0', '0', 'admin', '2022-11-30 19:00:25', '', null, '房东');
INSERT INTO `sys_role` VALUES ('3', '顾客', 'client', '3', '3', '0', '0', 'admin', '2022-12-01 12:40:11', '', null, '顾客');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `province` varchar(11) DEFAULT NULL COMMENT '省份',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, 'admin', '王管理员', '00', '3112123481@163.com', '13678668211', '0', '', 'ae40e4bd3ed19142f05df2489bdfac9a', 'd98774', '0', '0', '127.0.0.1', '2022-12-09 11:29:01', '2022-12-06 21:40:36', '', '2022-11-15 20:00:00', '', '2022-12-09 11:28:56', '管理员', '310', '海南省');
INSERT INTO `sys_user` VALUES ('3', null, 'client01', '闫顾客', '00', '8226371937@gmail.com', '18373628193', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '50', '四川省');
INSERT INTO `sys_user` VALUES ('4', null, 'client02', '张顾客', '00', '7329374628@126.com', '13846823846', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '300', '云南省');
INSERT INTO `sys_user` VALUES ('5', null, 'client03', '万顾客', '00', '8372617382@163.com', '18374628927', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '3000', '重庆市');
INSERT INTO `sys_user` VALUES ('6', null, 'client04', '罗顾客', '00', '7316827342@qq.com', '18373652437', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '0', '四川省');
INSERT INTO `sys_user` VALUES ('7', null, 'client05', '季顾客', '00', '8376153628@163.com', '', '1', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '20', '河北省');
INSERT INTO `sys_user` VALUES ('8', null, 'client06', '周顾客', '00', '', '', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '100', '湖北省');
INSERT INTO `sys_user` VALUES ('9', null, 'client07', '郑顾客', '00', '7391739748@126.com', '', '1', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', '2022-12-06 11:20:08', null, '888', '');
INSERT INTO `sys_user` VALUES ('10', null, 'client08', '陈顾客', '00', '7362937265@163.com', '13592876382', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '0', '');
INSERT INTO `sys_user` VALUES ('11', null, 'client09', '力顾客', '00', '', '13615271823', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '21', '山东省');
INSERT INTO `sys_user` VALUES ('12', null, 'client10', '孙顾客', '00', '', '', '1', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '0', '上海市');
INSERT INTO `sys_user` VALUES ('13', null, 'client11', '胡顾客', '00', '2339275638@qq.com', '17628939270', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '500', '北京市');
INSERT INTO `sys_user` VALUES ('14', null, 'landlord01', '李房东', '00', '7229382716@126.com', '12328768972', '1', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '1000', '');
INSERT INTO `sys_user` VALUES ('15', null, 'landlord02', '刘房东', '00', '8372615738@163.com', '13782893782', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '1200', '');
INSERT INTO `sys_user` VALUES ('16', null, 'landlord03', '熊房东', '00', '', '', '0', '', '', '', '0', '0', '', null, null, '', '2022-11-15 20:00:00', '', null, null, '0', '四川省');
INSERT INTO `sys_user` VALUES ('17', null, '12345', '测试用户', '00', 'sja@qq.com', '17212345678', '0', '', '0934ad322f38e41ead108c1a0b011cd4', 'cad1b5', '0', '2', '', null, null, 'admin', '2022-12-03 13:36:13', '', '2022-12-03 13:38:56', 'ab', null, null);
INSERT INTO `sys_user` VALUES ('18', null, '12345', '测试用', '00', '', '', '0', '', '280d9e8e2f37d247a80ea24068d8ec8c', 'd63128', '0', '2', '', null, null, 'admin', '2022-12-03 13:45:24', '', null, null, null, null);
INSERT INTO `sys_user` VALUES ('19', null, '12345', '测试用户', '00', '', '', '0', '', 'f67a09a82b9555dddbc7dc47d722ddaf', 'fc16f9', '0', '2', '', null, null, 'admin', '2022-12-03 13:47:08', '', null, null, null, null);
INSERT INTO `sys_user` VALUES ('20', null, 'admin01', '宋管理员', '00', 'debug@qq.com', '17212345678', '0', '', '06f3079eb09c22c7ff7f7806cdc5b9fc', '1d93ba', '0', '2', '127.0.0.1', '2022-12-06 15:15:43', null, 'admin', '2022-12-06 12:02:47', '', '2022-12-06 15:15:44', '管理员', null, '江苏');
INSERT INTO `sys_user` VALUES ('21', null, 'test_admin', '测试用户', '00', '', '', '0', '', 'f831b22353b89e6605776a80229c7834', 'c12eb7', '0', '2', '', null, null, 'admin', '2022-12-06 15:21:18', '', null, null, null, null);
INSERT INTO `sys_user` VALUES ('22', null, 'admin_new', '新增管理员', '00', '', '', '0', '', 'f1ecdfff4c8aeecd923c7cfd90ac7405', 'ba7aeb', '0', '0', '127.0.0.1', '2022-12-06 16:56:57', null, 'admin', '2022-12-06 15:38:42', '', '2022-12-06 16:56:58', null, null, null);
INSERT INTO `sys_user` VALUES ('23', null, 'admin_song', 'Song', '00', '', '', '0', '', '1ebf967c8f7ed2d3b7721f35889386e4', 'fbbd0d', '0', '0', '', null, null, 'admin', '2022-12-06 21:40:29', '', null, null, '0', null);
INSERT INTO `sys_user` VALUES ('24', null, 'clientadd', '新增顾客', '00', '11@qq.com', '18012345677', '0', '', '693bba69bc8bc48e0f47c0a4988d7499', '0f3303', '0', '0', '', null, null, 'admin', '2022-12-08 09:59:59', 'admin', '2022-12-09 10:45:20', '', '20', '江苏');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('1addde0e-c546-49dc-9d5d-7d5564a519fb', 'admin', null, '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', 'on_line', '2022-12-09 10:21:42', '2022-12-09 11:00:55', '1800000');
INSERT INTO `sys_user_online` VALUES ('95851f30-d5a8-4bee-8788-22097fa1cba8', 'admin', null, '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', 'on_line', '2022-12-09 11:01:32', '2022-12-09 11:29:01', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '2');
INSERT INTO `sys_user_role` VALUES ('5', '2');
INSERT INTO `sys_user_role` VALUES ('6', '2');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '2');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '2');
INSERT INTO `sys_user_role` VALUES ('12', '2');
INSERT INTO `sys_user_role` VALUES ('13', '2');
INSERT INTO `sys_user_role` VALUES ('14', '3');
INSERT INTO `sys_user_role` VALUES ('15', '3');
INSERT INTO `sys_user_role` VALUES ('16', '3');
INSERT INTO `sys_user_role` VALUES ('22', '1');
INSERT INTO `sys_user_role` VALUES ('23', '1');
INSERT INTO `sys_user_role` VALUES ('24', '3');

-- ----------------------------
-- Table structure for user_todolist
-- ----------------------------
DROP TABLE IF EXISTS `user_todolist`;
CREATE TABLE `user_todolist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_number` varchar(30) NOT NULL COMMENT '账号',
  `content` varchar(50) NOT NULL COMMENT '内容',
  `ddl_time` datetime DEFAULT NULL COMMENT '截止时间',
  `status` char(1) NOT NULL COMMENT '待办事项状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_todolist
-- ----------------------------
INSERT INTO `user_todolist` VALUES ('1', 'client01', '看电影吧', '2022-11-16 00:00:00', '1');
INSERT INTO `user_todolist` VALUES ('6', 'client06', '看电影', '2022-12-23 00:00:00', '1');
INSERT INTO `user_todolist` VALUES ('16', 'admin', '做核酸', '2022-11-14 00:00:00', '0');
