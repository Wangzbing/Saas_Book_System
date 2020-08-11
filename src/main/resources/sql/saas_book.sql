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

 Date: 11/08/2020 20:57:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `book_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'book image',
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'book id',
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'book name',
  `book_category_id` bigint(20) NOT NULL DEFAULT 1 COMMENT 'book category id',
  `book_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'book author',
  `book_publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'publisher',
  `published_date` datetime(0) NOT NULL COMMENT 'Published_date',
  `book_scope` int(11) NOT NULL COMMENT 'book scope',
  `book_price` decimal(10, 2) NOT NULL COMMENT 'Price',
  `book_ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISBN',
  `book_brief_introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'introduction',
  `book_store_number` int(20) NOT NULL DEFAULT 1 COMMENT 'store number',
  `status` int(12) NULL DEFAULT 8001 COMMENT '6001 6002 ',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL COMMENT 'create time',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES ('../static/images/user/0d226d114e814d0ebb48fb767481d7d7.jpg', 1, 'one', 1, 'joker', 'publicer', '2020-07-15 00:00:00', 1, 8.50, '0893333', 'this is a intro', 15, 8001, 0, '2020-07-15 16:15:39', NULL);
INSERT INTO `book_info` VALUES ('..\\static/images/cover\\0d75679596c14431bbeb6181bd50f009.jpg', 3, 'Where the Crawdads Sing', 1, 'Delia Owens', 'Amazon', '2018-08-14 00:00:00', 3, 18.00, '8899122', 'For years, rumors of the \"Marsh Girl\" have haunted Barkley Cove, a quiet town on the North Carolina coast. So in late 1969, when handsome Chase Andrews is found dead, the locals immediately suspect Kya Clark, the so-called Marsh Girl. But Kya is not what they say. Sensitive and intelligent, she has survived for years alone in the marsh that she calls home, finding friends in the gulls and lessons in the sand. Then the time comes when she yearns to be touched and loved. When two young men from town become intrigued by her wild beauty, Kya opens herself to a new life--until the unthinkable happens.\r\n\r\nWhere the Crawdads Sing is at once an exquisite ode to the natural world, a heartbreaking coming-of-age story, and a surprising tale of possible murder. Owens reminds us that we are forever shaped by the children we once were, and that we are all subject to the beautiful and violent secrets that nature keeps.', 15, 8001, 0, '2020-07-16 13:50:57', '1');
INSERT INTO `book_info` VALUES ('..\\static/images/cover\\cb8ca0ab52ff4b9c9281c6bea8ff043f.jpg', 4, 'What', 1, 'Sss', 'Amazon', '2020-01-01 00:00:00', 1, 8.50, '8899122', '\"White Rage is a riveting and disturbing history that begins with Reconstruction and\r\nlays bare the efforts of whites in the South and North alike to prevent emancipated black people from achieving economic independence,\r\ncivil and political rights, personal safety, and economic opportunity.\"', 15, 8001, 0, '2020-07-19 20:20:19', '1');
INSERT INTO `book_info` VALUES ('..\\static/images/cover\\85cec989f92d4b26a1866f00c0d3ee06.jpg', 5, 'Where the Crawdads Sing', 1, ' John M. Barry', 'Amazon', '2018-08-14 00:00:00', 2, 13.42, NULL, '\"White Rage is a riveting and disturbing history that begins with Reconstruction and\r\nlays bare the efforts of whites in the South and North alike to prevent emancipated black people from achieving economic independence,\r\ncivil and political rights, personal safety, and economic opportunity.\"\r\n                                             ', 14, 8001, 0, '2020-07-19 20:23:43', '1');
INSERT INTO `book_info` VALUES ('..\\static/images/cover\\3cdeaedf36d8405f8ed304d4798e6a3d.jpg', 6, 'Whats', 1, 'Delia Owens', 'Amazon', '2020-01-01 00:00:00', 2, 9.85, NULL, '\"White Rage is a riveting and disturbing history that begins with Reconstruction and\r\nlays bare the efforts of whites in the South and North alike to prevent emancipated black people from achieving economic independence,\r\ncivil and political rights, personal safety, and economic opportunity.\"\r\n                                             ', 15, 8001, 0, '2020-07-19 20:48:44', '1');
INSERT INTO `book_info` VALUES ('..\\static/images/cover\\e8cb7bdce7804fc7aefb365fe18d1b1c.jpg', 7, 'Demo', 1, 'demo', 'Amazon', '2020-09-10 00:00:00', 5, 87.00, '8899122', 'Demoqqqqq this is intro...', 14, 8001, 0, '2020-07-19 21:04:03', '1');

-- ----------------------------
-- Table structure for dic_info
-- ----------------------------
DROP TABLE IF EXISTS `dic_info`;
CREATE TABLE `dic_info`  (
  `dic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'dictionary id',
  `dic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dictionary name\r\n',
  `dic_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'dictionary code',
  PRIMARY KEY (`dic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dic_info
-- ----------------------------
INSERT INTO `dic_info` VALUES (1, 'Active', '3001');
INSERT INTO `dic_info` VALUES (2, 'Inactive', '3002');
INSERT INTO `dic_info` VALUES (3, 'Pending', '3003');
INSERT INTO `dic_info` VALUES (4, 'Bronze', '3008');
INSERT INTO `dic_info` VALUES (5, 'Silver', '3009');
INSERT INTO `dic_info` VALUES (6, 'Diamond', '3010');
INSERT INTO `dic_info` VALUES (7, 'Renting', '7001');
INSERT INTO `dic_info` VALUES (8, 'Rented', '7002');

-- ----------------------------
-- Table structure for rent_info
-- ----------------------------
DROP TABLE IF EXISTS `rent_info`;
CREATE TABLE `rent_info`  (
  `rent_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'rent id',
  `rent_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'rent price',
  `rent_user_id` bigint(20) NOT NULL COMMENT 'rent user',
  `rent_status` int(12) NOT NULL COMMENT '7001 7002 (renting rented)',
  `deleted` tinyint(1) NOT NULL COMMENT 'deleted',
  `create_time` datetime(0) NOT NULL COMMENT 'create_time',
  `end_time` datetime(0) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  `book_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rent_info
-- ----------------------------
INSERT INTO `rent_info` VALUES (1, 0.00, 1, 7001, 0, '2020-08-02 23:32:35', '2020-08-02 23:32:39', 1, 'book name');
INSERT INTO `rent_info` VALUES (2, NULL, 1, 7001, 0, '2020-08-03 00:56:27', '2020-08-08 00:56:27', 7, 'Demo');
INSERT INTO `rent_info` VALUES (3, NULL, 10, 7001, 0, '2020-08-03 01:01:11', '2020-08-08 01:01:11', 7, 'Demo');
INSERT INTO `rent_info` VALUES (4, NULL, 1, 7001, 0, '2020-08-03 01:28:38', '2020-08-08 01:28:38', 7, 'Demo');
INSERT INTO `rent_info` VALUES (5, NULL, 1, 7001, 0, '2020-08-03 01:29:07', '2020-08-08 01:29:07', 3, 'Where the Crawdads Sing');
INSERT INTO `rent_info` VALUES (6, NULL, 1, 7001, 0, '2020-08-11 20:52:48', '2020-08-16 20:52:48', 5, 'Where the Crawdads Sing');

-- ----------------------------
-- Table structure for sell_info
-- ----------------------------
DROP TABLE IF EXISTS `sell_info`;
CREATE TABLE `sell_info`  (
  `sale_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'rent id',
  `book_id` bigint(20) NOT NULL,
  `sale_price` decimal(10, 2) NOT NULL COMMENT 'rent price',
  `buy_user_id` bigint(20) NOT NULL COMMENT 'rent user',
  `numer` int(12) NOT NULL COMMENT 'sale numer',
  `deleted` tinyint(1) NOT NULL COMMENT 'deleted',
  `create_time` datetime(0) NOT NULL COMMENT 'create_time',
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sale_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sell_info
-- ----------------------------
INSERT INTO `sell_info` VALUES (1, 1, 7.80, 1, 1, 0, '2020-08-02 23:37:27', 'name');
INSERT INTO `sell_info` VALUES (2, 1, 8.50, 1, 1, 0, '2020-08-03 01:03:28', 'one');
INSERT INTO `sell_info` VALUES (3, 7, 87.00, 1, 1, 0, '2020-08-03 01:04:17', 'Demo');
INSERT INTO `sell_info` VALUES (4, 7, 87.00, 10, 1, 0, '2020-08-11 16:56:47', 'Demo');
INSERT INTO `sell_info` VALUES (5, 5, 13.42, 10, 1, 0, '2020-08-11 16:58:51', 'Where the Crawdads Sing');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
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
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `user_vip_level` int(4) UNSIGNED NULL DEFAULT 3008 COMMENT 'vip level',
  `user_account_money` decimal(11, 2) NULL DEFAULT 100.00 COMMENT 'you own money',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('admin', 'ca', 'gutianbo@gmail.com', NULL, '0d226d114e814d0ebb48fb767481d7d7.jpg', '+62 5689678', '123456', 'male', 'USA', 3001, '2020-06-02 08:58:59', '2020-06-02 08:58:59', 0, 1, 3010, 100.00);
INSERT INTO `user_info` VALUES ('user1', 'c1', 'admin@gmail.com', NULL, '01.jpg', '+65 1234567', '123456', 'female', 'India', 3001, '2020-06-03 16:25:56', '2020-06-03 16:26:03', 0, 2, 3010, 100.00);
INSERT INTO `user_info` VALUES ('zoe', NULL, 'zoe@gmail.com', 'be a dreamer', '01.jpg', '+98 8970567', 'Amin6248', 'male', 'USA', 3001, '2020-06-05 10:58:23', '2020-06-05 10:58:23', 0, 3, 3010, 100.00);
INSERT INTO `user_info` VALUES ('Fiona', NULL, 'fiona@gmail.com', NULL, '00.jpg', NULL, '123456', NULL, 'Africa', 3001, '2020-06-05 13:53:29', '2020-06-05 13:53:29', 0, 4, 3010, 100.00);
INSERT INTO `user_info` VALUES ('Timo', NULL, 'timo@gmail.com', NULL, '00.jpg', NULL, '123456', NULL, 'India', 3003, '2020-06-05 18:46:05', '2020-06-05 18:46:05', 0, 5, 3010, 100.00);
INSERT INTO `user_info` VALUES ('Zed', NULL, 'zed@gmail.com', 'https://getbootstrap.com', '01.jpg', '+98 8970567', '123456', 'female', 'Caneda', 3001, '2020-06-20 00:16:18', '2020-06-20 00:16:18', 0, 6, 3010, 100.00);
INSERT INTO `user_info` VALUES ('Simth', NULL, 'simth@gmail.com', NULL, '00.jpg', NULL, '123456', 'male', NULL, 3003, '2020-06-20 01:54:15', '2020-06-20 01:54:15', 0, 7, 3008, 100.00);
INSERT INTO `user_info` VALUES ('Rouce', NULL, 'rouce@gmail.com', NULL, '00.jpg', NULL, '123456', 'male', NULL, 3001, '2020-06-20 02:10:05', '2020-06-20 02:10:05', 0, 8, 3008, 100.00);
INSERT INTO `user_info` VALUES ('zoeL', NULL, 'zoel@gmail.com', 'https://getbootstrap.com', '00.jpg', '+98 8970567778', '123', 'male', NULL, 3001, '2020-06-20 03:03:46', '2020-06-20 03:03:46', 0, 9, 3008, 100.00);
INSERT INTO `user_info` VALUES ('kong', NULL, 'kong@gmail.com', 'https://getbootstrap.com', '00.jpg', '+86 19877888877', '123456', 'male', NULL, 3001, '2020-06-20 03:20:21', '2020-06-20 03:20:21', 0, 10, 3008, 100.00);
INSERT INTO `user_info` VALUES ('King', NULL, 'king@gmail.com', NULL, '00.jpg', NULL, '123456', 'male', NULL, 3003, '2020-06-20 03:40:01', '2020-06-20 03:40:01', 0, 11, 3008, 100.00);
INSERT INTO `user_info` VALUES ('queen', NULL, 'queen@gmail.com', NULL, 'aa468ab594ab42aa95a051d3200fa0a8.jpg', NULL, '123456', 'female', NULL, 3001, '2020-07-08 23:12:04', '2020-07-08 23:12:04', 0, 12, 3008, 100.00);
INSERT INTO `user_info` VALUES ('queens', NULL, 'queens@gmail.com', NULL, '9c2388d079b748bb9339013c55899a83.png', NULL, '123456', 'male', 'Caneda', 3001, '2020-07-09 10:35:50', '2020-07-09 10:35:50', 0, 13, 3008, 100.00);
INSERT INTO `user_info` VALUES ('your', NULL, 'your@gmail.com', NULL, '984f7634a68f4f6690c93681d1c608b8.png', NULL, '123456', 'male', NULL, 3001, '2020-08-11 17:09:18', '2020-08-11 17:09:18', 0, 14, 3008, 100.00);

SET FOREIGN_KEY_CHECKS = 1;
