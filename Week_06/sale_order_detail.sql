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

 Date: 25/11/2020 23:38:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_detail`;
CREATE TABLE `sale_order_detail`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `main_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主标题（快照数据）',
  `sub_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品副标题（快照数据）',
  `ordered_price` decimal(10, 2) NOT NULL COMMENT '下单单价（快照数据）',
  `num` smallint(6) NOT NULL COMMENT '购买数量',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_oid`(`order_id`) USING BTREE COMMENT '普通索引(检索)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
