/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : rscsystem

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2019-11-29 13:38:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `real_name` varchar(25) DEFAULT NULL COMMENT '收件人或寄件人名字',
  `tel` varchar(25) DEFAULT NULL COMMENT '收件人或寄件人电话',
  `town` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `res_address` varchar(50) DEFAULT NULL COMMENT '详细地址',
  `type` int(11) DEFAULT '0' COMMENT '地址类别0为寄件，1为收件',
  `create_time` timestamp NULL DEFAULT NULL,
  `finally_time` timestamp NULL DEFAULT NULL,
  `postman_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for logistics
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流订单id',
  `no` int(11) NOT NULL COMMENT '单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `saddress_id` int(11) DEFAULT NULL COMMENT '取件邮差id',
  `gaddress_id` int(11) DEFAULT NULL COMMENT '派件地址id',
  `temp` varchar(4) DEFAULT '0' COMMENT '订单状态:10,准备收件。11,收件完成。20，准备派件。19，收件失败。21，正在派件。22，派件成功。29，派件失败',
  `temp1` varchar(4) DEFAULT NULL COMMENT '物流类型:1,为收件。2,为派件',
  `temp2` varchar(100) DEFAULT NULL COMMENT '失败原因',
  `temp3` varchar(0) DEFAULT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for postman
-- ----------------------------
DROP TABLE IF EXISTS `postman`;
CREATE TABLE `postman` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邮差id',
  `ename` varchar(20) DEFAULT NULL COMMENT '邮差名',
  `epassword` varchar(50) DEFAULT NULL COMMENT '邮差密码',
  `etown` varchar(20) DEFAULT NULL COMMENT '邮差所在省份',
  `ecity` varchar(20) DEFAULT NULL COMMENT '邮差所在市',
  `earea` varchar(20) DEFAULT NULL COMMENT '邮差所在区',
  `res_address` varchar(50) DEFAULT NULL COMMENT '邮差所在详细地址',
  `etel` varchar(25) DEFAULT NULL COMMENT '邮差电话号码',
  `basesalary` double(10,2) DEFAULT NULL COMMENT '邮差基本工资',
  `state` int(4) DEFAULT '1' COMMENT '0为上班中，1为下班',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tally
-- ----------------------------
DROP TABLE IF EXISTS `tally`;
CREATE TABLE `tally` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '计件id',
  `postman_id` int(11) DEFAULT NULL COMMENT '邮差id',
  `basesalary` double(11,2) DEFAULT NULL COMMENT '基本工资',
  `receipt` int(11) DEFAULT NULL COMMENT '收件数量',
  `deliver` int(11) DEFAULT NULL COMMENT '派件数量',
  `total` double(11,2) DEFAULT NULL COMMENT '月总工资',
  `date` varchar(20) DEFAULT NULL COMMENT '工资年月',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(25) DEFAULT NULL COMMENT '用户名',
  `upassword` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `role` varchar(20) DEFAULT 'ROLE_USER' COMMENT '权限',
  `email` varchar(25) NOT NULL,
  `temp` varchar(11) DEFAULT NULL COMMENT '寄件地址id',
  `temp1` varchar(11) DEFAULT NULL COMMENT '收货地址id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work_condition
-- ----------------------------
DROP TABLE IF EXISTS `work_condition`;
CREATE TABLE `work_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤id',
  `postman_id` int(11) DEFAULT NULL COMMENT '邮差id',
  `workday` int(11) DEFAULT NULL COMMENT '在岗天数',
  `leaveday` int(11) DEFAULT NULL COMMENT '请假天数',
  `overtimeday` int(11) DEFAULT NULL COMMENT '加班天数',
  `receipt` int(4) DEFAULT NULL,
  `deliver` int(4) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL COMMENT '所属月份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
