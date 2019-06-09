/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : finalproject

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 09/06/2019 21:23:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `UID` int(255) NOT NULL,
  `VideoID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `videoname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `UID`(`UID`) USING BTREE,
  INDEX `videoID`(`VideoID`) USING BTREE,
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`VideoID`) REFERENCES `video` (`videoid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UID` int(255) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Birth` timestamp(6) NOT NULL DEFAULT '1970-01-01 08:00:01.000000',
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RegDay` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `LastLogin` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Coin` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`UID`, `UserName`) USING BTREE,
  UNIQUE INDEX `Email`(`Email`) USING BTREE,
  INDEX `UID`(`UID`) USING BTREE,
  INDEX `UID_2`(`UID`) USING BTREE,
  INDEX `UID_3`(`UID`) USING BTREE,
  INDEX `UID_4`(`UID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `VideoID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VideoName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UID` int(255) NULL DEFAULT NULL,
  `Coin` int(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`VideoID`) USING BTREE,
  INDEX `VideoID`(`VideoID`) USING BTREE,
  INDEX `VideoID_2`(`VideoID`) USING BTREE,
  INDEX `UID`(`UID`) USING BTREE,
  CONSTRAINT `video_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for watchhistory
-- ----------------------------
DROP TABLE IF EXISTS `watchhistory`;
CREATE TABLE `watchhistory`  (
  `UID` int(255) NOT NULL,
  `VideoID` int(255) NULL DEFAULT NULL,
  `Date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  INDEX `UID`(`UID`) USING BTREE,
  CONSTRAINT `watchhistory_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
