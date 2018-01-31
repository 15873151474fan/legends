/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50619
Source Host           : 127.0.0.1:3306
Source Database       : web

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2014-09-12 20:24:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL COMMENT '帐号',
  `password` char(32) NOT NULL DEFAULT '0',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tgnum` int(10) NOT NULL,
  `last_login_ip` varchar(15) NOT NULL,
  `dj` varchar(255) NOT NULL DEFAULT '1',
  `sxjl` int(255) NOT NULL DEFAULT '0',
  `vip` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_name` (`name`,`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `baidan`
-- ----------------------------
DROP TABLE IF EXISTS `baidan`;
CREATE TABLE `baidan` (
  `name` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of baidan
-- ----------------------------

-- ----------------------------
-- Table structure for `blockade_ip`
-- ----------------------------
DROP TABLE IF EXISTS `blockade_ip`;
CREATE TABLE `blockade_ip` (
  `id` int(11) NOT NULL,
  `lock_ip` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blockade_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `ip`
-- ----------------------------
DROP TABLE IF EXISTS `ip`;
CREATE TABLE `ip` (
  `StartIP` varchar(20) DEFAULT '',
  `EndIP` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Local` varchar(50) DEFAULT NULL,
  KEY `IP` (`StartIP`,`EndIP`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ip
-- ----------------------------

-- ----------------------------
-- Table structure for `jzip`
-- ----------------------------
DROP TABLE IF EXISTS `jzip`;
CREATE TABLE `jzip` (
  `Country` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jzip
-- ----------------------------

-- ----------------------------
-- Table structure for `paylog`
-- ----------------------------
DROP TABLE IF EXISTS `paylog`;
CREATE TABLE `paylog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL,
  `account` char(255) NOT NULL COMMENT '帐号',
  `paytime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) NOT NULL,
  `yuanbao` varchar(255) NOT NULL DEFAULT '0',
  `order_id` varchar(255) DEFAULT NULL,
  `fl` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_name` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paylog
-- ----------------------------

-- ----------------------------
-- Table structure for `spread`
-- ----------------------------
DROP TABLE IF EXISTS `spread`;
CREATE TABLE `spread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(50) NOT NULL,
  `lid` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `islq` int(1) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spread
-- ----------------------------

-- ----------------------------
-- Table structure for `spread2`
-- ----------------------------
DROP TABLE IF EXISTS `spread2`;
CREATE TABLE `spread2` (
  `tid` varchar(50) NOT NULL,
  `lid` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `islq` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spread2
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_account` varchar(124) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `reg_ip` varchar(255) DEFAULT '' COMMENT '登陆IP',
  `tgnum` varchar(255) DEFAULT '0' COMMENT '推广数量',
  `dj` int(12) DEFAULT '0' COMMENT '充值元宝字段',
  `yuanbao` varchar(255) DEFAULT '99999',
  `xyuanbao` varchar(255) DEFAULT '0',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登陆IP',
  `reg_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `tid` varchar(50) NOT NULL,
  `sxjl` int(255) NOT NULL DEFAULT '0',
  `vip` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
