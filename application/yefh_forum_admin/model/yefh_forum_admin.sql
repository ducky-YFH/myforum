/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : yefh_forum_admin

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 13/12/2019 17:16:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yefh_ad
-- ----------------------------
DROP TABLE IF EXISTS `yefh_ad`;
CREATE TABLE `yefh_ad`  (
  `aid` int(20) NOT NULL AUTO_INCREMENT,
  `atitle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `atime` int(30) NOT NULL,
  `aremark` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ahref` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acheck` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mid` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_ad
-- ----------------------------
INSERT INTO `yefh_ad` VALUES (14, '东风日冲腾飞', 1575806789, '东风日产腾飞一路先前奔腾', 'https://www.dongfeng-nissan.com.cn/', '审核通过', '20191208\\b6628d3c131a1c885c5b5a6d525b5419.jpg', 1);
INSERT INTO `yefh_ad` VALUES (21, 'LOL', 1575983022, 'fpx是冠军', 'https://lol.qq.com/main.shtml', '审核通过', '20191212\\d2e76029c9ae58f314f5015be63bf0ce.jpg', 0);

-- ----------------------------
-- Table structure for yefh_admin
-- ----------------------------
DROP TABLE IF EXISTS `yefh_admin`;
CREATE TABLE `yefh_admin`  (
  `user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_admin
-- ----------------------------
INSERT INTO `yefh_admin` VALUES ('admin', '202cb962ac59075b964b07152d234b70');

-- ----------------------------
-- Table structure for yefh_carousel
-- ----------------------------
DROP TABLE IF EXISTS `yefh_carousel`;
CREATE TABLE `yefh_carousel`  (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `ctitle` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctime` int(30) NOT NULL,
  `cremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mid` int(11) NOT NULL,
  `ccheck` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yefh_carousel
-- ----------------------------
INSERT INTO `yefh_carousel` VALUES (6, '钓竿', 1575947237, '有个老人在河边钓鱼，一个小孩走过去看他钓鱼。老人技巧纯熟，所以没多久就钓上了满篓的鱼，老人见小孩很可爱，要把整篓的鱼送给他，小孩摇摇头，老人惊异的问道：“你为何不要？”', 1, '审核通过', '20191210\\8ce0c8d1c3df055a97e05ac86e3c39dc.jpg');
INSERT INTO `yefh_carousel` VALUES (8, '调羹', 1575949811, '麦克走进餐馆，点了一份汤，服务员马上给他端了上来。\r\n服务员刚走开，麦克就嚷嚷起来：“对不起，这汤我没法喝。”', 3, '暂停使用', '20191210\\52d20f13517c93b2c31a84e66896afdb.jpg');
INSERT INTO `yefh_carousel` VALUES (10, '做梦的穷人', 1575952334, '每天上午11点，都会有一辆耀眼的汽车穿过纽约市的中心公园。车里除了司机，还有一位主人——无人不晓的百万富翁.....', 2, '审核通过', '20191210\\6d4ac9da4cd6f859e162f441d285d40b.jpg');
INSERT INTO `yefh_carousel` VALUES (11, '情况不同', 1575957770, '一只小猪、一只绵羊和一头乳牛，被关在同一个畜栏里', 3, '暂停使用', '20191210\\bc5716e129f535752567ee21863de820.jpg');

SET FOREIGN_KEY_CHECKS = 1;
