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

 Date: 25/11/2020 23:38:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `sale_product_attribute`;
CREATE TABLE `sale_product_attribute`  (
  `id` bigint(20) NOT NULL COMMENT '主键(属性id)',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `type_id` smallint(6) NOT NULL COMMENT '属性类型id',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性绑定图片url(如果有的话)',
  `has_image_or_not` tinyint(4) NOT NULL COMMENT '是否有图片(一个产品有且仅有一个属性类型有图片)',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`product_id`) USING BTREE COMMENT '普通检索索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
