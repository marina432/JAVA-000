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

 Date: 25/11/2020 23:38:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `order_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `product_num` int(11) NOT NULL COMMENT '产品总数量',
  `total_weight` decimal(10, 2) NOT NULL COMMENT '商品总重(用于估算运费)',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '总金额',
  `freight` smallint(6) NOT NULL COMMENT '运费',
  `referential_amount` smallint(6) NOT NULL COMMENT '优惠金额(暂时将所有优惠都做到这一个字段，后期可拆)',
  `actual_pay` smallint(6) NOT NULL COMMENT '实付金额',
  `state` tinyint(4) NOT NULL COMMENT '订单状态(0-短暂无状态；1-未支付；2-已支付；3-取消订单(用户主动)；4-无效订单(系统取消);5-待收货；6-已完成)',
  `address_id` bigint(20) NOT NULL COMMENT '收件地址id',
  `distribution_info_id` bigint(20) NOT NULL COMMENT '配送信息id',
  `create_time` datetime(0) NOT NULL COMMENT '下单时间',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid_state`(`user_id`, `state`) USING BTREE COMMENT '普通联合索引(用于检索)',
  UNIQUE INDEX `uk_oid`(`order_id`) USING BTREE COMMENT '唯一索引(排重及检索)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
