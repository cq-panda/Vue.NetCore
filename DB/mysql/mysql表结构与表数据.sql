/*
 Navicat Premium Data Transfer

 Source Server         : 111
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 111.231.4.207:3306
 Source Schema         : vol_v3

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 24/03/2025 19:40:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for FormCollectionObject
-- ----------------------------
DROP TABLE IF EXISTS `FormCollectionObject`;
CREATE TABLE `FormCollectionObject`  (
  `FormCollectionId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FormId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
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
INSERT INTO `FormCollectionObject` VALUES ('90513C4C-B639-4D0D-8C9D-FB69B77620F8', '0431A578-BFC9-407F-B95E-321C350F10CB', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-05\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-03 19:06:50', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('A37C1956-DDC0-457B-8F0A-93CDC44C257D', '8E6D9E7C-16C2-48B8-9D67-F1A1A19453DA', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"没有意见\"}', '2022-01-03 19:05:46', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('CCCC519C-C448-4292-85D1-6A0AC2828FD9', '0431A578-BFC9-407F-B95E-321C350F10CB', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-04\",\"field1641207457900\":\"123456\",\"field1641207424694\":\"\"}', '2022-01-03 19:09:53', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO `FormCollectionObject` VALUES ('E913389C-E11A-4675-B8EB-A25C75086E37', '8E6D9E7C-16C2-48B8-9D67-F1A1A19453DA', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1111\"}', '2022-01-03 19:09:45', 1, '超级管理员', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for FormDesignOptions
-- ----------------------------
DROP TABLE IF EXISTS `FormDesignOptions`;
CREATE TABLE `FormDesignOptions`  (
  `FormId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DaraggeOptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormOptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FormFields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TableConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
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
INSERT INTO `FormDesignOptions` VALUES ('0431A578-BFC9-407F-B95E-321C350F10CB', '2021开发语言使用调查', '[{\"id\":5,\"name\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1640871905593\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":3,\"name\":\"从什么时候开始做开发?\",\"type\":\"date\",\"icon\":\"el-icon-date\",\"value\":null,\"field\":\"field1640871902689\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":2,\"name\":\"说点什么\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641207457900\",\"width\":100,\"readonly\":false,\"required\":false},{\"id\":9,\"name\":\"图片上传\",\"type\":\"img\",\"url\":\"\",\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"icon\":\"el-icon-picture-outline\",\"field\":\"field1641207424694\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1640871905593\":[],\"field1640871902689\":null,\"field1641207457900\":null,\"field1641207424694\":null},\"formOptions\":[[{\"field\":\"field1640871905593\",\"title\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1640871905593\",\"title\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]', NULL, '[]', '2021-12-29 23:39:22', 1, '超级管理员', '超级管理员', '2022-01-03 19:00:30', 1);
INSERT INTO `FormDesignOptions` VALUES ('8E6D9E7C-16C2-48B8-9D67-F1A1A19453DA', '2021双减政策调查', '[{\"id\":5,\"name\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1641205615398\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":6,\"name\":\"您认为放学后作业对孩子的负担怎样?\",\"values\":[\"非常满意\"],\"type\":\"checkbox\",\"key\":\"满意度\",\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"icon\":\"el-icon-circle-check\",\"field\":\"field1641206170991\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":5,\"name\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"key\":\"满意度\",\"field\":\"field1641205647957\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"非常满意\"]},{\"id\":2,\"name\":\"其他意见\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641206608182\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1641205615398\":[],\"field1641206170991\":[],\"field1641205647957\":[],\"field1641206608182\":null},\"formOptions\":[[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]', NULL, '[]', '2021-12-30 21:45:16', 1, '超级管理员', '超级管理员', '2022-01-03 18:43:46', 1);

-- ----------------------------
-- Table structure for MES_Bom_Detail
-- ----------------------------
DROP TABLE IF EXISTS `MES_Bom_Detail`;
CREATE TABLE `MES_Bom_Detail`  (
  `DomDetailId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `BomId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Bom编号',
  `Sequence` int(11) NOT NULL COMMENT '序号',
  `MaterialCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子件物料编码',
  `MaterialName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '子件物料名称',
  `Spec` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `UsageQty` decimal(24, 3) NOT NULL COMMENT '单台用量',
  `ConsumeModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消耗方式',
  `Warehouse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投料仓库',
  `SupplierCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `KitScale` decimal(24, 3) NULL DEFAULT NULL COMMENT '齐套比例',
  `Enable` int(11) NULL DEFAULT NULL COMMENT '启用状态',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`DomDetailId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'BOM明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_Bom_Detail
-- ----------------------------
INSERT INTO `MES_Bom_Detail` VALUES ('401FA70B-EF49-436E-9782-35B6D887759B', '1DC84B0C-2CD7-4709-B488-DF42CE36AB88', 1, 'BO01-0002-4', '机壳毛坯p38x66.3', '个', 400.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:33:00', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO `MES_Bom_Detail` VALUES ('531E804A-DF10-499B-AB26-775F68CB35AE', 'D57095E6-EF91-4F00-87CB-82E2DBB633D6', 2, 'BO01-0001-2', '机壳毛坯p38x66.2', NULL, 200.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:32:24', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO `MES_Bom_Detail` VALUES ('80DC11D2-ACE8-479B-B60C-18454BBA5CDB', '1DC84B0C-2CD7-4709-B488-DF42CE36AB88', 2, 'BO01-0001-3', '机壳毛坯p38x66.3', '个', 300.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:33:00', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO `MES_Bom_Detail` VALUES ('91AD77CF-F062-4C4F-87B2-7FE6AB942BBF', '0B713F05-5871-471E-8F03-8C0E8654C063', 1, 'BO01-0001', '机壳镀锌p38x66.1', '个', 100.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:25:00', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO `MES_Bom_Detail` VALUES ('C88C38B6-CBB5-44C4-A4EA-D9E1192E0359', '0B713F05-5871-471E-8F03-8C0E8654C063', 2, 'BO01-0001-1', '机壳镀锌p38x66.1', NULL, 200.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:31:31', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO `MES_Bom_Detail` VALUES ('EF77C899-95E9-48AB-9958-9CEB752788CD', 'D57095E6-EF91-4F00-87CB-82E2DBB633D6', 1, 'BO01-0002', '机壳毛坯p38x66.2', '个', 100.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:32:24', 1, '超级管理员', '2025-03-19 01:31:31');

-- ----------------------------
-- Table structure for MES_Bom_Main
-- ----------------------------
DROP TABLE IF EXISTS `MES_Bom_Main`;
CREATE TABLE `MES_Bom_Main`  (
  `BomId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'BOM编号',
  `MaterialCode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '母件物料编码',
  `MaterialName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '母件物料名称',
  `Spec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规格型号',
  `Purpose` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途',
  `Edition` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `EffectiveDate` datetime(0) NOT NULL COMMENT '有效日期',
  `InvalidDate` datetime(0) NOT NULL COMMENT '失效日期',
  `Enable` int(11) NOT NULL COMMENT '启用状态',
  `CreateID` int(11) NOT NULL COMMENT '创建人',
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人名称',
  `CreateDate` datetime(0) NOT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '更新人',
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`BomId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'BOM' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_Bom_Main
-- ----------------------------
INSERT INTO `MES_Bom_Main` VALUES ('0B713F05-5871-471E-8F03-8C0E8654C063', '001-BO01-0001', '001-BO01-0001', 'H1001机壳镀锌p38x66.1', '个', '机加工', 'v1.0', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 0, 1, '超级管理员', '2025-03-19 01:24:59', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO `MES_Bom_Main` VALUES ('1DC84B0C-2CD7-4709-B488-DF42CE36AB88', '001-BO01-0003', '001-BO01-0003', 'H1001机壳镀锌p38x66.3', '个', '机加工', 'v1.0', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 0, 1, '超级管理员', '2025-03-19 01:33:00', NULL, NULL, NULL);
INSERT INTO `MES_Bom_Main` VALUES ('D57095E6-EF91-4F00-87CB-82E2DBB633D6', '001-BO01-0002', '001-BO01-0002', 'H1001机壳镀锌p38x66.1', '个', '机加工', 'v1.0', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 0, 1, '超级管理员', '2025-03-19 01:32:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_Customer
-- ----------------------------
DROP TABLE IF EXISTS `MES_Customer`;
CREATE TABLE `MES_Customer`  (
  `CustomerID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户ID',
  `CustomerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `ContactPerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `ContactPhone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `CustomerType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户类型',
  `CreditRating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信用评级',
  `BusinessScope` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务范围',
  `Remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`CustomerID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_Customer
-- ----------------------------
INSERT INTO `MES_Customer` VALUES ('0AEB3835-0289-11F0-92BB-52540099312C', '辉煌科技集团', '李阳', '13900139000', 'liyang@huihuang.com', '北京市海淀区创新大道2号', '重要客户', 'A', '通信设备研发与生产', '业务量大，需重点跟进', 1, 'admin', '2023-02-01 09:00:00', NULL, NULL, NULL);
INSERT INTO `MES_Customer` VALUES ('0AEB39E8-0289-11F0-92BB-52540099312C', '星辰电子公司', '王芳', '13600136000', 'wangfang@xingchen.com', '深圳市南山区创业路3号', '新客户', 'B+', '电子零部件生产', '潜力较大，需加强沟通', 1, 'admin', '2023-03-01 10:00:00', NULL, NULL, NULL);
INSERT INTO `MES_Customer` VALUES ('0AEB3AEB-0289-11F0-92BB-52540099312C', '阳光电子集团', '陈静', '13300133000', 'chenjing@yangguang.com', '杭州市西湖区科技园区5号', '长期合作客户', 'A', 'LED照明产品制造', '合作良好，定期回访', 1, 'admin', '2023-05-01 12:00:00', NULL, NULL, NULL);
INSERT INTO `MES_Customer` VALUES ('0AEB3B9C-0289-11F0-92BB-52540099312C', '瑞风科技有限公司', '赵刚', '13700137000', 'zhaogang@ruifeng.com', '广州市天河区软件园4号', '普通客户', 'B', '智能家居产品研发', '偶尔下单，保持联系', 1, 'admin', '2023-04-01 11:00:00', NULL, NULL, NULL);
INSERT INTO `MES_Customer` VALUES ('0AEB3C2C-0289-11F0-92BB-52540099312C', '卓越电子有限公司', '张悦', '13800138000', 'zhangyue@zhuoyue.com', '上海市浦东新区科技路1号', '长期合作客户', 'A+', '消费电子产品制造', '合作多年，订单稳定', 1, 'admin', '2023-01-01 08:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_DefectiveProductDisposalRecord
-- ----------------------------
DROP TABLE IF EXISTS `MES_DefectiveProductDisposalRecord`;
CREATE TABLE `MES_DefectiveProductDisposalRecord`  (
  `DisposalRecordID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理记录ID',
  `DefectiveID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不良品ID',
  `DisposalPerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人',
  `DisposalStartTime` datetime(0) NULL DEFAULT NULL COMMENT '处理开始时间',
  `DisposalEndTime` datetime(0) NULL DEFAULT NULL COMMENT '处理结束时间',
  `DisposalResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DisposalRecordID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_DefectiveProductDisposalRecord
-- ----------------------------

-- ----------------------------
-- Table structure for MES_DefectiveProductRecord
-- ----------------------------
DROP TABLE IF EXISTS `MES_DefectiveProductRecord`;
CREATE TABLE `MES_DefectiveProductRecord`  (
  `DefectiveID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '不良品ID',
  `ReportingID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报工ID',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料名称',
  `MaterialSpecification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料规格',
  `DefectiveQuantity` int(11) NOT NULL COMMENT '不良品数量',
  `DefectType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缺陷类型',
  `DefectReason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缺陷原因',
  `DisposalMethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理方式',
  `DisposalStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处理状态',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DefectiveID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_DefectiveProductRecord
-- ----------------------------
INSERT INTO `MES_DefectiveProductRecord` VALUES ('84348030-03E0-11F0-92BB-52540099312C', '7E80D01E-03E0-11F0-92BB-52540099312C', 'M001', '电阻', '100Ω', 20, '阻值偏差', '生产工艺问题', '报废', '已处理', 1, 'admin', '2024-06-01 15:00:00', NULL, NULL, NULL);
INSERT INTO `MES_DefectiveProductRecord` VALUES ('843483F9-03E0-11F0-92BB-52540099312C', '7E80D290-03E0-11F0-92BB-52540099312C', 'M002', '电容', '10μF', 20, '容量不达标', '原材料质量问题', '报废', '已处理', 1, 'admin', '2024-06-02 16:00:00', NULL, NULL, NULL);
INSERT INTO `MES_DefectiveProductRecord` VALUES ('84348505-03E0-11F0-92BB-52540099312C', '7E80D2D4-03E0-11F0-92BB-52540099312C', 'M003', '线路板', 'PCB-A100', 20, '线路短路', '加工过程失误', '维修后再检验', '已处理', 1, 'admin', '2024-06-03 17:00:00', NULL, NULL, NULL);
INSERT INTO `MES_DefectiveProductRecord` VALUES ('843485AB-03E0-11F0-92BB-52540099312C', '7E80D2FE-03E0-11F0-92BB-52540099312C', 'M004', '塑料粒子', 'PP-500', 50, '产品变形', '注塑参数不当', '报废', '已处理', 1, 'admin', '2024-06-04 18:00:00', NULL, NULL, NULL);
INSERT INTO `MES_DefectiveProductRecord` VALUES ('8434864A-03E0-11F0-92BB-52540099312C', '7E80D322-03E0-11F0-92BB-52540099312C', 'M005', '螺丝', 'M3x10', 50, '螺纹损坏', '加工精度不够', '报废', '已处理', 1, 'admin', '2024-06-05 19:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_EquipmentFaultRecord
-- ----------------------------
DROP TABLE IF EXISTS `MES_EquipmentFaultRecord`;
CREATE TABLE `MES_EquipmentFaultRecord`  (
  `FaultRecordID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '故障记录ID',
  `EquipmentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `FaultDate` datetime(0) NULL DEFAULT NULL COMMENT '故障日期',
  `FaultType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障类型',
  `FaultDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障描述',
  `FaultImpact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障影响',
  `FaultReportedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障报告人',
  `FaultStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '故障状态',
  `TroubleshootingStartTime` datetime(0) NULL DEFAULT NULL COMMENT '故障排查开始时间',
  `TroubleshootingEndTime` datetime(0) NULL DEFAULT NULL COMMENT '故障排查结束时间',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FaultRecordID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_EquipmentFaultRecord
-- ----------------------------
INSERT INTO `MES_EquipmentFaultRecord` VALUES ('F349F43C-0290-11F0-92BB-52540099312C', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-06-01 08:00:00', '电气故障', '设备突然断电', '生产中断', '李明', '已解决', '2024-06-01 08:15:00', '2024-06-01 09:30:00', 1, 'admin', '2024-06-01 08:00:00', 1, '超级管理员', '2025-03-17 02:04:14');
INSERT INTO `MES_EquipmentFaultRecord` VALUES ('F349F60C-0290-11F0-92BB-52540099312C', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-06-02 09:00:00', '机械故障', '模具开合异常', '影响产品成型质量', '张华', '已解决', '2024-06-02 09:10:00', '2024-06-02 11:00:00', 1, 'admin', '2024-06-02 09:00:00', 1, '超级管理员', '2025-03-17 02:04:11');
INSERT INTO `MES_EquipmentFaultRecord` VALUES ('F349F707-0290-11F0-92BB-52540099312C', 'BDBB37EF-028F-11F0-92BB-52540099312C', '2024-06-03 10:00:00', '软件故障', '检测程序报错', '无法正常检测产品', '陈丽', '已解决', '2024-06-03 10:15:00', '2024-06-03 12:00:00', 1, 'admin', '2024-06-03 10:00:00', 1, '超级管理员', '2025-03-17 02:04:05');
INSERT INTO `MES_EquipmentFaultRecord` VALUES ('F349F7B4-0290-11F0-92BB-52540099312C', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-06-04 11:00:00', '传感器故障', '螺丝拧紧量检测传感器失灵', '螺丝拧紧质量不稳定', '王强', '已解决', '2024-06-04 11:10:00', '2024-06-04 13:00:00', 1, 'admin', '2024-06-04 11:00:00', 1, '超级管理员', '2025-03-17 02:04:01');
INSERT INTO `MES_EquipmentFaultRecord` VALUES ('F349F849-0290-11F0-92BB-52540099312C', 'BDBB34F1-028F-11F0-92BB-52540099312C', '2024-06-05 12:00:00', '加热故障', '回流焊温度达不到设定值', '焊接效果不佳', '李明', '已解决', '2024-06-05 12:15:00', '2024-06-05 14:00:00', 1, 'admin', '2024-06-05 12:00:00', 1, '超级管理员', '2025-03-17 02:03:57');

-- ----------------------------
-- Table structure for MES_EquipmentMaintenance
-- ----------------------------
DROP TABLE IF EXISTS `MES_EquipmentMaintenance`;
CREATE TABLE `MES_EquipmentMaintenance`  (
  `MaintenanceID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '保养ID',
  `EquipmentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `MaintenanceDate` datetime(0) NULL DEFAULT NULL COMMENT '保养日期',
  `MaintenanceType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养类型',
  `MaintenanceContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养内容',
  `MaintenancePerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养人员',
  `MaintenanceStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养状态',
  `NextMaintenanceDate` datetime(0) NULL DEFAULT NULL COMMENT '下次保养日期',
  `MaintenanceCost` decimal(10, 2) NULL DEFAULT NULL COMMENT '保养成本',
  `MaintenanceRemarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保养备注',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MaintenanceID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_EquipmentMaintenance
-- ----------------------------
INSERT INTO `MES_EquipmentMaintenance` VALUES ('4F488D2D-0291-11F0-92BB-52540099312C', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-02-06 09:00:00', '日常保养', '润滑机械部件、检查电路', '王师傅', '已完成', '2024-03-06 09:00:00', 600.00, '无异常', 1, 'admin', '2024-02-06 09:00:00', 1, '超级管理员', '2025-03-17 02:06:41');
INSERT INTO `MES_EquipmentMaintenance` VALUES ('4F488E2D-0291-11F0-92BB-52540099312C', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-03-07 10:00:00', '深度保养', '更换易损件、全面检测', '张师傅', '已完成', '2024-04-07 10:00:00', 1200.00, '设备性能稳定', 1, 'admin', '2024-03-07 10:00:00', 1, '超级管理员', '2025-03-17 02:06:33');
INSERT INTO `MES_EquipmentMaintenance` VALUES ('4F488EEA-0291-11F0-92BB-52540099312C', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-04-08 11:00:00', '定期保养', '清洁、调试设备', '李师傅', '已完成', '2024-05-08 11:00:00', 900.00, '设备正常运行', 1, 'admin', '2024-04-08 11:00:00', 1, '超级管理员', '2025-03-17 02:06:29');
INSERT INTO `MES_EquipmentMaintenance` VALUES ('4F488FB2-0291-11F0-92BB-52540099312C', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-05-09 12:00:00', '日常保养', '检查焊接头、清理灰尘', '赵师傅', '已完成', '2024-06-09 12:00:00', 700.00, '无明显问题', 1, 'admin', '2024-05-09 12:00:00', 1, '超级管理员', '2025-03-17 02:06:26');

-- ----------------------------
-- Table structure for MES_EquipmentManagement
-- ----------------------------
DROP TABLE IF EXISTS `MES_EquipmentManagement`;
CREATE TABLE `MES_EquipmentManagement`  (
  `EquipmentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备ID',
  `EquipmentCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备编码',
  `EquipmentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `EquipmentType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `Manufacturer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `PurchaseDate` datetime(0) NULL DEFAULT NULL COMMENT '购买日期',
  `WarrantyPeriod` int(11) NULL DEFAULT NULL COMMENT '保修期（月）',
  `InstallationLocation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装位置',
  `EquipmentStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `ResponsiblePerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任人',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`EquipmentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_EquipmentManagement
-- ----------------------------
INSERT INTO `MES_EquipmentManagement` VALUES ('BDBB34F1-028F-11F0-92BB-52540099312C', 'EQ001', 'SMT贴片机', '电子制造设备', '三星电子', '2023-01-01 08:00:00', 12, '生产车间A区1号', '运行正常', '李明', 1, 'admin', '2024-01-01 08:00:00', NULL, NULL, NULL);
INSERT INTO `MES_EquipmentManagement` VALUES ('BDBB36EC-028F-11F0-92BB-52540099312C', 'EQ002', '注塑机', '塑料加工设备', '海天塑机', '2023-02-01 09:00:00', 10, '生产车间B区2号', '运行中', '张华', 1, 'admin', '2024-02-01 09:00:00', NULL, NULL, NULL);
INSERT INTO `MES_EquipmentManagement` VALUES ('BDBB37EF-028F-11F0-92BB-52540099312C', 'EQ003', '检测仪器', '质量检测设备', '泰瑞达科技', '2023-03-01 10:00:00', 15, '生产车间D区4号', '正常使用', '陈丽', 1, 'admin', '2024-03-01 10:00:00', NULL, NULL, NULL);
INSERT INTO `MES_EquipmentManagement` VALUES ('BDBB38A2-028F-11F0-92BB-52540099312C', 'EQ004', '自动螺丝机', '装配设备', '拓普机械', '2023-04-01 11:00:00', 11, '生产车间C区3号', '运行平稳', '王强', 1, 'admin', '2024-04-01 11:00:00', NULL, NULL, NULL);
INSERT INTO `MES_EquipmentManagement` VALUES ('BDBB3938-028F-11F0-92BB-52540099312C', 'EQ005', '回流焊炉', '焊接设备', '日东电子', '2023-05-01 12:00:00', 13, '生产车间A区1号', '正常运转', '李明', 1, 'admin', '2024-05-01 12:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_EquipmentRepair
-- ----------------------------
DROP TABLE IF EXISTS `MES_EquipmentRepair`;
CREATE TABLE `MES_EquipmentRepair`  (
  `RepairID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维修ID',
  `EquipmentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备ID',
  `RepairDate` datetime(0) NULL DEFAULT NULL COMMENT '维修日期',
  `RepairReason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修原因',
  `RepairContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修内容',
  `RepairPerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修人员',
  `RepairCost` decimal(10, 2) NULL DEFAULT NULL COMMENT '维修成本',
  `RepairStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修状态',
  `RepairStartTime` datetime(0) NULL DEFAULT NULL COMMENT '维修开始时间',
  `RepairEndTime` datetime(0) NULL DEFAULT NULL COMMENT '维修结束时间',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RepairID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_EquipmentRepair
-- ----------------------------
INSERT INTO `MES_EquipmentRepair` VALUES ('5132A230-0290-11F0-92BB-52540099312C', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-01-10 09:00:00', '贴装头故障', '更换贴装头', '张师傅', 5000.00, '已完成', '2024-01-10 09:30:00', '2024-01-10 15:00:00', 1, 'admin', '2024-01-10 09:00:00', 1, '超级管理员', '2025-03-17 02:00:41');
INSERT INTO `MES_EquipmentRepair` VALUES ('5132A3FB-0290-11F0-92BB-52540099312C', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-02-15 10:00:00', '注塑压力不稳定', '检查液压系统并维修', '李师傅', 3500.00, '已完成', '2024-02-15 10:30:00', '2024-02-15 16:00:00', 1, 'admin', '2024-02-15 10:00:00', 1, '超级管理员', '2025-03-17 02:00:36');
INSERT INTO `MES_EquipmentRepair` VALUES ('5132A509-0290-11F0-92BB-52540099312C', 'BDBB38A2-028F-11F0-92BB-52540099312C', '2024-03-20 11:00:00', '检测精度下降', '校准检测传感器', '赵师傅', 2000.00, '已完成', '2024-03-20 11:30:00', '2024-03-20 14:00:00', 1, 'admin', '2024-03-20 11:00:00', 1, '超级管理员', '2025-03-17 02:00:56');
INSERT INTO `MES_EquipmentRepair` VALUES ('5132A5C0-0290-11F0-92BB-52540099312C', 'BDBB34F1-028F-11F0-92BB-52540099312C', '2024-04-25 12:00:00', '螺丝拧紧力度不均匀', '调整拧紧扭矩装置', '孙师傅', 1500.00, '已完成', '2024-04-25 12:30:00', '2024-04-25 15:30:00', 1, 'admin', '2024-04-25 12:00:00', 1, '超级管理员', '2025-03-17 02:00:24');
INSERT INTO `MES_EquipmentRepair` VALUES ('5132A654-0290-11F0-92BB-52540099312C', 'BDBB34F1-028F-11F0-92BB-52540099312C', '2024-05-30 13:00:00', '温度控制异常', '维修温度控制器', '周师傅', 2500.00, '已完成', '2024-05-30 13:30:00', '2024-05-30 17:00:00', 1, 'admin', '2024-05-30 13:00:00', 1, '超级管理员', '2025-03-17 02:00:21');

-- ----------------------------
-- Table structure for MES_InventoryManagement
-- ----------------------------
DROP TABLE IF EXISTS `MES_InventoryManagement`;
CREATE TABLE `MES_InventoryManagement`  (
  `InventoryID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库存ID',
  `DocumentNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编号',
  `SpecificationModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `WarehouseID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库ID',
  `LocationID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货位ID',
  `InventoryQuantity` int(11) NOT NULL COMMENT '库存数量',
  `InventoryUnit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存单位',
  `InventoryCost` decimal(10, 2) NOT NULL COMMENT '库存成本',
  `InventoryStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存状态',
  `InboundDate` datetime(0) NULL DEFAULT NULL COMMENT '入库日期',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`InventoryID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_InventoryManagement
-- ----------------------------
INSERT INTO `MES_InventoryManagement` VALUES ('5E6F978C-2F87-4046-9577-29C96A95724D', 'INV001', '螺丝', 'S001', 'M5*10', '3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 500, '个', 0.50, '在库', '2024-01-01 08:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:23');
INSERT INTO `MES_InventoryManagement` VALUES ('5E6F978C-2F87-4046-9577-29C96A95724E', 'INV002', '螺母', 'N001', 'M5', '3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 300, '个', 0.30, '在库', '2024-01-02 09:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:47:04');
INSERT INTO `MES_InventoryManagement` VALUES ('5E6F978C-2F87-4046-9577-29C96A95724F', 'INV003', '成品A', 'P001', 'V1.0', '3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 200, '件', 100.00, '在库', '2024-01-03 10:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:40');
INSERT INTO `MES_InventoryManagement` VALUES ('5E6F978C-2F87-4046-9577-29C96A957250', 'INV004', '半成品B', 'SP001', '半加工状态', '3A765F84-49A6-4F42-9639-2A9C58D832C6', '1C19C214-9D78-4596-B078-789F7755896C', 150, '件', 50.00, '在库', '2024-01-04 11:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:49');
INSERT INTO `MES_InventoryManagement` VALUES ('5E6F978C-2F87-4046-9577-29C96A957251', 'INV005', '包装纸箱', 'C001', '50*40*30cm', '3A765F84-49A6-4F42-9639-2A9C58D832C8', '1C19C214-9D78-4596-B078-789F7755896E', 400, '个', 5.00, '在库', '2024-01-05 12:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:55');

-- ----------------------------
-- Table structure for MES_LocationManagement
-- ----------------------------
DROP TABLE IF EXISTS `MES_LocationManagement`;
CREATE TABLE `MES_LocationManagement`  (
  `LocationID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货位ID',
  `WarehouseID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属仓库ID',
  `LocationCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货位编码',
  `LocationName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货位名称',
  `LocationType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货位类型',
  `LocationCapacity` int(11) NOT NULL COMMENT '货位容量',
  `LocationStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货位状态',
  `LocationRow` int(11) NOT NULL COMMENT '货位行号',
  `LocationColumn` int(11) NOT NULL COMMENT '货位列号',
  `LocationFloor` int(11) NOT NULL COMMENT '货位层数',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`LocationID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_LocationManagement
-- ----------------------------
INSERT INTO `MES_LocationManagement` VALUES ('3A765F84-49A6-4F42-9639-2A9C58D832C4', '1C19C214-9D78-4596-B078-789F7755896A', 'L001', 'A区001', '普通货位', 100, '空闲', 1, 1, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:47:51');
INSERT INTO `MES_LocationManagement` VALUES ('3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 'L002', 'B区002', '普通货位', 150, '占用', 2, 2, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:47:57');
INSERT INTO `MES_LocationManagement` VALUES ('3A765F84-49A6-4F42-9639-2A9C58D832C6', '1C19C214-9D78-4596-B078-789F7755896C', 'L003', 'C区003', '普通货位', 120, '空闲', 3, 3, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:48:03');
INSERT INTO `MES_LocationManagement` VALUES ('3A765F84-49A6-4F42-9639-2A9C58D832C7', '1C19C214-9D78-4596-B078-789F7755896D', 'L004', 'D区004', '不良品货位', 50, '占用', 4, 4, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:48:13');
INSERT INTO `MES_LocationManagement` VALUES ('3A765F84-49A6-4F42-9639-2A9C58D832C8', '1C19C214-9D78-4596-B078-789F7755896E', 'L005', 'E区005', '普通货位', 180, '空闲', 5, 5, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:48:19');

-- ----------------------------
-- Table structure for MES_Material
-- ----------------------------
DROP TABLE IF EXISTS `MES_Material`;
CREATE TABLE `MES_Material`  (
  `MaterialID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料ID',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编码',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料名称',
  `MaterialType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料类型',
  `CatalogID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料分类',
  `Specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `Unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计量单位',
  `Price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价信息',
  `Img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '物料图片',
  `Remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MaterialID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_Material
-- ----------------------------
INSERT INTO `MES_Material` VALUES ('8754ED7A-E845-42A1-9B51-6735091653F4', 'AKG0000004', '米其林轮胎', NULL, '40F6F014-B41F-400E-AD49-ED4B109CF5F3', '。。。。。。。', '件', NULL, NULL, '。。。。。。。。', 1, '超级管理员', '2025-03-18 14:12:26', 1, '超级管理员', '2025-03-18 14:13:00');
INSERT INTO `MES_Material` VALUES ('9F7E972A-028B-11F0-92BB-52540099312C', 'AKG0000001', '碳素结构钢', '金属材料', '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 'Q235B，厚度 5mm', '吨', 4500.00, 'Upload/Tables/MES_Material/202503170240379198/wechat.jpg', '常用于建筑结构', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:47:53');
INSERT INTO `MES_Material` VALUES ('9F7E990F-028B-11F0-92BB-52540099312C', 'AKG0000002', '架构芯片', '电子元器件', '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 'Cortex - M3 内核，主频 100MHz', '片', 50.00, 'Upload/Tables/MES_Material/202503170240426945/wechat.jpg', '适用于嵌入式系统开发', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:48:28');
INSERT INTO `MES_Material` VALUES ('9F7E99FD-028B-11F0-92BB-52540099312C', 'AKG0000003', '聚乙烯（PE）', '化工原料', '0B24ACBF-AC77-4355-966A-71F394020C6D', '低密度，颗粒状', '件', 10.00, 'Upload/Tables/MES_Material/202503170240509540/wechat.jpg', '可用于塑料制品生产', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:49:11');
INSERT INTO `MES_Material` VALUES ('9F7E9A54-028B-11F0-92BB-52540099312C', 'AKG0000004', '双层瓦楞纸箱', '包装材料', '43175A13-251A-4481-B515-87A9D22A547B', '尺寸：500mm×300mm×200mm', '件', 5.00, NULL, '用于产品包装运输', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:49:17');
INSERT INTO `MES_Material` VALUES ('9F7E9AAC-028B-11F0-92BB-52540099312C', 'AKG0000005', 'A4 复印纸', '办公用品', '43175A13-251A-4481-B515-87A9D22A547B', '70g，500 张/包', '包', 20.00, NULL, '适用于日常办公复印', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:48:52');

-- ----------------------------
-- Table structure for MES_MaterialCatalog
-- ----------------------------
DROP TABLE IF EXISTS `MES_MaterialCatalog`;
CREATE TABLE `MES_MaterialCatalog`  (
  `CatalogID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类ID',
  `CatalogCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类编码',
  `CatalogName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `CatalogType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类类型',
  `ParentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级分类',
  `Enable` int(11) NULL DEFAULT NULL COMMENT '启用状态',
  `Remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`CatalogID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_MaterialCatalog
-- ----------------------------
INSERT INTO `MES_MaterialCatalog` VALUES ('0B24ACBF-AC77-4355-966A-71F394020C6D', 'A0008', '助焊剂', NULL, '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 1, '。。。', 1, '超级管理员', '2025-03-17 11:45:07', 1, '超级管理员', '2025-03-17 11:45:14');
INSERT INTO `MES_MaterialCatalog` VALUES ('40F6F014-B41F-400E-AD49-ED4B109CF5F3', 'A0001', '原材料', NULL, NULL, 1, '。。。。', 1, '超级管理员', '2025-03-17 11:36:25', 1, '超级管理员', '2025-03-17 11:46:03');
INSERT INTO `MES_MaterialCatalog` VALUES ('43175A13-251A-4481-B515-87A9D22A547B', 'A0005', '引线框架', NULL, 'EF241017-FBCE-42AF-942A-6D2531929CC4', 1, '。。。。。', 1, '超级管理员', '2025-03-17 11:43:42', 1, '超级管理员', '2025-03-17 11:44:36');
INSERT INTO `MES_MaterialCatalog` VALUES ('8F258988-157E-4E81-9076-44A86D1946CB', 'A0006', '覆铜板', NULL, 'EF241017-FBCE-42AF-942A-6D2531929CC4', 1, NULL, 1, '超级管理员', '2025-03-17 11:44:24', 1, '超级管理员', '2025-03-17 11:46:22');
INSERT INTO `MES_MaterialCatalog` VALUES ('B8CCD002-73B9-4BB0-B40F-FBCA161B3443', 'A0007', '粘合剂', NULL, '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 1, '。。。', 1, '超级管理员', '2025-03-17 11:44:52', 1, '超级管理员', '2025-03-17 11:46:25');
INSERT INTO `MES_MaterialCatalog` VALUES ('EF241017-FBCE-42AF-942A-6D2531929CC4', 'A0003', '半成品', NULL, NULL, 1, '。。。。。。', 1, '超级管理员', '2025-03-17 11:36:47', 1, '超级管理员', '2025-03-17 11:36:53');

-- ----------------------------
-- Table structure for MES_Process
-- ----------------------------
DROP TABLE IF EXISTS `MES_Process`;
CREATE TABLE `MES_Process`  (
  `ProcessID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序ID',
  `ProcessCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序编码',
  `ProcessName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工序名称',
  `ProcessType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序类型',
  `ProcessSequence` int(11) NOT NULL COMMENT '工序顺序',
  `ProcessDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序描述',
  `WorkCenter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作中心',
  `StandardWorkingHours` decimal(10, 2) NOT NULL COMMENT '标准工时',
  `ProcessStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序状态',
  `ResponsibleWorker` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任人',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ProcessID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_Process
-- ----------------------------
INSERT INTO `MES_Process` VALUES ('4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', 'PAK00001', '切割工序', '加工工序', 1, '对原材料进行切割处理', 'WC01', 2.50, '正常', '张师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO `MES_Process` VALUES ('4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', 'PAK00002', '焊接工序', '加工工序', 2, '将切割后的部件进行焊接组装', 'WC02', 3.00, '正常', '李师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:58');
INSERT INTO `MES_Process` VALUES ('4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', 'PAK00003', '打磨工序', '加工工序', 3, '对焊接后的产品进行打磨处理', 'WC03', 2.00, '正常', '王师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:40');
INSERT INTO `MES_Process` VALUES ('4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', 'PAK00004', '喷漆工序', '表面处理工序', 4, '对打磨后的产品进行喷漆操作', 'WC04', 1.50, '正常', '赵师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:45');
INSERT INTO `MES_Process` VALUES ('4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', 'PAK00005', '质检工序', '质量检测工序', 5, '对产品进行质量检测', 'WC05', 1.00, '正常', '孙师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:50');

-- ----------------------------
-- Table structure for MES_ProcessReport
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProcessReport`;
CREATE TABLE `MES_ProcessReport`  (
  `ReportID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '汇报ID',
  `ProcessID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序ID',
  `ReportDate` datetime(0) NOT NULL COMMENT '汇报日期',
  `CompletedQuantity` int(11) NOT NULL COMMENT '完成数量',
  `DefectiveQuantity` int(11) NOT NULL COMMENT '不良数量',
  `ReportedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇报人',
  `ReportStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇报状态',
  `ReportRemarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇报备注',
  `StartTime` datetime(0) NULL DEFAULT NULL COMMENT '工序开始时间',
  `EndTime` datetime(0) NULL DEFAULT NULL COMMENT '工序结束时间',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ReportID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProcessReport
-- ----------------------------
INSERT INTO `MES_ProcessReport` VALUES ('5B348B0E-0295-11F0-92BB-52540099312C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', '2024-01-16 08:00:00', 50, 2, '张师傅', '已完成', '切割过程中发现2个次品', '2024-01-16 07:00:00', '2024-01-16 08:00:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO `MES_ProcessReport` VALUES ('5B348CD3-0295-11F0-92BB-52540099312C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', '2024-01-16 09:30:00', 40, 1, '李师傅', '已完成', '焊接时有1个产品焊接不牢', '2024-01-16 08:30:00', '2024-01-16 09:30:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO `MES_ProcessReport` VALUES ('5B348DD7-0295-11F0-92BB-52540099312C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '2024-01-16 11:00:00', 35, 0, '王师傅', '已完成', '打磨过程顺利', '2024-01-16 10:00:00', '2024-01-16 11:00:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO `MES_ProcessReport` VALUES ('5B348E97-0295-11F0-92BB-52540099312C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '2024-01-16 12:30:00', 45, 3, '赵师傅', '已完成', '喷漆颜色有偏差3个产品', '2024-01-16 11:30:00', '2024-01-16 12:30:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO `MES_ProcessReport` VALUES ('5B348F65-0295-11F0-92BB-52540099312C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', '2024-01-16 14:00:00', 50, 1, '孙师傅', '已完成', '1个产品质检不合格', '2024-01-16 13:00:00', '2024-01-16 14:00:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');

-- ----------------------------
-- Table structure for MES_ProcessRoute
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProcessRoute`;
CREATE TABLE `MES_ProcessRoute`  (
  `RouteID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路线ID',
  `ProcessID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工序ID',
  `ProductID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品ID',
  `ProductName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `RouteSequence` int(11) NOT NULL COMMENT '路线顺序',
  `RouteDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路线描述',
  `PreProcessID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前工序ID',
  `NextProcessID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后工序ID',
  `RouteStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路线状态',
  `RouteResponsible` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路线责任人',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RouteID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProcessRoute
-- ----------------------------
INSERT INTO `MES_ProcessRoute` VALUES ('30142E89-8086-40E3-A0C4-EA8BC24EBC7D', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', NULL, '工艺路径03', 3, '工艺路径03', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '1', NULL, 1, '超级管理员', '2025-03-18 14:00:07', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO `MES_ProcessRoute` VALUES ('7D4C6B8E-3F5D-486F-9C7A-5D8643E78D2A', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', 'P0001', '工艺路径01', 1, '产品A的工艺路线第一步 - 切割', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO `MES_ProcessRoute` VALUES ('7D4C6B8E-3F5D-486F-9C7A-5D8643E78D2B', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', 'P0001', '喷漆01', 1, '喷漆01', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:58');
INSERT INTO `MES_ProcessRoute` VALUES ('7D4C6B8E-3F5D-486F-9C7A-5D8643E78D2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', 'P0001', '产品A', 3, '产品A的工艺路线第三步 - 打磨', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:40');
INSERT INTO `MES_ProcessRoute` VALUES ('7D4C6B8E-3F5D-486F-9C7A-5D8643E78D2D', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', 'P0001', '产品A', 4, '产品A的工艺路线第四步 - 喷漆', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:45');
INSERT INTO `MES_ProcessRoute` VALUES ('7D4C6B8E-3F5D-486F-9C7A-5D8643E78D2E', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', 'P0001', '产品A', 5, '产品A的工艺路线第五步 - 质检', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', NULL, '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:50');
INSERT INTO `MES_ProcessRoute` VALUES ('BE7BCA96-D2B1-42BE-A23C-A5E75B26FC8D', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', NULL, '工艺路径02', 2, '工艺路径01', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '1', NULL, 1, '超级管理员', '2025-03-17 02:22:19', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO `MES_ProcessRoute` VALUES ('C33A1F4E-5ACE-4F58-95C2-6F15F8E64950', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', NULL, '喷漆02', 2, '喷漆02', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', '1', NULL, 1, '超级管理员', '2025-03-18 14:00:58', 1, '超级管理员', '2025-03-18 14:00:58');

-- ----------------------------
-- Table structure for MES_ProductInbound
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductInbound`;
CREATE TABLE `MES_ProductInbound`  (
  `InboundID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入库ID',
  `DocumentNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编号',
  `SpecificationModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `WarehouseID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库ID',
  `LocationID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货位ID',
  `InboundQuantity` int(11) NOT NULL COMMENT '入库数量',
  `InboundUnit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单位',
  `InboundDate` datetime(0) NULL DEFAULT NULL COMMENT '入库日期',
  `InboundOperator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库操作员',
  `InboundReason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库原因',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`InboundID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductInbound
-- ----------------------------
INSERT INTO `MES_ProductInbound` VALUES ('528599A8-A80B-4854-9184-03B998FCF75A', 'IN202503170001', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '1C19C214-9D78-4596-B078-789F7755896B', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:21', 1, '超级管理员', '2025-03-20 17:36:23');
INSERT INTO `MES_ProductInbound` VALUES ('687C6FE1-6849-46C6-A9D7-96F80E10E827', 'IN202503170001', '米其林轮胎', 'AKG0000004', '。。。。。。。', NULL, '1C19C214-9D78-4596-B078-789F7755896D', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:59:01', 1, '超级管理员', '2025-03-20 17:35:59');
INSERT INTO `MES_ProductInbound` VALUES ('75013787-8E21-49C7-A488-1CFF0B051F6E', 'IN202503170001', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '1C19C214-9D78-4596-B078-789F7755896A', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:24', 1, '超级管理员', '2025-03-20 17:36:14');
INSERT INTO `MES_ProductInbound` VALUES ('E080E4F0-1FD8-4BBF-97B0-045FDA9A5207', 'IN202503170001', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '1C19C214-9D78-4596-B078-789F7755896D', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:55', 1, '超级管理员', '2025-03-20 17:36:06');

-- ----------------------------
-- Table structure for MES_ProductOutbound
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductOutbound`;
CREATE TABLE `MES_ProductOutbound`  (
  `OutboundID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出库ID',
  `DocumentNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料名称',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编号',
  `SpecificationModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `WarehouseID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库ID',
  `LocationID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货位ID',
  `OutboundQuantity` int(11) NOT NULL COMMENT '出库数量',
  `OutboundUnit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库单位',
  `OutboundDate` datetime(0) NULL DEFAULT NULL COMMENT '出库日期',
  `OutboundOperator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库操作员',
  `OutboundReason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库原因',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`OutboundID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductOutbound
-- ----------------------------
INSERT INTO `MES_ProductOutbound` VALUES ('087D6390-C914-4949-B397-3CF5BFE66DF0', 'OB20250317006', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:14', 1, '超级管理员', '2025-03-20 17:38:07');
INSERT INTO `MES_ProductOutbound` VALUES ('323ADF96-5391-45A6-BD03-69EBE526A933', 'OB20250317008', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:26', 1, '超级管理员', '2025-03-20 17:37:58');
INSERT INTO `MES_ProductOutbound` VALUES ('623A152C-D7D6-4ABA-9456-092D1B5902B1', 'OB20250317010', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 50, '个', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:34', 1, '超级管理员', '2025-03-20 17:37:47');
INSERT INTO `MES_ProductOutbound` VALUES ('688F2D79-C448-4C91-99FF-CA65448A38D7', 'OB20250317012', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 12, '箱', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:47', 1, '超级管理员', '2025-03-20 17:37:34');
INSERT INTO `MES_ProductOutbound` VALUES ('7AC2FE76-C1A5-49AF-B441-91C722E35759', 'OB20250317003', '包装纸箱', 'C001', '50*40*30cm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 50, '个', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:38:12', NULL, NULL, NULL);
INSERT INTO `MES_ProductOutbound` VALUES ('80F59DF8-DBD6-47C8-B1EE-9700AD876902', 'OB20250317009', '米其林轮胎', 'AKG0000004', '。。。。。。。', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:29', 1, '超级管理员', '2025-03-20 17:37:52');
INSERT INTO `MES_ProductOutbound` VALUES ('84A80744-DF64-4B5E-B810-4028F57F405A', 'OB20250317005', 'A4 复印纸', 'AKG0000005', '70g，500 张/包', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:53:48', 1, '超级管理员', '2025-03-20 17:38:15');
INSERT INTO `MES_ProductOutbound` VALUES ('9784E034-5EF3-4A5F-BD4E-6183C2E8EE25', 'OB20250317011', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 12, '箱', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:39', 1, '超级管理员', '2025-03-20 17:37:41');
INSERT INTO `MES_ProductOutbound` VALUES ('C1151E9D-704B-4ABC-B8B9-8989EFF162A7', 'OB20250317007', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:23', 1, '超级管理员', '2025-03-20 17:38:02');
INSERT INTO `MES_ProductOutbound` VALUES ('DE425C5F-114B-4F25-A5E2-A1E6F6FA166E', 'OB20250317004', '包装纸箱', 'E00X', '50*40*30cm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 12, '箱', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:53:44', 1, '超级管理员', '2025-03-17 00:54:06');
INSERT INTO `MES_ProductOutbound` VALUES ('E3B460F4-7CAA-4017-92F7-E116B7920A57', 'OB20250317002', '半成品B', 'SP001', '半加工状态', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:38:02', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_ProductionLine
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionLine`;
CREATE TABLE `MES_ProductionLine`  (
  `ProductionLineID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产线ID',
  `LineName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产线名称',
  `LineType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线类型',
  `Capacity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产能信息',
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线状态',
  `ResponsiblePerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `Location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线位置',
  `StartDate` datetime(0) NULL DEFAULT NULL COMMENT '启用日期',
  `EndDate` datetime(0) NULL DEFAULT NULL COMMENT '停用日期',
  `Remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ProductionLineID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionLine
-- ----------------------------
INSERT INTO `MES_ProductionLine` VALUES ('D44EFA4A-028A-11F0-92BB-52540099312C', '手机组装产线 1 号', '电子设备组装线', '每天 5000 部手机', '运行中', '张工', '工厂 1 楼 A 区', '2024-01-01 08:00:00', '2025-03-17 00:00:00', '效率较高', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:36:33');
INSERT INTO `MES_ProductionLine` VALUES ('D44EFC2E-028A-11F0-92BB-52540099312C', '汽车发动机零部件加工线', '机械加工线', '每月 3000 套零部件', '运行中', '李工', '工厂 2 楼 B 区', '2024-03-15 09:30:00', '2025-03-17 00:00:00', '质量稳定', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:36:00');
INSERT INTO `MES_ProductionLine` VALUES ('D44EFD10-028A-11F0-92BB-52540099312C', '饼干包装产线 2 号', '食品包装线', '每小时 10000 包饼干', '运行中', '王工', '工厂 3 楼 C 区', '2024-05-20 10:15:00', '2025-03-17 00:00:00', '包装精美', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:49:46');
INSERT INTO `MES_ProductionLine` VALUES ('D44EFD6C-028A-11F0-92BB-52540099312C', '衬衫裁剪产线', '服装裁剪线', '每周 2000 件衬衫裁剪量', '运行中', '赵工', '工厂 4 楼 D 区', '2024-07-05 11:00:00', '2025-03-17 00:00:00', '裁剪精度高', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:21:04');
INSERT INTO `MES_ProductionLine` VALUES ('D44EFDBD-028A-11F0-92BB-52540099312C', '平板电脑检测线', '电子产品检测线', '每天 2000 台平板电脑', '运行中', '孙工', '工厂 5 楼 E 区', '2024-09-10 14:45:00', '2025-03-17 00:00:00', '检测全面', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:21:07');

-- ----------------------------
-- Table structure for MES_ProductionLineDevice
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionLineDevice`;
CREATE TABLE `MES_ProductionLineDevice`  (
  `DeviceID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备ID',
  `ProductionLineID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产线ID',
  `DeviceName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `DeviceModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `Manufacturer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `PurchaseDate` datetime(0) NULL DEFAULT NULL COMMENT '购买日期',
  `WarrantyDate` datetime(0) NULL DEFAULT NULL COMMENT '保修日期',
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `LocationOnLine` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线上位置',
  `Remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DeviceID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionLineDevice
-- ----------------------------
INSERT INTO `MES_ProductionLineDevice` VALUES ('000FC915-0453-4938-A964-C63C13B00B15', 'D44EFD10-028A-11F0-92BB-52540099312C', '奥利奥', '奥利奥', '奥利奥', '2025-03-17 00:00:00', '2025-03-18 00:00:00', '异常', NULL, '奥利奥', 1, '超级管理员', '2025-03-17 01:49:46', 1, '超级管理员', '2025-03-17 01:49:45');
INSERT INTO `MES_ProductionLineDevice` VALUES ('164D145D-7672-4993-B994-CB0CDBE12E77', 'D44EFA4A-028A-11F0-92BB-52540099312C', '贴片机', 'TA0001', '台积电', '2025-03-03 00:00:00', '2025-03-18 00:00:00', '正常', NULL, '....', 1, '超级管理员', '2025-03-17 01:34:42', 1, '超级管理员', '2025-03-17 01:36:33');
INSERT INTO `MES_ProductionLineDevice` VALUES ('6B98A0C9-988B-401E-AFF9-AA88440C80D7', 'D44EFA4A-028A-11F0-92BB-52540099312C', '点胶机', 'TA0002', NULL, '2025-03-10 00:00:00', '2025-03-19 00:00:00', '正常', NULL, '...', 1, '超级管理员', '2025-03-17 01:36:33', 1, '超级管理员', '2025-03-17 01:36:32');
INSERT INTO `MES_ProductionLineDevice` VALUES ('8A9567B6-AB7A-4194-A152-AAB255BA0C72', 'D44EFD10-028A-11F0-92BB-52540099312C', '奥利奥plus', '奥利奥plus', '奥利奥plus', '2025-03-12 00:00:00', '2025-03-11 00:00:00', '正常', NULL, '奥利奥plus', 1, '超级管理员', '2025-03-17 01:49:46', 1, '超级管理员', '2025-03-17 01:49:45');
INSERT INTO `MES_ProductionLineDevice` VALUES ('A6AC613E-241A-41FA-A4CC-E5F08D0A0DCE', 'D44EFC2E-028A-11F0-92BB-52540099312C', '磨床', 'CA0002', '..。', '2025-03-11 00:00:00', NULL, '正常', NULL, '12..。', 1, '超级管理员', '2025-03-17 01:36:00', 1, '超级管理员', '2025-03-17 01:35:59');
INSERT INTO `MES_ProductionLineDevice` VALUES ('CD9A6F48-5D81-46C4-9189-7F7C5FC9E163', 'D44EFC2E-028A-11F0-92BB-52540099312C', '车床', 'CA0001', 'xxxx', '2025-03-03 00:00:00', NULL, '正常', NULL, '11', 1, '超级管理员', '2025-03-17 01:36:00', 1, '超级管理员', '2025-03-17 01:35:59');

-- ----------------------------
-- Table structure for MES_ProductionOrder
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionOrder`;
CREATE TABLE `MES_ProductionOrder`  (
  `OrderID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单ID',
  `OrderNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `CustomerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `OrderDate` datetime(0) NOT NULL COMMENT '订单日期',
  `DeliveryDate` datetime(0) NOT NULL COMMENT '交货日期',
  `OrderQty` int(11) NULL DEFAULT NULL COMMENT '订单数量',
  `OrderStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生产状态',
  `LV` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优先级',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`OrderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionOrder
-- ----------------------------
INSERT INTO `MES_ProductionOrder` VALUES ('6648A795-02F5-11F0-92BB-52540099312C', 'PO00000005', '阳光电子集团', '2024-01-05 13:00:00', '2024-02-05 21:00:00', 300, '待生产', '1', 1, 'admin', '2024-01-05 13:00:00', 1, '超级管理员', '2025-03-18 14:50:47');
INSERT INTO `MES_ProductionOrder` VALUES ('6648ABB7-02F5-11F0-92BB-52540099312C', 'PO00000004', '瑞风科技有限公司', '2024-01-04 12:00:00', '2024-02-04 20:00:00', 8000, '待生产', '1', 1, 'admin', '2024-01-04 12:00:00', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO `MES_ProductionOrder` VALUES ('6648ACA8-02F5-11F0-92BB-52540099312C', 'PO00000003', '星辰电子公司', '2024-01-03 11:00:00', '2024-02-03 19:00:00', 1700, '生产中', '1', 1, 'admin', '2024-01-03 11:00:00', 1, '超级管理员', '2025-03-18 14:50:51');

-- ----------------------------
-- Table structure for MES_ProductionPlanChangeRecord
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionPlanChangeRecord`;
CREATE TABLE `MES_ProductionPlanChangeRecord`  (
  `ChangeRecordID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变更记录ID',
  `PlanDetailID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划明细ID',
  `OrderNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `CustomerName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名称',
  `OrderDate` datetime(0) NULL DEFAULT NULL COMMENT '订单日期',
  `ChangeDate` datetime(0) NOT NULL COMMENT '变更日期',
  `OriginalPlanQuantity` int(11) NOT NULL COMMENT '原计划数量',
  `NewPlanQuantity` int(11) NOT NULL COMMENT '新计划数量',
  `OriginalPlannedStartTime` datetime(0) NULL DEFAULT NULL COMMENT '原计划开始时间',
  `NewPlannedStartTime` datetime(0) NULL DEFAULT NULL COMMENT '新计划开始时间',
  `OriginalPlannedEndTime` datetime(0) NULL DEFAULT NULL COMMENT '原计划结束时间',
  `NewPlannedEndTime` datetime(0) NULL DEFAULT NULL COMMENT '新计划结束时间',
  `ChangeReason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变更原因',
  `ChangedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变更人',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ChangeRecordID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionPlanChangeRecord
-- ----------------------------
INSERT INTO `MES_ProductionPlanChangeRecord` VALUES ('92FD73C5-F999-4A17-A4F2-FB94253E62DA', NULL, 'CA2025021000001', '星星电子', '2025-03-10 00:00:00', '2025-03-18 00:00:00', 12000, 8000, NULL, NULL, NULL, NULL, '。。。。。', 'admin', 1, '超级管理员', '2025-03-17 19:34:06', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_ProductionPlanDetail
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionPlanDetail`;
CREATE TABLE `MES_ProductionPlanDetail`  (
  `PlanDetailID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划明细ID',
  `OrderID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料名称',
  `MaterialSpecification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料规格',
  `Unit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `PlanQuantity` int(11) NULL DEFAULT NULL COMMENT '计划数量',
  `PlannedStartTime` datetime(0) NULL DEFAULT NULL COMMENT '计划开始时间',
  `PlannedEndTime` datetime(0) NULL DEFAULT NULL COMMENT '计划结束时间',
  `PlanStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划状态',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`PlanDetailID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionPlanDetail
-- ----------------------------
INSERT INTO `MES_ProductionPlanDetail` VALUES ('1012861C-89F2-4337-9718-3C79C72D3FD6', '6648ACA8-02F5-11F0-92BB-52540099312C', 'AKG0000004', '双层瓦楞纸箱', '尺寸：500mm×300mm×200mm', '件', 800, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:34', 1, '超级管理员', '2025-03-18 14:50:51');
INSERT INTO `MES_ProductionPlanDetail` VALUES ('40139C6F-6697-489D-8BEE-46D888A1BB53', '6648ACA8-02F5-11F0-92BB-52540099312C', 'AKG0000005', 'A4 复印纸', '70g，500 张/包', '包', 900, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:34', 1, '超级管理员', '2025-03-18 14:50:51');
INSERT INTO `MES_ProductionPlanDetail` VALUES ('4D1ED687-FC78-419A-8128-29B0DC75E486', '6648ABB7-02F5-11F0-92BB-52540099312C', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', '片', 2000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO `MES_ProductionPlanDetail` VALUES ('6A7A9C6F-61F3-4CF4-9C1C-4304F8BC2EFF', '6648ABB7-02F5-11F0-92BB-52540099312C', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', '件', 2000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO `MES_ProductionPlanDetail` VALUES ('AF2D3F94-5912-412D-89A1-26A16D9D00AE', '6648ABB7-02F5-11F0-92BB-52540099312C', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', '吨', 4000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO `MES_ProductionPlanDetail` VALUES ('AFEBC1A7-E112-43A4-A766-2E8987E0DBCC', '6648A795-02F5-11F0-92BB-52540099312C', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', '吨', 100, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 18:43:57', 1, '超级管理员', '2025-03-18 14:50:47');
INSERT INTO `MES_ProductionPlanDetail` VALUES ('C1876253-995A-4303-BC1A-15AF7742515A', '6648A795-02F5-11F0-92BB-52540099312C', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', '片', 200, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 18:43:57', 1, '超级管理员', '2025-03-18 14:50:47');

-- ----------------------------
-- Table structure for MES_ProductionReporting
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionReporting`;
CREATE TABLE `MES_ProductionReporting`  (
  `ReportingID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报工ID',
  `ReportingNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报工单号',
  `OrderID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `ReportedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报工人',
  `ReportingTime` datetime(0) NULL DEFAULT NULL COMMENT '报工时间',
  `ReportHour` decimal(2, 0) NULL DEFAULT NULL COMMENT '工时(小时)',
  `Total` int(11) NULL DEFAULT NULL COMMENT '报工数量',
  `AcceptedQuantity` int(11) NULL DEFAULT NULL COMMENT '合格数量',
  `RejectedQuantity` int(11) NULL DEFAULT NULL COMMENT '不合格数量',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审批状态',
  `Auditor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ReportingID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionReporting
-- ----------------------------
INSERT INTO `MES_ProductionReporting` VALUES ('34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'BG202503180007', NULL, '3362', '2024-06-05 19:00:00', 10, 380, 490, 60, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04', NULL, NULL, '2025-03-20 21:42:04');
INSERT INTO `MES_ProductionReporting` VALUES ('9356D9E8-8B3A-41C5-A2FC-F805E60AC867', 'BG202503180008', NULL, '1', '2025-03-18 00:00:00', 22, 290, 274, 6, 0, NULL, 1, '超级管理员', '2025-03-24 02:12:41', 1, '超级管理员', '2025-03-24 02:12:49');
INSERT INTO `MES_ProductionReporting` VALUES ('D902044F-ABD1-42AB-B3D8-9E63F431B410', 'BG202503180006', NULL, '3362', '2024-06-05 19:00:00', 4, 300, 390, 10, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04', NULL, NULL, '2025-03-20 21:42:04');
INSERT INTO `MES_ProductionReporting` VALUES ('F8FB5B93-0B38-4892-AA8D-7D3A00B89AFD', 'BG202503180004', NULL, '3362', '2024-06-05 19:00:00', 7, 180, 280, 30, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04', NULL, NULL, '2025-03-20 21:42:04');

-- ----------------------------
-- Table structure for MES_ProductionReportingDetail
-- ----------------------------
DROP TABLE IF EXISTS `MES_ProductionReportingDetail`;
CREATE TABLE `MES_ProductionReportingDetail`  (
  `DetailID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '明细ID',
  `ReportingID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报工ID',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料名称',
  `MaterialSpecification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料规格',
  `ReportHour` decimal(11, 2) NULL DEFAULT NULL COMMENT '工时(小时)',
  `ReportedQuantity` int(11) NOT NULL COMMENT '报工数量',
  `AcceptedQuantity` int(11) NOT NULL COMMENT '合格数量',
  `RejectedQuantity` int(11) NOT NULL COMMENT '不合格数量',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DetailID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_ProductionReportingDetail
-- ----------------------------
INSERT INTO `MES_ProductionReportingDetail` VALUES ('017F792C-4520-43A8-A649-C5E1ED5A28C1', 'D902044F-ABD1-42AB-B3D8-9E63F431B410', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 1.50, 200, 200, 0, 1, '超级管理员', '2025-03-18 16:09:41', 1, '超级管理员', '2025-03-18 15:58:24');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('0AE90653-97A9-43A2-9EDE-A38967D7B434', '34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 1.50, 200, 200, 0, 1, '超级管理员', '2025-03-18 16:09:52', 1, '超级管理员', '2025-03-18 16:09:24');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('2988903B-F36F-439F-A0F9-CA410CB3032E', '9356D9E8-8B3A-41C5-A2FC-F805E60AC867', 'AKG0000004', '双层瓦楞纸箱', '尺寸：500mm×300mm×200mm', 10.00, 90, 84, 5, 1, '超级管理员', '2025-03-24 02:12:41', 1, '超级管理员', '2025-03-24 02:12:49');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('3F665F4B-ACE1-4644-A706-D31552C84CB5', 'F8FB5B93-0B38-4892-AA8D-7D3A00B89AFD', 'AKG0000004', '米其林轮胎', '。。。。。。。', 5.00, 80, 90, 20, 1, '超级管理员', '2025-03-18 16:09:20', NULL, NULL, NULL);
INSERT INTO `MES_ProductionReportingDetail` VALUES ('7D48B30B-8B7C-4403-ABF8-690E52762E44', '34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'AKG0000004', '米其林轮胎', '。。。。。。。', 6.00, 80, 100, 50, 1, '超级管理员', '2025-03-18 16:09:52', 1, '超级管理员', '2025-03-18 16:09:24');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('C1CF52D2-E98A-43BA-92DE-3C757D7C41F1', 'F8FB5B93-0B38-4892-AA8D-7D3A00B89AFD', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:20', 1, '超级管理员', '2025-03-18 15:58:24');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('C437274D-2BE9-44EF-B8F0-85B8C6040C31', 'D902044F-ABD1-42AB-B3D8-9E63F431B410', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:41', 1, '超级管理员', '2025-03-18 15:58:24');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('E13EDA90-0C3E-436E-8B49-2631F916DBDC', '34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:52', 1, '超级管理员', '2025-03-18 16:09:24');
INSERT INTO `MES_ProductionReportingDetail` VALUES ('FF6DFE2E-F793-487D-8A43-519F14DBD745', '9356D9E8-8B3A-41C5-A2FC-F805E60AC867', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 12.00, 200, 190, 1, 1, '超级管理员', '2025-03-24 02:12:41', 1, '超级管理员', '2025-03-24 02:12:49');

-- ----------------------------
-- Table structure for MES_QualityInspectionPlan
-- ----------------------------
DROP TABLE IF EXISTS `MES_QualityInspectionPlan`;
CREATE TABLE `MES_QualityInspectionPlan`  (
  `InspectionPlanID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验计划ID',
  `InspectionPlanNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验计划单号',
  `OrderID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单ID',
  `PlanStartTime` datetime(0) NOT NULL COMMENT '计划开始时间',
  `PlanEndTime` datetime(0) NOT NULL COMMENT '计划结束时间',
  `ResponsiblePerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '责任人',
  `PlanStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划状态',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`InspectionPlanID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_QualityInspectionPlan
-- ----------------------------
INSERT INTO `MES_QualityInspectionPlan` VALUES ('60475294-C153-4C7C-8645-9209D9EB7BE4', 'QIP202503190001', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '3362', NULL, 1, '超级管理员', '2025-03-19 01:48:58', 1, '超级管理员', '2025-03-19 01:50:48');
INSERT INTO `MES_QualityInspectionPlan` VALUES ('6E58E213-F8E9-4032-9DC7-D62D76A418D9', 'QIP202503190003', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '3362', NULL, 1, '超级管理员', '2025-03-19 01:49:46', 1, '超级管理员', '2025-03-19 01:50:41');
INSERT INTO `MES_QualityInspectionPlan` VALUES ('CC7FE857-0608-4872-8E8B-754E41C4609A', 'QIP202503190002', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '1', NULL, 1, '超级管理员', '2025-03-19 01:49:40', 1, '超级管理员', '2025-03-19 01:50:44');
INSERT INTO `MES_QualityInspectionPlan` VALUES ('FC4A1634-E1E0-4455-ACF8-4D097A95CA56', 'QIP202503190004', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '1', NULL, 1, '超级管理员', '2025-03-19 01:49:50', 1, '超级管理员', '2025-03-19 01:50:38');

-- ----------------------------
-- Table structure for MES_QualityInspectionPlanDetail
-- ----------------------------
DROP TABLE IF EXISTS `MES_QualityInspectionPlanDetail`;
CREATE TABLE `MES_QualityInspectionPlanDetail`  (
  `InspectionPlanDetailID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验计划明细ID',
  `InspectionPlanID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验计划ID',
  `MaterialCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `MaterialSpecification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物料规格',
  `QuantityToInspect` int(11) NOT NULL COMMENT '检验数量',
  `InspectionMethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验方法',
  `InspectionStandard` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验标准',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`InspectionPlanDetailID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_QualityInspectionPlanDetail
-- ----------------------------
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('3151BAE6-9B91-46CC-8615-11C3CB2AFAA6', '6E58E213-F8E9-4032-9DC7-D62D76A418D9', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:47', 1, '超级管理员', '2025-03-19 01:50:41');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('4C946033-91AE-4F7E-A11E-C9FD20F0E373', 'CC7FE857-0608-4872-8E8B-754E41C4609A', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:41', 1, '超级管理员', '2025-03-19 01:50:44');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('8270F2E3-71BA-4074-BBD5-C97C981DDA3D', '60475294-C153-4C7C-8645-9209D9EB7BE4', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:48:59', 1, '超级管理员', '2025-03-19 01:50:48');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('89D373C2-5FCE-4915-A661-0F10D47112A5', '6E58E213-F8E9-4032-9DC7-D62D76A418D9', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:47', 1, '超级管理员', '2025-03-19 01:50:41');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('B7AD76CD-0C56-40DA-BEEE-0A096148B00F', '60475294-C153-4C7C-8645-9209D9EB7BE4', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:48:59', 1, '超级管理员', '2025-03-19 01:50:48');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('BB066D57-83AD-45C5-BB6E-3041B1EA65F6', 'FC4A1634-E1E0-4455-ACF8-4D097A95CA56', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:51', 1, '超级管理员', '2025-03-19 01:50:38');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('C6291518-07CA-4ABD-BD9A-63F51FF4A68F', 'FC4A1634-E1E0-4455-ACF8-4D097A95CA56', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:51', 1, '超级管理员', '2025-03-19 01:50:38');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('E29789CE-3501-4A57-87D6-9EA292F193F8', 'CC7FE857-0608-4872-8E8B-754E41C4609A', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:41', 1, '超级管理员', '2025-03-19 01:50:44');
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('EC9D80F7-041F-11F0-92BB-52540099312C', 'E92BEA50-041F-11F0-92BB-52540099312C', 'M001', '电阻', '100Ω', 500, '抽样检验', '阻值偏差±5%', 1, 'admin', '2024-07-01 08:00:00', NULL, NULL, NULL);
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('EC9D82A2-041F-11F0-92BB-52540099312C', 'E92BECD6-041F-11F0-92BB-52540099312C', 'M002', '电容', '10μF', 300, '全检', '容量偏差±3%', 1, 'admin', '2024-07-03 09:00:00', NULL, NULL, NULL);
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('EC9D83CD-041F-11F0-92BB-52540099312C', 'E92BED65-041F-11F0-92BB-52540099312C', 'M003', '线路板', 'PCB-A100', 200, '功能测试', '无短路、断路', 1, 'admin', '2024-07-05 10:00:00', NULL, NULL, NULL);
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('EC9D8477-041F-11F0-92BB-52540099312C', 'E92BEDCF-041F-11F0-92BB-52540099312C', 'M004', '塑料粒子', 'PP-500', 400, '外观检验', '无杂质、色泽均匀', 1, 'admin', '2024-07-07 11:00:00', NULL, NULL, NULL);
INSERT INTO `MES_QualityInspectionPlanDetail` VALUES ('EC9D8507-041F-11F0-92BB-52540099312C', 'E92BEE39-041F-11F0-92BB-52540099312C', 'M005', '螺丝', 'M3x10', 600, '尺寸检验', '直径偏差±0.1mm', 1, 'admin', '2024-07-09 12:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_QualityInspectionRecord
-- ----------------------------
DROP TABLE IF EXISTS `MES_QualityInspectionRecord`;
CREATE TABLE `MES_QualityInspectionRecord`  (
  `InspectionRecordID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验记录ID',
  `InspectionPlanDetailID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验计划明细ID',
  `InspectionNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验单号',
  `Inspector` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验员',
  `InspectionTime` datetime(0) NOT NULL COMMENT '检验时间',
  `InspectedQuantity` int(11) NOT NULL COMMENT '实际检验数量',
  `PassedQuantity` int(11) NOT NULL COMMENT '合格数量',
  `FailedQuantity` int(11) NOT NULL COMMENT '不合格数量',
  `InspectionResult` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检验结果（合格、不合格）',
  `DefectDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缺陷描述',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`InspectionRecordID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_QualityInspectionRecord
-- ----------------------------
INSERT INTO `MES_QualityInspectionRecord` VALUES ('F769ACB9-0421-11F0-92BB-52540099312C', 'FF1B025B-0421-11F0-92BB-52540099312C', 'QIR001', '1', '2024-07-01 10:00:00', 500, 480, 20, '不合格', '部分电阻阻值偏差超过±5%', 1, 'admin', '2024-07-01 10:00:00', 1, '超级管理员', '2025-03-19 01:56:01');
INSERT INTO `MES_QualityInspectionRecord` VALUES ('F769AE7C-0421-11F0-92BB-52540099312C', 'FF1B049D-0421-11F0-92BB-52540099312C', 'QIR002', '3362', '2024-07-03 11:00:00', 300, 290, 10, '不合格', '少数电容容量偏差超过±3%', 1, 'admin', '2024-07-03 11:00:00', 1, '超级管理员', '2025-03-19 01:55:58');
INSERT INTO `MES_QualityInspectionRecord` VALUES ('F769AF6B-0421-11F0-92BB-52540099312C', 'FF1B0534-0421-11F0-92BB-52540099312C', 'QIR003', '3362', '2024-07-05 12:00:00', 200, 190, 10, '不合格', '几块线路板存在短路问题', 1, 'admin', '2024-07-05 12:00:00', 1, '超级管理员', '2025-03-19 01:55:54');
INSERT INTO `MES_QualityInspectionRecord` VALUES ('F769B023-0421-11F0-92BB-52540099312C', 'FF1B05A7-0421-11F0-92BB-52540099312C', 'QIR004', '3362', '2024-07-07 13:00:00', 400, 380, 20, '合格', '部分塑料粒子有杂质', 1, 'admin', '2024-07-07 13:00:00', 1, '超级管理员', '2025-03-19 01:56:49');
INSERT INTO `MES_QualityInspectionRecord` VALUES ('F769B22D-0421-11F0-92BB-52540099312C', 'FF1B0616-0421-11F0-92BB-52540099312C', 'QIR005', '1', '2024-07-09 14:00:00', 600, 570, 30, '合格', '部分螺丝直径偏差超过±0.1mm', 1, 'admin', '2024-07-09 14:00:00', 1, '超级管理员', '2025-03-19 01:56:46');

-- ----------------------------
-- Table structure for MES_SchedulingPlan
-- ----------------------------
DROP TABLE IF EXISTS `MES_SchedulingPlan`;
CREATE TABLE `MES_SchedulingPlan`  (
  `SchedulePlanID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '排班计划ID',
  `PlanName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '排班计划名称',
  `ProductionLine` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产线名称',
  `TeamName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '班组名称',
  `StartDate` datetime(0) NOT NULL COMMENT '开始时间',
  `EndDate` datetime(0) NOT NULL COMMENT '结束时间',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`SchedulePlanID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_SchedulingPlan
-- ----------------------------
INSERT INTO `MES_SchedulingPlan` VALUES ('9C2C24F1-0422-11F0-92BB-52540099312C', 'SMT产线1月排班计划', 'SMT贴片生产线', 'SMT一组', '2024-01-01 08:00:00', '2024-01-31 17:00:00', 1, 'admin', '2024-01-01 09:00:00', 1, '超级管理员', '2025-03-19 02:00:45');
INSERT INTO `MES_SchedulingPlan` VALUES ('9C2C268A-0422-11F0-92BB-52540099312C', '注塑产线1月排班计划', '注塑生产线', '注塑一组', '2024-01-01 09:00:00', '2024-01-31 18:00:00', 1, 'admin', '2024-01-02 10:00:00', 1, '超级管理员', '2025-03-19 02:00:44');
INSERT INTO `MES_SchedulingPlan` VALUES ('9C2C279A-0422-11F0-92BB-52540099312C', '总装产线1月排班计划', '总装生产线', '总装一组', '2024-01-01 10:00:00', '2024-01-31 19:00:00', 1, 'admin', '2024-01-03 11:00:00', 1, '超级管理员', '2025-03-19 02:00:42');
INSERT INTO `MES_SchedulingPlan` VALUES ('9C2C2835-0422-11F0-92BB-52540099312C', '检测产线1月排班计划', '检测生产线', '检测一组', '2024-01-01 11:00:00', '2024-01-31 20:00:00', 1, 'admin', '2024-01-04 12:00:00', 1, '超级管理员', '2025-03-19 02:00:40');
INSERT INTO `MES_SchedulingPlan` VALUES ('9C2C28B9-0422-11F0-92BB-52540099312C', '包装产线1月排班计划', '包装生产线', '包装一组', '2024-01-01 12:00:00', '2024-01-31 21:00:00', 1, 'admin', '2024-01-05 13:00:00', 1, '超级管理员', '2025-03-19 02:00:38');

-- ----------------------------
-- Table structure for MES_Supplier
-- ----------------------------
DROP TABLE IF EXISTS `MES_Supplier`;
CREATE TABLE `MES_Supplier`  (
  `SupplierID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商ID',
  `SupplierName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商名',
  `ContactPerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `ContactPhone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `SupplierType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商类型',
  `ProductRange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应范围',
  `QualityRating` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '质量评级',
  `Remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`SupplierID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_Supplier
-- ----------------------------
INSERT INTO `MES_Supplier` VALUES ('FD83F9A1-0289-11F0-92BB-52540099312C', '绿韵包装材料供应商', '刘女士', '13378901234', 'lvyun@example.com', '杭州市西湖区', '包装材料供应商', '环保包装材料', 'A', '。。。。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:14:36');
INSERT INTO `MES_Supplier` VALUES ('FD83FB2F-0289-11F0-92BB-52540099312C', '宝盛包装用品供应商', '孙先生', '13289012345', 'baosheng@example.com', '南京市鼓楼区', '包装材料供应商', '各类包装用品', 'B', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:14:53');
INSERT INTO `MES_Supplier` VALUES ('FD83FB7B-0289-11F0-92BB-52540099312C', '逸彩印刷包装供应商', '周先生', '13190123456', 'yicai@example.com', '成都市武侯区', '包装材料供应商', '印刷包装产品', 'A', '印刷工艺。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:14:59');
INSERT INTO `MES_Supplier` VALUES ('FD8F3146-0289-11F0-92BB-52540099312C', '宏泰生产设备供应商', '吴先生', '13001234567', 'hongtai@example.com', '武汉市武昌区', '设备供应商', '生产设备', 'A', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:15:03');
INSERT INTO `MES_Supplier` VALUES ('FD8F32C3-0289-11F0-92BB-52540099312C', '锐翔检测设备供应商', '郑女士', '18812345678', 'ruixiang@example.com', '西安市碑林区', '设备供应商', '检测设备', 'B', '检测精度较高。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:15:11');
INSERT INTO `MES_Supplier` VALUES ('FD8F3302-0289-11F0-92BB-52540099312C', '丰能能源设备供应商', '钱先生', '18923456789', 'fengneng@example.com', '沈阳市和平区', '设备供应商', '能源设备', 'A', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:15:07');

-- ----------------------------
-- Table structure for MES_WarehouseManagement
-- ----------------------------
DROP TABLE IF EXISTS `MES_WarehouseManagement`;
CREATE TABLE `MES_WarehouseManagement`  (
  `WarehouseID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库ID',
  `WarehouseCode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库编码',
  `WarehouseName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名称',
  `WarehouseType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库类型',
  `WarehouseArea` decimal(10, 2) NOT NULL COMMENT '仓库面积',
  `WarehouseAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `WarehousePhone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库电话',
  `WarehouseManager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库管理员',
  `WarehouseStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库状态',
  `WarehouseCapacity` int(11) NOT NULL COMMENT '仓库容量',
  `CreateID` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `Creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `Modifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`WarehouseID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MES_WarehouseManagement
-- ----------------------------
INSERT INTO `MES_WarehouseManagement` VALUES ('1C19C214-9D78-4596-B078-789F7755896A', 'WH001', '原材料仓库', '原材料存储', 1000.50, '工厂A区', '021-12345678', '李明', '1', 5000, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:34');
INSERT INTO `MES_WarehouseManagement` VALUES ('1C19C214-9D78-4596-B078-789F7755896B', 'WH002', '成品仓库', '成品存储', 1200.00, '工厂B区', '021-23456789', '张华', '1', 6000, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:37');
INSERT INTO `MES_WarehouseManagement` VALUES ('1C19C214-9D78-4596-B078-789F7755896C', 'WH003', '半成品仓库', '半成品存储', 800.25, '工厂C区', '021-34567890', '王强', '0', 3500, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:44');
INSERT INTO `MES_WarehouseManagement` VALUES ('1C19C214-9D78-4596-B078-789F7755896D', 'WH004', '不良品仓库', '不良品暂存', 300.75, '工厂D区', '021-45678901', '刘悦', '1', 1000, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:41');
INSERT INTO `MES_WarehouseManagement` VALUES ('1C19C214-9D78-4596-B078-789F7755896E', 'WH005', '包装材料仓库', '包装材料存储', 650.00, '工厂E区', '021-56789012', '陈杰', '0', 4500, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:47');

-- ----------------------------
-- Table structure for SellOrder
-- ----------------------------
DROP TABLE IF EXISTS `SellOrder`;
CREATE TABLE `SellOrder`  (
  `Order_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderType` int(11) NOT NULL,
  `TranNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SellNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Qty` int(11) NOT NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditStatus` int(11) NOT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Order_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SellOrder
-- ----------------------------
INSERT INTO `SellOrder` VALUES ('323AB96F-49C1-4100-9D08-17DB9F209DF7', 1, '2023051300000004', '2023051300000004', 5505, NULL, 2, NULL, NULL, '部门+角色+用户审批', 1, '超级管理员', '2023-05-13 17:17:47', NULL, NULL, NULL);
INSERT INTO `SellOrder` VALUES ('55AE8C6C-6A11-4765-952A-7B4A3ADECE04', 2, '2023051300000001', '20230513000001', 200, NULL, 2, NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 15:49:18', 1, '超级管理员', '2023-05-13 15:49:27');
INSERT INTO `SellOrder` VALUES ('81D5DB86-C85A-4B06-BC3A-08142811C522', 1, '2023051300000005', '2023051300000005', 5050, NULL, 0, NULL, NULL, '2023051300000005', 1, '超级管理员', '2023-05-13 17:19:06', NULL, NULL, NULL);
INSERT INTO `SellOrder` VALUES ('B1DB23BD-ED48-4459-B9ED-355D97A7E16E', 1, '2023051300000003', '2023051300000003', 5000, NULL, 1, NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 17:07:37', NULL, NULL, NULL);
INSERT INTO `SellOrder` VALUES ('B67B7EC0-136C-4439-A530-CD6DD4D69A9C', 2, '2023051300000002', '20230513000002', 120, NULL, 1, NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 15:58:42', 1, '超级管理员', '2023-05-13 17:07:14');

-- ----------------------------
-- Table structure for SellOrderList
-- ----------------------------
DROP TABLE IF EXISTS `SellOrderList`;
CREATE TABLE `SellOrderList`  (
  `OrderList_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Order_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProductName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Qty` int(11) NOT NULL,
  `Weight` decimal(18, 2) NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderList_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SellOrderList
-- ----------------------------
INSERT INTO `SellOrderList` VALUES ('08D72CF6-D9F5-BEE9-32FF-5808FF1238CB', '6EFB65B8-585E-4BE7-8B77-94C76E362412', '测试', '测试', 7, 8.00, NULL, 1, '超级管理员', '2019-08-30 11:05:03', 1, '超级管理员', '2019-08-30 11:05:19');
INSERT INTO `SellOrderList` VALUES ('08D72CF6-ED6C-F0E0-9E97-5930A04F2EBC', 'AD698348-1535-4221-9A1A-57DB5CB351E4', '2', '2', 2, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:35', NULL, NULL, NULL);
INSERT INTO `SellOrderList` VALUES ('3D1467B1-11E0-4404-E3FD-08DB53868E51', '55AE8C6C-6A11-4765-952A-7B4A3ADECE04', '2', '20230513000001', 12400, 11.00, NULL, 1, '超级管理员', '2023-05-13 15:49:18', 1, '超级管理员', '2023-05-13 15:49:27');
INSERT INTO `SellOrderList` VALUES ('893CEE01-AD76-4894-FBF3-08DB5392EAA0', '323AB96F-49C1-4100-9D08-17DB9F209DF7', '2', '123', 200, NULL, NULL, 1, '超级管理员', '2023-05-13 17:17:47', NULL, NULL, NULL);
INSERT INTO `SellOrderList` VALUES ('BE0A328C-6ECC-419B-7B3C-08DB53917EFB', 'B1DB23BD-ED48-4459-B9ED-355D97A7E16E', '2', '1000', 2000, NULL, NULL, 1, '超级管理员', '2023-05-13 17:07:37', NULL, NULL, NULL);
INSERT INTO `SellOrderList` VALUES ('CCDFCD1D-E0DE-4CAE-7485-08DB5387DEB9', 'B67B7EC0-136C-4439-A530-CD6DD4D69A9C', '2', '2023051300000002', 12321, NULL, NULL, 1, '超级管理员', '2023-05-13 15:58:43', 1, '超级管理员', '2023-05-13 17:07:14');
INSERT INTO `SellOrderList` VALUES ('DF13A279-7EA4-47C0-FBF4-08DB5392EAA0', '81D5DB86-C85A-4B06-BC3A-08142811C522', '2', '111', 2000, NULL, NULL, 1, '超级管理员', '2023-05-13 17:19:06', NULL, NULL, NULL);
INSERT INTO `SellOrderList` VALUES ('FC332CEF-C1EB-4063-B71C-6ADDF19A8E8B', '6EFB65B8-585E-4BE7-8B77-94C76E362412', '22', '2', 0, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:19', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_City
-- ----------------------------
DROP TABLE IF EXISTS `Sys_City`;
CREATE TABLE `Sys_City`  (
  `CityId` int(11) NOT NULL AUTO_INCREMENT,
  `CityCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CityName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ProvinceCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CityId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 346 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for Sys_Department
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Department`;
CREATE TABLE `Sys_Department`  (
  `DepartmentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DepartmentName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DepartmentCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ParentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DepartmentType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`DepartmentId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_Department
-- ----------------------------
INSERT INTO `Sys_Department` VALUES ('41B96EA8-5475-4775-845D-FD66370C75AE', '上海市场研究院', 'H0001', NULL, NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 09:15:56', 1, '超级管理员', '2023-05-13 09:50:37');
INSERT INTO `Sys_Department` VALUES ('62105DFA-CA64-4C4A-AB42-11BA677AC4DB', '市场部', 'A003', '8974177F-AF6B-45B5-B7AB-88F169063F40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:12:48', NULL, NULL, NULL);
INSERT INTO `Sys_Department` VALUES ('8974177F-AF6B-45B5-B7AB-88F169063F40', '北京基础研究院', 'A0001', NULL, NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 08:56:16', 1, '超级管理员', '2023-05-13 09:50:34');
INSERT INTO `Sys_Department` VALUES ('97B5FF9C-5F52-4745-95F9-5FED8D505FA9', '资源部', 'H0007', '41B96EA8-5475-4775-845D-FD66370C75AE', NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 09:50:27', NULL, NULL, NULL);
INSERT INTO `Sys_Department` VALUES ('9E1121A0-D5C5-4F46-8DD4-43ED90D2F963', '行政部', 'A005', '8974177F-AF6B-45B5-B7AB-88F169063F40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:13:18', NULL, NULL, NULL);
INSERT INTO `Sys_Department` VALUES ('D01EB5D9-0F02-4468-94B8-635A5DFB3142', '商务部', 'A0002', '8974177F-AF6B-45B5-B7AB-88F169063F40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:07:16', NULL, NULL, NULL);
INSERT INTO `Sys_Department` VALUES ('E5D8E8AF-3659-454C-AA8E-C201C7EDBCFB', '销售部', 'A004', '62105DFA-CA64-4C4A-AB42-11BA677AC4DB', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:13:03', 1, '超级管理员', '2023-05-13 09:14:27');
INSERT INTO `Sys_Department` VALUES ('E8C6CC16-AF09-495D-B101-B651F10196DE', '战略部', 'H0002', '41B96EA8-5475-4775-845D-FD66370C75AE', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:19:55', NULL, NULL, NULL);
INSERT INTO `Sys_Department` VALUES ('EAE332DC-4AF8-4EBF-804A-E3D6C6D00926', '人事部', NULL, '9E1121A0-D5C5-4F46-8DD4-43ED90D2F963', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:14:41', NULL, NULL, NULL);
INSERT INTO `Sys_Department` VALUES ('EC238385-F907-44DE-B99B-0EDDCFFA6750', '产品部', 'A0003', '41B96EA8-5475-4775-845D-FD66370C75AE', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:20:26', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Dictionary
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Dictionary`;
CREATE TABLE `Sys_Dictionary`  (
  `Dic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DBServer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DbSql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DicName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DicNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Enable` tinyint(4) NOT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`Dic_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_Dictionary
-- ----------------------------
INSERT INTO `Sys_Dictionary` VALUES (1, NULL, '2023-08-04 15:01:34', 3362, '测试管理员', 'TestDbContext', NULL, '性别', '性别', 1, '超级管理员', '2024-06-03 23:58:45', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (3, '{valueField: \'Enable\',\r\ntextField: \'Enable\',\r\n containField: null,\r\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', NULL, NULL, '是否值', 'enable', 1, '超级管理员', '2024-06-03 23:59:03', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (30, '{valueField: \'Success\',\r\n textField: \'Success\', \r\n containField: null,\r\n handler: null }\r\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '超级管理员', '2024-06-04 00:06:59', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (31, '{valueField: \'LogType\',\r\n textField: \'LogType\', \r\n containField: null,\r\n handler: null }\r\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (32, '{valueField: \'Role_Id\',\r\n textField: \'RoleName\', \r\n containField: [\'Role_Id\',\'RoleName\'],\r\n handler: null }\r\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as \'key\',RoleName as \'value\' FROM Sys_Role WHERE Enable=1\r\n', '角色列表', 'roles', 1, '超级管理员', '2024-06-04 00:00:58', 1, 123, 87, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (35, '{\r\n valueField: \'AuditStatus\',\r\n textField: \'AuditStatus\',\r\n  containField:null \r\n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '超级管理员', '2024-06-04 00:04:02', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (38, '{\r\n valueField: \'City\',\r\n textField: \'City\',\r\n  containField:null \r\n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, '\r\nSELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \r\nINNER JOIN Sys_Province AS b \r\nON a.ProvinceCode=b.ProvinceCode\r\nWHERE a.CityName<> \'县\'', '城市', 'city', 1, '超级管理员', '2024-06-04 00:04:44', 1, NULL, 88, NULL);
INSERT INTO `Sys_Dictionary` VALUES (46, '{\r\n valueField: \'ProvinceName\',\r\n textField: \'ProvinceName\',\r\n  containField:null \r\n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, '\r\nSELECT  CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'key\',CASE WHEN  CityName=\'市辖区\' THEN  ProvinceName ELSE CityName end  as  \'value\'  FROM Sys_City AS a \r\nINNER JOIN Sys_Province AS b \r\nON a.ProvinceCode=b.ProvinceCode\r\nWHERE a.CityName<> \'县\'', '省列表', 'pro', 1, '超级管理员', '2024-06-04 00:04:50', 1, NULL, 88, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO `Sys_Dictionary` VALUES (49, '{\r\n valueField: \'Gender\',\r\n textField: \'Gender\',\r\n  containField:null \r\n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '超级管理员', '2024-06-03 23:59:30', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (50, '{\r\n valueField: \'Enable\',\r\n textField: \'Enable\',\r\n  containField:null \r\n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (66, NULL, '2020-12-29 21:50:16', 1, '超级管理员', NULL, 'SELECT Role_Id AS id,parentId,Role_Id AS  \'key\',RoleName AS value FROM Sys_Role\r\n', '级联角色', 'tree_roles', 1, '超级管理员', '2024-06-03 23:58:29', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (67, NULL, '2023-05-04 02:13:14', 1, '超级管理员', NULL, 'SELECT DepartmentId AS id,DepartmentId AS \'key\',ParentId AS parentId,DepartmentName AS value FROM Sys_Department', '部门级联', '部门级联', 1, '超级管理员', '2024-06-04 00:06:50', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (70, NULL, '2023-05-19 01:20:29', 1, '超级管理员', 'SysDbContext', NULL, '组织类型', '组织类型', 1, '超级管理员', '2024-06-04 00:07:11', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (76, NULL, '2023-05-19 15:18:35', 1, '超级管理员', NULL, 'SELECT code AS \'key\',name AS value FROM Sys_Region AS a WHERE a.level=3', '县', '县', 1, '超级管理员', '2024-06-04 00:05:18', 1, NULL, 88, NULL);
INSERT INTO `Sys_Dictionary` VALUES (77, NULL, '2023-05-19 15:19:11', 1, '超级管理员', NULL, 'SELECT code AS \'key\',name AS value FROM Sys_Region AS a WHERE a.level=2', '市', '市', 1, '超级管理员', '2024-06-04 00:05:10', 1, NULL, 88, NULL);
INSERT INTO `Sys_Dictionary` VALUES (78, NULL, '2023-05-19 15:19:57', 1, '超级管理员', NULL, 'SELECT code AS \'key\',name AS value FROM Sys_Region AS a WHERE a.level=1', '省', '省', 1, '超级管理员', '2025-02-24 10:59:48', 1, NULL, 88, NULL);
INSERT INTO `Sys_Dictionary` VALUES (85, NULL, '2023-10-07 14:40:56', 1, '超级管理员', NULL, NULL, '请求方式', '请求方式', 1, '超级管理员', '2024-06-03 23:51:26', 1, NULL, 87, NULL);
INSERT INTO `Sys_Dictionary` VALUES (87, NULL, '2024-06-03 23:44:55', 1, '超级管理员', NULL, NULL, '系统字典', '系统字典', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (88, NULL, '2024-06-04 00:04:35', 1, '超级管理员', NULL, NULL, '省市字典', '省市字典', 1, '超级管理员', '2025-03-05 15:14:46', 1, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (94, NULL, '2025-03-17 00:18:30', 1, '超级管理员', NULL, NULL, 'mes业务', 'mes业务', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_Dictionary` VALUES (95, NULL, '2025-03-17 00:19:59', 1, '超级管理员', NULL, NULL, '仓库类型', '仓库类型', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (96, NULL, '2025-03-17 00:32:39', 1, '超级管理员', 'ServiceDbContext', 'SELECT LocationID as \'key\', LocationName as \'value\', WarehouseID from MES_LocationManagement', '货位', '货位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (97, NULL, '2025-03-17 00:33:52', 1, '超级管理员', 'ServiceDbContext', 'SELECT WarehouseID  as \'key\', WarehouseName as \'value\' from MES_WarehouseManagement', '仓库', '仓库', 1, '超级管理员', '2025-03-17 00:42:11', 1, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (98, NULL, '2025-03-17 01:29:20', 1, '超级管理员', NULL, NULL, '物料单位', '物料单位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (99, NULL, '2025-03-17 01:56:46', 1, '超级管理员', 'ServiceDbContext', 'SELECT EquipmentID as \'key\',EquipmentName as \'value\' from MES_EquipmentManagement', '设备列表', '设备列表', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (100, NULL, '2025-03-17 02:14:14', 1, '超级管理员', 'ServiceDbContext', 'SELECT ProcessID as \'key\',ProcessName as \'value\' from MES_Process', '工序', '工序', 1, '超级管理员', '2025-03-17 02:17:10', 1, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (101, NULL, '2025-03-17 11:13:47', 1, '超级管理员', 'ServiceDbContext', 'SELECT CatalogID as \'key\',CatalogID as id,CatalogName as \'value\',ParentId as parentId from MES_MaterialCatalog', '物料分类', '物料分类', 1, '超级管理员', '2025-03-17 11:16:36', 1, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (102, NULL, '2025-03-17 18:31:19', 1, '超级管理员', 'ServiceDbContext', 'SELECT MaterialCode as \'key\',MaterialName as \'value\',Unit,Specification from MES_Material', '物料列表', '物料列表', 1, '超级管理员', '2025-03-17 18:34:07', 1, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (103, NULL, '2025-03-18 14:25:58', 1, '超级管理员', NULL, NULL, '排产状态', '排产状态', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (104, NULL, '2025-03-18 14:27:21', 1, '超级管理员', NULL, NULL, '优先级', '优先级', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (105, NULL, '2025-03-18 15:20:31', 1, '超级管理员', NULL, 'SELECT User_Id as \'key\',UserTrueName as \'value\' from Sys_User', '用户列表', '用户列表', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO `Sys_Dictionary` VALUES (106, NULL, '2025-03-19 01:27:42', 1, '超级管理员', 'ServiceDbContext', 'SELECT SupplierID as \'key\',SupplierName as \'value\' from MES_Supplier', '供应商', '供应商', 1, '超级管理员', '2025-03-19 01:30:28', 1, NULL, 94, NULL);

-- ----------------------------
-- Table structure for Sys_DictionaryList
-- ----------------------------
DROP TABLE IF EXISTS `Sys_DictionaryList`;
CREATE TABLE `Sys_DictionaryList`  (
  `DicList_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DicName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DicValue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dic_ID` int(11) NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`DicList_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO `Sys_DictionaryList` VALUES (1, '2023-08-04 15:01:34', 3362, '测试管理员', '男', '男', 1, 1, '超级管理员', '2024-06-03 23:58:45', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (2, '2023-08-04 15:01:34', 3362, '测试管理员', '女', '女', 1, 0, '超级管理员', '2024-06-03 23:58:45', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2024-06-03 23:59:03', 1, 2, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2024-06-03 23:59:03', 1, 1, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 100, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 90, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '待审核', '0', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 80, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 70, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '2', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 60, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '超级管理员', '2024-06-03 23:59:30', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '超级管理员', '2024-06-03 23:59:30', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 110, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (426, '2023-05-19 01:20:29', 1, '超级管理员', '组织', '1', 70, 0, '超级管理员', '2024-06-04 00:07:11', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (427, '2023-05-19 01:20:29', 1, '超级管理员', '部门', '2', 70, 0, '超级管理员', '2024-06-04 00:07:11', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (447, '2023-10-07 14:40:56', 1, '超级管理员', 'post', 'post', 85, 0, '超级管理员', '2024-06-03 23:51:26', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (448, '2023-10-07 14:40:56', 1, '超级管理员', 'get', 'get', 85, 0, '超级管理员', '2024-06-03 23:51:26', 1, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (449, '2023-11-12 23:54:35', 1, '超级管理员', '审核未通过', '3', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 50, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (450, '2023-11-12 23:54:35', 1, '超级管理员', '驳回', '4', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 40, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (451, '2023-11-12 23:54:35', 1, '超级管理员', '终止', '5', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 30, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (452, '2023-11-12 23:54:35', 1, '超级管理员', '草稿', '90', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 20, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (453, '2023-11-12 23:54:35', 1, '超级管理员', '待提交', '100', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (465, '2025-03-17 00:19:59', 1, '超级管理员', '原材料存储', '原材料存储', 95, 0, NULL, NULL, NULL, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (466, '2025-03-17 00:19:59', 1, '超级管理员', '成品存储', '成品存储', 95, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (467, '2025-03-17 00:19:59', 1, '超级管理员', '半成品仓库', '半成品仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (468, '2025-03-17 00:19:59', 1, '超级管理员', '不良品仓库', '不良品仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (469, '2025-03-17 00:19:59', 1, '超级管理员', '包装材料仓库', '包装材料仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (470, '2025-03-17 01:29:21', 1, '超级管理员', '吨', '吨', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (471, '2025-03-17 01:29:21', 1, '超级管理员', 'kg', 'kg', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (472, '2025-03-17 01:29:21', 1, '超级管理员', '件', '件', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (473, '2025-03-17 01:29:21', 1, '超级管理员', '个', '个', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (474, '2025-03-18 14:25:59', 1, '超级管理员', '待生产', '待生产', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (475, '2025-03-18 14:25:59', 1, '超级管理员', '生产中', '生产中', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (476, '2025-03-18 14:25:59', 1, '超级管理员', '已完成', '已完成', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (477, '2025-03-18 14:27:21', 1, '超级管理员', 'LV1', '1', 104, 0, NULL, NULL, NULL, 10, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (478, '2025-03-18 14:27:21', 1, '超级管理员', 'LV2', '2', 104, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `Sys_DictionaryList` VALUES (479, '2025-03-18 14:27:21', 1, '超级管理员', 'LV3', '3', 104, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Log`;
CREATE TABLE `Sys_Log`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BeginDate` datetime(0) NULL DEFAULT NULL,
  `BrowserType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ElapsedTime` int(11) NULL DEFAULT NULL,
  `EndDate` datetime(0) NULL DEFAULT NULL,
  `ExceptionInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LogType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RequestParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ResponseParameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `ServiceIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Success` int(11) NULL DEFAULT NULL,
  `Url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `UserIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_Log
-- ----------------------------
INSERT INTO `Sys_Log` VALUES (1, '2025-03-24 03:21:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 96, '2025-03-24 03:21:15', NULL, 'Exception', 'The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See https://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.   at VOL.Core.EFDbContext.VOLContext.SaveChanges() in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\EFDbContext\\VOLContext.cs:line 54\r\n   at VOL.Core.BaseProvider.RepositoryBase`1.UpdateRange[Detail](TEntity entity, Boolean updateDetail, Boolean delNotExist, Expression`1 updateMainFields, Expression`1 updateDetailFields, Boolean saveChange) in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\BaseProvider\\RepositoryBase.cs:line 432\r\n   at VOL.Builder.Services.Sys_TableInfoService.SaveEidt(Sys_TableInfo sysTableInfo) in E:\\jxx\\vol-next\\vol.api\\VOL.Builder\\Services\\Core\\Partial\\Sys_TableInfoService.cs:line 432\r\n   at VOL.WebApi.Controllers.Builder.BuilderController.SaveEidt(Sys_TableInfo tableInfo) in E:\\jxx\\vol-next\\vol.api\\VOL.WebApi\\Controllers\\Builder\\BuilderController.cs:line 55\r\n   at lambda_method1039(Closure, Object, Object[])\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\r\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\r\n   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\Middleware\\HttpRequestMiddleware.cs:line 19\r\n--- End of stack trace from previous location ---\r\n   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\Middleware\\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/builder/Save', '::1', '超级管理员', 1);
INSERT INTO `Sys_Log` VALUES (2, '2025-03-24 03:21:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 0, '2025-03-24 03:21:17', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO `Sys_Log` VALUES (3, '2025-03-24 03:21:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 0, '2025-03-24 03:21:41', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO `Sys_Log` VALUES (4, '2025-03-24 03:22:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 1, '2025-03-24 03:22:08', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO `Sys_Log` VALUES (5, '2025-03-24 03:23:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 1, '2025-03-24 03:23:25', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO `Sys_Log` VALUES (6, '2025-03-24 03:23:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 0, '2025-03-24 03:23:46', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO `Sys_Log` VALUES (7, '2025-03-24 03:23:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 1, '2025-03-24 03:23:52', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);

-- ----------------------------
-- Table structure for Sys_Menu
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Menu`;
CREATE TABLE `Sys_Menu`  (
  `Menu_Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Auth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `Url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MenuType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Menu_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO `Sys_Menu` VALUES (2, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-user', NULL, 1, 9000, '.', 61, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2025-03-24 01:26:46', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (3, '角色管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2023-05-08 02:10:41', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (5, '日志管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-date', NULL, 1, 1300, 'xxx', 61, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2025-03-23 23:23:28', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (6, '系统日志', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (8, '图表开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-monitor', NULL, 1, 10000, '.', 32, '/ProductionState', NULL, NULL, '2025-03-24 02:52:54', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (9, '用户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"上传\",\"value\":\"Upload\"},{\"text\":\"审核\",\"value\":\"Audit\"}]', '', NULL, 1, 2000, 'Sys_User', 2, '/Sys_User', NULL, NULL, '2023-05-08 02:11:52', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (32, '基础组件', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-full-screen', NULL, 1, 1720, '/', 0, '', NULL, NULL, '2025-03-24 01:25:40', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (36, '图表+表单', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-data-analysis', NULL, 1, 900, '/', 32, 'formChart', NULL, NULL, '2025-03-24 02:46:07', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (45, '不用节点', '', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2020-05-05 13:20:14', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (61, '系统设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-setting', NULL, 1, 1000, '系统设置', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2023-05-13 11:09:04', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (62, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 8000, 'Sys_Menu', 291, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2025-03-24 01:37:47', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (63, '数据字典', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 7000, 'Sys_Dictionary', 292, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2025-03-24 01:38:51', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (64, '代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-paperclip', NULL, 1, 1500, '代码生成', 61, '/coding', '2019-07-12 14:07:55', '超级管理员', '2025-03-24 01:39:58', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (65, '代码生成', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2022-01-03 19:01:21', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (71, '权限管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, ',', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', '2023-05-08 02:11:07', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (91, '图表+表格', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-odometer', NULL, 1, 800, '数字排版', 32, '/flex', '2020-04-07 21:51:38', '超级管理员', '2025-03-24 02:46:10', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (104, '角色管理(tree)', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 0, 0, 'Sys_Role1', 2, '/Sys_Role1', '2021-05-02 13:41:35', '超级管理员', '2023-05-13 08:51:01', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (106, '表单设计', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-postcard', NULL, 1, 3000, '.', 61, '', '2021-08-28 00:39:04', '超级管理员', '2025-03-23 23:24:07', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (107, '表单设计', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 100, '.', 106, '/formDraggable', '2021-08-28 00:40:00', '超级管理员', '2022-01-03 19:01:45', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (109, '表单配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'FormDesignOptions', 106, '/FormDesignOptions', '2021-12-29 23:27:28', '超级管理员', '2022-01-03 19:03:58', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (110, '数据采集', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, '.', 106, '/formCollectionResultTree', '2021-12-29 23:28:44', '超级管理员', '2021-12-30 23:11:51', '超级管理员', NULL);
INSERT INTO `Sys_Menu` VALUES (113, '基础页面', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 9000, '.', 0, '', '2022-03-26 00:58:41', '超级管理员', '2022-04-04 13:39:54', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (115, '水平显示', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '.', 113, '/pages/order/App_Appointment1/App_Appointment1', '2022-03-26 01:00:38', '超级管理员', '2025-03-23 23:22:51', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (125, '表单只读', '', '', NULL, 1, 0, '.', 113, 'pages/form/form1', '2022-03-26 03:12:52', '超级管理员', '2022-03-27 15:38:00', '超级管理员', 1);
INSERT INTO `Sys_Menu` VALUES (132, '消息推送', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-chat-line-round', NULL, 1, 1700, '.', 293, '/signalR', '2022-05-03 03:31:02', '超级管理员', '2025-03-24 01:41:51', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (133, '审批管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-mobile', NULL, 1, 6800, '流程管理', 61, '', '2022-07-25 00:39:22', '超级管理员', '2025-03-24 01:39:07', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (134, '流程管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_WorkFlow', 133, '/Sys_WorkFlow', '2022-07-25 00:39:56', '超级管理员', '2022-08-01 03:18:05', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (135, '我的审批', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"}]', '', NULL, 1, 0, 'Sys_WorkFlowTable', 133, '/Sys_WorkFlowTable', '2022-08-01 00:35:05', '超级管理员', '2022-08-16 01:00:46', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (136, '发起流程', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 0, '发起流程', 133, '/flowdemo', '2022-08-16 00:21:39', '超级管理员', '2022-08-16 00:21:46', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (137, '定时任务', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-alarm-clock', NULL, 1, 1725, '定时任务', 61, '', '2022-09-05 03:19:10', '超级管理员', '2025-03-23 23:24:34', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (138, '任务配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 0, 'Sys_QuartzOptions', 137, '/Sys_QuartzOptions', '2022-09-05 03:19:45', '超级管理员', '2022-08-01 00:33:46', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (139, '执行记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'Sys_QuartzLog', 137, '/Sys_QuartzLog', '2022-09-05 03:20:06', '超级管理员', '2022-09-05 03:20:08', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (142, '组织架构', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 2500, 'Sys_Department', 2, '/Sys_Department', '2023-05-08 02:12:15', '超级管理员', '2023-05-08 02:12:43', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (235, 'MES业务', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-monitor', NULL, 1, 9000, '.', 0, '', '2025-03-13 19:35:58', '超级管理员', '2025-03-18 19:09:44', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (236, '基础设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-receiving', NULL, 1, 2000, '.', 235, '', '2025-03-13 19:36:33', '超级管理员', '2025-03-14 10:55:10', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (237, '仓库管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-house', NULL, 1, 1800, '.', 235, '', '2025-03-13 19:39:28', '超级管理员', '2025-03-13 19:39:39', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (238, '设备管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-news', NULL, 1, 1600, '.', 235, '', '2025-03-13 19:40:30', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (239, '生产计划', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-shopping-cart-1', NULL, 1, 1400, '.', 235, '', '2025-03-13 19:40:53', '超级管理员', '2025-03-13 22:06:59', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (240, '质检中心', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-edit-outline', NULL, 1, 1200, '.', 235, '', '2025-03-13 19:41:41', '超级管理员', '2025-03-14 10:54:23', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (241, '工序管理', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-mobile-phone', NULL, 1, 1500, '.', 235, '', '2025-03-13 19:42:11', '超级管理员', '2025-03-13 19:44:09', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (242, '生产排班', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-stopwatch', NULL, 1, 1000, '.', 235, '', '2025-03-13 19:42:44', '超级管理员', '2025-03-16 21:53:03', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (244, '生产报工', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-tickets', NULL, 1, 1300, '.', 235, '', '2025-03-14 00:44:21', '超级管理员', '2025-03-14 00:44:36', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (247, '审批流程', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-date', NULL, 1, 2900, '.', 235, '', '2025-03-14 17:11:15', '超级管理员', '2025-03-18 17:26:06', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (249, ' 客户管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 800, 'MES_Customer', 236, '/MES_Customer', '2025-03-14 17:19:51', '超级管理员', '2025-03-17 11:53:53', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (250, '供应商', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 700, 'MES_Supplier', 236, '/MES_Supplier', '2025-03-14 17:21:07', '超级管理员', '2025-03-14 17:28:05', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (251, '产线管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'MES_ProductionLine', 236, '/MES_ProductionLine', '2025-03-14 17:21:53', '超级管理员', '2025-03-17 01:50:19', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (252, '产线设备', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 0, 500, 'MES_ProductionLineDevice', 236, '/MES_ProductionLineDevice', '2025-03-14 17:23:26', '超级管理员', '2025-03-14 17:20:07', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (253, '物料管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"打印\",\"value\":\"Print\"}]', '', NULL, 1, 510, 'MES_Material', 236, '/MES_Material', '2025-03-14 17:24:13', '超级管理员', '2025-03-17 11:18:57', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (254, '物料分类', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 550, 'MES_MaterialCatalog', 236, '/MES_MaterialCatalog', '2025-03-14 17:25:23', '超级管理员', '2025-03-17 11:18:26', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (255, '仓库管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'MES_WarehouseManagement', 237, '/MES_WarehouseManagement', '2025-03-14 17:31:20', '超级管理员', '2025-03-13 19:39:39', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (256, '货位管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 800, 'MES_LocationManagement', 237, '/MES_LocationManagement', '2025-03-14 17:31:54', '超级管理员', '2025-03-13 19:39:39', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (257, '库存管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"打印\",\"value\":\"Print\"}]', '', NULL, 1, 700, 'MES_InventoryManagement', 237, '/MES_InventoryManagement', '2025-03-14 17:32:40', '超级管理员', '2025-03-17 02:10:34', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (258, '产品入库', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'MES_ProductInbound', 237, '/MES_ProductInbound', '2025-03-14 17:33:07', '超级管理员', '2025-03-17 01:00:49', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (259, '产品出库', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 500, 'MES_ProductOutbound', 237, '/MES_ProductOutbound', '2025-03-14 17:33:31', '超级管理员', '2025-03-17 00:54:51', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (260, '设备管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 900, 'MES_EquipmentManagement', 238, '/MES_EquipmentManagement', '2025-03-14 17:35:22', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (261, '设备维修', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 800, 'MES_EquipmentRepair', 238, '/MES_EquipmentRepair', '2025-03-14 17:35:49', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (262, '设备保养', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 0, 'MES_EquipmentMaintenance', 238, '/MES_EquipmentMaintenance', '2025-03-14 17:36:36', '超级管理员', '2025-03-17 02:06:18', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (263, '设备故障', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 500, 'MES_EquipmentFaultRecord', 238, '/MES_EquipmentFaultRecord', '2025-03-14 17:37:22', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (264, '工序管理', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"打印\",\"value\":\"Print\"}]', '', NULL, 1, 800, 'MES_Process', 241, '/MES_Process', '2025-03-16 21:26:13', '超级管理员', '2025-03-17 02:10:42', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (265, '工线路线', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 700, 'MES_ProcessRoute', 241, '/MES_ProcessRoute', '2025-03-16 21:27:19', '超级管理员', '2025-03-16 21:27:35', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (266, '工序统计', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"打印\",\"value\":\"Print\"}]', '', NULL, 1, 600, 'MES_ProcessReport', 241, '/MES_ProcessReport', '2025-03-16 21:29:22', '超级管理员', '2025-03-17 02:37:51', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (267, '生产订单', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"},{\"text\":\"打印\",\"value\":\"Print\"}]', '', NULL, 1, 900, 'MES_ProductionOrder', 239, '/MES_ProductionOrder', '2025-03-16 21:36:43', '超级管理员', '2025-03-18 17:13:19', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (268, '订单明细表', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 0, 800, 'MES_ProductionPlanDetail', 239, '/MES_ProductionPlanDetail', '2025-03-16 21:38:21', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (270, '变更记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'MES_ProductionPlanChangeRecord', 239, '/MES_ProductionPlanChangeRecord', '2025-03-16 21:40:30', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (271, '生产报工', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"审核\",\"value\":\"Audit\"},{\"text\":\"反审\",\"value\":\"AntiAudit\"},{\"text\":\"打印\",\"value\":\"Print\"}]', '', NULL, 1, 900, 'MES_ProductionReporting', 244, '/MES_ProductionReporting', '2025-03-16 21:41:46', '超级管理员', '2025-03-18 17:13:22', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (272, '报工明细', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"}]', '', NULL, 2, 800, 'MES_ProductionReportingDetail', 244, '/MES_ProductionReportingDetail', '2025-03-16 21:42:15', '超级管理员', '2025-03-16 21:42:17', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (273, '生产不良记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 600, 'MES_DefectiveProductRecord', 244, '/MES_DefectiveProductRecord', '2025-03-16 21:42:49', '超级管理员', '2025-03-18 18:06:14', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (275, '质量检验', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 900, 'MES_QualityInspectionPlan', 240, '/MES_QualityInspectionPlan', '2025-03-16 21:47:04', '超级管理员', '2025-03-19 01:43:31', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (276, '质检明细', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"}]', '', NULL, 0, 700, 'MES_QualityInspectionPlanDetail', 240, '/MES_QualityInspectionPlanDetail', '2025-03-16 21:47:51', '超级管理员', '2025-03-16 21:52:24', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (277, '质检记录', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 500, 'MES_QualityInspectionRecord', 240, '/MES_QualityInspectionRecord', '2025-03-16 21:48:41', '超级管理员', '2025-03-14 10:54:23', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (279, '排班计划', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 800, 'MES_SchedulingPlan', 242, '/MES_SchedulingPlan', '2025-03-16 21:56:15', '超级管理员', '2025-03-16 22:00:46', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (280, '排班日历', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 600, '.', 242, 'MES_Calendar', '2025-03-16 22:10:57', '超级管理员', '2025-03-19 02:01:39', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (281, '我的审批', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 800, '.', 247, '/Sys_WorkFlowTable', '2025-03-16 22:12:04', '超级管理员', '2025-03-16 22:11:25', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (282, '流程配置', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"}]', '', NULL, 1, 700, '.', 247, 'Sys_WorkFlow', '2025-03-16 22:12:47', '超级管理员', '2025-03-16 22:12:47', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (286, '制造BOM', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-setting', NULL, 1, 1400, '.', 235, '', '2025-03-18 17:24:00', '超级管理员', '2025-03-18 17:24:10', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (287, '制造BOM', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"复制\",\"value\":\"CopyData\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 1, 200, 'MES_Bom_Main', 286, '/MES_Bom_Main', '2025-03-18 17:24:47', '超级管理员', '2025-03-18 18:24:02', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (289, '生产任务', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 500, '.', 239, '/list', '2025-03-19 13:46:28', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (290, 'Bom明细', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导出\",\"value\":\"Export\"}]', '', NULL, 2, 0, 'MES_Bom_Detail', 286, '/MES_Bom_Detail', '2025-03-19 14:21:12', '超级管理员', '2025-03-18 18:24:02', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (291, '菜单设置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-folder', NULL, 1, 8100, '.', 61, '', '2025-03-24 01:37:14', '超级管理员', '2025-03-24 01:38:19', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (292, '数据字典', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-receiving', NULL, 1, 7100, '.', 61, '', '2025-03-24 01:38:39', '超级管理员', '2025-03-24 01:38:47', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (293, '消息推送', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-chat-dot-round', NULL, 1, 1800, '.', 61, '', '2025-03-24 01:40:39', '超级管理员', '2025-03-24 01:41:40', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (294, '统计报表', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-data-line', NULL, 1, 700, '.', 235, '', '2025-03-24 02:20:27', '超级管理员', '2025-03-16 21:53:03', NULL, 0);
INSERT INTO `Sys_Menu` VALUES (295, '生产统计', '[{\"text\":\"查询\",\"value\":\"Search\"}]', '', NULL, 1, 800, '.', 294, '/ProductionState', '2025-03-24 02:20:59', '超级管理员', '2025-03-24 02:28:10', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (296, '图表统计', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-data-line', NULL, 1, 2000, '.', 32, '', '2025-03-24 02:40:46', '超级管理员', '2025-03-24 02:42:09', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (297, '多页签配置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-receiving', NULL, 1, 700, '.', 32, '', '2025-03-24 02:44:22', '超级管理员', '2025-03-24 02:45:03', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (298, '一对多配置', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-coin', NULL, 1, 710, '.', 32, '', '2025-03-24 02:45:51', '超级管理员', '2025-03-24 02:52:20', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (299, '文本编辑', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-mobile-phone', NULL, 1, 780, '.', 32, '', '2025-03-24 02:47:09', '超级管理员', '2025-03-24 02:50:24', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (300, '主从结构', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"}]', 'el-icon-office-building', NULL, 1, 760, '.', 32, '/MES_Process', '2025-03-24 02:48:59', '超级管理员', '2025-03-24 02:49:03', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (301, '树形结构', '[{\"text\":\"查询\",\"value\":\"Search\"},{\"text\":\"新建\",\"value\":\"Add\"},{\"text\":\"删除\",\"value\":\"Delete\"},{\"text\":\"编辑\",\"value\":\"Update\"},{\"text\":\"导入\",\"value\":\"Import\"}]', 'el-icon-guide', NULL, 1, 740, '.', 32, '/MES_Material', '2025-03-24 02:49:56', '超级管理员', '2025-03-24 02:50:03', '超级管理员', 0);
INSERT INTO `Sys_Menu` VALUES (302, '移动端开发', '[{\"text\":\"查询\",\"value\":\"Search\"}]', 'el-icon-mobile-phone', NULL, 1, 600, '.', 32, 'http://app.volcore.xyz/', '2025-03-24 02:51:31', '超级管理员', '2025-03-24 02:51:51', '超级管理员', 0);

-- ----------------------------
-- Table structure for Sys_Province
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Province`;
CREATE TABLE `Sys_Province`  (
  `ProvinceId` int(11) NOT NULL AUTO_INCREMENT,
  `ProvinceCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProvinceName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RegionCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProvinceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `TaskName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '任务名称',
  `ElapsedTime` int(11) NULL DEFAULT NULL COMMENT '耗时(秒)',
  `StratDate` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `EndDate` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `Result` int(11) NULL DEFAULT NULL COMMENT '执行结果',
  `ResponseContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回内容',
  `ErrorMsg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
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

-- ----------------------------
-- Table structure for Sys_QuartzOptions
-- ----------------------------
DROP TABLE IF EXISTS `Sys_QuartzOptions`;
CREATE TABLE `Sys_QuartzOptions`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TaskName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `GroupName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务分组',
  `CronExpression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Corn表达式',
  `Method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `ApiUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'Url地址',
  `AuthKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AuthValue` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `LastRunTime` datetime(0) NULL DEFAULT NULL COMMENT '最后执行执行',
  `Status` int(11) NULL DEFAULT NULL COMMENT '运行状态',
  `PostData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'post参数',
  `TimeOut` int(11) NULL DEFAULT NULL COMMENT '超时时间(秒)',
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_QuartzOptions
-- ----------------------------
INSERT INTO `Sys_QuartzOptions` VALUES ('7D223549-C8EE-461D-80A9-E4601EEB5C0A', '1秒执行一次', '测试', '* * * * * ?	', 'get', 'http://localhost:9991/api/Sys_QuartzOptions/test', NULL, NULL, NULL, '2023-05-13 11:35:22', 1, NULL, 180, 1, '超级管理员', '2022-09-07 01:45:04', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
DROP TABLE IF EXISTS `Sys_Role`;
CREATE TABLE `Sys_Role`  (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DeleteBy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DeptName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NOT NULL,
  `RoleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Role_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO `Sys_Role` VALUES (1, '2018-08-23 11:46:06', '超级管理员', NULL, '无', 0, 1, '测试超级管理员', '2018-09-06 17:08:35', 1000, 0, '超级管理员');
INSERT INTO `Sys_Role` VALUES (2, '2018-08-23 11:46:52', '超级管理员', NULL, '1', 0, 1, '超级管理员', '2022-04-17 20:11:05', NULL, 1, '测试管理员');
INSERT INTO `Sys_Role` VALUES (4, '2018-08-23 11:47:41', '超级管理员', NULL, '无  ', 0, 1, '超级管理员', '2019-12-08 21:11:11', NULL, 2, '信息员');

-- ----------------------------
-- Table structure for Sys_RoleAuth
-- ----------------------------
DROP TABLE IF EXISTS `Sys_RoleAuth`;
CREATE TABLE `Sys_RoleAuth`  (
  `Auth_Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Menu_Id` int(11) NOT NULL,
  `Modifier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `Role_Id` int(11) NULL DEFAULT NULL,
  `User_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Auth_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_RoleAuth
-- ----------------------------
INSERT INTO `Sys_RoleAuth` VALUES (1, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 9, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (2, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 13:23:11', '超级管理员', 53, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (3, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 50, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (4, 'Search', '2020-05-05 13:23:11', '超级管理员', 40, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (5, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 3, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (6, 'Search', '2020-05-05 13:23:11', '超级管理员', 37, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (7, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 51, '超级管理员', '2022-08-22 01:13:38', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (8, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 59, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (9, 'Search,Add,Delete,Update', '2020-05-05 13:23:11', '超级管理员', 13, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (10, '', '2020-05-05 13:23:11', '超级管理员', 44, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (11, '', '2020-05-05 13:23:11', '超级管理员', 24, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (12, '', '2020-05-05 13:23:11', '超级管理员', 35, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (13, 'Search', '2020-05-05 13:23:11', '超级管理员', 60, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (14, 'Search', '2020-05-05 13:23:11', '超级管理员', 58, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (15, 'Search,Add,Delete,Update,Export,Audit', '2020-05-05 13:23:11', '超级管理员', 68, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (16, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 13:23:11', '超级管理员', 52, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (17, 'Search,Add,Delete,Update', '2020-05-05 13:23:11', '超级管理员', 65, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (18, 'Search', '2020-05-05 13:23:11', '超级管理员', 62, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (19, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 63, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (20, '', '2020-05-05 13:23:11', '超级管理员', 54, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (21, 'Search', '2020-05-05 13:23:11', '超级管理员', 94, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (22, 'Search', '2020-05-05 13:23:11', '超级管理员', 42, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (23, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 34, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (24, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 90, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (25, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 67, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (26, 'Search', '2020-05-05 13:23:11', '超级管理员', 91, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (27, 'Search', '2020-05-05 13:23:11', '超级管理员', 36, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (28, 'Search', '2020-05-05 13:23:11', '超级管理员', 77, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (29, 'Search,Delete,Export', '2020-05-05 13:23:11', '超级管理员', 6, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (30, 'Search', '2020-05-05 13:23:11', '超级管理员', 88, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (31, 'Search', '2020-05-05 13:23:11', '超级管理员', 61, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (32, 'Search', '2020-05-05 13:23:11', '超级管理员', 8, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (33, 'Search', '2020-05-05 13:23:11', '超级管理员', 48, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (34, 'Search', '2020-05-05 13:23:11', '超级管理员', 74, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (35, 'Search', '2020-05-05 13:23:11', '超级管理员', 56, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (36, 'Search', '2020-05-05 13:23:11', '超级管理员', 55, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (37, 'Search', '2020-05-05 13:23:11', '超级管理员', 32, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (38, 'Search', '2020-05-05 13:23:11', '超级管理员', 33, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (39, 'Search', '2020-05-05 13:23:11', '超级管理员', 92, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (40, 'Search', '2020-05-05 13:23:11', '超级管理员', 89, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (41, 'Search', '2020-05-05 13:23:11', '超级管理员', 86, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (42, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 84, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (43, 'Search', '2020-05-05 13:23:11', '超级管理员', 29, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (44, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 13:23:11', '超级管理员', 31, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (45, 'Search', '2020-05-05 13:23:11', '超级管理员', 72, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (46, 'Search', '2020-05-05 13:23:11', '超级管理员', 66, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (47, 'Search', '2020-05-05 13:23:11', '超级管理员', 28, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (48, 'Search', '2020-05-05 13:23:11', '超级管理员', 64, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (49, 'Search', '2020-05-05 13:23:11', '超级管理员', 5, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (50, 'Search', '2020-05-05 13:23:11', '超级管理员', 25, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (51, 'Search,Add,Delete,Update', '2020-05-05 13:23:11', '超级管理员', 93, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (52, 'Search', '2020-05-05 13:23:11', '超级管理员', 85, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (53, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 75, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (54, 'Search', '2020-05-05 13:23:11', '超级管理员', 87, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (55, 'Search', '2020-05-05 13:23:11', '超级管理员', 57, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (56, 'Search,Import,Export,test', '2020-05-05 13:23:11', '超级管理员', 49, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (57, 'Search,Update', '2020-05-05 13:23:11', '超级管理员', 71, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (58, 'Search', '2020-05-05 13:23:11', '超级管理员', 2, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (59, 'Search', '2020-05-05 13:23:11', '超级管理员', 73, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (60, 'Search', '2022-08-16 00:56:48', '超级管理员', 133, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (61, 'Search,Add,Delete,Update,Export', '2022-08-16 00:56:48', '超级管理员', 134, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (62, 'Search,Delete', '2022-08-16 00:56:48', '超级管理员', 135, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (63, 'Search', '2022-08-16 00:56:48', '超级管理员', 136, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (64, 'Search', '2022-08-22 01:13:38', '超级管理员', 113, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (65, 'Search', '2022-08-22 01:13:38', '超级管理员', 115, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (66, 'Search', '2022-09-09 17:53:16', '超级管理员', 118, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (67, 'Search,Add,Delete,Update,Import,Export', '2022-09-09 17:53:16', '超级管理员', 119, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (68, 'Search', '2022-09-09 17:53:21', '超级管理员', 116, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (69, 'Search', '2022-09-09 17:53:38', '超级管理员', 129, '超级管理员', '2022-09-09 17:53:38', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (70, 'Search', '2022-09-09 17:53:45', '超级管理员', 106, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (71, 'Search', '2022-09-09 17:53:45', '超级管理员', 107, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (72, 'Search', '2022-09-09 17:53:45', '超级管理员', 127, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (73, 'Search,Add,Delete,Update', '2022-09-09 17:53:45', '超级管理员', 109, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (74, 'Search,Delete,Export', '2022-09-09 17:53:45', '超级管理员', 110, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (75, 'Search', '2022-09-09 17:54:03', '超级管理员', 137, '超级管理员', '2022-09-09 17:54:03', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (76, 'Search,Add,Delete,Update', '2022-09-09 17:54:03', '超级管理员', 138, '超级管理员', '2022-09-09 17:54:03', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (77, 'Search,Delete,Export', '2022-09-09 17:54:03', '超级管理员', 139, '超级管理员', '2022-09-09 17:54:03', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (78, 'Search', '2022-09-09 17:55:31', 'zs', 129, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (79, 'Search', '2022-09-09 17:55:31', 'zs', 106, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (80, 'Search', '2022-09-09 17:55:31', 'zs', 107, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (81, 'Search,Add,Delete,Update', '2022-09-09 17:55:31', 'zs', 109, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (82, 'Search,Delete,Export', '2022-09-09 17:55:31', 'zs', 110, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (83, 'Search', '2023-02-03 16:51:48', '超级管理员', 113, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (84, 'Search', '2023-02-03 16:51:48', '超级管理员', 116, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (85, 'Search', '2023-02-03 16:51:48', '超级管理员', 118, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (86, 'Search,Add,Delete,Update', '2023-02-03 16:51:48', '超级管理员', 119, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (87, 'Search', '2023-02-03 16:51:48', '超级管理员', 115, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (88, 'Search', '2023-05-13 13:53:24', '超级管理员', 101, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (89, 'Search,Add,Delete,Update,Import,Export', '2023-05-13 13:53:24', '超级管理员', 100, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (90, 'Search,Add,Delete,Update,Import,Export,Upload', '2023-05-13 13:53:24', '超级管理员', 96, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (91, 'Search', '2023-05-13 13:53:24', '超级管理员', 105, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (92, 'Search,Add,Delete,Update,Import,Export', '2023-05-13 13:53:24', '超级管理员', 99, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (93, 'Search,Add,Delete,Update,Import,Export', '2023-05-13 13:53:24', '超级管理员', 98, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (94, 'Search', '2023-05-13 13:53:24', '超级管理员', 132, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (95, 'Search,Add,Delete,Update,Export', '2023-05-13 13:53:24', '超级管理员', 142, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (96, 'Search,Add,Delete,Update', '2023-05-13 13:53:24', '超级管理员', 97, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (97, 'Search', '2023-05-13 13:53:24', '超级管理员', 123, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (98, 'Search', '2023-05-13 13:54:49', '超级管理员', 121, '超级管理员', '2023-05-13 13:54:49', 2, NULL);
INSERT INTO `Sys_RoleAuth` VALUES (99, 'Search', '2023-05-13 13:54:49', '超级管理员', 126, '超级管理员', '2023-05-13 13:54:49', 2, NULL);

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
  `ColumnCNName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ColumnName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ColumnType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ColumnWidth` int(11) NULL DEFAULT NULL,
  `Columnformat` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DropNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EditColNo` int(11) NULL DEFAULT NULL,
  `EditRowNo` int(11) NULL DEFAULT NULL,
  `EditType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `IsColumnData` int(11) NULL DEFAULT NULL,
  `IsDisplay` int(11) NULL DEFAULT NULL,
  `IsImage` int(11) NULL DEFAULT NULL,
  `IsKey` int(11) NULL DEFAULT NULL,
  `IsNull` int(11) NULL DEFAULT NULL,
  `IsReadDataset` int(11) NULL DEFAULT NULL,
  `Maxlength` int(11) NULL DEFAULT NULL,
  `Modifier` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Script` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SearchColNo` int(11) NULL DEFAULT NULL,
  `SearchRowNo` int(11) NULL DEFAULT NULL,
  `SearchType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Sortable` int(11) NULL DEFAULT NULL,
  `TableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ColumnId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1828 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO `Sys_TableColumn` VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1420, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, 'tree_roles', NULL, 1, 'cascader', 7, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1410, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', 1, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1450, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1390, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1380, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1370, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', 3, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1360, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, 'datetime', 3, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-22 16:08:49', 1, 1350, '', NULL, 1, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1340, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-22 16:08:49', 1, 1330, '', NULL, 1, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1320, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 0, 'switch', 1, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2025-03-22 16:08:49', 1, 1375, '', NULL, 1, 'select', 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (32, NULL, NULL, NULL, NULL, '字典ID', 'Dic_ID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (33, NULL, NULL, NULL, NULL, '字典名称', 'DicName', 'string', 140, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-24 01:35:48', 1, 1290, NULL, NULL, 1, 'textarea', 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (34, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1280, NULL, NULL, 1, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (35, NULL, NULL, NULL, NULL, '配置项', 'Config', 'string', 300, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2025-03-24 01:35:48', 1, 1270, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (36, NULL, NULL, NULL, 12, 'sql语句', 'DbSql', 'string', 200, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2025-03-24 01:35:48', 1, 1260, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (37, NULL, NULL, NULL, NULL, '所在数据库', 'DBServer', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'dbServer', NULL, 0, 'select', NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2025-03-24 01:35:48', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (38, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1240, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (39, NULL, NULL, NULL, NULL, '字典编号', 'DicNo', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-24 01:35:48', 1, 1295, NULL, NULL, 1, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (40, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2025-03-24 01:35:48', 1, 1220, NULL, NULL, NULL, '无', 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (41, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'enable', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2025-03-24 01:35:48', 1, 1210, NULL, NULL, 2, 'select', 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (42, NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (43, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, '超级管理员', '2025-03-24 01:35:48', 1, 1190, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (44, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 01:35:48', 1, 1180, NULL, NULL, 2, 'datetime', 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (45, NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1170, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (46, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, '超级管理员', '2025-03-24 01:35:48', 1, 1160, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (47, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 01:35:48', 1, 1150, NULL, NULL, 2, 'datetime', 0, 'Sys_Dictionary', 3);
INSERT INTO `Sys_TableColumn` VALUES (48, NULL, NULL, NULL, NULL, '', 'DicList_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9950, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (49, NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 1, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9900, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (50, NULL, NULL, NULL, NULL, '数据源key', 'DicValue', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 01:32:07', 1, 9850, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (51, NULL, NULL, NULL, NULL, '数据源文本', 'DicName', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 01:32:07', 1, 9800, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (52, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9750, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (53, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2025-03-24 01:32:07', 1, 9700, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (54, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', 90, '', '2018-06-06 14:12:18', NULL, NULL, 'enable', NULL, 1, 'switch', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9650, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (55, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '无', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9600, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (56, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2025-03-24 01:32:07', 1, 9550, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (57, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 01:32:07', 1, 9500, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (58, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9450, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (59, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2025-03-24 01:32:07', 1, 9400, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (60, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 01:32:07', 1, 9350, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO `Sys_TableColumn` VALUES (61, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2023-05-07 10:46:10', 1, 10000, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (62, NULL, NULL, NULL, 12, '日志类型', 'LogType', 'string', 80, NULL, '2018-06-11 18:22:16', NULL, NULL, 'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-07 10:46:10', 1, 8888, NULL, NULL, 3, 'checkbox', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (63, NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', 70, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, '超级管理员', '2023-05-07 10:46:10', 1, 7990, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (64, NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', 70, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, '超级管理员', '2023-05-07 10:46:10', 1, 7980, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (65, NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', 70, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, '超级管理员', '2023-05-07 10:46:10', 1, 7970, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (66, NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', 80, NULL, '2018-06-11 18:22:16', NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 8700, NULL, NULL, 2, 'selectList', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (67, NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', 140, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-07 10:46:10', 1, 9999, NULL, NULL, 2, 'datetime', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (68, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-07 10:46:10', 1, 880, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (69, NULL, NULL, NULL, NULL, '时长', 'ElapsedTime', 'int', 60, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 8600, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (70, NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-07 10:46:10', 1, 7920, NULL, NULL, 1, 'text', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (71, NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-07 10:46:10', 1, 7910, NULL, NULL, 1, 'text', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (72, NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, '超级管理员', '2023-05-07 10:46:10', 1, 7900, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (73, NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', 110, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, '超级管理员', '2023-05-07 10:46:10', 1, 9000, NULL, NULL, 1, 'text', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (74, NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 7880, NULL, NULL, NULL, 'text', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (75, NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, '超级管理员', '2023-05-07 10:46:10', 1, 9100, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (76, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, 'roles', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 7860, NULL, NULL, 2, 'select', 0, 'Sys_Log', 5);
INSERT INTO `Sys_TableColumn` VALUES (678, NULL, NULL, NULL, NULL, '', 'DepartmentId', 'guid', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2024-12-13 16:27:46', 1, 9950, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (679, NULL, NULL, NULL, NULL, '名称', 'DepartmentName', 'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2024-12-13 16:27:46', 1, 9900, NULL, NULL, 1, 'like', 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (680, NULL, NULL, NULL, NULL, '编号', 'DepartmentCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2024-12-13 16:27:46', 1, 9800, NULL, NULL, 1, 'like', 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (682, NULL, NULL, NULL, NULL, '类型', 'DepartmentType', 'string', 80, NULL, NULL, NULL, NULL, '组织类型', NULL, 3, 'radio', 2, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2024-12-13 16:27:46', 1, 9750, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (683, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'int', 80, NULL, NULL, NULL, NULL, 'enable', NULL, 7, 'select', 2, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-13 16:27:46', 1, 9700, NULL, NULL, 1, 'select', 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (684, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'text', NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2024-12-13 16:27:46', 1, 9650, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (685, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-13 16:27:46', 1, 9600, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (686, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 4, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2024-12-13 16:27:46', 1, 9550, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (687, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-13 16:27:46', 1, 9500, NULL, NULL, 1, 'datetime', 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (688, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-13 16:27:46', 1, 9450, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (689, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2024-12-13 16:27:46', 1, 9400, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (690, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-13 16:27:46', 1, 9350, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (691, NULL, NULL, NULL, NULL, '上级组织', 'ParentId', 'guid', 110, NULL, NULL, NULL, NULL, '部门级联', NULL, 3, 'cascader', 2, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2024-12-13 16:27:46', 1, 9850, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (734, NULL, NULL, NULL, NULL, '', 'Id', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2023-05-19 01:21:03', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (735, NULL, NULL, NULL, NULL, '', 'UserId', 'int', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (736, NULL, NULL, NULL, NULL, '', 'DepartmentId', 'string', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2023-05-19 01:21:03', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (737, NULL, NULL, NULL, NULL, '', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (738, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (739, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2023-05-19 01:21:03', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (740, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (741, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (742, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2023-05-19 01:21:03', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (743, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO `Sys_TableColumn` VALUES (744, NULL, NULL, NULL, NULL, '所属数据库', 'DbServiceId', 'guid', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2024-12-13 16:27:46', 1, 9300, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO `Sys_TableColumn` VALUES (745, NULL, NULL, NULL, NULL, '所属数据库', 'DbServiceId', 'guid', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2025-03-22 16:08:49', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (746, NULL, NULL, NULL, NULL, '数据权限', 'DatAuth', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, '超级管理员', '2025-03-22 16:08:49', 1, 1376, NULL, NULL, NULL, NULL, 0, 'Sys_Role', 2);
INSERT INTO `Sys_TableColumn` VALUES (885, NULL, NULL, NULL, NULL, '', 'WorkFlow_Id', 'guid', 110, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-10-08 17:42:16', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (886, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 140, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2023-10-08 17:42:16', 1, 1150, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (887, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2023-10-08 17:42:16', 1, 1100, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (888, NULL, NULL, NULL, NULL, '功能菜单', 'WorkTableName', 'string', 120, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-10-08 17:42:16', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (889, NULL, NULL, NULL, NULL, '节点信息', 'NodeConfig', 'string', 110, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2023-10-08 17:42:16', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (890, NULL, NULL, NULL, NULL, '连接配置', 'LineConfig', 'string', 110, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2023-10-08 17:42:16', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (891, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 130, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-10-08 17:42:16', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (892, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-10-08 17:42:16', 1, 740, NULL, NULL, 1, 'datetime', 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (893, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (894, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-10-08 17:42:16', 1, 750, NULL, NULL, NULL, '', 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (895, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', 'enable', NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2023-10-08 17:42:16', 1, 1010, NULL, NULL, NULL, 'select', 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (896, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2023-10-08 17:42:16', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (897, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 160, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-10-08 17:42:16', 1, 600, NULL, NULL, NULL, 'datetime', 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (898, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 660, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (899, NULL, NULL, NULL, NULL, '', 'WorkStepFlow_Id', 'guid', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-05-13 16:40:14', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (900, NULL, NULL, NULL, NULL, '流程主表id', 'WorkFlow_Id', 'guid', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-05-13 16:40:14', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (901, NULL, NULL, NULL, NULL, '流程节点Id', 'StepId', 'string', 120, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 16:40:14', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (902, NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 16:40:14', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (903, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批)', 'StepType', 'int', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (904, NULL, NULL, NULL, NULL, '审批用户id或角色id', 'StepValue', 'string', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:14', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (905, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 220, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:14', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (906, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:14', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (907, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (908, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:14', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (909, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2023-05-13 16:40:14', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (910, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:14', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (911, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:14', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (912, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (913, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 880, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (914, NULL, NULL, NULL, NULL, '', 'WorkFlowTable_Id', 'guid', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-05-13 12:59:47', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (915, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'guid', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2023-05-13 12:59:47', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (916, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 130, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1150, NULL, 2, 1, 'like', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (917, NULL, NULL, NULL, NULL, '表主键id', 'WorkTableKey', 'string', 180, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (918, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 100, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (919, NULL, NULL, NULL, NULL, '业务名称', 'WorkTableName', 'string', 120, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1000, NULL, 3, 1, 'like', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (920, NULL, NULL, NULL, NULL, '不用', 'CurrentOrderId', 'int', 90, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (921, NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', 'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 900, NULL, 1, 1, 'select', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (922, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 12:59:47', 1, 850, NULL, 4, 1, 'datetime', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (923, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (924, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 12:59:47', 1, 860, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (925, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2023-05-13 12:59:47', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (926, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 12:59:47', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (927, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 12:59:47', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (928, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (929, NULL, NULL, NULL, NULL, '', 'Sys_WorkFlowTableStep_Id', 'guid', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-05-13 16:40:30', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (930, NULL, NULL, NULL, NULL, '主表id', 'WorkFlowTable_Id', 'guid', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, 0, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 16, '超级管理员', '2023-05-13 16:40:30', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (931, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'guid', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-05-13 16:40:30', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (932, NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', 120, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 16:40:30', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (933, NULL, NULL, NULL, NULL, '节名称', 'StepName', 'string', 180, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 16:40:30', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (934, NULL, NULL, NULL, NULL, '审批类型', 'StepType', 'int', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (935, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批)', 'StepValue', 'string', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:30', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (936, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (937, NULL, NULL, NULL, NULL, '', 'Remark', 'string', 220, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:30', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (938, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:30', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (939, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (940, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:30', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (941, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2023-05-13 16:40:30', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (942, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:30', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (943, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:30', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (944, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (945, NULL, NULL, NULL, NULL, '审核人id', 'AuditId', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (946, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (947, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (948, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (949, NULL, NULL, NULL, NULL, '', 'Id', 'guid', 110, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2022-09-07 01:42:45', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (950, NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', 120, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, 0, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-09-07 01:42:45', 1, 1250, NULL, NULL, 1, 'like', 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (951, NULL, NULL, NULL, NULL, '任务分组', 'GroupName', 'string', 100, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, 0, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-09-07 01:42:45', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (952, NULL, NULL, NULL, NULL, 'Corn表达式', 'CronExpression', 'string', 120, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, 0, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2022-09-07 01:42:45', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (953, NULL, NULL, NULL, 12, 'Url地址', 'ApiUrl', 'string', 150, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 01:42:45', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (954, NULL, NULL, NULL, NULL, 'AuthKey', 'AuthKey', 'string', 100, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 6, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2022-09-07 01:42:45', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (955, NULL, NULL, NULL, NULL, 'AuthValue', 'AuthValue', 'string', 100, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 6, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2022-09-07 01:42:45', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (956, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 120, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 01:42:45', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (957, NULL, NULL, NULL, NULL, '最后执行执行', 'LastRunTime', 'DateTime', 150, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 0, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-07 01:42:45', 1, 900, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (958, NULL, NULL, NULL, NULL, '运行状态', 'Status', 'int', 90, NULL, '2022-09-05 03:09:08', 1, '超级管理员', '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (959, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (960, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 10, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, '超级管理员', '2022-09-07 01:42:45', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (961, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 10, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, '超级管理员', '2022-09-07 01:42:45', 1, 700, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (962, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (963, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-07 01:42:45', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (964, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 110, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-07 01:42:45', 1, 550, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (965, NULL, NULL, NULL, NULL, '', 'LogId', 'guid', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2022-09-05 23:49:32', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (966, NULL, NULL, NULL, NULL, '任务id', 'Id', 'guid', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2022-09-05 23:49:32', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (967, NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', 120, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-09-05 23:49:32', 1, 1100, NULL, NULL, 1, 'like', 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (968, NULL, NULL, NULL, NULL, '耗时(秒)', 'ElapsedTime', 'int', 90, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 1050, NULL, NULL, 1, 'range', 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (969, NULL, NULL, NULL, NULL, '开始时间', 'StratDate', 'DateTime', 150, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 1000, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (970, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (971, NULL, NULL, NULL, NULL, '是否成功', 'Result', 'int', 100, NULL, '2022-09-05 03:14:51', 1, '超级管理员', 'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 900, NULL, NULL, 1, 'select', 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (972, NULL, NULL, NULL, NULL, '返回内容', 'ResponseContent', 'string', 250, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-05 23:49:32', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (973, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (974, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-05 23:49:32', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (975, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (976, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (977, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-05 23:49:32', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (978, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (979, NULL, NULL, NULL, 12, 'post参数', 'PostData', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 8, 'textarea', NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-07 01:42:45', 1, 1060, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (980, NULL, NULL, NULL, NULL, '请求方式', 'Method', 'string', 110, NULL, NULL, NULL, NULL, '请求方式', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-09-07 01:42:45', 1, 1160, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (981, NULL, NULL, NULL, NULL, '超时时间(秒)', 'TimeOut', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 1152, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO `Sys_TableColumn` VALUES (982, NULL, NULL, NULL, NULL, '异常信息', 'ErrorMsg', 'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-05 23:49:32', 1, 840, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO `Sys_TableColumn` VALUES (983, NULL, NULL, NULL, NULL, '下一个审批节点', 'NextStepIds', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (984, NULL, NULL, NULL, NULL, '父级节点', 'ParentId', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 2000, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (985, NULL, NULL, NULL, NULL, '审核未通过(返回上一节点,流程重新开始,流程结束)', 'AuditRefuse', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (986, NULL, NULL, NULL, NULL, '驳回(返回上一节点,流程重新开始,流程结束)', 'AuditBack', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (987, NULL, NULL, NULL, NULL, '审批方式(启用会签)', 'AuditMethod', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (988, NULL, NULL, NULL, NULL, '审核后发送邮件通知', 'SendMail', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (989, NULL, NULL, NULL, NULL, '审核条件', 'Filters', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (990, NULL, NULL, NULL, NULL, '审核中数据是否可以编辑', 'AuditingEdit', 'int', 80, NULL, NULL, NULL, NULL, 'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 1010, NULL, NULL, 1, 'select', 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (991, NULL, NULL, NULL, NULL, '节点属性(start、node、end))', 'StepAttrType', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (992, NULL, NULL, NULL, NULL, '节点属性(start、node、end))', 'StepAttrType', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (993, NULL, NULL, NULL, NULL, '当前审核节点ID', 'CurrentStepId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 12:59:47', 1, 960, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (994, NULL, NULL, NULL, NULL, '', 'ParentId', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (995, NULL, NULL, NULL, NULL, '', 'NextStepId', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (996, NULL, NULL, NULL, NULL, '', 'Id', 'guid', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-04-26 11:54:08', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (997, NULL, NULL, NULL, NULL, '', 'WorkFlowTable_Id', 'guid', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-04-26 11:54:08', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (998, NULL, NULL, NULL, NULL, '', 'WorkFlowTableStep_Id', 'guid', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-04-26 11:54:08', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (999, NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', 120, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-04-26 11:54:08', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1000, NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', 180, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-04-26 11:54:08', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1001, NULL, NULL, NULL, NULL, '', 'AuditId', 'int', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-04-26 11:54:08', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1002, NULL, NULL, NULL, NULL, '', 'Auditor', 'string', 120, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-04-26 11:54:08', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1003, NULL, NULL, NULL, NULL, '', 'AuditStatus', 'int', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-04-26 11:54:08', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1004, NULL, NULL, NULL, NULL, '', 'AuditResult', 'string', 220, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2023-04-26 11:54:08', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1005, NULL, NULL, NULL, NULL, '', 'AuditDate', 'DateTime', 150, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-04-26 11:54:08', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1006, NULL, NULL, NULL, NULL, '', 'Remark', 'string', 220, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2023-04-26 11:54:08', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1007, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-04-26 11:54:08', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO `Sys_TableColumn` VALUES (1008, NULL, NULL, NULL, NULL, '当前审核节点名称', 'StepName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 12:59:47', 1, 955, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO `Sys_TableColumn` VALUES (1009, NULL, NULL, NULL, NULL, '权重(相同条件权重大的优先匹配)', 'Weight', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 1011, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO `Sys_TableColumn` VALUES (1010, NULL, NULL, NULL, NULL, '权重(相同条件权重大的优先匹配)', 'Weight', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO `Sys_TableColumn` VALUES (1011, NULL, NULL, NULL, NULL, '', 'Weight', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO `Sys_TableColumn` VALUES (1203, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9950, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1204, 1, 0, 1, NULL, '帐号', 'UserName', 'string', 100, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, '', 1, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2025-03-24 00:55:19', 1, 9900, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1205, NULL, NULL, NULL, NULL, '姓名', 'UserTrueName', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, 'text', 1, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2025-03-24 00:55:19', 1, 9850, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1206, NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', 60, '', NULL, NULL, NULL, 'gender', NULL, 5, 'select', 1, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9700, '', NULL, 1, 'select', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1207, NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', 70, '', NULL, NULL, NULL, '', NULL, 20, 'img', NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2025-03-24 00:55:19', 1, 9600, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1208, 0, 0, 1, NULL, '角色', 'Role_Id', 'int', 140, '', '2018-06-14 16:44:15', NULL, NULL, 'tree_roles', NULL, 5, 'cascader', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9750, '', NULL, 1, 'cascader', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1211, NULL, NULL, NULL, NULL, '邮箱', 'Email', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'mail', 2, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 00:55:19', 1, 9500, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1212, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2025-03-24 00:55:19', 1, 9450, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1213, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 0, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 9800, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1214, NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9050, '', NULL, 1, 'datetime', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1215, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 11, '超级管理员', '2025-03-24 00:55:19', 1, 9350, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1216, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9300, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1217, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2025-03-24 00:55:19', 1, 9150, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1218, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', 80, '', '2018-06-14 16:44:15', NULL, NULL, 'enable', NULL, 10, 'select', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2025-03-24 00:55:19', 1, 9550, '', NULL, NULL, 'select', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1219, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9100, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1220, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 1, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8950, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1221, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, 'datetime', NULL, 1, 0, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9000, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1222, NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9250, '', NULL, NULL, 'datetime', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1223, NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9200, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1224, NULL, NULL, NULL, 12, '备注', 'Remark', 'string', 120, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 16, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 9400, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1225, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8900, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1226, NULL, NULL, NULL, 12, '组织构架', 'DeptIds', 'string', 220, NULL, NULL, NULL, NULL, '部门级联', NULL, 12, 'treeSelect', NULL, 1, 0, NULL, 0, 1, 0, 2000, '超级管理员', '2025-03-24 00:55:19', 1, 9650, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1247, NULL, NULL, NULL, NULL, '', 'id', 'int', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, NULL, 1, 0, 0, 4, '超级管理员', '2024-12-14 17:25:45', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1248, NULL, NULL, NULL, NULL, '编码', 'code', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2024-12-14 17:25:45', 1, 900, NULL, NULL, NULL, 'like', 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1249, NULL, NULL, NULL, NULL, '名称', 'name', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 1, 0, 40, '超级管理员', '2024-12-14 17:25:45', 1, 850, NULL, NULL, 1, NULL, 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1250, NULL, NULL, NULL, NULL, '上级编码', 'parentId', 'int', 70, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-14 17:25:45', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1251, NULL, NULL, NULL, NULL, '级别', 'level', 'int', 60, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 2, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-14 17:25:45', 1, 750, NULL, NULL, 1, NULL, 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1252, NULL, NULL, NULL, NULL, '完整地址', 'mername', 'string', 170, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 2, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2024-12-14 17:25:45', 1, 700, NULL, NULL, 1, 'like', 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1253, NULL, NULL, NULL, NULL, '经度', 'Lng', 'float', 70, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-14 17:25:45', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1254, NULL, NULL, NULL, NULL, '纬度', 'Lat', 'float', 70, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-14 17:25:45', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1255, NULL, NULL, NULL, NULL, '拼音', 'pinyin', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2024-12-14 17:25:45', 1, 550, NULL, NULL, 1, 'like', 0, 'Sys_Region', 20);
INSERT INTO `Sys_TableColumn` VALUES (1270, NULL, NULL, NULL, NULL, '客户ID', 'CustomerID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:08:07', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1271, NULL, NULL, NULL, NULL, '客户名称', 'CustomerName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1272, NULL, NULL, NULL, NULL, '联系人', 'ContactPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1273, NULL, NULL, NULL, NULL, '联系电话', 'ContactPhone', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1274, NULL, NULL, NULL, NULL, '邮箱地址', 'Email', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1275, NULL, NULL, NULL, NULL, '联系地址', 'Address', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1276, NULL, NULL, NULL, NULL, '客户类型', 'CustomerType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1277, NULL, NULL, NULL, NULL, '信用评级', 'CreditRating', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1278, NULL, NULL, NULL, NULL, '业务范围', 'BusinessScope', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1279, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 20, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1280, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1281, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1282, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1283, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1284, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1285, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO `Sys_TableColumn` VALUES (1286, NULL, NULL, NULL, NULL, '供应商ID', 'SupplierID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:14:21', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1287, NULL, NULL, NULL, NULL, '供应商名', 'SupplierName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1288, NULL, NULL, NULL, NULL, '联系人', 'ContactPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1289, NULL, NULL, NULL, NULL, '联系电话', 'ContactPhone', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1290, NULL, NULL, NULL, NULL, '邮箱地址', 'Email', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1291, NULL, NULL, NULL, NULL, '联系地址', 'Address', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1292, NULL, NULL, NULL, NULL, '供应商类型', 'SupplierType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1293, NULL, NULL, NULL, NULL, '供应范围', 'ProductRange', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1294, NULL, NULL, NULL, NULL, '质量评级', 'QualityRating', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1295, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 140, NULL, NULL, NULL, NULL, NULL, NULL, 8, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1296, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1297, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1298, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1299, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1300, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1301, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO `Sys_TableColumn` VALUES (1302, NULL, NULL, NULL, NULL, '设备ID', 'DeviceID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:37:04', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1303, NULL, NULL, NULL, NULL, '产线ID', 'ProductionLineID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:37:04', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1304, NULL, NULL, NULL, NULL, '设备名称', 'DeviceName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1305, NULL, NULL, NULL, NULL, '设备型号', 'DeviceModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1306, NULL, NULL, NULL, NULL, '制造商', 'Manufacturer', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1307, NULL, NULL, NULL, NULL, '购买日期', 'PurchaseDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1308, NULL, NULL, NULL, NULL, '保修日期', 'WarrantyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1309, NULL, NULL, NULL, NULL, '设备状态', 'Status', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1310, NULL, NULL, NULL, NULL, '线上位置', 'LocationOnLine', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1311, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1312, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1313, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1314, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1315, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1316, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1317, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO `Sys_TableColumn` VALUES (1318, NULL, NULL, NULL, NULL, '物料ID', 'MaterialID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 11:17:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1319, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1320, NULL, NULL, NULL, NULL, '物料类型', 'MaterialType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1321, NULL, NULL, NULL, NULL, '规格型号', 'Specification', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9650, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1322, NULL, NULL, NULL, NULL, '单位', 'Unit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', NULL, 10, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9600, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1323, NULL, NULL, NULL, NULL, '单价', 'Price', 'decimal', 70, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1327, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1328, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1330, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1332, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1335, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1337, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1338, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1341, NULL, NULL, NULL, NULL, '仓库ID', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 00:26:37', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1343, NULL, NULL, NULL, NULL, '仓库编码', 'WarehouseCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1345, NULL, NULL, NULL, NULL, '仓库名称', 'WarehouseName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1347, NULL, NULL, NULL, NULL, '仓库类型', 'WarehouseType', 'string', 90, NULL, NULL, NULL, NULL, '仓库类型', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1150, NULL, NULL, 1, 'select', 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1349, NULL, NULL, NULL, NULL, '仓库面积', 'WarehouseArea', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 1100, NULL, NULL, NULL, NULL, 1, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1351, NULL, NULL, NULL, NULL, '仓库地址', 'WarehouseAddress', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1353, NULL, NULL, NULL, NULL, '仓库电话', 'WarehousePhone', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1000, NULL, NULL, 1, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1355, NULL, NULL, NULL, NULL, '仓库管理员', 'WarehouseManager', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1357, NULL, NULL, NULL, NULL, '启用状态', 'WarehouseStatus', 'string', 60, NULL, NULL, NULL, NULL, 'enable', NULL, 6, 'radio', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1359, NULL, NULL, NULL, NULL, '仓库容量', 'WarehouseCapacity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 850, NULL, NULL, NULL, NULL, 1, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1360, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1361, NULL, NULL, NULL, NULL, '产线ID', 'ProductionLineID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:37:33', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1362, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1363, NULL, NULL, NULL, NULL, '产线名称', 'LineName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1364, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1365, NULL, NULL, NULL, NULL, '产线类型', 'LineType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1366, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1367, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1368, NULL, NULL, NULL, NULL, '产能信息', 'Capacity', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1369, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO `Sys_TableColumn` VALUES (1370, NULL, NULL, NULL, NULL, '产线状态', 'Status', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1371, NULL, NULL, NULL, NULL, '负责人', 'ResponsiblePerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1372, NULL, NULL, NULL, NULL, '产线位置', 'Location', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1373, NULL, NULL, NULL, NULL, '启用日期', 'StartDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1374, NULL, NULL, NULL, NULL, '停用日期', 'EndDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1375, NULL, NULL, NULL, 12, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1376, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1377, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1378, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1379, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1380, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1381, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO `Sys_TableColumn` VALUES (1382, NULL, NULL, NULL, NULL, '库存ID', 'InventoryID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:30:20', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1383, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1384, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1385, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1386, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1387, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '货位', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:30:20', 1, 9700, NULL, NULL, 1, 'select', 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1388, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:30:20', 1, 9650, NULL, NULL, 1, 'select', 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1389, NULL, NULL, NULL, NULL, '库存数量', 'InventoryQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9600, NULL, NULL, NULL, NULL, 1, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1390, NULL, NULL, NULL, NULL, '单位', 'InventoryUnit', 'string', 90, NULL, NULL, NULL, NULL, '物料单位', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1391, NULL, NULL, NULL, NULL, '库存成本', 'InventoryCost', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1392, NULL, NULL, NULL, NULL, '库存状态', 'InventoryStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1393, NULL, NULL, NULL, NULL, '入库日期', 'InboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9400, NULL, NULL, 1, 'datetime', 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1394, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1395, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1396, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1397, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9150, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1398, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1399, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9100, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO `Sys_TableColumn` VALUES (1400, NULL, NULL, NULL, NULL, '货位ID', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 00:42:18', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1401, NULL, NULL, NULL, NULL, '所属仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 00:42:18', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1402, NULL, NULL, NULL, NULL, '货位编码', 'LocationCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1403, NULL, NULL, NULL, NULL, '货位名称', 'LocationName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1404, NULL, NULL, NULL, NULL, '货位类型', 'LocationType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1405, NULL, NULL, NULL, NULL, '货位容量', 'LocationCapacity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1406, NULL, NULL, NULL, NULL, '货位状态', 'LocationStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1407, NULL, NULL, NULL, NULL, '货位行号', 'LocationRow', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1408, NULL, NULL, NULL, NULL, '货位列号', 'LocationColumn', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1409, NULL, NULL, NULL, NULL, '货位层数', 'LocationFloor', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1410, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1411, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1412, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1413, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1414, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1415, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO `Sys_TableColumn` VALUES (1416, NULL, NULL, NULL, NULL, '出库ID', 'OutboundID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:30:09', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1417, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 130, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1418, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1300, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1419, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1420, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1421, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:30:09', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1422, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '货位', 3, 9, 'select', NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2025-03-17 01:30:09', 1, 1100, NULL, NULL, 1, 'select', 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1423, NULL, NULL, NULL, NULL, '出库数量', 'OutboundQuantity', 'int', 70, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 1050, NULL, NULL, 3, 'range', 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1424, NULL, NULL, NULL, NULL, '出库单位', 'OutboundUnit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', 3, 15, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1000, NULL, NULL, 3, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1425, NULL, NULL, NULL, NULL, '出库日期', 'OutboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, 3, 15, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 950, NULL, NULL, 3, 'date', 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1426, NULL, NULL, NULL, NULL, '维修ID', 'RepairID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:00:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1427, NULL, NULL, NULL, NULL, '出库操作员', 'OutboundOperator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1428, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:00:16', 1, 9900, NULL, NULL, 1, 'select', 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1429, NULL, NULL, NULL, NULL, '出库原因', 'OutboundReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1430, NULL, NULL, NULL, NULL, '维修日期', 'RepairDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9850, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1431, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1432, NULL, NULL, NULL, NULL, '维修原因', 'RepairReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1433, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 750, NULL, NULL, 3, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1434, NULL, NULL, NULL, NULL, '维修内容', 'RepairContent', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1435, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 700, NULL, NULL, 3, 'datetime', 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1436, NULL, NULL, NULL, NULL, '维修人员', 'RepairPerson', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1437, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1438, NULL, NULL, NULL, NULL, '维修成本', 'RepairCost', 'decimal', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1439, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1440, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO `Sys_TableColumn` VALUES (1441, NULL, NULL, NULL, NULL, '维修状态', 'RepairStatus', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1442, NULL, NULL, NULL, NULL, '维修开始时间', 'RepairStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'datetime', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1443, NULL, NULL, NULL, NULL, '入库ID', 'InboundID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1444, NULL, NULL, NULL, NULL, '维修结束时间', 'RepairEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1445, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1446, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1447, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1300, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1448, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1449, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1450, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1451, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1452, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1453, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1454, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO `Sys_TableColumn` VALUES (1455, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '货位', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1150, NULL, NULL, 1, 'select', 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1456, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 6, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1100, NULL, NULL, 1, 'select', 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1457, NULL, NULL, NULL, NULL, '入库数量', 'InboundQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1458, NULL, NULL, NULL, NULL, '入库单位', 'InboundUnit', 'string', 90, NULL, NULL, NULL, NULL, '物料单位', NULL, 8, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1459, NULL, NULL, NULL, NULL, '入库日期', 'InboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1460, NULL, NULL, NULL, NULL, '设备ID', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:53:09', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1461, NULL, NULL, NULL, NULL, '入库操作员', 'InboundOperator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1462, NULL, NULL, NULL, NULL, '入库原因', 'InboundReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1463, NULL, NULL, NULL, NULL, '设备编码', 'EquipmentCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9900, NULL, NULL, 1, 'like', 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1464, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1465, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9850, NULL, NULL, 1, 'like', 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1466, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1467, NULL, NULL, NULL, NULL, '设备类型', 'EquipmentType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1468, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1469, NULL, NULL, NULL, NULL, '制造商', 'Manufacturer', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1470, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1471, NULL, NULL, NULL, NULL, '购买日期', 'PurchaseDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9700, NULL, NULL, 1, 'date', 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1472, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1473, NULL, NULL, NULL, NULL, '保修期', 'WarrantyPeriod', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1474, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO `Sys_TableColumn` VALUES (1475, NULL, NULL, NULL, NULL, '安装位置', 'InstallationLocation', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1476, NULL, NULL, NULL, NULL, '设备状态', 'EquipmentStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9550, NULL, NULL, 1, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1477, NULL, NULL, NULL, NULL, '责任人', 'ResponsiblePerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1478, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1479, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1480, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1481, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1482, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1483, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO `Sys_TableColumn` VALUES (1484, NULL, NULL, NULL, NULL, '保养ID', 'MaintenanceID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:05:27', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1485, NULL, NULL, NULL, NULL, '设备信息', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:05:27', 1, 1250, NULL, NULL, 1, 'select', 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1486, NULL, NULL, NULL, NULL, '保养日期', 'MaintenanceDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 1200, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1487, NULL, NULL, NULL, NULL, '保养类型', 'MaintenanceType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1488, NULL, NULL, NULL, NULL, '保养内容', 'MaintenanceContent', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1489, NULL, NULL, NULL, NULL, '保养人员', 'MaintenancePerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1490, NULL, NULL, NULL, NULL, '保养状态', 'MaintenanceStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1491, NULL, NULL, NULL, NULL, '下次保养日期', 'NextMaintenanceDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1492, NULL, NULL, NULL, NULL, '保养成本', 'MaintenanceCost', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1493, NULL, NULL, NULL, NULL, '保养备注', 'MaintenanceRemarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1494, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1495, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1496, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1497, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1498, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1499, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO `Sys_TableColumn` VALUES (1500, NULL, NULL, NULL, NULL, '故障记录ID', 'FaultRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:03:50', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1501, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:03:50', 1, 1250, NULL, NULL, 1, 'select', 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1502, NULL, NULL, NULL, NULL, '故障日期', 'FaultDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 1200, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1503, NULL, NULL, NULL, NULL, '故障类型', 'FaultType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1504, NULL, NULL, NULL, NULL, '故障描述', 'FaultDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1505, NULL, NULL, NULL, NULL, '故障影响', 'FaultImpact', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1506, NULL, NULL, NULL, NULL, '故障报告人', 'FaultReportedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1000, NULL, NULL, 1, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1507, NULL, NULL, NULL, NULL, '故障状态', 'FaultStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1508, NULL, NULL, NULL, NULL, '排查开始时间', 'TroubleshootingStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1509, NULL, NULL, NULL, NULL, '排查结束时间', 'TroubleshootingEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1510, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1511, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1512, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1513, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1514, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1515, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO `Sys_TableColumn` VALUES (1516, NULL, NULL, NULL, NULL, '订单ID', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:20:52', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1517, NULL, NULL, NULL, NULL, '订单编号', 'OrderNumber', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1518, NULL, NULL, NULL, NULL, '客户名称', 'CustomerName', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1519, NULL, NULL, NULL, NULL, '订单日期', 'OrderDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9800, NULL, NULL, 1, 'date', 1, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1520, NULL, NULL, NULL, NULL, '交货日期', 'DeliveryDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 0, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9750, NULL, NULL, 1, 'date', 1, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1521, NULL, NULL, NULL, NULL, '工序ID', 'ProcessID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:24:19', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1522, NULL, NULL, NULL, NULL, '排产状态', 'OrderStatus', 'string', 80, NULL, NULL, NULL, NULL, '排产状态', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9600, NULL, NULL, 1, 'select', 1, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1523, NULL, NULL, NULL, NULL, '工序编码', 'ProcessCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1525, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1526, NULL, NULL, NULL, NULL, '工序名称', 'ProcessName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1527, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1528, NULL, NULL, NULL, NULL, '工序类型', 'ProcessType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1529, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1530, NULL, NULL, NULL, NULL, '工序顺序', 'ProcessSequence', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1531, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1532, NULL, NULL, NULL, NULL, '工序描述', 'ProcessDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1533, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1534, NULL, NULL, NULL, NULL, '工作中心', 'WorkCenter', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1535, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1536, NULL, NULL, NULL, NULL, '标准工时', 'StandardWorkingHours', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1537, NULL, NULL, NULL, NULL, '工序状态', 'ProcessStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1538, NULL, NULL, NULL, NULL, '责任人', 'ResponsibleWorker', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1539, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1540, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1541, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1542, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1543, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1544, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO `Sys_TableColumn` VALUES (1545, NULL, NULL, NULL, NULL, 'ID', 'ReportID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:35:37', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1546, NULL, NULL, NULL, NULL, '工序名称', 'ProcessID', 'string', 90, NULL, NULL, NULL, NULL, '工序', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:35:37', 1, 1250, NULL, NULL, 1, 'select', 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1547, NULL, NULL, NULL, NULL, '统计日期', 'ReportDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1548, NULL, NULL, NULL, NULL, '完成数量', 'CompletedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 1150, NULL, NULL, 1, 'range', 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1549, NULL, NULL, NULL, NULL, '不良数量', 'DefectiveQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 1100, NULL, NULL, 1, 'range', 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1550, NULL, NULL, NULL, NULL, '统计人', 'ReportedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1551, NULL, NULL, NULL, NULL, '汇报状态', 'ReportStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1552, NULL, NULL, NULL, NULL, '备注', 'ReportRemarks', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1553, NULL, NULL, NULL, NULL, '工序开始时间', 'StartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1554, NULL, NULL, NULL, NULL, '工序结束时间', 'EndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1555, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1556, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1557, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1558, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1559, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1560, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO `Sys_TableColumn` VALUES (1561, NULL, NULL, NULL, NULL, '路线ID', 'RouteID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1562, NULL, NULL, NULL, NULL, '工序', 'ProcessID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1563, NULL, NULL, NULL, NULL, '产品ID', 'ProductID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1564, NULL, NULL, NULL, NULL, '路线名称', 'ProductName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1565, NULL, NULL, NULL, NULL, '路线顺序', 'RouteSequence', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1566, NULL, NULL, NULL, NULL, '路线描述', 'RouteDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1567, NULL, NULL, NULL, NULL, '前工序', 'PreProcessID', 'string', 90, NULL, NULL, NULL, NULL, '工序', NULL, 7, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9650, NULL, NULL, 1, 'select', 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1568, NULL, NULL, NULL, NULL, '后工序', 'NextProcessID', 'string', 90, NULL, NULL, NULL, NULL, '工序', NULL, 9, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9600, NULL, NULL, 1, 'select', 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1569, NULL, NULL, NULL, NULL, '启用状态', 'RouteStatus', 'string', 90, NULL, NULL, NULL, NULL, 'enable', NULL, 12, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1570, NULL, NULL, NULL, NULL, '路线责任人', 'RouteResponsible', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1571, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1572, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1573, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1574, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1575, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1576, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO `Sys_TableColumn` VALUES (1577, NULL, NULL, NULL, NULL, '计划明细ID', 'PlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 14:43:01', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1578, NULL, NULL, NULL, NULL, '订单ID', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 14:43:01', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1579, NULL, NULL, NULL, NULL, '物料编码', 'MaterialCode', 'string', 100, NULL, NULL, NULL, NULL, '物料列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1580, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1581, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1582, NULL, NULL, NULL, NULL, '单位', 'Unit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1584, NULL, NULL, NULL, NULL, '订单数量', 'PlanQuantity', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1586, NULL, NULL, NULL, NULL, '计划开始时间', 'PlannedStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1588, NULL, NULL, NULL, NULL, '计划结束时间', 'PlannedEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1590, NULL, NULL, NULL, NULL, '计划状态', 'PlanStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1592, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1594, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1596, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1598, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1600, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1602, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO `Sys_TableColumn` VALUES (1608, NULL, NULL, NULL, NULL, '变更记录ID', 'ChangeRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 19:32:23', 1, 1500, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1609, NULL, NULL, NULL, NULL, '计划明细ID', 'PlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 19:32:23', 1, 1450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1610, NULL, NULL, NULL, NULL, '订单编号', 'OrderNumber', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 1400, NULL, NULL, 1, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1611, NULL, NULL, NULL, NULL, '客户名称', 'CustomerName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1612, NULL, NULL, NULL, NULL, '订单日期', 'OrderDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1300, NULL, NULL, 1, 'date', 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1613, NULL, NULL, NULL, NULL, '变更日期', 'ChangeDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1250, NULL, NULL, 1, 'date', 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1614, NULL, NULL, NULL, NULL, '原计划数量', 'OriginalPlanQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1200, NULL, NULL, 1, 'range', 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1615, NULL, NULL, NULL, NULL, '新计划数量', 'NewPlanQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1616, NULL, NULL, NULL, NULL, '原计划开始时间', 'OriginalPlannedStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1617, NULL, NULL, NULL, NULL, '新计划开始时间', 'NewPlannedStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1618, NULL, NULL, NULL, NULL, '原计划结束时间', 'OriginalPlannedEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1619, NULL, NULL, NULL, NULL, '新计划结束时间', 'NewPlannedEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1620, NULL, NULL, NULL, NULL, '变更原因', 'ChangeReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1621, NULL, NULL, NULL, NULL, '变更人', 'ChangedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1622, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1623, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1624, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1625, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1626, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1627, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO `Sys_TableColumn` VALUES (1628, NULL, NULL, NULL, NULL, '报工ID', 'ReportingID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 16:02:05', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1629, NULL, NULL, NULL, NULL, '报工单号', 'ReportingNumber', 'string', 125, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1630, NULL, NULL, NULL, NULL, '订单', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 16:02:05', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1631, NULL, NULL, NULL, NULL, '报工人', 'ReportedBy', 'string', 90, NULL, NULL, NULL, NULL, '用户列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9800, NULL, NULL, 1, 'select', 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1632, NULL, NULL, NULL, NULL, '报工时间', 'ReportingTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9750, NULL, NULL, 1, 'datetime', 1, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1634, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1635, NULL, NULL, NULL, NULL, '明细ID', 'DetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 15:57:59', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1636, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1637, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9300, NULL, NULL, NULL, 'datetime', 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1638, NULL, NULL, NULL, NULL, '报工ID', 'ReportingID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 15:57:59', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1639, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1640, NULL, NULL, NULL, NULL, '报工物料', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, '物料列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1641, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1642, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1643, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1644, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1645, NULL, NULL, NULL, NULL, '报工数量', 'ReportedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1646, NULL, NULL, NULL, NULL, '合格数量', 'AcceptedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1647, NULL, NULL, NULL, NULL, '不合格数量', 'RejectedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1650, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1651, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1652, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1653, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1654, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1655, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1656, NULL, NULL, NULL, NULL, '不良品ID', 'DefectiveID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 18:06:50', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1657, NULL, NULL, NULL, NULL, '报工ID', 'ReportingID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 18:06:50', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1658, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1659, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1150, NULL, NULL, 1, 'like', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1660, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1661, NULL, NULL, NULL, NULL, '不良品数量', 'DefectiveQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 1050, NULL, NULL, 1, 'range', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1662, NULL, NULL, NULL, NULL, '缺陷类型', 'DefectType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1663, NULL, NULL, NULL, NULL, '缺陷原因', 'DefectReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1664, NULL, NULL, NULL, NULL, '处理方式', 'DisposalMethod', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1665, NULL, NULL, NULL, NULL, '处理状态', 'DisposalStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1666, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1667, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1668, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 700, NULL, NULL, 1, 'datetime', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1669, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1670, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1671, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO `Sys_TableColumn` VALUES (1672, NULL, NULL, NULL, NULL, '检验计划ID', 'InspectionPlanID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:50:26', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1673, NULL, NULL, NULL, NULL, '检验单号', 'InspectionPlanNumber', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1674, NULL, NULL, NULL, NULL, '订单ID', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 01:50:26', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1676, NULL, NULL, NULL, NULL, '检验开始时间', 'PlanStartTime', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9750, NULL, NULL, 1, 'datetime', 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1677, NULL, NULL, NULL, NULL, '检验结束时间', 'PlanEndTime', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9700, NULL, NULL, 1, 'datetime', 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1678, NULL, NULL, NULL, NULL, '处理记录ID', 'DisposalRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, NULL, NULL, NULL, 1100, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1679, NULL, NULL, NULL, NULL, '检验人', 'ResponsiblePerson', 'string', 90, NULL, NULL, NULL, NULL, '用户列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9650, NULL, NULL, 1, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1680, NULL, NULL, NULL, NULL, '不良品ID', 'DefectiveID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, NULL, NULL, NULL, 1050, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1681, NULL, NULL, NULL, NULL, '计划状态', 'PlanStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1682, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1683, NULL, NULL, NULL, NULL, '处理人', 'DisposalPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 1000, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1684, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1685, NULL, NULL, NULL, NULL, '处理开始时间', 'DisposalStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 950, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1686, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1687, NULL, NULL, NULL, NULL, '处理结束时间', 'DisposalEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 900, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1688, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1689, NULL, NULL, NULL, NULL, '处理结果', 'DisposalResult', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 850, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1690, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1691, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1692, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO `Sys_TableColumn` VALUES (1693, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 750, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1694, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 700, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1695, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 650, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1696, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 600, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1697, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 550, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO `Sys_TableColumn` VALUES (1698, NULL, NULL, NULL, NULL, '明细ID', 'InspectionPlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:48:10', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1699, NULL, NULL, NULL, NULL, '检验id', 'InspectionPlanID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 01:48:10', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1700, NULL, NULL, NULL, NULL, '检验物料', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, '物料列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1701, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1702, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1703, NULL, NULL, NULL, NULL, '检验数量', 'QuantityToInspect', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1704, NULL, NULL, NULL, NULL, '检验方法', 'InspectionMethod', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1705, NULL, NULL, NULL, NULL, '检验标准', 'InspectionStandard', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1706, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1707, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1708, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1709, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1710, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1711, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO `Sys_TableColumn` VALUES (1712, NULL, NULL, NULL, NULL, '排班计划ID', 'SchedulePlanID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 02:00:34', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1713, NULL, NULL, NULL, NULL, '排班名称', 'PlanName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1714, NULL, NULL, NULL, NULL, '产线名称', 'ProductionLine', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 1000, NULL, NULL, 1, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1715, NULL, NULL, NULL, NULL, '班组名称', 'TeamName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 950, NULL, NULL, 1, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1716, NULL, NULL, NULL, NULL, '处理记录ID', 'DisposalRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, NULL, NULL, NULL, 1150, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1717, NULL, NULL, NULL, NULL, '开始时间', 'StartDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 900, NULL, NULL, 1, 'datetime', 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1718, NULL, NULL, NULL, NULL, '检验记录ID', 'InspectionRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, NULL, NULL, NULL, 1100, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1719, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 850, NULL, NULL, 1, 'datetime', 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1720, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1721, NULL, NULL, NULL, NULL, '处理方法（如返工、降级使用、报废）', 'DisposalMethod', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 1050, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1722, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1723, NULL, NULL, NULL, NULL, '处理人', 'DisposalPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 1000, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1724, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1725, NULL, NULL, NULL, NULL, '处理开始时间', 'DisposalStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 950, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1726, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1727, NULL, NULL, NULL, NULL, '处理结束时间', 'DisposalEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 900, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1728, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1729, NULL, NULL, NULL, NULL, '处理结果', 'DisposalResult', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 850, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1730, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO `Sys_TableColumn` VALUES (1731, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1732, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 750, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1733, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 700, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1734, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 650, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1735, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 600, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1736, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 550, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO `Sys_TableColumn` VALUES (1737, NULL, NULL, NULL, NULL, '检验记录ID', 'InspectionRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:56:36', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1738, NULL, NULL, NULL, NULL, '检验计划明细ID', 'InspectionPlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 01:56:36', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1739, NULL, NULL, NULL, NULL, '检验单号', 'InspectionNumber', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1740, NULL, NULL, NULL, NULL, '检验员', 'Inspector', 'string', 70, NULL, NULL, NULL, NULL, '用户列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1741, NULL, NULL, NULL, NULL, '检验时间', 'InspectionTime', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 1100, NULL, NULL, NULL, NULL, 1, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1742, NULL, NULL, NULL, NULL, '实际检验数量', 'InspectedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1743, NULL, NULL, NULL, NULL, '合格数量', 'PassedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 1000, NULL, NULL, NULL, NULL, 1, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1744, NULL, NULL, NULL, NULL, '不合格数量', 'FailedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 950, NULL, NULL, NULL, NULL, 1, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1745, NULL, NULL, NULL, NULL, '检验结果', 'InspectionResult', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1746, NULL, NULL, NULL, 12, '缺陷描述', 'DefectDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1747, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1748, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-19 01:56:36', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1749, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1750, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1751, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1752, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO `Sys_TableColumn` VALUES (1753, NULL, NULL, NULL, NULL, '物料编码', 'MaterialCode', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1754, NULL, NULL, NULL, NULL, '物料图片', 'Img', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 16, 'img', NULL, 1, 1, 1, 0, 1, 0, 2000, '超级管理员', '2025-03-17 11:17:16', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1755, NULL, NULL, NULL, NULL, '分类ID', 'CatalogID', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 11:36:05', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1759, NULL, NULL, NULL, NULL, '上级分类', 'ParentId', 'string', 110, NULL, NULL, NULL, NULL, '物料分类', NULL, 7, 'cascader', NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 11:36:05', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1760, NULL, NULL, NULL, NULL, '启用状态', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, 'enable', NULL, 8, 'radio', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9700, NULL, NULL, 1, 'select', 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1761, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1762, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1763, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9550, NULL, NULL, 1, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1764, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9500, NULL, NULL, 1, 'datetime', 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1765, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1766, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1767, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1768, NULL, NULL, NULL, NULL, '物料分类', 'CatalogID', 'string', 120, NULL, NULL, NULL, NULL, '物料分类', NULL, 3, 'cascader', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 11:17:16', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO `Sys_TableColumn` VALUES (1769, NULL, NULL, NULL, NULL, '分类编码', 'CatalogCode', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9850, NULL, NULL, 1, 'like', 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1770, NULL, NULL, NULL, NULL, '分类名称', 'CatalogName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9900, NULL, NULL, 1, 'like', 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1771, NULL, NULL, NULL, NULL, '分类类型', 'CatalogType', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO `Sys_TableColumn` VALUES (1772, NULL, NULL, NULL, NULL, '订单数量', 'OrderQty', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9700, NULL, NULL, NULL, NULL, 1, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1773, NULL, NULL, NULL, NULL, '优先级', 'LV', 'string', 70, NULL, NULL, NULL, NULL, '优先级', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2025-03-19 01:20:52', 1, 9650, NULL, NULL, NULL, NULL, 1, 'MES_ProductionOrder', 71);
INSERT INTO `Sys_TableColumn` VALUES (1774, NULL, NULL, NULL, NULL, '工时(小时)', 'ReportHour', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'decimal', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO `Sys_TableColumn` VALUES (1775, NULL, NULL, NULL, NULL, '工时(小时)', 'ReportHour', 'decimal', 110, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9550, NULL, NULL, NULL, NULL, 1, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1776, NULL, NULL, NULL, NULL, '报工数量', 'Total', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9700, NULL, NULL, 1, 'range', 1, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1777, NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', 90, NULL, NULL, NULL, NULL, 'audit', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9500, NULL, NULL, 1, 'select', 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1778, NULL, NULL, NULL, NULL, '审批人', 'Auditor', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1779, NULL, NULL, NULL, NULL, '合格数量', 'AcceptedQuantity', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1780, NULL, NULL, NULL, NULL, '不合格数量', 'RejectedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO `Sys_TableColumn` VALUES (1781, NULL, NULL, NULL, NULL, 'ID', 'BomId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:33:37', 1, 1350, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1782, NULL, NULL, NULL, NULL, 'BOM编号', 'Code', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 1300, NULL, NULL, 1, 'like', 1, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1784, NULL, NULL, NULL, NULL, '母件物料编码', 'MaterialCode', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-19 01:33:37', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1785, NULL, NULL, NULL, NULL, '母件物料名称', 'MaterialName', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 300, '超级管理员', '2025-03-19 01:33:37', 1, 1150, NULL, NULL, 1, 'like', 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1786, NULL, NULL, NULL, NULL, '规格型号', 'Spec', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, '超级管理员', '2025-03-19 01:33:37', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1787, NULL, NULL, NULL, NULL, '用途', 'Purpose', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1788, NULL, NULL, NULL, NULL, '版本', 'Edition', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1789, NULL, NULL, NULL, NULL, '有效日期', 'EffectiveDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 950, NULL, NULL, 1, 'date', 1, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1790, NULL, NULL, NULL, NULL, '失效日期', 'InvalidDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 900, NULL, NULL, NULL, NULL, 1, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1791, NULL, NULL, NULL, NULL, '启用状态', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1792, NULL, NULL, NULL, NULL, '创建人', 'CreateID', 'int', 70, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1793, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1794, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1795, NULL, NULL, NULL, NULL, '更新人', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1796, NULL, NULL, NULL, NULL, '更新人名称', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1797, NULL, NULL, NULL, NULL, '更新时间', 'ModifyDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO `Sys_TableColumn` VALUES (1798, NULL, NULL, NULL, NULL, 'ID', 'DomDetailId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 02:58:35', 1, 1450, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1799, NULL, NULL, NULL, NULL, 'BomId', 'BomId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 02:58:35', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1800, NULL, NULL, NULL, NULL, '序号', 'Sequence', 'int', 50, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 1350, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1802, NULL, NULL, NULL, NULL, '子件物料编码', 'MaterialCode', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-19 02:58:35', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1803, NULL, NULL, NULL, NULL, '子件物料名称', 'MaterialName', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 300, '超级管理员', '2025-03-19 02:58:35', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1804, NULL, NULL, NULL, NULL, '规格型号', 'Spec', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-19 02:58:35', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1805, NULL, NULL, NULL, NULL, '单台用量', 'UsageQty', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1806, NULL, NULL, NULL, NULL, '消耗方式', 'ConsumeModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:58:35', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1807, NULL, NULL, NULL, NULL, '投料仓库', 'Warehouse', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 02:58:35', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1808, NULL, NULL, NULL, NULL, '供应商', 'SupplierCode', 'string', 120, NULL, NULL, NULL, NULL, '供应商', NULL, 7, 'select', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 02:58:35', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1809, NULL, NULL, NULL, NULL, '齐套比例', 'KitScale', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1810, NULL, NULL, NULL, NULL, '启用状态', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1811, NULL, NULL, NULL, NULL, '创建人', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1812, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 02:58:35', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1813, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1814, NULL, NULL, NULL, NULL, '更新人', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1815, NULL, NULL, NULL, NULL, '更新人名称', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 02:58:35', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1816, NULL, NULL, NULL, NULL, '更新时间', 'ModifyDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO `Sys_TableColumn` VALUES (1817, NULL, NULL, NULL, NULL, '', 'RoleName', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8850, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1818, NULL, NULL, NULL, NULL, '', 'Tel', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 20, '超级管理员', '2025-03-24 00:55:19', 1, 8800, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1819, NULL, NULL, NULL, NULL, '', 'DeptName', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 150, '超级管理员', '2025-03-24 00:55:19', 1, 8750, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1820, NULL, NULL, NULL, NULL, '', 'Dept_Id', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8700, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1821, NULL, NULL, NULL, NULL, '', 'IsRegregisterPhone', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8650, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1822, NULL, NULL, NULL, NULL, '', 'Address', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8600, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1823, NULL, NULL, NULL, NULL, '', 'AppType', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8550, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1824, NULL, NULL, NULL, NULL, '', 'AuditDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 00:55:19', 1, 8500, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1825, NULL, NULL, NULL, NULL, '', 'AuditStatus', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8450, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1826, NULL, NULL, NULL, NULL, '', 'Auditor', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8400, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO `Sys_TableColumn` VALUES (1827, NULL, NULL, NULL, NULL, '', 'Mobile', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 00:55:19', 1, 8350, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);

-- ----------------------------
-- Table structure for Sys_TableInfo
-- ----------------------------
DROP TABLE IF EXISTS `Sys_TableInfo`;
CREATE TABLE `Sys_TableInfo`  (
  `Table_Id` int(11) NOT NULL AUTO_INCREMENT,
  `CnName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ColumnCNName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DBServer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DataTableType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DetailCnName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DetailName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EditorType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` int(11) NULL DEFAULT NULL,
  `ExpressField` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FolderName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Namespace` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `ParentId` int(11) NULL DEFAULT NULL,
  `RichText` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SortName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableTrueName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UploadField` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UploadMaxCount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Table_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO `Sys_TableInfo` VALUES (2, '角色管理', '角色管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, 'RoleName', 'System', 'VOL.Sys', NULL, 8, NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (3, '字典数据', '字典数据', 'SysDbContext', NULL, '字典明细', 'Sys_DictionaryList', NULL, 0, 'DicName', 'System', 'VOL.Sys', NULL, 15, NULL, NULL, 'Sys_Dictionary', 'Sys_Dictionary', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (4, '字典明细', '字典明细', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.System', NULL, 15, NULL, NULL, 'Sys_DictionaryList', 'Sys_DictionaryList', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (5, '系统日志', '系统日志', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.Sys', NULL, 10, NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (6, NULL, '用户管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, 'UserName', 'System', 'VOL.Sys', NULL, 8, NULL, '', 'Sys_User', 'Sys_User', 'HeadImageUrl', 1);
INSERT INTO `Sys_TableInfo` VALUES (8, '用户基础信息', '用户管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.Sys', 200, 0, NULL, NULL, '无', '无', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (10, '日志管理', '日志管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.Sys', NULL, 0, NULL, '170', '日志管理', '日志管理', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (14, '部门管理', '组织架构', 'SysDbContext', NULL, NULL, NULL, NULL, 1, 'DepartmentName', 'System', 'VOL.Sys', NULL, 8, NULL, 'DepartmentName', 'Sys_Department', 'Sys_Department', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (15, '系统设置', '系统设置', 'SysDbContext', NULL, NULL, NULL, NULL, 1, NULL, '系统设置', 'ZL.System', NULL, 0, NULL, NULL, '系统设置', '系统设置', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (19, '用户部门', '用户组织部门', 'SysDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.Sys', NULL, 8, NULL, 'CreateDate', 'Sys_UserDepartment', 'Sys_UserDepartment', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (20, '省市区县', '省市区县', 'SysDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.Sys', NULL, 15, NULL, NULL, 'Sys_Region', 'Sys_Region', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (33, '审批流程', '审批流程配置', 'SysDbContext', NULL, '审批步骤', 'Sys_WorkFlowStep', NULL, 1, 'WorkName', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlow', 'Sys_WorkFlow', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (34, '审批节点', '审批节点配置', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowStep', 'Sys_WorkFlowStep', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (35, '审批流程', '审批流程', NULL, NULL, '审批节点', 'Sys_WorkFlowTableStep', NULL, 1, '', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowTable', 'Sys_WorkFlowTable', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (36, '审批节点', '审批节点', NULL, NULL, NULL, NULL, NULL, 1, '', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowTableStep', 'Sys_WorkFlowTableStep', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (37, '定时任务', '定时任务', NULL, NULL, NULL, NULL, NULL, 1, 'TaskName', 'Quartz', 'VOL.System', NULL, 15, NULL, 'TaskName', 'Sys_QuartzOptions', 'Sys_QuartzOptions', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (38, '执行记录', '执行记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Quartz', 'VOL.System', NULL, 15, NULL, 'StratDate', 'Sys_QuartzLog', 'Sys_QuartzLog', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (39, '审批记录', '审批记录', NULL, NULL, NULL, NULL, NULL, 1, '', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowTableAuditLog', 'Sys_WorkFlowTableAuditLog', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (54, 'MES业务', 'MES业务', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 0, NULL, NULL, 'MES业务', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (55, '客户管理', '客户管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'CustomerName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Customer', 'MES_Customer', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (56, '供应商', '供应商', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'SupplierName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Supplier', 'MES_Supplier', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (57, '仓库管理', '仓库管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'WarehouseCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_WarehouseManagement', 'MES_WarehouseManagement', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (58, '产线设备', '产线设备', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionLineDevice', 'MES_ProductionLineDevice', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (59, '物料管理', '物料管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'MaterialCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Material', 'MES_Material', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (61, '产线管理', '产线管理', 'ServiceDbContext', NULL, '产线设备', 'MES_ProductionLineDevice', NULL, 1, 'LineName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionLine', 'MES_ProductionLine', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (62, '库存管理', '库存管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_InventoryManagement', 'MES_InventoryManagement', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (63, '货位管理', '货位管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'LocationCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_LocationManagement', 'MES_LocationManagement', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (64, '产品入库', '产品入库', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'DocumentNo', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductInbound', 'MES_ProductInbound', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (65, '设备维修', '设备维修', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'RepairReason', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentRepair', 'MES_EquipmentRepair', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (66, '产品出库', '产品出库', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'DocumentNo', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductOutbound', 'MES_ProductOutbound', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (67, '设备管理', '设备管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'EquipmentCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentManagement', 'MES_EquipmentManagement', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (68, '设备保养', '设备保养', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'MaintenanceContent', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentMaintenance', 'MES_EquipmentMaintenance', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (69, '设备故障', '设备故障', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'FaultDescription', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentFaultRecord', 'MES_EquipmentFaultRecord', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (70, '工序管理', '工序管理', 'ServiceDbContext', NULL, '工艺路线', 'MES_ProcessRoute', NULL, 1, 'ProcessCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Process', 'MES_Process', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (71, '生产订单', '生产订单', 'ServiceDbContext', NULL, '订单明细', 'MES_ProductionPlanDetail', NULL, 1, 'OrderNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionOrder', 'MES_ProductionOrder', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (72, '工序统计', '工序统计', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProcessReport', 'MES_ProcessReport', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (73, '工线路线', '工线路线', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'ProductName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProcessRoute', 'MES_ProcessRoute', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (74, '订单明细表', '订单明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionPlanDetail', 'MES_ProductionPlanDetail', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (76, '变更记录', '变更记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'OrderNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionPlanChangeRecord', 'MES_ProductionPlanChangeRecord', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (77, '生产报工', '生产报工', 'ServiceDbContext', NULL, '报工明细', 'MES_ProductionReportingDetail', NULL, 1, 'ReportingNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionReporting', 'MES_ProductionReporting', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (78, '报工明细', '报工明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionReportingDetail', 'MES_ProductionReportingDetail', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (79, '生产不良记录', '生产不良记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_DefectiveProductRecord', 'MES_DefectiveProductRecord', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (80, '质量检验', '质量检验', 'ServiceDbContext', NULL, '质检明细', 'MES_QualityInspectionPlanDetail', NULL, 1, 'InspectionPlanNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_QualityInspectionPlan', 'MES_QualityInspectionPlan', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (81, '不良处理记录', '不良处理记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_DefectiveProductDisposalRecord', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (82, '质检明细', '质检明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_QualityInspectionPlanDetail', 'MES_QualityInspectionPlanDetail', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (83, '不合格记录', '不合格记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_NonConformingProductDisposalRecord', NULL, NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (84, '排班计划', '排班计划', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'PlanName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_SchedulingPlan', 'MES_SchedulingPlan', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (85, '质检记录', '质检记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'InspectionNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_QualityInspectionRecord', 'MES_QualityInspectionRecord', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (86, '物料分类', '物料分类', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'CatalogCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_MaterialCatalog', 'MES_MaterialCatalog', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (87, '制造BOM', '制造BOM', 'ServiceDbContext', NULL, 'BOM明细', 'MES_Bom_Detail', NULL, 1, 'Code', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Bom_Main', 'MES_Bom_Main', NULL, NULL);
INSERT INTO `Sys_TableInfo` VALUES (88, 'BOM明细', 'BOM明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'MaterialCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Bom_Detail', 'MES_Bom_Detail', NULL, NULL);

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE IF EXISTS `Sys_User`;
CREATE TABLE `Sys_User`  (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Id` int(11) NOT NULL,
  `RoleName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PhoneNo` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserPwd` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserTrueName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DeptName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dept_Id` int(11) NULL DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NOT NULL,
  `Gender` int(11) NULL DEFAULT NULL,
  `HeadImageUrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IsRegregisterPhone` int(11) NULL DEFAULT NULL,
  `LastLoginDate` datetime(0) NULL DEFAULT NULL,
  `LastModifyPwdDate` datetime(0) NULL DEFAULT NULL,
  `Address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AppType` int(11) NULL DEFAULT NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderNo` int(11) NULL DEFAULT NULL,
  `Token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `Creator` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `DeptIds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`User_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3363 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO `Sys_User` VALUES (1, 1, '无', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', NULL, 0, '283591387@qq.com', 1, 1, 'Upload/Tables/Sys_User/202305131010574561/wechat.jpg', 0, '2017-08-28 09:58:55', '2019-12-14 15:14:23', '北京市西城区', 1, '2019-08-18 00:54:06', 1, '超级管理员', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTc0Mjc1Mzk3MCIsIm5iZiI6IjE3NDI3NTM5NzAiLCJleHAiOiIxNzQyNzYxMTcwIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.rFCTte2J4Gow70BBaAb0MFI_isJJhGeBd23MXrD9bQU', NULL, '2012-06-10 11:10:03', NULL, NULL, '超级管理员', '2025-03-24 00:32:44', 1, NULL);
INSERT INTO `Sys_User` VALUES (3362, 2, '无', NULL, '。。', NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', 'Admin测试', NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202305131011047216/wechat.jpg', 1, NULL, '2019-09-22 23:03:34', '北京市还没注册', 1, '2019-08-18 00:54:06', 1, '超级管理员', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTc0Mjc1MzkzOCIsIm5iZiI6IjE3NDI3NTM5MzgiLCJleHAiOiIxNzQyNzYxMTM4IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.71p1QYrDjr8GMRU1BOFSDK9adDquZ0UHj8xinA4mRVM', NULL, '2019-08-13 14:24:27', NULL, '01012345678', '超级管理员', '2023-05-13 17:09:41', 1, 'e5d8e8af-3659-454c-aa8e-c201c7edbcfb,ec238385-f907-44de-b99b-0eddcffa6750');

-- ----------------------------
-- Table structure for Sys_UserDepartment
-- ----------------------------
DROP TABLE IF EXISTS `Sys_UserDepartment`;
CREATE TABLE `Sys_UserDepartment`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserId` int(11) NOT NULL,
  `DepartmentId` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Enable` int(11) NOT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `Modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_UserDepartment
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_WorkFlow
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlow`;
CREATE TABLE `Sys_WorkFlow`  (
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程名称',
  `WorkTable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名',
  `WorkTableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能菜单',
  `NodeConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '节点信息',
  `LineConfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '连接配置',
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `Weight` int(11) NULL DEFAULT NULL COMMENT '权重',
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `AuditingEdit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`WorkFlow_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlow
-- ----------------------------
INSERT INTO `Sys_WorkFlow` VALUES ('28E37AA6-B6DF-4AF2-8188-A68B0571F650', '生产报工审批', 'MES_ProductionReporting', '生产报工', '[{\"id\":\"jg8cp5ijz\",\"name\":\"报工提交\",\"type\":\"start\",\"left\":\"282px\",\"top\":\"15px\",\"ico\":\"el-icon-time\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[],\"deptId\":[]},{\"id\":\"hetlnr7jm\",\"name\":\"报工数量<=500\",\"type\":\"node\",\"left\":\"77px\",\"top\":\"137px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[{\"field\":\"Total\",\"value\":\"500\",\"filterType\":\"<=\",\"data\":null}],\"userId\":[],\"roleId\":[2],\"deptId\":[],\"auditType\":2},{\"id\":\"w9v2ssg9e8\",\"name\":\"流程结束\",\"type\":\"end\",\"left\":\"306.4px\",\"top\":\"539.4px\",\"ico\":\"el-icon-switch-button\",\"state\":\"success\"},{\"id\":\"gu2g24vswf\",\"name\":\"管理员审批\",\"type\":\"node\",\"left\":\"76px\",\"top\":\"277px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[1],\"roleId\":[],\"deptId\":[],\"auditType\":1},{\"id\":\"4zlt54it3\",\"name\":\"报工数量>500\",\"type\":\"node\",\"left\":\"539px\",\"top\":\"129px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[{\"field\":\"Total\",\"value\":\"500\",\"filterType\":\">\",\"data\":null}],\"userId\":[3362],\"roleId\":[],\"deptId\":[],\"auditType\":1},{\"id\":\"34ltn0ou0l\",\"name\":\"线长审批\",\"type\":\"node\",\"left\":\"307px\",\"top\":\"217px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[],\"deptId\":[\"ec238385-f907-44de-b99b-0eddcffa6750\"],\"auditType\":3},{\"id\":\"yxkuhlh3no\",\"name\":\"主管审批\",\"type\":\"node\",\"left\":\"76px\",\"top\":\"400px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[2],\"deptId\":[],\"auditType\":2},{\"id\":\"ug7mqx18yf\",\"name\":\"经理审批\",\"type\":\"node\",\"left\":\"539px\",\"top\":\"280px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[4],\"deptId\":[],\"auditType\":2},{\"id\":\"sgjixpmavv\",\"name\":\"二次审批\",\"type\":\"node\",\"left\":\"307px\",\"top\":\"400px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[1],\"roleId\":[],\"deptId\":[],\"auditType\":1}]', '[{\"from\":\"jg8cp5ijz\",\"to\":\"hetlnr7jm\",\"label\":\"x\"},{\"from\":\"hetlnr7jm\",\"to\":\"gu2g24vswf\",\"label\":\"x\"},{\"from\":\"jg8cp5ijz\",\"to\":\"4zlt54it3\",\"label\":\"x\"},{\"from\":\"4zlt54it3\",\"to\":\"34ltn0ou0l\",\"label\":\"x\"},{\"from\":\"gu2g24vswf\",\"to\":\"yxkuhlh3no\",\"label\":\"x\"},{\"from\":\"yxkuhlh3no\",\"to\":\"w9v2ssg9e8\",\"label\":\"x\"},{\"from\":\"4zlt54it3\",\"to\":\"ug7mqx18yf\",\"label\":\"x\"},{\"from\":\"34ltn0ou0l\",\"to\":\"sgjixpmavv\",\"label\":\"x\"},{\"from\":\"sgjixpmavv\",\"to\":\"w9v2ssg9e8\",\"label\":\"x\"},{\"from\":\"ug7mqx18yf\",\"to\":\"w9v2ssg9e8\",\"label\":\"x\"}]', NULL, 1, '2025-03-24 02:04:32', 1, '超级管理员', 1, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for Sys_WorkFlowStep
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowStep`;
CREATE TABLE `Sys_WorkFlowStep`  (
  `WorkStepFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程主表id',
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程节点Id',
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `StepType` int(11) NULL DEFAULT NULL COMMENT '节点类型(1=按用户审批,2=按角色审批)',
  `StepValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审批用户id或角色id',
  `OrderId` int(11) NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `NextStepIds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ParentId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AuditRefuse` int(11) NULL DEFAULT NULL,
  `AuditBack` int(11) NULL DEFAULT NULL,
  `AuditMethod` int(11) NULL DEFAULT NULL,
  `SendMail` int(11) NULL DEFAULT NULL,
  `Filters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `StepAttrType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Weight` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowStep
-- ----------------------------
INSERT INTO `Sys_WorkFlowStep` VALUES ('06BEBB63-C97B-4271-B3A9-5A558E94C991', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'w9v2ssg9e8', '流程结束', NULL, NULL, 8, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'ug7mqx18yf,yxkuhlh3no,sgjixpmavv', NULL, NULL, NULL, NULL, NULL, 'end', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('11436D51-6CB2-4297-8788-44CC6845AB67', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'jg8cp5ijz', '报工提交', NULL, NULL, 0, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'start', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('172BBFDE-4001-4978-B48A-FD6EA90D2363', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'gu2g24vswf', '管理员审批', 1, '1', 3, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'hetlnr7jm', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('698574C7-17C5-4627-8E47-17DC57B80715', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'hetlnr7jm', '报工数量<=500', 2, '2', 1, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'jg8cp5ijz', NULL, NULL, NULL, NULL, '[{\"field\":\"Total\",\"filterType\":\"<=\",\"value\":\"500\"}]', 'node', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('6F649AF9-7201-4609-BA06-961D5C4F3155', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', '4zlt54it3', '报工数量>500', 1, '3362', 2, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'jg8cp5ijz', NULL, NULL, NULL, NULL, '[{\"field\":\"Total\",\"filterType\":\">\",\"value\":\"500\"}]', 'node', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('AD9BB226-F047-4F8F-B69B-8DABD4FE1043', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'ug7mqx18yf', '经理审批', 2, '4', 5, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '4zlt54it3', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('C130466F-6165-429F-A2A0-6962554CFA5C', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'sgjixpmavv', '二次审批', 1, '1', 7, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '34ltn0ou0l', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('EAED94B3-F385-4401-8FEA-41C40110BC7A', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', '34ltn0ou0l', '线长审批', 3, 'ec238385-f907-44de-b99b-0eddcffa6750', 4, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '4zlt54it3', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO `Sys_WorkFlowStep` VALUES ('F65D2016-BB4F-4235-8609-4BDCB30B5085', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'yxkuhlh3no', '主管审批', 2, '2', 6, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'gu2g24vswf', NULL, NULL, NULL, NULL, NULL, 'node', NULL);

-- ----------------------------
-- Table structure for Sys_WorkFlowTable
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTable`;
CREATE TABLE `Sys_WorkFlowTable`  (
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WorkName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WorkTableKey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表主键id',
  `WorkTable` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表名',
  `WorkTableName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表中文名',
  `CurrentOrderId` int(11) NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `CurrentStepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StepName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowTable
-- ----------------------------
INSERT INTO `Sys_WorkFlowTable` VALUES ('E49271E6-0B1B-455C-A765-74C9C876DB48', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', '生产报工审批', '9356d9e8-8b3a-41c5-a2fc-f805e60ac867', 'MES_ProductionReporting', '生产报工', NULL, 0, '2025-03-24 02:12:41', 1, '超级管理员', 1, NULL, NULL, NULL, 'hetlnr7jm', '报工数量<=500');

-- ----------------------------
-- Table structure for Sys_WorkFlowTableAuditLog
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTableAuditLog`;
CREATE TABLE `Sys_WorkFlowTableAuditLog`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WorkFlowTableStep_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AuditId` int(11) NULL DEFAULT NULL,
  `Auditor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AuditStatus` int(11) NULL DEFAULT NULL,
  `AuditResult` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowTableAuditLog
-- ----------------------------
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('032A246A-3D95-45AE-A02F-15397FE959A4', '38417B03-D70B-436B-8D24-F60ED5373DC6', 'EEE0B9EF-EB93-4680-8DCA-658B73C5D797', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-08 16:48:16', NULL, '2023-05-08 16:48:16');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('033009CD-4227-4088-A7F4-0FE956717005', 'F00BF32C-7D32-45B7-AC3E-4E223A6E2DD6', '0F7C0A3C-A0FA-4FB4-9D4D-FBCD441FA449', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:15:57', NULL, '2023-05-13 13:15:57');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('0404929A-1B62-4015-905F-C47B8488C0B5', 'A8A9CD0D-C885-434C-8ADC-B0347E05B08A', 'BE1DC0BF-96F0-46DB-8A02-90362B1B0B38', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '............', '2023-05-13 16:12:02', '............', '2023-05-13 16:12:02');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('04F7DBBD-D36D-4FC0-9222-A87B8475E9F1', 'A8A9CD0D-C885-434C-8ADC-B0347E05B08A', 'BE1DC0BF-96F0-46DB-8A02-90362B1B0B38', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '同意。。。。', '2023-05-13 16:02:58', '同意。。。。', '2023-05-13 16:02:58');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('0760AAF1-644F-4AE8-A28C-959583420365', 'D82F4733-9916-4714-BF35-900CEAA049C1', 'DE5133DF-9FF7-494D-BB76-C9E457DFEBAD', 'b9cv1h35jg', '产品部>=7000审批', 3362, 'Admin测试', 1, 'Admin测试管理员同意。。', '2023-05-13 17:11:47', 'Admin测试管理员同意。。', '2023-05-13 17:11:47');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('088BDAB5-4BCF-4F12-A5C1-0F2E642EC66C', '7DB5447A-7A78-40D8-9585-0AAB9375B61F', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:49:18');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('08E13A05-901D-456A-9E96-39ABD8054D22', '827CE743-8340-4643-8512-DE6B8B998B9C', '4F5A3717-EA97-4E45-BB77-12E95A25523B', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-08 16:36:42', NULL, '2023-05-08 16:36:42');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('09087F8C-4EDB-4FBF-BF04-97610D2EE880', '56A6D0FC-5B0D-4748-B436-1868865277C3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:46:23');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('1A21CC26-EB65-4A68-BCEA-116F08B43882', '89F87FD9-B1FB-435B-8C92-7870D74214DD', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:20:31');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('1B780830-DA10-47CF-AA55-B6049CF1BC6B', '2C0D573D-F81F-4D98-89FF-75804B8BC877', 'D1E0D9F4-2476-43E5-BA73-9A3B6D3431F2', '3nfhu1i4', '<=100', 1, '超级管理员', 0, NULL, '2023-05-13 12:07:42', NULL, '2023-05-13 12:07:42');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('267C2E5B-4B55-4F5D-8A43-2920A08B89FB', '56A6D0FC-5B0D-4748-B436-1868865277C3', '89329EB5-620E-477A-80C5-9261DC1F6C60', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:47:04', NULL, '2023-05-13 13:47:04');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('2BA41A15-768D-49DB-80F4-D6B9FF2DA546', 'EEF3FF36-111E-4398-BE9C-7C69E5D2B4C5', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:34:59');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('367AE81D-3BE4-4FA3-A5EE-555330B87FBE', 'D82F4733-9916-4714-BF35-900CEAA049C1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 17:07:37');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('37CA151D-B43D-4364-AA6B-E2DF02720C07', 'BFF474A1-52E2-498B-8557-F7322BF34834', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:36:03');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('3A54FFCB-C687-41B3-A59C-FE287CB0BA38', 'DDD6EA0C-E3DB-49AD-8DFE-BB995C23BCF3', 'D6366D71-7FE1-480D-882C-D1B9A8419210', 'mtisrzm4x', '>=200', 1, '超级管理员', 3, '原因不明。。', '2023-05-13 15:37:08', '原因不明。。', '2023-05-13 15:37:08');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('3ABFDA8B-C565-47CD-B965-9D49BF50F902', '0CD2D3AC-A4B3-42DC-BE9B-3F3057B1AC61', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 00:54:50');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('42637473-018E-482E-B952-07E2C4AFC0CC', 'CC35E127-2740-40F0-AD5A-6007CF92367E', '3E190AFD-64B3-42FA-8C53-DB6670D65A9D', 'mtisrzm4x', '>=200', 1, '超级管理员', 1, NULL, '2023-05-13 12:57:36', NULL, '2023-05-13 12:57:36');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('45938D60-E6DE-4172-92EF-7F685E0F44E1', 'C46E07FC-6141-4DE8-947C-85D312F1972F', '937EB1AA-4C9F-401A-A8E3-CC267A6AB2BC', 'mtisrzm4x', '>=200', 1, '超级管理员', 3, NULL, '2023-05-13 15:35:53', NULL, '2023-05-13 15:35:53');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('47F08E68-5AE1-467B-81F3-8A55072E9794', '60BAFF11-492D-4E74-8E38-7F2FED2FEC8C', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 17:17:47');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('4AA1C64B-10B7-4F9E-83F4-4E9B7DB22878', '9FDA3A1E-1486-4BF5-BFC4-A217951A7A6A', '94407D86-77A3-4A6B-8CB5-ABFA31AC3B0C', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:39:41', NULL, '2023-05-13 12:39:41');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('50D2F620-6FE3-4663-9E78-5CADCED87A7F', 'CA8025CD-4B66-4127-B9D6-D9EAD3D23705', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:39:57');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('576493C9-C755-4EF5-98C4-401D5BAFC5A2', 'CC35E127-2740-40F0-AD5A-6007CF92367E', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:56:24');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('59DD8BCD-EDDF-4882-A0E0-247844DEC5E7', 'B58589A0-04A1-432E-ACCB-76C9C22C8BC9', 'FA069866-DB1F-47F9-BB88-0132E42F7B4F', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:14:35', NULL, '2023-05-13 12:14:35');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('5FF227A0-5138-4145-AE8D-E03EA3A55CC3', '8E60E09E-CDA6-4BAA-B452-370DEA64ADA4', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 16:33:45');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('6306B03C-7C1F-4912-9B44-CEFFCC609267', '75D7FB3F-049E-4103-8F6A-9F3E0D3EBB3A', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:47:17');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('673B5F2A-D798-4120-8BCE-077DC208A047', 'C46E07FC-6141-4DE8-947C-85D312F1972F', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 14:17:56');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('685B461F-1A68-4498-87C1-F00EE5D2F0B3', '9FDA3A1E-1486-4BF5-BFC4-A217951A7A6A', '94407D86-77A3-4A6B-8CB5-ABFA31AC3B0C', 'mtisrzm4x', '>=200', 1, '超级管理员', 1, NULL, '2023-05-13 12:54:29', NULL, '2023-05-13 12:54:29');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('69BFBD14-CDC2-4D70-8625-819490946116', '2D019AE7-22BB-4D25-8D06-2B4444C22C6F', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:07:14');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('6D9AE3C7-F802-4E31-BA8E-0A27ACF3951D', 'A8A9CD0D-C885-434C-8ADC-B0347E05B08A', '4ED73980-2E6E-4052-9722-695375D93303', 'xk0xirr5zf', '>=20', 3362, 'Admin测试', 1, '通过。。。。。', '2023-05-13 16:14:57', '通过。。。。。', '2023-05-13 16:14:57');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('6E3E6F00-3DBB-4887-B453-A9FB54FFFB5C', '646D440F-2447-44B7-BD35-3690E7D1E5E8', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:49:17');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('71E15ED0-CBCC-4FEA-A45E-FAAF58758B18', 'D1CD7028-132C-4B97-AEC3-071F0BA7DA0E', '2AC1DDB2-19B7-412F-8C93-6F70228E5863', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:06:21', NULL, '2023-05-13 12:06:21');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('744382F3-0AE7-48E5-9F97-71908863F7B9', '60BAFF11-492D-4E74-8E38-7F2FED2FEC8C', '4FC4ACA8-E0F6-4B57-B66A-4A1BF8DC3F85', 'jkqinw0zc', '用户审批>=5000', 1, '超级管理员', 1, '同意。。。', '2023-05-13 17:17:59', '同意。。。', '2023-05-13 17:17:59');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('77C48D16-1D3E-4EC9-BB50-81308E51C6B1', 'E7E6A63F-3CA0-4D63-A323-790D4680D8C0', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:20:28');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('78105867-BD28-4D35-8739-0C533DC71D67', 'E49271E6-0B1B-455C-A765-74C9C876DB48', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2025-03-24 02:12:41');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('85401EE1-C772-4610-B958-6D8C8C3307A7', '0134C7B2-8931-4477-9743-7ADDA9A4D6DF', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:42:01');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('860FA141-5321-45B1-8148-7B707F02C8A7', '7DB5447A-7A78-40D8-9585-0AAB9375B61F', '032EB689-C842-4EBF-B072-6062864B300D', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '同意。。。。', '2023-05-13 15:56:56', '同意。。。。', '2023-05-13 15:56:56');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('86C3310D-AF70-45E1-8156-3259AEA24C6B', 'B58589A0-04A1-432E-ACCB-76C9C22C8BC9', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:14:35');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('9053B951-F2FD-40DF-8BAF-8F267D6126CE', 'E7E6A63F-3CA0-4D63-A323-790D4680D8C0', '4FD17D32-518A-4F9C-80C5-738374F5A846', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:20:44', NULL, '2023-05-13 13:20:44');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('94D7B7AE-E6E1-44F9-B5F0-66F37EB740C2', '1B92E493-11F0-462B-971B-C91FFBE82B42', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 11:47:55');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('987DE71A-AFCD-4FAD-99DF-57B4C50192E5', 'D1CD7028-132C-4B97-AEC3-071F0BA7DA0E', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:06:21');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('9B2C29A0-8C8F-4CDE-87C7-A6290A93ED03', '1B92E493-11F0-462B-971B-C91FFBE82B42', '839A2DE4-E5BE-4FCF-9AD5-8B3B26D791DC', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 11:47:55', NULL, '2023-05-13 11:47:55');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('9CB27636-CEF5-4FA0-8AE0-940A759425F2', '2C0D573D-F81F-4D98-89FF-75804B8BC877', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:07:42');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('9F5C12B1-CE50-4F90-B40A-833279872B0A', '9FDA3A1E-1486-4BF5-BFC4-A217951A7A6A', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:39:40');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('A21B38BE-C2DF-4EDD-8EFB-5F2E8E216EC4', '98590873-049B-45C1-8F75-FF7AB22AE0DD', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 14:00:08');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('A4337440-A79E-4C46-BCDD-F279EBC6AB29', '827CE743-8340-4643-8512-DE6B8B998B9C', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:36:42');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('B8473B4D-C6FC-49C8-BE4F-2E8C8C181F24', 'ED175615-9853-469F-9BEE-DAC37D4CFE49', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:30:56');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('B9D955F1-05B2-4C16-B877-FF700B2954A7', 'A8A9CD0D-C885-434C-8ADC-B0347E05B08A', 'BE1DC0BF-96F0-46DB-8A02-90362B1B0B38', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '同意。。。。。', '2023-05-13 16:14:44', '同意。。。。。', '2023-05-13 16:14:44');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('C0B40AD7-1C64-4C0A-B9D0-EA7074075583', '581940D5-848F-4493-9C66-42ADD81F301C', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:45:41');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('C251C391-3F13-4D05-91C1-591F0CA737D5', 'CC35E127-2740-40F0-AD5A-6007CF92367E', '3E190AFD-64B3-42FA-8C53-DB6670D65A9D', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:56:24', NULL, '2023-05-13 12:56:24');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('C4CF806A-7B5C-49A2-B4A9-721CA3BD4868', 'D82F4733-9916-4714-BF35-900CEAA049C1', '8486B561-6403-4D1C-AF33-DD635BF63B8C', 'jkqinw0zc', '用户审批>=5000', 1, '超级管理员', 1, NULL, '2023-05-13 17:10:51', NULL, '2023-05-13 17:10:51');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('C6AB40F6-7A16-4E69-A7C6-F5AF695AB473', '646D440F-2447-44B7-BD35-3690E7D1E5E8', '0AD966A6-A5AF-4E1B-8764-29A120431351', 'mtisrzm4x', '>=200', 1, '超级管理员', 1, NULL, '2023-05-13 13:49:50', NULL, '2023-05-13 13:49:50');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('D3FBF10D-DB09-4A6B-BE8E-76D1506DDCD9', 'DDD6EA0C-E3DB-49AD-8DFE-BB995C23BCF3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:36:45');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('DCF07982-9EDA-4A19-BE7E-8F4C33FB32CF', '2D019AE7-22BB-4D25-8D06-2B4444C22C6F', 'AB5DE430-5007-4027-B58B-C5EB9B0BFEB8', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:07:25', NULL, '2023-05-13 13:07:25');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('DF004942-44BD-4BE2-AC42-316E562EEAEB', '38417B03-D70B-436B-8D24-F60ED5373DC6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:48:16');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('E0A80AD6-25BE-49EE-B802-4F517991FC0A', 'D82F4733-9916-4714-BF35-900CEAA049C1', 'A2035FC1-334B-4B54-ABC9-CAAF5C8C7B6D', 'hnoj7gaczc', '超级管理员审批', 1, '超级管理员', 1, '超级管理员同意。。', '2023-05-13 17:12:13', '超级管理员同意。。', '2023-05-13 17:12:13');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('E1C9E5B3-A11E-478C-8169-C39032846C35', '147E53C5-231F-43CC-BBA0-AB906A59B6CA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:17:03');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('E2A55CBF-E68E-4F99-9715-D2DD27CCAFE7', '62C8999F-F07E-4D47-827C-B1C4E63AF323', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 17:19:06');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('E4ED2781-4D7C-4E87-81AE-16D86538BDF3', 'F00BF32C-7D32-45B7-AC3E-4E223A6E2DD6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:15:57');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('E68F23C0-FA88-4290-B975-11E044A7B7E8', '7F13EAAB-F51C-4534-B839-2410501C6693', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:23:44');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('E8FDD20E-21F5-4EFF-9CBF-CF810ED95692', 'BFF474A1-52E2-498B-8557-F7322BF34834', '7413DE5D-100C-4C83-AD91-8E808E6C41F6', 'mtisrzm4x', '>=200', 1, '超级管理员', 2, NULL, '2023-05-08 16:36:03', NULL, '2023-05-08 16:36:03');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('EF0A21C8-5896-4919-A075-BB3A46D4387C', 'A8A9CD0D-C885-434C-8ADC-B0347E05B08A', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:58:43');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('EF617F6B-3AF3-4FA3-9C4D-27C7DB775A74', '83005898-C7DC-4C3A-8519-69BE2DEBE83D', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:52:36');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('F2E57DEA-D98B-45FB-BB88-FA4F187F8C8A', '385F83BD-5518-488D-A335-E9ECFF0318C0', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:49:32');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('F4DD3674-9F9F-40D7-BCDB-92D35A89F89B', '75D7FB3F-049E-4103-8F6A-9F3E0D3EBB3A', 'E3EC2568-A952-4AE3-A269-67663E39BDF0', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:47:50', NULL, '2023-05-13 13:47:50');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('F744C9ED-132F-4294-BC7B-C762201CB1B1', '9768E54C-D8D0-49EE-B943-2416F990C1DF', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:31:33');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('FA4C6EF4-82D8-455C-8166-3D86DA68B09B', 'D5F96FFD-D50B-4581-847C-FEEE264243DA', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:32:18');
INSERT INTO `Sys_WorkFlowTableAuditLog` VALUES ('FBF482E7-A0FF-4842-9E37-34BF672E64F3', '2CD8CE25-650C-49EA-ABB0-82AA8C6BDF72', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:37:42');

-- ----------------------------
-- Table structure for Sys_WorkFlowTableStep
-- ----------------------------
DROP TABLE IF EXISTS `Sys_WorkFlowTableStep`;
CREATE TABLE `Sys_WorkFlowTableStep`  (
  `Sys_WorkFlowTableStep_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlowTable_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WorkFlow_Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StepName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StepType` int(11) NULL DEFAULT NULL,
  `StepValue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OrderId` int(11) NULL DEFAULT NULL,
  `AuditId` int(11) NULL DEFAULT NULL COMMENT '审核人id',
  `Auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审核状态',
  `AuditDate` datetime(0) NULL DEFAULT NULL,
  `Remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Enable` tinyint(4) NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  `StepAttrType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ParentId` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NextStepId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Sys_WorkFlowTableStep_Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sys_WorkFlowTableStep
-- ----------------------------
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('458F5B2B-9EF2-4305-B339-39254587FEA2', 'E49271E6-0B1B-455C-A765-74C9C876DB48', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'w9v2ssg9e8', '流程结束', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'end', 'yxkuhlh3no', NULL, NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('AAF29521-2D1F-4FE3-953A-51ABDEAF2E22', 'E49271E6-0B1B-455C-A765-74C9C876DB48', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'gu2g24vswf', '管理员审批', 1, '1', 2, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'node', 'hetlnr7jm', 'yxkuhlh3no', NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('BABC1A23-A0E9-4D3C-A8CE-9C0EB92BE61A', 'E49271E6-0B1B-455C-A765-74C9C876DB48', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'jg8cp5ijz', '流程开始', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', 1, '超级管理员', 1, NULL, NULL, NULL, 'start', NULL, 'hetlnr7jm', NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('D574CE42-88BA-457F-A9EF-FEC9DD7B4E8D', 'E49271E6-0B1B-455C-A765-74C9C876DB48', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'yxkuhlh3no', '主管审批', 2, '2', 3, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'node', 'gu2g24vswf', 'w9v2ssg9e8', NULL);
INSERT INTO `Sys_WorkFlowTableStep` VALUES ('DD170E44-48BD-4583-A0AC-E482474350FB', 'E49271E6-0B1B-455C-A765-74C9C876DB48', '28E37AA6-B6DF-4AF2-8188-A68B0571F650', 'hetlnr7jm', '报工数量<=500', 2, '2', 1, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'node', 'jg8cp5ijz', 'gu2g24vswf', NULL);

-- ----------------------------
-- Table structure for TestDb
-- ----------------------------
DROP TABLE IF EXISTS `TestDb`;
CREATE TABLE `TestDb`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TestDbName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TestDbContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of TestDb
-- ----------------------------

-- ----------------------------
-- Table structure for TestService
-- ----------------------------
DROP TABLE IF EXISTS `TestService`;
CREATE TABLE `TestService`  (
  `Id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DbName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DbContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateDate` datetime(0) NULL DEFAULT NULL,
  `CreateID` int(11) NULL DEFAULT NULL,
  `Creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Modifier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ModifyDate` datetime(0) NULL DEFAULT NULL,
  `ModifyID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of TestService
-- ----------------------------
INSERT INTO `TestService` VALUES ('C0737155-AC39-4F35-87DC-22DD83896CAD', '这是业务数据库', '这是业务数据库。。', '2023-05-19 11:46:34', 3362, '测试管理员', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
