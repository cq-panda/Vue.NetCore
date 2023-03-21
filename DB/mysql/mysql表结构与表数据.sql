/*
 Navicat Premium Data Transfer

 Source Server         : 120
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 120.53.251.208:3306
 Source Schema         : netcoredev

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 08/09/2022 19:22:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for App_Appointment
-- ----------------------------
DROP TABLE IF EXISTS `App_Appointment`;
CREATE TABLE `App_Appointment`  (
  `Id` varchar(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Describe` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_Appointment
-- ----------------------------
INSERT INTO `App_Appointment` VALUES ('08d9fcbc-b5e9-4833-8bfb-3b3ce77bc704', '2022-03-03 10:22:48', 1, '超级管理员', '古埃及第十九王朝法老第三位法老，杰出的政治家、军事家、文学家、诗人、建筑家，其执政时期是埃及新王国最后的强盛年', '超级管理员', '2022-03-03 10:24:14', 1, '拉美西斯', '1388888888');
INSERT INTO `App_Appointment` VALUES ('08d9fcbc-b5eb-4c1f-80bc-3c5029d935e7', '2022-03-03 10:22:48', 1, '超级管理员', '奈菲尔塔利（Nefertari ）是古埃及著名法老，拉美西斯二世八位王后中唯一一个拥有神庙的王后', '超级管理员', '2022-03-03 10:24:16', 1, '奈菲尔塔利', '1399999999');
INSERT INTO `App_Appointment` VALUES ('08da0e85-17db-4da5-85ed-1400a5fce2c5', '2022-03-26 01:30:02', 1, '超级管理员', '人中吕布,马中赤兔,方天画戟,专杀义父', '超级管理员', '2022-03-26 01:32:55', 1, '人中吕布', '13777777777');
INSERT INTO `App_Appointment` VALUES ('08da0e85-17db-4e08-8b4e-450a5f98f8ba', '2022-03-26 01:30:02', 1, '超级管理员', '非礼啊!非礼啊!非礼啊!', '超级管理员', '2022-03-26 01:32:57', 1, '貂蝉西施', '13666666666');

-- ----------------------------
-- Table structure for App_Expert
-- ----------------------------
DROP TABLE IF EXISTS `App_Expert`;
CREATE TABLE `App_Expert`  (
  `ExpertId` int(11) NOT NULL AUTO_INCREMENT,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `AuditStatus` int(11) NOT NULL,
  `Auditor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Certificate` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Education` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NOT NULL,
  `ExpertName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HeadImageUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IDNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `PhoneNo` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Professional` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReallyName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Resume` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SpecialField` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserTrueName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ExpertId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_Expert
-- ----------------------------
INSERT INTO `App_Expert` VALUES (275, '2018-09-07 10:58:17', 1, 1, '测试超级管理员', NULL, '上海市', '中国农业大学', '2018-09-04 15:49:44', 3344, 'User31110458', '博士', 1, '宫本七号', 'Upload/Tables/App_Expert/202103061750152777/head2.jpg', '150124199911110116', '超级管理员', '2021-03-07 21:55:31', 1, '1388886666', '教授', '拉美西斯', '二十九岁,对于一个人男人而言不算老,可是对于爱情来说已是风烛残年', 'Upload/Tables/App_Expert/201911271400081947/启用图片支持 (1).xlsx', '13381277739', 'User31110458', 3344);
INSERT INTO `App_Expert` VALUES (276, '2019-09-22 22:30:08', 3362, 1, 'zs', '', '北京市', '窦天宝传奇', '2018-09-18 17:45:54', 3358, '较瘦', '小学', 1, '榴莲', 'Upload/Tables/App_Expert/202109221608498894/c6dd920b17825b5801e97b400897ed03_t.gif', '250124123911110121', '超级管理员', '2021-09-24 11:09:48', 1, '1388887777', '演员', '木兰', '还没想好', 'Upload/Tables/App_Expert/201912111717154170/exceltest.xlsx', '17612519002', '较瘦', 3358);
INSERT INTO `App_Expert` VALUES (280, NULL, NULL, 0, NULL, NULL, '北京市', NULL, '2021-03-06 17:52:07', 1, '超级管理员', NULL, 1, '女秘书', 'Upload/Tables/App_Expert/202103061753415708/060222.jpg', NULL, '超级管理员', '2021-12-30 11:26:21', 1, '1388888888', NULL, '女秘书', '嗯？嗯？嗯？嗯？嗯？', NULL, '17612519001', NULL, NULL);

-- ----------------------------
-- Table structure for App_News
-- ----------------------------
DROP TABLE IF EXISTS `App_News`;
CREATE TABLE `App_News`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BigImageUrls` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DailyRecommend` tinyint(4) NOT NULL,
  `DetailUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `ImageUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `NewsType` int(11) NOT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ReleaseDate` datetime(0) NULL DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ViewCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73804 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_News
-- ----------------------------
INSERT INTO `App_News` VALUES (73799, NULL, NULL, '<p style=\"line-height:2;\"><br/></p><p style=\"line-height:2;\"><img src=\"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0419%2Fe8ae745dj00rakxnm0058d000rs00fnp.jpg&amp;thumbnail=660x2147483647&amp;quality=80&amp;type=jpg\"/><br/></p><p style=\"line-height:2;\">开发商Studio Wildcard宣布《方舟：终极幸存者版》将于2022年9月登录任天堂Switch，发售实体版和数字版，售价49.99美元，原版游戏所有者可以免费升级。</p><p style=\"line-height:2;\">《方舟：终极幸存者版》包含了本体《方舟：生存进化》及其所有大型扩展包Scorched Earth、Aberration、Extinction 和 Genesis Parts 1&amp;2，其中Scorched Earth扩展包将在游戏发售时发布，随后的扩展包将每隔两个月发布一次。</p><p style=\"line-height:2;\">拥有原版《方舟：生存进化》的玩家可能会记得，这款游戏自Switch版上线以来一直处于很糟糕的状态。幸运的是，Studio Wildcard已经与第三方开发商合作，重新编写了Switch上的整体代码，并在最新版本的虚幻4上进行开发。计划对功能、图形和优化进行完整的修改。此外，所有现有的Switch进度和存档数据将被保留至新版。</p><p style=\"line-height:2;\">不过最新新版游戏的质量如何，还是需要等发售之后实测才会知道，毕竟虚幻4引擎的游戏在switch上流畅运行，对于开发商来说真的是一个很大的挑战。</p>', '2022-04-20 01:49:23', 1, '超级管理员', 1, 'static/news/20220420/0949288120.html', 1, 'Upload/Tables/App_News/202204201140571762/20-05.png', '超级管理员', '2022-04-20 09:51:16', 1, 1, NULL, NULL, '重写代码可免费升级！《方舟终极版》9月登录Switch', NULL);
INSERT INTO `App_News` VALUES (73800, NULL, NULL, '<p style=\"line-height:2.5;\"><span style=\"color: var(--el-text-color-regular);\"><br/></span></p><ul><li><span style=\"color: var(--el-text-color-regular);\">用框架之前尽量会一些简单vue基础语法，如果不会vue项目不复杂也不影响使用框架</span></li></ul><p><br/></p><ul><li>后台：会熟练写C#代码就没问题</li></ul><p><br/></p><ul><li>前端Vue语法学习方式，<span style=\"color: var(--el-text-color-regular);\">直接在框架上添加页面以脚手架的方式来学习Vue</span></li></ul><p><br/></p><p style=\"line-height:2.5;\"><b>刚入门前端的先学会这些就够了</b></p><p style=\"line-height:2.5;\"><span style=\"color: var(--el-text-color-regular);\">1.</span><span style=\"font-size: 14px; color: var(--el-text-color-regular);\">基础语法</span></p><p style=\"line-height:2.5;\"></p><p style=\"line-height:2.5;\">&nbsp; &nbsp; &nbsp; v-model  v-for  v-if  v-else-if  v-show&nbsp;</p><p style=\"line-height:2.5;\">&nbsp; &nbsp; &nbsp; @click  slot  ref  class  style\n</p><p style=\"line-height:2.5;\">2.子父组件传参</p><p style=\"line-height:2.5;\"><span style=\"color: var(--el-text-color-regular);\">&nbsp; &nbsp; &nbsp;props、$emit、$refs</span></p><p style=\"line-height:2.5;\">3、生命周期</p><p style=\"line-height:2.5;\">&nbsp; &nbsp; &nbsp;created、mounted、destroyed、activated<br/></p><p style=\"line-height:2.5;\">4、创建Vue页面、Vue组件(页面)引用</p>', '2022-04-21 10:36:28', 1, '超级管理员', 1, 'static/news/20220421/1044487732.html', 1, 'Upload/Tables/App_News/202204211047116801/v.png', '超级管理员', '2022-04-21 10:59:05', 1, 1, NULL, NULL, '前端Vue与后台学习方式与一些基础语法问题', NULL);
INSERT INTO `App_News` VALUES (73801, NULL, NULL, '<div style=\"\"><br/></div><ul style=\"\"><li>202-05-03 11:41:43&nbsp;优化vue3版本权限分配页面区分app菜单</li><li>202-05-03 11:41:03&nbsp;优化vue2版本权限分配页面区分app菜单</li><li>202-05-03 11:13:08&nbsp;增加vue3版本volform输入框inputStyle属性</li><li>202-05-03 10:56:33&nbsp;增加vue3版本voltable组件textarea编辑类型</li><li>202-05-03 10:46:14&nbsp;移除多余设置默认值的操作</li><li>202-05-03 10:36:37&nbsp;优化移动端权限名不区分大小写</li><li>202-05-03 10:33:18&nbsp;优化移动端保存前方法</li><li>202-05-03 10:31:50&nbsp;增加移动端表单组件ref属性</li><li>202-05-03 10:29:44&nbsp;屏蔽代码生成器生成dto功能</li><li>202-05-03 03:50:26<p>vue3版本集成signalR(消息推送),更新文件:</p><p>package.json、router/index.js、views/index.vue、views/Home.vue、views/index/index.less、Startup.cs、appsettings.json、</p>Hubs/HomePageMessageHub.cs、views/index文件夹、views/signalR/Index.vue</li></ul>', '2022-05-06 15:46:30', 1, '超级管理员', 0, 'static/news/20220506/1546322571.html', 1, 'Upload/Tables/App_News/202205061555467266/vl.png', '超级管理员', '2022-05-06 15:56:56', 1, 1, NULL, NULL, '2022.05增加首页消息推送(signalr)功能可实时发送消息', NULL);
INSERT INTO `App_News` VALUES (73802, NULL, NULL, '<div><br/></div><ul><li>增加自定义列显示与顺序、菜单右键关闭功能、tabs与菜单联功动能</li><li>具体见演示地址或更新日志</li></ul>', '2022-05-29 23:28:07', 1, '超级管理员', 1, NULL, 1, 'Upload/Tables/App_News/202205292342573890/QQ图片20220529233342.png', '超级管理员', '2022-05-29 23:30:51', 1, 1, NULL, NULL, '2022.05增加自定义列显示与顺序、菜单右键关闭功能、tabs与菜单联功动能', NULL);

-- ----------------------------
-- Table structure for App_ReportPrice
-- ----------------------------
DROP TABLE IF EXISTS `App_ReportPrice`;
CREATE TABLE `App_ReportPrice`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Age` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `City` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Price` decimal(10, 0) NOT NULL,
  `Variety` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_ReportPrice
-- ----------------------------
INSERT INTO `App_ReportPrice` VALUES (67, '12-16月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '忻州市', '2018-09-10 10:12:50', 3344, '啊啊啊', 0, '超级管理员', '2021-11-10 10:04:43', 1, 29, '运动相机');
INSERT INTO `App_ReportPrice` VALUES (74, '7-12月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '唐山市', '2019-07-11 18:25:35', 1, '超级管理员', 0, '超级管理员', '2021-11-10 10:04:17', 1, 65, '数码相机');
INSERT INTO `App_ReportPrice` VALUES (75, '7-12月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '北京市', '2019-07-11 18:28:53', 1, '超级管理员', 1, '超级管理员', '2021-11-10 10:04:13', 1, 43, '单反相机');
INSERT INTO `App_ReportPrice` VALUES (83, '12-16月龄', '2019-10-21 16:41:22', 1, 1, '超级管理员', '天津市', '2019-07-26 13:20:43', 1, '超级管理员', 1, '超级管理员', '2021-11-10 10:04:08', 1, 12, '运动相机');
INSERT INTO `App_ReportPrice` VALUES (85, '0-2月龄', '2019-10-21 16:42:04', 1, 2, '超级管理员', '天津市', '2019-10-21 16:41:48', 1, '超级管理员', 1, '超级管理员', '2021-11-10 10:04:05', 1, 23, '影棚器材');

-- ----------------------------
-- Table structure for App_Transaction
-- ----------------------------
DROP TABLE IF EXISTS `App_Transaction`;
CREATE TABLE `App_Transaction`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CowType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Describe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Quantity` int(11) NOT NULL,
  `TransactionType` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_Transaction
-- ----------------------------
INSERT INTO `App_Transaction` VALUES (4, '3', '2019-09-18 18:10:01', 1, '超级管理员', '寒江孤影，江湖故人....', NULL, '超级管理员', '2022-03-31 16:56:04', 1, '小小*鸭', '13419098123', 25, 0);
INSERT INTO `App_Transaction` VALUES (5, '1', '2019-09-18 18:10:01', 1, '超级管理员', '闻着臭，吃着更臭。。。。。', NULL, '超级管理员', '2021-10-12 10:23:39', 1, '不爱`吃臭`豆腐', '13419098123', 25, 1);
INSERT INTO `App_Transaction` VALUES (6, '3', '2019-09-18 18:22:25', 1, '超级管理员', '。。。', NULL, '超级管理员', '2022-04-13 10:13:43', 1, '同是天涯流落人', '13419444123', 199, 1);
INSERT INTO `App_Transaction` VALUES (9, '3', '2020-09-19 23:22:19', 1, '超级管理员', '还没想好', NULL, '超级管理员', '2022-08-23 15:23:25', 1, '林子大了什么鸟都有', '13999999999', 100, 0);

-- ----------------------------
-- Table structure for App_TransactionAvgPrice
-- ----------------------------
DROP TABLE IF EXISTS `App_TransactionAvgPrice`;
CREATE TABLE `App_TransactionAvgPrice`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AgeRange` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AvgPrice` decimal(10, 2) NOT NULL,
  `City` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Date` date NOT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `IsTop` int(11) NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Variety` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of App_TransactionAvgPrice
-- ----------------------------
INSERT INTO `App_TransactionAvgPrice` VALUES (3, '50-60', 18.00, '石家庄市', '2019-05-06 14:06:35', 1, '超级管理员', '2019-05-08', 0, 1, '超级管理员', '2022-03-26 02:19:25', 1, '数码相框,影棚器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (13, '20-30', 90.00, '北京市', '2020-11-16 23:14:23', 1, '超级管理员', '2020-11-16', NULL, 1, '超级管理员', '2022-03-26 02:19:09', 1, '户外器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (14, '30-40', 50.00, '天津市', '2020-11-16 23:14:40', 1, '超级管理员', '2020-11-16', NULL, 1, '超级管理员', '2022-03-26 02:19:05', 1, '户外器材');
INSERT INTO `App_TransactionAvgPrice` VALUES (17, '40-50', 12.00, '石家庄市', '2020-11-16 23:15:47', 1, '超级管理员', '2020-11-16', NULL, 0, '超级管理员', '2022-07-06 15:06:49', 1, '影棚器材');

-- ----------------------------
-- Table structure for FormCollectionObject
-- ----------------------------
DROP TABLE IF EXISTS `FormCollectionObject`;
CREATE TABLE `FormCollectionObject`  (
  `FormCollectionId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FormId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FormCollectionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FormCollectionObject
-- ----------------------------
INSERT INTO `FormCollectionObject` VALUES ('00ac79fa-529b-45c1-ae98-1838d86f5e95', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-21\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-28 10:20:13', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('03c45672-2149-4399-9ecb-75644718f038', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-17 13:16:44', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0513b2ca-6ccd-489d-9e83-ea3de7b01754', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"d\"}', '2022-02-28 08:14:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('066ed25e-9f90-498f-bdec-05cb7881913e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-26 11:50:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('06febfc3-28d0-497f-828d-a29d5acfa366', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-03-08\",\"field1641207457900\":\"324\",\"field1641207424694\":\"\"}', '2022-03-16 16:51:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0a71d04e-6840-48ba-a3de-817896e1e111', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-14 01:44:33', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0b0d324e-916b-4246-9f7a-96f5f9435320', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"22\"}', '2022-03-10 08:58:21', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0b3ac6d2-35ac-42b0-84c5-bd4a22157dc2', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-05-14 23:18:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('0b5e3fb4-9c8b-407d-931e-bae4b8b34ce9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"11\",\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-30 16:41:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1041a590-3d36-43c8-8b1d-fe6a7a7ca18f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-04-18 18:07:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('10e5c36a-c3b0-4d9f-83bc-c25bd97e2b82', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"0\"}', '2022-02-12 14:12:00', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('12840c39-d012-41b3-a9cd-720e9138db6e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-23 14:05:40', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('15290644-4a33-4c16-8326-fd75974592a6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"7\",\"field1650260638189\":\"7777777777777777\",\"field1650260647796\":\"7777777777777777\",\"field1641206608182\":\"777\"}', '2022-06-06 16:31:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1550cb90-47c6-43cd-8690-97999d72d92f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-13 10:35:58', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('16d5ead2-e9ef-40fb-b275-832898b8cdfa', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"fgdfghf gfh fg\"}', '2022-03-09 17:07:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('177dac5d-f95e-4f13-a569-d083b0d24eee', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"ldsng\"}', '2022-08-25 13:56:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('182125f4-f074-4b48-8ab1-e17aba5b82e9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"FAS\"}', '2022-02-08 17:18:44', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1da99df3-fc0c-48e6-98db-e95daeeddd05', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"4、输入框：\",\"field1650260638189\":\"5、输入框：\",\"field1650260647796\":\"6、输入框：\",\"field1641206608182\":\"7、其他意见：\"}', '2022-06-11 23:15:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('1f50d9ec-6be5-4410-b54b-e918ee0eb386', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":null}', '2022-03-24 21:27:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('201e9a14-7ee7-4f68-919f-aac4059dfc2c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-04-12 14:49:03', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('21323223-980d-4177-a144-210fd26f10bf', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"fq\"}', '2022-03-25 19:45:47', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('226da06a-c42a-4d79-996d-eea85e1882d5', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"33\"}', '2022-08-22 11:18:32', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('248d00a3-73fd-4c44-84b2-142543c61155', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"111\"}', '2022-02-17 14:01:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('25b4cd02-8602-4516-8394-b4025e9cc420', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"2\",\"field1650260647796\":\"3\",\"field1641206608182\":\"4\"}', '2022-04-27 10:09:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('29819b15-d57b-435a-a4aa-68458e60bc4d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"2\",\"field1650260647796\":\"3\",\"field1641206608182\":\"\\n\"}', '2022-05-27 10:51:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2cf3ecde-45f3-44e5-af2a-329a8e91e6da', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"人\"}', '2022-03-27 22:52:18', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e10dfbc-5e80-466d-9e68-00f4c03b03cb', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-07\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-19 11:10:53', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e426da4-9bc2-4086-b910-55335252e286', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-07 17:15:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e71a231-ec58-4fe4-8101-f0d3405ac79d', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-03-12\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-03-12 07:21:12', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2e860327-82a9-4e51-a451-f32295db062a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"5\",\"field1650260638189\":\"5\",\"field1650260647796\":\"5\",\"field1641206608182\":\"5\"}', '2022-05-11 09:59:04', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2ea29d88-281d-449a-a200-645ca8c613d5', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2017-05-04\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-05-23 17:21:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('2f9fbaff-4c97-42e4-94b2-5fc2704b3a18', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":null}', '2022-03-03 10:14:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('32c11483-0898-447b-baff-a5911e988925', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-02-05 11:32:07', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('33d6d570-c665-40b6-9035-c5f6a7fce01f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"11111111\"}', '2022-03-04 16:54:25', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('349ff901-5623-41e1-98fc-02282d673a3f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-09-03 17:21:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('352126a6-070c-4178-b448-cdfc8a432b4c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-26 10:59:10', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('35cbe5b1-2498-4f13-b605-ee6f191d30a9', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-08\",\"field1641207457900\":\"v v    \",\"field1641207424694\":\"\"}', '2022-06-03 22:02:09', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('370e55db-746a-40cd-90f2-ff73b64eab00', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-08-02 11:37:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('372a0316-bf48-4411-bef0-bdfc2deefeb8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-22 16:39:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3990f4bd-68ac-483c-bc85-38335e83b88a', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-30\",\"field1641207457900\":\"的风景埃里克就\",\"field1641207424694\":\"\"}', '2022-01-22 21:16:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3bb62484-b056-43a2-9b33-5764fc625ab9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-16 10:45:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3e7a21bf-dd68-4b6a-bfa9-b0aaa3e8d49f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1231\"}', '2022-03-02 13:58:08', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('3f22aafc-214f-4374-a97c-2cdcce81e08a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-03-31 16:19:16', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('418a0d4f-8a7f-4d26-88f7-db5148a57001', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-09-01\",\"field1641207457900\":\"22\",\"field1641207424694\":\"\"}', '2022-09-02 14:51:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('4254e8ed-0e9f-4423-9f72-1007df7fceb1', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"test\"}', '2022-01-19 23:07:20', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('448ef9bf-bb84-4e56-af5b-17032207fa23', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-08-01 10:56:59', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('4dcd83b4-5e1e-4299-9bc6-302313f98d5f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-02 21:09:23', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('4f443026-4c8f-4c27-b6b7-20eeefab42a1', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"sss\"}', '2022-02-25 17:30:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('51fcee24-aee5-4b55-9c30-f42082e8c61e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-13 08:56:25', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('52990452-b50e-497c-aa0f-5093214d690b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"22233\"}', '2022-03-10 08:58:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('530ce4a0-d399-49e3-b417-9dfdf2ac4da7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-03-31 15:29:02', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('53e1f20a-6c35-48b5-9fca-d5c72f87ca76', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-02-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-02-08 23:58:30', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('55419def-5b55-4878-9575-430a9761ac93', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-15 18:38:30', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('58253f8c-66d5-4eeb-a952-c84841351fe4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"相当满意\",\"field1641205647957\":\"比较满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-23 17:21:10', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('584c592f-0fb5-4246-a57e-9f39e80f97da', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-06 12:03:23', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5d26599c-2dbb-4261-9569-01472b8f525d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-03-08 14:21:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5dba775b-c261-46ec-bf4c-e3747e2939f8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-17 18:17:30', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5e8d3723-e5b4-41a3-b088-12266b98c523', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"111222333\"}', '2022-02-14 13:39:41', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5fa2dc0b-a498-4434-9286-690f0df8a914', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-12 10:53:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('5fdcfca6-99b5-4477-b9d8-103e9787dc2f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-13 10:04:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('61ca3776-d945-4b44-9242-a73a70b925c4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"qqqq\"}', '2022-02-20 21:11:02', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('63398fae-9ce4-4818-9103-68c095fc9b6b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-06 21:57:17', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('63c4f091-b740-4995-a4e4-f46183cfcb49', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-16\",\"field1641207457900\":\"哈哈哈哈\",\"field1641207424694\":\"\"}', '2022-06-22 17:26:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('650dc3f2-075b-490b-9382-bd813af0dcd9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":\"111\",\"field1650260638189\":\"111\",\"field1650260647796\":\"111\",\"field1641206608182\":\"111\"}', '2022-06-23 13:50:13', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('67941f5e-7f34-455b-9afd-280ec7f02240', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"请问\"}', '2022-01-22 17:22:18', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('6c8a34fc-f86a-4517-a792-2a941ceb2015', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"sdad\",\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-28 17:07:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('6d36b685-e343-4e0f-b17d-ba39d83e3f72', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"111\"}', '2022-01-18 16:07:10', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('6e279655-a553-494b-80e9-ac1b14361cab', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-07-07\",\"field1641207457900\":\"1334\",\"field1641207424694\":\"\"}', '2022-07-07 16:52:47', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('71ccce55-7dd4-4de7-962b-a0625ffaabf7', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-02-03\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-02-17 21:57:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('73eb6ca6-1159-4c95-a0cd-03789e158dd6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-05 10:33:25', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('766e2ed2-8de0-4043-bc77-93533e4bb666', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"5\"}', '2022-08-11 09:38:56', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7835bd2f-46f4-4476-92fc-562343f5222c', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-08-03\",\"field1641207457900\":\"test\",\"field1641207424694\":\"\"}', '2022-08-07 17:14:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('793a839a-4fb4-45a4-a274-c265529a08d7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"888\"}', '2022-04-06 21:57:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7ad1a023-7053-4ee5-9c47-16e4bdbfc7c4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-09-06 16:13:05', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7c2c5dde-1318-4382-848c-215a862bbc14', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-25 09:24:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7cc358fe-d17c-49b0-a32d-4bde5b8d81ba', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-03 15:58:01', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7f7591b8-367e-4128-9e43-ef68e67edb5d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-04-14 09:20:31', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('7fd4ea6c-d4ec-4cbe-a0dd-1ea77992ba88', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-22 17:22:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('814dbafb-dd62-438e-81c9-56e71cf49fa7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-11 21:45:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8245c9b8-a4c9-4db8-96e4-3cc471acbb79', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-10\",\"field1641207457900\":\"C#越学越不会了\",\"field1641207424694\":\"\"}', '2022-06-05 16:40:26', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('82a6332b-9a6d-44b1-8ba1-cd9256580d59', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-08-25\",\"field1641207457900\":\"111111111111111111111\",\"field1641207424694\":\"\"}', '2022-08-25 18:29:40', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('831d6920-ee7c-488b-8d6a-85546aa23bbf', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"222\"}', '2022-09-05 11:27:33', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('84754fa9-d2d0-4ed3-b3f0-90157a0a78c6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-03-02 14:23:40', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('848437d7-50be-40e7-88b4-de67ec402faa', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-22\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-13 13:25:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8510b8ea-e415-48b7-adbd-c88c39fe8136', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"XIONG GONG\"}', '2022-08-16 09:20:07', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('87166fa0-cfba-406c-b09e-2d94308a4905', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-02 21:48:04', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('87a68d22-74e1-498f-88cb-3462904eb0c7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-08 01:46:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8d5a75f1-d092-4de1-861d-ebf2ad9bbd8c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-25 11:33:21', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8f0a56d9-9fd1-4271-9058-6bdee2f9da3f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-24 23:45:31', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('8f754069-a619-4eb5-9261-aab4163b9e34', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-16 11:22:32', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('90513c4c-b639-4d0d-8c9d-fb69b77620f8', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-05\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-03 19:06:50', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('90f1525a-062c-4180-9a92-00bc802901c9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"比较满意,十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-01-21 15:24:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('9245c5de-c3d8-45a4-a8a0-a03975f15efc', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-28 20:04:37', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('956d43cc-c96a-4945-a029-079b0f99508f', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"1999-06-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-20 11:40:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('96348cf2-095e-4a37-8ab4-d0072b780c55', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"1\"}', '2022-04-12 15:11:51', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('9c1226c7-5694-4d52-8d2f-23ae5ade8b92', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"12\",\"field1650260638189\":\"34\",\"field1650260647796\":\"455\",\"field1641206608182\":\"66\"}', '2022-04-28 15:39:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a37c1956-ddc0-457b-8f0a-93cdc44c257d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"没有意见\"}', '2022-01-03 19:05:46', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a507f976-af08-4e7a-9885-9a04a97592df', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-18 14:32:03', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a5c0e586-c7ad-43f4-8629-aa9e1c672c42', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-19\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-21 13:49:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a60cfa8b-cdb0-47f9-9cee-570c3150e055', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-16 08:53:12', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a7ac9b0d-f866-4db0-b499-59e3d36d8131', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-07-19 16:00:56', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a8adcb8f-3238-41f3-b3bd-28197a5bc230', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-18 14:13:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('a92575b4-9889-42ed-9677-5a648a429970', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-04-26 10:09:18', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ad25a88c-54c6-4164-8f8a-9d54d6489b42', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-02-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-02-15 13:35:39', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ae89f005-a7a2-43cc-9786-99301569f78e', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"sdf\",\"field1650260638189\":\"dsf\",\"field1650260647796\":\"sdf\",\"field1641206608182\":\"dsf\"}', '2022-06-15 15:28:11', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ae8f2272-1311-4a2d-a58c-ea2b6fa36578', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"0000\"}', '2022-03-16 15:53:31', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('afe8243d-a936-443f-864c-7b5278f26167', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2018-01-03\",\"field1641207457900\":\"这个低代码会有很多坑  实际用的时候 发现很痛苦\\n小项目会很方便\",\"field1641207424694\":\"\"}', '2022-01-14 15:53:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('b2097447-69bb-454f-809e-d47ad90301d9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-09 21:39:04', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('b5fab3ae-ec1d-4a51-a9b5-041104b957d8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-03-09 13:47:41', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ba82097f-88a4-4ee1-ac83-9fa2f6125800', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-22 20:42:49', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('bf26c23b-88ed-404b-98f1-e081c4d92f54', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-07 17:14:14', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c0dbcff2-b8f6-4c3b-93ec-59ee17dbab6f', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2017-03-24\",\"field1641207457900\":\"支持博主，希望网站越做越完善\",\"field1641207424694\":\"\"}', '2022-05-22 07:46:53', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c1c56c53-785c-4641-a581-228326dcf491', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-01 10:25:59', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c217f308-55ed-431f-8de3-8a41c197c336', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"相当满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-18 14:32:43', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('c768c884-d674-44be-a003-aae62eeff90c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"3333\"}', '2022-03-18 12:01:53', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cad130b0-fdd2-4598-b110-f2a9965b3528', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-08-25\",\"field1641207457900\":\"888888\",\"field1641207424694\":\"\"}', '2022-08-25 18:28:34', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cafcb37f-b6e8-46a1-b786-78a38a76c40b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-19 23:39:56', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cb7e2576-3b88-48bf-9202-3f77a9f915b5', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-25 22:24:50', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cccc519c-c448-4292-85d1-6a0ac2828fd9', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-04\",\"field1641207457900\":\"123456\",\"field1641207424694\":\"\"}', '2022-01-03 19:09:53', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cce9c0a6-8850-43a1-aca9-b7e6321dceef', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-01-16\",\"field1641207457900\":\"科技大道就看见\",\"field1641207424694\":\"\"}', '2022-01-16 16:21:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cde313b5-1fa1-4c43-9765-df1d66f19249', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"111\",\"field1650260638189\":\"222\",\"field1650260647796\":\"333\",\"field1641206608182\":\"44\"}', '2022-05-07 15:33:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ce238aa2-5355-463c-8341-15e08fce098b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"78999\"}', '2022-04-12 18:53:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('cfa58a5a-2b94-42a2-8825-acd558983a2b', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-27\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-05-10 01:27:35', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d01d07e6-b8dc-49de-b6a9-9b54333af37a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"444\"}', '2022-03-23 14:43:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d01d544c-d260-4ee9-9929-b18daba2b880', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"456\",\"field1650260638189\":\"456\",\"field1650260647796\":\"456\",\"field1641206608182\":\"456\"}', '2022-06-29 13:21:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d3a90649-7dbe-4f27-ad73-2a201bd2b7fa', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-04-13 13:22:36', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d7833a92-c0d9-4a90-b70f-375b980258c4', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-01-01\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-16 17:00:28', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d8c84159-280d-4280-a374-63f4fecc9b8c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-03-12 07:21:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('d9d8dca9-8899-4636-886b-929d91de6cf9', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"e\",\"field1650260638189\":\"we\",\"field1650260647796\":\"ew\",\"field1641206608182\":\"we\"}', '2022-05-31 15:45:49', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('da47770c-9067-459b-805c-e7081480c9d4', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-09 12:22:22', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dc0319f2-3b02-465e-9c94-d32c19cc83ba', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-07-01 09:24:58', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dc4af657-1e89-4807-baf9-92693aff0762', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"比较满意,相当满意,十分满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-06-02 09:42:43', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dc827875-7c48-4092-8299-615e60897dd6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-08-07 17:13:45', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dd6b3150-808e-4ca9-b936-66b12e88173b', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-03-31\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-04-26 10:08:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dedb01d1-b168-4ef7-a9f8-e2fc809821d7', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,比较满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-02-22 09:11:27', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('dfd6a79c-5ee7-4362-a7b5-a7ee556dcb4f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"36\"}', '2022-01-14 15:10:33', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e003b80d-a262-49f5-86f5-7a9be8cfebb8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\";ppp\"}', '2022-01-18 22:46:35', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e3eaeafe-19cc-4335-b05a-ba1723532a94', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-06-15\",\"field1641207457900\":\"3333\",\"field1641207424694\":\"\"}', '2022-06-22 17:25:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e4a9051a-acd6-4c9f-b484-6ade9641b97a', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"我的测试\"}', '2022-03-23 09:55:50', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e6e08ec4-5b55-4b3f-8f1f-b399817ddab6', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"2323\"}', '2022-03-07 13:02:29', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e75f8825-5934-4562-9846-a938e105a6aa', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-04-18 11:56:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e894b567-e6e0-4fb9-9eac-6b90557b4c06', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-03-10\",\"field1641207457900\":\"dddd\",\"field1641207424694\":\"\"}', '2022-03-18 20:23:02', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e8b6c478-d443-4b61-a3fa-484c391fec63', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-09-02 06:10:01', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e8f5cdee-4b67-4191-bb48-0c9968fa49d4', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-04-13\",\"field1641207457900\":\"432\",\"field1641207424694\":\"\"}', '2022-04-13 09:04:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e913389c-e11a-4675-b8eb-a25c75086e37', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1111\"}', '2022-01-03 19:09:45', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('e988f446-00df-4d43-9682-eba419c9f18b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"比较满意\",\"field1641205647957\":\"比较满意\",\"field1641206608182\":\"滚滚滚\"}', '2022-01-16 16:17:55', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ed0eadb2-5064-498d-8561-853d54b3b9b8', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"111\"}', '2022-08-26 11:42:09', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ed4863d4-6bf7-4f4c-bd6b-b984881d6dd1', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"123\"}', '2022-03-16 14:36:51', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('edfac119-20ec-494f-b92e-b9f340ef7093', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-13 14:49:38', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ef025273-5b0b-4c1e-a226-81de89641524', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":null}', '2022-08-27 09:07:54', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ef16549c-59b7-425d-b32e-424882eeb92f', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"123\"}', '2022-04-01 15:27:07', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f011feed-4cff-4f9d-a878-a38a8afd539c', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"0\",\"field1640871902689\":\"2022-08-19\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-08-03 15:56:21', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f549faa0-c6e0-431e-a029-a0ba7767386b', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"1\"}', '2022-02-16 11:45:15', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f6cbc763-5cd0-4774-be84-06e7a9872278', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":null}', '2022-01-12 11:32:06', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f6f2586f-2249-4bca-928f-0b513deab6e2', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-08-09\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-08-15 13:21:19', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('f8d30ab4-8d7f-42ac-899c-dac1c5f61619', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意,十分满意,相当满意,比较满意\",\"field1641205647957\":\"十分满意\",\"field1641206608182\":\"34343\"}', '2022-04-14 21:07:46', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fa4c59ea-ff2f-431b-9224-a706922a302c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"fgfds\"}', '2022-08-20 15:44:00', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fa69e0b6-4bbd-4ac0-a691-cbbb2905f589', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"111\"}', '2022-03-04 16:53:11', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fbb50231-efa5-46c2-a3bb-9ce2279de293', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"非常满意\",\"field1641205647957\":\"非常满意\",\"field1650260639951\":\"e\",\"field1650260638189\":\"qew\",\"field1650260647796\":\"eqw\",\"field1641206608182\":\"qwe\"}', '2022-07-14 14:52:12', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fced572f-b387-46a4-9afc-c70c4931f3cf', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"0\",\"field1641206170991\":\"相当满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"1\",\"field1650260638189\":\"1\",\"field1650260647796\":\"1\",\"field1641206608182\":\"1\"}', '2022-08-01 12:47:47', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fd8d649a-ce7f-4801-89dc-0a7e3556468c', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":\"AAA\",\"field1650260638189\":\"AAA\",\"field1650260647796\":\"AAA\",\"field1641206608182\":null}', '2022-06-12 17:24:32', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('fe3cc538-3bf7-4c9c-a6cf-9c96386d17e5', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-05-02 14:30:57', 3362, '演示帐号', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('ff2b479b-66ca-4ad4-9272-6671d465d9d3', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意\",\"field1641205647957\":\"十分满意\",\"field1650260639951\":null,\"field1650260638189\":null,\"field1650260647796\":null,\"field1641206608182\":null}', '2022-04-23 22:57:26', 3362, '演示帐号', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for FormDesignOptions
-- ----------------------------
DROP TABLE IF EXISTS `FormDesignOptions`;
CREATE TABLE `FormDesignOptions`  (
  `FormId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DaraggeOptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormOptions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormFields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TableConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FormId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FormDesignOptions
-- ----------------------------
INSERT INTO `FormDesignOptions` VALUES ('0431a578-bfc9-407f-b95e-321c350f10cb', '2021开发语言使用调查', '[{\"id\":5,\"name\":\"多种语言开发\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1640871905593\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":3,\"name\":\"从什么时候开始做开发?\",\"type\":\"date\",\"icon\":\"el-icon-date\",\"value\":null,\"field\":\"field1640871902689\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":2,\"name\":\"说点什么\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641207457900\",\"width\":100,\"readonly\":false,\"required\":false},{\"id\":9,\"name\":\"图片上传\",\"type\":\"img\",\"url\":\"\",\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"icon\":\"el-icon-picture-outline\",\"field\":\"field1641207424694\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1640871905593\":[],\"field1640871902689\":null,\"field1641207457900\":null,\"field1641207424694\":null},\"formOptions\":[[{\"field\":\"field1640871905593\",\"title\":\"多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1640871905593\",\"title\":\"多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]', NULL, '[]', '2021-12-29 23:39:22', 1, '超级管理员', '超级管理员', '2022-08-03 15:58:37', 1);
INSERT INTO `FormDesignOptions` VALUES ('8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', '2021双减政策调查', '[{\"id\":5,\"name\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1641205615398\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":6,\"name\":\"您认为放学后作业对孩子的负担怎样?\",\"values\":[\"非常满意\"],\"type\":\"checkbox\",\"key\":\"满意度\",\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"icon\":\"el-icon-circle-check\",\"field\":\"field1641206170991\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":5,\"name\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"key\":\"满意度\",\"field\":\"field1641205647957\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"非常满意\"]},{\"id\":2,\"name\":\"其他意见\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641206608182\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1641205615398\":[],\"field1641206170991\":[],\"field1641205647957\":[],\"field1641206608182\":null},\"formOptions\":[[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]', NULL, '[]', '2021-12-30 21:45:16', 1, '超级管理员', '超级管理员', '2022-08-03 15:57:54', 1);

-- ----------------------------
-- Table structure for SellOrder
-- ----------------------------
DROP TABLE IF EXISTS `SellOrder`;
CREATE TABLE `SellOrder`  (
  `Order_Id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `OrderType` int(11) NOT NULL,
  `TranNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SellNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Qty` int(11) NOT NULL DEFAULT 0,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditStatus` int(4) NOT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `Remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Order_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of SellOrder
-- ----------------------------
INSERT INTO `SellOrder` VALUES ('47e41e06-cb4a-4763-9aeb-df66cd6615e1', 1, '20022208150002', '20022208150002', 200, NULL, 0, NULL, NULL, '2002220815000220022208150002', 1, '超级管理员', '2022-08-16 02:03:17', 1, '超级管理员', '2022-08-16 14:28:36');
INSERT INTO `SellOrder` VALUES ('978ad775-77c0-49ca-be31-ba36bb6f8af8', 1, '20022208150003', '20022208150003', 10, NULL, 0, NULL, NULL, '20022208150003', 1, '超级管理员', '2022-08-17 23:27:48', 1, '超级管理员', '2022-08-24 13:40:54');
INSERT INTO `SellOrder` VALUES ('ec217c01-42a2-435f-bdb6-70613b947bf9', 1, '20022208150001', '20022208150001', 200, NULL, 0, NULL, NULL, NULL, 3362, 'admin666', '2022-08-15 05:01:04', 1, '超级管理员', '2022-08-16 14:28:38');

-- ----------------------------
-- Table structure for SellOrderList
-- ----------------------------
DROP TABLE IF EXISTS `SellOrderList`;
CREATE TABLE `SellOrderList`  (
  `OrderList_Id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `Order_Id` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ProductName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Qty` int(11) NOT NULL DEFAULT 0,
  `Weight` decimal(11, 2) NULL DEFAULT NULL,
  `Remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderList_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of SellOrderList
-- ----------------------------
INSERT INTO `SellOrderList` VALUES ('08da7e38-19ce-4ca8-8410-49252fca5be5', 'ec217c01-42a2-435f-bdb6-70613b947bf9', '潮流', '11', 200, 200.00, NULL, 1, '超级管理员', '2022-08-15 05:01:04', 1, '超级管理员', '2022-08-16 14:28:38');
INSERT INTO `SellOrderList` VALUES ('08da7ee8-6deb-4b27-83c4-4a29a041ba1a', '47e41e06-cb4a-4763-9aeb-df66cd6615e1', '家电', '120', 200, 200.00, NULL, 1, '超级管理员', '2022-08-16 02:03:17', 1, '超级管理员', '2022-08-16 14:28:36');
INSERT INTO `SellOrderList` VALUES ('08da8065-0a6c-47ae-8875-0b8582aeb68c', '978ad775-77c0-49ca-be31-ba36bb6f8af8', '家电', '200', 200, 200.00, NULL, 1, '超级管理员', '2022-08-17 23:27:48', 1, '超级管理员', '2022-08-24 13:40:54');
INSERT INTO `SellOrderList` VALUES ('fc332cef-c1eb-4063-b71c-6addf19a8e8b', '6efb65b8-585e-4be7-8b77-94c76e362412', '22', '2', 0, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:19', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_City
-- ----------------------------
DROP TABLE IF EXISTS `Sys_City`;
CREATE TABLE `Sys_City`  (
  `CityId` int(11) NOT NULL,
  `CityCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CityName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProvinceCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_City
-- ----------------------------
INSERT INTO `Sys_City` VALUES (1, '110100', '市辖区', '110000');
INSERT INTO `Sys_City` VALUES (2, '110200', '县', '110000');
INSERT INTO `Sys_City` VALUES (3, '120100', '市辖区', '120000');
INSERT INTO `Sys_City` VALUES (4, '120200', '县', '120000');
INSERT INTO `Sys_City` VALUES (5, '130100', '石家庄市', '130000');
INSERT INTO `Sys_City` VALUES (6, '130200', '唐山市', '130000');
INSERT INTO `Sys_City` VALUES (7, '130300', '秦皇岛市', '130000');
INSERT INTO `Sys_City` VALUES (8, '130400', '邯郸市', '130000');
INSERT INTO `Sys_City` VALUES (9, '130500', '邢台市', '130000');
INSERT INTO `Sys_City` VALUES (10, '130600', '保定市', '130000');
INSERT INTO `Sys_City` VALUES (11, '130700', '张家口市', '130000');
INSERT INTO `Sys_City` VALUES (12, '130800', '承德市', '130000');
INSERT INTO `Sys_City` VALUES (13, '130900', '沧州市', '130000');
INSERT INTO `Sys_City` VALUES (14, '131000', '廊坊市', '130000');
INSERT INTO `Sys_City` VALUES (15, '131100', '衡水市', '130000');
INSERT INTO `Sys_City` VALUES (16, '140100', '太原市', '140000');
INSERT INTO `Sys_City` VALUES (17, '140200', '大同市', '140000');
INSERT INTO `Sys_City` VALUES (18, '140300', '阳泉市', '140000');
INSERT INTO `Sys_City` VALUES (19, '140400', '长治市', '140000');
INSERT INTO `Sys_City` VALUES (20, '140500', '晋城市', '140000');
INSERT INTO `Sys_City` VALUES (21, '140600', '朔州市', '140000');
INSERT INTO `Sys_City` VALUES (22, '140700', '晋中市', '140000');
INSERT INTO `Sys_City` VALUES (23, '140800', '运城市', '140000');
INSERT INTO `Sys_City` VALUES (24, '140900', '忻州市', '140000');
INSERT INTO `Sys_City` VALUES (25, '141000', '临汾市', '140000');
INSERT INTO `Sys_City` VALUES (26, '141100', '吕梁市', '140000');
INSERT INTO `Sys_City` VALUES (27, '150100', '呼和浩特市', '150000');
INSERT INTO `Sys_City` VALUES (28, '150200', '包头市', '150000');
INSERT INTO `Sys_City` VALUES (29, '150300', '乌海市', '150000');
INSERT INTO `Sys_City` VALUES (30, '150400', '赤峰市', '150000');
INSERT INTO `Sys_City` VALUES (31, '150500', '通辽市', '150000');
INSERT INTO `Sys_City` VALUES (32, '150600', '鄂尔多斯市', '150000');
INSERT INTO `Sys_City` VALUES (33, '150700', '呼伦贝尔市', '150000');
INSERT INTO `Sys_City` VALUES (34, '150800', '巴彦淖尔市', '150000');
INSERT INTO `Sys_City` VALUES (35, '150900', '乌兰察布市', '150000');
INSERT INTO `Sys_City` VALUES (36, '152200', '兴安盟', '150000');
INSERT INTO `Sys_City` VALUES (37, '152500', '锡林郭勒盟', '150000');
INSERT INTO `Sys_City` VALUES (38, '152900', '阿拉善盟', '150000');
INSERT INTO `Sys_City` VALUES (39, '210100', '沈阳市', '210000');
INSERT INTO `Sys_City` VALUES (40, '210200', '大连市', '210000');
INSERT INTO `Sys_City` VALUES (41, '210300', '鞍山市', '210000');
INSERT INTO `Sys_City` VALUES (42, '210400', '抚顺市', '210000');
INSERT INTO `Sys_City` VALUES (43, '210500', '本溪市', '210000');
INSERT INTO `Sys_City` VALUES (44, '210600', '丹东市', '210000');
INSERT INTO `Sys_City` VALUES (45, '210700', '锦州市', '210000');
INSERT INTO `Sys_City` VALUES (46, '210800', '营口市', '210000');
INSERT INTO `Sys_City` VALUES (47, '210900', '阜新市', '210000');
INSERT INTO `Sys_City` VALUES (48, '211000', '辽阳市', '210000');
INSERT INTO `Sys_City` VALUES (49, '211100', '盘锦市', '210000');
INSERT INTO `Sys_City` VALUES (50, '211200', '铁岭市', '210000');
INSERT INTO `Sys_City` VALUES (51, '211300', '朝阳市', '210000');
INSERT INTO `Sys_City` VALUES (52, '211400', '葫芦岛市', '210000');
INSERT INTO `Sys_City` VALUES (53, '220100', '长春市', '220000');
INSERT INTO `Sys_City` VALUES (54, '220200', '吉林市', '220000');
INSERT INTO `Sys_City` VALUES (55, '220300', '四平市', '220000');
INSERT INTO `Sys_City` VALUES (56, '220400', '辽源市', '220000');
INSERT INTO `Sys_City` VALUES (57, '220500', '通化市', '220000');
INSERT INTO `Sys_City` VALUES (58, '220600', '白山市', '220000');
INSERT INTO `Sys_City` VALUES (59, '220700', '松原市', '220000');
INSERT INTO `Sys_City` VALUES (60, '220800', '白城市', '220000');
INSERT INTO `Sys_City` VALUES (61, '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `Sys_City` VALUES (62, '230100', '哈尔滨市', '230000');
INSERT INTO `Sys_City` VALUES (63, '230200', '齐齐哈尔市', '230000');
INSERT INTO `Sys_City` VALUES (64, '230300', '鸡西市', '230000');
INSERT INTO `Sys_City` VALUES (65, '230400', '鹤岗市', '230000');
INSERT INTO `Sys_City` VALUES (66, '230500', '双鸭山市', '230000');
INSERT INTO `Sys_City` VALUES (67, '230600', '大庆市', '230000');
INSERT INTO `Sys_City` VALUES (68, '230700', '伊春市', '230000');
INSERT INTO `Sys_City` VALUES (69, '230800', '佳木斯市', '230000');
INSERT INTO `Sys_City` VALUES (70, '230900', '七台河市', '230000');
INSERT INTO `Sys_City` VALUES (71, '231000', '牡丹江市', '230000');
INSERT INTO `Sys_City` VALUES (72, '231100', '黑河市', '230000');
INSERT INTO `Sys_City` VALUES (73, '231200', '绥化市', '230000');
INSERT INTO `Sys_City` VALUES (74, '232700', '大兴安岭地区', '230000');
INSERT INTO `Sys_City` VALUES (75, '310100', '市辖区', '310000');
INSERT INTO `Sys_City` VALUES (76, '310200', '县', '310000');
INSERT INTO `Sys_City` VALUES (77, '320100', '南京市', '320000');
INSERT INTO `Sys_City` VALUES (78, '320200', '无锡市', '320000');
INSERT INTO `Sys_City` VALUES (79, '320300', '徐州市', '320000');
INSERT INTO `Sys_City` VALUES (80, '320400', '常州市', '320000');
INSERT INTO `Sys_City` VALUES (81, '320500', '苏州市', '320000');
INSERT INTO `Sys_City` VALUES (82, '320600', '南通市', '320000');
INSERT INTO `Sys_City` VALUES (83, '320700', '连云港市', '320000');
INSERT INTO `Sys_City` VALUES (84, '320800', '淮安市', '320000');
INSERT INTO `Sys_City` VALUES (85, '320900', '盐城市', '320000');
INSERT INTO `Sys_City` VALUES (86, '321000', '扬州市', '320000');
INSERT INTO `Sys_City` VALUES (87, '321100', '镇江市', '320000');
INSERT INTO `Sys_City` VALUES (88, '321200', '泰州市', '320000');
INSERT INTO `Sys_City` VALUES (89, '321300', '宿迁市', '320000');
INSERT INTO `Sys_City` VALUES (90, '330100', '杭州市', '330000');
INSERT INTO `Sys_City` VALUES (91, '330200', '宁波市', '330000');
INSERT INTO `Sys_City` VALUES (92, '330300', '温州市', '330000');
INSERT INTO `Sys_City` VALUES (93, '330400', '嘉兴市', '330000');
INSERT INTO `Sys_City` VALUES (94, '330500', '湖州市', '330000');
INSERT INTO `Sys_City` VALUES (95, '330600', '绍兴市', '330000');
INSERT INTO `Sys_City` VALUES (96, '330700', '金华市', '330000');
INSERT INTO `Sys_City` VALUES (97, '330800', '衢州市', '330000');
INSERT INTO `Sys_City` VALUES (98, '330900', '舟山市', '330000');
INSERT INTO `Sys_City` VALUES (99, '331000', '台州市', '330000');
INSERT INTO `Sys_City` VALUES (100, '331100', '丽水市', '330000');
INSERT INTO `Sys_City` VALUES (101, '340100', '合肥市', '340000');
INSERT INTO `Sys_City` VALUES (102, '340200', '芜湖市', '340000');
INSERT INTO `Sys_City` VALUES (103, '340300', '蚌埠市', '340000');
INSERT INTO `Sys_City` VALUES (104, '340400', '淮南市', '340000');
INSERT INTO `Sys_City` VALUES (105, '340500', '马鞍山市', '340000');
INSERT INTO `Sys_City` VALUES (106, '340600', '淮北市', '340000');
INSERT INTO `Sys_City` VALUES (107, '340700', '铜陵市', '340000');
INSERT INTO `Sys_City` VALUES (108, '340800', '安庆市', '340000');
INSERT INTO `Sys_City` VALUES (109, '341000', '黄山市', '340000');
INSERT INTO `Sys_City` VALUES (110, '341100', '滁州市', '340000');
INSERT INTO `Sys_City` VALUES (111, '341200', '阜阳市', '340000');
INSERT INTO `Sys_City` VALUES (112, '341300', '宿州市', '340000');
INSERT INTO `Sys_City` VALUES (113, '341400', '巢湖市', '340000');
INSERT INTO `Sys_City` VALUES (114, '341500', '六安市', '340000');
INSERT INTO `Sys_City` VALUES (115, '341600', '亳州市', '340000');
INSERT INTO `Sys_City` VALUES (116, '341700', '池州市', '340000');
INSERT INTO `Sys_City` VALUES (117, '341800', '宣城市', '340000');
INSERT INTO `Sys_City` VALUES (118, '350100', '福州市', '350000');
INSERT INTO `Sys_City` VALUES (119, '350200', '厦门市', '350000');
INSERT INTO `Sys_City` VALUES (120, '350300', '莆田市', '350000');
INSERT INTO `Sys_City` VALUES (121, '350400', '三明市', '350000');
INSERT INTO `Sys_City` VALUES (122, '350500', '泉州市', '350000');
INSERT INTO `Sys_City` VALUES (123, '350600', '漳州市', '350000');
INSERT INTO `Sys_City` VALUES (124, '350700', '南平市', '350000');
INSERT INTO `Sys_City` VALUES (125, '350800', '龙岩市', '350000');
INSERT INTO `Sys_City` VALUES (126, '350900', '宁德市', '350000');
INSERT INTO `Sys_City` VALUES (127, '360100', '南昌市', '360000');
INSERT INTO `Sys_City` VALUES (128, '360200', '景德镇市', '360000');
INSERT INTO `Sys_City` VALUES (129, '360300', '萍乡市', '360000');
INSERT INTO `Sys_City` VALUES (130, '360400', '九江市', '360000');
INSERT INTO `Sys_City` VALUES (131, '360500', '新余市', '360000');
INSERT INTO `Sys_City` VALUES (132, '360600', '鹰潭市', '360000');
INSERT INTO `Sys_City` VALUES (133, '360700', '赣州市', '360000');
INSERT INTO `Sys_City` VALUES (134, '360800', '吉安市', '360000');
INSERT INTO `Sys_City` VALUES (135, '360900', '宜春市', '360000');
INSERT INTO `Sys_City` VALUES (136, '361000', '抚州市', '360000');
INSERT INTO `Sys_City` VALUES (137, '361100', '上饶市', '360000');
INSERT INTO `Sys_City` VALUES (138, '370100', '济南市', '370000');
INSERT INTO `Sys_City` VALUES (139, '370200', '青岛市', '370000');
INSERT INTO `Sys_City` VALUES (140, '370300', '淄博市', '370000');
INSERT INTO `Sys_City` VALUES (141, '370400', '枣庄市', '370000');
INSERT INTO `Sys_City` VALUES (142, '370500', '东营市', '370000');
INSERT INTO `Sys_City` VALUES (143, '370600', '烟台市', '370000');
INSERT INTO `Sys_City` VALUES (144, '370700', '潍坊市', '370000');
INSERT INTO `Sys_City` VALUES (145, '370800', '济宁市', '370000');
INSERT INTO `Sys_City` VALUES (146, '370900', '泰安市', '370000');
INSERT INTO `Sys_City` VALUES (147, '371000', '威海市', '370000');
INSERT INTO `Sys_City` VALUES (148, '371100', '日照市', '370000');
INSERT INTO `Sys_City` VALUES (149, '371200', '莱芜市', '370000');
INSERT INTO `Sys_City` VALUES (150, '371300', '临沂市', '370000');
INSERT INTO `Sys_City` VALUES (151, '371400', '德州市', '370000');
INSERT INTO `Sys_City` VALUES (152, '371500', '聊城市', '370000');
INSERT INTO `Sys_City` VALUES (153, '371600', '滨州市', '370000');
INSERT INTO `Sys_City` VALUES (154, '371700', '荷泽市', '370000');
INSERT INTO `Sys_City` VALUES (155, '410100', '郑州市', '410000');
INSERT INTO `Sys_City` VALUES (156, '410200', '开封市', '410000');
INSERT INTO `Sys_City` VALUES (157, '410300', '洛阳市', '410000');
INSERT INTO `Sys_City` VALUES (158, '410400', '平顶山市', '410000');
INSERT INTO `Sys_City` VALUES (159, '410500', '安阳市', '410000');
INSERT INTO `Sys_City` VALUES (160, '410600', '鹤壁市', '410000');
INSERT INTO `Sys_City` VALUES (161, '410700', '新乡市', '410000');
INSERT INTO `Sys_City` VALUES (162, '410800', '焦作市', '410000');
INSERT INTO `Sys_City` VALUES (163, '410900', '濮阳市', '410000');
INSERT INTO `Sys_City` VALUES (164, '411000', '许昌市', '410000');
INSERT INTO `Sys_City` VALUES (165, '411100', '漯河市', '410000');
INSERT INTO `Sys_City` VALUES (166, '411200', '三门峡市', '410000');
INSERT INTO `Sys_City` VALUES (167, '411300', '南阳市', '410000');
INSERT INTO `Sys_City` VALUES (168, '411400', '商丘市', '410000');
INSERT INTO `Sys_City` VALUES (169, '411500', '信阳市', '410000');
INSERT INTO `Sys_City` VALUES (170, '411600', '周口市', '410000');
INSERT INTO `Sys_City` VALUES (171, '411700', '驻马店市', '410000');
INSERT INTO `Sys_City` VALUES (172, '420100', '武汉市', '420000');
INSERT INTO `Sys_City` VALUES (173, '420200', '黄石市', '420000');
INSERT INTO `Sys_City` VALUES (174, '420300', '十堰市', '420000');
INSERT INTO `Sys_City` VALUES (175, '420500', '宜昌市', '420000');
INSERT INTO `Sys_City` VALUES (176, '420600', '襄樊市', '420000');
INSERT INTO `Sys_City` VALUES (177, '420700', '鄂州市', '420000');
INSERT INTO `Sys_City` VALUES (178, '420800', '荆门市', '420000');
INSERT INTO `Sys_City` VALUES (179, '420900', '孝感市', '420000');
INSERT INTO `Sys_City` VALUES (180, '421000', '荆州市', '420000');
INSERT INTO `Sys_City` VALUES (181, '421100', '黄冈市', '420000');
INSERT INTO `Sys_City` VALUES (182, '421200', '咸宁市', '420000');
INSERT INTO `Sys_City` VALUES (183, '421300', '随州市', '420000');
INSERT INTO `Sys_City` VALUES (184, '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `Sys_City` VALUES (185, '429000', '省直辖行政单位', '420000');
INSERT INTO `Sys_City` VALUES (186, '430100', '长沙市', '430000');
INSERT INTO `Sys_City` VALUES (187, '430200', '株洲市', '430000');
INSERT INTO `Sys_City` VALUES (188, '430300', '湘潭市', '430000');
INSERT INTO `Sys_City` VALUES (189, '430400', '衡阳市', '430000');
INSERT INTO `Sys_City` VALUES (190, '430500', '邵阳市', '430000');
INSERT INTO `Sys_City` VALUES (191, '430600', '岳阳市', '430000');
INSERT INTO `Sys_City` VALUES (192, '430700', '常德市', '430000');
INSERT INTO `Sys_City` VALUES (193, '430800', '张家界市', '430000');
INSERT INTO `Sys_City` VALUES (194, '430900', '益阳市', '430000');
INSERT INTO `Sys_City` VALUES (195, '431000', '郴州市', '430000');
INSERT INTO `Sys_City` VALUES (196, '431100', '永州市', '430000');
INSERT INTO `Sys_City` VALUES (197, '431200', '怀化市', '430000');
INSERT INTO `Sys_City` VALUES (198, '431300', '娄底市', '430000');
INSERT INTO `Sys_City` VALUES (199, '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `Sys_City` VALUES (200, '440100', '广州市', '440000');
INSERT INTO `Sys_City` VALUES (201, '440200', '韶关市', '440000');
INSERT INTO `Sys_City` VALUES (202, '440300', '深圳市', '440000');
INSERT INTO `Sys_City` VALUES (203, '440400', '珠海市', '440000');
INSERT INTO `Sys_City` VALUES (204, '440500', '汕头市', '440000');
INSERT INTO `Sys_City` VALUES (205, '440600', '佛山市', '440000');
INSERT INTO `Sys_City` VALUES (206, '440700', '江门市', '440000');
INSERT INTO `Sys_City` VALUES (207, '440800', '湛江市', '440000');
INSERT INTO `Sys_City` VALUES (208, '440900', '茂名市', '440000');
INSERT INTO `Sys_City` VALUES (209, '441200', '肇庆市', '440000');
INSERT INTO `Sys_City` VALUES (210, '441300', '惠州市', '440000');
INSERT INTO `Sys_City` VALUES (211, '441400', '梅州市', '440000');
INSERT INTO `Sys_City` VALUES (212, '441500', '汕尾市', '440000');
INSERT INTO `Sys_City` VALUES (213, '441600', '河源市', '440000');
INSERT INTO `Sys_City` VALUES (214, '441700', '阳江市', '440000');
INSERT INTO `Sys_City` VALUES (215, '441800', '清远市', '440000');
INSERT INTO `Sys_City` VALUES (216, '441900', '东莞市', '440000');
INSERT INTO `Sys_City` VALUES (217, '442000', '中山市', '440000');
INSERT INTO `Sys_City` VALUES (218, '445100', '潮州市', '440000');
INSERT INTO `Sys_City` VALUES (219, '445200', '揭阳市', '440000');
INSERT INTO `Sys_City` VALUES (220, '445300', '云浮市', '440000');
INSERT INTO `Sys_City` VALUES (221, '450100', '南宁市', '450000');
INSERT INTO `Sys_City` VALUES (222, '450200', '柳州市', '450000');
INSERT INTO `Sys_City` VALUES (223, '450300', '桂林市', '450000');
INSERT INTO `Sys_City` VALUES (224, '450400', '梧州市', '450000');
INSERT INTO `Sys_City` VALUES (225, '450500', '北海市', '450000');
INSERT INTO `Sys_City` VALUES (226, '450600', '防城港市', '450000');
INSERT INTO `Sys_City` VALUES (227, '450700', '钦州市', '450000');
INSERT INTO `Sys_City` VALUES (228, '450800', '贵港市', '450000');
INSERT INTO `Sys_City` VALUES (229, '450900', '玉林市', '450000');
INSERT INTO `Sys_City` VALUES (230, '451000', '百色市', '450000');
INSERT INTO `Sys_City` VALUES (231, '451100', '贺州市', '450000');
INSERT INTO `Sys_City` VALUES (232, '451200', '河池市', '450000');
INSERT INTO `Sys_City` VALUES (233, '451300', '来宾市', '450000');
INSERT INTO `Sys_City` VALUES (234, '451400', '崇左市', '450000');
INSERT INTO `Sys_City` VALUES (235, '460100', '海口市', '460000');
INSERT INTO `Sys_City` VALUES (236, '460200', '三亚市', '460000');
INSERT INTO `Sys_City` VALUES (237, '469000', '省直辖县级行政单位', '460000');
INSERT INTO `Sys_City` VALUES (238, '500100', '市辖区', '500000');
INSERT INTO `Sys_City` VALUES (239, '500200', '县', '500000');
INSERT INTO `Sys_City` VALUES (240, '500300', '市', '500000');
INSERT INTO `Sys_City` VALUES (241, '510100', '成都市', '510000');
INSERT INTO `Sys_City` VALUES (242, '510300', '自贡市', '510000');
INSERT INTO `Sys_City` VALUES (243, '510400', '攀枝花市', '510000');
INSERT INTO `Sys_City` VALUES (244, '510500', '泸州市', '510000');
INSERT INTO `Sys_City` VALUES (245, '510600', '德阳市', '510000');
INSERT INTO `Sys_City` VALUES (246, '510700', '绵阳市', '510000');
INSERT INTO `Sys_City` VALUES (247, '510800', '广元市', '510000');
INSERT INTO `Sys_City` VALUES (248, '510900', '遂宁市', '510000');
INSERT INTO `Sys_City` VALUES (249, '511000', '内江市', '510000');
INSERT INTO `Sys_City` VALUES (250, '511100', '乐山市', '510000');
INSERT INTO `Sys_City` VALUES (251, '511300', '南充市', '510000');
INSERT INTO `Sys_City` VALUES (252, '511400', '眉山市', '510000');
INSERT INTO `Sys_City` VALUES (253, '511500', '宜宾市', '510000');
INSERT INTO `Sys_City` VALUES (254, '511600', '广安市', '510000');
INSERT INTO `Sys_City` VALUES (255, '511700', '达州市', '510000');
INSERT INTO `Sys_City` VALUES (256, '511800', '雅安市', '510000');
INSERT INTO `Sys_City` VALUES (257, '511900', '巴中市', '510000');
INSERT INTO `Sys_City` VALUES (258, '512000', '资阳市', '510000');
INSERT INTO `Sys_City` VALUES (259, '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `Sys_City` VALUES (260, '513300', '甘孜藏族自治州', '510000');
INSERT INTO `Sys_City` VALUES (261, '513400', '凉山彝族自治州', '510000');
INSERT INTO `Sys_City` VALUES (262, '520100', '贵阳市', '520000');
INSERT INTO `Sys_City` VALUES (263, '520200', '六盘水市', '520000');
INSERT INTO `Sys_City` VALUES (264, '520300', '遵义市', '520000');
INSERT INTO `Sys_City` VALUES (265, '520400', '安顺市', '520000');
INSERT INTO `Sys_City` VALUES (266, '522200', '铜仁地区', '520000');
INSERT INTO `Sys_City` VALUES (267, '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `Sys_City` VALUES (268, '522400', '毕节地区', '520000');
INSERT INTO `Sys_City` VALUES (269, '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `Sys_City` VALUES (270, '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `Sys_City` VALUES (271, '530100', '昆明市', '530000');
INSERT INTO `Sys_City` VALUES (272, '530300', '曲靖市', '530000');
INSERT INTO `Sys_City` VALUES (273, '530400', '玉溪市', '530000');
INSERT INTO `Sys_City` VALUES (274, '530500', '保山市', '530000');
INSERT INTO `Sys_City` VALUES (275, '530600', '昭通市', '530000');
INSERT INTO `Sys_City` VALUES (276, '530700', '丽江市', '530000');
INSERT INTO `Sys_City` VALUES (277, '530800', '思茅市', '530000');
INSERT INTO `Sys_City` VALUES (278, '530900', '临沧市', '530000');
INSERT INTO `Sys_City` VALUES (279, '532300', '楚雄彝族自治州', '530000');
INSERT INTO `Sys_City` VALUES (280, '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `Sys_City` VALUES (281, '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `Sys_City` VALUES (282, '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `Sys_City` VALUES (283, '532900', '大理白族自治州', '530000');
INSERT INTO `Sys_City` VALUES (284, '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `Sys_City` VALUES (285, '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `Sys_City` VALUES (286, '533400', '迪庆藏族自治州', '530000');
INSERT INTO `Sys_City` VALUES (287, '540100', '拉萨市', '540000');
INSERT INTO `Sys_City` VALUES (288, '542100', '昌都地区', '540000');
INSERT INTO `Sys_City` VALUES (289, '542200', '山南地区', '540000');
INSERT INTO `Sys_City` VALUES (290, '542300', '日喀则地区', '540000');
INSERT INTO `Sys_City` VALUES (291, '542400', '那曲地区', '540000');
INSERT INTO `Sys_City` VALUES (292, '542500', '阿里地区', '540000');
INSERT INTO `Sys_City` VALUES (293, '542600', '林芝地区', '540000');
INSERT INTO `Sys_City` VALUES (294, '610100', '西安市', '610000');
INSERT INTO `Sys_City` VALUES (295, '610200', '铜川市', '610000');
INSERT INTO `Sys_City` VALUES (296, '610300', '宝鸡市', '610000');
INSERT INTO `Sys_City` VALUES (297, '610400', '咸阳市', '610000');
INSERT INTO `Sys_City` VALUES (298, '610500', '渭南市', '610000');
INSERT INTO `Sys_City` VALUES (299, '610600', '延安市', '610000');
INSERT INTO `Sys_City` VALUES (300, '610700', '汉中市', '610000');
INSERT INTO `Sys_City` VALUES (301, '610800', '榆林市', '610000');
INSERT INTO `Sys_City` VALUES (302, '610900', '安康市', '610000');
INSERT INTO `Sys_City` VALUES (303, '611000', '商洛市', '610000');
INSERT INTO `Sys_City` VALUES (304, '620100', '兰州市', '620000');
INSERT INTO `Sys_City` VALUES (305, '620200', '嘉峪关市', '620000');
INSERT INTO `Sys_City` VALUES (306, '620300', '金昌市', '620000');
INSERT INTO `Sys_City` VALUES (307, '620400', '白银市', '620000');
INSERT INTO `Sys_City` VALUES (308, '620500', '天水市', '620000');
INSERT INTO `Sys_City` VALUES (309, '620600', '武威市', '620000');
INSERT INTO `Sys_City` VALUES (310, '620700', '张掖市', '620000');
INSERT INTO `Sys_City` VALUES (311, '620800', '平凉市', '620000');
INSERT INTO `Sys_City` VALUES (312, '620900', '酒泉市', '620000');
INSERT INTO `Sys_City` VALUES (313, '621000', '庆阳市', '620000');
INSERT INTO `Sys_City` VALUES (314, '621100', '定西市', '620000');
INSERT INTO `Sys_City` VALUES (315, '621200', '陇南市', '620000');
INSERT INTO `Sys_City` VALUES (316, '622900', '临夏回族自治州', '620000');
INSERT INTO `Sys_City` VALUES (317, '623000', '甘南藏族自治州', '620000');
INSERT INTO `Sys_City` VALUES (318, '630100', '西宁市', '630000');
INSERT INTO `Sys_City` VALUES (319, '632100', '海东地区', '630000');
INSERT INTO `Sys_City` VALUES (320, '632200', '海北藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (321, '632300', '黄南藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (322, '632500', '海南藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (323, '632600', '果洛藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (324, '632700', '玉树藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (325, '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `Sys_City` VALUES (326, '640100', '银川市', '640000');
INSERT INTO `Sys_City` VALUES (327, '640200', '石嘴山市', '640000');
INSERT INTO `Sys_City` VALUES (328, '640300', '吴忠市', '640000');
INSERT INTO `Sys_City` VALUES (329, '640400', '固原市', '640000');
INSERT INTO `Sys_City` VALUES (330, '640500', '中卫市', '640000');
INSERT INTO `Sys_City` VALUES (331, '650100', '乌鲁木齐市', '650000');
INSERT INTO `Sys_City` VALUES (332, '650200', '克拉玛依市', '650000');
INSERT INTO `Sys_City` VALUES (333, '652100', '吐鲁番地区', '650000');
INSERT INTO `Sys_City` VALUES (334, '652200', '哈密地区', '650000');
INSERT INTO `Sys_City` VALUES (335, '652300', '昌吉回族自治州', '650000');
INSERT INTO `Sys_City` VALUES (336, '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `Sys_City` VALUES (337, '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `Sys_City` VALUES (338, '652900', '阿克苏地区', '650000');
INSERT INTO `Sys_City` VALUES (339, '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `Sys_City` VALUES (340, '653100', '喀什地区', '650000');
INSERT INTO `Sys_City` VALUES (341, '653200', '和田地区', '650000');
INSERT INTO `Sys_City` VALUES (342, '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `Sys_City` VALUES (343, '654200', '塔城地区', '650000');
INSERT INTO `Sys_City` VALUES (344, '654300', '阿勒泰地区', '650000');
INSERT INTO `Sys_City` VALUES (345, '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for Sys_Dictionary
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Dictionary`;
CREATE TABLE `Sys_Dictionary`  (
  `Dic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Config` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DBServer` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DbSql` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DicNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Enable` tinyint(4) NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Dic_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Dictionary
-- ----------------------------
INSERT INTO `Sys_Dictionary` VALUES (3, '{valueField: \'Enable\',\ntextField: \'Enable\',\n containField: null,\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', '1', NULL, '是否值', 'enable', 1, '超级管理员', '2022-08-03 15:59:01', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (30, '{valueField: \'Success\',\n textField: \'Success\', \n containField: null,\n handler: null }\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '测试超级管理员', '2018-06-12 10:21:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (31, '{valueField: \'LogType\',\n textField: \'LogType\', \n containField: null,\n handler: null }\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2022-02-21 12:43:18', 1, NULL, 1, NULL);
INSERT INTO `Sys_Dictionary` VALUES (32, '{valueField: \'Role_Id\',\n textField: \'RoleName\', \n containField: [\'Role_Id\',\'RoleName\'],\n handler: null }\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as \'key\',RoleName as \'value\' FROM Sys_Role WHERE Enable=1\n', '角色列表', 'roles', 1, '测试超级管理员', '2018-07-13 15:03:53', 1, 123, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (35, '{\n valueField: \'AuditStatus\',\n textField: \'AuditStatus\',\n  containField:null \n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (36, '{\n valueField: \'Variety\',\n textField: \'Variety\',\n  containField:null \n}', '2018-07-10 14:06:12', 1, '测试超级管理员', NULL, NULL, '分类', 'pz', 1, '超级管理员', '2022-03-26 02:18:40', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (37, '{\n valueField: \'AgeRange\',\n textField: \'AgeRange\',\n  containField:null \n}', '2018-07-10 14:07:46', NULL, '测试超级管理员', NULL, NULL, '值范围', 'age', 1, '超级管理员', '2022-03-26 02:18:48', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (38, '{\n valueField: \'City\',\n textField: \'City\',\n  containField:null \n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '城市', 'city', 1, '测试超级管理员', '2018-07-16 17:03:50', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (44, '{\n valueField: \'NewsType\',\n textField: \'NewsType\',\n  containField:null \n}', '2018-07-10 16:15:59', 1, '测试超级管理员', NULL, NULL, '新闻类型', 'news', 1, '超级管理员', '2022-06-27 13:46:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (45, '{\n valueField: \'Expire\',\n textField: \'Expire\',\n  containField:null \n}', '2018-07-10 16:38:40', 1, '测试超级管理员', NULL, NULL, '是否过期', 'expire', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (46, '{\n valueField: \'ProvinceName\',\n textField: \'ProvinceName\',\n  containField:null \n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, 'SELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \nINNER JOIN Sys_Province AS b \nON a.ProvinceCode=b.ProvinceCode\nWHERE a.CityName<> \'县\'', '省列表', 'pro', 1, '测试超级管理员', '2018-07-23 15:23:21', 1, NULL, 0, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (48, '{\n valueField: \'ClassifyId\',\n textField: \'ClassifyTitle\',\n  containField:null \n}', '2018-07-18 10:16:22', NULL, '测试超级管理员', NULL, NULL, '是否买入', 'nav', 1, '超级管理员', '2019-09-18 18:09:42', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (49, '{\n valueField: \'Gender\',\n textField: \'Gender\',\n  containField:null \n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (50, '{\n valueField: \'Enable\',\n textField: \'Enable\',\n  containField:null \n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (52, '{\n valueField: \'Choiceness\',\n textField: \'Choiceness\',\n  containField:null \n}', '2018-07-24 15:45:47', 1, '测试超级管理员', NULL, NULL, '是否买入', 'cq', 1, '超级管理员', '2022-03-26 23:07:16', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (59, '{\n valueField: \'IsRegregisterPhone\',\n textField: \'IsRegregisterPhone\',\n  containField:null \n}', '2018-08-29 15:54:21', 1, '测试超级管理员', NULL, NULL, 'test', 'isphone', 1, '超级管理员', '2020-12-19 18:02:55', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (62, '{\n valueField: \'IsTop\',\n textField: \'IsTop\',\n  containField:null \n}', '2019-08-20 09:57:54', 1, '超级管理员', NULL, NULL, 'test1', 'top', 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, 1, 'dddd');
INSERT INTO `Sys_Dictionary` VALUES (64, NULL, '2019-09-18 19:25:47', 1, '超级管理员', NULL, NULL, '订单类型', 'ordertype', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (65, NULL, '2019-09-19 10:07:23', 1, '超级管理员', NULL, NULL, '商品名称', 'pn', 1, '超级管理员', '2022-07-12 10:55:23', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (66, NULL, '2020-05-08 09:42:50', 1, '超级管理员', NULL, NULL, 'dr', 'dr', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (67, NULL, '2020-05-30 19:48:29', 1, '超级管理员', NULL, NULL, '获取所有角色Table显示用', 't_roles', 1, '超级管理员', '2020-05-30 19:48:36', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (69, NULL, '2020-09-18 23:13:42', 1, '超级管理员', NULL, NULL, '11', 'test111', 1, '超级管理员', '2022-06-16 11:00:09', 1, 1, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (70, NULL, '2020-11-02 19:18:08', 1, '超级管理员', NULL, 'SELECT Role_Id AS id,parentId,Role_Id AS `key`,RoleName AS `value` FROM Sys_Role', '级联角色', 'tree_roles', 1, '超级管理员', '2021-02-28 14:35:35', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (75, NULL, '2022-01-03 19:31:24', 1, '超级管理员', NULL, NULL, '满意度', '满意度', 1, '超级管理员', '2022-03-26 23:07:19', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (76, NULL, '2022-09-07 10:23:57', 1, '超级管理员', NULL, NULL, '请求方式', '请求方式', 1, NULL, NULL, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for Sys_DictionaryList
-- ----------------------------
DROP TABLE IF EXISTS `Sys_DictionaryList`;
CREATE TABLE `Sys_DictionaryList`  (
  `DicList_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DicValue` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dic_ID` int(11) NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DicList_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO `Sys_DictionaryList` VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2022-08-03 15:59:01', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2022-08-03 15:59:01', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2019-08-21 16:49:43', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, 90, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '0', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核未通过', '2', 35, NULL, '演示帐号', '2020-09-10 11:42:31', 3362, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (40, '2018-07-10 14:06:13', 1, '测试超级管理员', '数码相框', '数码相框', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (41, '2018-07-10 14:06:13', 1, '测试超级管理员', '影棚器材', '影棚器材', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (42, '2018-07-10 14:06:13', 1, '测试超级管理员', '户外器材', '户外器材', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (44, '2018-07-10 14:06:13', 1, '测试超级管理员', '运动相机', '运动相机', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (45, '2018-07-10 14:06:13', 1, '测试超级管理员', '微单相机', '微单相机', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (46, '2018-07-10 14:06:13', 1, '测试超级管理员', '单反相机', '单反相机', 36, 0, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (47, '2018-07-10 14:07:46', 1, '测试超级管理员', '50-60', '50-60', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (48, '2018-07-10 14:07:46', 1, '测试超级管理员', '40-50', '40-50', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (49, '2018-07-10 14:07:46', 1, '测试超级管理员', '30-40', '30-40', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (50, '2018-07-10 14:07:46', 1, '测试超级管理员', '20-30', '20-30', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (51, '2018-07-10 14:07:46', 1, '测试超级管理员', '10-20', '10-20', 37, 0, '超级管理员', '2022-03-26 02:18:48', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (64, '2018-07-10 16:15:59', 1, '测试超级管理员', '更新日志', '1', 44, 0, '超级管理员', '2022-04-20 01:31:15', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (65, '2018-07-10 16:15:59', 1, '测试超级管理员', '其他信息', '2', 44, 0, '超级管理员', '2022-04-20 01:31:15', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (66, '2018-07-10 16:38:40', 1, '测试超级管理员', '否', '0', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (67, '2018-07-10 16:38:40', 1, '测试超级管理员', '是', '1', 45, NULL, '超级管理员', '2019-09-03 13:20:46', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (77, '2018-07-18 10:16:22', 1, '测试超级管理员', '现金', '1', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 120, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (78, '2018-07-18 10:16:23', 1, '测试超级管理员', '赊账', '2', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 70, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (79, '2018-07-18 10:16:23', 1, '测试超级管理员', '抵扣', '3', 48, NULL, '超级管理员', '2019-09-18 18:09:42', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '测试超级管理员', '2018-07-23 11:10:28', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2019-08-16 18:17:47', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (101, '2018-07-24 15:45:47', 1, '测试超级管理员', '否', '0', 52, 0, '超级管理员', '2022-03-26 23:07:16', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (102, '2018-07-24 15:45:47', 1, '测试超级管理员', '是', '1', 52, 0, '超级管理员', '2022-03-26 23:07:16', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (128, '2018-08-29 15:54:21', 1, '测试超级管理员', '是', '1', 59, 0, '超级管理员', '2020-12-19 18:02:55', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (129, '2018-08-29 15:54:21', 1, '测试超级管理员', '否', '0', 59, 1, '超级管理员', '2020-12-19 18:02:55', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (130, '2018-09-04 16:13:47', 1, '测试超级管理员', '数码相机', '数码相机', 36, 1, '超级管理员', '2022-03-26 02:18:40', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (142, '2019-08-20 09:57:54', 1, '超级管理员', '是', '1', 62, 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, '1');
INSERT INTO `Sys_DictionaryList` VALUES (143, '2019-08-20 09:57:54', 1, '超级管理员', '否', '0', 62, 1, '超级管理员', '2022-01-03 19:13:37', 1, NULL, '测试');
INSERT INTO `Sys_DictionaryList` VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, 110, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (149, '2019-09-18 19:25:47', 1, '超级管理员', '发货', '1', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (150, '2019-09-18 19:25:47', 1, '超级管理员', '退货', '2', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (151, '2019-09-18 19:25:47', 1, '超级管理员', '返单', '3', 64, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (152, '2019-09-19 10:07:23', 1, '超级管理员', '二手', '二手', 65, 1, '超级管理员', '2021-03-24 13:43:23', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (153, '2019-09-19 10:07:23', 1, '超级管理员', '潮流', '潮流', 65, 1, '超级管理员', '2021-03-24 13:43:23', 1, 4, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (154, '2019-09-19 10:07:23', 1, '超级管理员', '家电', '家电', 65, NULL, '超级管理员', '2021-03-24 13:43:23', 1, 6, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (155, '2019-09-19 10:07:23', 1, '超级管理员', '食品', '食品', 65, NULL, '超级管理员', '2021-03-24 13:43:23', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (156, '2019-10-11 10:41:32', 1, '超级管理员', '登陆已过期', 'ApiAuthorize', 31, NULL, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (157, '2020-05-08 09:42:50', 1, '超级管理员', '否', '0', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (158, '2020-05-08 09:42:50', 1, '超级管理员', '是', '1', 66, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (161, '2020-09-11 23:10:50', 1, '超级管理员', '审核', 'Audit', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (162, '2020-09-11 23:10:50', 1, '超级管理员', '打印', 'Print', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (164, '2020-09-11 23:12:54', 1, '超级管理员', '开启权限', 'Open', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (165, '2020-09-11 23:12:54', 1, '超级管理员', '其他', 'Other', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (168, '2020-11-05 10:28:22', 1, '超级管理员', 'Info', '3', 31, 0, '超级管理员', '2022-02-21 12:43:18', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (171, '2021-08-16 14:00:45', 1, '超级管理员', '3', '3', 69, 0, '超级管理员', '2021-10-15 16:27:27', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (175, '2022-01-03 19:31:25', 1, '超级管理员', '非常满意', '非常满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (176, '2022-01-03 19:31:25', 1, '超级管理员', '十分满意', '十分满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (177, '2022-01-03 19:31:25', 1, '超级管理员', '相当满意', '相当满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (178, '2022-01-03 19:31:25', 1, '超级管理员', '比较满意', '比较满意', 75, 0, '超级管理员', '2022-03-26 23:07:19', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (183, '2022-09-07 10:23:57', 1, '超级管理员', 'get', 'get', 76, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (184, '2022-09-07 10:23:57', 1, '超级管理员', 'post', 'post', 76, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Log`;
CREATE TABLE `Sys_Log`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BeginDate` datetime(0) NULL DEFAULT NULL,
  `BrowserType` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ElapsedTime` int(11) NULL DEFAULT NULL,
  `EndDate` datetime(0) NULL DEFAULT NULL,
  `ExceptionInfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LogType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RequestParameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ResponseParameter` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `ServiceIP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Success` int(11) NULL DEFAULT NULL,
  `Url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserIP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IDX_BeginDate`(`BeginDate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Log
-- ----------------------------
INSERT INTO `Sys_Log` VALUES (1, '2022-09-08 19:22:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27', 7, '2022-09-08 19:22:01', '', 'System', '', '', 2, '0.0.0.1:9991', 3, 'http://api.volcore.xyz/api/User/getVierificationCode', '183.197.178.89', '演示帐号', 3362);
INSERT INTO `Sys_Log` VALUES (2, '2022-09-08 19:22:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27', 1, '2022-09-08 19:22:03', '', 'System', '', '', 2, '127.0.0.1:9991', 3, 'http://api.volcore.xyz/api/menu/getTreeMenu', '183.197.178.89', '演示帐号', 3362);
INSERT INTO `Sys_Log` VALUES (3, '2022-09-08 19:22:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27', 0, '2022-09-08 19:22:03', '', 'System', '', '', 0, '0.0.0.1:9991', 3, 'http://api.volcore.xyz/message', '120.53.251.208, 220.196.160.83', '', 0);
INSERT INTO `Sys_Log` VALUES (4, '2022-09-08 19:22:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27', 4, '2022-09-08 19:22:06', '', 'System', '', '', 2, '127.0.0.1:9991', 3, 'http://api.volcore.xyz/api/Sys_Dictionary/GetVueDictionary', '220.175.183.236', '演示帐号', 3362);
INSERT INTO `Sys_Log` VALUES (5, '2022-09-08 19:22:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27', 3, '2022-09-08 19:22:07', '', 'System', '', '', 2, '0.0.0.1:9991', 3, 'http://api.volcore.xyz/api/Sys_WorkFlowTable/getPageData', '220.175.183.236', '演示帐号', 3362);

-- ----------------------------
-- Table structure for Sys_Menu
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Menu`;
CREATE TABLE `Sys_Menu`  (
  `Menu_Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Auth` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MenuType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO `Sys_Menu` VALUES (2, '用户信息', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-user', NULL, 1, 1600, '.', 0, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2022-09-07 14:04:52', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (3, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2021-05-02 15:55:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (5, '日志管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-date', NULL, 1, 1300, 'xxx', 0, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2022-09-07 14:07:11', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (6, '系统日志', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (9, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 11110, 'Sys_User', 2, '/Sys_User', NULL, NULL, '2021-05-02 15:56:46', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (10, '表单与上传下载', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '/', 28, '/formUpload', NULL, NULL, '2019-12-07 11:16:47', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (11, 'api加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, 'table2', 12, '/table2', NULL, NULL, '2019-11-14 00:11:17', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (12, 'table使用', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-date', NULL, 1, 1710, '/', 0, '', '2017-08-28 14:22:10', 'null', '2021-08-02 02:55:40', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (16, '首页轮播图片', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 0, 2000, 'App_HomeHeadImages', 15, '/App_HomeHeadImages/Manager', NULL, NULL, '2019-08-12 16:26:44', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (24, '后台加载table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 750, '/', 56, '/table', NULL, NULL, '2021-07-25 12:26:52', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (25, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1100, '/', 29, '/form6', NULL, NULL, '2019-09-22 23:27:37', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (26, '文件上传', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1050, 'volUploadExample', 28, '/volUploadExample', NULL, NULL, '2019-12-17 18:29:50', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (27, 'table编辑(一)', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1050, 'vtable', 12, '/table1', NULL, NULL, '2021-03-20 15:20:43', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (28, '文件上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', 'el-icon-news', NULL, 1, 1690, '/', 0, NULL, NULL, NULL, '2022-09-07 14:06:28', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (29, '其他组件', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-folder-opened', NULL, 1, 1670, '其他组件', 0, '', NULL, NULL, '2021-08-02 02:59:02', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (30, '图表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100000, 'App_PriceTendency', 34, '/chart', NULL, NULL, '2019-11-14 00:07:26', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (31, '图表+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 950, 'App_Comment', 34, '/formChart', NULL, NULL, '2019-11-14 00:07:51', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (32, '表单一对多', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-s-operation', NULL, 1, 1740, '/', 0, '', NULL, NULL, '2021-08-02 02:54:56', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (33, '完整table+forms', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 2, 800, 'tableForms', 12, '/tableForms', NULL, NULL, '2021-08-03 09:51:26', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (34, '图表表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-set-up', NULL, 1, 1720, '/', 0, '', NULL, NULL, '2021-08-02 02:57:01', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (35, '可编辑的table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 730, 'editTable', 56, '/editTable', NULL, NULL, '2021-07-25 12:26:55', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (36, '表单一对多table', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 950, 'App_TransactionAvgPrice1', 32, '/multi1', NULL, NULL, '2019-11-14 00:03:19', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (37, '表单+图表', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 800, 'App_Transaction', 32, '/multi3', NULL, NULL, '2019-11-14 00:04:17', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (41, '后台校验', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-document-copy', NULL, 1, 1700, '/', 0, '', NULL, NULL, '2021-08-02 02:58:20', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (42, '主从表单明细一对多', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 2, 0, 'SellOrder1', 32, '/multi4', NULL, NULL, '2021-08-03 09:51:10', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (45, '不用节点放此处', '', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2020-05-05 12:02:07', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (48, '表单数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-postcard', NULL, 1, 2000, 'Table+表单数据', 0, '/', '2019-07-12 13:26:32', '超级管理员', '2022-03-27 14:39:36', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (49, '基础只读表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 1000, 'App_Appointment', 48, '/App_Appointment', '2019-07-12 13:28:17', '超级管理员', '2022-03-26 01:33:01', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (50, '自动绑定下拉框', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 900, 'App_TransactionAvgPrice', 48, '/App_TransactionAvgPrice', '2019-07-12 13:53:32', '超级管理员', '2020-12-27 13:34:36', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (51, '主从一对多弹出框(4)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 800, 'App_ReportPrice', 74, '/App_ReportPrice', '2019-07-12 13:55:21', '超级管理员', '2021-03-14 23:53:29', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (52, '导入导出表单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'App_Transaction', 48, '/App_Transaction', '2019-07-12 13:56:15', '超级管理员', '2019-10-31 13:23:37', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (56, '表单布局', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-office-building', NULL, 1, 1750, '/', 0, NULL, '2019-07-12 14:00:19', '超级管理员', '2021-08-02 02:54:39', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (57, '单列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1000, '.', 56, '/form1', '2019-07-12 14:01:12', '超级管理员', '2019-09-20 13:59:00', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (58, '两列表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 900, '两列表单', 56, '/form2', '2019-07-12 14:01:43', '超级管理员', '2019-09-20 13:59:03', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (59, '多列表单自动数据源', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 800, '多列表单', 56, '/form3', '2019-07-12 14:02:17', '超级管理员', '2019-12-17 11:08:06', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (60, 'Table+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 700, 'Table+表单', 56, '/form4', '2019-07-12 14:03:14', '超级管理员', '2019-09-20 13:59:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (61, '系统设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-setting', NULL, 1, 1350, '系统', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2021-08-02 02:59:47', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (62, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'Sys_Menu', 61, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2019-10-31 13:23:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (63, '下拉框绑定设置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 10, 'Sys_Dictionary', 61, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2019-08-16 17:41:15', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (64, '代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-position', NULL, 1, 1500, '代码在线生成器', 0, '/coding', '2019-07-12 14:07:55', '超级管理员', '2021-08-02 02:59:37', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (65, '代码生成器', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2021-05-18 09:50:56', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (66, '内容发布', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-edit', NULL, 1, 1680, '静态页面发布', 0, '/coding', '2019-07-12 14:12:38', '超级管理员', '2021-08-05 10:01:10', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (67, '静态页面发布', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 10, 'App_News', 66, '/App_News', '2019-07-12 14:14:16', '超级管理员', '2019-12-22 00:40:46', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (68, '多弹出框上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 700, 'App_Expert', 48, '/App_Expert', '2019-07-12 14:24:15', '超级管理员', '2021-08-03 09:49:40', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (69, '前端自定义扩展', '', '', NULL, 0, 500, '前端自定义扩展', 48, '/coding', '2019-07-12 14:26:25', '超级管理员', '2019-09-25 17:22:22', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (70, '编辑器表格换行', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"}]', '', NULL, 1, 400, 'App_NewsEditor', 48, '/App_NewsEditor', '2019-07-12 14:28:45', '超级管理员', '2021-08-03 09:50:03', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (71, '权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, 'Sys_Role2', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', '2020-12-21 23:27:09', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (72, 'AppH5开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-location-outline', NULL, 1, 1650, '/', 0, '', '2019-08-14 13:16:06', '超级管理员', '2022-09-07 14:07:51', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (73, '移动端H5开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, NULL, '/', 72, '/app/guide', '2019-08-14 13:16:55', '超级管理员', '2021-05-05 15:21:18', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (74, '一对一(多)', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-wallet', NULL, 1, 1770, '/', 0, '/', '2019-08-22 17:43:58', '超级管理员', '2022-09-06 16:16:06', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (75, '主从一对一(1)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 1000, 'SellOrder', 74, '/SellOrder', '2019-08-22 18:12:43', '超级管理员', '2021-03-14 23:52:28', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (77, '表单只读', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, '表单只读', 56, '/form7', '2019-08-26 11:58:55', '超级管理员', '2019-09-20 13:59:13', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (78, '混合表单一对多', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 900, '32', 32, '/multi2', '2019-10-12 09:18:41', '超级管理员', '2019-11-14 00:03:51', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (79, 'wangEditor编辑器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100, 'WangEditor编辑器', 66, '/kindEditor', '2019-12-22 00:36:10', '超级管理员', '2021-09-05 21:50:33', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (80, '静态页面列表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'htmlList', 66, '/htmlList', '2019-12-22 00:36:54', '超级管理员', '2019-12-21 22:50:41', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (81, '后台参数校验', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '/', 41, '/validator', '2020-02-02 20:01:59', '超级管理员', '2020-02-02 20:01:16', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (82, '数字排版', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'flex', 34, '/flex', '2020-04-07 23:55:33', '超级管理员', '2019-11-15 14:32:56', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (83, '从表图片上传', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'vSellorderImg', 74, '/vSellorderImg', '2020-04-07 23:56:22', '超级管理员', '2020-04-07 23:56:28', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (84, '树形菜单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-c-scale-to-original', NULL, 1, 1705, '树形菜单与table', 0, '', '2020-04-26 20:19:42', '超级管理员', '2021-08-02 02:57:43', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (85, 'tree与代码生成页面', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 100, 'treetable1', 84, '/treetable1', '2020-04-26 20:20:28', '超级管理员', '2019-11-15 14:32:32', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (86, 'tree自定义table数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, 'treetable2', 84, '/treetable2', '2020-04-26 20:20:57', '超级管理员', '2020-04-26 20:21:34', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (89, '流程管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-guide', NULL, 1, 1765, '.', 0, '', '2020-11-29 16:49:27', '超级管理员', '2022-09-06 16:16:39', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (90, '审批流程', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 2000, 'Sys_WorkFlow', 89, '/Sys_WorkFlow', '2020-11-29 16:49:42', '超级管理员', '2022-08-15 04:33:07', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (91, '多列合并显示', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, '/App_Expert', 48, '/App_Expert2', '2021-03-06 17:47:23', '超级管理员', '2021-02-28 22:18:37', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (92, '主从一对一(2)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 890, 'SellOrder2', 74, '/SellOrder2', '2021-03-14 23:52:46', '超级管理员', '2021-03-14 23:52:54', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (93, '主从一对一(3)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 880, 'SellOrder3', 74, '/SellOrder3', '2021-03-14 23:53:50', '超级管理员', '2021-03-14 23:52:54', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (94, '在线表格编辑', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'App_Transaction2', 48, '/App_Transaction2', '2021-03-20 15:19:14', '超级管理员', '2021-02-28 22:18:37', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (95, 'table编辑(二)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 1040, 'table3', 12, '/table3', '2021-03-20 15:21:05', '超级管理员', '2021-03-20 15:21:07', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (96, 'treetable', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'treetable3', 84, 'treetable3', '2021-05-02 15:54:23', '超级管理员', '2019-11-15 14:32:32', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (97, '角色管理(tree)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'Sys_Role1', 2, '/Sys_Role1', '2021-05-02 15:56:15', '超级管理员', '2021-05-02 18:29:18', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (98, '低代码设计器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-news', NULL, 1, 3000, '.', 0, '', '2021-08-30 02:48:10', '超级管理员', '2022-08-24 10:40:45', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (99, '低代码设计器', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 1000, '.', 98, '/formDraggable', '2021-08-30 02:48:34', '超级管理员', '2022-03-27 02:15:01', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (100, '明细表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 2, 0, 'SellOrderList', 74, '', '2021-09-27 00:47:23', '超级管理员', '2021-03-14 23:52:28', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (101, '表单配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'FormDesignOptions', 98, '/FormDesignOptions', '2022-01-03 19:32:02', '超级管理员', '2022-03-27 03:02:12', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (102, '数据收集', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'formCollectionResultTree', 98, '/formCollectionResultTree', '2022-01-03 19:33:09', '超级管理员', '2022-01-10 10:28:14', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (103, '多页签', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 105, '/tabsTable', '2022-01-08 17:14:01', '超级管理员', '2022-01-08 18:06:44', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (104, '多表头', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, '.', 105, '/App_Appointment2', '2022-01-08 17:14:44', '超级管理员', '2022-01-08 18:06:49', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (105, '多页签/多表头', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-document-copy', NULL, 1, 1760, '.', 0, '', '2022-01-08 18:05:53', '超级管理员', '2021-08-02 02:54:23', NULL, NULL);
INSERT INTO `Sys_Menu` VALUES (106, '数据收集(表数据)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 2, 0, 'FormCollectionObject', 98, '/FormCollectionObject', '2022-01-10 10:28:31', '超级管理员', '2022-01-10 10:28:34', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (107, '基础页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 9000, '.', 0, '', '2022-03-26 00:58:41', '超级管理员', '2022-03-26 17:23:59', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (108, '只读页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, 'App_Appointment', 107, 'pages/order/App_Appointment/App_Appointment', '2022-03-26 00:59:36', '超级管理员', '2022-03-27 09:00:19', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (109, '水平显示', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 107, '/pages/order/App_Appointment1/App_Appointment1', '2022-03-26 01:00:38', '超级管理员', '2022-03-26 01:10:16', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (110, '数据源绑定', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 8500, '.', 0, '', '2022-03-26 02:03:48', '超级管理员', '2021-08-30 02:50:12', NULL, 1);
INSERT INTO `Sys_Menu` VALUES (111, '数据源绑定', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'App_TransactionAvgPrice', 110, 'pages/appmanager/App_TransactionAvgPrice/App_TransactionAvgPrice', '2022-03-26 02:04:58', '超级管理员', '2022-03-27 09:00:13', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (112, '事件格式化', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 8200, '.', 0, '', '2022-03-26 03:08:59', '超级管理员', '2022-03-26 17:25:05', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (113, '事件绑定', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, 'App_Transaction', 112, '/pages/appmanager/App_Transaction/App_Transaction', '2022-03-26 03:09:17', '超级管理员', '2022-03-27 09:00:09', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (114, '格式化', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, '.', 112, '/pages/appmanager/App_Transaction1/App_Transaction1', '2022-03-26 03:09:45', '超级管理员', '2022-03-26 22:39:35', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (115, '主从表页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 8100, '.', 0, '', '2022-03-26 03:10:46', '超级管理员', '2022-03-26 03:14:32', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (116, '主表1对1', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'SellOrder', 115, '/pages/order/SellOrder/SellOrder', '2022-03-26 03:11:13', '超级管理员', '2022-03-26 23:29:38', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (117, '表单vol-form', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 8000, '.', 0, '', '2022-03-26 03:12:06', '超级管理员', '2021-08-30 02:50:12', NULL, 1);
INSERT INTO `Sys_Menu` VALUES (118, '表单配置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 10, '.', 117, '/pages/form/form2', '2022-03-26 03:12:39', '超级管理员', '2022-03-27 08:59:33', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (119, '表单只读', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 117, 'pages/form/form1', '2022-03-26 03:12:52', '超级管理员', '2022-03-27 08:59:28', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (120, '表格vol-table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 7900, '.', 0, '', '2022-03-26 03:13:22', '超级管理员', '2022-03-27 02:43:53', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (121, '列表显示table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 120, 'pages/table/table2/table2', '2022-03-26 03:13:47', '超级管理员', '2022-03-27 02:43:58', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (122, '表格显示table', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, 'App_Expert', 120, '/pages/table/table1/table1', '2022-03-26 03:13:59', '超级管理员', '2022-03-27 02:44:00', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (123, '自定义扩展', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 8050, '.', 0, '', '2022-03-26 03:16:13', '超级管理员', '2022-03-27 08:59:44', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (124, '生成页面扩展组件', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 123, 'pages/pagedemo/pagedemo', '2022-03-26 03:16:51', '超级管理员', '2022-03-27 09:04:15', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (125, '手动绑定数据', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 120, 'pages/table/table3/table3', '2022-03-27 03:02:06', '超级管理员', '2022-03-27 02:15:29', NULL, 1);
INSERT INTO `Sys_Menu` VALUES (126, '消息推送', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-chat-line-round', NULL, 1, 2900, '.', 0, '/signalR', '2022-05-04 12:00:00', '超级管理员', '2022-05-05 15:31:04', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (127, '我的任务', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 1500, 'Sys_WorkFlowTable', 89, '/Sys_WorkFlowTable', '2022-08-15 04:33:28', '超级管理员', '2022-08-29 09:55:55', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (128, '发起流程', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '发起流程', 89, '/flowdemo', '2022-08-15 04:33:54', '超级管理员', '2022-08-15 04:34:33', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (129, '定时任务', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-alarm-clock', NULL, 1, 1768, '.', 0, '', '2022-09-06 16:18:22', '超级管理员', '2022-09-06 16:16:06', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (130, '任务配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 100, 'Sys_QuartzOptions', 129, '/Sys_QuartzOptions', '2022-09-06 16:18:52', '超级管理员', '2022-09-07 10:17:34', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (131, '执行记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_QuartzLog', 129, '/Sys_QuartzLog', '2022-09-06 16:19:15', '超级管理员', '2022-09-07 10:18:35', '超级管理员', 0);

-- ----------------------------
-- Table structure for Sys_Province
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Province`;
CREATE TABLE `Sys_Province`  (
  `ProvinceId` int(11) NOT NULL,
  `ProvinceCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ProvinceName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RegionCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProvinceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Province
-- ----------------------------
INSERT INTO `Sys_Province` VALUES (1, '110000', '北京市', '华北');
INSERT INTO `Sys_Province` VALUES (2, '120000', '天津市', '华北');
INSERT INTO `Sys_Province` VALUES (3, '130000', '河北省', '华北');
INSERT INTO `Sys_Province` VALUES (4, '140000', '山西省', '华北');
INSERT INTO `Sys_Province` VALUES (5, '150000', '内蒙古自治区', '华北');
INSERT INTO `Sys_Province` VALUES (6, '210000', '辽宁省', '东北');
INSERT INTO `Sys_Province` VALUES (7, '220000', '吉林省', '东北');
INSERT INTO `Sys_Province` VALUES (8, '230000', '黑龙江省', '东北');
INSERT INTO `Sys_Province` VALUES (9, '310000', '上海市', '华东');
INSERT INTO `Sys_Province` VALUES (10, '320000', '江苏省', '华东');
INSERT INTO `Sys_Province` VALUES (11, '330000', '浙江省', '华东');
INSERT INTO `Sys_Province` VALUES (12, '340000', '安徽省', '华东');
INSERT INTO `Sys_Province` VALUES (13, '350000', '福建省', '华东');
INSERT INTO `Sys_Province` VALUES (14, '360000', '江西省', '华东');
INSERT INTO `Sys_Province` VALUES (15, '370000', '山东省', '华东');
INSERT INTO `Sys_Province` VALUES (16, '410000', '河南省', '华中');
INSERT INTO `Sys_Province` VALUES (17, '420000', '湖北省', '华中');
INSERT INTO `Sys_Province` VALUES (18, '430000', '湖南省', '华中');
INSERT INTO `Sys_Province` VALUES (19, '440000', '广东省', '华南');
INSERT INTO `Sys_Province` VALUES (20, '450000', '广西壮族自治区', '华南');
INSERT INTO `Sys_Province` VALUES (21, '460000', '海南省', '华南');
INSERT INTO `Sys_Province` VALUES (22, '500000', '重庆市', '西南');
INSERT INTO `Sys_Province` VALUES (23, '510000', '四川省', '西南');
INSERT INTO `Sys_Province` VALUES (24, '520000', '贵州省', '西南');
INSERT INTO `Sys_Province` VALUES (25, '530000', '云南省', '西南');
INSERT INTO `Sys_Province` VALUES (26, '540000', '西藏自治区', '西南');
INSERT INTO `Sys_Province` VALUES (27, '610000', '陕西省', '西北');
INSERT INTO `Sys_Province` VALUES (28, '620000', '甘肃省', '西北');
INSERT INTO `Sys_Province` VALUES (29, '630000', '青海省', '西北');
INSERT INTO `Sys_Province` VALUES (30, '640000', '宁夏回族自治区', '西北');
INSERT INTO `Sys_Province` VALUES (31, '650000', '新疆维吾尔自治区', '西北');
INSERT INTO `Sys_Province` VALUES (32, '710000', '台湾省', '港澳台');
INSERT INTO `Sys_Province` VALUES (33, '810000', '香港特别行政区', '港澳台');
INSERT INTO `Sys_Province` VALUES (34, '820000', '澳门特别行政区', '港澳台');
INSERT INTO `Sys_Province` VALUES (35, 'thd', '桃花岛', '东北');
INSERT INTO `Sys_Province` VALUES (43, '测试1', '测试1', '港澳台');

-- ----------------------------
-- Table structure for Sys_QuartzLog
-- ----------------------------
DROP TABLE IF EXISTS `Sys_QuartzLog`;
CREATE TABLE `Sys_QuartzLog`  (
  `LogId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TaskName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `ElapsedTime` int(11) NULL DEFAULT NULL COMMENT '耗时(秒)',
  `StratDate` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `EndDate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `Result` int(11) NULL DEFAULT NULL COMMENT '是否成功',
  `ResponseContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回内容',
  `ErrorMsg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`LogId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_QuartzLog
-- ----------------------------
INSERT INTO `Sys_QuartzLog` VALUES ('019bdc40-0639-45f3-8ed7-4f7bb68669ae', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 16:15:00', '2022-09-08 16:15:00', 1, '2022-09-08 16:15:00', NULL, NULL, NULL, '2022-09-08 16:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('03c984b1-d62a-421e-8680-176d8934a840', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 02:15:00', '2022-09-08 02:15:00', 1, '2022-09-08 02:15:00', NULL, NULL, NULL, '2022-09-08 02:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('05b1d45d-cc32-4858-a953-bf8434fb3370', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-07 21:15:00', '2022-09-07 21:15:01', 1, '2022-09-07 21:15:00', NULL, NULL, NULL, '2022-09-07 21:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('066bd885-db2a-4919-9ab2-b02e376361e3', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 20:30:00', '2022-09-07 20:30:00', 1, '2022-09-07 20:30:00', NULL, NULL, NULL, '2022-09-07 20:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('085dae36-9b0a-4ab4-85a8-9eb92fb19706', '22f72d79-7f6f-4c0f-bf4f-c09c529ddc40', '每日统计', 0, '2022-09-08 09:58:33', '2022-09-08 09:58:33', 1, '<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\"><meta content=\"always\" name=\"referrer\"><meta name=\"description\" content=\"全球领先的中文搜索引擎、致力于让网民更便捷地获取信息，找到所求。百度超过千亿的中文网页数据库，可以瞬间找到相关的搜索结果。\"><link rel=\"shortcut icon\" href=\"//www.baidu.com/favicon.ico\" type=\"image/x-icon\"><link rel=\"search\" type=\"application/opensearchdescription+xml\" href=\"//www.baidu.com/content-search.xml\" title=\"百度搜索\"><title>百度一下，你就知道</title><style type=\"text/css\">body{margin:0;padding:0;text-align:center;background:#fff;height:100%}html{overflow-y:auto;color:#000;overflow:-moz-scrollbars;height:100%}body,input{font-size:12px;font-family:\"PingFang SC\",Arial,\"Microsoft YaHei\",sans-serif}a{text-decoration:none}a:hover{text-decoration:underline}img{border:0;-ms-interpolation-mode:bicubic}input{font-size:100%;border:0}body,form{position:relative;z-index:0}#wrapper{height:100%}#head_wrapper.s-ps-islite{padding-bottom:370px}#head_wrapper.s-ps-islite .s_form{position:relative;z-index:1}#head_wrapper.s-ps-islite .fm{position:absolute;bottom:0}#head_wrapper.s-ps-islite .s-p-top{position:absolute;bottom:40px;width:100%;height:181px}#head_wrapper.s-ps-islite #s_lg_img{position:static;margin:33px auto 0 auto;left:50%}#form{z-index:1}.s_form_wrapper{height:100%}#lh{margin:16px 0 5px;word-spacing:3px}.c-font-normal{font:13px/23px Arial,sans-serif}.c-color-t{color:#222}.c-btn,.c-btn:visited{color:#333!important}.c-btn{display:inline-block;overflow:hidden;font-family:inherit;font-weight:400;text-align:center;vertical-align:middle;outline:0;border:0;height:30px;width:80px;line-height:30px;font-size:13px;border-radius:6px;padding:0;background-color:#f5f5f6;cursor:pointer}.c-btn:hover{background-color:#315efb;color:#fff!important}a.c-btn{text-decoration:none}.c-btn-mini{height:24px;width:48px;line-height:24px}.c-btn-primary,.c-btn-primary:visited{color:#fff!important}.c-btn-primary{background-color:#4e6ef2}.c-btn-primary:hover{background-color:#315efb}a:active{color:#f60}#wrapper{position:relative;min-height:100%}#head{padding-bottom:100px;text-align:center}#wrapper{min-width:1250px;height:100%;min-height:600px}#head{position:relative;padding-bottom:0;height:100%;min-height:600px}.s_form_wrapper{height:100%}.quickdelete-wrap{position:relative}.tools{position:absolute;right:-75px}.s-isindex-wrap{position:relative}#head_wrapper.head_wrapper{width:auto}#head_wrapper{position:relative;height:40%;min-height:314px;max-height:510px;width:1000px;margin:0 auto}#head_wrapper .s-p-top{height:60%;min-height:185px;max-height:310px;position:relative;z-index:0;text-align:center}#head_wrapper input{outline:0;-webkit-appearance:none}#head_wrapper .s_btn_wr,#head_wrapper .s_ipt_wr{display:inline-block;zoom:1;background:0 0;vertical-align:top}#head_wrapper .s_ipt_wr{position:relative;width:546px}#head_wrapper .s_btn_wr{width:108px;height:44px;position:relative;z-index:2}#head_wrapper .s_ipt_wr:hover #kw{border-color:#a7aab5}#head_wrapper #kw{width:512px;height:16px;padding:12px 16px;font-size:16px;margin:0;vertical-align:top;outline:0;box-shadow:none;border-radius:10px 0 0 10px;border:2px solid #c4c7ce;background:#fff;color:#222;overflow:hidden;box-sizing:content-box}#head_wrapper #kw:focus{border-color:#4e6ef2!important;opacity:1}#head_wrapper .s_form{width:654px;height:100%;margin:0 auto;text-align:left;z-index:100}#head_wrapper .s_btn{cursor:pointer;width:108px;height:44px;line-height:45px;padding:0;background:0 0;background-color:#4e6ef2;border-radius:0 10px 10px 0;font-size:17px;color:#fff;box-shadow:none;font-weight:400;border:none;outline:0}#head_wrapper .s_btn:hover{background-color:#4662d9}#head_wrapper .s_btn:active{background-color:#4662d9}#head_wrapper .quickdelete-wrap{position:relative}#s_top_wrap{position:absolute;z-index:99;min-width:1000px;width:100%}.s-top-left{position:absolute;left:0;top:0;z-index:100;height:60px;padding-left:24px}.s-top-left .mnav{margin-right:31px;margin-top:19px;display:inline-block;position:relative}.s-top-left .mnav:hover .s-bri,.s-top-left a:hover{color:#315efb;text-decoration:none}.s-top-left .s-top-more-btn{padding-bottom:19px}.s-top-left .s-top-more-btn:hover .s-top-more{display:block}.s-top-right{position:absolute;right:0;top:0;z-index:100;height:60px;padding-right:24px}.s-top-right .s-top-right-text{margin-left:32px;margin-top:19px;display:inline-block;position:relative;vertical-align:top;cursor:pointer}.s-top-right .s-top-right-text:hover{color:#315efb}.s-top-right .s-top-login-btn{display:inline-block;margin-top:18px;margin-left:32px;font-size:13px}.s-top-right a:hover{text-decoration:none}#bottom_layer{width:100%;position:fixed;z-index:302;bottom:0;left:0;height:39px;padding-top:1px;overflow:hidden;zoom:1;margin:0;line-height:39px;background:#fff}#bottom_layer .lh{display:inline;margin-right:20px}#bottom_layer .lh:last-child{margin-left:-2px;margin-right:0}#bottom_layer .lh.activity{font-weight:700;text-decoration:underline}#bottom_layer a{font-size:12px;text-decoration:none}#bottom_layer .text-color{color:#bbb}#bottom_layer a:hover{color:#222}#bottom_layer .s-bottom-layer-content{text-align:center}</style></head><body><div id=\"wrapper\" class=\"wrapper_new\"><div id=\"head\"><div id=\"s-top-left\" class=\"s-top-left s-isindex-wrap\"><a href=\"//news.baidu.com/\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">新闻</a><a href=\"//www.hao123.com/\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">hao123</a><a href=\"//map.baidu.com/\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">地图</a><a href=\"//live.baidu.com/\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">直播</a><a href=\"//haokan.baidu.com/?sfrom=baidu-top\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">视频</a><a href=\"//tieba.baidu.com/\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">贴吧</a><a href=\"//xueshu.baidu.com/\" target=\"_blank\" class=\"mnav c-font-normal c-color-t\">学术</a><div class=\"mnav s-top-more-btn\"><a href=\"//www.baidu.com/more/\" name=\"tj_briicon\" class=\"s-bri c-font-normal c-color-t\" target=\"_blank\">更多</a></div></div><div id=\"u1\" class=\"s-top-right s-isindex-wrap\"><a class=\"s-top-login-btn c-btn c-btn-primary c-btn-mini lb\" style=\"position:relative;overflow:visible\" name=\"tj_login\" href=\"//www.baidu.com/bdorz/login.gif?login&amp;tpl=mn&amp;u=http%3A%2F%2Fwww.baidu.com%2f%3fbdorz_come%3d1\">登录</a></div><div id=\"head_wrapper\" class=\"head_wrapper s-isindex-wrap s-ps-islite\"><div class=\"s_form\"><div class=\"s_form_wrapper\"><div id=\"lg\" class=\"s-p-top\"><img hidefocus=\"true\" id=\"s_lg_img\" class=\"index-logo-src\" src=\"//www.baidu.com/img/flexible/logo/pc/index.png\" width=\"270\" height=\"129\" usemap=\"#mp\"><map name=\"mp\"><area style=\"outline:0\" hidefocus=\"true\" shape=\"rect\" coords=\"0,0,270,129\" href=\"//www.baidu.com/s?wd=%E7%99%BE%E5%BA%A6%E7%83%AD%E6%90%9C&amp;sa=ire_dl_gh_logo_texing&amp;rsv_dl=igh_logo_pcs\" target=\"_blank\" title=\"点击一下，了解更多\"></map></div><a href=\"//www.baidu.com/\" id=\"result_logo\"></a><form id=\"form\" name=\"f\" action=\"//www.baidu.com/s\" class=\"fm\"><input type=\"hidden\" name=\"ie\" value=\"utf-8\"> <input type=\"hidden\" name=\"f\" value=\"8\"> <input type=\"hidden\" name=\"rsv_bp\" value=\"1\"> <input type=\"hidden\" name=\"rsv_idx\" value=\"1\"> <input type=\"hidden\" name=\"ch\" value=\"\"> <input type=\"hidden\" name=\"tn\" value=\"baidu\"> <input type=\"hidden\" name=\"bar\" value=\"\"> <span class=\"s_ipt_wr quickdelete-wrap\"><input id=\"kw\" name=\"wd\" class=\"s_ipt\" value=\"\" maxlength=\"255\" autocomplete=\"off\"> </span><span class=\"s_btn_wr\"><input type=\"submit\" id=\"su\" value=\"百度一下\" class=\"bg s_btn\"> </span><input type=\"hidden\" name=\"rn\" value=\"\"> <input type=\"hidden\" name=\"fenlei\" value=\"256\"> <input type=\"hidden\" name=\"oq\" value=\"\"> <input type=\"hidden\" name=\"rsv_pq\" value=\"b9ff093e0000e419\"> <input type=\"hidden\" name=\"rsv_t\" value=\"3635FYbdbC8tlWmudZmYaUnaucNe+RzTzNEGqg/JuniQU10WL5mtMQehIrU\"> <input type=\"hidden\" name=\"rqlang\" value=\"cn\"> <input type=\"hidden\" name=\"rsv_enter\" value=\"1\"> <input type=\"hidden\" name=\"rsv_dl\" value=\"ib\"></form></div></div></div><div id=\"bottom_layer\" class=\"s-bottom-layer s-isindex-wrap\"><div class=\"s-bottom-layer-content\"><p class=\"lh\"><a class=\"text-color\" href=\"//home.baidu.com/\" target=\"_blank\">关于百度</a></p><p class=\"lh\"><a class=\"text-color\" href=\"//ir.baidu.com/\" target=\"_blank\">About Baidu</a></p><p class=\"lh\"><a class=\"text-color\" href=\"//www.baidu.com/duty\" target=\"_blank\">使用百度前必读</a></p><p class=\"lh\"><a class=\"text-color\" href=\"//help.baidu.com/\" target=\"_blank\">帮助中心</a></p><p class=\"lh\"><a class=\"text-color\" href=\"//www.beian.gov.cn/portal/registerSystemInfo?recordcode=11000002000001\" target=\"_blank\">京公网安备11000002000001号</a></p><p class=\"lh\"><a class=\"text-color\" href=\"//beian.miit.gov.cn/\" target=\"_blank\">京ICP证030173号</a></p><p class=\"lh\"><span id=\"year\" class=\"text-color\"></span></p><p class=\"lh\"><span class=\"text-color\">互联网药品信息服务资格证书 (京)-经营性-2017-0020</span></p><p class=\"lh\"><a class=\"text-color\" href=\"//www.baidu.com/licence/\" target=\"_blank\">信息网络传播视听节目许可证 0110516</a></p></div></div></div></div><script type=\"text/javascript\">var date=new Date,year=date.getFullYear();document.getElementById(\"year\").innerText=\"©\"+year+\" Baidu \"</script></body></html>', NULL, NULL, NULL, '2022-09-08 09:58:33', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('0af25760-0338-446b-92bc-14c32e05cf48', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 14:30:00', '2022-09-08 14:30:00', 1, '2022-09-08 14:30:00', NULL, NULL, NULL, '2022-09-08 14:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('0b886c25-96b2-482b-992c-6da0da978ba4', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 03:30:00', '2022-09-08 03:30:00', 1, '2022-09-08 03:30:00', NULL, NULL, NULL, '2022-09-08 03:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('111fe09b-41be-4232-99a1-2b4c86e67aaa', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 02:30:00', '2022-09-08 02:30:00', 1, '2022-09-08 02:30:00', NULL, NULL, NULL, '2022-09-08 02:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('12f5f896-b786-4f5b-bbb9-0492212757d5', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 14:00:00', '2022-09-08 14:00:00', 1, '2022-09-08 14:00:00', NULL, NULL, NULL, '2022-09-08 14:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1447a0d3-9c4f-43e3-8b69-8ee5e7ee3b79', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 08:45:00', '2022-09-08 08:45:00', 1, '2022-09-08 08:45:00', NULL, NULL, NULL, '2022-09-08 08:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('152cd4b4-cbd8-41be-aacb-61427e99c505', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 17:30:00', '2022-09-08 17:30:00', 1, '2022-09-08 17:30:00', NULL, NULL, NULL, '2022-09-08 17:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('16a79c27-3612-454e-9262-e7dbddfe600a', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 12:15:00', '2022-09-08 12:15:00', 1, '2022-09-08 12:15:00', NULL, NULL, NULL, '2022-09-08 12:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('17c0a465-cbef-49f3-a36f-e93f08efc662', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 10:45:00', '2022-09-08 10:45:00', 1, '2022-09-08 10:45:00', NULL, NULL, NULL, '2022-09-08 10:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1811b372-1b2d-4231-b3bc-2bba2ab689e5', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 18:15:00', '2022-09-08 18:15:00', 1, '2022-09-08 18:15:00', NULL, NULL, NULL, '2022-09-08 18:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('182ac040-82c4-455e-9de7-b97f60c89018', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 09:58:32', '2022-09-08 09:58:32', 1, '2022-09-08 09:58:32', NULL, NULL, NULL, '2022-09-08 09:58:32', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1839d26c-e93d-473b-83e5-6aa49fec703e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 19:00:00', '2022-09-08 19:00:00', 1, '2022-09-08 19:00:00', NULL, NULL, NULL, '2022-09-08 19:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('193a3b69-5de0-4d88-9e2a-ab1670863b29', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-08 00:45:00', '2022-09-08 00:45:01', 1, '2022-09-08 00:45:00', NULL, NULL, NULL, '2022-09-08 00:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('19ad3008-463a-403c-9b9d-b6bd4d9d5bb7', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 18:45:00', '2022-09-07 18:45:00', 1, '2022-09-07 18:45:00', NULL, NULL, NULL, '2022-09-07 18:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1ae8398c-5b59-43a3-8145-85eb12f9f668', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:51:36', '2022-09-07 13:51:36', 1, '2022-09-07 13:51:36', NULL, NULL, NULL, '2022-09-07 13:51:36', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1cfd52a3-0d50-403d-939b-ce069cb87155', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 14:45:00', '2022-09-08 14:45:00', 1, '2022-09-08 14:45:00', NULL, NULL, NULL, '2022-09-08 14:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1d7b0608-ae7d-4089-8f73-f36e26463602', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 04:45:00', '2022-09-08 04:45:00', 1, '2022-09-08 04:45:00', NULL, NULL, NULL, '2022-09-08 04:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('1e436a53-ac9b-4250-96a2-d21cbd204b99', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 15:00:00', '2022-09-08 15:00:00', 1, '2022-09-08 15:00:00', NULL, NULL, NULL, '2022-09-08 15:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('2009a710-8c2a-4d25-80cf-92040a14184a', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:52:36', '2022-09-07 13:52:36', 1, '2022-09-07 13:52:35', NULL, NULL, NULL, '2022-09-07 13:52:36', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('22334644-16cf-4210-bb08-295f5de840c0', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 16:30:00', '2022-09-08 16:30:00', 1, '2022-09-08 16:30:00', NULL, NULL, NULL, '2022-09-08 16:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('2324474e-48f1-41e7-822e-5b5bbc6b78ec', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 22:30:00', '2022-09-07 22:30:00', 1, '2022-09-07 22:30:00', NULL, NULL, NULL, '2022-09-07 22:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('253148a6-c840-460c-8ef8-0931b15422d1', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 14:45:00', '2022-09-07 14:45:00', 1, '2022-09-07 14:45:00', NULL, NULL, NULL, '2022-09-07 14:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('297c1fbe-b7a8-41a1-90be-c12dfe565f9e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 03:15:00', '2022-09-08 03:15:00', 1, '2022-09-08 03:15:00', NULL, NULL, NULL, '2022-09-08 03:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('2cc1e2b9-29d5-444e-b6a0-4f665903b2b6', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 19:45:00', '2022-09-07 19:45:00', 1, '2022-09-07 19:45:00', NULL, NULL, NULL, '2022-09-07 19:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('3265e905-820e-4e81-afea-cf2fb1dbdd4e', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 17:30:00', '2022-09-07 17:30:00', 1, '2022-09-07 17:30:00', NULL, NULL, NULL, '2022-09-07 17:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('3559f917-d3b1-4471-a5d3-eae31062b87f', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 13:47:06', '2022-09-07 13:47:06', 1, '2022-09-07 13:47:05', NULL, NULL, NULL, '2022-09-07 13:47:06', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('355cf673-d600-4367-a2b6-4f8f85e45501', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 01:45:00', '2022-09-08 01:45:00', 1, '2022-09-08 01:45:00', NULL, NULL, NULL, '2022-09-08 01:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('38124247-7a3b-4f3b-936c-3a888a371e04', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 02:45:00', '2022-09-08 02:45:00', 1, '2022-09-08 02:45:00', NULL, NULL, NULL, '2022-09-08 02:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('385e6964-214c-4367-9de0-75226a5f2d3c', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 05:15:00', '2022-09-08 05:15:00', 1, '2022-09-08 05:15:00', NULL, NULL, NULL, '2022-09-08 05:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('39163755-82a3-452b-908a-7e92191b2f6f', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 17:00:00', '2022-09-08 17:00:00', 1, '2022-09-08 17:00:00', NULL, NULL, NULL, '2022-09-08 17:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('3927ebde-5c42-415c-8a58-c007bc0e3755', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 18:00:00', '2022-09-07 18:00:00', 1, '2022-09-07 18:00:00', NULL, NULL, NULL, '2022-09-07 18:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('39b7c61f-d257-4ec9-bdde-00243f45b15b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 18:30:00', '2022-09-08 18:30:00', 1, '2022-09-08 18:30:00', NULL, NULL, NULL, '2022-09-08 18:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('3d727b99-1abc-42a5-ae95-a3b3f0e0cfa3', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 17:30:00', '2022-09-07 17:30:00', 1, '2022-09-07 17:30:00', NULL, NULL, NULL, '2022-09-07 17:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('3dd171b4-59b1-4f45-a7e3-b4946f2f9a2b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 15:15:00', '2022-09-07 15:15:00', 1, '2022-09-07 15:15:00', NULL, NULL, NULL, '2022-09-07 15:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('3e57e825-06ce-43ad-8072-11465ec9e20b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 07:30:00', '2022-09-08 07:30:00', 1, '2022-09-08 07:30:00', NULL, NULL, NULL, '2022-09-08 07:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('40b13534-6742-4400-b76b-353735ea789d', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 01:30:00', '2022-09-08 01:30:00', 1, '2022-09-08 01:30:00', NULL, NULL, NULL, '2022-09-08 01:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('41764336-ed1f-454e-9c51-1fde5a2b7bf2', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 06:15:00', '2022-09-08 06:15:00', 1, '2022-09-08 06:15:00', NULL, NULL, NULL, '2022-09-08 06:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('41c08ed1-4f07-4af9-aa14-ade00f85fb4a', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 15:15:00', '2022-09-08 15:15:00', 1, '2022-09-08 15:15:00', NULL, NULL, NULL, '2022-09-08 15:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('4237810e-20b3-4c44-aa29-03a65f2076e3', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 15:45:00', '2022-09-08 15:45:00', 1, '2022-09-08 15:45:00', NULL, NULL, NULL, '2022-09-08 15:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('435f0e64-8949-48c4-9619-da8bb00f6a35', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 15:30:00', '2022-09-08 15:30:00', 1, '2022-09-08 15:30:00', NULL, NULL, NULL, '2022-09-08 15:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('4747d877-e85e-4f4a-93b3-a4b70b6d71af', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 13:00:00', '2022-09-08 13:00:00', 1, '2022-09-08 13:00:00', NULL, NULL, NULL, '2022-09-08 13:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('47f42653-37c9-4bb1-86aa-4ed40df975a7', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-08 12:30:00', '2022-09-08 12:30:01', 1, '2022-09-08 12:30:00', NULL, NULL, NULL, '2022-09-08 12:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('49154394-6694-4b8e-b11c-c933764ad3f4', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 15:30:00', '2022-09-07 15:30:00', 1, '2022-09-07 15:30:00', NULL, NULL, NULL, '2022-09-07 15:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('4bf01701-286e-428f-964c-7414443bce33', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 15:45:00', '2022-09-07 15:45:00', 1, '2022-09-07 15:45:00', NULL, NULL, NULL, '2022-09-07 15:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('4d9fd686-394d-4aa2-83aa-e9eee3c8f126', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 04:00:00', '2022-09-08 04:00:00', 1, '2022-09-08 04:00:00', NULL, NULL, NULL, '2022-09-08 04:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('4fcade99-d8c4-45a2-8d1b-e45b0d75ad18', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 18:00:00', '2022-09-08 18:00:00', 1, '2022-09-08 18:00:00', NULL, NULL, NULL, '2022-09-08 18:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('50119ea9-a3f2-48f0-a6a3-40fb5c7c5878', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 19:00:00', '2022-09-08 19:00:00', 1, '2022-09-08 19:00:00', NULL, NULL, NULL, '2022-09-08 19:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('5105db4d-ac25-455a-a464-b787f1bcad73', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 14:30:00', '2022-09-07 14:30:01', 1, '2022-09-07 14:30:00', NULL, NULL, NULL, '2022-09-07 14:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('539a7380-a8e2-4dc7-adfc-f7565b2bbe86', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 16:15:00', '2022-09-07 16:15:00', 1, '2022-09-07 16:15:00', NULL, NULL, NULL, '2022-09-07 16:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('5469065a-408e-42e8-b7cd-9f0c6f23d24a', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 16:00:00', '2022-09-08 16:00:00', 1, '2022-09-08 16:00:00', NULL, NULL, NULL, '2022-09-08 16:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('54a85d16-9381-4d2b-88b2-8aa2c66c784f', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 13:47:11', '2022-09-07 13:47:11', 1, '2022-09-07 13:47:11', NULL, NULL, NULL, '2022-09-07 13:47:11', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('55656a86-bb1f-458b-8831-55ec7b1435be', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 18:30:00', '2022-09-07 18:30:00', 1, '2022-09-07 18:30:00', NULL, NULL, NULL, '2022-09-07 18:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('562252e1-13ce-4a0d-8b20-b969fc052dba', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 15:30:00', '2022-09-07 15:30:00', 1, '2022-09-07 15:30:00', NULL, NULL, NULL, '2022-09-07 15:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('56752e66-9bca-4a0e-9294-97610b1a6bd2', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 13:30:00', '2022-09-08 13:30:00', 1, '2022-09-08 13:30:00', NULL, NULL, NULL, '2022-09-08 13:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('56e880bf-7f0e-4886-a035-b7f01e4c6925', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 18:15:00', '2022-09-07 18:15:00', 1, '2022-09-07 18:15:00', NULL, NULL, NULL, '2022-09-07 18:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('578d96b1-d56c-4f0b-855f-d5733c87dc48', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-08 11:30:00', '2022-09-08 11:30:01', 1, '2022-09-08 11:30:00', NULL, NULL, NULL, '2022-09-08 11:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('597881a4-54ab-4b81-8742-4a8e5bd74629', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 08:00:00', '2022-09-08 08:00:00', 1, '2022-09-08 08:00:00', NULL, NULL, NULL, '2022-09-08 08:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('5b6fe8f3-8338-4fad-bbba-b46fcc3a50da', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 14:00:00', '2022-09-07 14:00:00', 1, '2022-09-07 14:00:00', NULL, NULL, NULL, '2022-09-07 14:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('5c4b0ce6-b661-4b39-af93-5139f2922c60', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 1, '2022-09-07 15:00:00', '2022-09-07 15:00:01', 1, '2022-09-07 15:00:00', NULL, NULL, NULL, '2022-09-07 15:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('5d3c355e-5692-4878-94a2-b063fcd9be70', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 05:30:00', '2022-09-08 05:30:00', 1, '2022-09-08 05:30:00', NULL, NULL, NULL, '2022-09-08 05:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('5e4f18ec-563b-4fe6-9d45-2c008155713e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 16:00:00', '2022-09-08 16:00:00', 1, '2022-09-08 16:00:00', NULL, NULL, NULL, '2022-09-08 16:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6007bdfa-9ec3-4b99-9590-66a278e773aa', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 21:45:00', '2022-09-07 21:45:00', 1, '2022-09-07 21:45:00', NULL, NULL, NULL, '2022-09-07 21:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('61f1b819-cb18-470d-8d74-e40748d0eff9', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 17:15:00', '2022-09-08 17:15:00', 1, '2022-09-08 17:15:00', NULL, NULL, NULL, '2022-09-08 17:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('63d0b4c2-8fe0-4a85-937a-c0f8ce9e12fb', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 19:30:00', '2022-09-07 19:30:00', 1, '2022-09-07 19:30:00', NULL, NULL, NULL, '2022-09-07 19:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('64a85896-474e-4b5b-bc2b-5cc4d59ee22b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 14:30:00', '2022-09-08 14:30:00', 1, '2022-09-08 14:30:00', NULL, NULL, NULL, '2022-09-08 14:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('67c6992d-71a6-49c0-9473-dc3e209a671b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 08:15:00', '2022-09-08 08:15:00', 1, '2022-09-08 08:15:00', NULL, NULL, NULL, '2022-09-08 08:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('694613e2-48db-429d-a617-2d1962c4a0af', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 09:45:00', '2022-09-08 09:45:00', 1, '2022-09-08 09:45:00', NULL, NULL, NULL, '2022-09-08 09:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('69476c25-7485-4bbc-8cd2-95327757d8ba', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 20:00:00', '2022-09-07 20:00:00', 1, '2022-09-07 20:00:00', NULL, NULL, NULL, '2022-09-07 20:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('695b29a2-677d-425a-81d9-4df7a2c25b83', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 13:30:00', '2022-09-08 13:30:00', 1, '2022-09-08 13:30:00', NULL, NULL, NULL, '2022-09-08 13:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('697714b1-0800-4f09-b3e4-6ddcae5cb281', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-07 22:45:00', '2022-09-07 22:45:01', 1, '2022-09-07 22:45:00', NULL, NULL, NULL, '2022-09-07 22:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6b02da5e-e17e-4a4f-8dac-52ed86a79cea', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 11:00:00', '2022-09-08 11:00:00', 1, '2022-09-08 11:00:00', NULL, NULL, NULL, '2022-09-08 11:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6bc3d6e6-8c5c-4dd8-9ffc-c047b99d7f7f', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 18:30:00', '2022-09-08 18:30:00', 1, '2022-09-08 18:30:00', NULL, NULL, NULL, '2022-09-08 18:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6c4cd1af-d5c7-4953-a804-2989fcc87a59', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 14:15:00', '2022-09-08 14:15:00', 1, '2022-09-08 14:15:00', NULL, NULL, NULL, '2022-09-08 14:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6c6ae225-4c23-4717-92c7-8f176c0df9f1', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:49:23', '2022-09-07 13:49:23', 1, '2022-09-07 13:49:22', NULL, NULL, NULL, '2022-09-07 13:49:23', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6e0b4859-8a58-4103-b78c-12fd5b34483b', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 1, '2022-09-08 10:30:00', '2022-09-08 10:30:01', 1, '2022-09-08 10:30:01', NULL, NULL, NULL, '2022-09-08 10:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6f5a2e7c-e807-4ea4-b1d3-b1a38aabd267', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 01:00:00', '2022-09-08 01:00:00', 1, '2022-09-08 01:00:00', NULL, NULL, NULL, '2022-09-08 01:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6f788d5e-bd34-4567-b39c-56755198eea0', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 06:00:00', '2022-09-08 06:00:00', 1, '2022-09-08 06:00:00', NULL, NULL, NULL, '2022-09-08 06:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('6f943ffc-e2e5-4fde-bb72-11d72f50b372', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 16:00:00', '2022-09-07 16:00:00', 1, '2022-09-07 16:00:00', NULL, NULL, NULL, '2022-09-07 16:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('70055bfa-2c4c-4647-beda-4dd02e26fee0', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 18:00:00', '2022-09-07 18:00:00', 1, '2022-09-07 18:00:00', NULL, NULL, NULL, '2022-09-07 18:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('72824923-6bda-4dc2-a114-919405d16a36', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 08:30:00', '2022-09-08 08:30:00', 1, '2022-09-08 08:30:00', NULL, NULL, NULL, '2022-09-08 08:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('759a5ea8-7c99-4f18-84ef-2238e6b9db21', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 15:30:00', '2022-09-08 15:30:00', 1, '2022-09-08 15:30:00', NULL, NULL, NULL, '2022-09-08 15:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('78e5be47-4c61-4e6a-b524-b819dd279965', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:52:44', '2022-09-07 13:52:44', 1, '2022-09-07 13:52:43', NULL, NULL, NULL, '2022-09-07 13:52:44', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('7e59ca6f-033e-4b27-850e-6a26d2102437', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:48:23', '2022-09-07 13:48:23', 1, '<!DOCTYPE html>\r\n<!--STATUS OK-->\r\n<html>\r\n<head>\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\r\n    <meta content=\"always\" name=\"referrer\">\r\n    <script src=\"https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/nocache/imgdata/seErrorRec.js\"></script>\r\n    <title>页面不存在_百度搜索</title>\r\n    <style data-for=\"result\">\r\n        body {color: #333; background: #fff; padding: 0; margin: 0; position: relative; min-width: 700px; font-family: Arial, \'Microsoft YaHei\'; font-size: 12px }\r\n        p, form, ol, ul, li, dl, dt, dd, h3 {margin: 0; padding: 0; list-style: none }\r\n        input {padding-top: 0; padding-bottom: 0; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box } img {border: none; }\r\n        .logo {width: 117px; height: 38px; cursor: pointer }\r\n         #wrapper {_zoom: 1 }\r\n        #head {padding-left: 35px; margin-bottom: 20px; width: 900px }\r\n        .fm {clear: both; position: relative; z-index: 297 }\r\n        .btn, #more {font-size: 14px } \r\n        .s_btn {width: 95px; height: 32px; padding-top: 2px\\9; font-size: 14px; padding: 0; background-color: #ddd; background-position: 0 -48px; border: 0; cursor: pointer }\r\n        .s_btn_h {background-position: -240px -48px }\r\n        .s_btn_wr {width: 97px; height: 34px; display: inline-block; background-position: -120px -48px; *position: relative; z-index: 0; vertical-align: top }\r\n        #foot {}\r\n        #foot span {color: #666 }\r\n        .s_ipt_wr {height: 32px }\r\n        .s_form:after, .s_tab:after {content: \".\"; display: block; height: 0; clear: both; visibility: hidden }\r\n        .s_form {zoom: 1; height: 55px; padding: 0 0 0 10px }\r\n        #result_logo {float: left; margin: 7px 0 0 }\r\n        #result_logo img {width: 101px }\r\n        #head {padding: 0; margin: 0; width: 100%; position: absolute; z-index: 301; min-width: 1000px; background: #fff; border-bottom: 1px solid #ebebeb; position: fixed; _position: absolute; -webkit-transform: translateZ(0) }\r\n        #head .head_wrapper {_width: 1000px }\r\n        #head.s_down {box-shadow: 0 0 5px #888 }\r\n        .fm {clear: none; float: left; margin: 11px 0 0 10px }\r\n        #s_tab {background: #f8f8f8; line-height: 36px; height: 38px; padding: 55px 0 0 121px; float: none; zoom: 1 }\r\n        #s_tab a, #s_tab b {display: inline-block; text-decoration: none; text-align: center; color: #666; font-size: 14px }\r\n        #s_tab b {border-bottom: 2px solid #4E6EF2; color: #222 }\r\n        #s_tab a:hover {color: #323232 }\r\n        #content_left {width: 540px; padding-left: 149px;padding-top: 2px;}\r\n        .to_tieba, .to_zhidao_bottom {margin: 10px 0 0 121px }\r\n        #help {background: #f5f6f5; zoom: 1; padding: 0 0 0 50px; float: right }\r\n        #help a {color: #9195a3; padding-right: 21px; text-decoration: none }\r\n        #help a:hover {color: #333 }\r\n        #foot {position: fixed; bottom:0; width: 100%; background: #f5f6f5; border-top: 1px solid #ebebeb; text-align: left; height: 42px; line-height: 42px; margin-top: 40px; *margin-top: 0; _position:absolute; _bottom:auto; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))); }\r\n\r\n        .content_none {padding: 45px 0 25px 121px } .s_ipt_wr.bg,\r\n        .s_btn_wr.bg, #su.bg {background-image: none }\r\n        .s_ipt_wr.bg {background: 0 }\r\n        .s_btn_wr {width: auto; height: auto; border-bottom: 1px solid transparent; *border-bottom: 0 }\r\n        .s_btn {width: 100px; height: 34px; color: white; letter-spacing: 1px; background: #3385ff; border-bottom: 1px solid #2d78f4; outline: medium; *border-bottom: 0; -webkit-appearance: none; -webkit-border-radius: 0 }\r\n        .s_btn:hover {background: #317ef3; border-bottom: 1px solid #2868c8; *border-bottom: 0; box-shadow: 1px 1px 1px #ccc }\r\n        .s_btn:active {background: #3075dc; box-shadow: inset 1px 1px 3px #2964bb; -webkit-box-shadow: inset 1px 1px 3px #2964bb; -moz-box-shadow: inset 1px 1px 3px #2964bb; -o-box-shadow: inset 1px 1px 3px #2964bb }\r\n        #lg {display: none }\r\n        #head .headBlock {margin: -5px 0 6px 121px }\r\n        #content_left .leftBlock {margin-bottom: 14px; padding-bottom: 5px; border-bottom: 1px solid #f3f3f3 }\r\n        .s_ipt_wr {border: 1px solid #b6b6b6; border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b; background: #fff; display: inline-block; vertical-align: top; width: 592px; margin-right: 0; border-right-width: 0; border-color: #b8b8b8 transparent #ccc #b8b8b8; overflow: hidden }\r\n        .s_ipt_wr.ip_short {width: 439px; }\r\n        .s_ipt_wr:hover, .s_ipt_wr.ipthover {border-color: #999 transparent #b3b3b3 #999 }\r\n        .s_ipt_wr.iptfocus {border-color: #4e6ef2 transparent #4e6ef2 #4e6ef2 }\r\n        .s_ipt_tip {color: #aaa; position: absolute; z-index: -10; font: 16px/22px arial; height: 32px; line-height: 32px; padding-left: 7px; overflow: hidden; width: 526px }\r\n        .s_ipt {width: 526px; height: 22px; font: 16px/18px arial; line-height: 22px\\9; margin: 6px 0 0 7px; padding: 0; background: transparent; border: 0; outline: 0; -webkit-appearance: none }\r\n        #kw {position: relative;display: inline-block;}\r\n        input::-ms-clear {display: none }\r\n        /*Error page css*/\r\n        .norsSuggest {display: inline-block; color: #333; font-family: arial; font-size: 13px; position: relative; } \r\n        .norsTitle {font-size: 22px;font-weight: normal; color: #333; margin: 29px 0 25px 0; }\r\n        .norsTitle2 {font-family: arial; font-size: 13px; color: #666; }\r\n        .norsSuggest ol {margin-left: 47px; }\r\n        .norsSuggest li {margin: 13px 0; }\r\n        #content_right {\r\n    border-left: 1px solid #e1e1e1;\r\n    width: 384px;\r\n    margin-top: 20px;\r\n    float: right;\r\n    padding-left: 17px;\r\n}\r\n#wrapper_wrapper {\r\n    width: 1235px;\r\n    margin-top: 50px;\r\n}\r\n.cr-content {\r\n    width: 351px;\r\n    font-size: 13px;\r\n    line-height: 1.54em;\r\n    color: #333;\r\n    margin-top: 8px;\r\n    margin-left: 19px;\r\n    word-wrap: break-word;\r\n    word-break: normal;\r\n}\r\n@media screen and (max-width: 1217px) {\r\n    #wrapper_wrapper {\r\n        width: 1002px;\r\n    }\r\n    #wrapper_wrapper #content_right {\r\n        width: 271px;\r\n    }\r\n    #wrapper_wrapper .cr-content {\r\n        width: 259px;\r\n    }\r\n}\r\n.opr-toplist-title {\r\n    position: relative;\r\n    font-size: 14px;\r\n    line-height: 1.29em;\r\n    font-weight: 700;\r\n    margin-bottom: 3px;\r\n    font: 14px/22px Arial,sans-serif;\r\n    color: #222;\r\n    font-weight: 400;\r\n}\r\n.opr-toplist-table {\r\n    width: 100%;\r\n    border-collapse: collapse;\r\n    border-spacing: 0;\r\n    font-size: 13px;\r\n}\r\n.opr-toplist-table th,td {\r\n    line-height: 1.54;\r\n    border-bottom: 1px solid #f3f3f3;\r\n    text-align: left;\r\n}\r\n.opr-toplist-table thead th {\r\n    padding-top: 4px;\r\n    padding-bottom: 4px;\r\n    font-weight: 400;\r\n    color: #666;\r\n    white-space: nowrap;\r\n    background-color: #fafafa;  \r\n}\r\n.opr-toplist-table .opr-toplist-right {\r\n    text-align: right;\r\n    white-space: nowrap;\r\n}\r\n.opr-toplist-table td {\r\n    width: 100%;\r\n    font-size: 13px;\r\n    padding-top: 5.5px;\r\n    padding-bottom: 5.5px;\r\n    vertical-align: top;\r\n}\r\n.opr-toplist-table a:hover {\r\n    color: #315EFB;\r\n    text-decoration: underline;\r\n}\r\n.opr-toplist-table td{\r\n    padding-top: 5px 0;\r\n    border: none!important;\r\n    height: 20px;\r\n    line-height: 20px!important;\r\n}\r\n.opr-item-text{\r\n    font: 14px/22px Arial,sans-serif;\r\n    color: #2440B3;\r\n}\r\n.opr-index-item {\r\n    display: inline-block;\r\n    padding:1px 0;\r\n    color: #9195A3;\r\n    width: 20px;\r\n    height: 16px;\r\n    line-height: 100%;\r\n    font-size: 15px;\r\n    margin-right: 1px;\r\n    text-align: left;\r\n}\r\n.opr-index-hot1 {\r\n    color: #f54545;\r\n}\r\n\r\n.opr-index-hot2 {\r\n    color: #ff8547;\r\n}\r\n.opr-index-hot3 {\r\n    color: #ffac38;\r\n}\r\n.opr-item-text {\r\n    text-decoration: none;  \r\n}\r\n.opr-toplist-info {\r\n    color: #666;\r\n    text-align: right;\r\n    margin-top: 5px;\r\n}\r\n.opr-toplist-info>a {\r\n    color: #666;\r\n}\r\n/* 新加 */\r\n@font-face {\r\n  font-family: \'cIconfont\';\r\n  src: url(\'./font/iconfont.eot\');\r\n  src: url(\'./font/iconfont.eot?#iefix\') format(\'embedded-opentype\'),\r\n    url(\'./font/iconfont.woff2\') format(\'woff2\'),\r\n    url(\'./font/iconfont.woff\') format(\'woff\'),\r\n    url(\'./font/iconfont.ttf\') format(\'truetype\'),\r\n    url(\'./font/iconfont.svg#iconfont\') format(\'svg\');\r\n}\r\n.s_form {\r\n    zoom: 1;\r\n    padding: 15px 0 4px 16px;\r\n    height: 40px;\r\n    font-size: 0;\r\n}\r\n#result_logo{\r\n    margin-top: 2px;\r\n}\r\n#result_logo img {\r\n    width: 101px;\r\n    height: 33px;\r\n}\r\n.fm {\r\n    margin-left: 19px;\r\n}\r\n.s_ipt_wr{\r\n    box-sizing: border-box;\r\n    height:40px;\r\n    line-height: 40px;\r\n    border: 2px solid #c4c7ce;\r\n    border-radius: 10px 0 0 10px;\r\n    border-right: 0;\r\n    overflow: visible;\r\n}\r\n.s_btn_wr .s_btn{\r\n    cursor: pointer;\r\n    width: 112px;\r\n    height: 40px;\r\n    line-height: 41px;\r\n    line-height: 40px\\9;\r\n    background-color: #4e6ef2;\r\n    border-radius: 0 10px 10px 0;\r\n    font-size: 17px;\r\n    box-shadow: none;\r\n    font-weight: 400;\r\n    border: 0;\r\n    outline: 0;\r\n    letter-spacing: normal;\r\n}\r\n.s_btn_wr .s_btn:hover{\r\n    background: #4662d9;\r\n}\r\n.s_ipt_wr.ip_short{\r\n    width: 480px;\r\n}\r\n#kw{\r\n    width: 465px;\r\n    height: 38px;\r\n    font: 16px/18px arial;\r\n    padding: 10px 0 10px 14px;\r\n    margin: 0;\r\n    background: transparent;\r\n    border: 0;\r\n}\r\n.fm{\r\n    margin: 0 0 15px 16px;\r\n    clear: none;\r\n    float: left;\r\n    position: relative;\r\n}\r\n#head{\r\n    border-bottom: none;\r\n    position: relative;\r\n}\r\n#u {\r\n    height: 40px;\r\n    line-height: 40px;\r\n    padding-right: 30px;\r\n    z-index: 301;\r\n    display: inline-block;\r\n    float: right;\r\n    color: #999;\r\n}\r\n#u .toindex{\r\n    font-family: Arial, \'Microsoft YaHei\';\r\n    font-size: 13px;\r\n    color: #222222;\r\n    text-align: right;\r\n    text-decoration: none;\r\n}\r\n#u .toindex:hover{\r\n    color: #2640b3;\r\n}\r\n.s-tab-item:hover::before{\r\n    color: #222 !important;\r\n}\r\n#s_tab {\r\n    position: absolute;\r\n    left: 0;\r\n    background: none;\r\n    line-height: 36px;\r\n    height: 38px;\r\n    padding: 2px 0 0 150px;\r\n    float: none;\r\n    zoom: 1;\r\n    color: #626675;\r\n    overflow: hidden;\r\n}\r\n#s_tab a, #s_tab b {\r\n    display: inline-block;\r\n    margin-right: 24px;\r\n    min-width: 44px;\r\n    text-decoration: none;\r\n    font-size: 14px;\r\n    text-align: left;\r\n    line-height: 28px;\r\n    color: #222222;\r\n    font-weight: normal;\r\n}\r\n#s_tab a{\r\n    color: #626675;\r\n}\r\n#s_tab .s-tab-item:before {\r\n    display: inline-block;\r\n    margin-right: 2px;\r\n    width: 14px;\r\n    font-family: \'cIconfont\'!important;\r\n    font-style: normal;\r\n    -webkit-font-smoothing: antialiased;\r\n    background: initial;\r\n    color: #c0c2c8;\r\n}\r\n#s_tab .cur-tab:before {\r\n    font-family: \'cIconfont\'!important;\r\n    color: #626675;\r\n    margin-right: 2px;\r\n    content: \'\\e608\';\r\n}\r\n#s_tab .s-tab-news:before {\r\n    content: \'\\e606\';\r\n}\r\n#s_tab .s-tab-video:before {\r\n    content: \'\\e604\';\r\n}\r\n#s_tab .s-tab-pic:before {\r\n    content: \'\\e607\';\r\n}\r\n#s_tab .s-tab-zhidao:before {\r\n    content: \'\\e633\';\r\n}\r\n#s_tab .s-tab-wenku:before {\r\n    content: \'\\e605\';\r\n}\r\n#s_tab .s-tab-tieba:before {\r\n    content: \'\\e609\';\r\n}\r\n#s_tab .s-tab-map:before {\r\n    content: \'\\e630\';\r\n}\r\n#s_tab .s-tab-b2b:before {\r\n    content: \'\\e603\';\r\n}\r\n#content_right{\r\n    border-left: none;\r\n}\r\n.norsTitle{\r\n    font-family: Arial, \'Microsoft YaHei\';\r\n    font-size: 18px;\r\n    color: #222222;\r\n    text-align: justify;\r\n    line-height: 18px;\r\n}\r\n.norsTitle{\r\n    margin-bottom: 28px;\r\n}\r\n.norsTitle2{\r\n    font-family: Arial, \'Microsoft YaHei\';\r\n    font-size: 14px;\r\n    color: #333333;\r\n    text-align: justify;\r\n    line-height: 14px;\r\n    margin-bottom: 12px;\r\n}\r\n.norsSuggest a{\r\n    color: #2440b3;\r\n    text-decoration: none;\r\n}\r\n.norsSuggest a:hover{\r\n    color: #315efb;\r\n    text-decoration: underline;\r\n}\r\n#foot{\r\n    background: #f5f5f6;\r\n    color: #9195a3;\r\n    border-top: none;\r\n}\r\n#help{\r\n    float:left;\r\n    padding-left:150px\r\n}\r\n    </style>\r\n</head>\r\n\r\n<body link=\"#0000cc\">\r\n    <div id=\"wrapper\" class=\"wrapper_l\">\r\n        <div id=\"head\">\r\n            <div class=\"head_wrapper\">\r\n                <div class=\"s_form\">\r\n                    <div class=\"s_form_wrapper\">\r\n                        <a href=\"//www.baidu.com/\" id=\"result_logo\"><img src=\"//www.baidu.com/img/flexible/logo/pc/result@2.png\" alt=\"到百度首页\" title=\"到百度首页\"></a>\r\n                        <form id=\"form\" name=\"f\" action=\"//www.baidu.com/s\" class=\"fm\">\r\n                            <input type=\"hidden\" name=\"ie\" value=\"utf-8\">\r\n                            <input type=\"hidden\" name=\"f\" value=\"8\">\r\n                            <input type=\"hidden\" name=\"rsv_bp\" value=\"1\">\r\n                            <input type=\"hidden\" name=\"ch\" value=\"\">\r\n                            <input type=\"hidden\" name=\"tn\" value=\"baiduerr\">\r\n                            <input type=\"hidden\" name=\"bar\" value=\"\">\r\n                            <span class=\"bg s_ipt_wr iptfocus\">\r\n                                <input id=\"kw\" name=\"wd\" class=\"s_ipt\" value=\"\" maxlength=\"255\" autocomplete=\"off\" autofocus>\r\n                            </span><span class=\"bg s_btn_wr\">\r\n                                <input type=\"submit\" id=\"su\" value=\"百度一下\" class=\"bg s_btn\">\r\n                            </span>\r\n                        </form>\r\n                    </div>\r\n                    <div id=\"u\">\r\n                        <a class=\"toindex\" href=\"//www.baidu.com/\">百度首页</a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    <div class=\"s_tab\" id=\"s_tab\">\r\n        <b class=\"cur-tab\">网页</b>\r\n        <a href=\"//www.baidu.com/?tn=news\" class=\"s-tab-item s-tab-news\" wdfield=\"kw\">资讯</a>\r\n        <a href=\"//v.baidu.com/\" class=\"s-tab-item s-tab-video\">视频</a>\r\n        <a href=\"//image.baidu.com/\" class=\"s-tab-item s-tab-pic\">图片</a>\r\n        <a href=\"//zhidao.baidu.com/\" class=\"s-tab-item s-tab-zhidao\">知道</a>\r\n        <a href=\"//wenku.baidu.com/\" class=\"s-tab-item s-tab-wenku\">文库</a>\r\n        <a href=\"//tieba.baidu.com/index.html\" class=\"s-tab-item s-tab-tieba\">贴吧</a>\r\n        <a href=\"//map.baidu.com/\" class=\"s-tab-item s-tab-map\">地图</a>\r\n        <a href=\"//b2b.baidu.com/s?fr=wwwt\" class=\"s-tab-item s-tab-b2b\">采购</a>\r\n        <a href=\"//www.baidu.com/more/\" class=\"s-tab-item s-tab-more\">更多</a>\r\n    </div>\r\n    <div id=\"wrapper_wrapper\">\r\n        <div id=\"content_left\">\r\n            <div class=\"nors\">\r\n                <div class=\"norsSuggest\">\r\n                    <h3 class=\"norsTitle\">很抱歉，您要访问的页面不存在！</h3>\r\n                    <p class=\"norsTitle2\">温馨提示 :</p>\r\n                    <p class=\"norsTitle2\">请检查您访问的网址是否正确</p>\r\n                    <p class=\"norsTitle2\">如果您不能确认访问的网址，请浏览<a href=\"//www.baidu.com/more/index.html\">百度更多</a>页面查看更多网址。</p>\r\n                    <p class=\"norsTitle2\">回到顶部重新发起搜索</p>\r\n                    <p class=\"norsTitle2\">如有任何意见或建议，请及时<a href=\"http://qingting.baidu.com/index\">反馈给我们</a>。</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div id=\"foot\">\r\n        <span id=\"help\">\r\n            <a href=\"http://help.baidu.com/question\" target=\"_blank\">帮助</a>\r\n            <a href=\"http://www.baidu.com/search/jubao.html\" target=\"_blank\">举报</a>\r\n            <a href=\"http://jianyi.baidu.com\" target=\"_blank\">用户反馈</a>\r\n        </span>\r\n    </div>\r\n</body>\r\n<script>\r\n(function () {\r\n        var LOGURL = \'https://sp1.baidu.com/5b1ZeDe5KgQFm2e88IuM_a/cm.gif\';\r\n        var params = \'type=wwwerror&terminal=www\';\r\n        var img = new Image();\r\n        img.src = LOGURL + \'?\' + params;\r\n    })();\r\n    (function () {\r\n        if(window.recommend && window.recommend.query && window.recommend.query.length > 0) {\r\n            var recommendWrapper = document.createElement(\'div\');\r\n            var recommendHtml = \'<div class=\"cr-content\"><div class=\"opr-toplist-title\">\' + window.recommend.title + \'</div><table class=\"opr-toplist-table\">\';\r\n            var queryArray = window.recommend.query;\r\n            var itemUrl = \'\';\r\n            for(var i = 1; i < (queryArray.length+1); i++) {\r\n                itemUrl = \'//www.baidu.com/s?word=\' + encodeURIComponent(queryArray[i-1].word) + \'&sa=\' + queryArray[i-1].sa + \'&tn=\' + queryArray[i-1].tn;\r\n                if (queryArray[i-1].rsv_dl) {\r\n                    itemUrl += \"&rsv_dl=\" + queryArray[i-1].rsv_dl;\r\n                }\r\n                \r\n                if (i < 4) {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-hot\' + i + \' opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                } else {\r\n                    recommendHtml += \'<tr><td><span class=\"opr-index-item\">\' + i + \'</span><a target=\"_blank\" href=\"\' + itemUrl +\'\" class=\"opr-item-text\">\' + queryArray[i-1].word + \'</a></td></tr>\';\r\n                }\r\n            }\r\n            recommendHtml += \'</tbody></table></div>\';\r\n            recommendWrapper.setAttribute(\'id\', \'content_right\');\r\n            document.getElementById(\'wrapper_wrapper\').insertBefore(recommendWrapper, document.getElementById(\'content_left\'));\r\n            var recommend = document.getElementById(\'content_right\');\r\n            recommend.innerHTML = recommendHtml;\r\n        }\r\n})();\r\n(function(){\r\n    var bds = {\r\n        util: {}\r\n    };\r\n    var c = document.getElementById(\'kw\').parentNode;\r\n\r\n    bds.util.getWinWidth = function(){\r\n        return window.document.documentElement.clientWidth;\r\n    };\r\n\r\n    bds.util.setFormWidth = function(){\r\n        var width = bds.util.getWinWidth();\r\n        if(width < 1217)    {bds.util.setClass(c, \'ip_short\', \'add\')}\r\n        else                {bds.util.setClass(c, \'ip_short\', \'remove\')};\r\n    };\r\n\r\n    bds.util.setClass = function(obj, class_name, set) {\r\n        var ori_class = obj.className,\r\n            has_class_p = -1,\r\n            ori_class_arr = [],\r\n            new_class = \'\';\r\n\r\n        if(ori_class.length) ori_class_arr = ori_class.split(\' \');\r\n\r\n        for( i in ori_class_arr) {\r\n            if(ori_class_arr[i] == class_name) has_class_p = i;\r\n        }\r\n\r\n        if( set == \'remove\' && has_class_p >= 0) {\r\n            ori_class_arr.splice(has_class_p, 1);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        } else if( set == \'add\' && has_class_p < 0) {\r\n            ori_class_arr.push(class_name);\r\n            new_class = ori_class_arr.join(\' \');\r\n            obj.className = new_class;\r\n        }\r\n    }\r\n    bds.util.setFormWidth();\r\n\r\n    if (typeof document.addEventListener != \"undefined\") {\r\n        window.addEventListener(\'resize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').addEventListener(\'focus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').addEventListener(\'blur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } else {\r\n        window.attachEvent(\'onresize\', bds.util.setFormWidth, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onfocus\', function(){bds.util.setClass(c,\'iptfocus\', \'add\');}, false);\r\n        document.getElementById(\'kw\').attachEvent(\'onblur\', function(){bds.util.setClass(c,\'iptfocus\', \'remove\');}, false);\r\n    } \r\n\r\n})();\r\n\r\n\r\n</script>\r\n\r\n</html>\r\n', NULL, NULL, NULL, '2022-09-07 13:48:23', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('7eb82b85-ecf3-4180-baa7-020ae66df370', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-07 15:00:00', '2022-09-07 15:00:01', 1, '2022-09-07 15:00:00', NULL, NULL, NULL, '2022-09-07 15:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('7f270194-5054-4323-9a50-ee0ca928eb59', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 16:00:00', '2022-09-07 16:00:00', 1, '2022-09-07 16:00:00', NULL, NULL, NULL, '2022-09-07 16:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('7f7d9d59-c119-4d83-853c-ff13f2ae8f5f', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 21:00:00', '2022-09-07 21:00:00', 1, '2022-09-07 21:00:00', NULL, NULL, NULL, '2022-09-07 21:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('80065734-a65b-4237-87d8-2b9f8cad7db8', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 14:30:00', '2022-09-07 14:30:01', 1, '2022-09-07 14:30:00', NULL, NULL, NULL, '2022-09-07 14:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('81bef6af-05d0-4916-860e-0a34fe9dc860', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 14:00:00', '2022-09-07 14:00:00', 1, '2022-09-07 14:00:00', NULL, NULL, NULL, '2022-09-07 14:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('84ca61a3-03a6-45a9-ac49-4f91f59a6121', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 14:04:16', '2022-09-07 14:04:16', 1, '2022-09-07 14:04:15', NULL, NULL, NULL, '2022-09-07 14:04:16', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('85100279-44dd-497c-8d7d-c3136146291a', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 13:45:00', '2022-09-08 13:45:00', 1, '2022-09-08 13:45:00', NULL, NULL, NULL, '2022-09-08 13:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('85daccdd-80c5-4e32-b377-0b7d61d27fac', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 16:45:00', '2022-09-07 16:45:00', 1, '2022-09-07 16:45:00', NULL, NULL, NULL, '2022-09-07 16:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('88196bca-4d38-4675-8bbf-b77cf87cf117', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 22:15:00', '2022-09-07 22:15:00', 1, '2022-09-07 22:15:00', NULL, NULL, NULL, '2022-09-07 22:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('88bd0d51-e698-4513-b74a-1ead8993dae4', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 11:00:00', '2022-09-08 11:00:00', 1, '2022-09-08 11:00:00', NULL, NULL, NULL, '2022-09-08 11:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('894bdb14-f95a-4e28-82fe-48a0bdc71217', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 17:45:00', '2022-09-08 17:45:00', 1, '2022-09-08 17:45:00', NULL, NULL, NULL, '2022-09-08 17:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('8afcee6c-c8f7-40e0-857c-24443c77c34a', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 12:30:00', '2022-09-08 12:30:00', 1, '2022-09-08 12:30:00', NULL, NULL, NULL, '2022-09-08 12:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('8eba85ca-9d21-4140-98fb-f24eb719bbce', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 17:15:00', '2022-09-07 17:15:00', 1, '2022-09-07 17:15:00', NULL, NULL, NULL, '2022-09-07 17:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('8fcba9c3-1a59-468d-91a3-83200d97b3a8', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 14:04:17', '2022-09-07 14:04:17', 1, '2022-09-07 14:04:16', NULL, NULL, NULL, '2022-09-07 14:04:17', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('90013f44-693f-40e0-8bce-a64cfbed7fcb', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 23:00:00', '2022-09-07 23:00:00', 1, '2022-09-07 23:00:00', NULL, NULL, NULL, '2022-09-07 23:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('929e7967-8dd9-451a-82c4-f1a3fd3250d1', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 09:30:00', '2022-09-08 09:30:00', 1, '2022-09-08 09:30:00', NULL, NULL, NULL, '2022-09-08 09:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('93ed973c-df9d-43cb-9731-98749f075c0c', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-07 20:15:00', '2022-09-07 20:15:01', 1, '2022-09-07 20:15:00', NULL, NULL, NULL, '2022-09-07 20:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('940659cc-30db-4a4e-ae05-f1c9987bcf91', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 19:15:00', '2022-09-07 19:15:00', 1, '2022-09-07 19:15:00', NULL, NULL, NULL, '2022-09-07 19:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('9565bb19-6f57-4ef9-96b8-b4700ae19996', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 04:30:00', '2022-09-08 04:30:00', 1, '2022-09-08 04:30:00', NULL, NULL, NULL, '2022-09-08 04:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('95767d79-ba6a-43ff-8a6e-103a95a8cf01', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 11:15:00', '2022-09-08 11:15:00', 1, '2022-09-08 11:15:00', NULL, NULL, NULL, '2022-09-08 11:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('971b8b0d-f2e1-4cbd-8043-ccf511bb6df8', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 19:15:00', '2022-09-08 19:15:00', 1, '2022-09-08 19:15:00', NULL, NULL, NULL, '2022-09-08 19:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('9ee03cbc-cea0-4e80-b9c8-aa978db09b3a', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 12:00:00', '2022-09-08 12:00:00', 1, '2022-09-08 12:00:00', NULL, NULL, NULL, '2022-09-08 12:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('9f14fe2c-0f3c-4b1c-9469-c215810eaa72', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 12:00:00', '2022-09-08 12:00:00', 1, '2022-09-08 12:00:00', NULL, NULL, NULL, '2022-09-08 12:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('9fed446d-18a0-4865-9cc2-03319f2bf68e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 11:45:00', '2022-09-08 11:45:00', 1, '2022-09-08 11:45:00', NULL, NULL, NULL, '2022-09-08 11:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('a0820102-fa23-4b3a-8d30-3742048dbc0b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 17:00:00', '2022-09-07 17:00:00', 1, '2022-09-07 17:00:00', NULL, NULL, NULL, '2022-09-07 17:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('a2a9a1b6-aa0d-418c-bfdc-0adf575637f6', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 1, '2022-09-08 10:30:00', '2022-09-08 10:30:01', 1, '2022-09-08 10:30:00', NULL, NULL, NULL, '2022-09-08 10:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('a32999d5-6eb2-4b7b-b8d4-d8399bb303b6', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 20:45:00', '2022-09-07 20:45:00', 1, '2022-09-07 20:45:00', NULL, NULL, NULL, '2022-09-07 20:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('a446dab3-1af9-4239-bb85-c809f97defdf', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 13:15:00', '2022-09-08 13:15:00', 1, '2022-09-08 13:15:00', NULL, NULL, NULL, '2022-09-08 13:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('a90cfbb6-2038-4b0f-81fe-c687615aff9b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 03:00:00', '2022-09-08 03:00:00', 1, '2022-09-08 03:00:00', NULL, NULL, NULL, '2022-09-08 03:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('abff514d-1cdc-4df7-ab9e-5a2cef939b8b', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 14:00:00', '2022-09-08 14:00:00', 1, '2022-09-08 14:00:00', NULL, NULL, NULL, '2022-09-08 14:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ad516c43-c475-4daf-9d62-70a7a2334a0a', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:51:59', '2022-09-07 13:51:59', 1, '2022-09-07 13:51:59', NULL, NULL, NULL, '2022-09-07 13:51:59', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ade45f6f-228a-4849-a33f-f1252e9e2ab7', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 16:45:00', '2022-09-08 16:45:00', 1, '2022-09-08 16:45:00', NULL, NULL, NULL, '2022-09-08 16:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('af69557f-552e-4841-bfb4-a6e0e7814482', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 07:45:00', '2022-09-08 07:45:00', 1, '2022-09-08 07:45:00', NULL, NULL, NULL, '2022-09-08 07:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('af844347-b965-4d64-801d-a8c3a2b7acdf', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 16:30:00', '2022-09-08 16:30:00', 1, '2022-09-08 16:30:00', NULL, NULL, NULL, '2022-09-08 16:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('b223b6c7-b9c7-4038-a423-d11e0fe5818e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 05:00:00', '2022-09-08 05:00:00', 1, '2022-09-08 05:00:00', NULL, NULL, NULL, '2022-09-08 05:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('b40977f3-5ca8-4a6e-8672-664ab61de43d', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 15:00:00', '2022-09-08 15:00:00', 1, '2022-09-08 15:00:00', NULL, NULL, NULL, '2022-09-08 15:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('b6921b5d-9627-43e4-b538-5286ec601a51', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 03:45:00', '2022-09-08 03:45:00', 1, '2022-09-08 03:45:00', NULL, NULL, NULL, '2022-09-08 03:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('b8cfaa7a-67b2-4102-a263-32651c1c79c9', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 10:00:00', '2022-09-08 10:00:00', 1, '2022-09-08 10:00:00', NULL, NULL, NULL, '2022-09-08 10:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ba6acdf1-b1d4-4a00-95e2-0d62b5ebf4e6', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 14:15:00', '2022-09-07 14:15:00', 1, '2022-09-07 14:15:00', NULL, NULL, NULL, '2022-09-07 14:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ba826dd0-44bf-416d-890b-4650c9fc2a7c', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 23:15:00', '2022-09-07 23:15:00', 1, '2022-09-07 23:15:00', NULL, NULL, NULL, '2022-09-07 23:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('bd82789b-fb94-4e38-84c3-fe06d31e0322', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 01:15:00', '2022-09-08 01:15:00', 1, '2022-09-08 01:15:00', NULL, NULL, NULL, '2022-09-08 01:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('bea77b18-39d3-4659-af35-d30a586ec366', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 1, '2022-09-08 11:30:00', '2022-09-08 11:30:01', 1, '2022-09-08 11:30:00', NULL, NULL, NULL, '2022-09-08 11:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('c275086e-fbcc-41ba-9ea2-564f0824494e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 00:00:00', '2022-09-08 00:00:00', 1, '2022-09-08 00:00:00', NULL, NULL, NULL, '2022-09-08 00:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('c304b213-0f87-4180-94fc-7d025735ccea', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 17:45:00', '2022-09-07 17:45:00', 1, '2022-09-07 17:45:00', NULL, NULL, NULL, '2022-09-07 17:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('c33ff891-a5c1-4c80-b440-4cb7f0fa18a2', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 13:00:00', '2022-09-08 13:00:00', 1, '2022-09-08 13:00:00', NULL, NULL, NULL, '2022-09-08 13:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('c553687e-8a2b-4df3-a227-78c25c0a227f', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 17:00:00', '2022-09-07 17:00:00', 1, '2022-09-07 17:00:00', NULL, NULL, NULL, '2022-09-07 17:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('c644353b-4431-4a1a-b259-379e19fcbb7a', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 1, '2022-09-07 13:52:34', '2022-09-07 13:52:35', 1, '2022-09-07 13:52:35', NULL, NULL, NULL, '2022-09-07 13:52:34', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('cd75b5ee-5b84-44b3-a5d4-aa17f0720a60', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 18:45:00', '2022-09-08 18:45:00', 1, '2022-09-08 18:45:00', NULL, NULL, NULL, '2022-09-08 18:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ce3b2665-ea79-43b2-85a3-f284f6449099', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 19:00:00', '2022-09-07 19:00:00', 1, '2022-09-07 19:00:00', NULL, NULL, NULL, '2022-09-07 19:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ce61721f-9388-49d4-9252-c47d470d3001', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 12:45:00', '2022-09-08 12:45:00', 1, '2022-09-08 12:45:00', NULL, NULL, NULL, '2022-09-08 12:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('cf05c0ed-c875-42d6-9ee0-a5b5ebc8192c', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 23:45:00', '2022-09-07 23:45:00', 1, '2022-09-07 23:45:00', NULL, NULL, NULL, '2022-09-07 23:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('d1132c8a-4c96-4601-9bf3-7a4bc724570e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 09:00:00', '2022-09-08 09:00:00', 1, '2022-09-08 09:00:00', NULL, NULL, NULL, '2022-09-08 09:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('dd9c4557-84c1-4329-ac6f-7142cab39f72', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 19:00:00', '2022-09-07 19:00:00', 1, '2022-09-07 19:00:00', NULL, NULL, NULL, '2022-09-07 19:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ddc4c31d-a62a-476a-8846-e4ab12dc7a05', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:47:05', '2022-09-07 13:47:05', 1, 'An invalid request URI was provided. The request URI must either be an absolute URI or BaseAddress must be set.', NULL, NULL, NULL, '2022-09-07 13:47:05', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('de01406f-b0ee-4fc6-ab76-0b83b72616b1', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 06:30:00', '2022-09-08 06:30:00', 1, '2022-09-08 06:30:00', NULL, NULL, NULL, '2022-09-08 06:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('deaa692a-f842-48ef-adbf-35da08c3ce53', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 18:30:00', '2022-09-07 18:30:00', 1, '2022-09-07 18:30:00', NULL, NULL, NULL, '2022-09-07 18:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e0046484-75d5-4dfb-aa0b-d940c0d5d51d', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 05:45:00', '2022-09-08 05:45:00', 1, '2022-09-08 05:45:00', NULL, NULL, NULL, '2022-09-08 05:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e389613d-b43b-41ca-9ff1-7eb8135bdc78', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 04:15:00', '2022-09-08 04:15:00', 1, '2022-09-08 04:15:00', NULL, NULL, NULL, '2022-09-08 04:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e41b9c20-81ae-4921-b7b2-d5ea5667d21e', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 17:00:00', '2022-09-08 17:00:00', 1, '2022-09-08 17:00:00', NULL, NULL, NULL, '2022-09-08 17:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e66e348a-9299-499a-b5b6-4c0bbf52602e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 21:30:00', '2022-09-07 21:30:00', 1, '2022-09-07 21:30:00', NULL, NULL, NULL, '2022-09-07 21:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e6714ea7-a79b-479a-9268-92c6bf666390', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 13:55:27', '2022-09-07 13:55:27', 1, '2022-09-07 13:55:27', NULL, NULL, NULL, '2022-09-07 13:55:27', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e6e4c327-bedd-420c-8cd0-e0ebdf85e6ce', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 06:45:00', '2022-09-08 06:45:00', 1, '2022-09-08 06:45:00', NULL, NULL, NULL, '2022-09-08 06:45:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('e7450c02-cd92-425f-9556-0a12e43ee45f', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 17:30:00', '2022-09-08 17:30:00', 1, '2022-09-08 17:30:00', NULL, NULL, NULL, '2022-09-08 17:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ee139faa-b20a-4e2f-b0b8-4039b8aa512c', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 18:00:00', '2022-09-08 18:00:00', 1, '2022-09-08 18:00:00', NULL, NULL, NULL, '2022-09-08 18:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ef1c0d76-76f5-4d27-87a5-4ad3efd4fcfc', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 09:15:00', '2022-09-08 09:15:00', 1, '2022-09-08 09:15:00', NULL, NULL, NULL, '2022-09-08 09:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ef5a4ba4-ec1d-4a41-81e0-9fd9f04028ea', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 22:00:00', '2022-09-07 22:00:00', 1, '2022-09-07 22:00:00', NULL, NULL, NULL, '2022-09-07 22:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f08644a9-75f6-4c98-a9f3-0ce061a41928', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 16:30:00', '2022-09-07 16:30:00', 1, '2022-09-07 16:30:00', NULL, NULL, NULL, '2022-09-07 16:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f08f0aae-28b3-4fda-89ab-2d4e772265e8', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-07 23:30:00', '2022-09-07 23:30:00', 1, '2022-09-07 23:30:00', NULL, NULL, NULL, '2022-09-07 23:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f11c9782-0edc-4a94-9b02-9e38f467618e', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-08 10:00:00', '2022-09-08 10:00:00', 1, '2022-09-08 10:00:00', NULL, NULL, NULL, '2022-09-08 10:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f548b781-2676-4322-8860-396940f79f2e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 07:00:00', '2022-09-08 07:00:00', 1, '2022-09-08 07:00:00', NULL, NULL, NULL, '2022-09-08 07:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f72df9d7-0905-40c2-9f6e-73d4079aa249', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 02:00:00', '2022-09-08 02:00:00', 1, '2022-09-08 02:00:00', NULL, NULL, NULL, '2022-09-08 02:00:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f7c34b46-b392-4978-99e3-1ebfe0820500', 'c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', 0, '2022-09-07 16:30:00', '2022-09-07 16:30:00', 1, '2022-09-07 16:30:00', NULL, NULL, NULL, '2022-09-07 16:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('f89a042c-e341-4f63-bb37-9d80eecfd15a', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 00:30:00', '2022-09-08 00:30:00', 1, '2022-09-08 00:30:00', NULL, NULL, NULL, '2022-09-08 00:30:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('fc63e23f-bf5a-4da7-8355-236f1c73d88e', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 10:15:00', '2022-09-08 10:15:01', 1, '2022-09-08 10:15:00', NULL, NULL, NULL, '2022-09-08 10:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('fda2b321-1792-410e-920b-fe13701236db', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 00:15:00', '2022-09-08 00:15:00', 1, '2022-09-08 00:15:00', NULL, NULL, NULL, '2022-09-08 00:15:00', NULL, NULL, NULL);
INSERT INTO `Sys_QuartzLog` VALUES ('ffb54070-c289-4907-822c-52d1d2ad0ae8', 'c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', 0, '2022-09-08 07:15:00', '2022-09-08 07:15:00', 1, '2022-09-08 07:15:00', NULL, NULL, NULL, '2022-09-08 07:15:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_QuartzOptions
-- ----------------------------
DROP TABLE IF EXISTS `Sys_QuartzOptions`;
CREATE TABLE `Sys_QuartzOptions`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TaskName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `GroupName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务分组',
  `CronExpression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Corn表达式',
  `Method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `ApiUrl` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Url地址',
  `AuthKey` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AuthKey',
  `AuthValue` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AuthValue',
  `LastRunTime` datetime(0) NULL DEFAULT NULL COMMENT '最后执行时间',
  `Status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `Describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `PostData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'post参数',
  `TimeOut` int(11) NULL DEFAULT NULL COMMENT '超时时间(秒)',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_QuartzOptions
-- ----------------------------
INSERT INTO `Sys_QuartzOptions` VALUES ('22f72d79-7f6f-4c0f-bf4f-c09c529ddc40', '每日统计', '订单管理', '0/0 10 0 * * ? *', 'get', 'https://www.baidu.com/', NULL, NULL, '2022-09-08 09:58:33', 0, '每天0:10执行一次	', ' ', 180, 1, '超级管理员', '2022-09-07 10:28:25', 1, '超级管理员', '2022-09-07 19:21:32');
INSERT INTO `Sys_QuartzOptions` VALUES ('c1745e19-3b39-4907-9e70-8319c9b831c8', '入库订单', '订单管理', '0 0/15 * * * ?', 'post', 'https://api.volcore.xyz/api/Sys_QuartzOptions/test', NULL, NULL, '2022-09-08 19:15:00', 0, '15分钟执行一次', '1', 180, 1, '超级管理员', '2022-09-07 10:27:02', 1, '超级管理员', '2022-09-07 13:44:34');
INSERT INTO `Sys_QuartzOptions` VALUES ('c9317a99-9802-4456-ae83-876a01306f3c', '订单合并', '订单管理', '0 0/30 * * * ?', 'post', 'https://api.volcore.xyz/api/Sys_QuartzOptions/test	', NULL, NULL, '2022-09-08 19:00:00', 0, '30分钟执行一次', '\n', 180, 1, '超级管理员', '2022-09-07 10:24:51', 1, '超级管理员', '2022-09-07 19:21:43');

-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Role`;
CREATE TABLE `Sys_Role`  (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeleteBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Role_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO `Sys_Role` VALUES (1, '2018-08-23 11:46:06', 'admin', NULL, '无', 0, 1, '测试超级管理员', '2018-09-06 17:08:35', 1000, 0, '超级管理员');
INSERT INTO `Sys_Role` VALUES (2, '2018-08-23 11:46:52', 'admin', NULL, '1', 0, 1, '超级管理员', '2019-12-08 20:15:46', NULL, 1, '测试管理员');
INSERT INTO `Sys_Role` VALUES (12, '2022-03-23 09:47:00', '超级管理员', NULL, NULL, NULL, 1, '', NULL, NULL, 2, '测试角色');

-- ----------------------------
-- Table structure for Sys_RoleAuth
-- ----------------------------
DROP TABLE IF EXISTS `Sys_RoleAuth`;
CREATE TABLE `Sys_RoleAuth`  (
  `Auth_Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthValue` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Menu_Id` int(11) NOT NULL,
  `Modifier` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_RoleAuth
-- ----------------------------
INSERT INTO `Sys_RoleAuth` VALUES (151, 'Search', '2020-05-05 12:05:34', '超级管理员', 30, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (152, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 3, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (153, 'Search,Add,Delete,Update,Export,Audit', '2020-05-05 12:05:34', '超级管理员', 51, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (154, 'Search', '2020-05-05 12:05:34', '超级管理员', 59, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (155, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 37, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (156, 'Search', '2020-05-05 12:05:34', '超级管理员', 33, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (157, '', '2020-05-05 12:05:34', '超级管理员', 24, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (158, '', '2020-05-05 12:05:34', '超级管理员', 35, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (159, 'Search', '2020-05-05 12:05:34', '超级管理员', 60, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (160, 'Search,Add,Delete,Update,Export,Audit', '2020-05-05 12:05:34', '超级管理员', 68, '超级管理员', '2021-03-06 17:47:32', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (161, 'Search', '2020-05-05 12:05:34', '超级管理员', 77, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (162, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 12:05:34', '超级管理员', 52, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (163, 'Search', '2020-05-05 12:05:34', '超级管理员', 11, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (164, 'Search,Add,Delete,Update', '2020-05-05 12:05:34', '超级管理员', 85, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (165, 'Search', '2020-05-05 12:05:34', '超级管理员', 79, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (166, 'Search', '2020-05-05 12:05:34', '超级管理员', 86, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (167, 'Search,Add,Delete,Update,Export,Upload', '2020-05-05 12:05:34', '超级管理员', 67, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (168, 'Search,Add,Delete,Update', '2020-05-05 12:05:34', '超级管理员', 65, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (169, 'Search,Add,Update', '2020-05-05 12:05:34', '超级管理员', 62, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (170, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 63, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (171, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 83, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (172, 'Search', '2020-05-05 12:05:34', '超级管理员', 80, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (173, 'Search', '2020-05-05 12:05:34', '超级管理员', 81, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (174, 'Search', '2020-05-05 12:05:34', '超级管理员', 82, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (175, 'Search,Add,Delete,Update,Export', '2020-05-05 12:05:34', '超级管理员', 42, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (176, 'Search', '2020-05-05 12:05:34', '超级管理员', 10, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (177, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 78, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (178, 'Search,Delete,Export', '2020-05-05 12:05:34', '超级管理员', 6, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (179, 'Search,Add,Delete,Update', '2020-05-05 12:05:34', '超级管理员', 50, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (180, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 12:05:34', '超级管理员', 36, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (181, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 9, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (182, 'Search', '2020-05-05 12:05:34', '超级管理员', 48, '超级管理员', '2021-01-16 12:14:19', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (183, 'Search', '2020-05-05 12:05:34', '超级管理员', 74, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (184, 'Search', '2020-05-05 12:05:34', '超级管理员', 56, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (185, 'Search', '2020-05-05 12:05:34', '超级管理员', 32, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (186, 'Search', '2020-05-05 12:05:34', '超级管理员', 34, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (187, 'Search', '2020-05-05 12:05:34', '超级管理员', 12, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (188, 'Search', '2020-05-05 12:05:34', '超级管理员', 84, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (189, 'Search', '2020-05-05 12:05:34', '超级管理员', 41, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (190, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 28, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (191, 'Search', '2020-05-05 12:05:34', '超级管理员', 66, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (192, 'Search', '2020-05-05 12:05:34', '超级管理员', 29, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (193, 'Search', '2020-05-05 12:05:34', '超级管理员', 72, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (194, 'Search', '2020-05-05 12:05:34', '超级管理员', 2, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (195, 'Search', '2020-05-05 12:05:34', '超级管理员', 64, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (196, 'Search', '2020-05-05 12:05:34', '超级管理员', 61, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (197, 'Search', '2020-05-05 12:05:34', '超级管理员', 5, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (198, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 25, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (199, 'Search', '2020-05-05 12:05:34', '超级管理员', 26, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (200, 'Search', '2020-05-05 12:05:34', '超级管理员', 27, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (201, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 12:05:34', '超级管理员', 75, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (202, 'Search', '2020-05-05 12:05:34', '超级管理员', 57, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (203, 'Search,Import,Export,Upload', '2020-05-05 12:05:34', '超级管理员', 49, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (204, 'Search,Update', '2020-05-05 12:05:34', '超级管理员', 71, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (205, 'Search', '2020-05-05 12:05:34', '超级管理员', 31, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (206, 'Search', '2020-05-05 12:05:34', '超级管理员', 58, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (207, 'Search', '2020-05-05 12:05:34', '超级管理员', 73, '超级管理员', '2020-05-05 12:05:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (208, 'Search', '2020-05-25 13:15:51', '超级管理员', 48, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (209, 'Search,Add,Update,Import,Export,Upload', '2020-05-25 13:15:51', '超级管理员', 49, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (210, 'Search,Add,Delete,Update', '2020-05-25 13:15:51', '超级管理员', 50, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (211, 'Search,Add,Update,Export,Audit', '2020-05-25 13:15:51', '超级管理员', 68, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (212, 'Search,Add,Delete,Update,Import,Export', '2020-05-25 13:15:51', '超级管理员', 52, '超级管理员', '2020-05-25 13:15:51', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (213, 'Search,Import,Export,Upload', '2020-09-11 01:03:11', '演示帐号', 49, '演示帐号', '2020-09-11 01:03:11', 6, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (214, 'Search', '2020-11-29 16:52:52', '超级管理员', 89, '超级管理员', '2020-11-29 16:52:52', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (215, 'Search,Add,Delete,Update,Export', '2020-11-29 16:52:52', '超级管理员', 90, '超级管理员', '2022-07-25 03:10:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (216, 'Search,Add,Delete,Update,Import,Export,Upload', '2021-01-16 12:01:58', '超级管理员', 70, '超级管理员', '2021-01-16 12:01:58', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (217, 'Search,Add,Delete,Update,Import,Export', '2021-03-06 17:47:32', '超级管理员', 91, '超级管理员', '2021-03-06 17:47:32', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (218, 'Search,Add,Delete,Update,Import,Export', '2021-03-14 23:56:27', '超级管理员', 92, '超级管理员', '2021-03-14 23:56:27', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (219, 'Search,Add,Update,Import,Export', '2021-03-14 23:56:27', '超级管理员', 93, '超级管理员', '2021-03-14 23:56:27', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (220, 'Search,Add,Delete,Update', '2021-03-20 15:25:20', '超级管理员', 95, '超级管理员', '2021-03-20 15:25:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (221, 'Search,Add,Delete,Update', '2021-03-20 15:25:20', '超级管理员', 94, '超级管理员', '2021-03-20 15:25:20', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (222, 'Search', '2021-05-02 15:57:11', '超级管理员', 96, '超级管理员', '2021-05-02 15:57:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (223, 'Search,Add,Delete,Update', '2021-05-02 15:57:11', '超级管理员', 97, '超级管理员', '2022-09-06 16:19:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (224, 'Export', '2021-05-05 15:25:06', '超级管理员', 68, '超级管理员', '2021-05-05 15:25:06', 6, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (225, 'Search', '2021-08-30 02:51:00', '超级管理员', 98, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (226, 'Search', '2021-08-30 02:51:00', '超级管理员', 99, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (227, 'Search', '2021-09-27 00:47:34', '超级管理员', 100, '超级管理员', '2021-09-27 00:47:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (228, 'Search', '2022-01-08 17:16:55', '超级管理员', 103, '超级管理员', '2022-01-08 17:16:55', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (229, 'Search,Add,Delete,Update', '2022-01-08 17:16:55', '超级管理员', 104, '超级管理员', '2022-01-08 17:16:55', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (230, 'Search', '2022-01-08 18:07:11', '超级管理员', 105, '超级管理员', '2022-01-08 18:07:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (231, 'Search,Add,Delete,Export', '2022-01-08 18:07:11', '超级管理员', 101, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (232, 'Search,Export', '2022-01-08 18:07:11', '超级管理员', 102, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (233, 'Search,Export', '2022-01-10 10:30:29', '超级管理员', 106, '超级管理员', '2022-03-27 02:41:51', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (234, 'Search', '2022-03-26 03:22:47', '超级管理员', 108, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (235, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 111, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (236, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 114, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (237, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 113, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (238, 'Search,Add,Delete,Update', '2022-03-26 03:22:47', '超级管理员', 116, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (239, 'Search', '2022-03-26 03:22:47', '超级管理员', 119, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (240, 'Search', '2022-03-26 03:22:47', '超级管理员', 118, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (241, 'Search', '2022-03-26 03:22:47', '超级管理员', 109, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (242, 'Search', '2022-03-26 03:22:47', '超级管理员', 122, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (243, 'Search', '2022-03-26 03:22:47', '超级管理员', 124, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (244, 'Search', '2022-03-26 03:22:47', '超级管理员', 120, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (245, 'Search', '2022-03-26 03:22:47', '超级管理员', 117, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (246, 'Search', '2022-03-26 03:22:47', '超级管理员', 123, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (247, 'Search', '2022-03-26 03:22:47', '超级管理员', 115, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (248, 'Search', '2022-03-26 03:22:47', '超级管理员', 112, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (249, 'Search', '2022-03-26 03:22:47', '超级管理员', 110, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (250, 'Search', '2022-03-26 03:22:47', '超级管理员', 121, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (251, 'Search', '2022-03-26 03:22:47', '超级管理员', 107, '超级管理员', '2022-03-26 03:22:47', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (252, 'Search', '2022-03-27 02:39:28', '超级管理员', 107, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (253, 'Search', '2022-03-27 02:39:28', '超级管理员', 110, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (254, 'Search', '2022-03-27 02:39:28', '超级管理员', 112, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (255, 'Search', '2022-03-27 02:39:28', '超级管理员', 115, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (256, 'Search', '2022-03-27 02:39:28', '超级管理员', 123, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (257, 'Search', '2022-03-27 02:39:28', '超级管理员', 117, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (258, 'Search', '2022-03-27 02:39:28', '超级管理员', 124, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (259, 'Search', '2022-03-27 02:39:28', '超级管理员', 118, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (260, 'Search', '2022-03-27 02:39:28', '超级管理员', 119, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (261, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 116, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (262, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 113, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (263, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 114, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (264, 'Search,Add,Delete,Update', '2022-03-27 02:39:28', '超级管理员', 111, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (265, 'Search', '2022-03-27 02:39:28', '超级管理员', 108, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (266, 'Search', '2022-03-27 02:39:28', '超级管理员', 109, '超级管理员', '2022-03-27 02:39:28', 12, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (267, 'Search', '2022-03-27 03:02:19', '超级管理员', 125, '超级管理员', '2022-03-27 03:02:19', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (268, 'Search', '2022-05-04 14:45:36', '超级管理员', 126, '超级管理员', '2022-05-04 14:45:36', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (269, 'Search,Export', '2022-08-15 05:02:56', '超级管理员', 127, '超级管理员', '2022-08-15 05:02:56', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (270, 'Search', '2022-08-15 05:02:56', '超级管理员', 128, '超级管理员', '2022-08-15 05:02:56', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (271, 'Search', '2022-09-06 16:19:34', '超级管理员', 129, '超级管理员', '2022-09-06 16:19:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (272, 'Search,Add,Delete,Update,Export', '2022-09-06 16:19:34', '超级管理员', 130, '超级管理员', '2022-09-06 16:19:34', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (273, 'Search,Delete,Export', '2022-09-06 16:19:34', '超级管理员', 131, '超级管理员', '2022-09-06 16:19:34', 2, NULL);

-- ----------------------------
-- Table structure for Sys_RoleAuthData
-- ----------------------------
DROP TABLE IF EXISTS `Sys_RoleAuthData`;
CREATE TABLE `Sys_RoleAuthData`  (
  `Auth_Id` int(11) NOT NULL,
  `DataType_Id` int(11) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  `Node_Id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LevelID` int(11) NULL DEFAULT NULL,
  `AuthValue` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` timestamp(0) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_RoleAuthData
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_TableColumn
-- ----------------------------
DROP TABLE IF EXISTS `Sys_TableColumn`;
CREATE TABLE `Sys_TableColumn`  (
  `ColumnId` int(11) NOT NULL AUTO_INCREMENT,
  `ApiInPut` int(11) NULL DEFAULT NULL,
  `ApiIsNull` int(11) NULL DEFAULT NULL,
  `ApiOutPut` int(11) NULL DEFAULT NULL,
  `ColSize` int(11) NULL DEFAULT NULL,
  `ColumnCNName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColumnName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColumnType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ColumnWidth` int(11) NULL DEFAULT NULL,
  `Columnformat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DropNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EditColNo` int(11) NULL DEFAULT NULL,
  `EditRowNo` int(11) NULL DEFAULT NULL,
  `EditType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `IsColumnData` int(11) NULL DEFAULT NULL,
  `IsDisplay` int(11) NULL DEFAULT NULL,
  `IsImage` int(11) NULL DEFAULT NULL,
  `IsKey` int(11) NULL DEFAULT NULL,
  `IsNull` int(11) NULL DEFAULT NULL,
  `IsReadDataset` int(11) NULL DEFAULT NULL,
  `Maxlength` int(11) NULL DEFAULT NULL,
  `Modifier` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Script` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SearchColNo` int(11) NULL DEFAULT NULL,
  `SearchRowNo` int(11) NULL DEFAULT NULL,
  `SearchType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sortable` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Table_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ColumnId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 899 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO `Sys_TableColumn` VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1420, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, 'tree_roles', NULL, 1, 'cascader', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1410, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1400, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1390, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1380, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1370, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1360, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1350, '', NULL, 2, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1340, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 5, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1330, '', NULL, 2, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2022-04-06 22:34:14', 1, 1320, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-04-06 22:34:14', 1, 1375, '', NULL, 1, 'select', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (32, NULL, NULL, NULL, NULL, '字典ID', 'Dic_ID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1300, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (33, NULL, NULL, NULL, NULL, '字典名称', 'DicName', 'string', 140, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-08-23 10:17:27', 1, 1290, NULL, NULL, 1, 'textarea', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (34, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1280, NULL, NULL, 1, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (35, NULL, NULL, NULL, NULL, '配置项', 'Config', 'string', 300, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2019-08-23 10:17:27', 1, 1270, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (36, NULL, NULL, NULL, 8, 'sql语句', 'DbSql', 'string', 200, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2019-08-23 10:17:27', 1, 1260, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (37, NULL, NULL, NULL, NULL, 'DBServer', 'DBServer', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2019-08-23 10:17:27', 1, 1250, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (38, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1240, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (39, NULL, NULL, NULL, NULL, '字典编号', 'DicNo', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2019-08-23 10:17:27', 1, 1295, NULL, NULL, 1, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (40, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2019-08-23 10:17:27', 1, 1220, NULL, NULL, NULL, '无', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (41, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'enable', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1210, NULL, NULL, 2, 'drop', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (42, NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1200, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (43, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-23 10:17:27', 1, 1190, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (44, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1180, NULL, NULL, 2, 'datetime', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (45, NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1170, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (46, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-08-23 10:17:27', 1, 1160, NULL, NULL, NULL, NULL, NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (47, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-08-23 10:17:27', 1, 1150, NULL, NULL, 2, 'datetime', NULL, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (48, NULL, NULL, NULL, NULL, '', 'DicList_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1140, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (49, NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1130, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (50, NULL, NULL, NULL, NULL, '数据源Value', 'DicValue', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-05-05 19:40:42', 1, 1120, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (51, NULL, NULL, NULL, NULL, '数据源Text', 'DicName', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-05-05 19:40:42', 1, 1110, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (52, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1100, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (53, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2021-05-05 19:40:42', 1, 1090, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (54, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'sbyte', 90, '', '2018-06-06 14:12:18', NULL, NULL, 'enable', NULL, 1, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1080, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (55, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '无', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1070, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (56, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2021-05-05 19:40:42', 1, 1060, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (57, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1050, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (58, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1040, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (59, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2021-05-05 19:40:42', 1, 1030, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (60, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:42', 1, 1020, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (61, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 10000, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (62, NULL, NULL, NULL, 12, '日志类型', 'LogType', 'string', 120, NULL, '2018-06-11 18:22:16', NULL, NULL, 'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2020-03-02 19:22:18', 1, 8888, NULL, NULL, 3, 'checkbox', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (63, NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-03-02 19:22:18', 1, 7990, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (64, NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', 250, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-03-02 19:22:18', 1, 7980, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (65, NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', 280, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2020-03-02 19:22:18', 1, 7970, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (66, NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 8700, NULL, NULL, 2, 'dropList', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (67, NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 9999, NULL, NULL, 2, 'datetime', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (68, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 880, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (69, NULL, NULL, NULL, NULL, '时长(毫秒)', 'ElapsedTime', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 8600, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (70, NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-03-02 19:22:18', 1, 7920, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (71, NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2020-03-02 19:22:18', 1, 7910, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (72, NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2020-03-02 19:22:18', 1, 7900, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (73, NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', 300, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2020-03-02 19:22:18', 1, 9000, NULL, NULL, 1, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (74, NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 7880, NULL, NULL, NULL, '无', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (75, NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2020-03-02 19:22:18', 1, 7870, NULL, NULL, NULL, NULL, NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (76, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2020-03-02 19:22:18', 1, 7860, NULL, NULL, 2, 'text', NULL, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (77, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7850, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (78, NULL, NULL, NULL, NULL, '', 'Dept_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7840, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (79, 0, NULL, 1, NULL, '部门', 'DeptName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 0, NULL, 0, 1, 0, 150, '超级管理员', '2021-04-12 23:04:26', 1, 7830, '', NULL, 2, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (80, 0, 0, 1, NULL, '角色', 'Role_Id', 'int', 150, '', '2018-06-14 16:44:15', NULL, NULL, 'roles', NULL, 2, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7820, '', NULL, 2, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (81, NULL, NULL, NULL, NULL, '', 'RoleName', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 0, 0, 150, '超级管理员', '2021-04-12 23:04:26', 1, 7810, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (82, 1, 0, 1, NULL, '用户名', 'UserName', 'string', 120, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2021-04-12 23:04:26', 1, 7945, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (83, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7790, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (84, NULL, NULL, NULL, NULL, '用户真实姓名', 'UserTrueName', 'string', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2021-04-12 23:04:26', 1, 7792, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (85, NULL, NULL, NULL, NULL, '地址', 'Address', 'string', 190, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7270, '', NULL, 4, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (86, NULL, NULL, NULL, NULL, '电话', 'Mobile', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 3, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-04-12 23:04:26', 1, 7260, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (87, NULL, NULL, NULL, NULL, 'Email', 'Email', 'string', 140, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 5, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2021-04-12 23:04:26', 1, 7250, '', NULL, 4, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (88, NULL, NULL, NULL, NULL, '', 'Tel', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 20, '超级管理员', '2021-04-12 23:04:26', 1, 7740, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (89, NULL, NULL, NULL, 12, '备注', 'Remark', 'string', 180, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 7, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7230, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (90, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7220, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (91, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'sbyte', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'enable', NULL, 5, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7670, '', NULL, 4, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (92, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7700, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (93, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7690, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (94, NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7780, '', NULL, 5, 'datetime', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (95, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7670, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (96, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7660, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (97, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7650, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (98, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, 'audit', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7640, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (99, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7630, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (100, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7620, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (101, NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7610, '', NULL, 5, 'datetime', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (102, NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7600, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (114, NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', 150, '', NULL, NULL, NULL, '', NULL, 9, 'img', NULL, 1, 1, 1, NULL, 1, 0, 200, '超级管理员', '2021-04-12 23:04:26', 1, 7842, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (142, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8570, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (143, NULL, NULL, NULL, 12, '分类', 'Variety', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'pz', NULL, 1, 'checkbox', 1, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2022-03-26 02:10:15', 1, 8560, NULL, NULL, 1, 'select', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (144, NULL, NULL, NULL, 12, '值范围', 'AgeRange', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'age', NULL, 10, 'select', 1, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2022-03-26 02:10:15', 1, 8550, NULL, NULL, 1, 'select', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (145, NULL, NULL, NULL, 12, '城市', 'City', 'string', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'city', NULL, 15, 'select', 1, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2022-03-26 02:10:15', 1, 8540, NULL, NULL, 1, 'select', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (146, NULL, NULL, NULL, 12, '价格', 'AvgPrice', 'decimal', 80, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 20, NULL, 1, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8530, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (147, NULL, NULL, NULL, 12, '日期', 'Date', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 25, 'date', 1, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8520, NULL, NULL, 2, 'datetime', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (148, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, 'enable', NULL, NULL, 'select', 1, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8510, NULL, NULL, 2, 'select', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (149, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8500, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (150, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 40, NULL, 3, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2022-03-26 02:10:15', 1, 8490, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (151, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 40, NULL, 3, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8480, NULL, NULL, NULL, 'datetime', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (152, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8470, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (153, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2022-03-26 02:10:15', 1, 8460, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (154, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-10 13:57:15', NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8450, NULL, NULL, NULL, NULL, 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (155, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8440, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (156, NULL, NULL, NULL, NULL, '品种', 'Variety', 'string', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'pz', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2019-09-18 18:36:03', 1, 8430, NULL, NULL, 1, 'drop', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (157, NULL, NULL, NULL, NULL, '月龄', 'Age', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, 'age', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2019-09-18 18:36:03', 1, 8420, NULL, NULL, 1, 'drop', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (158, NULL, NULL, NULL, NULL, '报价城市', 'City', 'string', 120, NULL, '2018-07-10 15:02:46', NULL, NULL, 'city', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2019-09-18 18:36:03', 1, 8410, NULL, NULL, 1, 'dropList', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (159, NULL, NULL, NULL, NULL, '上报价格', 'Price', 'decimal', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8400, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (160, 0, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'audit', NULL, NULL, 'select', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8382, NULL, NULL, 2, 'select', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (161, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8380, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (162, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 18:36:03', 1, 8370, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (163, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, 'enable', NULL, 2, 'switch', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8360, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (164, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8350, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (165, NULL, NULL, NULL, NULL, '上报人', 'Creator', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2019-09-18 18:36:03', 1, 8388, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (166, NULL, 0, NULL, NULL, '上报时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8387, NULL, NULL, 2, 'datetime', NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (167, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8320, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (168, NULL, NULL, NULL, 12, '测试', 'Modifier', 'string', 100, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 18:36:03', 1, 8310, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (169, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2018-07-10 15:02:46', NULL, NULL, NULL, NULL, 5, '无', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8300, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (170, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '超级管理员', '2019-09-18 18:36:03', 1, 8381, NULL, NULL, NULL, NULL, NULL, 'App_ReportPrice', 16);
INSERT INTO `Sys_TableColumn` VALUES (193, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 8060, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (194, NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', 120, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2022-03-26 22:57:56', 1, 8050, NULL, NULL, 1, 'text', 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (195, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 0, 0, 15, '超级管理员', '2022-03-26 22:57:56', 1, 8040, NULL, NULL, 1, 'text', 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (196, NULL, NULL, NULL, NULL, '数量', 'Quantity', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 0, NULL, 2, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 8030, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (197, NULL, NULL, NULL, NULL, '类型', 'CowType', 'string', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, 'nav', NULL, 2, 'select', 1, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2022-03-26 22:57:56', 1, 8020, NULL, NULL, 2, 'select', 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (198, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 190, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 0, NULL, 2, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-03-26 22:57:56', 1, 8010, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (199, NULL, NULL, NULL, NULL, '状态', 'Enable', 'sbyte', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 8000, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (200, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 7990, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (201, NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', 130, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 3, NULL, 3, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-03-26 22:57:56', 1, 7980, NULL, NULL, 2, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (202, NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, 3, NULL, 3, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 7970, NULL, NULL, 2, 'date', 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (203, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 7960, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (204, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-03-26 22:57:56', 1, 7950, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (205, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 15:12:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 7940, NULL, NULL, NULL, NULL, 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (206, 1, 1, 0, NULL, '主键ID', 'ExpertId', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7930, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (207, NULL, NULL, NULL, NULL, '专家名称', 'ExpertName', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, 1, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (208, NULL, NULL, NULL, NULL, '真实姓名', 'ReallyName', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 1, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7910, '', NULL, 1, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (209, NULL, NULL, NULL, NULL, '身份证号', 'IDNumber', 'string', 200, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 18, '超级管理员', '2019-09-18 16:46:51', 1, 7900, '', NULL, 1, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (210, NULL, NULL, NULL, NULL, '专家头像', 'HeadImageUrl', 'string', 220, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 10, '', NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (211, NULL, NULL, NULL, NULL, '学历', 'Education', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 2, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7880, '', NULL, 2, 'text', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (212, NULL, NULL, NULL, NULL, '职业', 'Professional', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 3, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7870, '', NULL, 2, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (213, NULL, NULL, NULL, NULL, '所在公司', 'Company', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7860, '', NULL, 2, '无', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (214, NULL, NULL, NULL, NULL, '服务地区', 'City', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, 'city', NULL, 3, 'drop', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7850, '', NULL, 3, 'dropList', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (215, NULL, NULL, NULL, NULL, '擅长领域', 'SpecialField', 'string', 120, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 9, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 800, '超级管理员', '2019-09-18 16:46:51', 1, 7840, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (216, NULL, NULL, NULL, NULL, '个人简介', 'Resume', 'string', 220, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 9, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2019-09-18 16:46:51', 1, 7830, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (217, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 120, '', '2018-07-10 15:29:01', NULL, NULL, 'audit', NULL, 0, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, 3, 'dropList', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (218, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7810, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (219, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 20, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (220, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7790, '', NULL, 3, 'datetime', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (221, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, '', '2018-07-10 15:29:01', NULL, NULL, 'enable', NULL, 7, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7919, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (222, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7770, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (223, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7760, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (224, NULL, NULL, NULL, NULL, '申请时间', 'CreateDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 7, '', NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7750, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (225, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7740, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (226, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7730, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (227, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, '', '2018-07-10 15:29:01', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7720, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (308, NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6910, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (309, NULL, NULL, NULL, 12, '标题', 'Title', 'string', 250, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2021-05-05 19:40:33', 1, 6900, NULL, NULL, 1, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (310, NULL, NULL, NULL, NULL, '发布人', 'Author', 'string', 120, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 50, '超级管理员', '2021-05-05 19:40:33', 1, 6890, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (311, 0, NULL, NULL, NULL, '发布时间', 'ReleaseDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6880, NULL, NULL, 3, 'datetime', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (312, NULL, NULL, NULL, 12, '封面图片', 'ImageUrl', 'string', 220, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2021-05-05 19:40:33', 1, 6870, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (313, NULL, NULL, NULL, NULL, '图片(大图)', 'BigImageUrls', 'string', 220, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2021-05-05 19:40:33', 1, 6860, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (314, NULL, NULL, NULL, 12, '新闻地址', 'DetailUrl', 'string', 90, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2021-05-05 19:40:33', 1, 6850, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (315, NULL, NULL, NULL, NULL, '浏览次数', 'ViewCount', 'int', 110, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6840, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (316, NULL, NULL, NULL, NULL, '新闻类型', 'NewsType', 'int', 110, NULL, '2018-07-10 16:11:59', NULL, NULL, 'news', 1, 3, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6830, NULL, NULL, 1, 'drop', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (317, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 90, NULL, '2018-07-10 16:11:59', NULL, NULL, 'enable', NULL, 7, 'drop', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6820, NULL, NULL, 3, 'drop', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (318, NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6810, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (319, NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', 130, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2021-05-05 19:40:33', 1, 6800, NULL, NULL, 3, '无', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (320, NULL, NULL, NULL, NULL, '发布时间', 'CreateDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6790, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (321, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6780, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (322, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2021-05-05 19:40:33', 1, 6770, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (323, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-07-10 16:11:59', NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6760, NULL, NULL, NULL, 'datetime', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (324, NULL, NULL, NULL, 12, '新闻内容', 'Content', 'string', 300, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 1, 0, NULL, NULL, 1, 0, 0, '超级管理员', '2021-05-05 19:40:33', 1, 6896, NULL, NULL, NULL, NULL, 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (429, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2021-04-12 23:04:26', 1, 7760, '', NULL, 3, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (431, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 4, '', NULL, 1, 1, NULL, NULL, 1, 0, 500, '超级管理员', '2021-04-12 23:04:26', 1, 7810, '', NULL, 2, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (446, NULL, NULL, NULL, 12, '置顶', 'IsTop', 'int', 90, NULL, NULL, NULL, NULL, 'top', NULL, 30, 'select', 1, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-03-26 02:10:15', 1, 8515, NULL, NULL, 2, 'select', 0, 'App_TransactionAvgPrice', 15);
INSERT INTO `Sys_TableColumn` VALUES (457, NULL, NULL, NULL, NULL, '状态', 'TransactionType', 'int', 120, NULL, NULL, NULL, NULL, 'cq', NULL, 2, 'select', 1, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-03-26 22:57:56', 1, 8021, NULL, NULL, 1, 'select', 0, 'App_Transaction', 19);
INSERT INTO `Sys_TableColumn` VALUES (506, NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', 100, '', NULL, NULL, NULL, 'gender', NULL, 4, 'drop', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7843, '', NULL, 1, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (523, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, 6, '', NULL, 1, 1, NULL, NULL, 1, 0, 11, '超级管理员', '2019-09-18 16:46:51', 1, 7900, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (550, NULL, NULL, NULL, NULL, '申请人帐号Id', 'User_Id', 'int', 90, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, NULL, 1, 0, NULL, '超级管理员', '2019-09-18 16:46:51', 1, 7921, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (551, NULL, NULL, NULL, NULL, '申请人帐号', 'UserName', 'string', 120, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 30, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (552, NULL, NULL, NULL, NULL, '申请人', 'UserTrueName', 'string', 120, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, 50, '超级管理员', '2019-09-18 16:46:51', 1, 7920, '', NULL, NULL, '', NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (654, NULL, NULL, NULL, NULL, '登陆设备类型', 'AppType', 'int', 150, '', NULL, NULL, NULL, 'ut', NULL, 0, '', NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7809, '', NULL, 3, 'dropList', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (659, NULL, NULL, NULL, NULL, '是否手机用户', 'IsRegregisterPhone', 'int', 120, '', NULL, NULL, NULL, 'isphone', NULL, 2, 'drop', NULL, 1, 0, NULL, NULL, 0, 0, NULL, '超级管理员', '2021-04-12 23:04:26', 1, 7771, '', NULL, 3, 'drop', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (663, NULL, NULL, NULL, NULL, '是否今日推荐', 'DailyRecommend', 'sbyte', 120, NULL, NULL, NULL, NULL, 'dr', NULL, 5, 'drop', NULL, 1, 1, NULL, NULL, 0, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6825, NULL, NULL, 1, 'drop', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (664, NULL, NULL, NULL, NULL, '推荐排序', 'OrderNo', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, NULL, 1, 0, NULL, '超级管理员', '2021-05-05 19:40:33', 1, 6822, NULL, NULL, NULL, '无', 0, 'App_News', 28);
INSERT INTO `Sys_TableColumn` VALUES (714, NULL, NULL, NULL, NULL, 'Id', 'Order_Id', 'string', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-03-26 23:32:24', 1, 2850, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (715, NULL, NULL, NULL, NULL, '订单类型', 'OrderType', 'int', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', 'ordertype', 1, 1, 'select', 1, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2840, NULL, 1, 1, 'select', 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (716, NULL, NULL, NULL, NULL, '运单号', 'TranNo', 'string', 150, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 1, 1, NULL, 1, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2022-03-26 23:32:24', 1, 2830, NULL, NULL, 1, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (717, NULL, NULL, NULL, NULL, '销售订单号', 'SellNo', 'string', 200, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 2, 2, NULL, 1, 1, 1, NULL, 0, 0, 0, 255, '超级管理员', '2022-03-26 23:32:24', 1, 2820, NULL, NULL, 1, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (718, NULL, NULL, NULL, NULL, '销售数量', 'Qty', 'int', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 2, 1, NULL, 2, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2810, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (719, NULL, NULL, NULL, 8, '备注', 'Remark', 'string', 100, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, 2, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2022-03-26 23:32:24', 1, 2800, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (720, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2790, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (721, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 3, 3, NULL, 4, 1, 1, NULL, 0, 1, 1, 255, '超级管理员', '2022-03-26 23:32:24', 1, 2780, NULL, NULL, 3, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (722, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 3, 3, NULL, 3, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2770, NULL, NULL, 3, 'datetime', 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (723, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2760, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (724, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 4, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 255, '超级管理员', '2022-03-26 23:32:24', 1, 2750, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (725, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-08-22 17:26:55', 1, '超级管理员', NULL, 4, 3, NULL, 3, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2740, NULL, NULL, 3, 'datetime', 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (726, NULL, NULL, NULL, NULL, '', 'OrderList_Id', 'string', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 0, 36, '超级管理员', '2019-09-19 14:54:58', 1, 2730, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (727, NULL, NULL, NULL, NULL, '订单Id', 'Order_Id', 'string', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 1, 36, '超级管理员', '2019-09-19 14:54:58', 1, 2720, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (728, NULL, NULL, NULL, NULL, '商品名称', 'ProductName', 'string', 150, NULL, '2019-08-28 09:17:39', 1, '超级管理员', 'pn', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2019-09-19 14:54:58', 1, 2710, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (729, NULL, NULL, NULL, NULL, '批次', 'MO', 'string', 100, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, '超级管理员', '2019-09-19 14:54:58', 1, 2700, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (730, NULL, NULL, NULL, NULL, '数量', 'Qty', 'int', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 1, 'drop', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2690, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (731, NULL, NULL, NULL, NULL, '重量', 'Weight', 'decimal', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2680, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (732, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 120, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2019-09-19 14:54:58', 1, 2670, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (733, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2660, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (734, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2019-09-19 14:54:58', 1, 2650, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (735, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2640, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (736, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2630, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (737, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2019-09-19 14:54:58', 1, 2620, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (738, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-08-28 09:17:39', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2019-09-19 14:54:58', 1, 2610, NULL, NULL, NULL, NULL, NULL, 'SellOrderList', 78);
INSERT INTO `Sys_TableColumn` VALUES (739, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 120, NULL, '2019-08-28 09:32:29', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2805, NULL, NULL, 2, 'datetime', 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (740, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', NULL, NULL, '2019-08-28 09:32:29', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 100, '超级管理员', '2022-03-26 23:32:24', 1, 2803, NULL, NULL, 2, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (741, NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', NULL, NULL, '2019-08-28 09:32:29', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2801, NULL, NULL, NULL, NULL, 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (742, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', NULL, NULL, '2019-08-28 09:32:29', 1, '超级管理员', 'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 0, NULL, '超级管理员', '2022-03-26 23:32:24', 1, 2808, NULL, NULL, 2, 'select', 0, 'SellOrder', 77);
INSERT INTO `Sys_TableColumn` VALUES (743, NULL, NULL, NULL, NULL, '', 'Id', 'string', 90, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 5, 1, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-03-26 01:27:41', 1, 2560, NULL, NULL, NULL, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (744, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 1, 3, NULL, 3, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-03-26 01:27:41', 1, 2550, NULL, NULL, 1, 'datetime', 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (745, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 01:27:41', 1, 2540, NULL, NULL, NULL, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (746, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 2, 3, NULL, 3, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2022-03-26 01:27:41', 1, 2530, NULL, NULL, 1, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (747, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 180, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 2, NULL, 1, 1, 1, NULL, 0, 0, 1, 250, '超级管理员', '2022-03-26 01:27:41', 1, 3460, NULL, NULL, NULL, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (748, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 4, NULL, 4, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2022-03-26 01:27:41', 1, 2510, NULL, NULL, NULL, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (749, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, 1, 4, NULL, 4, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2022-03-26 01:27:41', 1, 2500, NULL, NULL, NULL, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (750, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-03-26 01:27:41', 1, 2490, NULL, NULL, NULL, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (751, NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', 100, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 0, 1, 50, '超级管理员', '2022-03-26 01:27:41', 1, 3500, NULL, NULL, 1, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (752, NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', 130, NULL, '2019-09-18 15:46:43', 1, '超级管理员', NULL, NULL, 2, NULL, 1, 1, 1, NULL, 0, 0, 1, 15, '超级管理员', '2022-03-26 01:27:41', 1, 3470, NULL, NULL, 1, NULL, 0, 'App_Appointment', 80);
INSERT INTO `Sys_TableColumn` VALUES (763, NULL, NULL, NULL, NULL, '', 'Certificate', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2500, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'App_Expert', 20);
INSERT INTO `Sys_TableColumn` VALUES (764, NULL, NULL, NULL, NULL, '', 'FormId', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-01-03 19:28:41', 1, 1150, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (765, NULL, NULL, NULL, NULL, '表单名称', 'Title', 'string', 220, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-01-03 19:28:41', 1, 1100, NULL, NULL, 1, 'like', 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (766, NULL, NULL, NULL, NULL, '设计器配置', 'DaraggeOptions', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 1050, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (767, NULL, NULL, NULL, NULL, '表单参数', 'FormOptions', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 1000, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (768, NULL, NULL, NULL, NULL, '表单配置', 'FormConfig', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 950, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (769, NULL, NULL, NULL, NULL, '表单字段', 'FormFields', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 900, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (770, NULL, NULL, NULL, NULL, '表格配置', 'TableConfig', 'string', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:28:41', 1, 850, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (771, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 800, NULL, NULL, 1, 'datetime', 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (772, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 750, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (773, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:28:41', 1, 700, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (774, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:28:41', 1, 650, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (775, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 600, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (776, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-01-03 19:26:44', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:28:41', 1, 550, NULL, NULL, NULL, NULL, 0, 'FormDesignOptions', 84);
INSERT INTO `Sys_TableColumn` VALUES (777, NULL, NULL, NULL, NULL, '', 'FormCollectionId', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-01-03 19:30:13', 1, 1000, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (778, NULL, NULL, NULL, NULL, '', 'FormId', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2022-01-03 19:30:13', 1, 950, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (779, NULL, NULL, NULL, NULL, '标题', 'Title', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:30:13', 1, 900, NULL, NULL, 1, 'like', 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (780, NULL, NULL, NULL, NULL, '表单数据', 'FormData', 'string', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-01-03 19:30:13', 1, 850, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (781, NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 800, NULL, NULL, 1, 'datetime', 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (782, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 750, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (783, NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', 130, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:30:13', 1, 700, NULL, NULL, 1, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (784, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-01-03 19:30:13', 1, 650, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (785, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 600, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (786, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-01-03 19:29:20', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-01-03 19:30:13', 1, 550, NULL, NULL, NULL, NULL, 0, 'FormCollectionObject', 85);
INSERT INTO `Sys_TableColumn` VALUES (801, NULL, NULL, NULL, NULL, '', 'WorkFlow_Id', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (802, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, 1, 'like', 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (803, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, 1, '', 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (804, NULL, NULL, NULL, NULL, '功能菜单', 'WorkTableName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (805, NULL, NULL, NULL, NULL, '节点信息', 'NodeConfig', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (806, NULL, NULL, NULL, NULL, '连接配置', 'LineConfig', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (807, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (808, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (809, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (810, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (811, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'sbyte', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, 1, 'datetime', 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (812, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (813, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (814, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:37:59', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 88);
INSERT INTO `Sys_TableColumn` VALUES (815, NULL, NULL, NULL, NULL, '', 'WorkStepFlow_Id', 'string', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:38:35', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (816, NULL, NULL, NULL, NULL, '流程主表id', 'WorkFlow_Id', 'string', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2022-08-17 23:38:35', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (817, NULL, NULL, NULL, NULL, '流程节点Id', 'StepId', 'string', 120, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2022-08-17 23:38:35', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (818, NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', 180, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:38:35', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (819, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批,3=按部门审批)', 'StepType', 'int', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (820, NULL, NULL, NULL, NULL, '审批用户id或角色id、部门id', 'StepValue', 'int', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (821, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (822, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 220, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-08-17 23:38:35', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (823, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (824, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (825, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:38:35', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (826, NULL, NULL, NULL, NULL, '', 'Enable', 'sbyte', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (827, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:38:35', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (828, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (829, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-17 23:20:22', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:38:35', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 89);
INSERT INTO `Sys_TableColumn` VALUES (830, NULL, NULL, NULL, NULL, '', 'WorkFlowTable_Id', 'string', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:40:13', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (831, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'string', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2022-08-17 23:40:13', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (832, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 180, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1150, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (833, NULL, NULL, NULL, NULL, '表主键id', 'WorkTableKey', 'string', 180, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (834, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 120, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1050, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (835, NULL, NULL, NULL, NULL, '业务名称', 'WorkTableName', 'string', 120, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:40:13', 1, 1000, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (836, NULL, NULL, NULL, NULL, '当前审批节点', 'CurrentOrderId', 'int', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (837, NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', 'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 900, NULL, NULL, 1, 'select', 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (838, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (839, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (840, NULL, NULL, NULL, NULL, '创建时间', 'Creator', 'string', 130, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:40:13', 1, 750, NULL, NULL, 1, 'datetime', 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (841, NULL, NULL, NULL, NULL, '', 'Enable', 'sbyte', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (842, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:40:13', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (843, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (844, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-17 23:21:04', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:40:13', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 90);
INSERT INTO `Sys_TableColumn` VALUES (845, NULL, NULL, NULL, NULL, '', 'Sys_WorkFlowTableStep_Id', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-08-17 23:22:24', 1, 1500, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (846, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:22:24', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (847, NULL, NULL, NULL, NULL, '', 'Enable', 'sbyte', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (848, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-08-17 23:22:24', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (849, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (850, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (851, NULL, NULL, NULL, NULL, '', 'Remark', 'string', 220, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-08-17 23:22:24', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (852, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (853, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (854, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-08-17 23:22:24', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (855, NULL, NULL, NULL, NULL, '审核人id', 'AuditId', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (856, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (857, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批,3=按部门审批 )', 'StepValue', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (858, NULL, NULL, NULL, NULL, '审批类型', 'StepType', 'int', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (859, NULL, NULL, NULL, NULL, '节名称', 'StepName', 'string', 180, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2022-08-17 23:22:24', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (860, NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', 120, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2022-08-17 23:22:24', 1, 1350, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (861, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2022-08-17 23:22:24', 1, 1400, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (862, NULL, NULL, NULL, NULL, '主表id', 'WorkFlowTable_Id', 'string', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2022-08-17 23:22:24', 1, 1450, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (863, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (864, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-17 23:22:13', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-08-17 23:22:24', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 91);
INSERT INTO `Sys_TableColumn` VALUES (865, NULL, NULL, NULL, NULL, '', 'Id', 'string', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-09-07 14:15:05', 1, 1450, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (866, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (867, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 700, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (868, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-07 14:15:05', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (869, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (870, NULL, NULL, NULL, NULL, '超时时间(秒)', 'TimeOut', 'int', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 10, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (871, NULL, NULL, NULL, 12, 'post参数', 'PostData', 'string', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 12, NULL, NULL, 1, 1, NULL, 0, 0, 0, 0, '超级管理员', '2022-09-07 14:15:05', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (872, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 0, '超级管理员', '2022-09-07 14:15:05', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (873, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-07 14:15:05', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (874, NULL, NULL, NULL, NULL, '状态', 'Status', 'int', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 10, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (875, NULL, NULL, NULL, NULL, 'AuthValue', 'AuthValue', 'string', 100, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 14:15:05', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (876, NULL, NULL, NULL, NULL, 'AuthKey', 'AuthKey', 'string', 100, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 14:15:05', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (877, NULL, NULL, NULL, 12, 'Url地址', 'ApiUrl', 'string', 130, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 14:15:05', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (878, NULL, NULL, NULL, NULL, '请求方式', 'Method', 'string', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-09-07 14:15:05', 1, 1250, NULL, NULL, 1, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (879, NULL, NULL, NULL, NULL, 'Corn表达式', 'CronExpression', 'string', 120, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2022-09-07 14:15:05', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (880, NULL, NULL, NULL, NULL, '任务分组', 'GroupName', 'string', 100, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-09-07 14:15:05', 1, 1350, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (881, NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', 100, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-09-07 14:15:05', 1, 1400, NULL, NULL, 1, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (882, NULL, NULL, NULL, NULL, '最后执行时间', 'LastRunTime', 'DateTime', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 1050, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (883, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-09-07 14:13:10', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:15:05', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 93);
INSERT INTO `Sys_TableColumn` VALUES (884, NULL, NULL, NULL, NULL, '', 'LogId', 'string', 110, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2022-09-07 14:18:33', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (885, NULL, NULL, NULL, NULL, '', 'Id', 'string', 110, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2022-09-07 14:18:33', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (886, NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', 100, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-09-07 14:18:33', 1, 1150, NULL, NULL, 1, 'like', 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (887, NULL, NULL, NULL, NULL, '耗时(秒)', 'ElapsedTime', 'int', 90, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (888, NULL, NULL, NULL, NULL, '开始时间', 'StratDate', 'DateTime', 150, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 1050, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (889, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 1000, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (890, NULL, NULL, NULL, NULL, '是否成功', 'Result', 'int', 90, NULL, '2022-09-07 14:17:27', 1, '超级管理员', 'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 950, NULL, NULL, 1, 'select', 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (891, NULL, NULL, NULL, NULL, '返回内容', 'ResponseContent', 'string', 110, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-07 14:18:33', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (892, NULL, NULL, NULL, NULL, '异常信息', 'ErrorMsg', 'string', 200, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-07 14:18:33', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (893, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (894, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-07 14:18:33', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (895, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (896, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (897, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-07 14:18:33', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);
INSERT INTO `Sys_TableColumn` VALUES (898, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-09-07 14:17:27', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2022-09-07 14:18:33', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 94);

-- ----------------------------
-- Table structure for Sys_TableInfo
-- ----------------------------
DROP TABLE IF EXISTS `Sys_TableInfo`;
CREATE TABLE `Sys_TableInfo`  (
  `Table_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CnName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ColumnCNName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DBServer` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DataTableType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DetailCnName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DetailName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EditorType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `ExpressField` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FolderName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Namespace` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NULL DEFAULT NULL,
  `RichText` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SortName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TableName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TableTrueName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UploadField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UploadMaxCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Table_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO `Sys_TableInfo` VALUES (2, '角色管理', '角色管理', NULL, NULL, NULL, NULL, NULL, 1, 'RoleName', 'System', 'VOL.System', NULL, 8, NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (3, '字典数据', '字典数据', NULL, NULL, '字典明细', 'Sys_DictionaryList', NULL, 1, 'DicName', 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_Dictionary', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (4, '字典明细', '字典明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 11, NULL, NULL, 'Sys_DictionaryList', 'Sys_DictionaryList', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (5, '系统日志', '系统日志', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 10, NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (6, NULL, '用户管理', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'System', 'VOL.System', NULL, 8, NULL, '', 'Sys_User', 'Sys_User', 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (8, '用户基础信息', '用户基础信息', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', 200, 0, NULL, NULL, '无', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (10, '日志管理', '日志管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '170', '日志管理', '日志管理', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (11, '配置管理', '配置管理', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, '250', '配置管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (15, '成交均价', '自动绑定下拉框', NULL, NULL, NULL, NULL, NULL, 1, 'AvgPrice', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_TransactionAvgPrice', 'App_TransactionAvgPrice', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (16, NULL, '新增编辑表单', NULL, NULL, NULL, NULL, NULL, 1, 'Price', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_ReportPrice', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (19, NULL, '导入导出', NULL, NULL, NULL, NULL, NULL, 1, 'Name', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_Transaction', 'App_Transaction', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (20, NULL, '启用图片支持', NULL, NULL, NULL, NULL, NULL, 1, 'UserName', 'App', 'VOL.AppManager', NULL, 79, NULL, NULL, 'App_Expert', NULL, 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (27, '侩牛资讯', '静态页面发布', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'News', 'VOL.AppManager', NULL, 0, NULL, NULL, '侩牛资讯', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (28, NULL, '新闻列表', NULL, NULL, NULL, NULL, NULL, 1, 'Title', 'News', 'VOL.AppManager', NULL, 27, 'Content', 'CreateDate', 'App_News', 'App_News', 'ImageUrl', 3);
INSERT INTO `Sys_TableInfo` VALUES (76, '订单管理', '测试完整示例', NULL, NULL, NULL, NULL, NULL, 1, NULL, '订单管理', 'VOL.Order', NULL, 0, NULL, NULL, '订单管理', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (77, '销售订单', '销售订单', NULL, NULL, '订单明细', 'SellOrderList', NULL, 1, 'TranNo', 'Sell', 'VOL.Order', NULL, 76, NULL, 'CreateDate', 'SellOrder', 'SellOrder', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (78, '订单明细', '订单明细', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Order', 'VOL.Order', NULL, 76, NULL, 'CreateDate', 'SellOrderList', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (79, 'Table 单表数据', 'Table+单表数据', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Order', 'VOL.Order', NULL, 0, NULL, NULL, 'Table+单表数据', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (80, '基础表单查询', '基础表单+编辑只读', NULL, NULL, NULL, NULL, NULL, 1, 'Name', 'Appointment', 'VOL.Order', NULL, 79, NULL, 'CreateDate', 'App_Appointment', 'App_Appointment', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (83, '表单设计', '表单设计', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.System', NULL, 0, NULL, NULL, '表单设计', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (84, '表单设计', '表单设计', NULL, NULL, NULL, '', NULL, 1, 'Title', 'form', 'VOL.System', NULL, 83, NULL, 'CreateDate', 'FormDesignOptions', 'FormDesignOptions', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (85, '数据采集', '数据采集', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'form', 'VOL.System', NULL, 83, NULL, 'CreateDate', 'FormCollectionObject', 'FormCollectionObject', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (86, 'test', 'test', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'test', 'VOL.System', NULL, 10, NULL, NULL, 'Sys_Log111', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (87, '审批流程', '审批流程', NULL, NULL, NULL, NULL, NULL, 1, NULL, '审批流程', 'VOL.System', NULL, 0, NULL, NULL, '审批流程', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (88, '审批流程配置', '审批流程配置', NULL, NULL, '审批步骤', 'Sys_WorkFlowStep', NULL, 1, 'WorkName', 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlow', 'Sys_WorkFlow', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (89, '审批节点配置', '审批节点配置', NULL, NULL, '', NULL, NULL, 1, NULL, 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlowStep', 'Sys_WorkFlowStep', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (90, '审批流程', '审批流程', NULL, NULL, '审批节点', 'Sys_WorkFlowTableStep', NULL, 1, NULL, 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlowTable', 'Sys_WorkFlowTable', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (91, '审批节点', '审批节点', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'flow', 'VOL.System', NULL, 87, NULL, 'CreateDate', 'Sys_WorkFlowTableStep', 'Sys_WorkFlowTableStep', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (92, '定时任务', '定时任务', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Quartz', 'VOL.System', NULL, 0, NULL, NULL, '定时任务', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (93, '定时任务', '定时任务', NULL, NULL, NULL, NULL, NULL, 1, 'TaskName', 'Quartz', 'VOL.System', NULL, 92, NULL, 'CreateDate', 'Sys_QuartzOptions', 'Sys_QuartzOptions', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (94, '执行记录', '执行记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Quartz', 'VOL.System', NULL, 92, NULL, 'CreateDate', 'Sys_QuartzLog', 'Sys_QuartzLog', NULL, NULL);

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE IF EXISTS `Sys_User`;


-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE IF EXISTS `Sys_User`;
CREATE TABLE `Sys_User`  (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AppType` int(11) NULL DEFAULT NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NOT NULL,
  `Gender` int(1) NULL DEFAULT NULL,
  `HeadImageUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsRegregisterPhone` int(11) NOT NULL,
  `LastLoginDate` datetime(0) NULL DEFAULT NULL,
  `LastModifyPwdDate` datetime(0) NULL DEFAULT NULL,
  `Mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Role_Id` int(11) NOT NULL,
  `RoleName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNo` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserPwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UserTrueName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Token` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`User_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3381 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;


-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO `Sys_User` VALUES (1, '北京市西城区', 0, '2019-08-18 00:54:06', 1, '超级管理员', '2012-06-10 11:10:03', NULL, NULL, NULL, 0, '283591387@qq.com', 1, 1, 'Upload/Tables/Sys_User/202006191408112343/1111s.jpg', 0, '2017-08-28 09:58:55', '2019-12-14 15:13:49', NULL, '超级管理员', '2020-06-19 14:08:12', 1, 0, 1, '超级管理员', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', '');
INSERT INTO `Sys_User` VALUES (3362, '北京市还没注册', NULL, '2019-08-18 00:54:06', 1, '超级管理员', '2019-08-13 14:24:27', NULL, NULL, NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202004241341311851/04.jpg', 0, NULL, '2019-09-22 23:12:33', '01012345678', '超级管理员', '2021-01-27 12:53:41', 1, NULL, 2, '测试管理员', NULL, NULL, NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', '演示帐号', '');
INSERT INTO `Sys_User` VALUES (3378, NULL, NULL, NULL, NULL, NULL, '2021-09-27 15:50:22', 1, '超级管理员', NULL, NULL, NULL, 0, 0, 'Upload/Tables/Sys_User/202109271550212214/12313.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '小编', NULL, NULL, NULL, 'Admin888', 'al7ulHECMmQ_i6lA3dPKlg==', 'Admin888', '');

-- ----------------------------
-- Table structure for Sys_WorkFlow
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlow`;
CREATE TABLE `Sys_WorkFlow`  (
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程名称',
  `WorkTable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `WorkTableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能菜单',
  `NodeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '节点信息',
  `LineConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '连接配置',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL COMMENT '是否启用',
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkFlow_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlow
-- ----------------------------
INSERT INTO `Sys_WorkFlow` VALUES ('c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', 'SellOrder', '销售订单', '[{\"id\":\"1659276275052\",\"name\":\"流程-节点A\",\"type\":\"task\",\"left\":\"230px\",\"top\":\"15px\",\"ico\":\"el-icon-user-solid\",\"nodeType\":\"1\",\"userId\":1,\"roleId\":null},{\"id\":\"1659276282115\",\"name\":\"流程-节点B\",\"type\":\"task\",\"left\":\"228px\",\"top\":\"127px\",\"ico\":\"el-icon-goods\",\"nodeType\":\"1\",\"userId\":3362,\"roleId\":null},{\"id\":\"l0om4eidz\",\"name\":\"流程-节点C\",\"type\":\"timer\",\"left\":\"226px\",\"top\":\"243.25px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"nodeType\":\"1\",\"userId\":3378,\"roleId\":null}]', '[{\"from\":\"1659276275052\",\"to\":\"1659276282115\"},{\"from\":\"1659276282115\",\"to\":\"l0om4eidz\"}]', '订单流程测试', '2022-08-15 05:00:03', 1, '超级管理员', 0, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlow` VALUES ('d3445da2-043f-4c8b-943a-0c8a8f92d4b5', '流程测试', 'App_Expert', '启用图片支持', '[{\"id\":\"1659276275052\",\"name\":\"流程C-节点A\",\"type\":\"task\",\"left\":\"46px\",\"top\":\"28px\",\"ico\":\"el-icon-user-solid\",\"nodeType\":\"1\",\"userId\":1,\"roleId\":null},{\"id\":\"1659276282115\",\"name\":\"流程C-节点B\",\"type\":\"task\",\"left\":\"61px\",\"top\":\"195px\",\"ico\":\"el-icon-goods\",\"nodeType\":\"1\",\"userId\":1,\"roleId\":null},{\"id\":\"txpo1vyv8u\",\"name\":\"添加节点\",\"type\":\"timer\",\"left\":\"266px\",\"top\":\"99px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"stepValue\":null,\"nodeType\":1,\"userId\":3362,\"roleId\":null,\"deptId\":null},{\"id\":\"yshtxdrq9u\",\"name\":\"添加节点1\",\"type\":\"timer\",\"left\":\"498px\",\"top\":\"200px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"stepValue\":null,\"nodeType\":1,\"userId\":3378,\"roleId\":null,\"deptId\":null},{\"id\":\"64q19orr1h\",\"name\":\"添加节点2\",\"type\":\"timer\",\"left\":\"515px\",\"top\":\"39px\",\"ico\":\"el-icon-plus\",\"state\":\"success\",\"stepValue\":null,\"nodeType\":1,\"userId\":1,\"roleId\":null,\"deptId\":null}]', '[{\"from\":\"1659276275052\",\"to\":\"1659276282115\"},{\"from\":\"1659276282115\",\"to\":\"txpo1vyv8u\"},{\"from\":\"txpo1vyv8u\",\"to\":\"yshtxdrq9u\"},{\"from\":\"yshtxdrq9u\",\"to\":\"64q19orr1h\"}]', '流程测试', '2022-08-15 05:02:05', 1, '超级管理员', 0, '超级管理员', '2022-08-17 00:30:38', 1);

-- ----------------------------
-- Table structure for Sys_WorkFlowStep
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowStep`;
CREATE TABLE `Sys_WorkFlowStep`  (
  `WorkStepFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程主表id',
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程节点Id',
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `StepType` int(11) NULL DEFAULT NULL COMMENT '节点类型(1=按用户审批,2=按角色审批,3=按部门审批)',
  `StepValue` int(11) NULL DEFAULT NULL COMMENT '审批用户id或角色id、部门id',
  `OrderId` int(11) NULL DEFAULT NULL COMMENT '审批顺序',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkStepFlow_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowStep
-- ----------------------------
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e37-f54f-4d01-841c-fd9981caf52c', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, NULL, '2022-08-15 05:00:03', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e37-f54f-4d43-8759-ea887bb9ad66', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, NULL, '2022-08-15 05:00:03', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e37-f54f-4d6a-8e9b-5a067e559d4c', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, NULL, '2022-08-15 05:00:03', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e38-3e0b-48c7-8c31-702b73e9d97e', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '1659276275052', '流程C-节点A', 1, 1, 1, NULL, '2022-08-15 05:02:05', 1, '超级管理员', NULL, '超级管理员', '2022-08-17 00:30:38', 1);
INSERT INTO `Sys_WorkFlowStep` VALUES ('08da7e38-3e0b-48ef-8010-b941874857b5', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '1659276282115', '流程C-节点B', 1, 1, 2, NULL, '2022-08-15 05:02:05', 1, '超级管理员', NULL, '超级管理员', '2022-08-17 00:30:38', 1);
INSERT INTO `Sys_WorkFlowStep` VALUES ('257cb391-4b84-41eb-b8db-d38c6dde4e9c', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', 'txpo1vyv8u', '添加节点', 1, 3362, 3, NULL, '2022-08-17 00:30:38', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('a6b7408c-9dc4-422d-8d98-c9a5660f579a', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', 'yshtxdrq9u', '添加节点1', 1, 3378, 4, NULL, '2022-08-17 00:30:38', 1, '超级管理员', NULL, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('ee385e1c-d78a-4eb8-9539-661822dcbfb8', 'd3445da2-043f-4c8b-943a-0c8a8f92d4b5', '64q19orr1h', '添加节点2', 1, 1, 5, NULL, '2022-08-17 00:30:38', 1, '超级管理员', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_WorkFlowTable
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTable`;
CREATE TABLE `Sys_WorkFlowTable`  (
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程id',
  `WorkName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `WorkTableKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表主键id',
  `WorkTable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `WorkTableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务名称',
  `CurrentOrderId` int(11) NULL DEFAULT NULL COMMENT '当前审批节点',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审批状态',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkFlowTable_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowTable
-- ----------------------------
INSERT INTO `Sys_WorkFlowTable` VALUES ('460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', 'ec217c01-42a2-435f-bdb6-70613b947bf9', 'SellOrder', '销售订单', 2, 1, '2022-08-15 05:01:04', 1, '超级管理员', 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTable` VALUES ('a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', '978ad775-77c0-49ca-be31-ba36bb6f8af8', 'SellOrder', '销售订单', 2, 0, '2022-08-17 23:27:48', 1, '超级管理员', 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTable` VALUES ('b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '订单流程测试', '47e41e06-cb4a-4763-9aeb-df66cd6615e1', 'SellOrder', '销售订单', 2, 0, '2022-08-16 02:03:17', 1, '超级管理员', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_WorkFlowTableStep
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTableStep`;
CREATE TABLE `Sys_WorkFlowTableStep`  (
  `Sys_WorkFlowTableStep_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主表id',
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程id',
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点id',
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节名称',
  `StepType` int(11) NULL DEFAULT NULL COMMENT '审批类型',
  `StepValue` int(11) NULL DEFAULT NULL COMMENT '节点类型(1=按用户审批,2=按角色审批,3=按部门审批 )',
  `OrderId` int(11) NULL DEFAULT NULL COMMENT '审批顺序',
  `AuditId` int(11) NULL DEFAULT NULL COMMENT '审核人id',
  `Auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审核状态',
  `AuditDate` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Sys_WorkFlowTableStep_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowTableStep
-- ----------------------------
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('136b08e5-1fb5-4a07-8d7f-6f78d09c2685', '460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, 3378, NULL, NULL, NULL, NULL, '2022-08-15 05:01:04', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('1ac547df-27cf-4eb4-9ad6-37881ef671cc', 'a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, 3362, NULL, NULL, NULL, NULL, '2022-08-17 23:27:48', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('21c8252a-15a3-4435-a6ca-0dbee4474bba', 'b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, 1, '超级管理员', 1, '2022-08-16 02:03:38', '审批通过测试', '2022-08-16 02:03:17', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('521f23e3-6d5d-4a9d-8e67-a289440f7ecd', 'a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, 1, '超级管理员', 1, '2022-08-29 09:56:27', '555555555', '2022-08-17 23:27:48', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('81856e1e-9796-4ceb-8b8a-36b201604e25', '460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276275052', '流程-节点A', 1, 1, 1, 1, '超级管理员', 1, '2022-08-15 05:13:51', '1', '2022-08-15 05:01:04', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('83485f9f-119b-4344-a26a-22a1f4a3760e', 'b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, 3378, NULL, NULL, NULL, NULL, '2022-08-16 02:03:17', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('d9a0f59c-7b3e-4099-84a5-2b3c74414b46', 'a251f602-f8d1-4399-8429-48d3349ad210', 'c016fa5e-6f44-4d59-a929-7391e82caf18', 'l0om4eidz', '流程-节点C', 1, 3378, 3, 3378, NULL, NULL, NULL, NULL, '2022-08-17 23:27:48', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('e623c47c-e0f5-4052-a2be-baf857784499', '460b5903-4ff2-4f84-a88f-bbbf473942ec', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, 3362, NULL, NULL, NULL, NULL, '2022-08-15 05:01:04', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('f92d5a23-f572-446e-a3e4-e6063ee6dcdf', 'b4d10013-8297-421f-aad4-3147fdac2450', 'c016fa5e-6f44-4d59-a929-7391e82caf18', '1659276282115', '流程-节点B', 1, 3362, 2, 3362, NULL, NULL, NULL, NULL, '2022-08-16 02:03:17', NULL, NULL, 1, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

set global local_infile = 'ON';

