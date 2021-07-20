/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : oauth2

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 21/10/2019 17:20:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `authority` varchar(25) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, '获取a', 'a:get');
INSERT INTO `authority` VALUES (2, '获取b', 'b:get');
INSERT INTO `authority` VALUES (3, '新增a', 'a:post');
INSERT INTO `authority` VALUES (4, '修改a', 'a:put');

-- ----------------------------
-- Table structure for clientdetails
-- ----------------------------
DROP TABLE IF EXISTS `clientdetails`;
CREATE TABLE `clientdetails`  (
  `appId` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `resourceIds` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `appSecret` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `grantTypes` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `redirectUrl` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additionalInformation` varchar(4096) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `autoApproveScopes` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`appId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `token_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals`  (
  `userId` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `clientId` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `expiresAt` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `lastModifiedAt` timestamp(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('client_1', NULL, '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'select', 'client_credentials,refresh_token', NULL, 'oauth2', NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` VALUES ('client_2', '', '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa', 'server', 'password,refresh_token', NULL, 'oauth2', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `token_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `user_name` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `code` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `token_id` varchar(256) CHARACTER SET utf16 COLLATE utf16_general_ci NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `code` varchar(25) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员a', 'ADMIN_A');
INSERT INTO `role` VALUES (2, '管理员b', 'ADMIN_B');

-- ----------------------------
-- Table structure for role_authority
-- ----------------------------
DROP TABLE IF EXISTS `role_authority`;
CREATE TABLE `role_authority`  (
  `role_id` int(11) NOT NULL,
  `authority_id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_authority
-- ----------------------------
INSERT INTO `role_authority` VALUES (1, 1);
INSERT INTO `role_authority` VALUES (2, 1);
INSERT INTO `role_authority` VALUES (1, 3);
INSERT INTO `role_authority` VALUES (2, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '{bcrypt}$2a$10$HBX6q6TndkgMxhSEdoFqWOUtctaJEMoXe49NWh8Owc.4MTunv.wXa');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `user_role_unique`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf16 COLLATE = utf16_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (1, 2);

SET FOREIGN_KEY_CHECKS = 1;