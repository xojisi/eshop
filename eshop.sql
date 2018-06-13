/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : eshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-06-13 09:59:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('3e8d94f9e4cc74d6acb9f8ce2308d6be427ac8d7', '2018-02-04 21:24:06.754572', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add content type', '3', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('8', 'Can change content type', '3', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete content type', '3', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('10', 'Can add session', '4', 'add_session');
INSERT INTO `auth_permission` VALUES ('11', 'Can change session', '4', 'change_session');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete session', '4', 'delete_session');
INSERT INTO `auth_permission` VALUES ('13', 'Can add 用户', '5', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('14', 'Can change 用户', '5', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete 用户', '5', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 短信验证码', '6', 'add_verifycode');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 短信验证码', '6', 'change_verifycode');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 短信验证码', '6', 'delete_verifycode');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播商品', '7', 'add_banner');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播商品', '7', 'change_banner');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播商品', '7', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can add goods', '8', 'add_goods');
INSERT INTO `auth_permission` VALUES ('23', 'Can change goods', '8', 'change_goods');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete goods', '8', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 商品类别', '9', 'add_goodscategory');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 商品类别', '9', 'change_goodscategory');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 商品类别', '9', 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 品牌', '10', 'add_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 品牌', '10', 'change_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 品牌', '10', 'delete_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 商品轮播图', '11', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 商品轮播图', '11', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 商品轮播图', '11', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 订单商品', '12', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 订单商品', '12', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 订单商品', '12', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 订单', '13', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 订单', '13', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 订单', '13', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 购物车', '14', 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 购物车', '14', 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 购物车', '14', 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 收货地址', '15', 'add_useraddress');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 收货地址', '15', 'change_useraddress');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 收货地址', '15', 'delete_useraddress');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 用户收藏', '16', 'add_userfav');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 用户收藏', '16', 'change_userfav');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 用户收藏', '16', 'delete_userfav');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户留言', '17', 'add_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户留言', '17', 'change_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户留言', '17', 'delete_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('52', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('53', 'Can view permission', '1', 'view_permission');
INSERT INTO `auth_permission` VALUES ('54', 'Can view content type', '3', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('55', 'Can view 轮播商品', '7', 'view_banner');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 商品', '8', 'view_goods');
INSERT INTO `auth_permission` VALUES ('57', 'Can view 商品类别', '9', 'view_goodscategory');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 品牌', '10', 'view_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 商品轮播图', '11', 'view_goodsimage');
INSERT INTO `auth_permission` VALUES ('60', 'Can view session', '4', 'view_session');
INSERT INTO `auth_permission` VALUES ('61', 'Can view 订单商品', '12', 'view_ordergoods');
INSERT INTO `auth_permission` VALUES ('62', 'Can view 订单', '13', 'view_orderinfo');
INSERT INTO `auth_permission` VALUES ('63', 'Can view 购物车', '14', 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 用户', '5', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('65', 'Can view 短信验证码', '6', 'view_verifycode');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 收货地址', '15', 'view_useraddress');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 用户收藏', '16', 'view_userfav');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 用户留言', '17', 'view_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 热搜词', '18', 'add_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 热搜词', '18', 'change_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 热搜词', '18', 'delete_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('72', 'Can add 首页商品类别广告', '19', 'add_indexad');
INSERT INTO `auth_permission` VALUES ('73', 'Can change 首页商品类别广告', '19', 'change_indexad');
INSERT INTO `auth_permission` VALUES ('74', 'Can delete 首页商品类别广告', '19', 'delete_indexad');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 热搜词', '18', 'view_hotsearchwords');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 首页商品类别广告', '19', 'view_indexad');
INSERT INTO `auth_permission` VALUES ('77', 'Can add Bookmark', '20', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('78', 'Can change Bookmark', '20', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete Bookmark', '20', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('80', 'Can add User Setting', '21', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('81', 'Can change User Setting', '21', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('82', 'Can delete User Setting', '21', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('83', 'Can add User Widget', '22', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('84', 'Can change User Widget', '22', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('85', 'Can delete User Widget', '22', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('86', 'Can add log entry', '23', 'add_log');
INSERT INTO `auth_permission` VALUES ('87', 'Can change log entry', '23', 'change_log');
INSERT INTO `auth_permission` VALUES ('88', 'Can delete log entry', '23', 'delete_log');
INSERT INTO `auth_permission` VALUES ('89', 'Can view Bookmark', '20', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('90', 'Can view log entry', '23', 'view_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can view User Setting', '21', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('92', 'Can view User Widget', '22', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can add log entry', '24', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('94', 'Can change log entry', '24', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete log entry', '24', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('96', 'Can view log entry', '24', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('97', 'Can add Token', '25', 'add_token');
INSERT INTO `auth_permission` VALUES ('98', 'Can change Token', '25', 'change_token');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete Token', '25', 'delete_token');
INSERT INTO `auth_permission` VALUES ('100', 'Can view Token', '25', 'view_token');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('24', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('3', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'goods', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'goodscategorybrand');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('18', 'goods', 'hotsearchwords');
INSERT INTO `django_content_type` VALUES ('19', 'goods', 'indexad');
INSERT INTO `django_content_type` VALUES ('4', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('12', 'trade', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('13', 'trade', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('14', 'trade', 'shoppingcart');
INSERT INTO `django_content_type` VALUES ('5', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES ('15', 'user_operation', 'useraddress');
INSERT INTO `django_content_type` VALUES ('16', 'user_operation', 'userfav');
INSERT INTO `django_content_type` VALUES ('17', 'user_operation', 'userleavingmessage');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-02-01 04:55:50.737151');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-02-01 04:55:50.930158');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-02-01 04:55:51.503768');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-02-01 04:55:51.595013');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-02-01 04:55:51.609050');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-02-01 04:55:51.623619');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-02-01 04:55:51.638125');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-02-01 04:55:51.643679');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-02-01 04:55:51.659184');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-02-01 04:55:51.675728');
INSERT INTO `django_migrations` VALUES ('11', 'goods', '0001_initial', '2018-02-01 04:55:52.452355');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-02-01 04:55:52.534567');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2018-02-01 04:55:53.181760');
INSERT INTO `django_migrations` VALUES ('14', 'trade', '0001_initial', '2018-02-01 04:55:53.439986');
INSERT INTO `django_migrations` VALUES ('15', 'trade', '0002_auto_20180201_1254', '2018-02-01 04:55:54.193949');
INSERT INTO `django_migrations` VALUES ('16', 'user_operation', '0001_initial', '2018-02-01 04:55:54.337832');
INSERT INTO `django_migrations` VALUES ('17', 'user_operation', '0002_auto_20180201_1254', '2018-02-01 04:55:55.185537');
INSERT INTO `django_migrations` VALUES ('18', 'goods', '0002_auto_20180201_1357', '2018-02-01 05:57:46.212218');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0001_initial', '2018-02-01 05:57:46.757672');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0002_log', '2018-02-01 05:57:47.020901');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0003_auto_20160715_0100', '2018-02-01 05:57:47.134662');
INSERT INTO `django_migrations` VALUES ('22', 'trade', '0003_auto_20180201_1409', '2018-02-01 14:10:22.984712');
INSERT INTO `django_migrations` VALUES ('23', 'goods', '0003_auto_20180201_1412', '2018-02-01 14:12:46.037259');
INSERT INTO `django_migrations` VALUES ('24', 'goods', '0004_auto_20180201_1413', '2018-02-01 14:13:58.516299');
INSERT INTO `django_migrations` VALUES ('25', 'admin', '0001_initial', '2018-02-01 16:32:29.827496');
INSERT INTO `django_migrations` VALUES ('26', 'admin', '0002_logentry_remove_auto_add', '2018-02-01 16:32:29.867638');
INSERT INTO `django_migrations` VALUES ('27', 'goods', '0005_auto_20180201_1632', '2018-02-01 16:32:29.901694');
INSERT INTO `django_migrations` VALUES ('28', 'goods', '0006_auto_20180201_1636', '2018-02-01 16:37:55.934233');
INSERT INTO `django_migrations` VALUES ('29', 'goods', '0007_auto_20180201_1637', '2018-02-01 16:37:55.954789');
INSERT INTO `django_migrations` VALUES ('30', 'authtoken', '0001_initial', '2018-02-04 20:49:57.436723');
INSERT INTO `django_migrations` VALUES ('31', 'authtoken', '0002_auto_20160226_1747', '2018-02-04 20:49:57.763123');
INSERT INTO `django_migrations` VALUES ('32', 'users', '0002_auto_20180205_2259', '2018-02-05 22:59:28.312608');
INSERT INTO `django_migrations` VALUES ('33', 'users', '0003_auto_20180206_1129', '2018-02-06 11:30:07.940245');
INSERT INTO `django_migrations` VALUES ('34', 'user_operation', '0003_auto_20180208_1914', '2018-02-08 19:14:48.709554');
INSERT INTO `django_migrations` VALUES ('35', 'user_operation', '0004_auto_20180210_2331', '2018-02-10 23:31:39.227181');
INSERT INTO `django_migrations` VALUES ('36', 'users', '0004_auto_20180210_2331', '2018-02-10 23:31:39.377261');
INSERT INTO `django_migrations` VALUES ('37', 'trade', '0004_auto_20180216_1904', '2018-02-16 19:04:45.722088');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('29q6hvufqvdxxeh05ka7274xkkz36uqc', 'NmNjZmFlMzc3Yzc5OGIyMTZmMGYzM2U4ZTQ2MWI3MGYxOTQ3ZjJkMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MDZmMTJlYjUzNjdmNjUzOGY1NDc3MWViNWIxZjEyYTdlMzBiN2MiLCJMSVNUX1FVRVJZIjpbWyJ0cmFkZSIsInNob3BwaW5nY2FydCJdLCIiXX0=', '2018-02-25 11:33:44.178719');
INSERT INTO `django_session` VALUES ('3fjfi3mf7suw2dlryh50x2juq77ka3rt', 'ZTRlM2U3ZjJlYjVhYmFmYTMzNTZlMDcwYTJkNjg2NDZiMGNmYTYyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MDZmMTJlYjUzNjdmNjUzOGY1NDc3MWViNWIxZjEyYTdlMzBiN2MiLCJMSVNUX1FVRVJZIjpbWyJnb29kcyIsImdvb2RzIl0sIiJdfQ==', '2018-02-20 19:09:53.301322');
INSERT INTO `django_session` VALUES ('3lbidq8voz70mw044so9g97daahabiho', 'MmFjYmVjNGJmODgxM2E4NTZkMmRjYWQyMTkxNGI0ODI3Mzc1MzA0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MDZmMTJlYjUzNjdmNjUzOGY1NDc3MWViNWIxZjEyYTdlMzBiN2MiLCJMSVNUX1FVRVJZIjpbWyJnb29kcyIsImluZGV4YWQiXSwiIl19', '2018-03-08 17:13:32.601364');
INSERT INTO `django_session` VALUES ('74z1a4yez6eiu9k87ah83wplg07q1jgo', 'YjdiZTZkYTA5N2Q3MmYzZGMyM2Y1ZmYzOTBjMDk5MDA5OThjMWYzNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMTRiNzE3MWEyNTZiYzljNWMxOTQ0YzgwZjQ2NGZlNmQ0MDBkNTU3In0=', '2018-04-23 19:52:08.110345');
INSERT INTO `django_session` VALUES ('8bvk4llvp5xxe0wxsd1mx94thq3icmtk', 'MTZkOTEzZGE1MGNjNjc3MzI1MWMxYmU3NTkzNjdiMzcyODEzYzE4Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MDZmMTJlYjUzNjdmNjUzOGY1NDc3MWViNWIxZjEyYTdlMzBiN2MiLCJMSVNUX1FVRVJZIjpbWyJ1c2VycyIsInVzZXJwcm9maWxlIl0sIl9jb2xzPWlkLnVzZXJuYW1lLmVtYWlsLmZpcnN0X25hbWUubGFzdF9uYW1lLmlzX3N0YWZmIl19', '2018-02-23 17:34:59.719530');
INSERT INTO `django_session` VALUES ('8ztapz2d2xy140zzmdad6d215fpc4hlr', 'NmNlYTNjMzlkZTZhNDc5ZDVkY2VkMjEzOWFlYjdlZDkyYTQyMGI0Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzA2ZjEyZWI1MzY3ZjY1MzhmNTQ3NzFlYjViMWYxMmE3ZTMwYjdjIiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJnb29kc2NhdGVnb3J5Il0sIiJdfQ==', '2018-02-15 14:45:24.063661');
INSERT INTO `django_session` VALUES ('a9uml0tue0mrwog4ni8u3fhd9t9oc401', 'MjhmOTlhOTdhOWQwYmVjN2QxY2I5ZWIwMmU1MTEwNzRiNWI2ZjU2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY3MDZmMTJlYjUzNjdmNjUzOGY1NDc3MWViNWIxZjEyYTdlMzBiN2MiLCJMSVNUX1FVRVJZIjpbWyJnb29kcyIsImdvb2RzIl0sInA9MSZfY29scz1uYW1lLmNsaWNrX251bS5zb2xkX251bS5mYXZfbnVtLmdvb2RzX251bS5tYXJrZXRfcHJpY2Uuc2hvcF9wcmljZS5pc19uZXcuaXNfaG90LmFkZF90aW1lLmdvb2RzX2Rlc2MiXX0=', '2018-02-20 20:20:45.799771');
INSERT INTO `django_session` VALUES ('nsm6fduppqrwbuukhie9b29aewc5zn7j', 'ODhhMThkOWE0NTgxNDlkNWZiMmMxNWYwNGFlOGYzNDJjYTVjY2UwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NzA2ZjEyZWI1MzY3ZjY1MzhmNTQ3NzFlYjViMWYxMmE3ZTMwYjdjIiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJnb29kcyJdLCIiXX0=', '2018-02-15 17:13:32.154173');

-- ----------------------------
-- Table structure for goods_banner
-- ----------------------------
DROP TABLE IF EXISTS `goods_banner`;
CREATE TABLE `goods_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_goods_id_99e23129_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_banner
-- ----------------------------
INSERT INTO `goods_banner` VALUES ('1', 'banner/banner1.jpg', '1', '2018-02-20 22:15:00.000000', '1');
INSERT INTO `goods_banner` VALUES ('2', 'banner/banner2.jpg', '2', '2018-02-20 22:25:00.000000', '1');
INSERT INTO `goods_banner` VALUES ('3', 'banner/banner3.jpg', '3', '2018-02-20 22:25:00.000000', '29');

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) NOT NULL,
  `name` varchar(300) NOT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext NOT NULL,
  `goods_desc` longtext NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES ('1', '2131251525225', '新鲜水果甜蜜香脆单果约800克', '2', '0', '0', '0', '232', '156', '食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/1_P_1449024889889.jpg', '0', '0', '2018-02-01 17:10:00.000000', '20');
INSERT INTO `goods_goods` VALUES ('2', '56868684869799889', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', '1', '0', '0', '0', '106', '88', '前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/2_P_1448945810202.jpg', '0', '0', '2018-02-01 17:10:00.000000', '7');
INSERT INTO `goods_goods` VALUES ('3', '', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', '1', '0', '0', '0', '286', '238', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/7_P_1448945104883.jpg', '0', '0', '2018-02-01 17:10:09.996015', '15');
INSERT INTO `goods_goods` VALUES ('4', '', '日本蒜蓉粉丝扇贝270克6只装', '0', '0', '0', '0', '156', '108', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/47_P_1448946213263.jpg', '0', '0', '2018-02-01 17:10:10.010584', '20');
INSERT INTO `goods_goods` VALUES ('5', '', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', '0', '0', '0', '0', '106', '88', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/10_P_1448944572085.jpg', '0', '0', '2018-02-01 17:10:10.021122', '7');
INSERT INTO `goods_goods` VALUES ('6', '', '乌拉圭进口牛肉卷特级肥牛卷', '0', '0', '0', '0', '90', '75', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/4_P_1448945381985.jpg', '0', '0', '2018-02-01 17:10:10.036131', '21');
INSERT INTO `goods_goods` VALUES ('7', '', '五星眼肉牛排套餐8片装原味原切生鲜牛肉', '0', '0', '0', '0', '150', '125', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/8_P_1448945032810.jpg', '0', '0', '2018-02-01 17:10:10.048152', '23');
INSERT INTO `goods_goods` VALUES ('8', '', '澳洲进口120天谷饲牛仔骨4份原味生鲜', '0', '0', '0', '0', '31', '26', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/11_P_1448944388277.jpg', '0', '0', '2018-02-01 17:10:10.059681', '7');
INSERT INTO `goods_goods` VALUES ('9', '', '潮香村澳洲进口牛排家庭团购套餐20片', '0', '0', '0', '0', '239', '199', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/6_P_1448945167279.jpg', '0', '0', '2018-02-01 17:10:10.075724', '22');
INSERT INTO `goods_goods` VALUES ('10', '456789809090', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', '0', '3', '0', '0', '202', '168', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/9_P_1448944791617.jpg', '0', '0', '2018-02-01 17:10:00.000000', '20');
INSERT INTO `goods_goods` VALUES ('11', '6666', '澳洲进口牛尾巴300g新鲜肥牛肉', '0', '300', '0', '0', '306', '255', '新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/3_P_1448945490837.jpg', '0', '0', '2018-02-01 17:10:00.000000', '2');
INSERT INTO `goods_goods` VALUES ('12', '', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', '0', '0', '0', '0', '126', '88', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/48_P_1448943988970.jpg', '0', '0', '2018-02-01 17:10:10.117338', '7');
INSERT INTO `goods_goods` VALUES ('13', '', '澳洲进口安格斯牛切片上脑牛排1000g', '0', '0', '0', '0', '144', '120', '澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/5_P_1448945270390.jpg', '0', '0', '2018-02-01 17:10:10.130373', '12');
INSERT INTO `goods_goods` VALUES ('14', '', '帐篷出租', '0', '0', '0', '0', '120', '100', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/53_P_1495068879687.jpg', '0', '0', '2018-02-01 17:10:10.144407', '21');
INSERT INTO `goods_goods` VALUES ('15', '', '52度茅台集团国隆双喜酒500mlx6', '1', '0', '0', '0', '23', '19', '贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/16_P_1448947194687.jpg', '0', '0', '2018-02-01 17:10:10.154433', '37');
INSERT INTO `goods_goods` VALUES ('16', '', '52度水井坊臻酿八號500ml', '1', '0', '0', '0', '43', '36', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/14_P_1448947354031.jpg', '0', '0', '2018-02-01 17:10:10.164460', '36');
INSERT INTO `goods_goods` VALUES ('17', '', '53度茅台仁酒500ml', '0', '0', '0', '0', '190', '158', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/12_P_1448947547989.jpg', '0', '0', '2018-02-01 17:10:10.176492', '32');
INSERT INTO `goods_goods` VALUES ('18', '', '双响炮洋酒JimBeamwhiskey美国白占边', '5', '0', '0', '0', '38', '28', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/46_P_1448946598711.jpg', '0', '0', '2018-02-01 17:10:10.185519', '29');
INSERT INTO `goods_goods` VALUES ('19', '', '西夫拉姆进口洋酒小酒版', '0', '0', '1', '0', '55', '46', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/21_P_1448946793276.jpg', '0', '0', '2018-02-01 17:10:10.197047', '36');
INSERT INTO `goods_goods` VALUES ('20', '', '茅台53度飞天茅台500ml', '0', '0', '0', '0', '22', '18', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/15_P_1448947257324.jpg', '0', '0', '2018-02-01 17:10:10.210084', '30');
INSERT INTO `goods_goods` VALUES ('21', '', '52度兰陵·紫气东来1600mL山东名酒', '0', '0', '0', '0', '42', '35', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/13_P_1448947460386.jpg', '0', '0', '2018-02-01 17:10:10.223123', '29');
INSERT INTO `goods_goods` VALUES ('22', '', 'JohnnieWalker尊尼获加黑牌威士忌', '0', '0', '0', '0', '24', '20', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/50_P_1448946543091.jpg', '0', '0', '2018-02-01 17:10:10.237691', '36');
INSERT INTO `goods_goods` VALUES ('23', '', '人头马CLUB特优香槟干邑350ml', '0', '0', '0', '0', '31', '26', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/51_P_1448946466595.jpg', '0', '0', '2018-02-01 17:10:10.250691', '30');
INSERT INTO `goods_goods` VALUES ('24', '', '张裕干红葡萄酒750ml*6支', '0', '0', '0', '0', '54', '45', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/17_P_1448947102246.jpg', '0', '0', '2018-02-01 17:10:10.263725', '31');
INSERT INTO `goods_goods` VALUES ('25', '', '原瓶原装进口洋酒烈酒法国云鹿XO白兰地', '0', '0', '0', '0', '46', '38', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/20_P_1448946850602.jpg', '0', '0', '2018-02-01 17:10:10.271745', '29');
INSERT INTO `goods_goods` VALUES ('26', '', '法国原装进口圣贝克干红葡萄酒750ml', '0', '0', '0', '0', '82', '68', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/19_P_1448946951581.jpg', '0', '0', '2018-02-01 17:10:10.281788', '25');
INSERT INTO `goods_goods` VALUES ('27', '', '法国百利威干红葡萄酒AOP级6支装', '0', '0', '0', '0', '67', '56', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/18_P_1448947011435.jpg', '0', '0', '2018-02-01 17:10:10.293315', '25');
INSERT INTO `goods_goods` VALUES ('28', '', '芝华士12年苏格兰威士忌700ml', '0', '0', '0', '0', '71', '59', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/22_P_1448946729629.jpg', '0', '0', '2018-02-01 17:10:10.301337', '30');
INSERT INTO `goods_goods` VALUES ('29', '', '深蓝伏特加巴维兰利口酒送预调酒', '0', '0', '0', '0', '31', '18', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/45_P_1448946661303.jpg', '0', '0', '2018-02-01 17:10:10.309861', '36');
INSERT INTO `goods_goods` VALUES ('30', '', '赣南脐橙特级果10斤装', '0', '0', '0', '0', '43', '36', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/32_P_1448948525620.jpg', '0', '0', '2018-02-01 17:10:10.318381', '62');
INSERT INTO `goods_goods` VALUES ('31', '', '泰国菠萝蜜16-18斤1个装', '0', '0', '0', '0', '11', '9', '【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/30_P_1448948663450.jpg', '0', '0', '2018-02-01 17:10:10.326904', '66');
INSERT INTO `goods_goods` VALUES ('32', '', '四川双流草莓新鲜水果礼盒2盒', '0', '0', '0', '0', '22', '18', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/31_P_1448948598947.jpg', '0', '0', '2018-02-01 17:10:10.340944', '70');
INSERT INTO `goods_goods` VALUES ('33', '', '新鲜头茬非洲冰草冰菜', '0', '0', '0', '0', '67', '56', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/35_P_1448948333610.jpg', '0', '0', '2018-02-01 17:10:10.353980', '58');
INSERT INTO `goods_goods` VALUES ('34', '', '仿真蔬菜水果果蔬菜模型', '0', '0', '0', '0', '6', '5', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/36_P_1448948234405.jpg', '0', '0', '2018-02-01 17:10:10.367011', '58');
INSERT INTO `goods_goods` VALUES ('35', '', '现摘芭乐番石榴台湾珍珠芭乐', '0', '0', '0', '0', '28', '23', '海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/33_P_1448948479966.jpg', '0', '0', '2018-02-01 17:10:10.378543', '62');
INSERT INTO `goods_goods` VALUES ('36', '24234236326366565656565', '潍坊萝卜5斤/箱礼盒', '0', '0', '0', '0', '46', '38', '脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/34_P_1448948399009.jpg', '1', '0', '2018-02-01 17:10:00.000000', '70');
INSERT INTO `goods_goods` VALUES ('37', '', '休闲零食膨化食品焦糖/奶油/椒麻味', '0', '0', '0', '0', '154', '99', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/43_P_1448948762645.jpg', '0', '0', '2018-02-01 17:10:10.400099', '74');
INSERT INTO `goods_goods` VALUES ('38', '', '蒙牛未来星儿童成长牛奶骨力型190ml*15盒', '0', '0', '0', '0', '84', '70', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/38_P_1448949220255.jpg', '0', '0', '2018-02-01 17:10:10.408625', '105');
INSERT INTO `goods_goods` VALUES ('39', '123112412423444433', '蒙牛特仑苏有机奶250ml×12盒', '0', '0', '0', '0', '70', '32', '蒙牛特仑苏有机奶250ml×12盒', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/44_P_1448948850187.jpg', '1', '0', '2018-02-01 17:10:00.000000', '103');
INSERT INTO `goods_goods` VALUES ('40', '', '1元支付测试商品', '0', '0', '0', '0', '1', '1', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'images/201511/goods_img/49_P_1448162819889.jpg', '0', '0', '2018-02-01 17:10:10.428174', '102');
INSERT INTO `goods_goods` VALUES ('41', '', '德运全脂新鲜纯牛奶1L*10盒装整箱', '0', '0', '0', '0', '70', '58', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/40_P_1448949038702.jpg', '0', '0', '2018-02-01 17:10:10.435696', '103');
INSERT INTO `goods_goods` VALUES ('42', '', '木糖醇红枣早餐奶即食豆奶粉538g', '0', '0', '0', '0', '38', '32', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/39_P_1448949115481.jpg', '0', '0', '2018-02-01 17:10:10.445220', '106');
INSERT INTO `goods_goods` VALUES ('43', '', '高钙液体奶200ml*24盒', '0', '0', '0', '0', '26', '22', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/41_P_1448948980358.jpg', '0', '0', '2018-02-01 17:10:10.453241', '107');
INSERT INTO `goods_goods` VALUES ('44', '', '新西兰进口全脂奶粉900g', '0', '0', '0', '0', '720', '600', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/37_P_1448949284365.jpg', '0', '0', '2018-02-01 17:10:10.462767', '104');
INSERT INTO `goods_goods` VALUES ('45', '', '伊利官方直营全脂营养舒化奶250ml*12盒*2提', '0', '0', '0', '0', '43', '36', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/42_P_1448948895193.jpg', '0', '0', '2018-02-01 17:10:10.470788', '103');
INSERT INTO `goods_goods` VALUES ('46', '23224224', '维纳斯橄榄菜籽油5L/桶', '0', '0', '0', '0', '187', '156', '维纳斯橄榄菜籽油5L/桶', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/27_P_1448947771805.jpg', '0', '1', '2018-02-01 17:10:00.000000', '51');
INSERT INTO `goods_goods` VALUES ('47', '', '糙米450gx3包粮油米面', '1', '0', '0', '0', '18', '15', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/23_P_1448948070348.jpg', '0', '0', '2018-02-01 17:10:10.490846', '41');
INSERT INTO `goods_goods` VALUES ('48', '', '精炼一级大豆油5L色拉油粮油食用油', '0', '0', '0', '0', '54', '45', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/26_P_1448947825754.jpg', '0', '0', '2018-02-01 17:10:10.498862', '56');
INSERT INTO `goods_goods` VALUES ('49', '22335679798765', '橄榄玉米油5L*2桶', '1', '0', '1', '0', '31', '26', '橄榄玉米油5L*2桶', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/28_P_1448947699948.jpg', '0', '1', '2018-02-01 17:10:00.000000', '54');
INSERT INTO `goods_goods` VALUES ('50', '1231241424', '山西黑米农家黑米4斤', '0', '0', '0', '0', '11', '9', '山西黑米农家黑米4斤', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/24_P_1448948023823.jpg', '0', '1', '2018-02-01 17:10:00.000000', '55');
INSERT INTO `goods_goods` VALUES ('51', '', '稻园牌稻米油粮油米糠油绿色植物油', '0', '0', '0', '0', '14', '12', '', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/25_P_1448947875346.jpg', '0', '0', '2018-02-01 17:10:10.531449', '47');
INSERT INTO `goods_goods` VALUES ('52', '123124141414124141251521', '融氏纯玉米胚芽油5l桶', '0', '0', '0', '0', '14', '12', '融氏纯玉米胚芽油5l桶', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/1(1)_20180206225748_884.jpg\" title=\"\" alt=\"1(1).jpg\"/> </p>', '1', 'goods/images/29_P_1448947631994.jpg', '0', '1', '2018-02-01 17:10:00.000000', '41');

-- ----------------------------
-- Table structure for goods_goodscategory
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategory`;
CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodscategory
-- ----------------------------
INSERT INTO `goods_goodscategory` VALUES ('1', '生鲜食品', 'sxsp', '', '1', '1', '2018-02-01 14:39:23.179863', null);
INSERT INTO `goods_goodscategory` VALUES ('2', '精品肉类', 'jprl', '', '2', '0', '2018-02-01 14:39:23.235013', '1');
INSERT INTO `goods_goodscategory` VALUES ('3', '羊肉', 'yr', '', '3', '0', '2018-02-01 14:39:23.240026', '2');
INSERT INTO `goods_goodscategory` VALUES ('4', '禽类', 'ql', '', '3', '0', '2018-02-01 14:39:23.243034', '2');
INSERT INTO `goods_goodscategory` VALUES ('5', '猪肉', 'zr', '', '3', '0', '2018-02-01 14:39:23.246042', '2');
INSERT INTO `goods_goodscategory` VALUES ('6', '牛肉', 'nr', '', '3', '0', '2018-02-01 14:39:23.249051', '2');
INSERT INTO `goods_goodscategory` VALUES ('7', '海鲜水产', 'hxsc', '', '2', '0', '2018-02-01 14:39:23.251056', '1');
INSERT INTO `goods_goodscategory` VALUES ('8', '参鲍', 'cb', '', '3', '0', '2018-02-01 14:39:23.254063', '7');
INSERT INTO `goods_goodscategory` VALUES ('9', '鱼', 'yu', '', '3', '0', '2018-02-01 14:39:23.257071', '7');
INSERT INTO `goods_goodscategory` VALUES ('10', '虾', 'xia', '', '3', '0', '2018-02-01 14:39:23.260080', '7');
INSERT INTO `goods_goodscategory` VALUES ('11', '蟹/贝', 'xb', '', '3', '0', '2018-02-01 14:39:23.263087', '7');
INSERT INTO `goods_goodscategory` VALUES ('12', '蛋制品', 'dzp', '', '2', '0', '2018-02-01 14:39:23.267097', '1');
INSERT INTO `goods_goodscategory` VALUES ('13', '松花蛋/咸鸭蛋', 'xhd_xyd', '', '3', '0', '2018-02-01 14:39:23.270106', '12');
INSERT INTO `goods_goodscategory` VALUES ('14', '鸡蛋', 'jd', '', '3', '0', '2018-02-01 14:39:23.272111', '12');
INSERT INTO `goods_goodscategory` VALUES ('15', '叶菜类', 'ycl', '', '2', '0', '2018-02-01 14:39:23.275116', '1');
INSERT INTO `goods_goodscategory` VALUES ('16', '生菜', 'sc', '', '3', '0', '2018-02-01 14:39:23.278124', '15');
INSERT INTO `goods_goodscategory` VALUES ('17', '菠菜', 'bc', '', '3', '0', '2018-02-01 14:39:23.281132', '15');
INSERT INTO `goods_goodscategory` VALUES ('18', '圆椒', 'yj', '', '3', '0', '2018-02-01 14:39:23.284144', '15');
INSERT INTO `goods_goodscategory` VALUES ('19', '西兰花', 'xlh', '', '3', '0', '2018-02-01 14:39:23.287151', '15');
INSERT INTO `goods_goodscategory` VALUES ('20', '根茎类', 'gjl', '', '2', '0', '2018-02-01 14:39:23.290160', '1');
INSERT INTO `goods_goodscategory` VALUES ('21', '茄果类', 'qgl', '', '2', '0', '2018-02-01 14:39:23.293166', '1');
INSERT INTO `goods_goodscategory` VALUES ('22', '菌菇类', 'jgl', '', '2', '0', '2018-02-01 14:39:23.295172', '1');
INSERT INTO `goods_goodscategory` VALUES ('23', '进口生鲜', 'jksx', '', '2', '0', '2018-02-01 14:39:23.298178', '1');
INSERT INTO `goods_goodscategory` VALUES ('24', '酒水饮料', 'jsyl', '酒水饮料', '1', '1', '2018-02-01 14:39:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('25', '白酒', 'bk', '', '2', '0', '2018-02-01 14:39:23.304193', '24');
INSERT INTO `goods_goodscategory` VALUES ('26', '五粮液', 'wly', '', '3', '0', '2018-02-01 14:39:23.307202', '25');
INSERT INTO `goods_goodscategory` VALUES ('27', '泸州老窖', 'lzlj', '', '3', '0', '2018-02-01 14:39:23.310210', '25');
INSERT INTO `goods_goodscategory` VALUES ('28', '茅台', 'mt', '', '3', '0', '2018-02-01 14:39:23.313218', '25');
INSERT INTO `goods_goodscategory` VALUES ('29', '葡萄酒', 'ptj', '', '2', '0', '2018-02-01 14:39:23.316226', '24');
INSERT INTO `goods_goodscategory` VALUES ('30', '洋酒', 'yj', '', '2', '0', '2018-02-01 14:39:23.318231', '24');
INSERT INTO `goods_goodscategory` VALUES ('31', '啤酒', 'pj', '', '2', '0', '2018-02-01 14:39:23.321239', '24');
INSERT INTO `goods_goodscategory` VALUES ('32', '其他酒品', 'qtjp', '', '2', '0', '2018-02-01 14:39:23.324247', '24');
INSERT INTO `goods_goodscategory` VALUES ('33', '其他品牌', 'qtpp', '', '3', '0', '2018-02-01 14:39:23.327255', '32');
INSERT INTO `goods_goodscategory` VALUES ('34', '黄酒', 'hj', '', '3', '0', '2018-02-01 14:39:23.330266', '32');
INSERT INTO `goods_goodscategory` VALUES ('35', '养生酒', 'ysj', '', '3', '0', '2018-02-01 14:39:23.332269', '32');
INSERT INTO `goods_goodscategory` VALUES ('36', '饮料/水', 'yls', '', '2', '0', '2018-02-01 14:39:23.335277', '24');
INSERT INTO `goods_goodscategory` VALUES ('37', '红酒', 'hj', '', '2', '0', '2018-02-01 14:39:23.338288', '24');
INSERT INTO `goods_goodscategory` VALUES ('38', '白兰地', 'bld', '', '3', '0', '2018-02-01 14:39:23.341296', '37');
INSERT INTO `goods_goodscategory` VALUES ('39', '威士忌', 'wsj', '', '3', '0', '2018-02-01 14:39:23.344304', '37');
INSERT INTO `goods_goodscategory` VALUES ('40', '粮油副食', '粮油副食', '', '1', '1', '2018-02-01 14:39:23.347309', null);
INSERT INTO `goods_goodscategory` VALUES ('41', '食用油', '食用油', '', '2', '0', '2018-02-01 14:39:23.349314', '40');
INSERT INTO `goods_goodscategory` VALUES ('42', '其他食用油', '其他食用油', '', '3', '0', '2018-02-01 14:39:23.352325', '41');
INSERT INTO `goods_goodscategory` VALUES ('43', '菜仔油', '菜仔油', '', '3', '0', '2018-02-01 14:39:23.355333', '41');
INSERT INTO `goods_goodscategory` VALUES ('44', '花生油', '花生油', '', '3', '0', '2018-02-01 14:39:23.358341', '41');
INSERT INTO `goods_goodscategory` VALUES ('45', '橄榄油', '橄榄油', '', '3', '0', '2018-02-01 14:39:23.361349', '41');
INSERT INTO `goods_goodscategory` VALUES ('46', '礼盒', '礼盒', '', '3', '0', '2018-02-01 14:39:23.363354', '41');
INSERT INTO `goods_goodscategory` VALUES ('47', '米面杂粮', '米面杂粮', '', '2', '0', '2018-02-01 14:39:23.366362', '40');
INSERT INTO `goods_goodscategory` VALUES ('48', '面粉/面条', '面粉/面条', '', '3', '0', '2018-02-01 14:39:23.369371', '47');
INSERT INTO `goods_goodscategory` VALUES ('49', '大米', '大米', '', '3', '0', '2018-02-01 14:39:23.372378', '47');
INSERT INTO `goods_goodscategory` VALUES ('50', '意大利面', '意大利面', '', '3', '0', '2018-02-01 14:39:23.375383', '47');
INSERT INTO `goods_goodscategory` VALUES ('51', '厨房调料', '厨房调料', '', '2', '0', '2018-02-01 14:39:23.377388', '40');
INSERT INTO `goods_goodscategory` VALUES ('52', '调味油/汁', '调味油/汁', '', '3', '0', '2018-02-01 14:39:23.380397', '51');
INSERT INTO `goods_goodscategory` VALUES ('53', '酱油/醋', '酱油/醋', '', '3', '0', '2018-02-01 14:39:23.383405', '51');
INSERT INTO `goods_goodscategory` VALUES ('54', '南北干货', '南北干货', '', '2', '0', '2018-02-01 14:39:23.386413', '40');
INSERT INTO `goods_goodscategory` VALUES ('55', '方便速食', '方便速食', '', '2', '0', '2018-02-01 14:39:23.388421', '40');
INSERT INTO `goods_goodscategory` VALUES ('56', '调味品', '调味品', '', '2', '0', '2018-02-01 14:39:23.391428', '40');
INSERT INTO `goods_goodscategory` VALUES ('57', '蔬菜水果', '蔬菜水果', '', '1', '1', '2018-02-01 14:39:23.394434', null);
INSERT INTO `goods_goodscategory` VALUES ('58', '有机蔬菜', '有机蔬菜', '', '2', '0', '2018-02-01 14:39:23.397442', '57');
INSERT INTO `goods_goodscategory` VALUES ('59', '西红柿', '西红柿', '', '3', '0', '2018-02-01 14:39:23.400450', '58');
INSERT INTO `goods_goodscategory` VALUES ('60', '韭菜', '韭菜', '', '3', '0', '2018-02-01 14:39:23.402455', '58');
INSERT INTO `goods_goodscategory` VALUES ('61', '青菜', '青菜', '', '3', '0', '2018-02-01 14:39:23.405465', '58');
INSERT INTO `goods_goodscategory` VALUES ('62', '精选蔬菜', '精选蔬菜', '', '2', '0', '2018-02-01 14:39:23.407472', '57');
INSERT INTO `goods_goodscategory` VALUES ('63', '甘蓝', '甘蓝', '', '3', '0', '2018-02-01 14:39:23.410477', '62');
INSERT INTO `goods_goodscategory` VALUES ('64', '胡萝卜', '胡萝卜', '', '3', '0', '2018-02-01 14:39:23.413484', '62');
INSERT INTO `goods_goodscategory` VALUES ('65', '黄瓜', '黄瓜', '', '3', '0', '2018-02-01 14:39:23.416492', '62');
INSERT INTO `goods_goodscategory` VALUES ('66', '进口水果', '进口水果', '', '2', '0', '2018-02-01 14:39:23.418497', '57');
INSERT INTO `goods_goodscategory` VALUES ('67', '火龙果', '火龙果', '', '3', '0', '2018-02-01 14:39:23.421505', '66');
INSERT INTO `goods_goodscategory` VALUES ('68', '菠萝蜜', '菠萝蜜', '', '3', '0', '2018-02-01 14:39:23.424513', '66');
INSERT INTO `goods_goodscategory` VALUES ('69', '奇异果', '奇异果', '', '3', '0', '2018-02-01 14:39:23.427524', '66');
INSERT INTO `goods_goodscategory` VALUES ('70', '国产水果', '国产水果', '', '2', '0', '2018-02-01 14:39:23.429529', '57');
INSERT INTO `goods_goodscategory` VALUES ('71', '水果礼盒', '水果礼盒', '', '3', '0', '2018-02-01 14:39:23.432535', '70');
INSERT INTO `goods_goodscategory` VALUES ('72', '苹果', '苹果', '', '3', '0', '2018-02-01 14:39:23.435544', '70');
INSERT INTO `goods_goodscategory` VALUES ('73', '雪梨', '雪梨', '', '3', '0', '2018-02-01 14:39:23.438551', '70');
INSERT INTO `goods_goodscategory` VALUES ('74', '休闲食品', '休闲食品', '', '1', '1', '2018-02-01 14:39:23.441560', null);
INSERT INTO `goods_goodscategory` VALUES ('75', '休闲零食', '休闲零食', '', '2', '0', '2018-02-01 14:39:23.444570', '74');
INSERT INTO `goods_goodscategory` VALUES ('76', '果冻', '果冻', '', '3', '0', '2018-02-01 14:39:23.446575', '75');
INSERT INTO `goods_goodscategory` VALUES ('77', '枣类', '枣类', '', '3', '0', '2018-02-01 14:39:23.449583', '75');
INSERT INTO `goods_goodscategory` VALUES ('78', '蜜饯', '蜜饯', '', '3', '0', '2018-02-01 14:39:23.456599', '75');
INSERT INTO `goods_goodscategory` VALUES ('79', '肉类零食', '肉类零食', '', '3', '0', '2018-02-01 14:39:23.462615', '75');
INSERT INTO `goods_goodscategory` VALUES ('80', '坚果炒货', '坚果炒货', '', '3', '0', '2018-02-01 14:39:23.468631', '75');
INSERT INTO `goods_goodscategory` VALUES ('81', '糖果', '糖果', '', '2', '0', '2018-02-01 14:39:23.475650', '74');
INSERT INTO `goods_goodscategory` VALUES ('82', '创意喜糖', '创意喜糖', '', '3', '0', '2018-02-01 14:39:23.477655', '81');
INSERT INTO `goods_goodscategory` VALUES ('83', '口香糖', '口香糖', '', '3', '0', '2018-02-01 14:39:23.480663', '81');
INSERT INTO `goods_goodscategory` VALUES ('84', '软糖', '软糖', '', '3', '0', '2018-02-01 14:39:23.483672', '81');
INSERT INTO `goods_goodscategory` VALUES ('85', '棒棒糖', '棒棒糖', '', '3', '0', '2018-02-01 14:39:23.486680', '81');
INSERT INTO `goods_goodscategory` VALUES ('86', '巧克力', '巧克力', '', '2', '0', '2018-02-01 14:39:23.489689', '74');
INSERT INTO `goods_goodscategory` VALUES ('87', '夹心巧克力', '夹心巧克力', '', '3', '0', '2018-02-01 14:39:23.491693', '86');
INSERT INTO `goods_goodscategory` VALUES ('88', '白巧克力', '白巧克力', '', '3', '0', '2018-02-01 14:39:23.494702', '86');
INSERT INTO `goods_goodscategory` VALUES ('89', '松露巧克力', '松露巧克力', '', '3', '0', '2018-02-01 14:39:23.496706', '86');
INSERT INTO `goods_goodscategory` VALUES ('90', '黑巧克力', '黑巧克力', '', '3', '0', '2018-02-01 14:39:23.499714', '86');
INSERT INTO `goods_goodscategory` VALUES ('91', '肉干肉脯/豆干', '肉干肉脯/豆干', '', '2', '0', '2018-02-01 14:39:23.501720', '74');
INSERT INTO `goods_goodscategory` VALUES ('92', '牛肉干', '牛肉干', '', '3', '0', '2018-02-01 14:39:23.505730', '91');
INSERT INTO `goods_goodscategory` VALUES ('93', '猪肉脯', '猪肉脯', '', '3', '0', '2018-02-01 14:39:23.507735', '91');
INSERT INTO `goods_goodscategory` VALUES ('94', '牛肉粒', '牛肉粒', '', '3', '0', '2018-02-01 14:39:23.510743', '91');
INSERT INTO `goods_goodscategory` VALUES ('95', '猪肉干', '猪肉干', '', '3', '0', '2018-02-01 14:39:23.513753', '91');
INSERT INTO `goods_goodscategory` VALUES ('96', '鱿鱼丝/鱼干', '鱿鱼丝/鱼干', '', '2', '0', '2018-02-01 14:39:23.519768', '74');
INSERT INTO `goods_goodscategory` VALUES ('97', '鱿鱼足', '鱿鱼足', '', '3', '0', '2018-02-01 14:39:23.522776', '96');
INSERT INTO `goods_goodscategory` VALUES ('98', '鱿鱼丝', '鱿鱼丝', '', '3', '0', '2018-02-01 14:39:23.525784', '96');
INSERT INTO `goods_goodscategory` VALUES ('99', '墨鱼/乌贼', '墨鱼/乌贼', '', '3', '0', '2018-02-01 14:39:23.528791', '96');
INSERT INTO `goods_goodscategory` VALUES ('100', '鱿鱼仔', '鱿鱼仔', '', '3', '0', '2018-02-01 14:39:23.531799', '96');
INSERT INTO `goods_goodscategory` VALUES ('101', '鱿鱼片', '鱿鱼片', '', '3', '0', '2018-02-01 14:39:23.534811', '96');
INSERT INTO `goods_goodscategory` VALUES ('102', '奶类食品', '奶类食品', '', '1', '0', '2018-02-01 14:39:23.536815', null);
INSERT INTO `goods_goodscategory` VALUES ('103', '进口奶品', '进口奶品', '', '2', '0', '2018-02-01 14:39:23.539820', '102');
INSERT INTO `goods_goodscategory` VALUES ('104', '国产奶品', '国产奶品', '', '2', '0', '2018-02-01 14:39:23.542828', '102');
INSERT INTO `goods_goodscategory` VALUES ('105', '奶粉', '奶粉', '', '2', '0', '2018-02-01 14:39:23.545836', '102');
INSERT INTO `goods_goodscategory` VALUES ('106', '有机奶', '有机奶', '', '2', '0', '2018-02-01 14:39:23.548844', '102');
INSERT INTO `goods_goodscategory` VALUES ('107', '原料奶', '原料奶', '', '2', '0', '2018-02-01 14:39:23.550850', '102');
INSERT INTO `goods_goodscategory` VALUES ('108', '天然干货', '天然干货', '', '1', '0', '2018-02-01 14:39:23.553858', null);
INSERT INTO `goods_goodscategory` VALUES ('110', '腌干海产', '腌干海产', '', '2', '0', '2018-02-01 14:39:23.559877', '108');
INSERT INTO `goods_goodscategory` VALUES ('111', '汤料', '汤料', '', '2', '0', '2018-02-01 14:39:23.562885', '108');
INSERT INTO `goods_goodscategory` VALUES ('112', '豆类', '豆类', '', '2', '0', '2018-02-01 14:39:23.564889', '108');
INSERT INTO `goods_goodscategory` VALUES ('113', '干菜/菜干', '干菜/菜干', '', '2', '0', '2018-02-01 14:39:23.571908', '108');
INSERT INTO `goods_goodscategory` VALUES ('114', '干果/果干', '干果/果干', '', '2', '0', '2018-02-01 14:39:23.577924', '108');
INSERT INTO `goods_goodscategory` VALUES ('115', '豆制品', '豆制品', '', '2', '0', '2018-02-01 14:39:23.583975', '108');
INSERT INTO `goods_goodscategory` VALUES ('116', '腊味', '腊味', '', '2', '0', '2018-02-01 14:39:23.589954', '108');
INSERT INTO `goods_goodscategory` VALUES ('117', '精选茗茶', '精选茗茶', '', '1', '0', '2018-02-01 14:39:23.595969', null);
INSERT INTO `goods_goodscategory` VALUES ('118', '白茶', '白茶', '', '2', '0', '2018-02-01 14:39:23.598978', '117');
INSERT INTO `goods_goodscategory` VALUES ('119', '红茶', '红茶', '', '2', '0', '2018-02-01 14:39:23.601985', '117');
INSERT INTO `goods_goodscategory` VALUES ('120', '绿茶', '绿茶', '', '2', '0', '2018-02-01 14:39:23.604997', '117');

-- ----------------------------
-- Table structure for goods_goodscategorybrand
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategorybrand`;
CREATE TABLE `goods_goodscategorybrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategoryb_category_id_528934b3_fk_goods_goo` (`category_id`),
  CONSTRAINT `goods_goodscategoryb_category_id_528934b3_fk_goods_goo` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodscategorybrand
-- ----------------------------
INSERT INTO `goods_goodscategorybrand` VALUES ('1', '艾尔', '艾尔', 'brands/sxsp-2.jpg', '2018-02-22 12:43:00.000000', '1');
INSERT INTO `goods_goodscategorybrand` VALUES ('2', '金赏', '金赏', 'brands/sxsp-1.jpg', '2018-02-22 12:46:00.000000', '1');
INSERT INTO `goods_goodscategorybrand` VALUES ('3', 'Prairie', 'Prairie', 'brands/lyfs-1.jpg', '2018-02-22 12:52:00.000000', '1');
INSERT INTO `goods_goodscategorybrand` VALUES ('4', '发育宝', '发育宝', 'brands/sxsp-3.jpg', '2018-02-22 12:52:00.000000', '24');
INSERT INTO `goods_goodscategorybrand` VALUES ('5', 'SUMMIT', 'SUMMIT', 'brands/scsg-3.jpg', '2018-02-22 12:53:00.000000', '24');
INSERT INTO `goods_goodscategorybrand` VALUES ('6', 'verus', 'verus', 'brands/scsg-2.jpg', '2018-02-22 12:53:00.000000', '24');
INSERT INTO `goods_goodscategorybrand` VALUES ('7', 'instrict', 'instrict', 'brands/lyfs-2.jpg', '2018-02-22 17:12:00.000000', '40');
INSERT INTO `goods_goodscategorybrand` VALUES ('8', 'SUMMIT', 'SUMMIT', 'brands/scsg-3_0q2kMgD.jpg', '2018-02-22 17:12:00.000000', '40');
INSERT INTO `goods_goodscategorybrand` VALUES ('9', '金赏', '金赏', 'brands/sxsp-1_ImgABJp.jpg', '2018-02-22 17:12:00.000000', '40');

-- ----------------------------
-- Table structure for goods_goodsimage
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsimage`;
CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodsimage
-- ----------------------------
INSERT INTO `goods_goodsimage` VALUES ('1', 'goods/images/1_P_1449024889889.jpg', '2018-02-01 17:10:09.961420', '1');
INSERT INTO `goods_goodsimage` VALUES ('2', '1_P_1449024889889.jpg', '2018-02-01 17:10:09.969945', '1');
INSERT INTO `goods_goodsimage` VALUES ('3', '1_P_1449024889889_Xv8xwHs.jpg', '2018-02-01 17:10:09.974957', '1');
INSERT INTO `goods_goodsimage` VALUES ('6', 'goods/images/2_P_1448945810202.jpg', '2018-02-01 17:10:09.988994', '2');
INSERT INTO `goods_goodsimage` VALUES ('7', '4_P_1448945381985.jpg', '2018-02-01 17:10:09.992001', '2');
INSERT INTO `goods_goodsimage` VALUES ('8', 'goods/images/7_P_1448945104883.jpg', '2018-02-01 17:10:10.004032', '3');
INSERT INTO `goods_goodsimage` VALUES ('9', 'goods/images/7_P_1448945104734.jpg', '2018-02-01 17:10:10.007544', '3');
INSERT INTO `goods_goodsimage` VALUES ('10', 'goods/images/47_P_1448946213263.jpg', '2018-02-01 17:10:10.015566', '4');
INSERT INTO `goods_goodsimage` VALUES ('11', 'goods/images/47_P_1448946213157.jpg', '2018-02-01 17:10:10.018114', '4');
INSERT INTO `goods_goodsimage` VALUES ('12', 'goods/images/10_P_1448944572085.jpg', '2018-02-01 17:10:10.026092', '5');
INSERT INTO `goods_goodsimage` VALUES ('13', 'goods/images/10_P_1448944572532.jpg', '2018-02-01 17:10:10.030103', '5');
INSERT INTO `goods_goodsimage` VALUES ('14', 'goods/images/10_P_1448944572872.jpg', '2018-02-01 17:10:10.033612', '5');
INSERT INTO `goods_goodsimage` VALUES ('15', 'goods/images/4_P_1448945381985.jpg', '2018-02-01 17:10:10.042135', '6');
INSERT INTO `goods_goodsimage` VALUES ('16', 'goods/images/4_P_1448945381013.jpg', '2018-02-01 17:10:10.045146', '6');
INSERT INTO `goods_goodsimage` VALUES ('17', 'goods/images/8_P_1448945032810.jpg', '2018-02-01 17:10:10.053166', '7');
INSERT INTO `goods_goodsimage` VALUES ('18', 'goods/images/8_P_1448945032646.jpg', '2018-02-01 17:10:10.056172', '7');
INSERT INTO `goods_goodsimage` VALUES ('19', 'goods/images/11_P_1448944388277.jpg', '2018-02-01 17:10:10.066200', '8');
INSERT INTO `goods_goodsimage` VALUES ('20', 'goods/images/11_P_1448944388034.jpg', '2018-02-01 17:10:10.068705', '8');
INSERT INTO `goods_goodsimage` VALUES ('21', 'goods/images/11_P_1448944388201.jpg', '2018-02-01 17:10:10.071736', '8');
INSERT INTO `goods_goodsimage` VALUES ('22', 'goods/images/6_P_1448945167279.jpg', '2018-02-01 17:10:10.081279', '9');
INSERT INTO `goods_goodsimage` VALUES ('23', 'goods/images/6_P_1448945167015.jpg', '2018-02-01 17:10:10.084749', '9');
INSERT INTO `goods_goodsimage` VALUES ('24', 'goods/images/9_P_1448944791617.jpg', '2018-02-01 17:10:10.092773', '10');
INSERT INTO `goods_goodsimage` VALUES ('25', 'goods/images/9_P_1448944791129.jpg', '2018-02-01 17:10:10.096780', '10');
INSERT INTO `goods_goodsimage` VALUES ('26', 'goods/images/9_P_1448944791077.jpg', '2018-02-01 17:10:10.099788', '10');
INSERT INTO `goods_goodsimage` VALUES ('27', 'goods/images/9_P_1448944791229.jpg', '2018-02-01 17:10:10.102797', '10');
INSERT INTO `goods_goodsimage` VALUES ('28', 'goods/images/3_P_1448945490837.jpg', '2018-02-01 17:10:10.111820', '11');
INSERT INTO `goods_goodsimage` VALUES ('29', 'goods/images/3_P_1448945490084.jpg', '2018-02-01 17:10:10.114831', '11');
INSERT INTO `goods_goodsimage` VALUES ('30', 'goods/images/48_P_1448943988970.jpg', '2018-02-01 17:10:10.121850', '12');
INSERT INTO `goods_goodsimage` VALUES ('31', 'goods/images/48_P_1448943988898.jpg', '2018-02-01 17:10:10.124858', '12');
INSERT INTO `goods_goodsimage` VALUES ('32', 'goods/images/48_P_1448943988439.jpg', '2018-02-01 17:10:10.127364', '12');
INSERT INTO `goods_goodsimage` VALUES ('33', 'goods/images/5_P_1448945270390.jpg', '2018-02-01 17:10:10.135386', '13');
INSERT INTO `goods_goodsimage` VALUES ('34', 'goods/images/5_P_1448945270067.jpg', '2018-02-01 17:10:10.138394', '13');
INSERT INTO `goods_goodsimage` VALUES ('35', 'goods/images/5_P_1448945270432.jpg', '2018-02-01 17:10:10.140897', '13');
INSERT INTO `goods_goodsimage` VALUES ('36', 'images/201705/goods_img/53_P_1495068879687.jpg', '2018-02-01 17:10:10.151427', '14');
INSERT INTO `goods_goodsimage` VALUES ('37', 'goods/images/16_P_1448947194687.jpg', '2018-02-01 17:10:10.160955', '15');
INSERT INTO `goods_goodsimage` VALUES ('38', 'goods/images/14_P_1448947354031.jpg', '2018-02-01 17:10:10.169473', '16');
INSERT INTO `goods_goodsimage` VALUES ('39', 'goods/images/14_P_1448947354433.jpg', '2018-02-01 17:10:10.172484', '16');
INSERT INTO `goods_goodsimage` VALUES ('40', 'goods/images/12_P_1448947547989.jpg', '2018-02-01 17:10:10.182547', '17');
INSERT INTO `goods_goodsimage` VALUES ('41', 'goods/images/46_P_1448946598711.jpg', '2018-02-01 17:10:10.190534', '18');
INSERT INTO `goods_goodsimage` VALUES ('42', 'goods/images/46_P_1448946598301.jpg', '2018-02-01 17:10:10.194039', '18');
INSERT INTO `goods_goodsimage` VALUES ('43', 'goods/images/21_P_1448946793276.jpg', '2018-02-01 17:10:10.203066', '19');
INSERT INTO `goods_goodsimage` VALUES ('44', 'goods/images/21_P_1448946793153.jpg', '2018-02-01 17:10:10.206573', '19');
INSERT INTO `goods_goodsimage` VALUES ('45', 'goods/images/15_P_1448947257324.jpg', '2018-02-01 17:10:10.217103', '20');
INSERT INTO `goods_goodsimage` VALUES ('46', 'goods/images/15_P_1448947257580.jpg', '2018-02-01 17:10:10.220108', '20');
INSERT INTO `goods_goodsimage` VALUES ('47', 'goods/images/13_P_1448947460386.jpg', '2018-02-01 17:10:10.228633', '21');
INSERT INTO `goods_goodsimage` VALUES ('48', 'goods/images/13_P_1448947460276.jpg', '2018-02-01 17:10:10.232139', '21');
INSERT INTO `goods_goodsimage` VALUES ('49', 'goods/images/13_P_1448947460353.jpg', '2018-02-01 17:10:10.234647', '21');
INSERT INTO `goods_goodsimage` VALUES ('50', 'goods/images/50_P_1448946543091.jpg', '2018-02-01 17:10:10.244173', '22');
INSERT INTO `goods_goodsimage` VALUES ('51', 'goods/images/50_P_1448946542182.jpg', '2018-02-01 17:10:10.247684', '22');
INSERT INTO `goods_goodsimage` VALUES ('52', 'goods/images/51_P_1448946466595.jpg', '2018-02-01 17:10:10.257207', '23');
INSERT INTO `goods_goodsimage` VALUES ('53', 'goods/images/51_P_1448946466208.jpg', '2018-02-01 17:10:10.260716', '23');
INSERT INTO `goods_goodsimage` VALUES ('54', 'goods/images/17_P_1448947102246.jpg', '2018-02-01 17:10:10.268737', '24');
INSERT INTO `goods_goodsimage` VALUES ('55', 'goods/images/20_P_1448946850602.jpg', '2018-02-01 17:10:10.278777', '25');
INSERT INTO `goods_goodsimage` VALUES ('56', 'goods/images/19_P_1448946951581.jpg', '2018-02-01 17:10:10.286800', '26');
INSERT INTO `goods_goodsimage` VALUES ('57', 'goods/images/19_P_1448946951726.jpg', '2018-02-01 17:10:10.289808', '26');
INSERT INTO `goods_goodsimage` VALUES ('58', 'goods/images/18_P_1448947011435.jpg', '2018-02-01 17:10:10.298331', '27');
INSERT INTO `goods_goodsimage` VALUES ('59', 'goods/images/22_P_1448946729629.jpg', '2018-02-01 17:10:10.306351', '28');
INSERT INTO `goods_goodsimage` VALUES ('60', 'goods/images/45_P_1448946661303.jpg', '2018-02-01 17:10:10.315878', '29');
INSERT INTO `goods_goodsimage` VALUES ('61', 'goods/images/32_P_1448948525620.jpg', '2018-02-01 17:10:10.323397', '30');
INSERT INTO `goods_goodsimage` VALUES ('62', 'goods/images/30_P_1448948663450.jpg', '2018-02-01 17:10:10.332420', '31');
INSERT INTO `goods_goodsimage` VALUES ('63', 'goods/images/30_P_1448948662571.jpg', '2018-02-01 17:10:10.335430', '31');
INSERT INTO `goods_goodsimage` VALUES ('64', 'goods/images/30_P_1448948663221.jpg', '2018-02-01 17:10:10.337972', '31');
INSERT INTO `goods_goodsimage` VALUES ('65', 'goods/images/31_P_1448948598947.jpg', '2018-02-01 17:10:10.346959', '32');
INSERT INTO `goods_goodsimage` VALUES ('66', 'goods/images/31_P_1448948598475.jpg', '2018-02-01 17:10:10.350971', '32');
INSERT INTO `goods_goodsimage` VALUES ('67', 'goods/images/35_P_1448948333610.jpg', '2018-02-01 17:10:10.360496', '33');
INSERT INTO `goods_goodsimage` VALUES ('68', 'goods/images/35_P_1448948333313.jpg', '2018-02-01 17:10:10.363504', '33');
INSERT INTO `goods_goodsimage` VALUES ('69', 'goods/images/36_P_1448948234405.jpg', '2018-02-01 17:10:10.371526', '34');
INSERT INTO `goods_goodsimage` VALUES ('70', 'goods/images/36_P_1448948234250.jpg', '2018-02-01 17:10:10.375033', '34');
INSERT INTO `goods_goodsimage` VALUES ('71', 'goods/images/33_P_1448948479966.jpg', '2018-02-01 17:10:10.384561', '35');
INSERT INTO `goods_goodsimage` VALUES ('72', 'goods/images/33_P_1448948479886.jpg', '2018-02-01 17:10:10.387068', '35');
INSERT INTO `goods_goodsimage` VALUES ('73', 'goods/images/34_P_1448948399009.jpg', '2018-02-01 17:10:10.397091', '36');
INSERT INTO `goods_goodsimage` VALUES ('74', 'goods/images/43_P_1448948762645.jpg', '2018-02-01 17:10:10.405614', '37');
INSERT INTO `goods_goodsimage` VALUES ('75', 'goods/images/38_P_1448949220255.jpg', '2018-02-01 17:10:10.414639', '38');
INSERT INTO `goods_goodsimage` VALUES ('76', 'goods/images/44_P_1448948850187.jpg', '2018-02-01 17:10:10.424667', '39');
INSERT INTO `goods_goodsimage` VALUES ('77', 'images/201511/goods_img/49_P_1448162819889.jpg', '2018-02-01 17:10:10.432688', '40');
INSERT INTO `goods_goodsimage` VALUES ('78', 'goods/images/40_P_1448949038702.jpg', '2018-02-01 17:10:10.441209', '41');
INSERT INTO `goods_goodsimage` VALUES ('79', 'goods/images/39_P_1448949115481.jpg', '2018-02-01 17:10:10.450233', '42');
INSERT INTO `goods_goodsimage` VALUES ('80', 'goods/images/41_P_1448948980358.jpg', '2018-02-01 17:10:10.459257', '43');
INSERT INTO `goods_goodsimage` VALUES ('81', 'goods/images/37_P_1448949284365.jpg', '2018-02-01 17:10:10.468281', '44');
INSERT INTO `goods_goodsimage` VALUES ('82', 'goods/images/42_P_1448948895193.jpg', '2018-02-01 17:10:10.478308', '45');
INSERT INTO `goods_goodsimage` VALUES ('83', 'goods/images/27_P_1448947771805.jpg', '2018-02-01 17:10:10.487378', '46');
INSERT INTO `goods_goodsimage` VALUES ('84', 'goods/images/23_P_1448948070348.jpg', '2018-02-01 17:10:10.495854', '47');
INSERT INTO `goods_goodsimage` VALUES ('85', 'goods/images/26_P_1448947825754.jpg', '2018-02-01 17:10:10.503376', '48');
INSERT INTO `goods_goodsimage` VALUES ('86', 'goods/images/28_P_1448947699948.jpg', '2018-02-01 17:10:10.512401', '49');
INSERT INTO `goods_goodsimage` VALUES ('87', 'goods/images/28_P_1448947699777.jpg', '2018-02-01 17:10:10.515447', '49');
INSERT INTO `goods_goodsimage` VALUES ('88', 'goods/images/24_P_1448948023823.jpg', '2018-02-01 17:10:10.523931', '50');
INSERT INTO `goods_goodsimage` VALUES ('89', 'goods/images/24_P_1448948023977.jpg', '2018-02-01 17:10:10.527439', '50');
INSERT INTO `goods_goodsimage` VALUES ('90', 'goods/images/25_P_1448947875346.jpg', '2018-02-01 17:10:10.540479', '51');
INSERT INTO `goods_goodsimage` VALUES ('91', 'goods/images/29_P_1448947631994.jpg', '2018-02-01 17:10:10.548998', '52');

-- ----------------------------
-- Table structure for goods_hotsearchwords
-- ----------------------------
DROP TABLE IF EXISTS `goods_hotsearchwords`;
CREATE TABLE `goods_hotsearchwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(20) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_hotsearchwords
-- ----------------------------
INSERT INTO `goods_hotsearchwords` VALUES ('1', '啤酒', '1', '2018-02-20 22:40:00.000000');
INSERT INTO `goods_hotsearchwords` VALUES ('2', '蔬菜', '2', '2018-02-20 22:40:00.000000');
INSERT INTO `goods_hotsearchwords` VALUES ('3', '牛奶', '3', '2018-02-20 22:40:00.000000');
INSERT INTO `goods_hotsearchwords` VALUES ('4', '水果', '4', '2018-02-20 22:40:00.000000');

-- ----------------------------
-- Table structure for goods_indexad
-- ----------------------------
DROP TABLE IF EXISTS `goods_indexad`;
CREATE TABLE `goods_indexad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` (`category_id`),
  KEY `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`),
  CONSTRAINT `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_indexad
-- ----------------------------
INSERT INTO `goods_indexad` VALUES ('1', '1', '3');
INSERT INTO `goods_indexad` VALUES ('2', '24', '24');
INSERT INTO `goods_indexad` VALUES ('3', '40', '52');

-- ----------------------------
-- Table structure for trade_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `trade_ordergoods`;
CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_ordergoods
-- ----------------------------

-- ----------------------------
-- Table structure for trade_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `trade_orderinfo`;
CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `pay_status` varchar(10) NOT NULL,
  `post_script` varchar(200) NOT NULL,
  `order_mount` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_orderinfo
-- ----------------------------

-- ----------------------------
-- Table structure for trade_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `trade_shoppingcart`;
CREATE TABLE `trade_shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_shoppingcart_user_id_goods_id_92225e66_uniq` (`user_id`,`goods_id`),
  KEY `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_shoppingcart
-- ----------------------------
INSERT INTO `trade_shoppingcart` VALUES ('6', '1', '2018-02-16 18:52:25.442262', '16', '1');
INSERT INTO `trade_shoppingcart` VALUES ('7', '1', '2018-02-16 18:52:35.454295', '4', '1');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$C2wbOQhR9cDR$GKVdAfx26LIFuOoFfjpeq7VdwbofFT2Y7cZzJkLZrP8=', '2018-04-09 19:52:08.106373', '1', 'admin', '', '', '1', '1', '2018-02-01 05:59:00.000000', 'xojisi', '2018-02-07', null, 'female', '271398289@qq.com');
INSERT INTO `users_userprofile` VALUES ('17', 'pbkdf2_sha256$36000$CRReQmkyvx2L$jbK069aaSDfjm8hT0qXCSMNm7Cfvab28oHITnan6xU8=', '2018-02-08 23:57:44.250904', '0', '18665245212', '', '', '0', '1', '2018-02-06 13:49:51.968346', 'jisi', null, '18665245212', 'male', null);

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES ('1', '296616', '18665245212', '2018-02-06 13:38:00.000000');
INSERT INTO `users_verifycode` VALUES ('3', '302666', '18665245212', '2018-02-06 13:49:14.356657');

-- ----------------------------
-- Table structure for user_operation_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_useraddress`;
CREATE TABLE `user_operation_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(100) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_usera_user_id_fe128593_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_useraddress
-- ----------------------------
INSERT INTO `user_operation_useraddress` VALUES ('1', '海南省', '海口市', '美兰区', '龙华路28号', '鸡丝', '18666677777', '2018-02-11 00:31:53.325666', '1');
INSERT INTO `user_operation_useraddress` VALUES ('3', '湖南省', '湘潭市', '岳塘区', '麻辣鸡丝', '1212312', '18666666666', '2018-02-11 00:47:39.774718', '1');

-- ----------------------------
-- Table structure for user_operation_userfav
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfav`;
CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_userfav_user_id_goods_id_2dbadda7_uniq` (`user_id`,`goods_id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userfav
-- ----------------------------
INSERT INTO `user_operation_userfav` VALUES ('8', '2018-02-08 19:21:24.358467', '19', '17');
INSERT INTO `user_operation_userfav` VALUES ('21', '2018-02-22 18:09:06.229531', '19', '1');
INSERT INTO `user_operation_userfav` VALUES ('22', '2018-02-22 18:16:06.289518', '49', '1');

-- ----------------------------
-- Table structure for user_operation_userleavingmessage
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userleavingmessage`;
CREATE TABLE `user_operation_userleavingmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userl_user_id_70d909d6_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_userl_user_id_70d909d6_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userleavingmessage
-- ----------------------------
INSERT INTO `user_operation_userleavingmessage` VALUES ('1', '1', '咨询', '咨询一个,东北的山东大梨是否还有库存.?', 'message/images/timg.jpg', '2018-02-10 23:28:00.000000', '1');
INSERT INTO `user_operation_userleavingmessage` VALUES ('3', '1', '这是一个留言', '这是一个留言', '', '2018-02-10 23:41:00.000000', '1');
INSERT INTO `user_operation_userleavingmessage` VALUES ('4', '4', '什么时候才能发货?', '订单号:XXXXXXXXX', '', '2018-02-10 23:46:51.816016', '1');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-02-03 13:14:31.441270', '127.0.0.1', '121', '生鲜食品', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-02-03 13:15:24.469923', '127.0.0.1', '121', '生鲜食品', 'change', '修改 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-02-03 13:17:01.822636', '127.0.0.1', '121', '生鲜食品', 'change', '修改 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-02-03 14:16:42.259897', '127.0.0.1', '144', '酒水饮料', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-02-03 14:17:02.496636', '127.0.0.1', '160', '粮油副食', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-02-03 14:17:06.747064', '127.0.0.1', '177', '蔬菜水果', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-02-03 14:17:10.036157', '127.0.0.1', '194', '休闲食品', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-02-03 14:52:37.917916', '127.0.0.1', null, '', 'delete', '批量删除 25 个 商品类别', null, '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-02-03 15:00:28.420880', '127.0.0.1', null, '', 'delete', '批量删除 24 个 商品类别', null, '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-02-03 15:01:28.723234', '127.0.0.1', null, '', 'delete', '批量删除 22 个 商品类别', null, '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-02-03 15:03:02.394157', '127.0.0.1', null, '', 'delete', '批量删除 7 个 商品类别', null, '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-02-03 15:09:38.469210', '127.0.0.1', null, '', 'delete', '批量删除 1 个 商品类别', null, '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-02-03 15:09:47.586515', '127.0.0.1', '24', '酒水饮料', 'change', '修改 desc 和 is_tab', '9', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-02-04 11:33:14.286897', '127.0.0.1', '11', '澳洲进口牛尾巴300g新鲜肥牛肉', 'change', '修改 goods_sn，sold_num 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-02-04 11:34:21.178980', '127.0.0.1', '10', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', 'change', '修改 goods_sn，sold_num，goods_brief 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-02-05 23:01:21.850307', '127.0.0.1', '1', 'admin', 'change', '修改 last_login 和 gender', '5', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-02-06 10:56:04.304815', '127.0.0.1', '2', '123333', 'create', '已添加', '6', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-02-06 10:57:20.600972', '127.0.0.1', '2', '123333', 'change', '修改 mobile', '6', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-02-06 10:59:18.261106', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-02-06 11:06:17.027908', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-02-06 11:08:35.277883', '127.0.0.1', null, '', 'delete', '批量删除 1 个 短信验证码', null, '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-02-06 11:09:00.963422', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-02-06 11:21:48.531942', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-02-06 11:21:54.001128', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-02-06 11:31:46.916250', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-02-06 11:31:52.539799', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-02-06 11:33:19.998371', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-02-06 11:33:24.070627', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-02-06 12:07:00.125670', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-02-06 12:07:04.043156', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-02-06 12:08:59.515710', '127.0.0.1', '1', '296616', 'change', '没有数据变化', '6', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-02-06 12:09:06.364371', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-02-06 12:13:36.132107', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-02-06 12:13:40.717305', '127.0.0.1', '1', '296616', 'change', '没有数据变化', '6', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-02-06 12:15:55.488684', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-02-06 12:19:56.462324', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-02-06 12:21:39.488381', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-02-06 12:24:01.288917', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-02-06 12:27:08.711255', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-02-06 12:30:56.886815', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-02-06 12:43:31.078296', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-02-06 12:44:00.683551', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-02-06 12:46:49.193773', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-02-06 13:38:44.324223', '127.0.0.1', '1', '296616', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-02-06 13:44:24.868952', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户', null, '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-02-06 15:37:03.534665', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_sn 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-02-06 17:20:57.231459', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-02-06 17:23:14.932436', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '修改 goods_sn 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-02-06 17:33:21.196313', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-02-06 17:34:24.429577', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-02-06 17:35:46.693946', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '没有数据变化', '8', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-02-06 17:38:45.018409', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-02-06 17:40:11.755194', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-02-06 19:09:52.443037', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-02-06 19:46:48.590947', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-02-06 20:01:28.746616', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-02-06 20:11:13.959482', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-02-06 20:20:24.024846', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-02-06 22:38:10.075164', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-02-06 22:57:49.823243', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-02-06 23:01:19.838959', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '没有数据变化', '8', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-02-06 23:10:02.333525', '127.0.0.1', '52', '融氏纯玉米胚芽油5l桶', 'change', '修改 goods_sn 和 goods_brief', '8', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-02-06 23:10:10.149320', '127.0.0.1', '50', '山西黑米农家黑米4斤', 'change', '修改 goods_sn 和 goods_brief', '8', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-02-06 23:10:20.068673', '127.0.0.1', '49', '橄榄玉米油5L*2桶', 'change', '修改 goods_sn 和 goods_brief', '8', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-02-06 23:10:29.840669', '127.0.0.1', '46', '维纳斯橄榄菜籽油5L/桶', 'change', '修改 goods_sn 和 goods_brief', '8', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-02-09 00:11:56.175278', '127.0.0.1', '12', 'admin', 'create', '已添加', '16', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-02-09 00:15:23.900861', '127.0.0.1', '13', 'admin', 'create', '已添加', '16', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-02-10 23:29:34.536931', '127.0.0.1', '1', '咨询', 'create', '已添加', '17', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2018-02-10 23:41:39.447101', '127.0.0.1', '3', '这是一个留言', 'create', '已添加', '17', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2018-02-20 22:25:24.916096', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2018-02-20 22:25:42.825737', '127.0.0.1', '2', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2018-02-20 22:26:06.098617', '127.0.0.1', '3', '深蓝伏特加巴维兰利口酒送预调酒', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2018-02-20 22:31:58.515231', '127.0.0.1', '36', '潍坊萝卜5斤/箱礼盒', 'change', '修改 goods_sn 和 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2018-02-20 22:33:16.725336', '127.0.0.1', '39', '蒙牛特仑苏有机奶250ml×12盒', 'change', '修改 goods_sn，goods_brief 和 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2018-02-20 22:40:37.701725', '127.0.0.1', '1', '啤酒', 'create', '已添加', '18', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2018-02-20 22:40:41.226696', '127.0.0.1', '2', '蔬菜', 'create', '已添加', '18', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2018-02-20 22:40:44.542844', '127.0.0.1', '3', '牛奶', 'create', '已添加', '18', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2018-02-20 22:40:48.403580', '127.0.0.1', '4', '水果', 'create', '已添加', '18', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2018-02-22 12:46:52.797943', '127.0.0.1', '1', '艾尔', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2018-02-22 12:50:05.363989', '127.0.0.1', '2', '金赏', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2018-02-22 12:52:36.467724', '127.0.0.1', '3', 'Prairie', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2018-02-22 12:53:16.861918', '127.0.0.1', '4', '发育宝', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2018-02-22 12:53:35.170838', '127.0.0.1', '5', 'SUMMIT', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2018-02-22 12:53:51.244132', '127.0.0.1', '6', 'verus', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2018-02-22 13:27:04.235934', '127.0.0.1', '1', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'create', '已添加', '19', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2018-02-22 13:27:24.501878', '127.0.0.1', '2', '张裕干红葡萄酒750ml*6支', 'create', '已添加', '19', '1');
INSERT INTO `xadmin_log` VALUES ('87', '2018-02-22 17:12:33.957993', '127.0.0.1', '7', 'instrict', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('88', '2018-02-22 17:12:43.678549', '127.0.0.1', '8', 'SUMMIT', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('89', '2018-02-22 17:13:03.157084', '127.0.0.1', '9', '金赏', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('90', '2018-02-22 17:13:32.375764', '127.0.0.1', '3', '融氏纯玉米胚芽油5l桶', 'create', '已添加', '19', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
