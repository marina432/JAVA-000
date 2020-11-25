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

 Date: 25/11/2020 23:38:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_distribution_info
-- ----------------------------
DROP TABLE IF EXISTS `sale_distribution_info`;
CREATE TABLE `sale_distribution_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id(配送信息主键id)',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `type` tinyint(1) NOT NULL COMMENT '配送方式（1-快递；2-自提）',
  `begin_time` datetime(0) NOT NULL COMMENT '配送起始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '配送终止时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_oid`(`order_id`) USING BTREE COMMENT '唯一索引(排重与检索)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
