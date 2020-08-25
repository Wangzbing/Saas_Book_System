/*
 Navicat Premium Data Transfer

 Source Server         : cdnw
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 192.168.34.10:3306
 Source Schema         : basic_operation_platform

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 12/06/2020 10:26:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announcement_info
-- ----------------------------
DROP TABLE IF EXISTS `announcement_info`;
CREATE TABLE `announcement_info`  (
  `announcement_id` bigint(20) NOT NULL COMMENT '公告id',
  `type` int(11) NOT NULL COMMENT '公告类型（字典）',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告的标题',
  `grade` int(12) NOT NULL COMMENT '重要等级',
  `target` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布的小区ids',
  `only_admin` bit(1) NOT NULL COMMENT '仅管理员接收（true=1=仅管理员接收）',
  `send_type` tinyint(2) NOT NULL COMMENT '发布方式(1=立即发布；2=定时发布)',
  `pre_send_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `creator` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `status` int(12) NOT NULL COMMENT '状态（1=已发布，0=待发布，2=已撤回）',
  `deleted` bit(1) NOT NULL COMMENT '删除标记[0:未删,1:已删]',
  `create_time` datetime(0) NOT NULL COMMENT '数据创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '数据创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '数据更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '数据更新人',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台通知公告' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for announcement_publish_rec
-- ----------------------------
DROP TABLE IF EXISTS `announcement_publish_rec`;
CREATE TABLE `announcement_publish_rec`  (
  `record_id` bigint(20) NOT NULL,
  `announcement_id` bigint(20) NOT NULL COMMENT '公告id',
  `publish_time` datetime(0) NOT NULL COMMENT '发布时间',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `community_id` bigint(20) NOT NULL COMMENT '小区id',
  `employee_id` bigint(20) NOT NULL COMMENT '接收人id',
  `employee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收人',
  `deleted` bit(1) NOT NULL COMMENT '删除标记[0:未删,1:已删]',
  `create_time` datetime(0) NOT NULL COMMENT '数据创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '数据创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '数据更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '数据更新人',
  `publish_status` tinyint(2) NOT NULL COMMENT '状态（1=已发布，0=待发布，2=已撤回）',
  `read_status` tinyint(2) NOT NULL COMMENT '读取状态（1=已读，0=未读）',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告发布记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for att_application
-- ----------------------------
DROP TABLE IF EXISTS `att_application`;
CREATE TABLE `att_application`  (
  `id` bigint(20) NOT NULL COMMENT '数据记录id',
  `application_id` bigint(20) NOT NULL COMMENT '应用程序id',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件文字简介',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件（图片之类）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'web应用图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for att_tenant
-- ----------------------------
DROP TABLE IF EXISTS `att_tenant`;
CREATE TABLE `att_tenant`  (
  `id` bigint(20) NOT NULL COMMENT '数据记录id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件文字简介',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件（图片之类）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户合同附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_item`;
CREATE TABLE `dictionary_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_code` bigint(20) NOT NULL COMMENT '类型编码',
  `item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项名称',
  `item_number` int(11) NOT NULL COMMENT '字典项目数字编号',
  `item_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项值',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_type`;
CREATE TABLE `dictionary_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` bigint(255) NOT NULL COMMENT '类型编码',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for division_city
-- ----------------------------
DROP TABLE IF EXISTS `division_city`;
CREATE TABLE `division_city`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `superior_region` bigint(20) NOT NULL COMMENT '上级区域',
  `position_code` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域编码（国家规范）',
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `area_code` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话区号',
  `type` tinyint(4) NOT NULL COMMENT '类型（市，自治州，旗）',
  `level` tinyint(4) NOT NULL COMMENT '级别',
  `longitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '纬度',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '行政区域-地市级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for division_county
-- ----------------------------
DROP TABLE IF EXISTS `division_county`;
CREATE TABLE `division_county`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `superior_region` bigint(20) NOT NULL COMMENT '上级区域',
  `position_code` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域编码（国家规范）',
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `type` tinyint(4) NOT NULL COMMENT '类型（县，区，县级市）',
  `level` tinyint(4) NOT NULL COMMENT '级别',
  `longitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '纬度',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '行政区域-县级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for division_province
-- ----------------------------
DROP TABLE IF EXISTS `division_province`;
CREATE TABLE `division_province`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `superior_region` bigint(20) NOT NULL COMMENT '上级区域',
  `position_code` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域编码（国家规范）',
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `type` tinyint(4) NOT NULL COMMENT '类型（省，直辖市，自治区）',
  `level` tinyint(4) NOT NULL COMMENT '级别',
  `longitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '纬度',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '行政区域-省级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for division_town
-- ----------------------------
DROP TABLE IF EXISTS `division_town`;
CREATE TABLE `division_town`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `superior_region` bigint(20) NOT NULL COMMENT '上级区域',
  `position_code` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域编码（国家规范）',
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `type` tinyint(4) NOT NULL COMMENT '类型（街道，乡，镇）',
  `level` tinyint(4) NOT NULL COMMENT '级别',
  `longitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '纬度',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '行政区域-乡镇街道级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for division_village
-- ----------------------------
DROP TABLE IF EXISTS `division_village`;
CREATE TABLE `division_village`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `superior_region` bigint(20) NOT NULL COMMENT '上级区域',
  `position_code` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域编码（国家规范）',
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `type` tinyint(4) NOT NULL COMMENT '类型（村，社区）',
  `level` tinyint(4) NOT NULL COMMENT '级别',
  `longitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '经度',
  `latitude` decimal(10, 0) NULL DEFAULT NULL COMMENT '纬度',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_abnormal_login
-- ----------------------------
DROP TABLE IF EXISTS `log_abnormal_login`;
CREATE TABLE `log_abnormal_login`  (
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `community_id` bigint(20) NOT NULL COMMENT '小区id',
  `log_id` bigint(20) NOT NULL COMMENT '日志id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `login_date` datetime(0) NOT NULL COMMENT '登录日期',
  `login_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录ip',
  `reason` smallint(6) NOT NULL COMMENT '异常原因',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `account` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `log_id` bigint(20) NOT NULL COMMENT '日志id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `login_date` datetime(0) NOT NULL COMMENT '登录日期',
  `login_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录ip',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `account` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号（手机号）',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_operation
-- ----------------------------
DROP TABLE IF EXISTS `log_operation`;
CREATE TABLE `log_operation`  (
  `log_id` bigint(20) NOT NULL COMMENT '日志id',
  `operator_id` bigint(20) NOT NULL COMMENT '操作者id',
  `operator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作者名字',
  `operator_account` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作者账号（手机号）',
  `operator_login_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作者ip',
  `operation_id` bigint(20) NOT NULL COMMENT '操作id',
  `operation_content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作内容(简介)',
  `detail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作内容详情',
  `business_type` tinyint(2) NOT NULL COMMENT '业务类型（登录=1；操作=2）',
  `operation_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作类型（枚举）',
  `operation_time` datetime(0) NOT NULL COMMENT '操作时间',
  `method` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求定位方法',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_application_service
-- ----------------------------
DROP TABLE IF EXISTS `rel_application_service`;
CREATE TABLE `rel_application_service`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `application_id` bigint(20) NOT NULL COMMENT 'web引用id',
  `service_id` bigint(20) NOT NULL COMMENT '服务id',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'web应用的系统服务配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_com_apk
-- ----------------------------
DROP TABLE IF EXISTS `rel_com_apk`;
CREATE TABLE `rel_com_apk`  (
  `rel_id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `communitity_id` bigint(20) NOT NULL COMMENT '小区id',
  `apk_type_id` bigint(20) NOT NULL COMMENT 'app版本类型id',
  `server_date` date NOT NULL COMMENT '开始服务日期',
  `expire_date` date NOT NULL COMMENT '服务到期日期',
  `status` int(11) NOT NULL COMMENT '状态',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`rel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区-apk版本类型绑定关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_com_application
-- ----------------------------
DROP TABLE IF EXISTS `rel_com_application`;
CREATE TABLE `rel_com_application`  (
  `rel_id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `communitity_id` bigint(20) NOT NULL COMMENT '小区id',
  `application_id` bigint(20) NOT NULL COMMENT 'web应用id',
  `application_type_id` bigint(20) NOT NULL COMMENT 'web应用版本类型id',
  `server_date` date NOT NULL COMMENT '开始服务日期',
  `expire_date` date NOT NULL COMMENT '服务到期日期',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`rel_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区-web应用版本类型绑定关系\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_com_application_rec
-- ----------------------------
DROP TABLE IF EXISTS `rel_com_application_rec`;
CREATE TABLE `rel_com_application_rec`  (
  `rec_id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `communitity_id` bigint(20) NOT NULL COMMENT '小区id',
  `application_id` bigint(20) NOT NULL COMMENT 'web应用id',
  `application_type_id` bigint(20) NOT NULL COMMENT 'web应用版本类型id',
  `server_date` date NOT NULL COMMENT '开始服务日期',
  `expire_date` date NOT NULL COMMENT '服务到期日期',
  `rec_type` tinyint(2) NOT NULL COMMENT '1:授权；2：取消授权',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `order_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`rec_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区授权记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_com_application_service
-- ----------------------------
DROP TABLE IF EXISTS `rel_com_application_service`;
CREATE TABLE `rel_com_application_service`  (
  `rel_service_id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `communitity_id` bigint(20) NOT NULL COMMENT '小区id',
  `application_id` bigint(20) NOT NULL COMMENT 'web应用id',
  `service_id` bigint(20) NOT NULL COMMENT '系统服务id',
  `service_api_id` bigint(20) NULL DEFAULT NULL COMMENT '系统服务对应的api',
  `service_api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统服务对应的api的url',
  `status` int(11) NOT NULL COMMENT '状态',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `order_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`rel_service_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区接入-web系统-系统服务关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_permission_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `rel_permission_role_menu`;
CREATE TABLE `rel_permission_role_menu`  (
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `id` bigint(20) NOT NULL COMMENT '记录id',
  `application_id` bigint(20) NOT NULL COMMENT '应用id',
  `communitity_id` bigint(20) NOT NULL COMMENT '小区id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_permission_role_operation
-- ----------------------------
DROP TABLE IF EXISTS `rel_permission_role_operation`;
CREATE TABLE `rel_permission_role_operation`  (
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `id` bigint(20) NOT NULL COMMENT '记录id',
  `application_id` bigint(20) NOT NULL COMMENT '应用id',
  `community_id` bigint(20) NOT NULL COMMENT '小区id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `operation_id` bigint(20) NOT NULL COMMENT '操作id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_dept`;
CREATE TABLE `rel_user_dept`  (
  `id` bigint(20) NOT NULL COMMENT '记录id',
  `deptment_id` bigint(20) NOT NULL COMMENT '部门id',
  `user_id` bigint(20) NOT NULL COMMENT '人员id',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户-部门关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_user_role
-- ----------------------------
DROP TABLE IF EXISTS `rel_user_role`;
CREATE TABLE `rel_user_role`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `department_id` bigint(20) NOT NULL COMMENT '部门id',
  `dept_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名字',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门id',
  `gradation` tinyint(4) NOT NULL COMMENT '层级',
  `manager_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '管理者id',
  `manager_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理者名字',
  `status` int(11) NOT NULL COMMENT '状态（启用=1、停用=0）',
  `parent_path` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门父路径',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `head_count` int(11) NOT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `menu_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单编码',
  `parent_id` bigint(20) NOT NULL COMMENT '上级菜单id',
  `parent_route` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级菜单路由路径',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `menu_order` smallint(6) NOT NULL COMMENT '序号',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'url',
  `menu_describe` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `route_path` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'vue路径',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改者',
  `perm_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权码',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_operation
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation`;
CREATE TABLE `sys_operation`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `operation_id` bigint(20) NOT NULL COMMENT '操作id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作名',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（启用=1、停用=0）',
  `mapping_path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作mapping地址',
  `url_route` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单url地址',
  `operation_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `perm_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权码',
  PRIMARY KEY (`operation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统权限操作按钮表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名字',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '角色状态（启用=1、停用=0）',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `weight` smallint(6) NOT NULL COMMENT '权重',
  `parent_role_id` bigint(20) NOT NULL DEFAULT -1 COMMENT '父角色id',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  `admin` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否管理员（是=1，0=否）',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '员工id',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电话（登录账号）',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（启用=1、停用=0）',
  `admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否超级管理员',
  `user_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '展示编号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '电子邮件',
  `position` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职位',
  `birth_day` date NULL DEFAULT NULL COMMENT '生日',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者名字',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ump_sys_user_user_number_uindex`(`user_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_file_mapping
-- ----------------------------
DROP TABLE IF EXISTS `system_file_mapping`;
CREATE TABLE `system_file_mapping`  (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` bigint(20) NULL DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `community_id` bigint(20) NOT NULL,
  `file_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `file_suffixes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logical_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `original_file_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_apk_type
-- ----------------------------
DROP TABLE IF EXISTS `t_apk_type`;
CREATE TABLE `t_apk_type`  (
  `type_id` bigint(20) NOT NULL COMMENT '版本类型id',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本类型名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（1=启用，0=禁用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app版本类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_apk_type_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_apk_type_banner`;
CREATE TABLE `t_apk_type_banner`  (
  `banner_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT 'apk版本类型id',
  `banner_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'banner名称',
  `order_num` int(11) NOT NULL COMMENT '展示顺序(数字越大排序越靠前)',
  `publish_type` int(11) NOT NULL COMMENT '发布方式(1=立即发布；2=定时发布)',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '预计的发布时间',
  `publish_user` bigint(20) NOT NULL COMMENT '实际发布人员id',
  `banner_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `ad_link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `ad_type` int(4) NULL DEFAULT NULL COMMENT '类型',
  `open_way` tinyint(4) NULL DEFAULT NULL COMMENT '打开方式',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=已发布，0=待发布，2=已下架）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app版本类型banner' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_apk_type_boot
-- ----------------------------
DROP TABLE IF EXISTS `t_apk_type_boot`;
CREATE TABLE `t_apk_type_boot`  (
  `boot_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT 'apk版本类型id',
  `boot_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '启动页名称',
  `order_num` int(11) NOT NULL COMMENT '展示顺序(数字越大排序越靠前)',
  `publish_type` int(11) NOT NULL COMMENT '发布方式(1=立即发布；2=定时发布)',
  `pre_publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `boot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `ad_link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载链接',
  `ad_type` int(4) NULL DEFAULT NULL COMMENT '类型',
  `display_time` int(10) NULL DEFAULT NULL COMMENT '显示时间',
  `open_way` tinyint(4) NULL DEFAULT NULL COMMENT '系统类型',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=已发布，0=待发布，2=已下架）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '实际发布时间',
  `publish_user` bigint(20) NULL DEFAULT NULL COMMENT '实际发布人员id',
  PRIMARY KEY (`boot_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app版本类型启动页' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_apk_version_publish
-- ----------------------------
DROP TABLE IF EXISTS `t_apk_version_publish`;
CREATE TABLE `t_apk_version_publish`  (
  `publish_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `apk_type_id` bigint(20) NOT NULL COMMENT 'app版本类型id',
  `version_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本号',
  `apk_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '安装包名称',
  `apk_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下载链接',
  `force_update` bit(1) NOT NULL COMMENT '更新类型（true=1=强制更新；false=0=不强制）',
  `release_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新日志',
  `app_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用版本',
  `device_model` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备型号',
  `system_version` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作系统版本',
  `status` tinyint(2) NOT NULL COMMENT '状态（1=已发布，0=待发布，2=已下架）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '实际发布时间',
  `publish_user` bigint(20) NULL DEFAULT NULL COMMENT '实际发布人员id',
  PRIMARY KEY (`publish_id`) USING BTREE,
  UNIQUE INDEX `device_code`(`apk_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app类型的版本发布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_application
-- ----------------------------
DROP TABLE IF EXISTS `t_application`;
CREATE TABLE `t_application`  (
  `application_id` bigint(20) NOT NULL COMMENT '应用程序ID',
  `application_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用程序编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用程序名称',
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '程序图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `order_num` int(11) NOT NULL COMMENT '应用入口排序(数字越大，排序越靠前)',
  `is_basic` tinyint(2) NOT NULL COMMENT '是否是基础系统(是=1；否=0)',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（未授权=0；1=正常/已授权；2=停用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`application_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Web应用基础信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_application_type
-- ----------------------------
DROP TABLE IF EXISTS `t_application_type`;
CREATE TABLE `t_application_type`  (
  `type_id` bigint(20) NOT NULL COMMENT '版本类型id',
  `application_id` bigint(20) NOT NULL COMMENT '应用程序ID',
  `type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本类型名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `logs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日志',
  `type_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本编号',
  `type_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本url',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（1=启用，0=禁用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'web应用版本类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_application_type_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_application_type_menu`;
CREATE TABLE `t_application_type_menu`  (
  `application_id` bigint(20) NULL DEFAULT NULL COMMENT '应用id',
  `application_type_id` bigint(20) NULL DEFAULT NULL COMMENT '版本类型id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `menu_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单编码',
  `parent_id` bigint(20) NOT NULL COMMENT '上级菜单id',
  `parent_route` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '上级菜单路由路径',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `menu_order` smallint(6) NOT NULL COMMENT '序号',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'url',
  `menu_describe` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `route_path` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'vue路径',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改者',
  `perm_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权码',
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'web系统版本类型菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_application_version_publish
-- ----------------------------
DROP TABLE IF EXISTS `t_application_version_publish`;
CREATE TABLE `t_application_version_publish`  (
  `publish_id` bigint(20) NOT NULL COMMENT '发布记录id',
  `application_id` bigint(20) NOT NULL COMMENT '应用程序ID',
  `application_type_id` bigint(20) NULL DEFAULT NULL COMMENT '版本类型id',
  `version_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本编号',
  `logs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日志',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=启用，0=停用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`publish_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'web应用版本更新记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_community
-- ----------------------------
DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community`  (
  `community_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '小区LOGO',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '小区名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '小区编码',
  `province` bigint(20) NOT NULL COMMENT '省，直辖市',
  `city` bigint(20) NOT NULL COMMENT '市，州',
  `county` bigint(20) NOT NULL COMMENT '县，区',
  `town` bigint(20) NULL DEFAULT NULL COMMENT '街道，乡，镇',
  `village` bigint(20) NULL DEFAULT NULL COMMENT '社区，村',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `full_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址（完整）',
  `neighborhood_id` bigint(20) NOT NULL COMMENT '所属社区id',
  `neighborhood_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属社区',
  `linkman` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '小区联系人',
  `linkphone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '小区联系人联系方式',
  `service_user_id` bigint(20) NOT NULL COMMENT '平台维护人id',
  `service_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台维护人名称',
  `service_user_phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台维护人手机号码',
  `developer_id` bigint(20) NULL DEFAULT NULL COMMENT '开发商ID',
  `developer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发商',
  `build_time` date NULL DEFAULT NULL COMMENT '建成时间',
  `build_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区建设面积',
  `live_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区住宅建设面积',
  `greenest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绿化率',
  `plot_ratio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容积率',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL,
  `create_user` bigint(20) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  `enable` tinyint(2) NULL DEFAULT 1 COMMENT '[待定]服务状态（0=服务停用；1=服务启用）',
  PRIMARY KEY (`community_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_community_key
-- ----------------------------
DROP TABLE IF EXISTS `t_community_key`;
CREATE TABLE `t_community_key`  (
  `key_id` bigint(20) NOT NULL COMMENT '秘钥id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `community_id` bigint(20) NOT NULL COMMENT '小区id',
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秘钥',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=启用，0=停用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`key_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区服务秘钥表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_community_key_log
-- ----------------------------
DROP TABLE IF EXISTS `t_community_key_log`;
CREATE TABLE `t_community_key_log`  (
  `log_id` bigint(20) NOT NULL,
  `key_id` bigint(20) NOT NULL COMMENT '秘钥id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `community_id` bigint(20) NOT NULL COMMENT '小区id',
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秘钥',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=启用，0=停用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  `flag_bit` bigint(20) NULL DEFAULT NULL,
  `operate_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小区服务秘钥记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_mini_type_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_mini_type_banner`;
CREATE TABLE `t_mini_type_banner`  (
  `banner_id` bigint(20) NOT NULL,
  `banner_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'banner名称',
  `order_num` int(11) NOT NULL COMMENT '展示顺序(数字越大排序越靠前)',
  `publish_type` int(11) NOT NULL COMMENT '发布方式(1=立即发布；2=定时发布)',
  `banner_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `ad_link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `ad_type` int(4) NULL DEFAULT NULL COMMENT '类型',
  `open_way` tinyint(4) NULL DEFAULT NULL COMMENT '打开方式',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=已发布，0=待发布，2=已下架）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '实际发布时间',
  `publish_user` datetime(0) NULL DEFAULT NULL COMMENT '实际发布人员id',
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小程序版本类型banner' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_mini_version_publish
-- ----------------------------
DROP TABLE IF EXISTS `t_mini_version_publish`;
CREATE TABLE `t_mini_version_publish`  (
  `publish_id` bigint(20) NOT NULL COMMENT '发布记录id',
  `version_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本编号',
  `version_date` date NOT NULL COMMENT '更新日期',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '说明',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态（1=启用，0=停用）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`publish_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小程序版本更新记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_neighborhood
-- ----------------------------
DROP TABLE IF EXISTS `t_neighborhood`;
CREATE TABLE `t_neighborhood`  (
  `neighborhood_id` bigint(20) NOT NULL COMMENT '社区id',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '社区名称',
  `enable` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（启用=1、停用=0）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_user` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_user` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`neighborhood_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_service
-- ----------------------------
DROP TABLE IF EXISTS `t_service`;
CREATE TABLE `t_service`  (
  `service_id` bigint(20) NOT NULL COMMENT '服务id',
  `service_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务名称',
  `service_type` bigint(20) NOT NULL COMMENT '服务类型(字典)',
  `service_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务说明',
  `example_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接口示例(富文本)',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（启用=1、停用=0）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统服务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_service_api
-- ----------------------------
DROP TABLE IF EXISTS `t_service_api`;
CREATE TABLE `t_service_api`  (
  `api_id` bigint(20) NOT NULL COMMENT 'api的id',
  `service_id` bigint(20) NOT NULL COMMENT '服务id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务说明',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '逻辑删除标记',
  PRIMARY KEY (`api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统服务公共API地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant_info`;
CREATE TABLE `t_tenant_info`  (
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `source` int(11) NOT NULL COMMENT '客户来源（字典）',
  `source_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户来源',
  `service_user_id` bigint(20) NOT NULL COMMENT '客户维护人id',
  `service_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户维护人',
  `service_user_phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户维护人手机',
  `province` bigint(20) NOT NULL COMMENT '省id',
  `city` bigint(20) NOT NULL COMMENT '市州id',
  `county` bigint(20) NOT NULL COMMENT '区县id',
  `town` bigint(20) NULL DEFAULT NULL COMMENT '乡镇id',
  `village` bigint(20) NULL DEFAULT NULL COMMENT '村社id',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址(填写)',
  `full_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '完整的地址',
  `tenant_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '展示编号',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态（启用=1、停用=0）',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  PRIMARY KEY (`tenant_id`) USING BTREE,
  UNIQUE INDEX `ump_sys_user_user_number_uindex`(`tenant_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户基础信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tenant_merchant_wx
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant_merchant_wx`;
CREATE TABLE `t_tenant_merchant_wx`  (
  `merchant_id` bigint(20) NOT NULL COMMENT 'id',
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `merchant_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信支付商户号',
  `public_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公众账号ID',
  `merchant_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户平台密钥',
  `rate` decimal(4, 2) NOT NULL COMMENT '支付手续费费率',
  `certificate_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付API证书名称',
  `certificate_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付API证书，pkcs12格式',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除标记',
  `create_time` datetime(0) NOT NULL COMMENT '创建日期',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`merchant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户微信支付接入信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tenant_person
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant_person`;
CREATE TABLE `t_tenant_person`  (
  `person_id` bigint(20) NOT NULL COMMENT '客户联系人id',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '客户id',
  `person_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户联系人名字',
  `person_phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户联系人手机',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `deleted` bit(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  PRIMARY KEY (`person_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户联系人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ump_prop_employee
-- ----------------------------
DROP TABLE IF EXISTS `ump_prop_employee`;
CREATE TABLE `ump_prop_employee`  (
  `tenant_id` bigint(20) NOT NULL COMMENT '客户id',
  `employee_id` bigint(20) NOT NULL COMMENT '员工id',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `employee_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电话（登录账号）',
  `birth_day` date NULL DEFAULT NULL COMMENT '生日',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `position` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职位',
  `register_date` date NOT NULL COMMENT '注册日期',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `status` int(11) NOT NULL COMMENT '状态（新增、启用、停用）(枚举)',
  `admin` tinyint(1) NOT NULL COMMENT '是否超级管理员',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者名字',
  `deleted` tinyint(4) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` bigint(20) NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者id',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
