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

 Date: 25/11/2020 23:38:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_address
-- ----------------------------
DROP TABLE IF EXISTS `sale_address`;
CREATE TABLE `sale_address`  (
  `id` bigint(20) NOT NULL COMMENT '主键id(收货地址id)',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `phone_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `home_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭电话',
  `region` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区',
  `detail` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区内详细地址',
  `is_default` tinyint(1) NOT NULL COMMENT '是否为默认地址',
  `mark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址标签',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`user_id`) USING BTREE COMMENT '普通查询索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
