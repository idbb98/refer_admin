/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50528
 Source Host           : localhost:3306
 Source Schema         : bin

 Target Server Type    : MySQL
 Target Server Version : 50528
 File Encoding         : 65001

 Date: 21/05/2022 19:17:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `score` int(11) NULL DEFAULT NULL COMMENT '学分',
  `times` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课时',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否开课',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '授课老师id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '英语', 5, '40', 0, NULL);
INSERT INTO `course` VALUES (2, '数学', 5, '35', 1, 3);
INSERT INTO `course` VALUES (3, '语文', 3, '35', 1, 5);

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `course_id` int(11) NOT NULL COMMENT '课程id',
  PRIMARY KEY (`student_id`, `course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (1, 1);
INSERT INTO `student_course` VALUES (1, 2);
INSERT INTO `student_course` VALUES (1, 3);
INSERT INTO `student_course` VALUES (2, 1);
INSERT INTO `student_course` VALUES (2, 2);
INSERT INTO `student_course` VALUES (2, 3);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('setting', 'el-icon-setting', 'icon');
INSERT INTO `sys_dict` VALUES ('info', 'el-icon-info', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('location', 'el-icon-location', 'icon');
INSERT INTO `sys_dict` VALUES ('news', 'el-icon-news', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件种类',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件MD5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (6, 'geiwo - 副本.png', 'png', 223, 'http://localhost:9090/file/f0cfa00ef8c045e58fef787f6aa7726a.png', 'c8d2f1d8e16f973cd886a04c4e991e34', 0, 1);
INSERT INTO `sys_file` VALUES (7, 'geiwo.png', 'png', 223, 'http://localhost:9090/file/f0cfa00ef8c045e58fef787f6aa7726a.png', 'c8d2f1d8e16f973cd886a04c4e991e34', 0, 1);
INSERT INTO `sys_file` VALUES (8, '用户信息.xlsx', 'xlsx', 10, 'http://localhost:9090/file/a9b8085017e842bcb213845fbfade0c9.xlsx', 'b1d59eeeae386b60058875e541747c05', 1, 1);
INSERT INTO `sys_file` VALUES (9, '用户信息.xlsx', 'xlsx', 10, 'http://localhost:9090/file/a9b8085017e842bcb213845fbfade0c9.xlsx', 'b1d59eeeae386b60058875e541747c05', 1, 1);
INSERT INTO `sys_file` VALUES (10, '用户信息.xlsx', 'xlsx', 10, 'http://localhost:9090/file/a9b8085017e842bcb213845fbfade0c9.xlsx', 'b1d59eeeae386b60058875e541747c05', 1, 1);
INSERT INTO `sys_file` VALUES (11, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (12, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (13, 'admin.jpg', 'jpg', 9, 'http://localhost:9090/file/c0a0e61c0d9941fba9f3a47678d31ddd.jpg', 'd762b76577f9b68b458bb53e37511252', 0, 1);
INSERT INTO `sys_file` VALUES (14, 'aaaaaa.jpg', 'jpg', 331, 'http://localhost:9090/file/98c75eeef7e84c4eaea6ad2ae87b6415.jpg', 'fbf72efbdf2cf7fc80b8e8ae1d65f1c1', 0, 1);
INSERT INTO `sys_file` VALUES (15, 'admin.jpg', 'jpg', 9, 'http://localhost:9090/file/c0a0e61c0d9941fba9f3a47678d31ddd.jpg', 'd762b76577f9b68b458bb53e37511252', 0, 1);
INSERT INTO `sys_file` VALUES (16, 'default.jpg', 'jpg', 4, 'http://localhost:9090/file/42c45a2b3179446a995fb183754ffd8e.jpg', 'e7ce8895fa08ead5b390a188168a1b29', 0, 1);
INSERT INTO `sys_file` VALUES (17, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (18, 'default.jpg', 'jpg', 4, 'http://localhost:9090/file/42c45a2b3179446a995fb183754ffd8e.jpg', 'e7ce8895fa08ead5b390a188168a1b29', 0, 1);
INSERT INTO `sys_file` VALUES (19, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (20, 'default.jpg', 'jpg', 4, 'http://localhost:9090/file/42c45a2b3179446a995fb183754ffd8e.jpg', 'e7ce8895fa08ead5b390a188168a1b29', 0, 1);
INSERT INTO `sys_file` VALUES (21, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (22, 'aaaaaa.jpg', 'jpg', 331, 'http://localhost:9090/file/98c75eeef7e84c4eaea6ad2ae87b6415.jpg', 'fbf72efbdf2cf7fc80b8e8ae1d65f1c1', 0, 1);
INSERT INTO `sys_file` VALUES (23, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (24, '1629766596929.jpg', 'jpg', 102, 'http://localhost:9090/file/8090f238c6e44ec686475af01f528279.jpg', '86bc87c909ad2bfafe8e4e92dac92891', 0, 1);
INSERT INTO `sys_file` VALUES (25, '1629766596929.jpg', 'jpg', 102, 'http://localhost:9090/file/8090f238c6e44ec686475af01f528279.jpg', '86bc87c909ad2bfafe8e4e92dac92891', 0, 1);
INSERT INTO `sys_file` VALUES (26, 'aaaaaa.jpg', 'jpg', 331, 'http://localhost:9090/file/98c75eeef7e84c4eaea6ad2ae87b6415.jpg', 'fbf72efbdf2cf7fc80b8e8ae1d65f1c1', 0, 1);
INSERT INTO `sys_file` VALUES (27, 'aaaaaa.jpg', 'jpg', 331, 'http://localhost:9090/file/98c75eeef7e84c4eaea6ad2ae87b6415.jpg', 'fbf72efbdf2cf7fc80b8e8ae1d65f1c1', 0, 1);
INSERT INTO `sys_file` VALUES (28, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (29, '1629766596929.jpg', 'jpg', 102, 'http://localhost:9090/file/8090f238c6e44ec686475af01f528279.jpg', '86bc87c909ad2bfafe8e4e92dac92891', 0, 1);
INSERT INTO `sys_file` VALUES (30, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (31, 'aaaaaa.jpg', 'jpg', 331, 'http://localhost:9090/file/98c75eeef7e84c4eaea6ad2ae87b6415.jpg', 'fbf72efbdf2cf7fc80b8e8ae1d65f1c1', 0, 1);
INSERT INTO `sys_file` VALUES (32, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 0, 1);
INSERT INTO `sys_file` VALUES (33, 'default.jpg', 'jpg', 4, 'http://localhost:9090/file/42c45a2b3179446a995fb183754ffd8e.jpg', 'e7ce8895fa08ead5b390a188168a1b29', 0, 0);
INSERT INTO `sys_file` VALUES (34, 'mao.jpg', 'jpg', 161, 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'd0ee0ac267d2b399b8b5146c26bb661a', 1, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '主页', '/home', 'el-icon-user', '主页', NULL, 'Home');
INSERT INTO `sys_menu` VALUES (3, '课程管理', '/couse', 'el-icon-s-grid', '课程管理', NULL, 'Course');
INSERT INTO `sys_menu` VALUES (5, '系统管理', NULL, 'el-icon-menu', '系统管理', NULL, NULL);
INSERT INTO `sys_menu` VALUES (9, '用户管理', '/user', 'el-icon-user', '用户管理', 5, 'User');
INSERT INTO `sys_menu` VALUES (10, '角色管理', '/role', 'el-icon-s-custom', '角色管理', 5, 'Role');
INSERT INTO `sys_menu` VALUES (11, '文件管理', '/file', 'el-icon-document', '文件管理', 5, 'File');
INSERT INTO `sys_menu` VALUES (12, '菜单管理', '/menu', 'el-icon-menu', '菜单管理', 5, 'Menu');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '学生', '学生', 'ROLE_STUDENT');
INSERT INTO `sys_role` VALUES (3, '老师', '老师', 'ROLE_TEACHER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 9);
INSERT INTO `sys_role_menu` VALUES (3, 11);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '管理员', 'admin@163.com', '16666666666', '南京', 1, '2022-01-30 16:36:00', 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (2, 'xiaoming', '123', '小明', '123@qq.com', '13066666666', '无锡', 1, '2022-02-10 17:15:18', 'http://localhost:9090/file/98c75eeef7e84c4eaea6ad2ae87b6415.jpg', 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (3, 'zhangsan', '123', '张三', 'qwe@163.com', '13066666666', '南京', 1, '2022-03-30 17:36:15', NULL, 'ROLE_TEACHER');
INSERT INTO `sys_user` VALUES (5, 'wangwu', '123', '王五', 'qwe@163.com', '13066666666', '南京', 1, '2022-08-01 15:05:31', 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'ROLE_TEACHER');
INSERT INTO `sys_user` VALUES (18, 'lisi', '123', '李四', '123@qq.com', '13066666666', '无锡', 1, '2022-04-04 14:50:21', 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'ROLE_TEACHER');
INSERT INTO `sys_user` VALUES (20, 'zhaoyun', '123', '赵云', '123@qq.com', '13066666666', '无锡', 1, '2022-05-01 15:05:31', 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (21, 'zhangfei', '123', '张飞', 'qwe@163.com', '13066666666', '南京', 1, '2022-08-04 15:05:31', 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'ROLE_STUDENT');
INSERT INTO `sys_user` VALUES (28, 'aql', '123', '安琪拉', 'qwe@163.com', '13066666666', '南京', 1, '2022-12-04 15:05:31', 'http://localhost:9090/file/aa087aa521ae48ba8742aa6a1e4ffa6e.jpg', 'ROLE_STUDENT');

SET FOREIGN_KEY_CHECKS = 1;
