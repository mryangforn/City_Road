/*
 Navicat Premium Data Transfer

 Source Server         : MyDb
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : blogdb

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 13/06/2019 11:58:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_myuser
-- ----------------------------
DROP TABLE IF EXISTS `account_myuser`;
CREATE TABLE `account_myuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introduce` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profession` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `wx` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qq` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `wb` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_myuser
-- ----------------------------
INSERT INTO `account_myuser` VALUES (1, 'pbkdf2_sha256$150000$7ILU3OK7Zqd1$kMsm+GfjeRfPdBEK3F4oQ6B7XqgF6PPjRLhSNeWYPTE=', '2019-06-13 03:57:06.774260', 1, 'admin', '', '', '554301449@qq.com', 1, 1, '2019-06-12 04:20:00.000000', '小黄', '热爱Python、Django', '暂无信息', '暂无信息', '暂无信息', '110', '暂无信息', '554301449', '暂无信息', 'images/user/9.jpg');
INSERT INTO `account_myuser` VALUES (2, 'pbkdf2_sha256$150000$NPpArb8ZXNOC$a2K+Vju659Pm282EvsMtWB1SXZlrndI8+3gQYHzVGNk=', '2019-06-12 04:28:03.256173', 1, 'root', '', '', '', 1, 1, '2019-06-12 04:27:58.407433', '匿名用户', '暂无介绍', '暂无信息', '暂无信息', '暂无信息', '暂无信息', '暂无信息', '暂无信息', '暂无信息', '');

-- ----------------------------
-- Table structure for account_myuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_myuser_groups`;
CREATE TABLE `account_myuser_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_myuser_groups_myuser_id_group_id_7d7152e7_uniq`(`myuser_id`, `group_id`) USING BTREE,
  INDEX `account_myuser_groups_group_id_44b24908_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `account_myuser_groups_group_id_44b24908_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_myuser_groups_myuser_id_5adbe57d_fk_account_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_myuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_myuser_user_permissions`;
CREATE TABLE `account_myuser_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_myuser_user_perm_myuser_id_permission_id_36f9bf13_uniq`(`myuser_id`, `permission_id`) USING BTREE,
  INDEX `account_myuser_user__permission_id_17807c80_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `account_myuser_user__myuser_id_cdc8ab14_fk_account_m` FOREIGN KEY (`myuser_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_myuser_user__permission_id_17807c80_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for album_albuminfo
-- ----------------------------
DROP TABLE IF EXISTS `album_albuminfo`;
CREATE TABLE `album_albuminfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introduce` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `album_albuminfo_user_id_ef08f7d4_fk_account_myuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `album_albuminfo_user_id_ef08f7d4_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album_albuminfo
-- ----------------------------
INSERT INTO `album_albuminfo` VALUES (1, '小狗表情图', '表情图', 'images/album/7.jpg', 1);
INSERT INTO `album_albuminfo` VALUES (2, '小狗表情图', '表情图', 'images/album/6.jpg', 1);

-- ----------------------------
-- Table structure for article_articleinfo
-- ----------------------------
DROP TABLE IF EXISTS `article_articleinfo`;
CREATE TABLE `article_articleinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `articlephoto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reading` int(11) NOT NULL,
  `liking` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_articleinfo_author_id_7343d1ac_fk_account_myuser_id`(`author_id`) USING BTREE,
  CONSTRAINT `article_articleinfo_author_id_7343d1ac_fk_account_myuser_id` FOREIGN KEY (`author_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_articleinfo
-- ----------------------------
INSERT INTO `article_articleinfo` VALUES (1, '今天随笔', '<p><strong>今天学习Django的入门知识。</strong></p>', 'images/article/4.jpg', 1, 0, '2019-06-12 07:43:00.000000', '2019-06-12 07:49:34.137235', 1);

-- ----------------------------
-- Table structure for article_articleinfo_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_articleinfo_article_tag`;
CREATE TABLE `article_articleinfo_article_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleinfo_id` int(11) NOT NULL,
  `articletag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `article_articleinfo_arti_articleinfo_id_articleta_3bda745e_uniq`(`articleinfo_id`, `articletag_id`) USING BTREE,
  INDEX `article_articleinfo__articletag_id_90dffc80_fk_article_a`(`articletag_id`) USING BTREE,
  CONSTRAINT `article_articleinfo__articleinfo_id_386be4c6_fk_article_a` FOREIGN KEY (`articleinfo_id`) REFERENCES `article_articleinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_articleinfo__articletag_id_90dffc80_fk_article_a` FOREIGN KEY (`articletag_id`) REFERENCES `article_articletag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_articleinfo_article_tag
-- ----------------------------
INSERT INTO `article_articleinfo_article_tag` VALUES (1, 1, 1);
INSERT INTO `article_articleinfo_article_tag` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for article_articletag
-- ----------------------------
DROP TABLE IF EXISTS `article_articletag`;
CREATE TABLE `article_articletag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_articletag_user_id_3c98dc89_fk_account_myuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `article_articletag_user_id_3c98dc89_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_articletag
-- ----------------------------
INSERT INTO `article_articletag` VALUES (1, '技术', 1);
INSERT INTO `article_articletag` VALUES (2, '随笔', 1);

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentator` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_comment_article_id_4fa145bf_fk_article_articleinfo_id`(`article_id`) USING BTREE,
  CONSTRAINT `article_comment_article_id_4fa145bf_fk_article_articleinfo_id` FOREIGN KEY (`article_id`) REFERENCES `article_articleinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_comment
-- ----------------------------
INSERT INTO `article_comment` VALUES (1, '小灰', '支持支持', '2019-06-12 08:43:50.601258', 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 博文管理', 6, 'add_articleinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change 博文管理', 6, 'change_articleinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 博文管理', 6, 'delete_articleinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view 博文管理', 6, 'view_articleinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add 评论管理', 7, 'add_comment');
INSERT INTO `auth_permission` VALUES (26, 'Can change 评论管理', 7, 'change_comment');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 评论管理', 7, 'delete_comment');
INSERT INTO `auth_permission` VALUES (28, 'Can view 评论管理', 7, 'view_comment');
INSERT INTO `auth_permission` VALUES (29, 'Can add 博文分类', 8, 'add_articletag');
INSERT INTO `auth_permission` VALUES (30, 'Can change 博文分类', 8, 'change_articletag');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 博文分类', 8, 'delete_articletag');
INSERT INTO `auth_permission` VALUES (32, 'Can view 博文分类', 8, 'view_articletag');
INSERT INTO `auth_permission` VALUES (33, 'Can add 相册管理', 9, 'add_albuminfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change 相册管理', 9, 'change_albuminfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 相册管理', 9, 'delete_albuminfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view 相册管理', 9, 'view_albuminfo');
INSERT INTO `auth_permission` VALUES (37, 'Can add user', 10, 'add_myuser');
INSERT INTO `auth_permission` VALUES (38, 'Can change user', 10, 'change_myuser');
INSERT INTO `auth_permission` VALUES (39, 'Can delete user', 10, 'delete_myuser');
INSERT INTO `auth_permission` VALUES (40, 'Can view user', 10, 'view_myuser');
INSERT INTO `auth_permission` VALUES (41, 'Can add 博客留言', 11, 'add_board');
INSERT INTO `auth_permission` VALUES (42, 'Can change 博客留言', 11, 'change_board');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 博客留言', 11, 'delete_board');
INSERT INTO `auth_permission` VALUES (44, 'Can view 博客留言', 11, 'view_board');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_myuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-06-12 07:20:34.352652', '1', '技术', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-06-12 07:20:41.053128', '2', '随笔', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-06-12 07:21:34.788996', '1', '小黄', 2, '[{\"changed\": {\"fields\": [\"name\", \"introduce\", \"telephone\", \"qq\", \"photo\", \"last_login\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-06-12 07:23:52.505488', '1', '小黄', 2, '[{\"changed\": {\"fields\": [\"email\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-06-12 07:33:27.668601', '1', '1', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-06-12 07:33:44.044490', '2', '2', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-06-12 07:44:25.335467', '1', '今天随笔', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-06-12 07:46:08.017749', '1', '今天随笔', 2, '[{\"changed\": {\"fields\": [\"articlephoto\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-06-12 07:48:11.670866', '2', '2', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-06-12 07:48:18.765172', '2', '2', 2, '[{\"changed\": {\"fields\": [\"photo\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-06-12 07:48:28.509531', '1', '1', 2, '[{\"changed\": {\"fields\": [\"photo\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-06-12 07:49:34.147741', '1', '今天随笔', 2, '[{\"changed\": {\"fields\": [\"articlephoto\"]}}]', 6, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (10, 'account', 'myuser');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (9, 'album', 'albuminfo');
INSERT INTO `django_content_type` VALUES (6, 'article', 'articleinfo');
INSERT INTO `django_content_type` VALUES (8, 'article', 'articletag');
INSERT INTO `django_content_type` VALUES (7, 'article', 'comment');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'interflow', 'board');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-06-12 03:18:02.079819');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-06-12 03:18:04.078135');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2019-06-12 03:18:05.266296');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-06-12 03:18:13.020924');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-06-12 03:18:13.289639');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-06-12 03:18:13.622524');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-06-12 03:18:13.790972');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-06-12 03:18:13.867176');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-06-12 03:18:13.949394');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-06-12 03:18:14.118845');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2019-06-12 03:18:14.217106');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2019-06-12 03:18:15.132540');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2019-06-12 03:18:15.280937');
INSERT INTO `django_migrations` VALUES (14, 'account', '0001_initial', '2019-06-12 03:18:17.777578');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2019-06-12 03:18:25.898178');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0002_logentry_remove_auto_add', '2019-06-12 03:18:31.822939');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0003_logentry_add_action_flag_choices', '2019-06-12 03:18:31.902150');
INSERT INTO `django_migrations` VALUES (18, 'album', '0001_initial', '2019-06-12 03:18:32.798534');
INSERT INTO `django_migrations` VALUES (19, 'article', '0001_initial', '2019-06-12 03:18:36.693896');
INSERT INTO `django_migrations` VALUES (20, 'interflow', '0001_initial', '2019-06-12 03:18:46.906062');
INSERT INTO `django_migrations` VALUES (21, 'sessions', '0001_initial', '2019-06-12 03:18:48.633657');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('mbn53gl9gimwr2c1cwdnrwxbzvhwk8xh', 'OWFhODE1OWVmNzhhMDliZGZjZjViMDJjMmI4ZTU5YjIxZDQzM2ZkMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZmFhYzQyYTc0ZDliOGE5YWY1ZDc3YTMzZGU5MmUyMGEzNjU3MmJkIiwicmVhZGluZzExIjp0cnVlfQ==', '2019-06-26 07:46:31.457142');
INSERT INTO `django_session` VALUES ('mxr9egqz14bmtvla3pmoehy3guu7zjnv', 'NzZhOGViZDQ2MWI0N2JjMjQ0NWUzZDc3NzdkOGQ5MjQ0OWNmMmM1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZmFhYzQyYTc0ZDliOGE5YWY1ZDc3YTMzZGU5MmUyMGEzNjU3MmJkIn0=', '2019-06-27 03:57:06.855475');
INSERT INTO `django_session` VALUES ('qt9lq5k1t6buiuo1lr3dtcmtybna61is', 'NzZhOGViZDQ2MWI0N2JjMjQ0NWUzZDc3NzdkOGQ5MjQ0OWNmMmM1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZmFhYzQyYTc0ZDliOGE5YWY1ZDc3YTMzZGU5MmUyMGEzNjU3MmJkIn0=', '2019-06-26 10:00:58.802209');
INSERT INTO `django_session` VALUES ('ztup3mkgu4vegohf5hoe9wbu11uq7482', 'NzZhOGViZDQ2MWI0N2JjMjQ0NWUzZDc3NzdkOGQ5MjQ0OWNmMmM1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZmFhYzQyYTc0ZDliOGE5YWY1ZDc3YTMzZGU5MmUyMGEzNjU3MmJkIn0=', '2019-06-26 10:13:58.616690');

-- ----------------------------
-- Table structure for interflow_board
-- ----------------------------
DROP TABLE IF EXISTS `interflow_board`;
CREATE TABLE `interflow_board`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `interflow_board_user_id_46ec4dc1_fk_account_myuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `interflow_board_user_id_46ec4dc1_fk_account_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_myuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interflow_board
-- ----------------------------
INSERT INTO `interflow_board` VALUES (1, '小灰', '554301449@qq.com', '加油！！', '2019-06-12 08:54:09.521754', 1);

SET FOREIGN_KEY_CHECKS = 1;
