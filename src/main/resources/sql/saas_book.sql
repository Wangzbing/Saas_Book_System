/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : localhost:3306
 Source Schema         : saas_book

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 08/06/2020 17:29:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'book id',
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'book name',
  `book_category_id` bigint(20) NOT NULL COMMENT 'book category id',
  `book_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'book author',
  `book_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'publisher',
  `published_date` date NOT NULL COMMENT 'Published_date',
  `book_price` decimal(10, 2) NOT NULL COMMENT 'Price',
  `book_ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ISBN',
  `book_brief_introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'introduction',
  `book_store_number` int(20) NOT NULL DEFAULT 1 COMMENT 'store number',
  `status` int(12) NULL DEFAULT NULL COMMENT '6001 6002 ',
  `deleted` tinyint(1) NOT NULL,
  `create_time` datetime(0) NOT NULL COMMENT 'create time',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category_info
-- ----------------------------
DROP TABLE IF EXISTS `category_info`;
CREATE TABLE `category_info`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'category id',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'category name',
  `deleted` tinyint(1) NOT NULL COMMENT 'deleted',
  `category_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'icon name',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info`  (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'message id',
  `message_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'message content',
  `receiver_user_id` bigint(20) NOT NULL COMMENT 'Receiver',
  `send_user_id` bigint(20) NOT NULL COMMENT 'sender',
  `status` int(255) NOT NULL COMMENT '4001 4002 (waiting read or readed)',
  `deleted` tinyint(1) NOT NULL COMMENT 'deleted',
  `create_time` datetime(0) NOT NULL COMMENT 'create time',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rel_bill_book
-- ----------------------------
DROP TABLE IF EXISTS `rel_bill_book`;
CREATE TABLE `rel_bill_book`  (
  `bill_book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `bill_type` int(12) NOT NULL COMMENT '9001 9002 (rent or sell)',
  PRIMARY KEY (`bill_book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rent_info
-- ----------------------------
DROP TABLE IF EXISTS `rent_info`;
CREATE TABLE `rent_info`  (
  `rent_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'rent id',
  `rent_price` decimal(10, 2) NOT NULL COMMENT 'rent price',
  `rent_user_id` bigint(20) NOT NULL COMMENT 'rent user',
  `rent_status` int(12) NOT NULL COMMENT '7001 7002 (renting rented)',
  `deleted` tinyint(1) NOT NULL COMMENT 'deleted',
  `create_time` datetime(0) NOT NULL COMMENT 'create_time',
  PRIMARY KEY (`rent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sell_info
-- ----------------------------
DROP TABLE IF EXISTS `sell_info`;
CREATE TABLE `sell_info`  (
  `rent_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'rent id',
  `rent_price` decimal(10, 2) NOT NULL COMMENT 'rent price',
  `rent_user_id` bigint(20) NOT NULL COMMENT 'rent user',
  `rent_status` int(12) NOT NULL COMMENT '7001 7002 (renting rented)',
  `deleted` tinyint(1) NOT NULL COMMENT 'deleted',
  `create_time` datetime(0) NOT NULL COMMENT 'create_time',
  PRIMARY KEY (`rent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `user_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user name ',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'address',
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'email ',
  `user_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Signature',
  `user_head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'head img',
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'concact way',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'password',
  `user_sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'male or female',
  `user_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'country',
  `user_status` int(12) NOT NULL COMMENT 'active or inactive or pending 3001-3003',
  `user_join_date` datetime(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', 'ca', 'gutianbo@gmail.com', NULL, '01.jpg', '+62 5689678', '123456', 'male', 'USA', 3001, '2020-06-02 08:58:59', '2020-06-02 08:58:59', 0);
INSERT INTO `user_info` VALUES (2, 'user1', 'c1', 'admin@gmail.com', NULL, '02.jpg', '+65 1234567', '123456', 'female', 'Caneda', 3001, '2020-06-03 16:25:56', '2020-06-03 16:26:03', 0);
INSERT INTO `user_info` VALUES (3, 'zoe', NULL, 'zoe@gmail.com', 'be a dreamer', '26a04bd4eedc4b1fbd6707cef8f3f8ce.jpg', '+98 8970567', 'Amin6248', 'male', 'USA', 3001, '2020-06-05 10:58:23', '2020-06-05 10:58:23', 0);
INSERT INTO `user_info` VALUES (4, 'Fiona', NULL, 'fiona@gmail.com', NULL, '00.jpg', NULL, '123456', NULL, 'Africa', 3001, '2020-06-05 13:53:29', '2020-06-05 13:53:29', 0);
INSERT INTO `user_info` VALUES (5, 'Timo', NULL, 'timo@gmail.com', NULL, '00.jpg', NULL, '123456', NULL, 'India', 3003, '2020-06-05 18:46:05', '2020-06-05 18:46:05', 0);

SET FOREIGN_KEY_CHECKS = 1;
