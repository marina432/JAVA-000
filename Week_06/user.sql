/*
 Navicat Premium Data Transfer

 Source Server         : IC-Score_开发库
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 10.150.27.39:3307
 Source Schema         : mdsp_s3

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 25/11/2020 23:39:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL COMMENT '主键（用户id）',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `gender` tinyint(4) NOT NULL COMMENT '性别',
  `birthday` datetime(0) NOT NULL COMMENT '生日',
  `type` tinyint(4) NOT NULL COMMENT '用户类型(1-普通买家；2-商家)',
  `create_time` datetime(0) NOT NULL COMMENT '注册时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
