/*
 Navicat Premium Data Transfer

 Source Server         : 127pgsql
 Source Server Type    : PostgreSQL
 Source Server Version : 110019
 Source Host           : localhost:5432
 Source Catalog        : vol_v3
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110019
 File Encoding         : 65001

 Date: 14/07/2025 19:17:24
*/


-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."products_id_seq";
CREATE SEQUENCE "public"."products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_city_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_city_id_seq";
CREATE SEQUENCE "public"."sys_city_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 500
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dictionary_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dictionary_id_seq";
CREATE SEQUENCE "public"."sys_dictionary_id_seq" 
INCREMENT 1
MINVALUE  1000
MAXVALUE 9223372036854775807
START 1000
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dictionarylist_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dictionarylist_id_seq";
CREATE SEQUENCE "public"."sys_dictionarylist_id_seq" 
INCREMENT 1
MINVALUE  1000
MAXVALUE 9223372036854775807
START 1000
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_log_id_seq";
CREATE SEQUENCE "public"."sys_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 200
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_menu_id_seq";
CREATE SEQUENCE "public"."sys_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 200
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_province_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_province_id_seq";
CREATE SEQUENCE "public"."sys_province_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 100
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_role_id_seq";
CREATE SEQUENCE "public"."sys_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 10
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_roleauth_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_roleauth_id_seq";
CREATE SEQUENCE "public"."sys_roleauth_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 100
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_tablecolumn_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_tablecolumn_id_seq";
CREATE SEQUENCE "public"."sys_tablecolumn_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1000
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_tableinfo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_tableinfo_id_seq";
CREATE SEQUENCE "public"."sys_tableinfo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 100
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_user_id_seq";
CREATE SEQUENCE "public"."sys_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 10000
CACHE 1;

-- ----------------------------
-- Table structure for FormCollectionObject
-- ----------------------------
DROP TABLE IF EXISTS "public"."FormCollectionObject";
CREATE TABLE "public"."FormCollectionObject" (
  "FormCollectionId" uuid NOT NULL,
  "FormId" uuid,
  "Title" text COLLATE "pg_catalog"."default",
  "FormData" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4
)
;

-- ----------------------------
-- Records of FormCollectionObject
-- ----------------------------
INSERT INTO "public"."FormCollectionObject" VALUES ('90513c4c-b639-4d0d-8c9d-fb69b77620f8', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-05\",\"field1641207457900\":null,\"field1641207424694\":\"\"}', '2022-01-03 19:06:50', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO "public"."FormCollectionObject" VALUES ('a37c1956-ddc0-457b-8f0a-93cdc44c257d', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"十分满意,相当满意\",\"field1641205647957\":\"相当满意\",\"field1641206608182\":\"没有意见\"}', '2022-01-03 19:05:46', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO "public"."FormCollectionObject" VALUES ('cccc519c-c448-4292-85d1-6a0ac2828fd9', '0431a578-bfc9-407f-b95e-321c350f10cb', NULL, '{\"FormId\":\"0431a578-bfc9-407f-b95e-321c350f10cb\",\"field1640871905593\":\"1\",\"field1640871902689\":\"2022-01-04\",\"field1641207457900\":\"123456\",\"field1641207424694\":\"\"}', '2022-01-03 19:09:53', 1, '超级管理员', NULL, NULL, NULL);
INSERT INTO "public"."FormCollectionObject" VALUES ('e913389c-e11a-4675-b8eb-a25c75086e37', '8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, '{\"FormId\":\"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da\",\"field1641205615398\":\"1\",\"field1641206170991\":\"非常满意,十分满意,相当满意\",\"field1641205647957\":\"非常满意\",\"field1641206608182\":\"1111\"}', '2022-01-03 19:09:45', 1, '超级管理员', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for FormDesignOptions
-- ----------------------------
DROP TABLE IF EXISTS "public"."FormDesignOptions";
CREATE TABLE "public"."FormDesignOptions" (
  "FormId" uuid NOT NULL,
  "Title" text COLLATE "pg_catalog"."default" NOT NULL,
  "DaraggeOptions" text COLLATE "pg_catalog"."default",
  "FormOptions" text COLLATE "pg_catalog"."default",
  "FormConfig" text COLLATE "pg_catalog"."default",
  "FormFields" text COLLATE "pg_catalog"."default",
  "TableConfig" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4
)
;

-- ----------------------------
-- Records of FormDesignOptions
-- ----------------------------
INSERT INTO "public"."FormDesignOptions" VALUES ('0431a578-bfc9-407f-b95e-321c350f10cb', '2021开发语言使用调查', '[{\"id\":5,\"name\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1640871905593\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":3,\"name\":\"从什么时候开始做开发?\",\"type\":\"date\",\"icon\":\"el-icon-date\",\"value\":null,\"field\":\"field1640871902689\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":2,\"name\":\"说点什么\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641207457900\",\"width\":100,\"readonly\":false,\"required\":false},{\"id\":9,\"name\":\"图片上传\",\"type\":\"img\",\"url\":\"\",\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"icon\":\"el-icon-picture-outline\",\"field\":\"field1641207424694\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1640871905593\":[],\"field1640871902689\":null,\"field1641207457900\":null,\"field1641207424694\":null},\"formOptions\":[[{\"field\":\"field1640871905593\",\"title\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}],[{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1640871905593\",\"title\":\"是否同时使用多种语言开发\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1640871902689\",\"title\":\"从什么时候开始做开发?\",\"type\":\"date\",\"required\":true,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207457900\",\"title\":\"说点什么\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12},{\"field\":\"field1641207424694\",\"title\":\"图片上传\",\"type\":\"img\",\"required\":false,\"readonly\":false,\"colSize\":12,\"maxSize\":3,\"fileInfo\":[],\"multiple\":false,\"autoUpload\":false,\"maxFile\":5,\"url\":\"\"}]', NULL, '[]', '2021-12-29 23:39:22', 1, '超级管理员', '超级管理员', '2022-01-03 19:00:30', 1);
INSERT INTO "public"."FormDesignOptions" VALUES ('8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', '2021双减政策调查', '[{\"id\":5,\"name\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"key\":\"enable\",\"field\":\"field1641205615398\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"否\"]},{\"id\":6,\"name\":\"您认为放学后作业对孩子的负担怎样?\",\"values\":[\"非常满意\"],\"type\":\"checkbox\",\"key\":\"满意度\",\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"icon\":\"el-icon-circle-check\",\"field\":\"field1641206170991\",\"width\":100,\"readonly\":false,\"required\":true},{\"id\":5,\"name\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"icon\":\"el-icon-aim\",\"value\":0,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"key\":\"满意度\",\"field\":\"field1641205647957\",\"width\":100,\"readonly\":false,\"required\":true,\"values\":[\"非常满意\"]},{\"id\":2,\"name\":\"其他意见\",\"type\":\"textarea\",\"value\":\"\",\"icon\":\"el-icon-document-copy\",\"field\":\"field1641206608182\",\"width\":100,\"readonly\":false,\"required\":false}]', '{\"fields\":{\"field1641205615398\":[],\"field1641206170991\":[],\"field1641205647957\":[],\"field1641206608182\":null},\"formOptions\":[[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"}],[{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"}],[{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]],\"tables\":[],\"tabs\":[]}', '[{\"field\":\"field1641205615398\",\"title\":\"您的孩子放学后是否有学校布置的书面作业?\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"0\",\"value\":\"否\"},{\"key\":\"2\",\"value\":\"xx11\"},{\"key\":\"1\",\"value\":\"是\"}],\"dataKey\":\"enable\"},{\"field\":\"field1641206170991\",\"title\":\"您认为放学后作业对孩子的负担怎样?\",\"type\":\"checkbox\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641205647957\",\"title\":\"作为家长,对当前双减政策是否满意？\",\"type\":\"radio\",\"required\":true,\"readonly\":false,\"colSize\":12,\"data\":[{\"key\":\"非常满意\",\"value\":\"非常满意\"},{\"key\":\"十分满意\",\"value\":\"十分满意\"},{\"key\":\"相当满意\",\"value\":\"相当满意\"}],\"dataKey\":\"满意度\"},{\"field\":\"field1641206608182\",\"title\":\"其他意见\",\"type\":\"textarea\",\"required\":false,\"readonly\":false,\"colSize\":12}]', NULL, '[]', '2021-12-30 21:45:16', 1, '超级管理员', '超级管理员', '2022-01-03 18:43:46', 1);

-- ----------------------------
-- Table structure for MES_Bom_Detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Bom_Detail";
CREATE TABLE "public"."MES_Bom_Detail" (
  "DomDetailId" text COLLATE "pg_catalog"."default" NOT NULL,
  "BomId" varchar(36) COLLATE "pg_catalog"."default",
  "Sequence" int4 NOT NULL,
  "MaterialCode" varchar(200) COLLATE "pg_catalog"."default",
  "MaterialName" text COLLATE "pg_catalog"."default",
  "Spec" varchar(200) COLLATE "pg_catalog"."default",
  "UsageQty" numeric(24,3) NOT NULL,
  "ConsumeModel" varchar(100) COLLATE "pg_catalog"."default",
  "Warehouse" varchar(100) COLLATE "pg_catalog"."default",
  "SupplierCode" varchar(50) COLLATE "pg_catalog"."default",
  "KitScale" numeric(24,3) DEFAULT NULL::numeric,
  "Enable" int4,
  "CreateID" int4,
  "Creator" varchar(50) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(50) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_Bom_Detail
-- ----------------------------
INSERT INTO "public"."MES_Bom_Detail" VALUES ('401FA70B-EF49-436E-9782-35B6D887759B', '1DC84B0C-2CD7-4709-B488-DF42CE36AB88', 1, 'BO01-0002-4', '机壳毛坯p38x66.3', '个', 400.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:33:00+08', 1, '超级管理员', '2025-03-19 01:31:31+08');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('531E804A-DF10-499B-AB26-775F68CB35AE', 'D57095E6-EF91-4F00-87CB-82E2DBB633D6', 2, 'BO01-0001-2', '机壳毛坯p38x66.2', NULL, 200.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:32:24+08', 1, '超级管理员', '2025-03-19 01:31:31+08');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('80DC11D2-ACE8-479B-B60C-18454BBA5CDB', '1DC84B0C-2CD7-4709-B488-DF42CE36AB88', 2, 'BO01-0001-3', '机壳毛坯p38x66.3', '个', 300.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:33:00+08', 1, '超级管理员', '2025-03-19 01:31:31+08');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('91AD77CF-F062-4C4F-87B2-7FE6AB942BBF', '0B713F05-5871-471E-8F03-8C0E8654C063', 1, 'BO01-0001', '机壳镀锌p38x66.1', '个', 100.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:25:00+08', 1, '超级管理员', '2025-03-19 01:31:31+08');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('C88C38B6-CBB5-44C4-A4EA-D9E1192E0359', '0B713F05-5871-471E-8F03-8C0E8654C063', 2, 'BO01-0001-1', '机壳镀锌p38x66.1', NULL, 200.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:31:31+08', 1, '超级管理员', '2025-03-19 01:31:31+08');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('EF77C899-95E9-48AB-9958-9CEB752788CD', 'D57095E6-EF91-4F00-87CB-82E2DBB633D6', 1, 'BO01-0002', '机壳毛坯p38x66.2', '个', 100.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:32:24+08', 1, '超级管理员', '2025-03-19 01:31:31+08');

-- ----------------------------
-- Table structure for MES_Bom_Main
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Bom_Main";
CREATE TABLE "public"."MES_Bom_Main" (
  "BomId" text COLLATE "pg_catalog"."default" NOT NULL,
  "Code" varchar(50) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(200) COLLATE "pg_catalog"."default",
  "MaterialName" text COLLATE "pg_catalog"."default",
  "Spec" text COLLATE "pg_catalog"."default",
  "Purpose" varchar(50) COLLATE "pg_catalog"."default",
  "Edition" varchar(50) COLLATE "pg_catalog"."default",
  "EffectiveDate" date NOT NULL,
  "InvalidDate" date NOT NULL,
  "Enable" int4 NOT NULL,
  "CreateID" int4 NOT NULL,
  "Creator" varchar(50) COLLATE "pg_catalog"."default",
  "CreateDate" date NOT NULL,
  "ModifyID" int4,
  "Modifier" varchar(50) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_Bom_Main
-- ----------------------------
INSERT INTO "public"."MES_Bom_Main" VALUES ('0B713F05-5871-471E-8F03-8C0E8654C063', '001-BO01-0001', '001-BO01-0001', 'H1001机壳镀锌p38x66.1', '个', '机加工', 'v1.0', '2025-03-19', '2025-03-19', 0, 1, '超级管理员', '2025-03-19', 1, '超级管理员', '2025-03-19 01:31:31+08');
INSERT INTO "public"."MES_Bom_Main" VALUES ('1DC84B0C-2CD7-4709-B488-DF42CE36AB88', '001-BO01-0003', '001-BO01-0003', 'H1001机壳镀锌p38x66.3', '个', '机加工', 'v1.0', '2025-03-19', '2025-03-19', 0, 1, '超级管理员', '2025-03-19', NULL, NULL, NULL);
INSERT INTO "public"."MES_Bom_Main" VALUES ('D57095E6-EF91-4F00-87CB-82E2DBB633D6', '001-BO01-0002', '001-BO01-0002', 'H1001机壳镀锌p38x66.1', '个', '机加工', 'v1.0', '2025-03-19', '2025-03-19', 0, 1, '超级管理员', '2025-03-19', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_Customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Customer";
CREATE TABLE "public"."MES_Customer" (
  "CustomerID" uuid NOT NULL,
  "CustomerName" varchar(100) COLLATE "pg_catalog"."default",
  "ContactPerson" varchar(100) COLLATE "pg_catalog"."default",
  "ContactPhone" varchar(100) COLLATE "pg_catalog"."default",
  "Email" varchar(100) COLLATE "pg_catalog"."default",
  "Address" varchar(100) COLLATE "pg_catalog"."default",
  "CustomerType" varchar(100) COLLATE "pg_catalog"."default",
  "CreditRating" varchar(100) COLLATE "pg_catalog"."default",
  "BusinessScope" varchar(100) COLLATE "pg_catalog"."default",
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_Customer
-- ----------------------------
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3835-0289-11f0-92bb-52540099312c', '辉煌科技集团', '李阳', '13900139000', 'liyang@huihuang.com', '北京市海淀区创新大道2号', '重要客户', 'A', '通信设备研发与生产', '业务量大，需重点跟进', 1, 'admin', '2023-02-01 09:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb39e8-0289-11f0-92bb-52540099312c', '星辰电子公司', '王芳', '13600136000', 'wangfang@xingchen.com', '深圳市南山区创业路3号', '新客户', 'B+', '电子零部件生产', '潜力较大，需加强沟通', 1, 'admin', '2023-03-01 10:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3aeb-0289-11f0-92bb-52540099312c', '阳光电子集团', '陈静', '13300133000', 'chenjing@yangguang.com', '杭州市西湖区科技园区5号', '长期合作客户', 'A', 'LED照明产品制造', '合作良好，定期回访', 1, 'admin', '2023-05-01 12:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3b9c-0289-11f0-92bb-52540099312c', '瑞风科技有限公司', '赵刚', '13700137000', 'zhaogang@ruifeng.com', '广州市天河区软件园4号', '普通客户', 'B', '智能家居产品研发', '偶尔下单，保持联系', 1, 'admin', '2023-04-01 11:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3c2c-0289-11f0-92bb-52540099312c', '卓越电子有限公司', '张悦', '13800138000', 'zhangyue@zhuoyue.com', '上海市浦东新区科技路1号', '长期合作客户', 'A+', '消费电子产品制造', '合作多年，订单稳定', 1, 'admin', '2023-01-01 08:00:00+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_DefectiveProductDisposalRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_DefectiveProductDisposalRecord";
CREATE TABLE "public"."MES_DefectiveProductDisposalRecord" (
  "DisposalRecordID" uuid NOT NULL,
  "DefectiveID" varchar(36) COLLATE "pg_catalog"."default",
  "DisposalPerson" varchar(100) COLLATE "pg_catalog"."default",
  "DisposalStartTime" timestamptz(6),
  "DisposalEndTime" timestamptz(6),
  "DisposalResult" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_DefectiveProductDisposalRecord
-- ----------------------------

-- ----------------------------
-- Table structure for MES_DefectiveProductRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_DefectiveProductRecord";
CREATE TABLE "public"."MES_DefectiveProductRecord" (
  "DefectiveID" uuid NOT NULL,
  "ReportingID" varchar(36) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default",
  "DefectiveQuantity" int4 NOT NULL,
  "DefectType" varchar(100) COLLATE "pg_catalog"."default",
  "DefectReason" varchar(100) COLLATE "pg_catalog"."default",
  "DisposalMethod" varchar(100) COLLATE "pg_catalog"."default",
  "DisposalStatus" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_DefectiveProductRecord
-- ----------------------------
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('84348030-03e0-11f0-92bb-52540099312c', '7E80D01E-03E0-11F0-92BB-52540099312C', 'M001', '电阻', '100Ω', 20, '阻值偏差', '生产工艺问题', '报废', '已处理', 1, 'admin', '2024-06-01 15:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('843483f9-03e0-11f0-92bb-52540099312c', '7E80D290-03E0-11F0-92BB-52540099312C', 'M002', '电容', '10μF', 20, '容量不达标', '原材料质量问题', '报废', '已处理', 1, 'admin', '2024-06-02 16:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('84348505-03e0-11f0-92bb-52540099312c', '7E80D2D4-03E0-11F0-92BB-52540099312C', 'M003', '线路板', 'PCB-A100', 20, '线路短路', '加工过程失误', '维修后再检验', '已处理', 1, 'admin', '2024-06-03 17:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('843485ab-03e0-11f0-92bb-52540099312c', '7E80D2FE-03E0-11F0-92BB-52540099312C', 'M004', '塑料粒子', 'PP-500', 50, '产品变形', '注塑参数不当', '报废', '已处理', 1, 'admin', '2024-06-04 18:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('8434864a-03e0-11f0-92bb-52540099312c', '7E80D322-03E0-11F0-92BB-52540099312C', 'M005', '螺丝', 'M3x10', 50, '螺纹损坏', '加工精度不够', '报废', '已处理', 1, 'admin', '2024-06-05 19:00:00+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_EquipmentFaultRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentFaultRecord";
CREATE TABLE "public"."MES_EquipmentFaultRecord" (
  "FaultRecordID" uuid NOT NULL,
  "EquipmentID" varchar(36) COLLATE "pg_catalog"."default",
  "FaultDate" timestamptz(6),
  "FaultType" varchar(100) COLLATE "pg_catalog"."default",
  "FaultDescription" varchar(100) COLLATE "pg_catalog"."default",
  "FaultImpact" varchar(100) COLLATE "pg_catalog"."default",
  "FaultReportedBy" varchar(100) COLLATE "pg_catalog"."default",
  "FaultStatus" varchar(100) COLLATE "pg_catalog"."default",
  "TroubleshootingStartTime" timestamptz(6),
  "TroubleshootingEndTime" timestamptz(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_EquipmentFaultRecord
-- ----------------------------
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f43c-0290-11f0-92bb-52540099312c', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-06-01 08:00:00+08', '电气故障', '设备突然断电', '生产中断', '李明', '已解决', '2024-06-01 08:15:00+08', '2024-06-01 09:30:00+08', 1, 'admin', '2024-06-01 08:00:00+08', 1, '超级管理员', '2025-03-17 02:04:14+08');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f60c-0290-11f0-92bb-52540099312c', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-06-02 09:00:00+08', '机械故障', '模具开合异常', '影响产品成型质量', '张华', '已解决', '2024-06-02 09:10:00+08', '2024-06-02 11:00:00+08', 1, 'admin', '2024-06-02 09:00:00+08', 1, '超级管理员', '2025-03-17 02:04:11+08');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f707-0290-11f0-92bb-52540099312c', 'BDBB37EF-028F-11F0-92BB-52540099312C', '2024-06-03 10:00:00+08', '软件故障', '检测程序报错', '无法正常检测产品', '陈丽', '已解决', '2024-06-03 10:15:00+08', '2024-06-03 12:00:00+08', 1, 'admin', '2024-06-03 10:00:00+08', 1, '超级管理员', '2025-03-17 02:04:05+08');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f7b4-0290-11f0-92bb-52540099312c', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-06-04 11:00:00+08', '传感器故障', '螺丝拧紧量检测传感器失灵', '螺丝拧紧质量不稳定', '王强', '已解决', '2024-06-04 11:10:00+08', '2024-06-04 13:00:00+08', 1, 'admin', '2024-06-04 11:00:00+08', 1, '超级管理员', '2025-03-17 02:04:01+08');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f849-0290-11f0-92bb-52540099312c', 'BDBB34F1-028F-11F0-92BB-52540099312C', '2024-06-05 12:00:00+08', '加热故障', '回流焊温度达不到设定值', '焊接效果不佳', '李明', '已解决', '2024-06-05 12:15:00+08', '2024-06-05 14:00:00+08', 1, 'admin', '2024-06-05 12:00:00+08', 1, '超级管理员', '2025-03-17 02:03:57+08');

-- ----------------------------
-- Table structure for MES_EquipmentMaintenance
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentMaintenance";
CREATE TABLE "public"."MES_EquipmentMaintenance" (
  "MaintenanceID" uuid NOT NULL,
  "EquipmentID" varchar(36) COLLATE "pg_catalog"."default",
  "MaintenanceDate" timestamptz(6),
  "MaintenanceType" varchar(100) COLLATE "pg_catalog"."default",
  "MaintenanceContent" varchar(100) COLLATE "pg_catalog"."default",
  "MaintenancePerson" varchar(100) COLLATE "pg_catalog"."default",
  "MaintenanceStatus" varchar(100) COLLATE "pg_catalog"."default",
  "NextMaintenanceDate" timestamptz(6),
  "MaintenanceCost" numeric(10,2) DEFAULT NULL::numeric,
  "MaintenanceRemarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_EquipmentMaintenance
-- ----------------------------
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488d2d-0291-11f0-92bb-52540099312c', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-02-06 09:00:00+08', '日常保养', '润滑机械部件、检查电路', '王师傅', '已完成', '2024-03-06 09:00:00+08', 600.00, '无异常', 1, 'admin', '2024-02-06 09:00:00+08', 1, '超级管理员', '2025-03-17 02:06:41+08');
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488e2d-0291-11f0-92bb-52540099312c', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-03-07 10:00:00+08', '深度保养', '更换易损件、全面检测', '张师傅', '已完成', '2024-04-07 10:00:00+08', 1200.00, '设备性能稳定', 1, 'admin', '2024-03-07 10:00:00+08', 1, '超级管理员', '2025-03-17 02:06:33+08');
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488eea-0291-11f0-92bb-52540099312c', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-04-08 11:00:00+08', '定期保养', '清洁、调试设备', '李师傅', '已完成', '2024-05-08 11:00:00+08', 900.00, '设备正常运行', 1, 'admin', '2024-04-08 11:00:00+08', 1, '超级管理员', '2025-03-17 02:06:29+08');
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488fb2-0291-11f0-92bb-52540099312c', 'BDBB36EC-028F-11F0-92BB-52540099312C', '2024-05-09 12:00:00+08', '日常保养', '检查焊接头、清理灰尘', '赵师傅', '已完成', '2024-06-09 12:00:00+08', 700.00, '无明显问题', 1, 'admin', '2024-05-09 12:00:00+08', 1, '超级管理员', '2025-03-17 02:06:26+08');

-- ----------------------------
-- Table structure for MES_EquipmentManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentManagement";
CREATE TABLE "public"."MES_EquipmentManagement" (
  "EquipmentID" uuid NOT NULL,
  "EquipmentCode" varchar(100) COLLATE "pg_catalog"."default",
  "EquipmentName" varchar(100) COLLATE "pg_catalog"."default",
  "EquipmentType" varchar(100) COLLATE "pg_catalog"."default",
  "Manufacturer" varchar(100) COLLATE "pg_catalog"."default",
  "PurchaseDate" timestamptz(6),
  "WarrantyPeriod" int4,
  "InstallationLocation" varchar(100) COLLATE "pg_catalog"."default",
  "EquipmentStatus" varchar(100) COLLATE "pg_catalog"."default",
  "ResponsiblePerson" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_EquipmentManagement
-- ----------------------------
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb34f1-028f-11f0-92bb-52540099312c', 'EQ001', 'SMT贴片机', '电子制造设备', '三星电子', '2023-01-01 08:00:00+08', 12, '生产车间A区1号', '运行正常', '李明', 1, 'admin', '2024-01-01 08:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb36ec-028f-11f0-92bb-52540099312c', 'EQ002', '注塑机', '塑料加工设备', '海天塑机', '2023-02-01 09:00:00+08', 10, '生产车间B区2号', '运行中', '张华', 1, 'admin', '2024-02-01 09:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb37ef-028f-11f0-92bb-52540099312c', 'EQ003', '检测仪器', '质量检测设备', '泰瑞达科技', '2023-03-01 10:00:00+08', 15, '生产车间D区4号', '正常使用', '陈丽', 1, 'admin', '2024-03-01 10:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb38a2-028f-11f0-92bb-52540099312c', 'EQ004', '自动螺丝机', '装配设备', '拓普机械', '2023-04-01 11:00:00+08', 11, '生产车间C区3号', '运行平稳', '王强', 1, 'admin', '2024-04-01 11:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb3938-028f-11f0-92bb-52540099312c', 'EQ005', '回流焊炉', '焊接设备', '日东电子', '2023-05-01 12:00:00+08', 13, '生产车间A区1号', '正常运转', '李明', 1, 'admin', '2024-05-01 12:00:00+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_EquipmentRepair
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentRepair";
CREATE TABLE "public"."MES_EquipmentRepair" (
  "RepairID" uuid NOT NULL,
  "EquipmentID" varchar(36) COLLATE "pg_catalog"."default",
  "RepairDate" timestamptz(6),
  "RepairReason" varchar(100) COLLATE "pg_catalog"."default",
  "RepairContent" varchar(100) COLLATE "pg_catalog"."default",
  "RepairPerson" varchar(100) COLLATE "pg_catalog"."default",
  "RepairCost" numeric(10,2) DEFAULT NULL::numeric,
  "RepairStatus" varchar(100) COLLATE "pg_catalog"."default",
  "RepairStartTime" timestamptz(6),
  "RepairEndTime" timestamptz(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_EquipmentRepair
-- ----------------------------
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a230-0290-11f0-92bb-52540099312c', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-01-10 09:00:00+08', '贴装头故障', '更换贴装头', '张师傅', 5000.00, '已完成', '2024-01-10 09:30:00+08', '2024-01-10 15:00:00+08', 1, 'admin', '2024-01-10 09:00:00+08', 1, '超级管理员', '2025-03-17 02:00:41+08');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a3fb-0290-11f0-92bb-52540099312c', 'BDBB3938-028F-11F0-92BB-52540099312C', '2024-02-15 10:00:00+08', '注塑压力不稳定', '检查液压系统并维修', '李师傅', 3500.00, '已完成', '2024-02-15 10:30:00+08', '2024-02-15 16:00:00+08', 1, 'admin', '2024-02-15 10:00:00+08', 1, '超级管理员', '2025-03-17 02:00:36+08');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a509-0290-11f0-92bb-52540099312c', 'BDBB38A2-028F-11F0-92BB-52540099312C', '2024-03-20 11:00:00+08', '检测精度下降', '校准检测传感器', '赵师傅', 2000.00, '已完成', '2024-03-20 11:30:00+08', '2024-03-20 14:00:00+08', 1, 'admin', '2024-03-20 11:00:00+08', 1, '超级管理员', '2025-03-17 02:00:56+08');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a5c0-0290-11f0-92bb-52540099312c', 'BDBB34F1-028F-11F0-92BB-52540099312C', '2024-04-25 12:00:00+08', '螺丝拧紧力度不均匀', '调整拧紧扭矩装置', '孙师傅', 1500.00, '已完成', '2024-04-25 12:30:00+08', '2024-04-25 15:30:00+08', 1, 'admin', '2024-04-25 12:00:00+08', 1, '超级管理员', '2025-03-17 02:00:24+08');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a654-0290-11f0-92bb-52540099312c', 'BDBB34F1-028F-11F0-92BB-52540099312C', '2024-05-30 13:00:00+08', '温度控制异常', '维修温度控制器', '周师傅', 2500.00, '已完成', '2024-05-30 13:30:00+08', '2024-05-30 17:00:00+08', 1, 'admin', '2024-05-30 13:00:00+08', 1, '超级管理员', '2025-03-17 02:00:21+08');

-- ----------------------------
-- Table structure for MES_InventoryManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_InventoryManagement";
CREATE TABLE "public"."MES_InventoryManagement" (
  "InventoryID" uuid NOT NULL,
  "DocumentNo" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "SpecificationModel" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseID" varchar(36) COLLATE "pg_catalog"."default",
  "LocationID" varchar(36) COLLATE "pg_catalog"."default",
  "InventoryQuantity" int4 NOT NULL,
  "InventoryUnit" varchar(100) COLLATE "pg_catalog"."default",
  "InventoryCost" numeric(10,2) NOT NULL,
  "InventoryStatus" varchar(100) COLLATE "pg_catalog"."default",
  "InboundDate" timestamptz(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_InventoryManagement
-- ----------------------------
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a95724d', 'INV001', '螺丝', 'S001', 'M5*10', '3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 500, '个', 0.50, '在库', '2024-01-01 08:00:00+08', 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:46:23+08');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a95724e', 'INV002', '螺母', 'N001', 'M5', '3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 300, '个', 0.30, '在库', '2024-01-02 09:00:00+08', 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:47:04+08');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a95724f', 'INV003', '成品A', 'P001', 'V1.0', '3A765F84-49A6-4F42-9639-2A9C58D832C5', '1C19C214-9D78-4596-B078-789F7755896B', 200, '件', 100.00, '在库', '2024-01-03 10:00:00+08', 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:46:40+08');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a957250', 'INV004', '半成品B', 'SP001', '半加工状态', '3A765F84-49A6-4F42-9639-2A9C58D832C6', '1C19C214-9D78-4596-B078-789F7755896C', 150, '件', 50.00, '在库', '2024-01-04 11:00:00+08', 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:46:49+08');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a957251', 'INV005', '包装纸箱', 'C001', '50*40*30cm', '3A765F84-49A6-4F42-9639-2A9C58D832C8', '1C19C214-9D78-4596-B078-789F7755896E', 400, '个', 5.00, '在库', '2024-01-05 12:00:00+08', 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:46:55+08');

-- ----------------------------
-- Table structure for MES_LocationManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_LocationManagement";
CREATE TABLE "public"."MES_LocationManagement" (
  "LocationID" uuid NOT NULL,
  "WarehouseID" varchar(36) COLLATE "pg_catalog"."default",
  "LocationCode" varchar(100) COLLATE "pg_catalog"."default",
  "LocationName" varchar(100) COLLATE "pg_catalog"."default",
  "LocationType" varchar(100) COLLATE "pg_catalog"."default",
  "LocationCapacity" int4 NOT NULL,
  "LocationStatus" varchar(100) COLLATE "pg_catalog"."default",
  "LocationRow" int4 NOT NULL,
  "LocationColumn" int4 NOT NULL,
  "LocationFloor" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_LocationManagement
-- ----------------------------
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c4', '1C19C214-9D78-4596-B078-789F7755896A', 'L001', 'A区001', '普通货位', 100, '空闲', 1, 1, 1, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:47:51+08');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c5', '1C19C214-9D78-4596-B078-789F7755896B', 'L002', 'B区002', '普通货位', 150, '占用', 2, 2, 1, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:47:57+08');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c6', '1C19C214-9D78-4596-B078-789F7755896C', 'L003', 'C区003', '普通货位', 120, '空闲', 3, 3, 1, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:48:03+08');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c7', '1C19C214-9D78-4596-B078-789F7755896D', 'L004', 'D区004', '不良品货位', 50, '占用', 4, 4, 1, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:48:13+08');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c8', '1C19C214-9D78-4596-B078-789F7755896E', 'L005', 'E区005', '普通货位', 180, '空闲', 5, 5, 1, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:48:19+08');

-- ----------------------------
-- Table structure for MES_Material
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Material";
CREATE TABLE "public"."MES_Material" (
  "MaterialID" uuid NOT NULL,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialType" varchar(100) COLLATE "pg_catalog"."default",
  "CatalogID" varchar(36) COLLATE "pg_catalog"."default",
  "Specification" varchar(100) COLLATE "pg_catalog"."default",
  "Unit" varchar(100) COLLATE "pg_catalog"."default",
  "Price" numeric(10,2) DEFAULT NULL::numeric,
  "Img" text COLLATE "pg_catalog"."default",
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_Material
-- ----------------------------
INSERT INTO "public"."MES_Material" VALUES ('8754ed7a-e845-42a1-9b51-6735091653f4', 'AKG0000004', '米其林轮胎', NULL, '40F6F014-B41F-400E-AD49-ED4B109CF5F3', '。。。。。。。', '件', NULL, NULL, '。。。。。。。。', 1, '超级管理员', '2025-03-18 14:12:26+08', 1, '超级管理员', '2025-03-18 14:13:00+08');
INSERT INTO "public"."MES_Material" VALUES ('9f7e972a-028b-11f0-92bb-52540099312c', 'AKG0000001', '碳素结构钢', '金属材料', '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 'Q235B，厚度 5mm', '吨', 4500.00, 'Upload/Tables/MES_Material/202503170240379198/wechat.jpg', '常用于建筑结构', 1, '管理员', '2025-03-17 01:25:14+08', 1, '超级管理员', '2025-03-17 11:47:53+08');
INSERT INTO "public"."MES_Material" VALUES ('9f7e990f-028b-11f0-92bb-52540099312c', 'AKG0000002', '架构芯片', '电子元器件', '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 'Cortex - M3 内核，主频 100MHz', '片', 50.00, 'Upload/Tables/MES_Material/202503170240426945/wechat.jpg', '适用于嵌入式系统开发', 1, '管理员', '2025-03-17 01:25:14+08', 1, '超级管理员', '2025-03-17 11:48:28+08');
INSERT INTO "public"."MES_Material" VALUES ('9f7e99fd-028b-11f0-92bb-52540099312c', 'AKG0000003', '聚乙烯（PE）', '化工原料', '0B24ACBF-AC77-4355-966A-71F394020C6D', '低密度，颗粒状', '件', 10.00, 'Upload/Tables/MES_Material/202503170240509540/wechat.jpg', '可用于塑料制品生产', 1, '管理员', '2025-03-17 01:25:14+08', 1, '超级管理员', '2025-03-17 11:49:11+08');
INSERT INTO "public"."MES_Material" VALUES ('9f7e9a54-028b-11f0-92bb-52540099312c', 'AKG0000004', '双层瓦楞纸箱', '包装材料', '43175A13-251A-4481-B515-87A9D22A547B', '尺寸：500mm×300mm×200mm', '件', 5.00, NULL, '用于产品包装运输', 1, '管理员', '2025-03-17 01:25:14+08', 1, '超级管理员', '2025-03-17 11:49:17+08');
INSERT INTO "public"."MES_Material" VALUES ('9f7e9aac-028b-11f0-92bb-52540099312c', 'AKG0000005', 'A4 复印纸', '办公用品', '43175A13-251A-4481-B515-87A9D22A547B', '70g，500 张/包', '包', 20.00, NULL, '适用于日常办公复印', 1, '管理员', '2025-03-17 01:25:14+08', 1, '超级管理员', '2025-03-17 11:48:52+08');

-- ----------------------------
-- Table structure for MES_MaterialCatalog
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_MaterialCatalog";
CREATE TABLE "public"."MES_MaterialCatalog" (
  "CatalogID" uuid NOT NULL,
  "CatalogCode" varchar(100) COLLATE "pg_catalog"."default",
  "CatalogName" varchar(100) COLLATE "pg_catalog"."default",
  "CatalogType" varchar(100) COLLATE "pg_catalog"."default",
  "ParentId" varchar(36) COLLATE "pg_catalog"."default",
  "Enable" int4,
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_MaterialCatalog
-- ----------------------------
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('0b24acbf-ac77-4355-966a-71f394020c6d', 'A0008', '助焊剂', NULL, '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 1, '。。。', 1, '超级管理员', '2025-03-17 11:45:07+08', 1, '超级管理员', '2025-03-17 11:45:14+08');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('40f6f014-b41f-400e-ad49-ed4b109cf5f3', 'A0001', '原材料', NULL, NULL, 1, '。。。。', 1, '超级管理员', '2025-03-17 11:36:25+08', 1, '超级管理员', '2025-03-17 11:46:03+08');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('43175a13-251a-4481-b515-87a9d22a547b', 'A0005', '引线框架', NULL, 'EF241017-FBCE-42AF-942A-6D2531929CC4', 1, '。。。。。', 1, '超级管理员', '2025-03-17 11:43:42+08', 1, '超级管理员', '2025-03-17 11:44:36+08');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('8f258988-157e-4e81-9076-44a86d1946cb', 'A0006', '覆铜板', NULL, 'EF241017-FBCE-42AF-942A-6D2531929CC4', 1, NULL, 1, '超级管理员', '2025-03-17 11:44:24+08', 1, '超级管理员', '2025-03-17 11:46:22+08');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('b8ccd002-73b9-4bb0-b40f-fbca161b3443', 'A0007', '粘合剂', NULL, '40F6F014-B41F-400E-AD49-ED4B109CF5F3', 1, '。。。', 1, '超级管理员', '2025-03-17 11:44:52+08', 1, '超级管理员', '2025-03-17 11:46:25+08');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('ef241017-fbce-42af-942a-6d2531929cc4', 'A0003', '半成品', NULL, NULL, 1, '。。。。。。', 1, '超级管理员', '2025-03-17 11:36:47+08', 1, '超级管理员', '2025-03-17 11:36:53+08');

-- ----------------------------
-- Table structure for MES_Process
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Process";
CREATE TABLE "public"."MES_Process" (
  "ProcessID" uuid NOT NULL,
  "ProcessCode" varchar(100) COLLATE "pg_catalog"."default",
  "ProcessName" varchar(100) COLLATE "pg_catalog"."default",
  "ProcessType" varchar(100) COLLATE "pg_catalog"."default",
  "ProcessSequence" int4 NOT NULL,
  "ProcessDescription" varchar(100) COLLATE "pg_catalog"."default",
  "WorkCenter" varchar(100) COLLATE "pg_catalog"."default",
  "StandardWorkingHours" numeric(10,2) NOT NULL,
  "ProcessStatus" varchar(100) COLLATE "pg_catalog"."default",
  "ResponsibleWorker" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_Process
-- ----------------------------
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', 'PAK00001', '切割工序', '加工工序', 1, '对原材料进行切割处理', 'WC01', 2.50, '正常', '张师傅', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-18 14:00:07+08');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', 'PAK00002', '焊接工序', '加工工序', 2, '将切割后的部件进行焊接组装', 'WC02', 3.00, '正常', '李师傅', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-18 14:00:58+08');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', 'PAK00003', '打磨工序', '加工工序', 3, '对焊接后的产品进行打磨处理', 'WC03', 2.00, '正常', '王师傅', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-17 02:17:40+08');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', 'PAK00004', '喷漆工序', '表面处理工序', 4, '对打磨后的产品进行喷漆操作', 'WC04', 1.50, '正常', '赵师傅', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-17 02:17:45+08');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2e', 'PAK00005', '质检工序', '质量检测工序', 5, '对产品进行质量检测', 'WC05', 1.00, '正常', '孙师傅', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-17 02:17:50+08');

-- ----------------------------
-- Table structure for MES_ProcessReport
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProcessReport";
CREATE TABLE "public"."MES_ProcessReport" (
  "ReportID" uuid NOT NULL,
  "ProcessID" varchar(36) COLLATE "pg_catalog"."default",
  "ReportDate" date NOT NULL,
  "CompletedQuantity" int4 NOT NULL,
  "DefectiveQuantity" int4 NOT NULL,
  "ReportedBy" varchar(100) COLLATE "pg_catalog"."default",
  "ReportStatus" varchar(100) COLLATE "pg_catalog"."default",
  "ReportRemarks" varchar(100) COLLATE "pg_catalog"."default",
  "StartTime" timestamptz(6),
  "EndTime" timestamptz(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProcessReport
-- ----------------------------
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348b0e-0295-11f0-92bb-52540099312c', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', '2024-01-16', 50, 2, '张师傅', '已完成', '切割过程中发现2个次品', '2024-01-16 07:00:00+08', '2024-01-16 08:00:00+08', 1, 'admin', '2025-03-16 23:16:25+08', 1, 'admin', '2025-03-16 23:16:25+08');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348cd3-0295-11f0-92bb-52540099312c', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', '2024-01-16', 40, 1, '李师傅', '已完成', '焊接时有1个产品焊接不牢', '2024-01-16 08:30:00+08', '2024-01-16 09:30:00+08', 1, 'admin', '2025-03-16 23:16:25+08', 1, 'admin', '2025-03-16 23:16:25+08');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348dd7-0295-11f0-92bb-52540099312c', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '2024-01-16', 35, 0, '王师傅', '已完成', '打磨过程顺利', '2024-01-16 10:00:00+08', '2024-01-16 11:00:00+08', 1, 'admin', '2025-03-16 23:16:25+08', 1, 'admin', '2025-03-16 23:16:25+08');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348e97-0295-11f0-92bb-52540099312c', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '2024-01-16', 45, 3, '赵师傅', '已完成', '喷漆颜色有偏差3个产品', '2024-01-16 11:30:00+08', '2024-01-16 12:30:00+08', 1, 'admin', '2025-03-16 23:16:25+08', 1, 'admin', '2025-03-16 23:16:25+08');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348f65-0295-11f0-92bb-52540099312c', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', '2024-01-16', 50, 1, '孙师傅', '已完成', '1个产品质检不合格', '2024-01-16 13:00:00+08', '2024-01-16 14:00:00+08', 1, 'admin', '2025-03-16 23:16:25+08', 1, 'admin', '2025-03-16 23:16:25+08');

-- ----------------------------
-- Table structure for MES_ProcessRoute
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProcessRoute";
CREATE TABLE "public"."MES_ProcessRoute" (
  "RouteID" uuid NOT NULL,
  "ProcessID" varchar(36) COLLATE "pg_catalog"."default",
  "ProductID" varchar(100) COLLATE "pg_catalog"."default",
  "ProductName" varchar(100) COLLATE "pg_catalog"."default",
  "RouteSequence" int4 NOT NULL,
  "RouteDescription" varchar(100) COLLATE "pg_catalog"."default",
  "PreProcessID" varchar(36) COLLATE "pg_catalog"."default",
  "NextProcessID" varchar(36) COLLATE "pg_catalog"."default",
  "RouteStatus" varchar(100) COLLATE "pg_catalog"."default",
  "RouteResponsible" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProcessRoute
-- ----------------------------
INSERT INTO "public"."MES_ProcessRoute" VALUES ('30142e89-8086-40e3-a0c4-ea8bc24ebc7d', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', NULL, '工艺路径03', 3, '工艺路径03', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '1', NULL, 1, '超级管理员', '2025-03-18 14:00:07+08', 1, '超级管理员', '2025-03-18 14:00:07+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2a', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', 'P0001', '工艺路径01', 1, '产品A的工艺路线第一步 - 切割', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-18 14:00:07+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2b', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', 'P0001', '喷漆01', 1, '喷漆01', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-18 14:00:58+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2c', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', 'P0001', '产品A', 3, '产品A的工艺路线第三步 - 打磨', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-17 02:17:40+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2d', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', 'P0001', '产品A', 4, '产品A的工艺路线第四步 - 喷漆', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-17 02:17:45+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2e', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', 'P0001', '产品A', 5, '产品A的工艺路线第五步 - 质检', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', NULL, '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25+08', 1, '超级管理员', '2025-03-17 02:17:50+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('be7bca96-d2b1-42be-a23c-a5e75b26fc8d', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', NULL, '工艺路径02', 2, '工艺路径01', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2A', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2C', '1', NULL, 1, '超级管理员', '2025-03-17 02:22:19+08', 1, '超级管理员', '2025-03-18 14:00:07+08');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('c33a1f4e-5ace-4f58-95c2-6f15f8e64950', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2B', NULL, '喷漆02', 2, '喷漆02', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2D', '4F8D7A5B-2C4E-4D75-8B9A-3D6754F97E2E', '1', NULL, 1, '超级管理员', '2025-03-18 14:00:58+08', 1, '超级管理员', '2025-03-18 14:00:58+08');

-- ----------------------------
-- Table structure for MES_ProductInbound
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductInbound";
CREATE TABLE "public"."MES_ProductInbound" (
  "InboundID" uuid NOT NULL,
  "DocumentNo" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "SpecificationModel" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseID" varchar(36) COLLATE "pg_catalog"."default",
  "LocationID" varchar(36) COLLATE "pg_catalog"."default",
  "InboundQuantity" int4 NOT NULL,
  "InboundUnit" varchar(100) COLLATE "pg_catalog"."default",
  "InboundDate" timestamptz(6),
  "InboundOperator" varchar(100) COLLATE "pg_catalog"."default",
  "InboundReason" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductInbound
-- ----------------------------
INSERT INTO "public"."MES_ProductInbound" VALUES ('528599a8-a80b-4854-9184-03b998fcf75a', 'IN202503170001', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '1C19C214-9D78-4596-B078-789F7755896B', 200, '个', '2024-01-06 08:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:21+08', 1, '超级管理员', '2025-03-20 17:36:23+08');
INSERT INTO "public"."MES_ProductInbound" VALUES ('687c6fe1-6849-46c6-a9d7-96f80e10e827', 'IN202503170001', '米其林轮胎', 'AKG0000004', '。。。。。。。', NULL, '1C19C214-9D78-4596-B078-789F7755896D', 200, '个', '2024-01-06 08:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:59:01+08', 1, '超级管理员', '2025-03-20 17:35:59+08');
INSERT INTO "public"."MES_ProductInbound" VALUES ('75013787-8e21-49c7-a488-1cff0b051f6e', 'IN202503170001', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '1C19C214-9D78-4596-B078-789F7755896A', 200, '个', '2024-01-06 08:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:24+08', 1, '超级管理员', '2025-03-20 17:36:14+08');
INSERT INTO "public"."MES_ProductInbound" VALUES ('e080e4f0-1fd8-4bbf-97b0-045fda9a5207', 'IN202503170001', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '1C19C214-9D78-4596-B078-789F7755896D', 200, '个', '2024-01-06 08:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:55+08', 1, '超级管理员', '2025-03-20 17:36:06+08');

-- ----------------------------
-- Table structure for MES_ProductOutbound
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductOutbound";
CREATE TABLE "public"."MES_ProductOutbound" (
  "OutboundID" uuid NOT NULL,
  "DocumentNo" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "SpecificationModel" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseID" varchar(36) COLLATE "pg_catalog"."default",
  "LocationID" varchar(36) COLLATE "pg_catalog"."default",
  "OutboundQuantity" int4 NOT NULL,
  "OutboundUnit" varchar(100) COLLATE "pg_catalog"."default",
  "OutboundDate" timestamptz(6),
  "OutboundOperator" varchar(100) COLLATE "pg_catalog"."default",
  "OutboundReason" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductOutbound
-- ----------------------------
INSERT INTO "public"."MES_ProductOutbound" VALUES ('087d6390-c914-4949-b397-3cf5bfe66df0', 'OB20250317006', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:14+08', 1, '超级管理员', '2025-03-20 17:38:07+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('323adf96-5391-45a6-bd03-69ebe526a933', 'OB20250317008', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:26+08', 1, '超级管理员', '2025-03-20 17:37:58+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('623a152c-d7d6-4aba-9456-092d1b5902b1', 'OB20250317010', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 50, '个', '2024-01-15 12:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:34+08', 1, '超级管理员', '2025-03-20 17:37:47+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('688f2d79-c448-4c91-99ff-ca65448a38d7', 'OB20250317012', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 12, '箱', '2024-01-15 12:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:47+08', 1, '超级管理员', '2025-03-20 17:37:34+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('7ac2fe76-c1a5-49af-b441-91c722e35759', 'OB20250317003', '包装纸箱', 'C001', '50*40*30cm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 50, '个', '2024-01-15 12:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:38:12+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_ProductOutbound" VALUES ('80f59df8-dbd6-47c8-b1ee-9700ad876902', 'OB20250317009', '米其林轮胎', 'AKG0000004', '。。。。。。。', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:29+08', 1, '超级管理员', '2025-03-20 17:37:52+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('84a80744-df64-4b5e-b810-4028f57f405a', 'OB20250317005', 'A4 复印纸', 'AKG0000005', '70g，500 张/包', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:53:48+08', 1, '超级管理员', '2025-03-20 17:38:15+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('9784e034-5ef3-4a5f-bd4e-6183c2e8ee25', 'OB20250317011', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 12, '箱', '2024-01-15 12:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:39+08', 1, '超级管理员', '2025-03-20 17:37:41+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('c1151e9d-704b-4abc-b8b9-8989eff162a7', 'OB20250317007', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:23+08', 1, '超级管理员', '2025-03-20 17:38:02+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('de425c5f-114b-4f25-a5e2-a1e6f6fa166e', 'OB20250317004', '包装纸箱', 'E00X', '50*40*30cm', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C8', 12, '箱', '2024-01-15 12:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:53:44+08', 1, '超级管理员', '2025-03-17 00:54:06+08');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('e3b460f4-7caa-4017-92f7-e116b7920a57', 'OB20250317002', '半成品B', 'SP001', '半加工状态', NULL, '3A765F84-49A6-4F42-9639-2A9C58D832C6', 30, '件', '2024-01-14 11:00:00+08', NULL, NULL, 1, '超级管理员', '2025-03-17 00:38:02+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_ProductionLine
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionLine";
CREATE TABLE "public"."MES_ProductionLine" (
  "ProductionLineID" uuid NOT NULL,
  "LineName" varchar(100) COLLATE "pg_catalog"."default",
  "LineType" varchar(100) COLLATE "pg_catalog"."default",
  "Capacity" varchar(100) COLLATE "pg_catalog"."default",
  "Status" varchar(100) COLLATE "pg_catalog"."default",
  "ResponsiblePerson" varchar(100) COLLATE "pg_catalog"."default",
  "Location" varchar(100) COLLATE "pg_catalog"."default",
  "StartDate" timestamptz(6),
  "EndDate" timestamptz(6),
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionLine
-- ----------------------------
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efa4a-028a-11f0-92bb-52540099312c', '手机组装产线 1 号', '电子设备组装线', '每天 5000 部手机', '运行中', '张工', '工厂 1 楼 A 区', '2024-01-01 08:00:00+08', '2025-03-17 00:00:00+08', '效率较高', 1, '管理员', '2025-03-17 01:19:33+08', 1, '超级管理员', '2025-03-17 01:36:33+08');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efc2e-028a-11f0-92bb-52540099312c', '汽车发动机零部件加工线', '机械加工线', '每月 3000 套零部件', '运行中', '李工', '工厂 2 楼 B 区', '2024-03-15 09:30:00+08', '2025-03-17 00:00:00+08', '质量稳定', 1, '管理员', '2025-03-17 01:19:33+08', 1, '超级管理员', '2025-03-17 01:36:00+08');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efd10-028a-11f0-92bb-52540099312c', '饼干包装产线 2 号', '食品包装线', '每小时 10000 包饼干', '运行中', '王工', '工厂 3 楼 C 区', '2024-05-20 10:15:00+08', '2025-03-17 00:00:00+08', '包装精美', 1, '管理员', '2025-03-17 01:19:33+08', 1, '超级管理员', '2025-03-17 01:49:46+08');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efd6c-028a-11f0-92bb-52540099312c', '衬衫裁剪产线', '服装裁剪线', '每周 2000 件衬衫裁剪量', '运行中', '赵工', '工厂 4 楼 D 区', '2024-07-05 11:00:00+08', '2025-03-17 00:00:00+08', '裁剪精度高', 1, '管理员', '2025-03-17 01:19:33+08', 1, '超级管理员', '2025-03-17 01:21:04+08');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efdbd-028a-11f0-92bb-52540099312c', '平板电脑检测线', '电子产品检测线', '每天 2000 台平板电脑', '运行中', '孙工', '工厂 5 楼 E 区', '2024-09-10 14:45:00+08', '2025-03-17 00:00:00+08', '检测全面', 1, '管理员', '2025-03-17 01:19:33+08', 1, '超级管理员', '2025-03-17 01:21:07+08');

-- ----------------------------
-- Table structure for MES_ProductionLineDevice
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionLineDevice";
CREATE TABLE "public"."MES_ProductionLineDevice" (
  "DeviceID" uuid NOT NULL,
  "ProductionLineID" varchar(36) COLLATE "pg_catalog"."default",
  "DeviceName" varchar(100) COLLATE "pg_catalog"."default",
  "DeviceModel" varchar(100) COLLATE "pg_catalog"."default",
  "Manufacturer" varchar(100) COLLATE "pg_catalog"."default",
  "PurchaseDate" timestamptz(6),
  "WarrantyDate" timestamptz(6),
  "Status" varchar(100) COLLATE "pg_catalog"."default",
  "LocationOnLine" varchar(100) COLLATE "pg_catalog"."default",
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionLineDevice
-- ----------------------------
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('000fc915-0453-4938-a964-c63c13b00b15', 'D44EFD10-028A-11F0-92BB-52540099312C', '奥利奥', '奥利奥', '奥利奥', '2025-03-17 00:00:00+08', '2025-03-18 00:00:00+08', '异常', NULL, '奥利奥', 1, '超级管理员', '2025-03-17 01:49:46+08', 1, '超级管理员', '2025-03-17 01:49:45+08');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('164d145d-7672-4993-b994-cb0cdbe12e77', 'D44EFA4A-028A-11F0-92BB-52540099312C', '贴片机', 'TA0001', '台积电', '2025-03-03 00:00:00+08', '2025-03-18 00:00:00+08', '正常', NULL, '....', 1, '超级管理员', '2025-03-17 01:34:42+08', 1, '超级管理员', '2025-03-17 01:36:33+08');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('6b98a0c9-988b-401e-aff9-aa88440c80d7', 'D44EFA4A-028A-11F0-92BB-52540099312C', '点胶机', 'TA0002', NULL, '2025-03-10 00:00:00+08', '2025-03-19 00:00:00+08', '正常', NULL, '...', 1, '超级管理员', '2025-03-17 01:36:33+08', 1, '超级管理员', '2025-03-17 01:36:32+08');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('8a9567b6-ab7a-4194-a152-aab255ba0c72', 'D44EFD10-028A-11F0-92BB-52540099312C', '奥利奥plus', '奥利奥plus', '奥利奥plus', '2025-03-12 00:00:00+08', '2025-03-11 00:00:00+08', '正常', NULL, '奥利奥plus', 1, '超级管理员', '2025-03-17 01:49:46+08', 1, '超级管理员', '2025-03-17 01:49:45+08');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('a6ac613e-241a-41fa-a4cc-e5f08d0a0dce', 'D44EFC2E-028A-11F0-92BB-52540099312C', '磨床', 'CA0002', '..。', '2025-03-11 00:00:00+08', NULL, '正常', NULL, '12..。', 1, '超级管理员', '2025-03-17 01:36:00+08', 1, '超级管理员', '2025-03-17 01:35:59+08');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('cd9a6f48-5d81-46c4-9189-7f7c5fc9e163', 'D44EFC2E-028A-11F0-92BB-52540099312C', '车床', 'CA0001', 'xxxx', '2025-03-03 00:00:00+08', NULL, '正常', NULL, '11', 1, '超级管理员', '2025-03-17 01:36:00+08', 1, '超级管理员', '2025-03-17 01:35:59+08');

-- ----------------------------
-- Table structure for MES_ProductionOrder
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionOrder";
CREATE TABLE "public"."MES_ProductionOrder" (
  "OrderID" uuid NOT NULL,
  "OrderNumber" varchar(100) COLLATE "pg_catalog"."default",
  "CustomerName" varchar(100) COLLATE "pg_catalog"."default",
  "OrderDate" date NOT NULL,
  "DeliveryDate" date NOT NULL,
  "OrderQty" int4,
  "OrderStatus" varchar(100) COLLATE "pg_catalog"."default",
  "LV" varchar(255) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionOrder
-- ----------------------------
INSERT INTO "public"."MES_ProductionOrder" VALUES ('6648a795-02f5-11f0-92bb-52540099312c', 'PO00000005', '阳光电子集团', '2024-01-05', '2024-02-05', 300, '待生产', '1', 1, 'admin', '2024-01-05 13:00:00+08', 1, '超级管理员', '2025-03-18 14:50:47+08');
INSERT INTO "public"."MES_ProductionOrder" VALUES ('6648abb7-02f5-11f0-92bb-52540099312c', 'PO00000004', '瑞风科技有限公司', '2024-01-04', '2024-02-04', 8000, '待生产', '1', 1, 'admin', '2024-01-04 12:00:00+08', 1, '超级管理员', '2025-03-18 14:50:49+08');
INSERT INTO "public"."MES_ProductionOrder" VALUES ('6648aca8-02f5-11f0-92bb-52540099312c', 'PO00000003', '星辰电子公司', '2024-01-03', '2024-02-03', 1700, '生产中', '1', 1, 'admin', '2024-01-03 11:00:00+08', 1, '超级管理员', '2025-03-18 14:50:51+08');

-- ----------------------------
-- Table structure for MES_ProductionPlanChangeRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionPlanChangeRecord";
CREATE TABLE "public"."MES_ProductionPlanChangeRecord" (
  "ChangeRecordID" uuid NOT NULL,
  "PlanDetailID" varchar(36) COLLATE "pg_catalog"."default",
  "OrderNumber" varchar(100) COLLATE "pg_catalog"."default",
  "CustomerName" varchar(100) COLLATE "pg_catalog"."default",
  "OrderDate" timestamptz(6),
  "ChangeDate" date NOT NULL,
  "OriginalPlanQuantity" int4 NOT NULL,
  "NewPlanQuantity" int4 NOT NULL,
  "OriginalPlannedStartTime" timestamptz(6),
  "NewPlannedStartTime" timestamptz(6),
  "OriginalPlannedEndTime" timestamptz(6),
  "NewPlannedEndTime" timestamptz(6),
  "ChangeReason" varchar(100) COLLATE "pg_catalog"."default",
  "ChangedBy" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionPlanChangeRecord
-- ----------------------------
INSERT INTO "public"."MES_ProductionPlanChangeRecord" VALUES ('92fd73c5-f999-4a17-a4f2-fb94253e62da', NULL, 'CA2025021000001', '星星电子', '2025-03-10 00:00:00+08', '2025-03-18', 12000, 8000, NULL, NULL, NULL, NULL, '。。。。。', 'admin', 1, '超级管理员', '2025-03-17 19:34:06+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_ProductionPlanDetail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionPlanDetail";
CREATE TABLE "public"."MES_ProductionPlanDetail" (
  "PlanDetailID" uuid NOT NULL,
  "OrderID" varchar(36) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default",
  "Unit" varchar(100) COLLATE "pg_catalog"."default",
  "PlanQuantity" int4,
  "PlannedStartTime" timestamptz(6),
  "PlannedEndTime" timestamptz(6),
  "PlanStatus" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionPlanDetail
-- ----------------------------
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('1012861c-89f2-4337-9718-3c79c72d3fd6', '6648ACA8-02F5-11F0-92BB-52540099312C', 'AKG0000004', '双层瓦楞纸箱', '尺寸：500mm×300mm×200mm', '件', 800, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:34+08', 1, '超级管理员', '2025-03-18 14:50:51+08');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('40139c6f-6697-489d-8bee-46d888a1bb53', '6648ACA8-02F5-11F0-92BB-52540099312C', 'AKG0000005', 'A4 复印纸', '70g，500 张/包', '包', 900, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:34+08', 1, '超级管理员', '2025-03-18 14:50:51+08');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('4d1ed687-fc78-419a-8128-29b0dc75e486', '6648ABB7-02F5-11F0-92BB-52540099312C', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', '片', 2000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29+08', 1, '超级管理员', '2025-03-18 14:50:49+08');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('6a7a9c6f-61f3-4cf4-9c1c-4304f8bc2eff', '6648ABB7-02F5-11F0-92BB-52540099312C', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', '件', 2000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29+08', 1, '超级管理员', '2025-03-18 14:50:49+08');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('af2d3f94-5912-412d-89a1-26a16d9d00ae', '6648ABB7-02F5-11F0-92BB-52540099312C', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', '吨', 4000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29+08', 1, '超级管理员', '2025-03-18 14:50:49+08');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('afebc1a7-e112-43a4-a766-2e8987e0dbcc', '6648A795-02F5-11F0-92BB-52540099312C', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', '吨', 100, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 18:43:57+08', 1, '超级管理员', '2025-03-18 14:50:47+08');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('c1876253-995a-4303-bc1a-15af7742515a', '6648A795-02F5-11F0-92BB-52540099312C', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', '片', 200, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 18:43:57+08', 1, '超级管理员', '2025-03-18 14:50:47+08');

-- ----------------------------
-- Table structure for MES_ProductionReporting
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionReporting";
CREATE TABLE "public"."MES_ProductionReporting" (
  "ReportingID" uuid NOT NULL,
  "ReportingNumber" varchar(100) COLLATE "pg_catalog"."default",
  "OrderID" varchar(36) COLLATE "pg_catalog"."default",
  "ReportedBy" varchar(100) COLLATE "pg_catalog"."default",
  "ReportingTime" timestamptz(6),
  "ReportHour" numeric(2) DEFAULT NULL::numeric,
  "Total" int4,
  "AcceptedQuantity" int4,
  "RejectedQuantity" int4,
  "AuditStatus" int4,
  "Auditor" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionReporting
-- ----------------------------
INSERT INTO "public"."MES_ProductionReporting" VALUES ('34a8e0fb-1b90-4358-a1fb-004a6a9e9f93', 'BG202503180007', NULL, '3362', '2024-06-05 19:00:00+08', 10, 380, 490, 60, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04+08', NULL, NULL, '2025-03-20 21:42:04+08');
INSERT INTO "public"."MES_ProductionReporting" VALUES ('9356d9e8-8b3a-41c5-a2fc-f805e60ac867', 'BG202503180008', NULL, '1', '2025-03-18 00:00:00+08', 22, 290, 274, 6, 0, NULL, 1, '超级管理员', '2025-03-24 02:12:41+08', 1, '超级管理员', '2025-03-24 02:12:49+08');
INSERT INTO "public"."MES_ProductionReporting" VALUES ('d902044f-abd1-42ab-b3d8-9e63f431b410', 'BG202503180006', NULL, '3362', '2024-06-05 19:00:00+08', 4, 300, 390, 10, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04+08', NULL, NULL, '2025-03-20 21:42:04+08');
INSERT INTO "public"."MES_ProductionReporting" VALUES ('f8fb5b93-0b38-4892-aa8d-7d3a00b89afd', 'BG202503180004', NULL, '3362', '2024-06-05 19:00:00+08', 7, 180, 280, 30, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04+08', NULL, NULL, '2025-03-20 21:42:04+08');

-- ----------------------------
-- Table structure for MES_ProductionReportingDetail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionReportingDetail";
CREATE TABLE "public"."MES_ProductionReportingDetail" (
  "DetailID" uuid NOT NULL,
  "ReportingID" varchar(36) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default",
  "ReportHour" numeric(11,2) DEFAULT NULL::numeric,
  "ReportedQuantity" int4 NOT NULL,
  "AcceptedQuantity" int4 NOT NULL,
  "RejectedQuantity" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_ProductionReportingDetail
-- ----------------------------
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('017f792c-4520-43a8-a649-c5e1ed5a28c1', 'D902044F-ABD1-42AB-B3D8-9E63F431B410', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 1.50, 200, 200, 0, 1, '超级管理员', '2025-03-18 16:09:41+08', 1, '超级管理员', '2025-03-18 15:58:24+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('0ae90653-97a9-43a2-9ede-a38967d7b434', '34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 1.50, 200, 200, 0, 1, '超级管理员', '2025-03-18 16:09:52+08', 1, '超级管理员', '2025-03-18 16:09:24+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('2988903b-f36f-439f-a0f9-ca410cb3032e', '9356D9E8-8B3A-41C5-A2FC-F805E60AC867', 'AKG0000004', '双层瓦楞纸箱', '尺寸：500mm×300mm×200mm', 10.00, 90, 84, 5, 1, '超级管理员', '2025-03-24 02:12:41+08', 1, '超级管理员', '2025-03-24 02:12:49+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('3f665f4b-ace1-4644-a706-d31552c84cb5', 'F8FB5B93-0B38-4892-AA8D-7D3A00B89AFD', 'AKG0000004', '米其林轮胎', '。。。。。。。', 5.00, 80, 90, 20, 1, '超级管理员', '2025-03-18 16:09:20+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('7d48b30b-8b7c-4403-abf8-690e52762e44', '34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'AKG0000004', '米其林轮胎', '。。。。。。。', 6.00, 80, 100, 50, 1, '超级管理员', '2025-03-18 16:09:52+08', 1, '超级管理员', '2025-03-18 16:09:24+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('c1cf52d2-e98a-43ba-92de-3c757d7c41f1', 'F8FB5B93-0B38-4892-AA8D-7D3A00B89AFD', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:20+08', 1, '超级管理员', '2025-03-18 15:58:24+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('c437274d-2be9-44ef-b8f0-85b8c6040c31', 'D902044F-ABD1-42AB-B3D8-9E63F431B410', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:41+08', 1, '超级管理员', '2025-03-18 15:58:24+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('e13eda90-0c3e-436e-8b49-2631f916dbdc', '34A8E0FB-1B90-4358-A1FB-004A6A9E9F93', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:52+08', 1, '超级管理员', '2025-03-18 16:09:24+08');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('ff6dfe2e-f793-487d-8a43-519f14dbd745', '9356D9E8-8B3A-41C5-A2FC-F805E60AC867', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 12.00, 200, 190, 1, 1, '超级管理员', '2025-03-24 02:12:41+08', 1, '超级管理员', '2025-03-24 02:12:49+08');

-- ----------------------------
-- Table structure for MES_QualityInspectionPlan
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_QualityInspectionPlan";
CREATE TABLE "public"."MES_QualityInspectionPlan" (
  "InspectionPlanID" uuid NOT NULL,
  "InspectionPlanNumber" varchar(100) COLLATE "pg_catalog"."default",
  "OrderID" varchar(36) COLLATE "pg_catalog"."default",
  "PlanStartTime" date NOT NULL,
  "PlanEndTime" date NOT NULL,
  "ResponsiblePerson" varchar(100) COLLATE "pg_catalog"."default",
  "PlanStatus" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_QualityInspectionPlan
-- ----------------------------
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('60475294-c153-4c7c-8645-9209d9eb7be4', 'QIP202503190001', NULL, '2024-07-01', '2024-07-02', '3362', NULL, 1, '超级管理员', '2025-03-19 01:48:58+08', 1, '超级管理员', '2025-03-19 01:50:48+08');
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('6e58e213-f8e9-4032-9dc7-d62d76a418d9', 'QIP202503190003', NULL, '2024-07-01', '2024-07-02', '3362', NULL, 1, '超级管理员', '2025-03-19 01:49:46+08', 1, '超级管理员', '2025-03-19 01:50:41+08');
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('cc7fe857-0608-4872-8e8b-754e41c4609a', 'QIP202503190002', NULL, '2024-07-01', '2024-07-02', '1', NULL, 1, '超级管理员', '2025-03-19 01:49:40+08', 1, '超级管理员', '2025-03-19 01:50:44+08');
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('fc4a1634-e1e0-4455-acf8-4d097a95ca56', 'QIP202503190004', NULL, '2024-07-01', '2024-07-02', '1', NULL, 1, '超级管理员', '2025-03-19 01:49:50+08', 1, '超级管理员', '2025-03-19 01:50:38+08');

-- ----------------------------
-- Table structure for MES_QualityInspectionPlanDetail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_QualityInspectionPlanDetail";
CREATE TABLE "public"."MES_QualityInspectionPlanDetail" (
  "InspectionPlanDetailID" uuid NOT NULL,
  "InspectionPlanID" varchar(36) COLLATE "pg_catalog"."default",
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default",
  "QuantityToInspect" int4 NOT NULL,
  "InspectionMethod" varchar(100) COLLATE "pg_catalog"."default",
  "InspectionStandard" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_QualityInspectionPlanDetail
-- ----------------------------
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('3151bae6-9b91-46cc-8615-11c3cb2afaa6', '6E58E213-F8E9-4032-9DC7-D62D76A418D9', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:47+08', 1, '超级管理员', '2025-03-19 01:50:41+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('4c946033-91ae-4f7e-a11e-c9fd20f0e373', 'CC7FE857-0608-4872-8E8B-754E41C4609A', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:41+08', 1, '超级管理员', '2025-03-19 01:50:44+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('8270f2e3-71ba-4074-bbd5-c97c981dda3d', '60475294-C153-4C7C-8645-9209D9EB7BE4', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:48:59+08', 1, '超级管理员', '2025-03-19 01:50:48+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('89d373c2-5fce-4915-a661-0f10d47112a5', '6E58E213-F8E9-4032-9DC7-D62D76A418D9', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:47+08', 1, '超级管理员', '2025-03-19 01:50:41+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('b7ad76cd-0c56-40da-beee-0a096148b00f', '60475294-C153-4C7C-8645-9209D9EB7BE4', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:48:59+08', 1, '超级管理员', '2025-03-19 01:50:48+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('bb066d57-83ad-45c5-bb6e-3041b1ea65f6', 'FC4A1634-E1E0-4455-ACF8-4D097A95CA56', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:51+08', 1, '超级管理员', '2025-03-19 01:50:38+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('c6291518-07ca-4abd-bd9a-63f51ff4a68f', 'FC4A1634-E1E0-4455-ACF8-4D097A95CA56', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:51+08', 1, '超级管理员', '2025-03-19 01:50:38+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('e29789ce-3501-4a57-87d6-9ea292f193f8', 'CC7FE857-0608-4872-8E8B-754E41C4609A', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:41+08', 1, '超级管理员', '2025-03-19 01:50:44+08');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d80f7-041f-11f0-92bb-52540099312c', 'E92BEA50-041F-11F0-92BB-52540099312C', 'M001', '电阻', '100Ω', 500, '抽样检验', '阻值偏差±5%', 1, 'admin', '2024-07-01 08:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d82a2-041f-11f0-92bb-52540099312c', 'E92BECD6-041F-11F0-92BB-52540099312C', 'M002', '电容', '10μF', 300, '全检', '容量偏差±3%', 1, 'admin', '2024-07-03 09:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d83cd-041f-11f0-92bb-52540099312c', 'E92BED65-041F-11F0-92BB-52540099312C', 'M003', '线路板', 'PCB-A100', 200, '功能测试', '无短路、断路', 1, 'admin', '2024-07-05 10:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d8477-041f-11f0-92bb-52540099312c', 'E92BEDCF-041F-11F0-92BB-52540099312C', 'M004', '塑料粒子', 'PP-500', 400, '外观检验', '无杂质、色泽均匀', 1, 'admin', '2024-07-07 11:00:00+08', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d8507-041f-11f0-92bb-52540099312c', 'E92BEE39-041F-11F0-92BB-52540099312C', 'M005', '螺丝', 'M3x10', 600, '尺寸检验', '直径偏差±0.1mm', 1, 'admin', '2024-07-09 12:00:00+08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_QualityInspectionRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_QualityInspectionRecord";
CREATE TABLE "public"."MES_QualityInspectionRecord" (
  "InspectionRecordID" uuid NOT NULL,
  "InspectionPlanDetailID" varchar(36) COLLATE "pg_catalog"."default",
  "InspectionNumber" varchar(100) COLLATE "pg_catalog"."default",
  "Inspector" varchar(100) COLLATE "pg_catalog"."default",
  "InspectionTime" date NOT NULL,
  "InspectedQuantity" int4 NOT NULL,
  "PassedQuantity" int4 NOT NULL,
  "FailedQuantity" int4 NOT NULL,
  "InspectionResult" varchar(100) COLLATE "pg_catalog"."default",
  "DefectDescription" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_QualityInspectionRecord
-- ----------------------------
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769acb9-0421-11f0-92bb-52540099312c', 'FF1B025B-0421-11F0-92BB-52540099312C', 'QIR001', '1', '2024-07-01', 500, 480, 20, '不合格', '部分电阻阻值偏差超过±5%', 1, 'admin', '2024-07-01 10:00:00+08', 1, '超级管理员', '2025-03-19 01:56:01+08');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769ae7c-0421-11f0-92bb-52540099312c', 'FF1B049D-0421-11F0-92BB-52540099312C', 'QIR002', '3362', '2024-07-03', 300, 290, 10, '不合格', '少数电容容量偏差超过±3%', 1, 'admin', '2024-07-03 11:00:00+08', 1, '超级管理员', '2025-03-19 01:55:58+08');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769af6b-0421-11f0-92bb-52540099312c', 'FF1B0534-0421-11F0-92BB-52540099312C', 'QIR003', '3362', '2024-07-05', 200, 190, 10, '不合格', '几块线路板存在短路问题', 1, 'admin', '2024-07-05 12:00:00+08', 1, '超级管理员', '2025-03-19 01:55:54+08');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769b023-0421-11f0-92bb-52540099312c', 'FF1B05A7-0421-11F0-92BB-52540099312C', 'QIR004', '3362', '2024-07-07', 400, 380, 20, '合格', '部分塑料粒子有杂质', 1, 'admin', '2024-07-07 13:00:00+08', 1, '超级管理员', '2025-03-19 01:56:49+08');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769b22d-0421-11f0-92bb-52540099312c', 'FF1B0616-0421-11F0-92BB-52540099312C', 'QIR005', '1', '2024-07-09', 600, 570, 30, '合格', '部分螺丝直径偏差超过±0.1mm', 1, 'admin', '2024-07-09 14:00:00+08', 1, '超级管理员', '2025-03-19 01:56:46+08');

-- ----------------------------
-- Table structure for MES_SchedulingPlan
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_SchedulingPlan";
CREATE TABLE "public"."MES_SchedulingPlan" (
  "SchedulePlanID" uuid NOT NULL,
  "PlanName" varchar(100) COLLATE "pg_catalog"."default",
  "ProductionLine" varchar(100) COLLATE "pg_catalog"."default",
  "TeamName" varchar(100) COLLATE "pg_catalog"."default",
  "StartDate" date NOT NULL,
  "EndDate" date NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_SchedulingPlan
-- ----------------------------
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c24f1-0422-11f0-92bb-52540099312c', 'SMT产线1月排班计划', 'SMT贴片生产线', 'SMT一组', '2024-01-01', '2024-01-31', 1, 'admin', '2024-01-01 09:00:00+08', 1, '超级管理员', '2025-03-19 02:00:45+08');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c268a-0422-11f0-92bb-52540099312c', '注塑产线1月排班计划', '注塑生产线', '注塑一组', '2024-01-01', '2024-01-31', 1, 'admin', '2024-01-02 10:00:00+08', 1, '超级管理员', '2025-03-19 02:00:44+08');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c279a-0422-11f0-92bb-52540099312c', '总装产线1月排班计划', '总装生产线', '总装一组', '2024-01-01', '2024-01-31', 1, 'admin', '2024-01-03 11:00:00+08', 1, '超级管理员', '2025-03-19 02:00:42+08');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c2835-0422-11f0-92bb-52540099312c', '检测产线1月排班计划', '检测生产线', '检测一组', '2024-01-01', '2024-01-31', 1, 'admin', '2024-01-04 12:00:00+08', 1, '超级管理员', '2025-03-19 02:00:40+08');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c28b9-0422-11f0-92bb-52540099312c', '包装产线1月排班计划', '包装生产线', '包装一组', '2024-01-01', '2024-01-31', 1, 'admin', '2024-01-05 13:00:00+08', 1, '超级管理员', '2025-03-19 02:00:38+08');

-- ----------------------------
-- Table structure for MES_Supplier
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Supplier";
CREATE TABLE "public"."MES_Supplier" (
  "SupplierID" uuid NOT NULL,
  "SupplierName" varchar(100) COLLATE "pg_catalog"."default",
  "ContactPerson" varchar(100) COLLATE "pg_catalog"."default",
  "ContactPhone" varchar(100) COLLATE "pg_catalog"."default",
  "Email" varchar(100) COLLATE "pg_catalog"."default",
  "Address" varchar(100) COLLATE "pg_catalog"."default",
  "SupplierType" varchar(100) COLLATE "pg_catalog"."default",
  "ProductRange" varchar(100) COLLATE "pg_catalog"."default",
  "QualityRating" varchar(100) COLLATE "pg_catalog"."default",
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_Supplier
-- ----------------------------
INSERT INTO "public"."MES_Supplier" VALUES ('fd83f9a1-0289-11f0-92bb-52540099312c', '绿韵包装材料供应商', '刘女士', '13378901234', 'lvyun@example.com', '杭州市西湖区', '包装材料供应商', '环保包装材料', 'A', '。。。。。。。。。', 1, '管理员', '2025-03-17 01:13:33+08', 1, '超级管理员', '2025-03-17 01:14:36+08');
INSERT INTO "public"."MES_Supplier" VALUES ('fd83fb2f-0289-11f0-92bb-52540099312c', '宝盛包装用品供应商', '孙先生', '13289012345', 'baosheng@example.com', '南京市鼓楼区', '包装材料供应商', '各类包装用品', 'B', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33+08', 1, '超级管理员', '2025-03-17 01:14:53+08');
INSERT INTO "public"."MES_Supplier" VALUES ('fd83fb7b-0289-11f0-92bb-52540099312c', '逸彩印刷包装供应商', '周先生', '13190123456', 'yicai@example.com', '成都市武侯区', '包装材料供应商', '印刷包装产品', 'A', '印刷工艺。。。。。。', 1, '管理员', '2025-03-17 01:13:33+08', 1, '超级管理员', '2025-03-17 01:14:59+08');
INSERT INTO "public"."MES_Supplier" VALUES ('fd8f3146-0289-11f0-92bb-52540099312c', '宏泰生产设备供应商', '吴先生', '13001234567', 'hongtai@example.com', '武汉市武昌区', '设备供应商', '生产设备', 'A', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33+08', 1, '超级管理员', '2025-03-17 01:15:03+08');
INSERT INTO "public"."MES_Supplier" VALUES ('fd8f32c3-0289-11f0-92bb-52540099312c', '锐翔检测设备供应商', '郑女士', '18812345678', 'ruixiang@example.com', '西安市碑林区', '设备供应商', '检测设备', 'B', '检测精度较高。。。。。。', 1, '管理员', '2025-03-17 01:13:33+08', 1, '超级管理员', '2025-03-17 01:15:11+08');
INSERT INTO "public"."MES_Supplier" VALUES ('fd8f3302-0289-11f0-92bb-52540099312c', '丰能能源设备供应商', '钱先生', '18923456789', 'fengneng@example.com', '沈阳市和平区', '设备供应商', '能源设备', 'A', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33+08', 1, '超级管理员', '2025-03-17 01:15:07+08');

-- ----------------------------
-- Table structure for MES_WarehouseManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_WarehouseManagement";
CREATE TABLE "public"."MES_WarehouseManagement" (
  "WarehouseID" uuid NOT NULL,
  "WarehouseCode" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseName" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseType" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseArea" numeric(10,2) NOT NULL,
  "WarehouseAddress" varchar(100) COLLATE "pg_catalog"."default",
  "WarehousePhone" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseManager" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseStatus" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseCapacity" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamptz(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamptz(6)
)
;

-- ----------------------------
-- Records of MES_WarehouseManagement
-- ----------------------------
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896a', 'WH001', '原材料仓库', '原材料存储', 1000.50, '工厂A区', '021-12345678', '李明', '1', 5000, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:16:34+08');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896b', 'WH002', '成品仓库', '成品存储', 1200.00, '工厂B区', '021-23456789', '张华', '1', 6000, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:16:37+08');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896c', 'WH003', '半成品仓库', '半成品存储', 800.25, '工厂C区', '021-34567890', '王强', '0', 3500, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:16:44+08');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896d', 'WH004', '不良品仓库', '不良品暂存', 300.75, '工厂D区', '021-45678901', '刘悦', '1', 1000, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:16:41+08');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896e', 'WH005', '包装材料仓库', '包装材料存储', 650.00, '工厂E区', '021-56789012', '陈杰', '0', 4500, 1, 'admin', '2025-03-16 23:16:24+08', 1, '超级管理员', '2025-03-17 00:16:47+08');

-- ----------------------------
-- Table structure for SellOrder
-- ----------------------------
DROP TABLE IF EXISTS "public"."SellOrder";
CREATE TABLE "public"."SellOrder" (
  "Order_Id" uuid NOT NULL,
  "OrderType" int4 NOT NULL,
  "TranNo" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "SellNo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Qty" int4 NOT NULL,
  "AuditDate" timestamp(6),
  "AuditStatus" int4 NOT NULL,
  "AuditId" int4,
  "Auditor" varchar(100) COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(255) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(255) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;

-- ----------------------------
-- Records of SellOrder
-- ----------------------------
INSERT INTO "public"."SellOrder" VALUES ('323ab96f-49c1-4100-9d08-17db9f209df7', 1, '2023051300000004', '2023051300000004', 5505, NULL, 2, NULL, NULL, '部门+角色+用户审批', 1, '超级管理员', '2023-05-13 17:17:47', NULL, NULL, NULL);
INSERT INTO "public"."SellOrder" VALUES ('55ae8c6c-6a11-4765-952a-7b4a3adece04', 2, '2023051300000001', '20230513000001', 200, NULL, 2, NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 15:49:18', 1, '超级管理员', '2023-05-13 15:49:27');
INSERT INTO "public"."SellOrder" VALUES ('81d5db86-c85a-4b06-bc3a-08142811c522', 1, '2023051300000005', '2023051300000005', 5050, NULL, 0, NULL, NULL, '2023051300000005', 1, '超级管理员', '2023-05-13 17:19:06', NULL, NULL, NULL);
INSERT INTO "public"."SellOrder" VALUES ('b1db23bd-ed48-4459-b9ed-355d97a7e16e', 1, '2023051300000003', '2023051300000003', 5000, NULL, 1, NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 17:07:37', NULL, NULL, NULL);
INSERT INTO "public"."SellOrder" VALUES ('b67b7ec0-136c-4439-a530-cd6dd4d69a9c', 2, '2023051300000002', '20230513000002', 120, NULL, 1, NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 15:58:42', 1, '超级管理员', '2023-05-13 17:07:14');

-- ----------------------------
-- Table structure for SellOrderList
-- ----------------------------
DROP TABLE IF EXISTS "public"."SellOrderList";
CREATE TABLE "public"."SellOrderList" (
  "OrderList_Id" uuid NOT NULL,
  "Order_Id" char(36) COLLATE "pg_catalog"."default" NOT NULL,
  "ProductName" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "MO" varchar(255) COLLATE "pg_catalog"."default",
  "Qty" int4 NOT NULL,
  "Weight" numeric(18,2),
  "Remark" text COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(255) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(255) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;

-- ----------------------------
-- Records of SellOrderList
-- ----------------------------
INSERT INTO "public"."SellOrderList" VALUES ('08d72cf6-d9f5-bee9-32ff-5808ff1238cb', '6EFB65B8-585E-4BE7-8B77-94C76E362412', '测试', '测试', 7, 8.00, NULL, 1, '超级管理员', '2019-08-30 11:05:03', 1, '超级管理员', '2019-08-30 11:05:19');
INSERT INTO "public"."SellOrderList" VALUES ('08d72cf6-ed6c-f0e0-9e97-5930a04f2ebc', 'AD698348-1535-4221-9A1A-57DB5CB351E4', '2', '2', 2, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:35', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('3d1467b1-11e0-4404-e3fd-08db53868e51', '55AE8C6C-6A11-4765-952A-7B4A3ADECE04', '2', '20230513000001', 12400, 11.00, NULL, 1, '超级管理员', '2023-05-13 15:49:18', 1, '超级管理员', '2023-05-13 15:49:27');
INSERT INTO "public"."SellOrderList" VALUES ('893cee01-ad76-4894-fbf3-08db5392eaa0', '323AB96F-49C1-4100-9D08-17DB9F209DF7', '2', '123', 200, NULL, NULL, 1, '超级管理员', '2023-05-13 17:17:47', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('be0a328c-6ecc-419b-7b3c-08db53917efb', 'B1DB23BD-ED48-4459-B9ED-355D97A7E16E', '2', '1000', 2000, NULL, NULL, 1, '超级管理员', '2023-05-13 17:07:37', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('ccdfcd1d-e0de-4cae-7485-08db5387deb9', 'B67B7EC0-136C-4439-A530-CD6DD4D69A9C', '2', '2023051300000002', 12321, NULL, NULL, 1, '超级管理员', '2023-05-13 15:58:43', 1, '超级管理员', '2023-05-13 17:07:14');
INSERT INTO "public"."SellOrderList" VALUES ('df13a279-7ea4-47c0-fbf4-08db5392eaa0', '81D5DB86-C85A-4B06-BC3A-08142811C522', '2', '111', 2000, NULL, NULL, 1, '超级管理员', '2023-05-13 17:19:06', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('fc332cef-c1eb-4063-b71c-6addf19a8e8b', '6EFB65B8-585E-4BE7-8B77-94C76E362412', '22', '2', 0, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:19', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_City
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_City";
CREATE TABLE "public"."Sys_City" (
  "CityId" int4 NOT NULL DEFAULT nextval('sys_city_id_seq'::regclass),
  "CityCode" varchar(20) COLLATE "pg_catalog"."default",
  "CityName" varchar(30) COLLATE "pg_catalog"."default",
  "ProvinceCode" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_City
-- ----------------------------
INSERT INTO "public"."Sys_City" VALUES (1, '110100', '市辖区', '110000');
INSERT INTO "public"."Sys_City" VALUES (2, '110200', '县', '110000');
INSERT INTO "public"."Sys_City" VALUES (3, '120100', '市辖区', '120000');
INSERT INTO "public"."Sys_City" VALUES (4, '120200', '县', '120000');
INSERT INTO "public"."Sys_City" VALUES (5, '130100', '石家庄市', '130000');
INSERT INTO "public"."Sys_City" VALUES (6, '130200', '唐山市', '130000');
INSERT INTO "public"."Sys_City" VALUES (7, '130300', '秦皇岛市', '130000');
INSERT INTO "public"."Sys_City" VALUES (8, '130400', '邯郸市', '130000');
INSERT INTO "public"."Sys_City" VALUES (9, '130500', '邢台市', '130000');
INSERT INTO "public"."Sys_City" VALUES (10, '130600', '保定市', '130000');
INSERT INTO "public"."Sys_City" VALUES (11, '130700', '张家口市', '130000');
INSERT INTO "public"."Sys_City" VALUES (12, '130800', '承德市', '130000');
INSERT INTO "public"."Sys_City" VALUES (13, '130900', '沧州市', '130000');
INSERT INTO "public"."Sys_City" VALUES (14, '131000', '廊坊市', '130000');
INSERT INTO "public"."Sys_City" VALUES (15, '131100', '衡水市', '130000');
INSERT INTO "public"."Sys_City" VALUES (16, '140100', '太原市', '140000');
INSERT INTO "public"."Sys_City" VALUES (17, '140200', '大同市', '140000');
INSERT INTO "public"."Sys_City" VALUES (18, '140300', '阳泉市', '140000');
INSERT INTO "public"."Sys_City" VALUES (19, '140400', '长治市', '140000');
INSERT INTO "public"."Sys_City" VALUES (20, '140500', '晋城市', '140000');
INSERT INTO "public"."Sys_City" VALUES (21, '140600', '朔州市', '140000');
INSERT INTO "public"."Sys_City" VALUES (22, '140700', '晋中市', '140000');
INSERT INTO "public"."Sys_City" VALUES (23, '140800', '运城市', '140000');
INSERT INTO "public"."Sys_City" VALUES (24, '140900', '忻州市', '140000');
INSERT INTO "public"."Sys_City" VALUES (25, '141000', '临汾市', '140000');
INSERT INTO "public"."Sys_City" VALUES (26, '141100', '吕梁市', '140000');
INSERT INTO "public"."Sys_City" VALUES (27, '150100', '呼和浩特市', '150000');
INSERT INTO "public"."Sys_City" VALUES (28, '150200', '包头市', '150000');
INSERT INTO "public"."Sys_City" VALUES (29, '150300', '乌海市', '150000');
INSERT INTO "public"."Sys_City" VALUES (30, '150400', '赤峰市', '150000');
INSERT INTO "public"."Sys_City" VALUES (31, '150500', '通辽市', '150000');
INSERT INTO "public"."Sys_City" VALUES (32, '150600', '鄂尔多斯市', '150000');
INSERT INTO "public"."Sys_City" VALUES (33, '150700', '呼伦贝尔市', '150000');
INSERT INTO "public"."Sys_City" VALUES (34, '150800', '巴彦淖尔市', '150000');
INSERT INTO "public"."Sys_City" VALUES (35, '150900', '乌兰察布市', '150000');
INSERT INTO "public"."Sys_City" VALUES (36, '152200', '兴安盟', '150000');
INSERT INTO "public"."Sys_City" VALUES (37, '152500', '锡林郭勒盟', '150000');
INSERT INTO "public"."Sys_City" VALUES (38, '152900', '阿拉善盟', '150000');
INSERT INTO "public"."Sys_City" VALUES (39, '210100', '沈阳市', '210000');
INSERT INTO "public"."Sys_City" VALUES (40, '210200', '大连市', '210000');
INSERT INTO "public"."Sys_City" VALUES (41, '210300', '鞍山市', '210000');
INSERT INTO "public"."Sys_City" VALUES (42, '210400', '抚顺市', '210000');
INSERT INTO "public"."Sys_City" VALUES (43, '210500', '本溪市', '210000');
INSERT INTO "public"."Sys_City" VALUES (44, '210600', '丹东市', '210000');
INSERT INTO "public"."Sys_City" VALUES (45, '210700', '锦州市', '210000');
INSERT INTO "public"."Sys_City" VALUES (46, '210800', '营口市', '210000');
INSERT INTO "public"."Sys_City" VALUES (47, '210900', '阜新市', '210000');
INSERT INTO "public"."Sys_City" VALUES (48, '211000', '辽阳市', '210000');
INSERT INTO "public"."Sys_City" VALUES (49, '211100', '盘锦市', '210000');
INSERT INTO "public"."Sys_City" VALUES (50, '211200', '铁岭市', '210000');
INSERT INTO "public"."Sys_City" VALUES (51, '211300', '朝阳市', '210000');
INSERT INTO "public"."Sys_City" VALUES (52, '211400', '葫芦岛市', '210000');
INSERT INTO "public"."Sys_City" VALUES (53, '220100', '长春市', '220000');
INSERT INTO "public"."Sys_City" VALUES (54, '220200', '吉林市', '220000');
INSERT INTO "public"."Sys_City" VALUES (55, '220300', '四平市', '220000');
INSERT INTO "public"."Sys_City" VALUES (56, '220400', '辽源市', '220000');
INSERT INTO "public"."Sys_City" VALUES (57, '220500', '通化市', '220000');
INSERT INTO "public"."Sys_City" VALUES (58, '220600', '白山市', '220000');
INSERT INTO "public"."Sys_City" VALUES (59, '220700', '松原市', '220000');
INSERT INTO "public"."Sys_City" VALUES (60, '220800', '白城市', '220000');
INSERT INTO "public"."Sys_City" VALUES (61, '222400', '延边朝鲜族自治州', '220000');
INSERT INTO "public"."Sys_City" VALUES (62, '230100', '哈尔滨市', '230000');
INSERT INTO "public"."Sys_City" VALUES (63, '230200', '齐齐哈尔市', '230000');
INSERT INTO "public"."Sys_City" VALUES (64, '230300', '鸡西市', '230000');
INSERT INTO "public"."Sys_City" VALUES (65, '230400', '鹤岗市', '230000');
INSERT INTO "public"."Sys_City" VALUES (66, '230500', '双鸭山市', '230000');
INSERT INTO "public"."Sys_City" VALUES (67, '230600', '大庆市', '230000');
INSERT INTO "public"."Sys_City" VALUES (68, '230700', '伊春市', '230000');
INSERT INTO "public"."Sys_City" VALUES (69, '230800', '佳木斯市', '230000');
INSERT INTO "public"."Sys_City" VALUES (70, '230900', '七台河市', '230000');
INSERT INTO "public"."Sys_City" VALUES (71, '231000', '牡丹江市', '230000');
INSERT INTO "public"."Sys_City" VALUES (72, '231100', '黑河市', '230000');
INSERT INTO "public"."Sys_City" VALUES (73, '231200', '绥化市', '230000');
INSERT INTO "public"."Sys_City" VALUES (74, '232700', '大兴安岭地区', '230000');
INSERT INTO "public"."Sys_City" VALUES (75, '310100', '市辖区', '310000');
INSERT INTO "public"."Sys_City" VALUES (76, '310200', '县', '310000');
INSERT INTO "public"."Sys_City" VALUES (77, '320100', '南京市', '320000');
INSERT INTO "public"."Sys_City" VALUES (78, '320200', '无锡市', '320000');
INSERT INTO "public"."Sys_City" VALUES (79, '320300', '徐州市', '320000');
INSERT INTO "public"."Sys_City" VALUES (80, '320400', '常州市', '320000');
INSERT INTO "public"."Sys_City" VALUES (81, '320500', '苏州市', '320000');
INSERT INTO "public"."Sys_City" VALUES (82, '320600', '南通市', '320000');
INSERT INTO "public"."Sys_City" VALUES (83, '320700', '连云港市', '320000');
INSERT INTO "public"."Sys_City" VALUES (84, '320800', '淮安市', '320000');
INSERT INTO "public"."Sys_City" VALUES (85, '320900', '盐城市', '320000');
INSERT INTO "public"."Sys_City" VALUES (86, '321000', '扬州市', '320000');
INSERT INTO "public"."Sys_City" VALUES (87, '321100', '镇江市', '320000');
INSERT INTO "public"."Sys_City" VALUES (88, '321200', '泰州市', '320000');
INSERT INTO "public"."Sys_City" VALUES (89, '321300', '宿迁市', '320000');
INSERT INTO "public"."Sys_City" VALUES (90, '330100', '杭州市', '330000');
INSERT INTO "public"."Sys_City" VALUES (91, '330200', '宁波市', '330000');
INSERT INTO "public"."Sys_City" VALUES (92, '330300', '温州市', '330000');
INSERT INTO "public"."Sys_City" VALUES (93, '330400', '嘉兴市', '330000');
INSERT INTO "public"."Sys_City" VALUES (94, '330500', '湖州市', '330000');
INSERT INTO "public"."Sys_City" VALUES (95, '330600', '绍兴市', '330000');
INSERT INTO "public"."Sys_City" VALUES (96, '330700', '金华市', '330000');
INSERT INTO "public"."Sys_City" VALUES (97, '330800', '衢州市', '330000');
INSERT INTO "public"."Sys_City" VALUES (98, '330900', '舟山市', '330000');
INSERT INTO "public"."Sys_City" VALUES (99, '331000', '台州市', '330000');
INSERT INTO "public"."Sys_City" VALUES (100, '331100', '丽水市', '330000');
INSERT INTO "public"."Sys_City" VALUES (101, '340100', '合肥市', '340000');
INSERT INTO "public"."Sys_City" VALUES (102, '340200', '芜湖市', '340000');
INSERT INTO "public"."Sys_City" VALUES (103, '340300', '蚌埠市', '340000');
INSERT INTO "public"."Sys_City" VALUES (104, '340400', '淮南市', '340000');
INSERT INTO "public"."Sys_City" VALUES (105, '340500', '马鞍山市', '340000');
INSERT INTO "public"."Sys_City" VALUES (106, '340600', '淮北市', '340000');
INSERT INTO "public"."Sys_City" VALUES (107, '340700', '铜陵市', '340000');
INSERT INTO "public"."Sys_City" VALUES (108, '340800', '安庆市', '340000');
INSERT INTO "public"."Sys_City" VALUES (109, '341000', '黄山市', '340000');
INSERT INTO "public"."Sys_City" VALUES (110, '341100', '滁州市', '340000');
INSERT INTO "public"."Sys_City" VALUES (111, '341200', '阜阳市', '340000');
INSERT INTO "public"."Sys_City" VALUES (112, '341300', '宿州市', '340000');
INSERT INTO "public"."Sys_City" VALUES (113, '341400', '巢湖市', '340000');
INSERT INTO "public"."Sys_City" VALUES (114, '341500', '六安市', '340000');
INSERT INTO "public"."Sys_City" VALUES (115, '341600', '亳州市', '340000');
INSERT INTO "public"."Sys_City" VALUES (116, '341700', '池州市', '340000');
INSERT INTO "public"."Sys_City" VALUES (117, '341800', '宣城市', '340000');
INSERT INTO "public"."Sys_City" VALUES (118, '350100', '福州市', '350000');
INSERT INTO "public"."Sys_City" VALUES (119, '350200', '厦门市', '350000');
INSERT INTO "public"."Sys_City" VALUES (120, '350300', '莆田市', '350000');
INSERT INTO "public"."Sys_City" VALUES (121, '350400', '三明市', '350000');
INSERT INTO "public"."Sys_City" VALUES (122, '350500', '泉州市', '350000');
INSERT INTO "public"."Sys_City" VALUES (123, '350600', '漳州市', '350000');
INSERT INTO "public"."Sys_City" VALUES (124, '350700', '南平市', '350000');
INSERT INTO "public"."Sys_City" VALUES (125, '350800', '龙岩市', '350000');
INSERT INTO "public"."Sys_City" VALUES (126, '350900', '宁德市', '350000');
INSERT INTO "public"."Sys_City" VALUES (127, '360100', '南昌市', '360000');
INSERT INTO "public"."Sys_City" VALUES (128, '360200', '景德镇市', '360000');
INSERT INTO "public"."Sys_City" VALUES (129, '360300', '萍乡市', '360000');
INSERT INTO "public"."Sys_City" VALUES (130, '360400', '九江市', '360000');
INSERT INTO "public"."Sys_City" VALUES (131, '360500', '新余市', '360000');
INSERT INTO "public"."Sys_City" VALUES (132, '360600', '鹰潭市', '360000');
INSERT INTO "public"."Sys_City" VALUES (133, '360700', '赣州市', '360000');
INSERT INTO "public"."Sys_City" VALUES (134, '360800', '吉安市', '360000');
INSERT INTO "public"."Sys_City" VALUES (135, '360900', '宜春市', '360000');
INSERT INTO "public"."Sys_City" VALUES (136, '361000', '抚州市', '360000');
INSERT INTO "public"."Sys_City" VALUES (137, '361100', '上饶市', '360000');
INSERT INTO "public"."Sys_City" VALUES (138, '370100', '济南市', '370000');
INSERT INTO "public"."Sys_City" VALUES (139, '370200', '青岛市', '370000');
INSERT INTO "public"."Sys_City" VALUES (140, '370300', '淄博市', '370000');
INSERT INTO "public"."Sys_City" VALUES (141, '370400', '枣庄市', '370000');
INSERT INTO "public"."Sys_City" VALUES (142, '370500', '东营市', '370000');
INSERT INTO "public"."Sys_City" VALUES (143, '370600', '烟台市', '370000');
INSERT INTO "public"."Sys_City" VALUES (144, '370700', '潍坊市', '370000');
INSERT INTO "public"."Sys_City" VALUES (145, '370800', '济宁市', '370000');
INSERT INTO "public"."Sys_City" VALUES (146, '370900', '泰安市', '370000');
INSERT INTO "public"."Sys_City" VALUES (147, '371000', '威海市', '370000');
INSERT INTO "public"."Sys_City" VALUES (148, '371100', '日照市', '370000');
INSERT INTO "public"."Sys_City" VALUES (149, '371200', '莱芜市', '370000');
INSERT INTO "public"."Sys_City" VALUES (150, '371300', '临沂市', '370000');
INSERT INTO "public"."Sys_City" VALUES (151, '371400', '德州市', '370000');
INSERT INTO "public"."Sys_City" VALUES (152, '371500', '聊城市', '370000');
INSERT INTO "public"."Sys_City" VALUES (153, '371600', '滨州市', '370000');
INSERT INTO "public"."Sys_City" VALUES (154, '371700', '荷泽市', '370000');
INSERT INTO "public"."Sys_City" VALUES (155, '410100', '郑州市', '410000');
INSERT INTO "public"."Sys_City" VALUES (156, '410200', '开封市', '410000');
INSERT INTO "public"."Sys_City" VALUES (157, '410300', '洛阳市', '410000');
INSERT INTO "public"."Sys_City" VALUES (158, '410400', '平顶山市', '410000');
INSERT INTO "public"."Sys_City" VALUES (159, '410500', '安阳市', '410000');
INSERT INTO "public"."Sys_City" VALUES (160, '410600', '鹤壁市', '410000');
INSERT INTO "public"."Sys_City" VALUES (161, '410700', '新乡市', '410000');
INSERT INTO "public"."Sys_City" VALUES (162, '410800', '焦作市', '410000');
INSERT INTO "public"."Sys_City" VALUES (163, '410900', '濮阳市', '410000');
INSERT INTO "public"."Sys_City" VALUES (164, '411000', '许昌市', '410000');
INSERT INTO "public"."Sys_City" VALUES (165, '411100', '漯河市', '410000');
INSERT INTO "public"."Sys_City" VALUES (166, '411200', '三门峡市', '410000');
INSERT INTO "public"."Sys_City" VALUES (167, '411300', '南阳市', '410000');
INSERT INTO "public"."Sys_City" VALUES (168, '411400', '商丘市', '410000');
INSERT INTO "public"."Sys_City" VALUES (169, '411500', '信阳市', '410000');
INSERT INTO "public"."Sys_City" VALUES (170, '411600', '周口市', '410000');
INSERT INTO "public"."Sys_City" VALUES (171, '411700', '驻马店市', '410000');
INSERT INTO "public"."Sys_City" VALUES (172, '420100', '武汉市', '420000');
INSERT INTO "public"."Sys_City" VALUES (173, '420200', '黄石市', '420000');
INSERT INTO "public"."Sys_City" VALUES (174, '420300', '十堰市', '420000');
INSERT INTO "public"."Sys_City" VALUES (175, '420500', '宜昌市', '420000');
INSERT INTO "public"."Sys_City" VALUES (176, '420600', '襄樊市', '420000');
INSERT INTO "public"."Sys_City" VALUES (177, '420700', '鄂州市', '420000');
INSERT INTO "public"."Sys_City" VALUES (178, '420800', '荆门市', '420000');
INSERT INTO "public"."Sys_City" VALUES (179, '420900', '孝感市', '420000');
INSERT INTO "public"."Sys_City" VALUES (180, '421000', '荆州市', '420000');
INSERT INTO "public"."Sys_City" VALUES (181, '421100', '黄冈市', '420000');
INSERT INTO "public"."Sys_City" VALUES (182, '421200', '咸宁市', '420000');
INSERT INTO "public"."Sys_City" VALUES (183, '421300', '随州市', '420000');
INSERT INTO "public"."Sys_City" VALUES (184, '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO "public"."Sys_City" VALUES (185, '429000', '省直辖行政单位', '420000');
INSERT INTO "public"."Sys_City" VALUES (186, '430100', '长沙市', '430000');
INSERT INTO "public"."Sys_City" VALUES (187, '430200', '株洲市', '430000');
INSERT INTO "public"."Sys_City" VALUES (188, '430300', '湘潭市', '430000');
INSERT INTO "public"."Sys_City" VALUES (189, '430400', '衡阳市', '430000');
INSERT INTO "public"."Sys_City" VALUES (190, '430500', '邵阳市', '430000');
INSERT INTO "public"."Sys_City" VALUES (191, '430600', '岳阳市', '430000');
INSERT INTO "public"."Sys_City" VALUES (192, '430700', '常德市', '430000');
INSERT INTO "public"."Sys_City" VALUES (193, '430800', '张家界市', '430000');
INSERT INTO "public"."Sys_City" VALUES (194, '430900', '益阳市', '430000');
INSERT INTO "public"."Sys_City" VALUES (195, '431000', '郴州市', '430000');
INSERT INTO "public"."Sys_City" VALUES (196, '431100', '永州市', '430000');
INSERT INTO "public"."Sys_City" VALUES (197, '431200', '怀化市', '430000');
INSERT INTO "public"."Sys_City" VALUES (198, '431300', '娄底市', '430000');
INSERT INTO "public"."Sys_City" VALUES (199, '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO "public"."Sys_City" VALUES (200, '440100', '广州市', '440000');
INSERT INTO "public"."Sys_City" VALUES (201, '440200', '韶关市', '440000');
INSERT INTO "public"."Sys_City" VALUES (202, '440300', '深圳市', '440000');
INSERT INTO "public"."Sys_City" VALUES (203, '440400', '珠海市', '440000');
INSERT INTO "public"."Sys_City" VALUES (204, '440500', '汕头市', '440000');
INSERT INTO "public"."Sys_City" VALUES (205, '440600', '佛山市', '440000');
INSERT INTO "public"."Sys_City" VALUES (206, '440700', '江门市', '440000');
INSERT INTO "public"."Sys_City" VALUES (207, '440800', '湛江市', '440000');
INSERT INTO "public"."Sys_City" VALUES (208, '440900', '茂名市', '440000');
INSERT INTO "public"."Sys_City" VALUES (209, '441200', '肇庆市', '440000');
INSERT INTO "public"."Sys_City" VALUES (210, '441300', '惠州市', '440000');
INSERT INTO "public"."Sys_City" VALUES (211, '441400', '梅州市', '440000');
INSERT INTO "public"."Sys_City" VALUES (212, '441500', '汕尾市', '440000');
INSERT INTO "public"."Sys_City" VALUES (213, '441600', '河源市', '440000');
INSERT INTO "public"."Sys_City" VALUES (214, '441700', '阳江市', '440000');
INSERT INTO "public"."Sys_City" VALUES (215, '441800', '清远市', '440000');
INSERT INTO "public"."Sys_City" VALUES (216, '441900', '东莞市', '440000');
INSERT INTO "public"."Sys_City" VALUES (217, '442000', '中山市', '440000');
INSERT INTO "public"."Sys_City" VALUES (218, '445100', '潮州市', '440000');
INSERT INTO "public"."Sys_City" VALUES (219, '445200', '揭阳市', '440000');
INSERT INTO "public"."Sys_City" VALUES (220, '445300', '云浮市', '440000');
INSERT INTO "public"."Sys_City" VALUES (221, '450100', '南宁市', '450000');
INSERT INTO "public"."Sys_City" VALUES (222, '450200', '柳州市', '450000');
INSERT INTO "public"."Sys_City" VALUES (223, '450300', '桂林市', '450000');
INSERT INTO "public"."Sys_City" VALUES (224, '450400', '梧州市', '450000');
INSERT INTO "public"."Sys_City" VALUES (225, '450500', '北海市', '450000');
INSERT INTO "public"."Sys_City" VALUES (226, '450600', '防城港市', '450000');
INSERT INTO "public"."Sys_City" VALUES (227, '450700', '钦州市', '450000');
INSERT INTO "public"."Sys_City" VALUES (228, '450800', '贵港市', '450000');
INSERT INTO "public"."Sys_City" VALUES (229, '450900', '玉林市', '450000');
INSERT INTO "public"."Sys_City" VALUES (230, '451000', '百色市', '450000');
INSERT INTO "public"."Sys_City" VALUES (231, '451100', '贺州市', '450000');
INSERT INTO "public"."Sys_City" VALUES (232, '451200', '河池市', '450000');
INSERT INTO "public"."Sys_City" VALUES (233, '451300', '来宾市', '450000');
INSERT INTO "public"."Sys_City" VALUES (234, '451400', '崇左市', '450000');
INSERT INTO "public"."Sys_City" VALUES (235, '460100', '海口市', '460000');
INSERT INTO "public"."Sys_City" VALUES (236, '460200', '三亚市', '460000');
INSERT INTO "public"."Sys_City" VALUES (237, '469000', '省直辖县级行政单位', '460000');
INSERT INTO "public"."Sys_City" VALUES (238, '500100', '市辖区', '500000');
INSERT INTO "public"."Sys_City" VALUES (239, '500200', '县', '500000');
INSERT INTO "public"."Sys_City" VALUES (240, '500300', '市', '500000');
INSERT INTO "public"."Sys_City" VALUES (241, '510100', '成都市', '510000');
INSERT INTO "public"."Sys_City" VALUES (242, '510300', '自贡市', '510000');
INSERT INTO "public"."Sys_City" VALUES (243, '510400', '攀枝花市', '510000');
INSERT INTO "public"."Sys_City" VALUES (244, '510500', '泸州市', '510000');
INSERT INTO "public"."Sys_City" VALUES (245, '510600', '德阳市', '510000');
INSERT INTO "public"."Sys_City" VALUES (246, '510700', '绵阳市', '510000');
INSERT INTO "public"."Sys_City" VALUES (247, '510800', '广元市', '510000');
INSERT INTO "public"."Sys_City" VALUES (248, '510900', '遂宁市', '510000');
INSERT INTO "public"."Sys_City" VALUES (249, '511000', '内江市', '510000');
INSERT INTO "public"."Sys_City" VALUES (250, '511100', '乐山市', '510000');
INSERT INTO "public"."Sys_City" VALUES (251, '511300', '南充市', '510000');
INSERT INTO "public"."Sys_City" VALUES (252, '511400', '眉山市', '510000');
INSERT INTO "public"."Sys_City" VALUES (253, '511500', '宜宾市', '510000');
INSERT INTO "public"."Sys_City" VALUES (254, '511600', '广安市', '510000');
INSERT INTO "public"."Sys_City" VALUES (255, '511700', '达州市', '510000');
INSERT INTO "public"."Sys_City" VALUES (256, '511800', '雅安市', '510000');
INSERT INTO "public"."Sys_City" VALUES (257, '511900', '巴中市', '510000');
INSERT INTO "public"."Sys_City" VALUES (258, '512000', '资阳市', '510000');
INSERT INTO "public"."Sys_City" VALUES (259, '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO "public"."Sys_City" VALUES (260, '513300', '甘孜藏族自治州', '510000');
INSERT INTO "public"."Sys_City" VALUES (261, '513400', '凉山彝族自治州', '510000');
INSERT INTO "public"."Sys_City" VALUES (262, '520100', '贵阳市', '520000');
INSERT INTO "public"."Sys_City" VALUES (263, '520200', '六盘水市', '520000');
INSERT INTO "public"."Sys_City" VALUES (264, '520300', '遵义市', '520000');
INSERT INTO "public"."Sys_City" VALUES (265, '520400', '安顺市', '520000');
INSERT INTO "public"."Sys_City" VALUES (266, '522200', '铜仁地区', '520000');
INSERT INTO "public"."Sys_City" VALUES (267, '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO "public"."Sys_City" VALUES (268, '522400', '毕节地区', '520000');
INSERT INTO "public"."Sys_City" VALUES (269, '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO "public"."Sys_City" VALUES (270, '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO "public"."Sys_City" VALUES (271, '530100', '昆明市', '530000');
INSERT INTO "public"."Sys_City" VALUES (272, '530300', '曲靖市', '530000');
INSERT INTO "public"."Sys_City" VALUES (273, '530400', '玉溪市', '530000');
INSERT INTO "public"."Sys_City" VALUES (274, '530500', '保山市', '530000');
INSERT INTO "public"."Sys_City" VALUES (275, '530600', '昭通市', '530000');
INSERT INTO "public"."Sys_City" VALUES (276, '530700', '丽江市', '530000');
INSERT INTO "public"."Sys_City" VALUES (277, '530800', '思茅市', '530000');
INSERT INTO "public"."Sys_City" VALUES (278, '530900', '临沧市', '530000');
INSERT INTO "public"."Sys_City" VALUES (279, '532300', '楚雄彝族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (280, '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (281, '532600', '文山壮族苗族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (282, '532800', '西双版纳傣族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (283, '532900', '大理白族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (284, '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (285, '533300', '怒江傈僳族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (286, '533400', '迪庆藏族自治州', '530000');
INSERT INTO "public"."Sys_City" VALUES (287, '540100', '拉萨市', '540000');
INSERT INTO "public"."Sys_City" VALUES (288, '542100', '昌都地区', '540000');
INSERT INTO "public"."Sys_City" VALUES (289, '542200', '山南地区', '540000');
INSERT INTO "public"."Sys_City" VALUES (290, '542300', '日喀则地区', '540000');
INSERT INTO "public"."Sys_City" VALUES (291, '542400', '那曲地区', '540000');
INSERT INTO "public"."Sys_City" VALUES (292, '542500', '阿里地区', '540000');
INSERT INTO "public"."Sys_City" VALUES (293, '542600', '林芝地区', '540000');
INSERT INTO "public"."Sys_City" VALUES (294, '610100', '西安市', '610000');
INSERT INTO "public"."Sys_City" VALUES (295, '610200', '铜川市', '610000');
INSERT INTO "public"."Sys_City" VALUES (296, '610300', '宝鸡市', '610000');
INSERT INTO "public"."Sys_City" VALUES (297, '610400', '咸阳市', '610000');
INSERT INTO "public"."Sys_City" VALUES (298, '610500', '渭南市', '610000');
INSERT INTO "public"."Sys_City" VALUES (299, '610600', '延安市', '610000');
INSERT INTO "public"."Sys_City" VALUES (300, '610700', '汉中市', '610000');
INSERT INTO "public"."Sys_City" VALUES (301, '610800', '榆林市', '610000');
INSERT INTO "public"."Sys_City" VALUES (302, '610900', '安康市', '610000');
INSERT INTO "public"."Sys_City" VALUES (303, '611000', '商洛市', '610000');
INSERT INTO "public"."Sys_City" VALUES (304, '620100', '兰州市', '620000');
INSERT INTO "public"."Sys_City" VALUES (305, '620200', '嘉峪关市', '620000');
INSERT INTO "public"."Sys_City" VALUES (306, '620300', '金昌市', '620000');
INSERT INTO "public"."Sys_City" VALUES (307, '620400', '白银市', '620000');
INSERT INTO "public"."Sys_City" VALUES (308, '620500', '天水市', '620000');
INSERT INTO "public"."Sys_City" VALUES (309, '620600', '武威市', '620000');
INSERT INTO "public"."Sys_City" VALUES (310, '620700', '张掖市', '620000');
INSERT INTO "public"."Sys_City" VALUES (311, '620800', '平凉市', '620000');
INSERT INTO "public"."Sys_City" VALUES (312, '620900', '酒泉市', '620000');
INSERT INTO "public"."Sys_City" VALUES (313, '621000', '庆阳市', '620000');
INSERT INTO "public"."Sys_City" VALUES (314, '621100', '定西市', '620000');
INSERT INTO "public"."Sys_City" VALUES (315, '621200', '陇南市', '620000');
INSERT INTO "public"."Sys_City" VALUES (316, '622900', '临夏回族自治州', '620000');
INSERT INTO "public"."Sys_City" VALUES (317, '623000', '甘南藏族自治州', '620000');
INSERT INTO "public"."Sys_City" VALUES (318, '630100', '西宁市', '630000');
INSERT INTO "public"."Sys_City" VALUES (319, '632100', '海东地区', '630000');
INSERT INTO "public"."Sys_City" VALUES (320, '632200', '海北藏族自治州', '630000');
INSERT INTO "public"."Sys_City" VALUES (321, '632300', '黄南藏族自治州', '630000');
INSERT INTO "public"."Sys_City" VALUES (322, '632500', '海南藏族自治州', '630000');
INSERT INTO "public"."Sys_City" VALUES (323, '632600', '果洛藏族自治州', '630000');
INSERT INTO "public"."Sys_City" VALUES (324, '632700', '玉树藏族自治州', '630000');
INSERT INTO "public"."Sys_City" VALUES (325, '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO "public"."Sys_City" VALUES (326, '640100', '银川市', '640000');
INSERT INTO "public"."Sys_City" VALUES (327, '640200', '石嘴山市', '640000');
INSERT INTO "public"."Sys_City" VALUES (328, '640300', '吴忠市', '640000');
INSERT INTO "public"."Sys_City" VALUES (329, '640400', '固原市', '640000');
INSERT INTO "public"."Sys_City" VALUES (330, '640500', '中卫市', '640000');
INSERT INTO "public"."Sys_City" VALUES (331, '650100', '乌鲁木齐市', '650000');
INSERT INTO "public"."Sys_City" VALUES (332, '650200', '克拉玛依市', '650000');
INSERT INTO "public"."Sys_City" VALUES (333, '652100', '吐鲁番地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (334, '652200', '哈密地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (335, '652300', '昌吉回族自治州', '650000');
INSERT INTO "public"."Sys_City" VALUES (336, '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO "public"."Sys_City" VALUES (337, '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO "public"."Sys_City" VALUES (338, '652900', '阿克苏地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (339, '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO "public"."Sys_City" VALUES (340, '653100', '喀什地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (341, '653200', '和田地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (342, '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO "public"."Sys_City" VALUES (343, '654200', '塔城地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (344, '654300', '阿勒泰地区', '650000');
INSERT INTO "public"."Sys_City" VALUES (345, '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for Sys_Department
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Department";
CREATE TABLE "public"."Sys_Department" (
  "DepartmentId" uuid NOT NULL,
  "DepartmentName" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "DepartmentCode" varchar(50) COLLATE "pg_catalog"."default",
  "ParentId" uuid,
  "DepartmentType" varchar(50) COLLATE "pg_catalog"."default",
  "Enable" int4,
  "Remark" text COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;

-- ----------------------------
-- Records of Sys_Department
-- ----------------------------
INSERT INTO "public"."Sys_Department" VALUES ('62105dfa-ca64-4c4a-ab42-11ba677ac4db', '市场部', 'A003', '8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:12:48', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('8974177f-af6b-45b5-b7ab-88f169063f40', '北京基础研究院', 'A0001', NULL, NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 08:56:16', 1, '超级管理员', '2023-05-13 09:50:34');
INSERT INTO "public"."Sys_Department" VALUES ('97b5ff9c-5f52-4745-95f9-5fed8d505fa9', '资源部', 'H0007', '41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 09:50:27', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('9e1121a0-d5c5-4f46-8dd4-43ed90d2f963', '行政部', 'A005', '8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:13:18', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('d01eb5d9-0f02-4468-94b8-635a5dfb3142', '商务部', 'A0002', '8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:07:16', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('e5d8e8af-3659-454c-aa8e-c201c7edbcfb', '销售部', 'A004', '62105dfa-ca64-4c4a-ab42-11ba677ac4db', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:13:03', 1, '超级管理员', '2023-05-13 09:14:27');
INSERT INTO "public"."Sys_Department" VALUES ('e8c6cc16-af09-495d-b101-b651f10196de', '战略部', 'H0002', '41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:19:55', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('eae332dc-4af8-4ebf-804a-e3d6c6d00926', '人事部', NULL, '9e1121a0-d5c5-4f46-8dd4-43ed90d2f963', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:14:41', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('ec238385-f907-44de-b99b-0eddcffa6750', '产品部', 'A0003', '41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:20:26', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('41b96ea8-5475-4775-845d-fd66370c75ae', '上海市场研究院', 'H0001', NULL, NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 09:15:56', 1, '超级管理员', '2025-07-14 18:40:10');

-- ----------------------------
-- Table structure for Sys_Dictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Dictionary";
CREATE TABLE "public"."Sys_Dictionary" (
  "Dic_ID" int4 NOT NULL DEFAULT nextval('sys_dictionary_id_seq'::regclass),
  "Config" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "DBServer" text COLLATE "pg_catalog"."default",
  "DbSql" text COLLATE "pg_catalog"."default",
  "DicName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DicNo" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "Enable" int2 NOT NULL,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "OrderNo" int4,
  "ParentId" int4 NOT NULL,
  "Remark" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_Dictionary
-- ----------------------------
INSERT INTO "public"."Sys_Dictionary" VALUES (1, NULL, '2023-08-04 15:01:34', 3362, '测试管理员', 'TestDbContext', NULL, '性别', '性别', 1, '超级管理员', '2024-06-03 23:58:45', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (3, '{valueField: "Enable",\r\ntextField: "Enable",\r\n containField: null,\r\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', NULL, NULL, '是否值', 'enable', 1, '超级管理员', '2024-06-03 23:59:03', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (30, '{valueField: "Success",\r\n textField: "Success", \r\n containField: null,\r\n handler: null }\r\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '超级管理员', '2024-06-04 00:06:59', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (31, '{valueField: "LogType",\r\n textField: "LogType", \r\n containField: null,\r\n handler: null }\r\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (35, '{\r\n valueField: "AuditStatus",\r\n textField: "AuditStatus",\r\n  containField:null \r\n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '超级管理员', '2024-06-04 00:04:02', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (38, '{\r\n valueField: "City",\r\n textField: "City",\r\n  containField:null \r\n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, '\r\nSELECT  CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "key",CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "value"  FROM Sys_City AS a \r\nINNER JOIN Sys_Province AS b \r\nON a.ProvinceCode=b.ProvinceCode\r\nWHERE a.CityName<> "县"', '城市', 'city', 1, '超级管理员', '2024-06-04 00:04:44', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (46, '{\r\n valueField: "ProvinceName",\r\n textField: "ProvinceName",\r\n  containField:null \r\n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, '\r\nSELECT  CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "key",CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "value"  FROM Sys_City AS a \r\nINNER JOIN Sys_Province AS b \r\nON a.ProvinceCode=b.ProvinceCode\r\nWHERE a.CityName<> "县"', '省列表', 'pro', 1, '超级管理员', '2024-06-04 00:04:50', 1, NULL, 88, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "public"."Sys_Dictionary" VALUES (49, '{\r\n valueField: "Gender",\r\n textField: "Gender",\r\n  containField:null \r\n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '超级管理员', '2024-06-03 23:59:30', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (50, '{\r\n valueField: "Enable",\r\n textField: "Enable",\r\n  containField:null \r\n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (70, NULL, '2023-05-19 01:20:29', 1, '超级管理员', 'SysDbContext', NULL, '组织类型', '组织类型', 1, '超级管理员', '2024-06-04 00:07:11', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (76, NULL, '2023-05-19 15:18:35', 1, '超级管理员', NULL, 'SELECT code AS "key",name AS value FROM Sys_Region AS a WHERE a.level=3', '县', '县', 1, '超级管理员', '2024-06-04 00:05:18', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (77, NULL, '2023-05-19 15:19:11', 1, '超级管理员', NULL, 'SELECT code AS "key",name AS value FROM Sys_Region AS a WHERE a.level=2', '市', '市', 1, '超级管理员', '2024-06-04 00:05:10', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (78, NULL, '2023-05-19 15:19:57', 1, '超级管理员', NULL, 'SELECT code AS "key",name AS value FROM Sys_Region AS a WHERE a.level=1', '省', '省', 1, '超级管理员', '2025-02-24 10:59:48', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (87, NULL, '2024-06-03 23:44:55', 1, '超级管理员', NULL, NULL, '系统字典', '系统字典', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (88, NULL, '2024-06-04 00:04:35', 1, '超级管理员', NULL, NULL, '省市字典', '省市字典', 1, '超级管理员', '2025-03-05 15:14:46', 1, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (95, NULL, '2025-03-17 00:19:59', 1, '超级管理员', NULL, NULL, '仓库类型', '仓库类型', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (96, NULL, '2025-03-17 00:32:39', 1, '超级管理员', 'ServiceDbContext', 'SELECT LocationID as "key", LocationName as "value", WarehouseID from MES_LocationManagement', '货位', '货位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (97, NULL, '2025-03-17 00:33:52', 1, '超级管理员', 'ServiceDbContext', 'SELECT WarehouseID  as "key", WarehouseName as "value" from MES_WarehouseManagement', '仓库', '仓库', 1, '超级管理员', '2025-03-17 00:42:11', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (98, NULL, '2025-03-17 01:29:20', 1, '超级管理员', NULL, NULL, '物料单位', '物料单位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (99, NULL, '2025-03-17 01:56:46', 1, '超级管理员', 'ServiceDbContext', 'SELECT EquipmentID as "key",EquipmentName as "value" from MES_EquipmentManagement', '设备列表', '设备列表', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (101, NULL, '2025-03-17 11:13:47', 1, '超级管理员', 'ServiceDbContext', 'SELECT CatalogID as "key",CatalogID as id,CatalogName as "value",ParentId as parentId from MES_MaterialCatalog', '物料分类', '物料分类', 1, '超级管理员', '2025-03-17 11:16:36', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (102, NULL, '2025-03-17 18:31:19', 1, '超级管理员', 'ServiceDbContext', 'SELECT MaterialCode as "key",MaterialName as "value",Unit,Specification from MES_Material', '物料列表', '物料列表', 1, '超级管理员', '2025-03-17 18:34:07', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (103, NULL, '2025-03-18 14:25:58', 1, '超级管理员', NULL, NULL, '排产状态', '排产状态', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (104, NULL, '2025-03-18 14:27:21', 1, '超级管理员', NULL, NULL, '优先级', '优先级', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (105, NULL, '2025-03-18 15:20:31', 1, '超级管理员', NULL, 'SELECT User_Id as "key",UserTrueName as "value" from Sys_User', '用户列表', '用户列表', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (106, NULL, '2025-03-19 01:27:42', 1, '超级管理员', 'ServiceDbContext', 'SELECT SupplierID as "key",SupplierName as "value" from MES_Supplier', '供应商', '供应商', 1, '超级管理员', '2025-03-19 01:30:28', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (94, NULL, '2025-03-17 00:18:30', 1, '超级管理员', NULL, NULL, 'mes业务', 'mes业务', 1, '超级管理员', '2025-07-14 18:15:56.686941', 1, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (85, NULL, '2023-10-07 14:40:56', 1, '超级管理员', NULL, NULL, '请求方式', '请求方式', 1, '超级管理员', '2025-07-14 18:16:00.450562', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (66, NULL, '2020-12-29 21:50:16', 1, '超级管理员', NULL, 'SELECT "Role_Id" AS "id","ParentId" as  "parentId","Role_Id" AS  "key","RoleName" AS "value" FROM "Sys_Role"', '级联角色', 'tree_roles', 1, '超级管理员', '2025-07-14 18:38:59.228739', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (32, '{valueField: "Role_Id",\r\n textField: "RoleName", \r\n containField: ["Role_Id","RoleName"],\r\n handler: null }\r\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as "key",RoleName as "value" FROM Sys_Role WHERE Enable=1\r\n', '角色列表', 'roles', 1, '超级管理员', '2025-07-14 18:39:03.964042', 1, 123, 87, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "public"."Sys_Dictionary" VALUES (67, NULL, '2023-05-04 02:13:14', 1, '超级管理员', NULL, 'SELECT "DepartmentId" AS "id","DepartmentId" AS "key","ParentId" AS "parentId","DepartmentName" AS "value" FROM "Sys_Department"', '部门级联', '部门级联', 1, '超级管理员', '2025-07-14 18:39:58.987502', 1, NULL, 87, NULL);

-- ----------------------------
-- Table structure for Sys_DictionaryList
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_DictionaryList";
CREATE TABLE "public"."Sys_DictionaryList" (
  "DicList_ID" int4 NOT NULL DEFAULT nextval('sys_dictionarylist_id_seq'::regclass),
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "DicName" varchar(100) COLLATE "pg_catalog"."default",
  "DicValue" varchar(100) COLLATE "pg_catalog"."default",
  "Dic_ID" int4,
  "Enable" int2,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "OrderNo" int4,
  "Remark" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_DictionaryList
-- ----------------------------
INSERT INTO "public"."Sys_DictionaryList" VALUES (1, '2023-08-04 15:01:34', 3362, '测试管理员', '男', '男', 1, 1, '超级管理员', '2024-06-03 23:58:45', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (2, '2023-08-04 15:01:34', 3362, '测试管理员', '女', '女', 1, 0, '超级管理员', '2024-06-03 23:58:45', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2024-06-03 23:59:03', 1, 2, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2024-06-03 23:59:03', 1, 1, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 100, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 50, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 100, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 90, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '待审核', '0', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 80, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 70, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '2', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 60, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '超级管理员', '2024-06-03 23:59:30', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '超级管理员', '2024-06-03 23:59:30', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 110, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (426, '2023-05-19 01:20:29', 1, '超级管理员', '组织', '1', 70, 0, '超级管理员', '2024-06-04 00:07:11', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (427, '2023-05-19 01:20:29', 1, '超级管理员', '部门', '2', 70, 0, '超级管理员', '2024-06-04 00:07:11', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (449, '2023-11-12 23:54:35', 1, '超级管理员', '审核未通过', '3', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 50, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (450, '2023-11-12 23:54:35', 1, '超级管理员', '驳回', '4', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 40, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (451, '2023-11-12 23:54:35', 1, '超级管理员', '终止', '5', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 30, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (452, '2023-11-12 23:54:35', 1, '超级管理员', '草稿', '90', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 20, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (453, '2023-11-12 23:54:35', 1, '超级管理员', '待提交', '100', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (465, '2025-03-17 00:19:59', 1, '超级管理员', '原材料存储', '原材料存储', 95, 0, NULL, NULL, NULL, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (466, '2025-03-17 00:19:59', 1, '超级管理员', '成品存储', '成品存储', 95, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (467, '2025-03-17 00:19:59', 1, '超级管理员', '半成品仓库', '半成品仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (468, '2025-03-17 00:19:59', 1, '超级管理员', '不良品仓库', '不良品仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (469, '2025-03-17 00:19:59', 1, '超级管理员', '包装材料仓库', '包装材料仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (470, '2025-03-17 01:29:21', 1, '超级管理员', '吨', '吨', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (471, '2025-03-17 01:29:21', 1, '超级管理员', 'kg', 'kg', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (472, '2025-03-17 01:29:21', 1, '超级管理员', '件', '件', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (473, '2025-03-17 01:29:21', 1, '超级管理员', '个', '个', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (474, '2025-03-18 14:25:59', 1, '超级管理员', '待生产', '待生产', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (475, '2025-03-18 14:25:59', 1, '超级管理员', '生产中', '生产中', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (476, '2025-03-18 14:25:59', 1, '超级管理员', '已完成', '已完成', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (477, '2025-03-18 14:27:21', 1, '超级管理员', 'LV1', '1', 104, 0, NULL, NULL, NULL, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (478, '2025-03-18 14:27:21', 1, '超级管理员', 'LV2', '2', 104, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (479, '2025-03-18 14:27:21', 1, '超级管理员', 'LV3', '3', 104, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (447, '2023-10-07 14:40:56', 1, '超级管理员', 'post', 'post', 85, 0, '超级管理员', '2025-07-14 18:16:00.451851', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (448, '2023-10-07 14:40:56', 1, '超级管理员', 'get', 'get', 85, 0, '超级管理员', '2025-07-14 18:16:00.468204', 1, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_DictionaryList_copy1
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_DictionaryList_copy1";
CREATE TABLE "public"."Sys_DictionaryList_copy1" (
  "DicList_ID" int4 NOT NULL,
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "DicName" varchar(100) COLLATE "pg_catalog"."default",
  "DicValue" varchar(100) COLLATE "pg_catalog"."default",
  "Dic_ID" int4,
  "Enable" int2,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "OrderNo" int4,
  "Remark" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_DictionaryList_copy1
-- ----------------------------
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (1, '2023-08-04 15:01:34', 3362, '测试管理员', '男', '男', 1, 1, '超级管理员', '2024-06-03 23:58:45', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (2, '2023-08-04 15:01:34', 3362, '测试管理员', '女', '女', 1, 0, '超级管理员', '2024-06-03 23:58:45', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (3, NULL, 1, 'admin', '否', '0', 3, NULL, '超级管理员', '2024-06-03 23:59:03', 1, 2, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (4, NULL, 1, 'xxx', '是', '1', 3, NULL, '超级管理员', '2024-06-03 23:59:03', 1, 1, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (22, '2018-06-11 18:26:05', 1, '测试超级管理员', '其他', '0', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (23, '2018-06-11 18:26:05', 1, '测试超级管理员', '成功', '1', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 100, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (24, '2018-06-12 09:41:58', 1, '测试超级管理员', '异常', '2', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, 50, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (25, '2018-06-12 14:46:08', 1, '测试超级管理员', '系统', 'System', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 100, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (26, '2018-06-12 14:47:32', 1, '测试超级管理员', '登陆', 'Login', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 90, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (27, '2018-06-15 15:29:58', 1, '测试超级管理员', '新建', 'Add', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (28, '2018-06-15 15:29:58', 1, '测试超级管理员', '删除', 'Del', 31, 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (29, '2018-06-15 15:30:34', 1, '测试超级管理员', '编辑', 'Edit', 31, 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (37, '2018-07-10 10:51:38', 1, '测试超级管理员', '待审核', '0', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 80, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (38, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核通过', '1', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 70, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (39, '2018-07-10 10:51:38', 1, '测试超级管理员', '审核中', '2', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 60, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (71, '2018-07-11 17:11:19', 1, '测试超级管理员', 'PC请求异常', 'Exception', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (90, '2018-07-23 10:04:45', 1, '测试超级管理员', '男', '0', 49, NULL, '超级管理员', '2024-06-03 23:59:30', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (91, '2018-07-23 10:04:45', 1, '测试超级管理员', '女', '1', 49, NULL, '超级管理员', '2024-06-03 23:59:30', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (96, '2018-07-23 15:36:43', 1, '测试超级管理员', '未启用', '0', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (97, '2018-07-23 15:36:43', 1, '测试超级管理员', '已启用', '1', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (98, '2018-07-23 15:36:43', 1, '测试超级管理员', '已删除', '2', 50, 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (144, '2019-08-21 16:40:50', 1, '超级管理员', '刷新Token', 'ReplaceToeken', 31, NULL, '超级管理员', '2024-06-03 23:59:21', 1, 110, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (145, '2019-08-21 16:49:43', 1, '超级管理员', 'Info', '3', 30, NULL, '超级管理员', '2024-06-04 00:06:59', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (426, '2023-05-19 01:20:29', 1, '超级管理员', '组织', '1', 70, 0, '超级管理员', '2024-06-04 00:07:11', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (427, '2023-05-19 01:20:29', 1, '超级管理员', '部门', '2', 70, 0, '超级管理员', '2024-06-04 00:07:11', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (449, '2023-11-12 23:54:35', 1, '超级管理员', '审核未通过', '3', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 50, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (450, '2023-11-12 23:54:35', 1, '超级管理员', '驳回', '4', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 40, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (451, '2023-11-12 23:54:35', 1, '超级管理员', '终止', '5', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 30, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (452, '2023-11-12 23:54:35', 1, '超级管理员', '草稿', '90', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 20, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (453, '2023-11-12 23:54:35', 1, '超级管理员', '待提交', '100', 35, 0, '超级管理员', '2024-06-04 00:04:02', 1, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (465, '2025-03-17 00:19:59', 1, '超级管理员', '原材料存储', '原材料存储', 95, 0, NULL, NULL, NULL, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (466, '2025-03-17 00:19:59', 1, '超级管理员', '成品存储', '成品存储', 95, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (467, '2025-03-17 00:19:59', 1, '超级管理员', '半成品仓库', '半成品仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (468, '2025-03-17 00:19:59', 1, '超级管理员', '不良品仓库', '不良品仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (469, '2025-03-17 00:19:59', 1, '超级管理员', '包装材料仓库', '包装材料仓库', 95, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (470, '2025-03-17 01:29:21', 1, '超级管理员', '吨', '吨', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (471, '2025-03-17 01:29:21', 1, '超级管理员', 'kg', 'kg', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (472, '2025-03-17 01:29:21', 1, '超级管理员', '件', '件', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (473, '2025-03-17 01:29:21', 1, '超级管理员', '个', '个', 98, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (474, '2025-03-18 14:25:59', 1, '超级管理员', '待生产', '待生产', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (475, '2025-03-18 14:25:59', 1, '超级管理员', '生产中', '生产中', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (476, '2025-03-18 14:25:59', 1, '超级管理员', '已完成', '已完成', 103, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (477, '2025-03-18 14:27:21', 1, '超级管理员', 'LV1', '1', 104, 0, NULL, NULL, NULL, 10, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (478, '2025-03-18 14:27:21', 1, '超级管理员', 'LV2', '2', 104, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (479, '2025-03-18 14:27:21', 1, '超级管理员', 'LV3', '3', 104, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (447, '2023-10-07 14:40:56', 1, '超级管理员', 'post', 'post', 85, 0, '超级管理员', '2025-07-14 18:16:00.451851', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList_copy1" VALUES (448, '2023-10-07 14:40:56', 1, '超级管理员', 'get', 'get', 85, 0, '超级管理员', '2025-07-14 18:16:00.468204', 1, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Dictionary_copy1
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Dictionary_copy1";
CREATE TABLE "public"."Sys_Dictionary_copy1" (
  "Dic_ID" int4 NOT NULL,
  "Config" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "DBServer" text COLLATE "pg_catalog"."default",
  "DbSql" text COLLATE "pg_catalog"."default",
  "DicName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DicNo" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "Enable" int2 NOT NULL,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "OrderNo" int4,
  "ParentId" int4 NOT NULL,
  "Remark" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_Dictionary_copy1
-- ----------------------------
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (1, NULL, '2023-08-04 15:01:34', 3362, '测试管理员', 'TestDbContext', NULL, '性别', '性别', 1, '超级管理员', '2024-06-03 23:58:45', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (3, '{valueField: "Enable",\r\ntextField: "Enable",\r\n containField: null,\r\n  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', NULL, NULL, '是否值', 'enable', 1, '超级管理员', '2024-06-03 23:59:03', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (30, '{valueField: "Success",\r\n textField: "Success", \r\n containField: null,\r\n handler: null }\r\n', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '超级管理员', '2024-06-04 00:06:59', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (31, '{valueField: "LogType",\r\n textField: "LogType", \r\n containField: null,\r\n handler: null }\r\n', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (35, '{\r\n valueField: "AuditStatus",\r\n textField: "AuditStatus",\r\n  containField:null \r\n}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '超级管理员', '2024-06-04 00:04:02', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (38, '{\r\n valueField: "City",\r\n textField: "City",\r\n  containField:null \r\n}', '2018-07-10 14:18:25', NULL, '测试超级管理员', NULL, '\r\nSELECT  CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "key",CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "value"  FROM Sys_City AS a \r\nINNER JOIN Sys_Province AS b \r\nON a.ProvinceCode=b.ProvinceCode\r\nWHERE a.CityName<> "县"', '城市', 'city', 1, '超级管理员', '2024-06-04 00:04:44', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (46, '{\r\n valueField: "ProvinceName",\r\n textField: "ProvinceName",\r\n  containField:null \r\n}', '2018-07-16 13:27:34', NULL, '测试超级管理员', NULL, '\r\nSELECT  CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "key",CASE WHEN  CityName="市辖区" THEN  ProvinceName ELSE CityName end  as  "value"  FROM Sys_City AS a \r\nINNER JOIN Sys_Province AS b \r\nON a.ProvinceCode=b.ProvinceCode\r\nWHERE a.CityName<> "县"', '省列表', 'pro', 1, '超级管理员', '2024-06-04 00:04:50', 1, NULL, 88, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (49, '{\r\n valueField: "Gender",\r\n textField: "Gender",\r\n  containField:null \r\n}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '超级管理员', '2024-06-03 23:59:30', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (50, '{\r\n valueField: "Enable",\r\n textField: "Enable",\r\n  containField:null \r\n}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (70, NULL, '2023-05-19 01:20:29', 1, '超级管理员', 'SysDbContext', NULL, '组织类型', '组织类型', 1, '超级管理员', '2024-06-04 00:07:11', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (76, NULL, '2023-05-19 15:18:35', 1, '超级管理员', NULL, 'SELECT code AS "key",name AS value FROM Sys_Region AS a WHERE a.level=3', '县', '县', 1, '超级管理员', '2024-06-04 00:05:18', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (77, NULL, '2023-05-19 15:19:11', 1, '超级管理员', NULL, 'SELECT code AS "key",name AS value FROM Sys_Region AS a WHERE a.level=2', '市', '市', 1, '超级管理员', '2024-06-04 00:05:10', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (78, NULL, '2023-05-19 15:19:57', 1, '超级管理员', NULL, 'SELECT code AS "key",name AS value FROM Sys_Region AS a WHERE a.level=1', '省', '省', 1, '超级管理员', '2025-02-24 10:59:48', 1, NULL, 88, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (87, NULL, '2024-06-03 23:44:55', 1, '超级管理员', NULL, NULL, '系统字典', '系统字典', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (88, NULL, '2024-06-04 00:04:35', 1, '超级管理员', NULL, NULL, '省市字典', '省市字典', 1, '超级管理员', '2025-03-05 15:14:46', 1, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (95, NULL, '2025-03-17 00:19:59', 1, '超级管理员', NULL, NULL, '仓库类型', '仓库类型', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (96, NULL, '2025-03-17 00:32:39', 1, '超级管理员', 'ServiceDbContext', 'SELECT LocationID as "key", LocationName as "value", WarehouseID from MES_LocationManagement', '货位', '货位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (97, NULL, '2025-03-17 00:33:52', 1, '超级管理员', 'ServiceDbContext', 'SELECT WarehouseID  as "key", WarehouseName as "value" from MES_WarehouseManagement', '仓库', '仓库', 1, '超级管理员', '2025-03-17 00:42:11', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (98, NULL, '2025-03-17 01:29:20', 1, '超级管理员', NULL, NULL, '物料单位', '物料单位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (99, NULL, '2025-03-17 01:56:46', 1, '超级管理员', 'ServiceDbContext', 'SELECT EquipmentID as "key",EquipmentName as "value" from MES_EquipmentManagement', '设备列表', '设备列表', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (101, NULL, '2025-03-17 11:13:47', 1, '超级管理员', 'ServiceDbContext', 'SELECT CatalogID as "key",CatalogID as id,CatalogName as "value",ParentId as parentId from MES_MaterialCatalog', '物料分类', '物料分类', 1, '超级管理员', '2025-03-17 11:16:36', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (102, NULL, '2025-03-17 18:31:19', 1, '超级管理员', 'ServiceDbContext', 'SELECT MaterialCode as "key",MaterialName as "value",Unit,Specification from MES_Material', '物料列表', '物料列表', 1, '超级管理员', '2025-03-17 18:34:07', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (103, NULL, '2025-03-18 14:25:58', 1, '超级管理员', NULL, NULL, '排产状态', '排产状态', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (104, NULL, '2025-03-18 14:27:21', 1, '超级管理员', NULL, NULL, '优先级', '优先级', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (105, NULL, '2025-03-18 15:20:31', 1, '超级管理员', NULL, 'SELECT User_Id as "key",UserTrueName as "value" from Sys_User', '用户列表', '用户列表', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (106, NULL, '2025-03-19 01:27:42', 1, '超级管理员', 'ServiceDbContext', 'SELECT SupplierID as "key",SupplierName as "value" from MES_Supplier', '供应商', '供应商', 1, '超级管理员', '2025-03-19 01:30:28', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (94, NULL, '2025-03-17 00:18:30', 1, '超级管理员', NULL, NULL, 'mes业务', 'mes业务', 1, '超级管理员', '2025-07-14 18:15:56.686941', 1, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (85, NULL, '2023-10-07 14:40:56', 1, '超级管理员', NULL, NULL, '请求方式', '请求方式', 1, '超级管理员', '2025-07-14 18:16:00.450562', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (66, NULL, '2020-12-29 21:50:16', 1, '超级管理员', NULL, 'SELECT "Role_Id" AS "id","ParentId" as  "parentId","Role_Id" AS  "key","RoleName" AS "value" FROM "Sys_Role"', '级联角色', 'tree_roles', 1, '超级管理员', '2025-07-14 18:38:59.228739', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (32, '{valueField: "Role_Id",\r\n textField: "RoleName", \r\n containField: ["Role_Id","RoleName"],\r\n handler: null }\r\n', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT Role_Id as "key",RoleName as "value" FROM Sys_Role WHERE Enable=1\r\n', '角色列表', 'roles', 1, '超级管理员', '2025-07-14 18:39:03.964042', 1, 123, 87, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (100, NULL, '2025-03-17 02:14:14', 1, '超级管理员', 'ServiceDbContext', NULL, '1111', '1111', 1, '超级管理员', '2025-07-14 18:28:14.071723', 1, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (100, NULL, '2025-07-14 18:16:07', 1, '超级管理员', NULL, NULL, '1111', '1111', 1, '超级管理员', '2025-07-14 18:28:14.071723', 1, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary_copy1" VALUES (67, NULL, '2023-05-04 02:13:14', 1, '超级管理员', NULL, 'SELECT "DepartmentId" AS "id","DepartmentId" AS "key","ParentId" AS "parentId","DepartmentName" AS "value" FROM "Sys_Department"', '部门级联', '部门级联', 1, '超级管理员', '2025-07-14 18:39:58.987502', 1, NULL, 87, NULL);

-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Log";
CREATE TABLE "public"."Sys_Log" (
  "Id" int4 NOT NULL DEFAULT nextval('sys_log_id_seq'::regclass),
  "BeginDate" timestamp(6),
  "BrowserType" varchar(200) COLLATE "pg_catalog"."default",
  "ElapsedTime" int4,
  "EndDate" timestamp(6),
  "ExceptionInfo" text COLLATE "pg_catalog"."default",
  "LogType" varchar(50) COLLATE "pg_catalog"."default",
  "RequestParameter" text COLLATE "pg_catalog"."default",
  "ResponseParameter" text COLLATE "pg_catalog"."default",
  "Role_Id" int4,
  "ServiceIP" varchar(100) COLLATE "pg_catalog"."default",
  "Success" int4,
  "Url" text COLLATE "pg_catalog"."default",
  "UserIP" varchar(100) COLLATE "pg_catalog"."default",
  "UserName" text COLLATE "pg_catalog"."default",
  "User_Id" int4
)
;

-- ----------------------------
-- Records of Sys_Log
-- ----------------------------
INSERT INTO "public"."Sys_Log" VALUES (1, '2025-03-24 03:21:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 96, '2025-03-24 03:21:15', NULL, 'Exception', 'The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See https://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.   at VOL.Core.EFDbContext.VOLContext.SaveChanges() in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\EFDbContext\\VOLContext.cs:line 54\r\n   at VOL.Core.BaseProvider.RepositoryBase`1.UpdateRange[Detail](TEntity entity, Boolean updateDetail, Boolean delNotExist, Expression`1 updateMainFields, Expression`1 updateDetailFields, Boolean saveChange) in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\BaseProvider\\RepositoryBase.cs:line 432\r\n   at VOL.Builder.Services.Sys_TableInfoService.SaveEidt(Sys_TableInfo sysTableInfo) in E:\\jxx\\vol-next\\vol.api\\VOL.Builder\\Services\\Core\\Partial\\Sys_TableInfoService.cs:line 432\r\n   at VOL.WebApi.Controllers.Builder.BuilderController.SaveEidt(Sys_TableInfo tableInfo) in E:\\jxx\\vol-next\\vol.api\\VOL.WebApi\\Controllers\\Builder\\BuilderController.cs:line 55\r\n   at lambda_method1039(Closure, Object, Object[])\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\r\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\r\n   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\Middleware\\HttpRequestMiddleware.cs:line 19\r\n--- End of stack trace from previous location ---\r\n   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\\jxx\\vol-next\\vol.api\\VOL.Core\\Middleware\\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/builder/Save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (2, '2025-03-24 03:21:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 0, '2025-03-24 03:21:17', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (3, '2025-03-24 03:21:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 0, '2025-03-24 03:21:41', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (4, '2025-03-24 03:22:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 1, '2025-03-24 03:22:08', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (5, '2025-03-24 03:23:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 1, '2025-03-24 03:23:25', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (6, '2025-03-24 03:23:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 0, '2025-03-24 03:23:46', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (7, '2025-03-24 03:23:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 1, '2025-03-24 03:23:52', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (200, '2025-07-14 18:13:48.886059', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 354, '2025-07-14 18:13:49.240236', '', 'Login', '{"UserName":"admin","Password":"","VerificationCode":"mtb3","UUID":"c9ccad0d-0624-46f8-a1d3-3a45f0e9e437"}', '登陆成功', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/user/login', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (201, '2025-07-14 18:13:49.68088', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:13:49.684232', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (202, '2025-07-14 18:14:04.49051', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 75, '2025-07-14 18:14:04.565719', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Customer/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (203, '2025-07-14 18:14:05.257753', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 24, '2025-07-14 18:14:05.281569', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Supplier/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (204, '2025-07-14 18:14:06.045624', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 23, '2025-07-14 18:14:06.068743', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_ProductionLine/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (205, '2025-07-14 18:14:11.231001', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 22, '2025-07-14 18:14:11.252586', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (206, '2025-07-14 18:14:11.099696', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 155, '2025-07-14 18:14:11.254939', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (207, '2025-07-14 18:14:11.304923', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:14:11.306082', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (208, '2025-07-14 18:14:11.306008', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:14:11.306391', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (209, '2025-07-14 18:14:18.275317', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:14:18.284264', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (210, '2025-07-14 18:14:18.38118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 64, '2025-07-14 18:14:18.445437', NULL, '查询', '{"page":1,"rows":30,"sort":"Role_Id","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Role/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (211, '2025-07-14 18:14:30.985658', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 15, '2025-07-14 18:14:31.000339', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (212, '2025-07-14 18:14:32.613476', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 20, '2025-07-14 18:14:32.633087', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":94,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (213, '2025-07-14 18:14:35.872957', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:14:35.881615', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":88,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (214, '2025-07-14 18:14:39.559846', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 10, '2025-07-14 18:14:39.570129', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":85,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (215, '2025-07-14 18:14:52.638019', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 90, '2025-07-14 18:14:52.727878', NULL, 'Info', '表:Sys_Dictionary,菜单：数据字典,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (216, '2025-07-14 18:14:56.36996', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:14:56.379449', NULL, 'Info', '表:Sys_Menu,菜单：菜单设置,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (217, '2025-07-14 18:15:03.041761', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 7, '2025-07-14 18:15:03.048577', NULL, 'Info', '表:Sys_Department,菜单：组织架构,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (218, '2025-07-14 18:15:06.76416', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:15:06.769371', NULL, 'Info', '表:Sys_User,菜单：用户管理,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (219, '2025-07-14 18:15:09.036454', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:15:09.042353', NULL, 'Info', '表:,,菜单：权限管理,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (220, '2025-07-14 18:15:10.970461', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 7, '2025-07-14 18:15:10.97743', NULL, 'Info', '表:Sys_Role,菜单：角色管理,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (221, '2025-07-14 18:15:12.986131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:15:12.991952', NULL, 'Info', '表:Sys_Role1,菜单：角色管理(tree),权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (222, '2025-07-14 18:15:18.034218', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:15:18.039827', NULL, 'Info', '表:Sys_Menu,菜单：菜单设置,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (223, '2025-07-14 18:15:22.090081', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:15:22.095544', NULL, 'Info', '表:Sys_Dictionary,菜单：数据字典,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (224, '2025-07-14 18:15:26.466105', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:15:26.472077', NULL, 'Info', '表:Sys_WorkFlow,菜单：流程管理,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (225, '2025-07-14 18:15:28.553866', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:15:28.559101', NULL, 'Info', '表:Sys_WorkFlowTable,菜单：我的审批,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (226, '2025-07-14 18:15:34.130235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:15:34.135867', NULL, 'Info', '表:Sys_QuartzOptions,菜单：任务配置,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (227, '2025-07-14 18:15:35.441012', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:15:35.445489', NULL, 'Info', '表:Sys_QuartzLog,菜单：执行记录,权限,成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (228, '2025-07-14 18:15:44.005204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:15:44.009731', NULL, 'Info', '表:Sys_Log,菜单：系统日志,权限[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (229, '2025-07-14 18:15:47.226909', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:15:47.231895', NULL, 'Info', '表:/,菜单：代码生成,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (230, '2025-07-14 18:15:51.481385', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:15:51.481943', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (231, '2025-07-14 18:15:53.718997', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:15:53.722815', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (258, '2025-07-14 18:18:30.320744', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 29, '2025-07-14 18:18:30.349795', NULL, '查询', '{"page":1,"rows":30,"sort":"ProcessSequence","order":"asc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (232, '2025-07-14 18:15:55.711708', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:15:55.715178', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":94,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (237, '2025-07-14 18:16:00.443142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 56, '2025-07-14 18:16:00.499333', NULL, 'Edit', '{"mainData":{"DicNo":"请求方式","DicName":"请求方式","ParentId":"87","OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":85},"detailData":[{"DicList_ID":447,"Dic_ID":85,"DicValue":"post","DicName":"post","OrderNo":null,"Remark":null,"Enable":0,"CreateID":1,"Creator":"超级管理员","CreateDate":"2023-10-07 14:40:56","ModifyID":1,"Modifier":"超级管理员","ModifyDate":"2024-06-03 23:51:26","elementIndex":0},{"DicList_ID":448,"Dic_ID":85,"DicValue":"get","DicName":"get","OrderNo":null,"Remark":null,"Enable":0,"CreateID":1,"Creator":"超级管理员","CreateDate":"2023-10-07 14:40:56","ModifyID":1,"Modifier":"超级管理员","ModifyDate":"2024-06-03 23:51:26","elementIndex":1}],"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (238, '2025-07-14 18:16:00.443142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 56, '2025-07-14 18:16:00.499601', NULL, '编辑', '{"mainData":{"DicNo":"请求方式","DicName":"请求方式","ParentId":"87","OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":85},"detailData":[{"DicList_ID":447,"Dic_ID":85,"DicValue":"post","DicName":"post","OrderNo":null,"Remark":null,"Enable":0,"CreateID":1,"Creator":"超级管理员","CreateDate":"2023-10-07 14:40:56","ModifyID":1,"Modifier":"超级管理员","ModifyDate":"2024-06-03 23:51:26","elementIndex":0},{"DicList_ID":448,"Dic_ID":85,"DicValue":"get","DicName":"get","OrderNo":null,"Remark":null,"Enable":0,"CreateID":1,"Creator":"超级管理员","CreateDate":"2023-10-07 14:40:56","ModifyID":1,"Modifier":"超级管理员","ModifyDate":"2024-06-03 23:51:26","elementIndex":1}],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (239, '2025-07-14 18:16:00.548139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:16:00.550896', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (243, '2025-07-14 18:16:10.272857', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 7, '2025-07-14 18:16:10.279531', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":100,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (244, '2025-07-14 18:16:16.859849', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 20, '2025-07-14 18:16:16.879855', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.Update(SaveModel saveModel) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 183
   at lambda_method1765(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.Reflection.TargetInvocationException: Exception has been thrown by the target of an invocation.
 ---> Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException: The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See https://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.
   at VOL.Core.EFDbContext.VOLContext.SaveChanges() in E:\jxx\vue.netcore\vol.api\VOL.Core\EFDbContext\VOLContext.cs:line 54
   at VOL.Core.BaseProvider.ServiceBase`2.UpdateToEntity[DetailT](SaveModel saveModel, PropertyInfo mainKeyProperty, PropertyInfo detailKeyInfo, Object keyDefaultVal) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 910
   at InvokeStub_ServiceBase`2.UpdateToEntity(Object, Span`1)
   at System.Reflection.MethodBaseInvoker.InvokeWithFewArgs(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   --- End of inner exception stack trace ---
   at System.Reflection.MethodBaseInvoker.InvokeWithFewArgs(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.BaseProvider.ServiceBase`2.Update(SaveModel saveModel) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 1163
   at VOL.Sys.Services.Sys_DictionaryService.Update(SaveModel saveDataModel) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 199
   at InvokeStub_Sys_DictionaryService.Update(Object, Span`1)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (233, '2025-07-14 18:15:56.65277', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 66, '2025-07-14 18:15:56.718765', NULL, 'Edit', '{"mainData":{"DicNo":"mes业务","DicName":"mes业务","ParentId":0,"OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":94},"detailData":[],"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (234, '2025-07-14 18:15:56.65277', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 67, '2025-07-14 18:15:56.720188', NULL, '编辑', '{"mainData":{"DicNo":"mes业务","DicName":"mes业务","ParentId":0,"OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":94},"detailData":[],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (235, '2025-07-14 18:15:56.731', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:15:56.73464', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (236, '2025-07-14 18:15:59.529414', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:15:59.532282', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":85,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (240, '2025-07-14 18:16:07.779236', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 43, '2025-07-14 18:16:07.822582', NULL, 'Add', '{"mainData":{"DicNo":"1111","DicName":"1111","ParentId":0,"OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":null},"detailData":[],"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/add', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (241, '2025-07-14 18:16:07.779236', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 46, '2025-07-14 18:16:07.825297', NULL, '新建', '{"mainData":{"DicNo":"1111","DicName":"1111","ParentId":0,"OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":null},"detailData":[],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/add', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (242, '2025-07-14 18:16:07.867989', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:16:07.8708', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]","resetPage":true}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (245, '2025-07-14 18:17:03.603352', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 13, '2025-07-14 18:17:03.616118', NULL, 'Exception', '42P01: 关系 "sys_department" 不存在

POSITION: 99   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (246, '2025-07-14 18:17:03.683168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 17, '2025-07-14 18:17:03.700292', NULL, '查询', '{"page":1,"rows":1000,"sort":"DepartmentName","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Department/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (247, '2025-07-14 18:17:14.475953', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 18, '2025-07-14 18:17:14.494178', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_WorkFlow/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (248, '2025-07-14 18:17:19.321035', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 31, '2025-07-14 18:17:19.352232', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]","value":0}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_WorkFlowTable/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (249, '2025-07-14 18:17:19.948683', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:17:19.951244', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_WorkFlow/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (250, '2025-07-14 18:17:21.508576', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:17:21.512415', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Supplier/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (251, '2025-07-14 18:17:22.141846', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:17:22.145209', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Customer/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (252, '2025-07-14 18:17:22.75804', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:17:22.761134', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_ProductionLine/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (253, '2025-07-14 18:17:32.578011', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:17:32.583122', NULL, 'Info', '表:MES_Customer,菜单： 客户管理,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (254, '2025-07-14 18:17:37.297192', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:17:37.303298', NULL, 'Info', '表:MES_Supplier,菜单：供应商,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (255, '2025-07-14 18:18:25.691886', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 80, '2025-07-14 18:18:25.772118', NULL, 'Info', '表:MES_Supplier,菜单：供应商,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (256, '2025-07-14 18:18:27.690195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:18:27.690857', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (257, '2025-07-14 18:18:30.298906', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:18:30.30247', NULL, 'Exception', '42P01: 关系 "mes_process" 不存在

POSITION: 55   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (259, '2025-07-14 18:18:44.172334', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:18:44.17282', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (260, '2025-07-14 18:18:44.263655', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:18:44.268166', NULL, 'Exception', '42P01: 关系 "mes_process" 不存在

POSITION: 55   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (261, '2025-07-14 18:18:44.269144', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:18:44.272251', NULL, '查询', '{"page":1,"rows":30,"sort":"ProcessSequence","order":"asc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (263, '2025-07-14 18:18:47.234164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:18:47.243362', NULL, '明细查询', '{"page":1,"rows":1000,"sort":"RouteSequence","order":"asc","wheres":"[]","value":"4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (264, '2025-07-14 18:18:47.632577', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:18:47.635376', NULL, '明细查询', '{"page":1,"rows":1000,"sort":"RouteSequence","order":"asc","wheres":"[]","value":"4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (266, '2025-07-14 18:20:10.821488', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:20:10.824511', NULL, 'Exception', '42P01: 关系 "mes_process" 不存在

POSITION: 55   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (267, '2025-07-14 18:20:10.82838', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:20:10.831828', NULL, '查询', '{"page":1,"rows":30,"sort":"ProcessSequence","order":"asc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (268, '2025-07-14 18:20:17.993984', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:20:17.996785', NULL, 'Exception', '42P01: 关系 "mes_process" 不存在

POSITION: 55   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (269, '2025-07-14 18:20:18.061497', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 44, '2025-07-14 18:20:18.105926', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.GetPageData(PageDataOptions loadData) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 40
   at lambda_method2228(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.InvalidCastException: Reading as ''System.Guid'' is not supported for fields having DataTypeName ''character varying''
   at Npgsql.Internal.AdoSerializerHelpers.<GetTypeInfoForReading>g__ThrowReadingNotSupported|0_0(Type type, PgSerializerOptions options, PgTypeId pgTypeId, Exception inner)
   at Npgsql.Internal.AdoSerializerHelpers.GetTypeInfoForReading(Type type, PgTypeId pgTypeId, PgSerializerOptions options)
   at Npgsql.BackendMessages.FieldDescription.<GetInfo>g__GetInfoSlow|50_0(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.BackendMessages.FieldDescription.GetInfo(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.NpgsqlDataReader.<GetInfo>g__Slow|133_0(ColumnInfo& info, PgConverter& converter, Size& bufferRequirement, Boolean& asObject, <>c__DisplayClass133_0&)
   at Npgsql.NpgsqlDataReader.GetFieldValueCore[T](Int32 ordinal)
   at lambda_method2232(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at VOL.Core.BaseProvider.ServiceBase`2.GetPageData(PageDataOptions options) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 325
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/MES_ProcessRoute/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (275, '2025-07-14 18:20:31.960078', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 15, '2025-07-14 18:20:31.974977', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.GetPageData(PageDataOptions loadData) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 40
   at lambda_method2244(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.InvalidCastException: Reading as ''System.Guid'' is not supported for fields having DataTypeName ''character varying''
   at Npgsql.Internal.AdoSerializerHelpers.<GetTypeInfoForReading>g__ThrowReadingNotSupported|0_0(Type type, PgSerializerOptions options, PgTypeId pgTypeId, Exception inner)
   at Npgsql.Internal.AdoSerializerHelpers.GetTypeInfoForReading(Type type, PgTypeId pgTypeId, PgSerializerOptions options)
   at Npgsql.BackendMessages.FieldDescription.<GetInfo>g__GetInfoSlow|50_0(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.BackendMessages.FieldDescription.GetInfo(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.NpgsqlDataReader.<GetInfo>g__Slow|133_0(ColumnInfo& info, PgConverter& converter, Size& bufferRequirement, Boolean& asObject, <>c__DisplayClass133_0&)
   at Npgsql.NpgsqlDataReader.GetFieldValueCore[T](Int32 ordinal)
   at lambda_method2248(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at VOL.Core.BaseProvider.ServiceBase`2.GetPageData(PageDataOptions options) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 325
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/MES_EquipmentRepair/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (262, '2025-07-14 18:18:46.504729', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 17, '2025-07-14 18:18:46.521751', NULL, '明细查询', '{"page":1,"rows":1000,"sort":"RouteSequence","order":"asc","wheres":"[]","value":"4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (265, '2025-07-14 18:20:10.701025', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:20:10.701515', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (270, '2025-07-14 18:20:26.151564', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 2, '2025-07-14 18:20:26.153824', NULL, 'Exception', '42P01: 关系 "mes_process" 不存在

POSITION: 55   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (271, '2025-07-14 18:20:26.225564', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 53, '2025-07-14 18:20:26.278568', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.GetPageData(PageDataOptions loadData) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 40
   at lambda_method2235(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.InvalidCastException: Reading as ''System.Guid'' is not supported for fields having DataTypeName ''character varying''
   at Npgsql.Internal.AdoSerializerHelpers.<GetTypeInfoForReading>g__ThrowReadingNotSupported|0_0(Type type, PgSerializerOptions options, PgTypeId pgTypeId, Exception inner)
   at Npgsql.Internal.AdoSerializerHelpers.GetTypeInfoForReading(Type type, PgTypeId pgTypeId, PgSerializerOptions options)
   at Npgsql.BackendMessages.FieldDescription.<GetInfo>g__GetInfoSlow|50_0(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.BackendMessages.FieldDescription.GetInfo(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.NpgsqlDataReader.<GetInfo>g__Slow|133_0(ColumnInfo& info, PgConverter& converter, Size& bufferRequirement, Boolean& asObject, <>c__DisplayClass133_0&)
   at Npgsql.NpgsqlDataReader.GetFieldValueCore[T](Int32 ordinal)
   at lambda_method2241(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at VOL.Core.BaseProvider.ServiceBase`2.GetPageData(PageDataOptions options) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 325
   at VOL.MES.Services.MES_ProcessReportService.GetPageData(PageDataOptions options) in E:\jxx\vue.netcore\vol.api\VOL.MES\Services\mes\Partial\MES_ProcessReportService.cs:line 52
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/MES_ProcessReport/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (272, '2025-07-14 18:20:28.653664', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 2, '2025-07-14 18:20:28.655704', NULL, 'Exception', '42P01: 关系 "mes_process" 不存在

POSITION: 55   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (273, '2025-07-14 18:20:28.668742', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:20:28.671598', NULL, '查询', '{"page":1,"rows":30,"sort":"ProcessSequence","order":"asc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/MES_Process/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (274, '2025-07-14 18:20:31.856422', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:20:31.858982', NULL, 'Exception', '42P01: 关系 "mes_equipmentmanagement" 不存在

POSITION: 59   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method1341(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (276, '2025-07-14 18:20:57.388144', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:20:57.391106', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (277, '2025-07-14 18:20:57.39337', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 98, '2025-07-14 18:20:57.491548', NULL, 'Exception', '42P01: 关系 "mes_equipmentmanagement" 不存在

POSITION: 59   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method866(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (278, '2025-07-14 18:20:57.521988', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 90, '2025-07-14 18:20:57.61179', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.GetPageData(PageDataOptions loadData) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 40
   at lambda_method890(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.InvalidCastException: Reading as ''System.Guid'' is not supported for fields having DataTypeName ''character varying''
   at Npgsql.Internal.AdoSerializerHelpers.<GetTypeInfoForReading>g__ThrowReadingNotSupported|0_0(Type type, PgSerializerOptions options, PgTypeId pgTypeId, Exception inner)
   at Npgsql.Internal.AdoSerializerHelpers.GetTypeInfoForReading(Type type, PgTypeId pgTypeId, PgSerializerOptions options)
   at Npgsql.BackendMessages.FieldDescription.<GetInfo>g__GetInfoSlow|50_0(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.BackendMessages.FieldDescription.GetInfo(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.NpgsqlDataReader.<GetInfo>g__Slow|133_0(ColumnInfo& info, PgConverter& converter, Size& bufferRequirement, Boolean& asObject, <>c__DisplayClass133_0&)
   at Npgsql.NpgsqlDataReader.GetFieldValueCore[T](Int32 ordinal)
   at Npgsql.NpgsqlDataReader.GetGuid(Int32 ordinal)
   at lambda_method915(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at VOL.Core.BaseProvider.ServiceBase`2.GetPageData(PageDataOptions options) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 325
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/MES_EquipmentRepair/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (279, '2025-07-14 18:21:02.513326', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 16, '2025-07-14 18:21:02.529724', NULL, 'Exception', '42P01: 关系 "mes_warehousemanagement" 不存在

POSITION: 61   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method866(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (280, '2025-07-14 18:21:02.571332', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 26, '2025-07-14 18:21:02.596999', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.GetPageData(PageDataOptions loadData) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 40
   at lambda_method918(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.InvalidCastException: Reading as ''System.Guid'' is not supported for fields having DataTypeName ''character varying''
   at Npgsql.Internal.AdoSerializerHelpers.<GetTypeInfoForReading>g__ThrowReadingNotSupported|0_0(Type type, PgSerializerOptions options, PgTypeId pgTypeId, Exception inner)
   at Npgsql.Internal.AdoSerializerHelpers.GetTypeInfoForReading(Type type, PgTypeId pgTypeId, PgSerializerOptions options)
   at Npgsql.BackendMessages.FieldDescription.<GetInfo>g__GetInfoSlow|50_0(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.BackendMessages.FieldDescription.GetInfo(Type type, ColumnInfo& lastColumnInfo)
   at Npgsql.NpgsqlDataReader.<GetInfo>g__Slow|133_0(ColumnInfo& info, PgConverter& converter, Size& bufferRequirement, Boolean& asObject, <>c__DisplayClass133_0&)
   at Npgsql.NpgsqlDataReader.GetFieldValueCore[T](Int32 ordinal)
   at Npgsql.NpgsqlDataReader.GetGuid(Int32 ordinal)
   at lambda_method922(Closure, QueryContext, DbDataReader, ResultContext, SingleQueryResultCoordinator)
   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.Enumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at VOL.Core.BaseProvider.ServiceBase`2.GetPageData(PageDataOptions options) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 325
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/MES_LocationManagement/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (281, '2025-07-14 18:21:13.946987', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 23, '2025-07-14 18:21:13.969561', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (282, '2025-07-14 18:21:16.330359', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 24, '2025-07-14 18:21:16.354682', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]","value":0}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_WorkFlowTable/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (283, '2025-07-14 18:21:18.218586', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 21, '2025-07-14 18:21:18.239754', NULL, '查询', '{"page":1,"rows":30,"sort":"CreateDate","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_WorkFlow/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (284, '2025-07-14 18:22:05.061054', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:22:05.061612', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (285, '2025-07-14 18:23:23.252875', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:23:23.253431', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (286, '2025-07-14 18:23:40.301158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 237, '2025-07-14 18:23:40.537964', NULL, 'Info', '表:.,菜单：我的审批,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (287, '2025-07-14 18:24:40.419686', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:24:40.42023', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (288, '2025-07-14 18:25:59.305365', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:25:59.305989', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (289, '2025-07-14 18:26:36.5253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 26, '2025-07-14 18:26:36.551383', NULL, 'Info', '表:.,菜单：我的审批,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (290, '2025-07-14 18:27:07.71201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:27:07.71246', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (291, '2025-07-14 18:27:15.436389', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:27:15.44221', NULL, 'Info', '表:.,菜单：我的审批,权限[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (292, '2025-07-14 18:27:16.46746', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:27:16.468321', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (293, '2025-07-14 18:27:23.869173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:27:23.874675', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method866(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (294, '2025-07-14 18:27:23.991757', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 25, '2025-07-14 18:27:24.017036', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (295, '2025-07-14 18:27:24.066564', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:27:24.067062', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (296, '2025-07-14 18:27:24.067956', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:27:24.068449', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (297, '2025-07-14 18:27:47.84043', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:27:47.841074', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (298, '2025-07-14 18:27:57.279586', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:27:57.283476', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (299, '2025-07-14 18:28:06.093827', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 22, '2025-07-14 18:28:06.1155', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":106,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (300, '2025-07-14 18:28:12.956803', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:28:12.96566', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":100,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (301, '2025-07-14 18:28:14.037415', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 73, '2025-07-14 18:28:14.110453', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.Update(SaveModel saveModel) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 183
   at lambda_method1324(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.Reflection.TargetInvocationException: Exception has been thrown by the target of an invocation.
 ---> Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException: The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See https://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.
   at VOL.Core.EFDbContext.VOLContext.SaveChanges() in E:\jxx\vue.netcore\vol.api\VOL.Core\EFDbContext\VOLContext.cs:line 54
   at VOL.Core.BaseProvider.ServiceBase`2.UpdateToEntity[DetailT](SaveModel saveModel, PropertyInfo mainKeyProperty, PropertyInfo detailKeyInfo, Object keyDefaultVal) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 910
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   --- End of inner exception stack trace ---
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)
   at System.Reflection.MethodBaseInvoker.InvokeWithFewArgs(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.BaseProvider.ServiceBase`2.Update(SaveModel saveModel) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 1163
   at VOL.Sys.Services.Sys_DictionaryService.Update(SaveModel saveDataModel) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 199
   at System.RuntimeMethodHandle.InvokeMethod(Object target, Void** arguments, Signature sig, Boolean isConstructor)
   at System.Reflection.MethodBaseInvoker.InvokeDirectByRefWithFewArgs(Object obj, Span`1 copyOfArgs, BindingFlags invokeAttr)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (302, '2025-07-14 18:31:28.236369', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:31:28.236917', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (303, '2025-07-14 18:31:29.466985', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 88, '2025-07-14 18:31:29.555034', NULL, 'Edit', '{"mainData":{"UserName":"admin","UserTrueName":"超级管理员","Role_Id":1,"Gender":"1","Enable":"1","Email":"283591387@qq.com","DeptIds":"","Remark":"~还没想好...","HeadImageUrl":"Upload/Tables/Sys_User/202305131010574561/wechat.jpg","User_Id":1},"detailData":null,"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (304, '2025-07-14 18:31:29.466985', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 89, '2025-07-14 18:31:29.555955', NULL, '编辑', '{"mainData":{"UserName":"admin","UserTrueName":"超级管理员","Role_Id":1,"Gender":"1","Enable":"1","Email":"283591387@qq.com","DeptIds":"","Remark":"~还没想好...","HeadImageUrl":"Upload/Tables/Sys_User/202305131010574561/wechat.jpg","User_Id":1},"detailData":null,"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (305, '2025-07-14 18:31:29.565913', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:31:29.570864', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (306, '2025-07-14 18:31:38.300445', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:31:38.300916', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (307, '2025-07-14 18:31:38.306874', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:31:38.310967', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method866(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (308, '2025-07-14 18:31:38.441706', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:31:38.444353', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (309, '2025-07-14 18:31:38.513134', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:31:38.513575', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (310, '2025-07-14 18:31:38.513373', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:31:38.51379', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (311, '2025-07-14 18:32:07.351392', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:32:07.352062', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (312, '2025-07-14 18:32:07.356718', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 82, '2025-07-14 18:32:07.439051', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method866(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (313, '2025-07-14 18:32:07.47196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:32:07.477729', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (314, '2025-07-14 18:32:07.544614', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:32:07.545016', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (315, '2025-07-14 18:32:07.544531', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:32:07.545016', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (316, '2025-07-14 18:32:46.376096', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:32:46.376592', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (317, '2025-07-14 18:32:46.397154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 98354, '2025-07-14 18:34:24.751154', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method866(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (318, '2025-07-14 18:34:24.750489', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:34:24.755034', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (319, '2025-07-14 18:34:24.831881', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:34:24.832288', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (320, '2025-07-14 18:34:24.831921', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:34:24.832288', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (321, '2025-07-14 18:36:41.651474', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:36:41.657734', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (322, '2025-07-14 18:36:41.657398', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 97, '2025-07-14 18:36:41.754614', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method865(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeActionMethodAsync()
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeNextActionFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (323, '2025-07-14 18:36:41.806365', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 75, '2025-07-14 18:36:41.881167', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (324, '2025-07-14 18:36:41.916403', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:36:41.917136', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (325, '2025-07-14 18:36:41.916489', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:36:41.91726', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (326, '2025-07-14 18:37:07.234349', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:37:07.234955', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (327, '2025-07-14 18:37:07.254839', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 21833, '2025-07-14 18:37:29.087656', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method865(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (328, '2025-07-14 18:37:28.967895', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 122, '2025-07-14 18:37:29.090251', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (329, '2025-07-14 18:37:29.131675', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:37:29.132198', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (330, '2025-07-14 18:37:29.131619', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:37:29.132326', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (331, '2025-07-14 18:37:36.420668', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:37:36.421184', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (332, '2025-07-14 18:37:37.156138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 15691, '2025-07-14 18:37:52.846954', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (333, '2025-07-14 18:37:58.15536', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:37:58.156255', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (334, '2025-07-14 18:37:58.155414', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:37:58.156542', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (335, '2025-07-14 18:37:36.44277', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 21716, '2025-07-14 18:37:58.158607', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method865(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (336, '2025-07-14 18:38:40.877236', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:38:40.882019', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method865(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (337, '2025-07-14 18:38:41.00973', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 125, '2025-07-14 18:38:41.134497', NULL, '查询', '{"page":1,"rows":30,"sort":"Role_Id","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Role/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (338, '2025-07-14 18:38:45.297414', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:38:45.300823', NULL, 'Exception', '42601: 语法错误 在 "\" 或附近的

POSITION: 80   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method865(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (339, '2025-07-14 18:38:45.391625', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:38:45.395991', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (340, '2025-07-14 18:38:45.460698', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:38:45.461336', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (341, '2025-07-14 18:38:45.460708', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:38:45.461386', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (342, '2025-07-14 18:38:52.542967', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 19, '2025-07-14 18:38:52.561751', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (348, '2025-07-14 18:39:03.956447', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 11, '2025-07-14 18:39:03.967092', NULL, 'Edit', '{"mainData":{"DicNo":"roles","DicName":"角色列表","ParentId":"87","OrderNo":123,"Remark":"sql语句需要key,value列，界面才能绑定数据源","Enable":"1","DbSql":"SELECT Role_Id as \"key\",RoleName as \"value\" FROM Sys_Role WHERE Enable=1\\r\\n","Dic_ID":32},"detailData":[],"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (349, '2025-07-14 18:39:03.956447', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 11, '2025-07-14 18:39:03.967294', NULL, '编辑', '{"mainData":{"DicNo":"roles","DicName":"角色列表","ParentId":"87","OrderNo":123,"Remark":"sql语句需要key,value列，界面才能绑定数据源","Enable":"1","DbSql":"SELECT Role_Id as \"key\",RoleName as \"value\" FROM Sys_Role WHERE Enable=1\\r\\n","Dic_ID":32},"detailData":[],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (350, '2025-07-14 18:39:04.06952', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:39:04.072883', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (353, '2025-07-14 18:39:12.604967', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 6, '2025-07-14 18:39:12.610636', NULL, 'Exception', '42P01: 关系 "sys_department" 不存在

POSITION: 99   at Npgsql.Internal.NpgsqlConnector.ReadMessageLong(Boolean async, DataRowLoadingMode dataRowLoadingMode, Boolean readingNotifications, Boolean isReadingPrependedMessage)
   at System.Runtime.CompilerServices.PoolingAsyncValueTaskMethodBuilder`1.StateMachineBox`1.System.Threading.Tasks.Sources.IValueTaskSource<TResult>.GetResult(Int16 token)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult(Boolean async, Boolean isConsuming, CancellationToken cancellationToken)
   at Npgsql.NpgsqlDataReader.NextResult()
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(Boolean async, CommandBehavior behavior, CancellationToken cancellationToken)
   at Npgsql.NpgsqlCommand.ExecuteReader(CommandBehavior behavior)
   at Npgsql.NpgsqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1156
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1184
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 815
   at VOL.Core.Dapper.SqlDapper.<>c__DisplayClass17_0`1.<QueryList>b__0(IDbConnection conn, IDbTransaction dbTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 191
   at VOL.Core.Dapper.SqlDapper.Execute[T](Func`3 func, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 67
   at VOL.Core.Dapper.SqlDapper.QueryList[T](String cmd, Object param, Nullable`1 commandType, Boolean beginTransaction) in E:\jxx\vue.netcore\vol.api\VOL.Core\Dapper\SqlDapper.cs:line 189
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>g__GetSourceData|4_1(String dicNo, String dbSql, Object data) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 54
   at VOL.Sys.Services.Sys_DictionaryService.<GetVueDictionary>b__4_2(<>f__AnonymousType3`4 item) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at System.Linq.Enumerable.SelectListIterator`2.Fill(ReadOnlySpan`1 source, Span`1 destination, Func`2 func)
   at System.Linq.Enumerable.SelectListIterator`2.ToList()
   at VOL.Sys.Services.Sys_DictionaryService.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 56
   at VOL.Sys.Controllers.Sys_DictionaryController.GetVueDictionary(String[] dicNos) in E:\jxx\vue.netcore\vol.api\VOL.WebApi\Controllers\Sys\Partial\Sys_DictionaryController.cs:line 18
   at lambda_method865(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.SyncActionResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/GetVueDictionary', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (354, '2025-07-14 18:39:12.69075', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:39:12.694419', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (355, '2025-07-14 18:39:12.752788', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:39:12.753274', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (356, '2025-07-14 18:39:12.753292', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:39:12.753799', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (357, '2025-07-14 18:39:16.321402', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:39:16.32578', NULL, '查询', '{"page":1,"rows":30,"sort":"Role_Id","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Role/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (359, '2025-07-14 18:39:24.963952', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:39:24.973135', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":67,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (360, '2025-07-14 18:39:58.980359', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 10, '2025-07-14 18:39:58.990561', NULL, 'Edit', '{"mainData":{"DicNo":"部门级联","DicName":"部门级联","ParentId":"87","OrderNo":null,"Remark":null,"Enable":"1","DbSql":"SELECT \"DepartmentId\" AS \"id\",\"DepartmentId\" AS \"key\",\"ParentId\" AS \"parentId\",\"DepartmentName\" AS \"value\" FROM \"Sys_Department\"","Dic_ID":67},"detailData":[],"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (361, '2025-07-14 18:39:58.980359', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 10, '2025-07-14 18:39:58.990794', NULL, '编辑', '{"mainData":{"DicNo":"部门级联","DicName":"部门级联","ParentId":"87","OrderNo":null,"Remark":null,"Enable":"1","DbSql":"SELECT \"DepartmentId\" AS \"id\",\"DepartmentId\" AS \"key\",\"ParentId\" AS \"parentId\",\"DepartmentName\" AS \"value\" FROM \"Sys_Department\"","Dic_ID":67},"detailData":[],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (362, '2025-07-14 18:39:59.085198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:39:59.088694', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (363, '2025-07-14 18:40:02.154799', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:40:02.155225', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (364, '2025-07-14 18:40:02.283741', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:40:02.287193', NULL, '查询', '{"page":1,"rows":30,"sort":"Role_Id","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Role/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (368, '2025-07-14 18:40:05.465573', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:40:05.466241', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (369, '2025-07-14 18:40:07.648579', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 14, '2025-07-14 18:40:07.662907', NULL, '查询', '{"page":1,"rows":1000,"sort":"DepartmentName","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Department/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (370, '2025-07-14 18:40:10.298749', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 53, '2025-07-14 18:40:10.351431', NULL, 'Edit', '{"mainData":{"DepartmentName":"上海市场研究院","DepartmentCode":"H0001","ParentId":null,"DepartmentType":null,"Enable":null,"Remark":"还没想好","DepartmentId":"41b96ea8-5475-4775-845d-fd66370c75ae"},"detailData":null,"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Department/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (343, '2025-07-14 18:38:55.699449', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 25, '2025-07-14 18:38:55.724138', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":66,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (344, '2025-07-14 18:38:58.884365', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 491, '2025-07-14 18:38:59.375088', NULL, 'Edit', '{"mainData":{"DicNo":"tree_roles","DicName":"级联角色","ParentId":"87","OrderNo":null,"Remark":null,"Enable":"1","DbSql":"SELECT \"Role_Id\" AS \"id\",\"ParentId\" as  \"parentId\",\"Role_Id\" AS  \"key\",\"RoleName\" AS \"value\" FROM \"Sys_Role\"","Dic_ID":66},"detailData":[],"delKeys":null}', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (345, '2025-07-14 18:38:58.884365', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 492, '2025-07-14 18:38:59.376326', NULL, '编辑', '{"mainData":{"DicNo":"tree_roles","DicName":"级联角色","ParentId":"87","OrderNo":null,"Remark":null,"Enable":"1","DbSql":"SELECT \"Role_Id\" AS \"id\",\"ParentId\" as  \"parentId\",\"Role_Id\" AS  \"key\",\"RoleName\" AS \"value\" FROM \"Sys_Role\"","Dic_ID":66},"detailData":[],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (346, '2025-07-14 18:38:59.387627', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 18:38:59.391947', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (347, '2025-07-14 18:39:03.102261', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:39:03.111227', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":32,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (351, '2025-07-14 18:39:06.882696', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 1, '2025-07-14 18:39:06.883552', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (352, '2025-07-14 18:39:07.014631', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 7, '2025-07-14 18:39:07.021427', NULL, '查询', '{"page":1,"rows":30,"sort":"Role_Id","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Role/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (358, '2025-07-14 18:39:22.104542', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:39:22.107627', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (365, '2025-07-14 18:40:04.179831', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 18:40:04.1828', NULL, '查询', '{"page":1,"rows":30,"sort":"User_Id","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_User/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (366, '2025-07-14 18:40:04.243626', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:40:04.243954', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (367, '2025-07-14 18:40:04.243535', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:40:04.243954', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (371, '2025-07-14 18:40:10.298749', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 54, '2025-07-14 18:40:10.352426', NULL, '编辑', '{"mainData":{"DepartmentName":"上海市场研究院","DepartmentCode":"H0001","ParentId":null,"DepartmentType":null,"Enable":null,"Remark":"还没想好","DepartmentId":"41b96ea8-5475-4775-845d-fd66370c75ae"},"detailData":null,"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Department/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (372, '2025-07-14 18:40:10.367519', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 2, '2025-07-14 18:40:10.369993', NULL, '查询', '{"page":1,"rows":1000,"sort":"DepartmentName","order":"desc","wheres":"[]","value":1}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Department/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (373, '2025-07-14 18:40:25.067007', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 89, '2025-07-14 18:40:25.15586', NULL, 'Info', '表:.,菜单：1111,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (374, '2025-07-14 18:40:27.174022', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 18:40:27.183083', NULL, 'Info', '表:.,菜单：1111,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (375, '2025-07-14 18:40:30.443197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 0, '2025-07-14 18:40:30.443658', NULL, 'Info', NULL, NULL, 0, '0.0.0.1:9991', 3, 'http://localhost:9991/Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '::1', NULL, 0);
INSERT INTO "public"."Sys_Log" VALUES (376, '2025-07-14 18:40:38.833478', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 5, '2025-07-14 18:40:38.838828', NULL, 'Info', '表:.,菜单：2222,权限[{"text":"查询","value":"Search"}],成功保存成功', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/menu/save', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (377, '2025-07-14 19:06:09.780932', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 72, '2025-07-14 19:06:09.853052', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]"}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (378, '2025-07-14 19:06:11.59431', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 9, '2025-07-14 19:06:11.603553', NULL, '明细查询', '{"page":1,"rows":30,"sort":"OrderNo,CreateDate","order":"desc","wheres":"[]","value":100,"tableName":null,"isCopyClick":false}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getDetailPage', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (379, '2025-07-14 19:06:12.648968', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 13, '2025-07-14 19:06:12.66214', NULL, 'Exception', 'Exception has been thrown by the target of an invocation.   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.Controllers.Basic.ApiBaseController`1.InvokeService(String methodName, Object[] parameters) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 197
   at VOL.Core.Controllers.Basic.ApiBaseController`1.Update(SaveModel saveModel) in E:\jxx\vue.netcore\vol.api\VOL.Core\Controllers\Basic\ApiBaseController.cs:line 183
   at lambda_method1044(Closure, Object, Object[])
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Logged|12_1(ControllerActionInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeNextResourceFilter>g__Awaited|25_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Rethrow(ResourceExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.InvokeFilterPipelineAsync()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Logged|17_1(ResourceInvoker invoker)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at VOL.Core.Middleware.HttpRequestMiddleware.<>c__DisplayClass1_0.<<get_Context>b__1>d.MoveNext() in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\HttpRequestMiddleware.cs:line 19
--- End of stack trace from previous location ---
   at VOL.Core.Middleware.ExceptionHandlerMiddleWare.Invoke(HttpContext context) in E:\jxx\vue.netcore\vol.api\VOL.Core\Middleware\ExceptionHandlerMiddleWare.cs:line 34System.Reflection.TargetInvocationException: Exception has been thrown by the target of an invocation.
 ---> Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException: The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See https://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.
   at VOL.Core.EFDbContext.VOLContext.SaveChanges() in E:\jxx\vue.netcore\vol.api\VOL.Core\EFDbContext\VOLContext.cs:line 54
   at VOL.Core.BaseProvider.ServiceBase`2.UpdateToEntity[DetailT](SaveModel saveModel, PropertyInfo mainKeyProperty, PropertyInfo detailKeyInfo, Object keyDefaultVal) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 910
   at InvokeStub_ServiceBase`2.UpdateToEntity(Object, Span`1)
   at System.Reflection.MethodBaseInvoker.InvokeWithFewArgs(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   --- End of inner exception stack trace ---
   at System.Reflection.MethodBaseInvoker.InvokeWithFewArgs(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.MethodBase.Invoke(Object obj, Object[] parameters)
   at VOL.Core.BaseProvider.ServiceBase`2.Update(SaveModel saveModel) in E:\jxx\vue.netcore\vol.api\VOL.Core\BaseProvider\ServiceBase.cs:line 1163
   at VOL.Sys.Services.Sys_DictionaryService.Update(SaveModel saveDataModel) in E:\jxx\vue.netcore\vol.api\VOL.Sys\Services\System\Partial\Sys_DictionaryService.cs:line 199
   at InvokeStub_Sys_DictionaryService.Update(Object, Span`1)
   at System.Reflection.MethodBaseInvoker.InvokeWithOneArg(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)', NULL, 1, '0.0.0.1:9991', 2, 'http://localhost:9991/api/Sys_Dictionary/update', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (380, '2025-07-14 19:06:18.511148', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 27, '2025-07-14 19:06:18.538465', NULL, 'Del', '["100"]', 'Ok', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/del', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (381, '2025-07-14 19:06:18.579382', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 3, '2025-07-14 19:06:18.582357', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]","resetPage":true}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (382, '2025-07-14 19:06:19.489814', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 4, '2025-07-14 19:06:19.493587', NULL, '查询', '{"page":1,"rows":1000,"sort":"Dic_ID","order":"desc","wheres":"[]","resetPage":true}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/getPageData', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (383, '2025-07-14 19:06:26.69618', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 26, '2025-07-14 19:06:26.721726', NULL, 'Add', '{"mainData":{"DicNo":"111","DicName":"122","ParentId":0,"OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":null},"detailData":[],"delKeys":null}', '23502: 在字段 "Dic_ID" 中空值违反了非空约束

DETAIL: Detail redacted as it may contain sensitive data. Specify ''Include Error Detail'' in the connection string to include this information.', 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/add', '::1', '超级管理员', 1);
INSERT INTO "public"."Sys_Log" VALUES (384, '2025-07-14 19:06:26.69618', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 26, '2025-07-14 19:06:26.721852', NULL, '新建', '{"mainData":{"DicNo":"111","DicName":"122","ParentId":0,"OrderNo":null,"Remark":null,"Enable":"1","DbSql":null,"Dic_ID":null},"detailData":[],"delKeys":null}', NULL, 1, '0.0.0.1:9991', 3, 'http://localhost:9991/api/Sys_Dictionary/add', '::1', '超级管理员', 1);

-- ----------------------------
-- Table structure for Sys_Menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Menu";
CREATE TABLE "public"."Sys_Menu" (
  "Menu_Id" int4 NOT NULL DEFAULT nextval('sys_menu_id_seq'::regclass),
  "MenuName" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "Auth" text COLLATE "pg_catalog"."default",
  "Icon" varchar(50) COLLATE "pg_catalog"."default",
  "Description" varchar(200) COLLATE "pg_catalog"."default",
  "Enable" int2,
  "OrderNo" int4,
  "TableName" varchar(200) COLLATE "pg_catalog"."default",
  "ParentId" int4 NOT NULL,
  "Url" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "Creator" varchar(50) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "Modifier" varchar(50) COLLATE "pg_catalog"."default",
  "MenuType" int4
)
;

-- ----------------------------
-- Records of Sys_Menu
-- ----------------------------
INSERT INTO "public"."Sys_Menu" VALUES (281, '我的审批', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', '', NULL, 1, 800, '.', 247, '/Sys_WorkFlowTable', '2025-03-16 22:12:04', '超级管理员', '2025-07-14 18:27:15.439874', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (2, '用户管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-user', NULL, 1, 9000, '.', 61, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2025-03-24 01:26:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (5, '日志管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-date', NULL, 1, 1300, 'xxx', 61, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2025-03-23 23:23:28', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (200, '1111', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 0, '.', 0, '', '2025-07-14 18:40:25.077665', '超级管理员', '2025-07-14 18:40:27.17984', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (201, '2222', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 0, '.', 200, '', '2025-07-14 18:40:38.834629', '超级管理员', '2025-07-14 18:40:27', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (8, '图表开发', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-monitor', NULL, 1, 10000, '.', 32, '/ProductionState', NULL, NULL, '2025-03-24 02:52:54', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (276, '质检明细', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 700, 'MES_QualityInspectionPlanDetail', 240, '/MES_QualityInspectionPlanDetail', '2025-03-16 21:47:51', '超级管理员', '2025-03-16 21:52:24', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (277, '质检记录', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 500, 'MES_QualityInspectionRecord', 240, '/MES_QualityInspectionRecord', '2025-03-16 21:48:41', '超级管理员', '2025-03-14 10:54:23', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (279, '排班计划', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, 'MES_SchedulingPlan', 242, '/MES_SchedulingPlan', '2025-03-16 21:56:15', '超级管理员', '2025-03-16 22:00:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (280, '排班日历', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 600, '.', 242, 'MES_Calendar', '2025-03-16 22:10:57', '超级管理员', '2025-03-19 02:01:39', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (282, '流程配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 700, '.', 247, 'Sys_WorkFlow', '2025-03-16 22:12:47', '超级管理员', '2025-03-16 22:12:47', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (286, '制造BOM', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-setting', NULL, 1, 1400, '.', 235, '', '2025-03-18 17:24:00', '超级管理员', '2025-03-18 17:24:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (287, '制造BOM', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 200, 'MES_Bom_Main', 286, '/MES_Bom_Main', '2025-03-18 17:24:47', '超级管理员', '2025-03-18 18:24:02', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (289, '生产任务', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 500, '.', 239, '/list', '2025-03-19 13:46:28', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (290, 'Bom明细', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 2, 0, 'MES_Bom_Detail', 286, '/MES_Bom_Detail', '2025-03-19 14:21:12', '超级管理员', '2025-03-18 18:24:02', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (291, '菜单设置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-folder', NULL, 1, 8100, '.', 61, '', '2025-03-24 01:37:14', '超级管理员', '2025-03-24 01:38:19', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (292, '数据字典', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-receiving', NULL, 1, 7100, '.', 61, '', '2025-03-24 01:38:39', '超级管理员', '2025-03-24 01:38:47', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (293, '消息推送', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-chat-dot-round', NULL, 1, 1800, '.', 61, '', '2025-03-24 01:40:39', '超级管理员', '2025-03-24 01:41:40', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (294, '统计报表', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-data-line', NULL, 1, 700, '.', 235, '', '2025-03-24 02:20:27', '超级管理员', '2025-03-16 21:53:03', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (295, '生产统计', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, '.', 294, '/ProductionState', '2025-03-24 02:20:59', '超级管理员', '2025-03-24 02:28:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (235, 'MES业务', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-monitor', NULL, 1, 9000, '.', 0, '', '2025-03-13 19:35:58', '超级管理员', '2025-03-18 19:09:44', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (91, '图表+表格', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-odometer', NULL, 1, 800, '数字排版', 32, '/flex', '2020-04-07 21:51:38', '超级管理员', '2025-03-24 02:46:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (106, '表单设计', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-postcard', NULL, 1, 3000, '.', 61, '', '2021-08-28 00:39:04', '超级管理员', '2025-03-23 23:24:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (107, '表单设计', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 100, '.', 106, '/formDraggable', '2021-08-28 00:40:00', '超级管理员', '2022-01-03 19:01:45', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (109, '表单配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'FormDesignOptions', 106, '/FormDesignOptions', '2021-12-29 23:27:28', '超级管理员', '2022-01-03 19:03:58', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (110, '数据采集', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, '.', 106, '/formCollectionResultTree', '2021-12-29 23:28:44', '超级管理员', '2021-12-30 23:11:51', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (113, '基础页面', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 9000, '.', 0, '', '2022-03-26 00:58:41', '超级管理员', '2022-04-04 13:39:54', '超级管理员', 1);
INSERT INTO "public"."Sys_Menu" VALUES (115, '水平显示', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, '.', 113, '/pages/order/App_Appointment1/App_Appointment1', '2022-03-26 01:00:38', '超级管理员', '2025-03-23 23:22:51', '超级管理员', 1);
INSERT INTO "public"."Sys_Menu" VALUES (125, '表单只读', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, '.', 113, 'pages/form/form1', '2022-03-26 03:12:52', '超级管理员', '2022-03-27 15:38:00', '超级管理员', 1);
INSERT INTO "public"."Sys_Menu" VALUES (132, '消息推送', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-chat-line-round', NULL, 1, 1700, '.', 293, '/signalR', '2022-05-03 03:31:02', '超级管理员', '2025-03-24 01:41:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (133, '审批管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-mobile', NULL, 1, 6800, '流程管理', 61, '', '2022-07-25 00:39:22', '超级管理员', '2025-03-24 01:39:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (136, '发起流程', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, '发起流程', 133, '/flowdemo', '2022-08-16 00:21:39', '超级管理员', '2022-08-16 00:21:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (299, '文本编辑', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-mobile-phone', NULL, 1, 780, '.', 32, '', '2025-03-24 02:47:09', '超级管理员', '2025-03-24 02:50:24', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (137, '定时任务', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-alarm-clock', NULL, 1, 1725, '定时任务', 61, '', '2022-09-05 03:19:10', '超级管理员', '2025-03-23 23:24:34', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (298, '一对多配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-coin', NULL, 1, 710, '.', 32, '', '2025-03-24 02:45:51', '超级管理员', '2025-03-24 02:52:20', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (134, '流程管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'Sys_WorkFlow', 133, '/Sys_WorkFlow', '2022-07-25 00:39:56', '超级管理员', '2025-07-14 18:15:26.470168', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (9, '用户管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 2000, 'Sys_User', 2, '/Sys_User', NULL, NULL, '2025-07-14 18:15:06.767861', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (71, '权限管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, ',', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', '2025-07-14 18:15:09.041026', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (3, '角色管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2025-07-14 18:15:10.975001', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (104, '角色管理(tree)', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 0, 'Sys_Role1', 2, '/Sys_Role1', '2021-05-02 13:41:35', '超级管理员', '2025-07-14 18:15:12.990014', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (62, '菜单设置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 8000, 'Sys_Menu', 291, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2025-07-14 18:15:18.038518', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (135, '我的审批', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'Sys_WorkFlowTable', 133, '/Sys_WorkFlowTable', '2022-08-01 00:35:05', '超级管理员', '2025-07-14 18:15:28.557119', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (138, '任务配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'Sys_QuartzOptions', 137, '/Sys_QuartzOptions', '2022-09-05 03:19:45', '超级管理员', '2025-07-14 18:15:34.134415', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (139, '执行记录', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'Sys_QuartzLog', 137, '/Sys_QuartzLog', '2022-09-05 03:20:06', '超级管理员', '2025-07-14 18:15:35.444189', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (6, '系统日志', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2025-07-14 18:15:44.008514', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (65, '代码生成', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2025-07-14 18:15:47.23005', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (236, '基础设置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-receiving', NULL, 1, 2000, '.', 235, '', '2025-03-13 19:36:33', '超级管理员', '2025-03-14 10:55:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (237, '仓库管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-house', NULL, 1, 1800, '.', 235, '', '2025-03-13 19:39:28', '超级管理员', '2025-03-13 19:39:39', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (238, '设备管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-news', NULL, 1, 1600, '.', 235, '', '2025-03-13 19:40:30', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (239, '生产计划', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-shopping-cart-1', NULL, 1, 1400, '.', 235, '', '2025-03-13 19:40:53', '超级管理员', '2025-03-13 22:06:59', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (240, '质检中心', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-edit-outline', NULL, 1, 1200, '.', 235, '', '2025-03-13 19:41:41', '超级管理员', '2025-03-14 10:54:23', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (241, '工序管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-mobile-phone', NULL, 1, 1500, '.', 235, '', '2025-03-13 19:42:11', '超级管理员', '2025-03-13 19:44:09', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (242, '生产排班', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-stopwatch', NULL, 1, 1000, '.', 235, '', '2025-03-13 19:42:44', '超级管理员', '2025-03-16 21:53:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (244, '生产报工', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-tickets', NULL, 1, 1300, '.', 235, '', '2025-03-14 00:44:21', '超级管理员', '2025-03-14 00:44:36', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (251, '产线管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 600, 'MES_ProductionLine', 236, '/MES_ProductionLine', '2025-03-14 17:21:53', '超级管理员', '2025-03-17 01:50:19', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (247, '审批流程', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-date', NULL, 1, 2900, '.', 235, '', '2025-03-14 17:11:15', '超级管理员', '2025-03-18 17:26:06', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (252, '产线设备', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 500, 'MES_ProductionLineDevice', 236, '/MES_ProductionLineDevice', '2025-03-14 17:23:26', '超级管理员', '2025-03-14 17:20:07', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (32, '基础组件', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-full-screen', NULL, 1, 1720, '/', 0, '', NULL, NULL, '2025-03-24 01:25:40', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (253, '物料管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 510, 'MES_Material', 236, '/MES_Material', '2025-03-14 17:24:13', '超级管理员', '2025-03-17 11:18:57', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (254, '物料分类', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 550, 'MES_MaterialCatalog', 236, '/MES_MaterialCatalog', '2025-03-14 17:25:23', '超级管理员', '2025-03-17 11:18:26', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (255, '仓库管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'MES_WarehouseManagement', 237, '/MES_WarehouseManagement', '2025-03-14 17:31:20', '超级管理员', '2025-03-13 19:39:39', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (256, '货位管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, 'MES_LocationManagement', 237, '/MES_LocationManagement', '2025-03-14 17:31:54', '超级管理员', '2025-03-13 19:39:39', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (257, '库存管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 700, 'MES_InventoryManagement', 237, '/MES_InventoryManagement', '2025-03-14 17:32:40', '超级管理员', '2025-03-17 02:10:34', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (258, '产品入库', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 600, 'MES_ProductInbound', 237, '/MES_ProductInbound', '2025-03-14 17:33:07', '超级管理员', '2025-03-17 01:00:49', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (36, '图表+表单', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-data-analysis', NULL, 1, 900, '/', 32, 'formChart', NULL, NULL, '2025-03-24 02:46:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (45, '不用节点', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2020-05-05 13:20:14', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (61, '系统设置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-setting', NULL, 1, 1000, '系统设置', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2023-05-13 11:09:04', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (64, '代码生成', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-paperclip', NULL, 1, 1500, '代码生成', 61, '/coding', '2019-07-12 14:07:55', '超级管理员', '2025-03-24 01:39:58', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (275, '质量检验', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'MES_QualityInspectionPlan', 240, '/MES_QualityInspectionPlan', '2025-03-16 21:47:04', '超级管理员', '2025-03-19 01:43:31', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (271, '生产报工', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'MES_ProductionReporting', 244, '/MES_ProductionReporting', '2025-03-16 21:41:46', '超级管理员', '2025-03-18 17:13:22', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (259, '产品出库', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 500, 'MES_ProductOutbound', 237, '/MES_ProductOutbound', '2025-03-14 17:33:31', '超级管理员', '2025-03-17 00:54:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (260, '设备管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'MES_EquipmentManagement', 238, '/MES_EquipmentManagement', '2025-03-14 17:35:22', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (261, '设备维修', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, 'MES_EquipmentRepair', 238, '/MES_EquipmentRepair', '2025-03-14 17:35:49', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (262, '设备保养', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'MES_EquipmentMaintenance', 238, '/MES_EquipmentMaintenance', '2025-03-14 17:36:36', '超级管理员', '2025-03-17 02:06:18', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (263, '设备故障', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 500, 'MES_EquipmentFaultRecord', 238, '/MES_EquipmentFaultRecord', '2025-03-14 17:37:22', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (249, ' 客户管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, 'MES_Customer', 236, '/MES_Customer', '2025-03-14 17:19:51', '超级管理员', '2025-07-14 18:17:32.581082', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (264, '工序管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, 'MES_Process', 241, '/MES_Process', '2025-03-16 21:26:13', '超级管理员', '2025-03-17 02:10:42', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (265, '工线路线', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 700, 'MES_ProcessRoute', 241, '/MES_ProcessRoute', '2025-03-16 21:27:19', '超级管理员', '2025-03-16 21:27:35', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (266, '工序统计', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 600, 'MES_ProcessReport', 241, '/MES_ProcessReport', '2025-03-16 21:29:22', '超级管理员', '2025-03-17 02:37:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (267, '生产订单', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'MES_ProductionOrder', 239, '/MES_ProductionOrder', '2025-03-16 21:36:43', '超级管理员', '2025-03-18 17:13:19', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (268, '订单明细表', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 800, 'MES_ProductionPlanDetail', 239, '/MES_ProductionPlanDetail', '2025-03-16 21:38:21', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (270, '变更记录', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 600, 'MES_ProductionPlanChangeRecord', 239, '/MES_ProductionPlanChangeRecord', '2025-03-16 21:40:30', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (272, '报工明细', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 2, 800, 'MES_ProductionReportingDetail', 244, '/MES_ProductionReportingDetail', '2025-03-16 21:42:15', '超级管理员', '2025-03-16 21:42:17', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (273, '生产不良记录', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 600, 'MES_DefectiveProductRecord', 244, '/MES_DefectiveProductRecord', '2025-03-16 21:42:49', '超级管理员', '2025-03-18 18:06:14', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (296, '图表统计', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-data-line', NULL, 1, 2000, '.', 32, '', '2025-03-24 02:40:46', '超级管理员', '2025-03-24 02:42:09', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (297, '多页签配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-receiving', NULL, 1, 700, '.', 32, '', '2025-03-24 02:44:22', '超级管理员', '2025-03-24 02:45:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (300, '主从结构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-office-building', NULL, 1, 760, '.', 32, '/MES_Process', '2025-03-24 02:48:59', '超级管理员', '2025-03-24 02:49:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (301, '树形结构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-guide', NULL, 1, 740, '.', 32, '/MES_Material', '2025-03-24 02:49:56', '超级管理员', '2025-03-24 02:50:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (302, '移动端开发', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', 'el-icon-mobile-phone', NULL, 1, 600, '.', 32, 'http://app.volcore.xyz/', '2025-03-24 02:51:31', '超级管理员', '2025-03-24 02:51:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (142, '组织架构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 2500, 'Sys_Department', 2, '/Sys_Department', '2023-05-08 02:12:15', '超级管理员', '2025-07-14 18:15:03.046446', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (63, '数据字典', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 7000, 'Sys_Dictionary', 292, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2025-07-14 18:15:22.093705', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (250, '供应商', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 700, 'MES_Supplier', 236, '/MES_Supplier', '2025-03-14 17:21:07', '超级管理员', '2025-07-14 18:18:25.770552', '超级管理员', 0);

-- ----------------------------
-- Table structure for Sys_Province
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Province";
CREATE TABLE "public"."Sys_Province" (
  "ProvinceId" int4 NOT NULL DEFAULT nextval('sys_province_id_seq'::regclass),
  "ProvinceCode" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "ProvinceName" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "RegionCode" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_Province
-- ----------------------------
INSERT INTO "public"."Sys_Province" VALUES (1, '110000', '北京市', '华北');
INSERT INTO "public"."Sys_Province" VALUES (2, '120000', '天津市', '华北');
INSERT INTO "public"."Sys_Province" VALUES (3, '130000', '河北省', '华北');
INSERT INTO "public"."Sys_Province" VALUES (4, '140000', '山西省', '华北');
INSERT INTO "public"."Sys_Province" VALUES (5, '150000', '内蒙古自治区', '华北');
INSERT INTO "public"."Sys_Province" VALUES (6, '210000', '辽宁省', '东北');
INSERT INTO "public"."Sys_Province" VALUES (7, '220000', '吉林省', '东北');
INSERT INTO "public"."Sys_Province" VALUES (8, '230000', '黑龙江省', '东北');
INSERT INTO "public"."Sys_Province" VALUES (9, '310000', '上海市', '华东');
INSERT INTO "public"."Sys_Province" VALUES (10, '320000', '江苏省', '华东');
INSERT INTO "public"."Sys_Province" VALUES (11, '330000', '浙江省', '华东');
INSERT INTO "public"."Sys_Province" VALUES (12, '340000', '安徽省', '华东');
INSERT INTO "public"."Sys_Province" VALUES (13, '350000', '福建省', '华东');
INSERT INTO "public"."Sys_Province" VALUES (14, '360000', '江西省', '华东');
INSERT INTO "public"."Sys_Province" VALUES (15, '370000', '山东省', '华东');
INSERT INTO "public"."Sys_Province" VALUES (16, '410000', '河南省', '华中');
INSERT INTO "public"."Sys_Province" VALUES (17, '420000', '湖北省', '华中');
INSERT INTO "public"."Sys_Province" VALUES (18, '430000', '湖南省', '华中');
INSERT INTO "public"."Sys_Province" VALUES (19, '440000', '广东省', '华南');
INSERT INTO "public"."Sys_Province" VALUES (20, '450000', '广西壮族自治区', '华南');
INSERT INTO "public"."Sys_Province" VALUES (21, '460000', '海南省', '华南');
INSERT INTO "public"."Sys_Province" VALUES (22, '500000', '重庆市', '西南');
INSERT INTO "public"."Sys_Province" VALUES (23, '510000', '四川省', '西南');
INSERT INTO "public"."Sys_Province" VALUES (24, '520000', '贵州省', '西南');
INSERT INTO "public"."Sys_Province" VALUES (25, '530000', '云南省', '西南');
INSERT INTO "public"."Sys_Province" VALUES (26, '540000', '西藏自治区', '西南');
INSERT INTO "public"."Sys_Province" VALUES (27, '610000', '陕西省', '西北');
INSERT INTO "public"."Sys_Province" VALUES (28, '620000', '甘肃省', '西北');
INSERT INTO "public"."Sys_Province" VALUES (29, '630000', '青海省', '西北');
INSERT INTO "public"."Sys_Province" VALUES (30, '640000', '宁夏回族自治区', '西北');
INSERT INTO "public"."Sys_Province" VALUES (31, '650000', '新疆维吾尔自治区', '西北');
INSERT INTO "public"."Sys_Province" VALUES (32, '710000', '台湾省', '港澳台');
INSERT INTO "public"."Sys_Province" VALUES (33, '810000', '香港特别行政区', '港澳台');
INSERT INTO "public"."Sys_Province" VALUES (34, '820000', '澳门特别行政区', '港澳台');
INSERT INTO "public"."Sys_Province" VALUES (35, 'thd', '桃花岛', '东北');
INSERT INTO "public"."Sys_Province" VALUES (43, '测试1', '测试1', '港澳台');

-- ----------------------------
-- Table structure for Sys_QuartzLog
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_QuartzLog";
CREATE TABLE "public"."Sys_QuartzLog" (
  "LogId" uuid NOT NULL,
  "Id" uuid,
  "TaskName" text COLLATE "pg_catalog"."default",
  "ElapsedTime" int4,
  "StratDate" timestamp(6),
  "EndDate" timestamp(6),
  "Result" int4,
  "ResponseContent" text COLLATE "pg_catalog"."default",
  "ErrorMsg" text COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."Sys_QuartzLog"."TaskName" IS '任务名称';
COMMENT ON COLUMN "public"."Sys_QuartzLog"."ElapsedTime" IS '耗时(秒)';
COMMENT ON COLUMN "public"."Sys_QuartzLog"."StratDate" IS '开始时间';
COMMENT ON COLUMN "public"."Sys_QuartzLog"."EndDate" IS '结束时间';
COMMENT ON COLUMN "public"."Sys_QuartzLog"."Result" IS '执行结果';
COMMENT ON COLUMN "public"."Sys_QuartzLog"."ResponseContent" IS '返回内容';

-- ----------------------------
-- Records of Sys_QuartzLog
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_QuartzOptions
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_QuartzOptions";
CREATE TABLE "public"."Sys_QuartzOptions" (
  "Id" uuid NOT NULL,
  "TaskName" text COLLATE "pg_catalog"."default" NOT NULL,
  "GroupName" text COLLATE "pg_catalog"."default" NOT NULL,
  "CronExpression" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "Method" varchar(50) COLLATE "pg_catalog"."default",
  "ApiUrl" text COLLATE "pg_catalog"."default",
  "AuthKey" varchar(200) COLLATE "pg_catalog"."default",
  "AuthValue" varchar(200) COLLATE "pg_catalog"."default",
  "Describe" text COLLATE "pg_catalog"."default",
  "LastRunTime" timestamp(6),
  "Status" int4,
  "PostData" text COLLATE "pg_catalog"."default",
  "TimeOut" int4,
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."TaskName" IS '任务名称';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."GroupName" IS '任务分组';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."CronExpression" IS 'Corn表达式';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."Method" IS '请求方式';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."ApiUrl" IS 'Url地址';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."Describe" IS '描述';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."LastRunTime" IS '最后执行执行';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."Status" IS '运行状态';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."PostData" IS 'post参数';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."TimeOut" IS '超时时间(秒)';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."Sys_QuartzOptions"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of Sys_QuartzOptions
-- ----------------------------
INSERT INTO "public"."Sys_QuartzOptions" VALUES ('7d223549-c8ee-461d-80a9-e4601eeb5c0a', '1秒执行一次', '测试', '* * * * * ?	', 'get', 'http://localhost:9991/api/Sys_QuartzOptions/test', NULL, NULL, NULL, '2023-05-13 11:35:22', 1, NULL, 180, 1, '超级管理员', '2022-09-07 01:45:04', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Role";
CREATE TABLE "public"."Sys_Role" (
  "Role_Id" int4 NOT NULL DEFAULT nextval('sys_role_id_seq'::regclass),
  "CreateDate" timestamp(6),
  "Creator" varchar(50) COLLATE "pg_catalog"."default",
  "DeleteBy" varchar(50) COLLATE "pg_catalog"."default",
  "DeptName" varchar(50) COLLATE "pg_catalog"."default",
  "Dept_Id" int4,
  "Enable" int2,
  "Modifier" varchar(50) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "OrderNo" int4,
  "ParentId" int4 NOT NULL,
  "RoleName" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO "public"."Sys_Role" VALUES (1, '2018-08-23 11:46:06', '超级管理员', NULL, '无', 0, 1, '测试超级管理员', '2018-09-06 17:08:35', 1000, 0, '超级管理员');
INSERT INTO "public"."Sys_Role" VALUES (2, '2018-08-23 11:46:52', '超级管理员', NULL, '1', 0, 1, '超级管理员', '2022-04-17 20:11:05', NULL, 1, '测试管理员');
INSERT INTO "public"."Sys_Role" VALUES (4, '2018-08-23 11:47:41', '超级管理员', NULL, '无  ', 0, 1, '超级管理员', '2019-12-08 21:11:11', NULL, 2, '信息员');

-- ----------------------------
-- Table structure for Sys_RoleAuth
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_RoleAuth";
CREATE TABLE "public"."Sys_RoleAuth" (
  "Auth_Id" int4 NOT NULL DEFAULT nextval('sys_roleauth_id_seq'::regclass),
  "AuthValue" text COLLATE "pg_catalog"."default" NOT NULL,
  "CreateDate" timestamp(6),
  "Creator" text COLLATE "pg_catalog"."default",
  "Menu_Id" int4 NOT NULL,
  "Modifier" text COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "Role_Id" int4,
  "User_Id" int4
)
;

-- ----------------------------
-- Records of Sys_RoleAuth
-- ----------------------------
INSERT INTO "public"."Sys_RoleAuth" VALUES (1, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 9, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (2, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 13:23:11', '超级管理员', 53, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (3, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 50, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (4, 'Search', '2020-05-05 13:23:11', '超级管理员', 40, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (5, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 3, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (6, 'Search', '2020-05-05 13:23:11', '超级管理员', 37, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (7, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 51, '超级管理员', '2022-08-22 01:13:38', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (8, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 59, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (9, 'Search,Add,Delete,Update', '2020-05-05 13:23:11', '超级管理员', 13, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (10, '', '2020-05-05 13:23:11', '超级管理员', 44, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (11, '', '2020-05-05 13:23:11', '超级管理员', 24, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (12, '', '2020-05-05 13:23:11', '超级管理员', 35, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (13, 'Search', '2020-05-05 13:23:11', '超级管理员', 60, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (14, 'Search', '2020-05-05 13:23:11', '超级管理员', 58, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (15, 'Search,Add,Delete,Update,Export,Audit', '2020-05-05 13:23:11', '超级管理员', 68, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (16, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 13:23:11', '超级管理员', 52, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (17, 'Search,Add,Delete,Update', '2020-05-05 13:23:11', '超级管理员', 65, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (18, 'Search', '2020-05-05 13:23:11', '超级管理员', 62, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (19, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 63, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (20, '', '2020-05-05 13:23:11', '超级管理员', 54, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (21, 'Search', '2020-05-05 13:23:11', '超级管理员', 94, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (22, 'Search', '2020-05-05 13:23:11', '超级管理员', 42, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (23, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 34, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (24, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 90, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (25, 'Search,Add,Delete,Update,Export', '2020-05-05 13:23:11', '超级管理员', 67, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (26, 'Search', '2020-05-05 13:23:11', '超级管理员', 91, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (27, 'Search', '2020-05-05 13:23:11', '超级管理员', 36, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (28, 'Search', '2020-05-05 13:23:11', '超级管理员', 77, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (29, 'Search,Delete,Export', '2020-05-05 13:23:11', '超级管理员', 6, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (30, 'Search', '2020-05-05 13:23:11', '超级管理员', 88, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (31, 'Search', '2020-05-05 13:23:11', '超级管理员', 61, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (32, 'Search', '2020-05-05 13:23:11', '超级管理员', 8, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (33, 'Search', '2020-05-05 13:23:11', '超级管理员', 48, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (34, 'Search', '2020-05-05 13:23:11', '超级管理员', 74, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (35, 'Search', '2020-05-05 13:23:11', '超级管理员', 56, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (36, 'Search', '2020-05-05 13:23:11', '超级管理员', 55, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (37, 'Search', '2020-05-05 13:23:11', '超级管理员', 32, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (38, 'Search', '2020-05-05 13:23:11', '超级管理员', 33, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (39, 'Search', '2020-05-05 13:23:11', '超级管理员', 92, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (40, 'Search', '2020-05-05 13:23:11', '超级管理员', 89, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (41, 'Search', '2020-05-05 13:23:11', '超级管理员', 86, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (42, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 84, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (43, 'Search', '2020-05-05 13:23:11', '超级管理员', 29, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (44, 'Search,Add,Delete,Update,Import,Export', '2020-05-05 13:23:11', '超级管理员', 31, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (45, 'Search', '2020-05-05 13:23:11', '超级管理员', 72, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (46, 'Search', '2020-05-05 13:23:11', '超级管理员', 66, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (47, 'Search', '2020-05-05 13:23:11', '超级管理员', 28, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (48, 'Search', '2020-05-05 13:23:11', '超级管理员', 64, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (49, 'Search', '2020-05-05 13:23:11', '超级管理员', 5, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (50, 'Search', '2020-05-05 13:23:11', '超级管理员', 25, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (51, 'Search,Add,Delete,Update', '2020-05-05 13:23:11', '超级管理员', 93, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (52, 'Search', '2020-05-05 13:23:11', '超级管理员', 85, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (53, 'Search,Add,Delete,Update,Import,Export,Upload,Audit', '2020-05-05 13:23:11', '超级管理员', 75, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (54, 'Search', '2020-05-05 13:23:11', '超级管理员', 87, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (55, 'Search', '2020-05-05 13:23:11', '超级管理员', 57, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (56, 'Search,Import,Export,test', '2020-05-05 13:23:11', '超级管理员', 49, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (57, 'Search,Update', '2020-05-05 13:23:11', '超级管理员', 71, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (58, 'Search', '2020-05-05 13:23:11', '超级管理员', 2, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (59, 'Search', '2020-05-05 13:23:11', '超级管理员', 73, '超级管理员', '2020-05-05 13:23:11', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (60, 'Search', '2022-08-16 00:56:48', '超级管理员', 133, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (61, 'Search,Add,Delete,Update,Export', '2022-08-16 00:56:48', '超级管理员', 134, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (62, 'Search,Delete', '2022-08-16 00:56:48', '超级管理员', 135, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (63, 'Search', '2022-08-16 00:56:48', '超级管理员', 136, '超级管理员', '2022-08-16 00:56:48', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (64, 'Search', '2022-08-22 01:13:38', '超级管理员', 113, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (65, 'Search', '2022-08-22 01:13:38', '超级管理员', 115, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (66, 'Search', '2022-09-09 17:53:16', '超级管理员', 118, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (67, 'Search,Add,Delete,Update,Import,Export', '2022-09-09 17:53:16', '超级管理员', 119, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (68, 'Search', '2022-09-09 17:53:21', '超级管理员', 116, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (69, 'Search', '2022-09-09 17:53:38', '超级管理员', 129, '超级管理员', '2022-09-09 17:53:38', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (70, 'Search', '2022-09-09 17:53:45', '超级管理员', 106, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (71, 'Search', '2022-09-09 17:53:45', '超级管理员', 107, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (72, 'Search', '2022-09-09 17:53:45', '超级管理员', 127, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (73, 'Search,Add,Delete,Update', '2022-09-09 17:53:45', '超级管理员', 109, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (74, 'Search,Delete,Export', '2022-09-09 17:53:45', '超级管理员', 110, '超级管理员', '2022-09-09 17:53:45', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (75, 'Search', '2022-09-09 17:54:03', '超级管理员', 137, '超级管理员', '2022-09-09 17:54:03', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (76, 'Search,Add,Delete,Update', '2022-09-09 17:54:03', '超级管理员', 138, '超级管理员', '2022-09-09 17:54:03', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (77, 'Search,Delete,Export', '2022-09-09 17:54:03', '超级管理员', 139, '超级管理员', '2022-09-09 17:54:03', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (78, 'Search', '2022-09-09 17:55:31', 'zs', 129, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (79, 'Search', '2022-09-09 17:55:31', 'zs', 106, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (80, 'Search', '2022-09-09 17:55:31', 'zs', 107, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (81, 'Search,Add,Delete,Update', '2022-09-09 17:55:31', 'zs', 109, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (82, 'Search,Delete,Export', '2022-09-09 17:55:31', 'zs', 110, 'zs', '2022-09-09 17:55:31', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (83, 'Search', '2023-02-03 16:51:48', '超级管理员', 113, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (84, 'Search', '2023-02-03 16:51:48', '超级管理员', 116, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (85, 'Search', '2023-02-03 16:51:48', '超级管理员', 118, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (86, 'Search,Add,Delete,Update', '2023-02-03 16:51:48', '超级管理员', 119, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (87, 'Search', '2023-02-03 16:51:48', '超级管理员', 115, '超级管理员', '2023-02-03 16:51:48', 4, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (88, 'Search', '2023-05-13 13:53:24', '超级管理员', 101, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (89, 'Search,Add,Delete,Update,Import,Export', '2023-05-13 13:53:24', '超级管理员', 100, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (90, 'Search,Add,Delete,Update,Import,Export,Upload', '2023-05-13 13:53:24', '超级管理员', 96, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (91, 'Search', '2023-05-13 13:53:24', '超级管理员', 105, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (92, 'Search,Add,Delete,Update,Import,Export', '2023-05-13 13:53:24', '超级管理员', 99, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (93, 'Search,Add,Delete,Update,Import,Export', '2023-05-13 13:53:24', '超级管理员', 98, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (94, 'Search', '2023-05-13 13:53:24', '超级管理员', 132, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (95, 'Search,Add,Delete,Update,Export', '2023-05-13 13:53:24', '超级管理员', 142, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (96, 'Search,Add,Delete,Update', '2023-05-13 13:53:24', '超级管理员', 97, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (97, 'Search', '2023-05-13 13:53:24', '超级管理员', 123, '超级管理员', '2023-05-13 13:53:24', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (98, 'Search', '2023-05-13 13:54:49', '超级管理员', 121, '超级管理员', '2023-05-13 13:54:49', 2, NULL);
INSERT INTO "public"."Sys_RoleAuth" VALUES (99, 'Search', '2023-05-13 13:54:49', '超级管理员', 126, '超级管理员', '2023-05-13 13:54:49', 2, NULL);

-- ----------------------------
-- Table structure for Sys_TableColumn
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_TableColumn";
CREATE TABLE "public"."Sys_TableColumn" (
  "ColumnId" int4 NOT NULL DEFAULT nextval('sys_tablecolumn_id_seq'::regclass),
  "ApiInPut" int4,
  "ApiIsNull" int4,
  "ApiOutPut" int4,
  "ColSize" int4,
  "ColumnCNName" varchar(100) COLLATE "pg_catalog"."default",
  "ColumnName" varchar(100) COLLATE "pg_catalog"."default",
  "ColumnType" text COLLATE "pg_catalog"."default",
  "ColumnWidth" int4,
  "Columnformat" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(200) COLLATE "pg_catalog"."default",
  "DropNo" varchar(50) COLLATE "pg_catalog"."default",
  "EditColNo" int4,
  "EditRowNo" int4,
  "EditType" varchar(200) COLLATE "pg_catalog"."default",
  "Enable" int4,
  "IsColumnData" int4,
  "IsDisplay" int4,
  "IsImage" int4,
  "IsKey" int4,
  "IsNull" int4,
  "IsReadDataset" int4,
  "Maxlength" int4,
  "Modifier" text COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "OrderNo" int4,
  "Script" text COLLATE "pg_catalog"."default",
  "SearchColNo" int4,
  "SearchRowNo" int4,
  "SearchType" varchar(200) COLLATE "pg_catalog"."default",
  "Sortable" int4,
  "TableName" varchar(200) COLLATE "pg_catalog"."default",
  "Table_Id" int4
)
;

-- ----------------------------
-- Records of Sys_TableColumn
-- ----------------------------
INSERT INTO "public"."Sys_TableColumn" VALUES (20, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1420, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (21, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 70, '', '2018-06-04 10:14:21', NULL, NULL, 'tree_roles', NULL, 1, 'cascader', 7, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1410, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (22, NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 2, '', 1, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1450, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (23, NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1390, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (24, NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1380, '', NULL, 1, 'text', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (25, NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-22 16:08:49', 1, 1370, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (26, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', 3, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1360, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (27, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, 'datetime', 3, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-22 16:08:49', 1, 1350, '', NULL, 1, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (28, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1340, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (29, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-22 16:08:49', 1, 1330, '', NULL, 1, 'datetime', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (30, NULL, NULL, NULL, NULL, '', 'DeleteBy', 'string', 90, '', '2018-06-04 10:14:21', NULL, NULL, '', NULL, NULL, '', NULL, 0, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-22 16:08:49', 1, 1320, '', NULL, NULL, '', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (31, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, '', '2018-06-04 10:14:21', NULL, NULL, 'enable', NULL, 0, 'switch', 1, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2025-03-22 16:08:49', 1, 1375, '', NULL, 1, 'select', 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (32, NULL, NULL, NULL, NULL, '字典ID', 'Dic_ID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (33, NULL, NULL, NULL, NULL, '字典名称', 'DicName', 'string', 140, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-24 01:35:48', 1, 1290, NULL, NULL, 1, 'textarea', 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (34, NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1280, NULL, NULL, 1, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (35, NULL, NULL, NULL, NULL, '配置项', 'Config', 'string', 300, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2025-03-24 01:35:48', 1, 1270, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (36, NULL, NULL, NULL, 12, 'sql语句', 'DbSql', 'string', 200, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 6, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 4000, '超级管理员', '2025-03-24 01:35:48', 1, 1260, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (37, NULL, NULL, NULL, NULL, '所在数据库', 'DBServer', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'dbServer', NULL, 0, 'select', NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2025-03-24 01:35:48', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (38, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1240, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (39, NULL, NULL, NULL, NULL, '字典编号', 'DicNo', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-24 01:35:48', 1, 1295, NULL, NULL, 1, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (40, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, 2, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2025-03-24 01:35:48', 1, 1220, NULL, NULL, NULL, '无', 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (41, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, 'enable', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2025-03-24 01:35:48', 1, 1210, NULL, NULL, 2, 'select', 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (42, NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (43, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, '超级管理员', '2025-03-24 01:35:48', 1, 1190, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (44, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 01:35:48', 1, 1180, NULL, NULL, 2, 'datetime', 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (45, NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', 90, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:35:48', 1, 1170, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (46, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, '超级管理员', '2025-03-24 01:35:48', 1, 1160, NULL, NULL, NULL, NULL, 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (47, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, '2018-06-06 14:05:43', NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 01:35:48', 1, 1150, NULL, NULL, 2, 'datetime', 0, 'Sys_Dictionary', 3);
INSERT INTO "public"."Sys_TableColumn" VALUES (48, NULL, NULL, NULL, NULL, '', 'DicList_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9950, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (49, NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 1, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9900, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (50, NULL, NULL, NULL, NULL, '数据源key', 'DicValue', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 01:32:07', 1, 9850, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (51, NULL, NULL, NULL, NULL, '数据源文本', 'DicName', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 01:32:07', 1, 9800, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (52, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9750, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (53, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, 1, 'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2025-03-24 01:32:07', 1, 9700, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (54, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', 90, '', '2018-06-06 14:12:18', NULL, NULL, 'enable', NULL, 1, 'switch', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9650, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (55, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '无', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9600, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (56, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 30, '超级管理员', '2025-03-24 01:32:07', 1, 9550, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (57, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 01:32:07', 1, 9500, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (58, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 01:32:07', 1, 9450, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (59, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2025-03-24 01:32:07', 1, 9400, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (60, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 130, '', '2018-06-06 14:12:18', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 01:32:07', 1, 9350, '', NULL, NULL, '', 0, 'Sys_DictionaryList', 4);
INSERT INTO "public"."Sys_TableColumn" VALUES (61, NULL, NULL, NULL, NULL, NULL, 'Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2023-05-07 10:46:10', 1, 10000, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (62, NULL, NULL, NULL, 12, '日志类型', 'LogType', 'string', 80, NULL, '2018-06-11 18:22:16', NULL, NULL, 'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-07 10:46:10', 1, 8888, NULL, NULL, 3, 'checkbox', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (63, NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', 70, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, '超级管理员', '2023-05-07 10:46:10', 1, 7990, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (64, NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', 70, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, '超级管理员', '2023-05-07 10:46:10', 1, 7980, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (65, NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', 70, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, '超级管理员', '2023-05-07 10:46:10', 1, 7970, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (66, NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', 80, NULL, '2018-06-11 18:22:16', NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 8700, NULL, NULL, 2, 'selectList', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (67, NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', 140, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-07 10:46:10', 1, 9999, NULL, NULL, 2, 'datetime', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (68, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-07 10:46:10', 1, 880, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (69, NULL, NULL, NULL, NULL, '时长', 'ElapsedTime', 'int', 60, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 8600, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (70, NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-07 10:46:10', 1, 7920, NULL, NULL, 1, 'text', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (71, NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-07 10:46:10', 1, 7910, NULL, NULL, 1, 'text', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (72, NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, '超级管理员', '2023-05-07 10:46:10', 1, 7900, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (73, NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', 110, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, '超级管理员', '2023-05-07 10:46:10', 1, 9000, NULL, NULL, 1, 'text', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (74, NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 7880, NULL, NULL, NULL, 'text', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (75, NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, '超级管理员', '2023-05-07 10:46:10', 1, 9100, NULL, NULL, NULL, NULL, 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (76, NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', 90, NULL, '2018-06-11 18:22:16', NULL, NULL, 'roles', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-07 10:46:10', 1, 7860, NULL, NULL, 2, 'select', 0, 'Sys_Log', 5);
INSERT INTO "public"."Sys_TableColumn" VALUES (678, NULL, NULL, NULL, NULL, '', 'DepartmentId', 'guid', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2024-12-13 16:27:46', 1, 9950, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (679, NULL, NULL, NULL, NULL, '名称', 'DepartmentName', 'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2024-12-13 16:27:46', 1, 9900, NULL, NULL, 1, 'like', 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (680, NULL, NULL, NULL, NULL, '编号', 'DepartmentCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2024-12-13 16:27:46', 1, 9800, NULL, NULL, 1, 'like', 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (682, NULL, NULL, NULL, NULL, '类型', 'DepartmentType', 'string', 80, NULL, NULL, NULL, NULL, '组织类型', NULL, 3, 'radio', 2, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2024-12-13 16:27:46', 1, 9750, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (683, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'int', 80, NULL, NULL, NULL, NULL, 'enable', NULL, 7, 'select', 2, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-13 16:27:46', 1, 9700, NULL, NULL, 1, 'select', 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (684, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'text', NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2024-12-13 16:27:46', 1, 9650, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (685, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-13 16:27:46', 1, 9600, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (686, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 4, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2024-12-13 16:27:46', 1, 9550, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (687, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-13 16:27:46', 1, 9500, NULL, NULL, 1, 'datetime', 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (688, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-13 16:27:46', 1, 9450, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (689, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2024-12-13 16:27:46', 1, 9400, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (690, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-13 16:27:46', 1, 9350, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (691, NULL, NULL, NULL, NULL, '上级组织', 'ParentId', 'guid', 110, NULL, NULL, NULL, NULL, '部门级联', NULL, 3, 'cascader', 2, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2024-12-13 16:27:46', 1, 9850, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (734, NULL, NULL, NULL, NULL, '', 'Id', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2023-05-19 01:21:03', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (735, NULL, NULL, NULL, NULL, '', 'UserId', 'int', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (736, NULL, NULL, NULL, NULL, '', 'DepartmentId', 'string', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2023-05-19 01:21:03', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (737, NULL, NULL, NULL, NULL, '', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (738, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (739, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2023-05-19 01:21:03', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (740, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (741, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (742, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2023-05-19 01:21:03', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (743, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2023-05-19 01:21:03', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_UserDepartment', 19);
INSERT INTO "public"."Sys_TableColumn" VALUES (744, NULL, NULL, NULL, NULL, '所属数据库', 'DbServiceId', 'guid', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2024-12-13 16:27:46', 1, 9300, NULL, NULL, NULL, NULL, 0, 'Sys_Department', 14);
INSERT INTO "public"."Sys_TableColumn" VALUES (745, NULL, NULL, NULL, NULL, '所属数据库', 'DbServiceId', 'guid', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2025-03-22 16:08:49', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (746, NULL, NULL, NULL, NULL, '数据权限', 'DatAuth', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, '超级管理员', '2025-03-22 16:08:49', 1, 1376, NULL, NULL, NULL, NULL, 0, 'Sys_Role', 2);
INSERT INTO "public"."Sys_TableColumn" VALUES (885, NULL, NULL, NULL, NULL, '', 'WorkFlow_Id', 'guid', 110, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-10-08 17:42:16', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (886, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 140, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2023-10-08 17:42:16', 1, 1150, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (887, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, '超级管理员', '2023-10-08 17:42:16', 1, 1100, NULL, NULL, 1, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (888, NULL, NULL, NULL, NULL, '功能菜单', 'WorkTableName', 'string', 120, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-10-08 17:42:16', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (889, NULL, NULL, NULL, NULL, '节点信息', 'NodeConfig', 'string', 110, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2023-10-08 17:42:16', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (890, NULL, NULL, NULL, NULL, '连接配置', 'LineConfig', 'string', 110, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2023-10-08 17:42:16', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (891, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 130, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-10-08 17:42:16', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (892, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-10-08 17:42:16', 1, 740, NULL, NULL, 1, 'datetime', 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (893, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (894, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-10-08 17:42:16', 1, 750, NULL, NULL, NULL, '', 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (895, NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', 'enable', NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2023-10-08 17:42:16', 1, 1010, NULL, NULL, NULL, 'select', 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (896, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2023-10-08 17:42:16', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (897, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 160, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-10-08 17:42:16', 1, 600, NULL, NULL, NULL, 'datetime', 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (898, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-07-25 00:31:26', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 660, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (899, NULL, NULL, NULL, NULL, '', 'WorkStepFlow_Id', 'guid', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-05-13 16:40:14', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (900, NULL, NULL, NULL, NULL, '流程主表id', 'WorkFlow_Id', 'guid', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-05-13 16:40:14', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (901, NULL, NULL, NULL, NULL, '流程节点Id', 'StepId', 'string', 120, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 16:40:14', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (902, NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 16:40:14', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (903, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批)', 'StepType', 'int', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (904, NULL, NULL, NULL, NULL, '审批用户id或角色id', 'StepValue', 'string', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:14', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (905, NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', 220, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:14', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (906, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:14', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (907, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (908, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:14', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (909, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2023-05-13 16:40:14', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (910, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:14', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (911, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 110, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:14', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (912, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-07-31 22:43:02', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (913, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 880, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (914, NULL, NULL, NULL, NULL, '', 'WorkFlowTable_Id', 'guid', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-05-13 12:59:47', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (915, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'guid', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2023-05-13 12:59:47', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (916, NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', 130, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1150, NULL, 2, 1, 'like', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (917, NULL, NULL, NULL, NULL, '表主键id', 'WorkTableKey', 'string', 180, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (918, NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', 100, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (919, NULL, NULL, NULL, NULL, '业务名称', 'WorkTableName', 'string', 120, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 12:59:47', 1, 1000, NULL, 3, 1, 'like', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (920, NULL, NULL, NULL, NULL, '不用', 'CurrentOrderId', 'int', 90, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (921, NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', 'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 900, NULL, 1, 1, 'select', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (922, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 12:59:47', 1, 850, NULL, 4, 1, 'datetime', 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (923, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (924, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 12:59:47', 1, 860, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (925, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, '超级管理员', '2023-05-13 12:59:47', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (926, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 12:59:47', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (927, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 12:59:47', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (928, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-01 00:15:40', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 12:59:47', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (929, NULL, NULL, NULL, NULL, '', 'Sys_WorkFlowTableStep_Id', 'guid', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-05-13 16:40:30', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (930, NULL, NULL, NULL, NULL, '主表id', 'WorkFlowTable_Id', 'guid', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, 0, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 16, '超级管理员', '2023-05-13 16:40:30', 1, 1250, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (931, NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'guid', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-05-13 16:40:30', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (932, NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', 120, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 16:40:30', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (933, NULL, NULL, NULL, NULL, '节名称', 'StepName', 'string', 180, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-05-13 16:40:30', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (934, NULL, NULL, NULL, NULL, '审批类型', 'StepType', 'int', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (935, NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批)', 'StepValue', 'string', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:30', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (936, NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (937, NULL, NULL, NULL, NULL, '', 'Remark', 'string', 220, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:30', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (938, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:30', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (939, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (940, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:30', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (941, NULL, NULL, NULL, NULL, '', 'Enable', 'byte', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, '超级管理员', '2023-05-13 16:40:30', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (942, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, '超级管理员', '2023-05-13 16:40:30', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (943, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:30', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (944, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-08-01 00:21:19', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (945, NULL, NULL, NULL, NULL, '审核人id', 'AuditId', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (946, NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (947, NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (948, NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (949, NULL, NULL, NULL, NULL, '', 'Id', 'guid', 110, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2022-09-07 01:42:45', 1, 1300, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (950, NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', 120, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, 0, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-09-07 01:42:45', 1, 1250, NULL, NULL, 1, 'like', 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (951, NULL, NULL, NULL, NULL, '任务分组', 'GroupName', 'string', 100, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, 0, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, '超级管理员', '2022-09-07 01:42:45', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (952, NULL, NULL, NULL, NULL, 'Corn表达式', 'CronExpression', 'string', 120, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, 0, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2022-09-07 01:42:45', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (953, NULL, NULL, NULL, 12, 'Url地址', 'ApiUrl', 'string', 150, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 01:42:45', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (954, NULL, NULL, NULL, NULL, 'AuthKey', 'AuthKey', 'string', 100, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 6, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2022-09-07 01:42:45', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (955, NULL, NULL, NULL, NULL, 'AuthValue', 'AuthValue', 'string', 100, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 6, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2022-09-07 01:42:45', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (956, NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', 120, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2022-09-07 01:42:45', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (957, NULL, NULL, NULL, NULL, '最后执行执行', 'LastRunTime', 'DateTime', 150, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 0, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-07 01:42:45', 1, 900, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (958, NULL, NULL, NULL, NULL, '运行状态', 'Status', 'int', 90, NULL, '2022-09-05 03:09:08', 1, '超级管理员', '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (959, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (960, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 130, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 10, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, '超级管理员', '2022-09-07 01:42:45', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (961, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, 10, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, '超级管理员', '2022-09-07 01:42:45', 1, 700, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (962, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (963, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-07 01:42:45', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (964, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 110, NULL, '2022-09-05 03:09:08', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-07 01:42:45', 1, 550, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (965, NULL, NULL, NULL, NULL, '', 'LogId', 'guid', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2022-09-05 23:49:32', 1, 1200, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (966, NULL, NULL, NULL, NULL, '任务id', 'Id', 'guid', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, '超级管理员', '2022-09-05 23:49:32', 1, 1150, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (967, NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', 120, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2022-09-05 23:49:32', 1, 1100, NULL, NULL, 1, 'like', 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (968, NULL, NULL, NULL, NULL, '耗时(秒)', 'ElapsedTime', 'int', 90, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 1050, NULL, NULL, 1, 'range', 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (969, NULL, NULL, NULL, NULL, '开始时间', 'StratDate', 'DateTime', 150, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 1000, NULL, NULL, 1, 'datetime', 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (970, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 150, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (971, NULL, NULL, NULL, NULL, '是否成功', 'Result', 'int', 100, NULL, '2022-09-05 03:14:51', 1, '超级管理员', 'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 900, NULL, NULL, 1, 'select', 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (972, NULL, NULL, NULL, NULL, '返回内容', 'ResponseContent', 'string', 250, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-05 23:49:32', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (973, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 80, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (974, NULL, NULL, NULL, NULL, '', 'Creator', 'string', 130, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-05 23:49:32', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (975, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (976, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 80, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-05 23:49:32', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (977, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 130, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, '超级管理员', '2022-09-05 23:49:32', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (978, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 110, NULL, '2022-09-05 03:14:51', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2022-09-05 23:49:32', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (979, NULL, NULL, NULL, 12, 'post参数', 'PostData', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 8, 'textarea', NULL, 1, 0, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-07 01:42:45', 1, 1060, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (980, NULL, NULL, NULL, NULL, '请求方式', 'Method', 'string', 110, NULL, NULL, NULL, NULL, '请求方式', NULL, 2, 'select', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2022-09-07 01:42:45', 1, 1160, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (981, NULL, NULL, NULL, NULL, '超时时间(秒)', 'TimeOut', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2022-09-07 01:42:45', 1, 1152, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzOptions', 37);
INSERT INTO "public"."Sys_TableColumn" VALUES (982, NULL, NULL, NULL, NULL, '异常信息', 'ErrorMsg', 'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, '超级管理员', '2022-09-05 23:49:32', 1, 840, NULL, NULL, NULL, NULL, 0, 'Sys_QuartzLog', 38);
INSERT INTO "public"."Sys_TableColumn" VALUES (983, NULL, NULL, NULL, NULL, '下一个审批节点', 'NextStepIds', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (984, NULL, NULL, NULL, NULL, '父级节点', 'ParentId', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 2000, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (985, NULL, NULL, NULL, NULL, '审核未通过(返回上一节点,流程重新开始,流程结束)', 'AuditRefuse', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (986, NULL, NULL, NULL, NULL, '驳回(返回上一节点,流程重新开始,流程结束)', 'AuditBack', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (987, NULL, NULL, NULL, NULL, '审批方式(启用会签)', 'AuditMethod', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (988, NULL, NULL, NULL, NULL, '审核后发送邮件通知', 'SendMail', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (989, NULL, NULL, NULL, NULL, '审核条件', 'Filters', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (990, NULL, NULL, NULL, NULL, '审核中数据是否可以编辑', 'AuditingEdit', 'int', 80, NULL, NULL, NULL, NULL, 'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 1010, NULL, NULL, 1, 'select', 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (991, NULL, NULL, NULL, NULL, '节点属性(start、node、end))', 'StepAttrType', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (992, NULL, NULL, NULL, NULL, '节点属性(start、node、end))', 'StepAttrType', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (993, NULL, NULL, NULL, NULL, '当前审核节点ID', 'CurrentStepId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 12:59:47', 1, 960, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (994, NULL, NULL, NULL, NULL, '', 'ParentId', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (995, NULL, NULL, NULL, NULL, '', 'NextStepId', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (996, NULL, NULL, NULL, NULL, '', 'Id', 'guid', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, '超级管理员', '2023-04-26 11:54:08', 1, 1100, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (997, NULL, NULL, NULL, NULL, '', 'WorkFlowTable_Id', 'guid', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-04-26 11:54:08', 1, 1050, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (998, NULL, NULL, NULL, NULL, '', 'WorkFlowTableStep_Id', 'guid', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, '超级管理员', '2023-04-26 11:54:08', 1, 1000, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (999, NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', 120, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-04-26 11:54:08', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1000, NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', 180, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2023-04-26 11:54:08', 1, 900, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1001, NULL, NULL, NULL, NULL, '', 'AuditId', 'int', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-04-26 11:54:08', 1, 850, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1002, NULL, NULL, NULL, NULL, '', 'Auditor', 'string', 120, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2023-04-26 11:54:08', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1003, NULL, NULL, NULL, NULL, '', 'AuditStatus', 'int', 110, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-04-26 11:54:08', 1, 750, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1004, NULL, NULL, NULL, NULL, '', 'AuditResult', 'string', 220, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2023-04-26 11:54:08', 1, 700, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1005, NULL, NULL, NULL, NULL, '', 'AuditDate', 'DateTime', 150, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-04-26 11:54:08', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1006, NULL, NULL, NULL, NULL, '', 'Remark', 'string', 220, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, '超级管理员', '2023-04-26 11:54:08', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1007, NULL, NULL, NULL, NULL, '', 'CreateDate', 'DateTime', 150, NULL, '2023-04-26 11:52:20', 1, '超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2023-04-26 11:54:08', 1, 550, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableAuditLog', 39);
INSERT INTO "public"."Sys_TableColumn" VALUES (1008, NULL, NULL, NULL, NULL, '当前审核节点名称', 'StepName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, '超级管理员', '2023-05-13 12:59:47', 1, 955, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTable', 35);
INSERT INTO "public"."Sys_TableColumn" VALUES (1009, NULL, NULL, NULL, NULL, '权重(相同条件权重大的优先匹配)', 'Weight', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-10-08 17:42:16', 1, 1011, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlow', 33);
INSERT INTO "public"."Sys_TableColumn" VALUES (1010, NULL, NULL, NULL, NULL, '权重(相同条件权重大的优先匹配)', 'Weight', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:14', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowStep', 34);
INSERT INTO "public"."Sys_TableColumn" VALUES (1011, NULL, NULL, NULL, NULL, '', 'Weight', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2023-05-13 16:40:30', 1, 0, NULL, NULL, NULL, NULL, 0, 'Sys_WorkFlowTableStep', 36);
INSERT INTO "public"."Sys_TableColumn" VALUES (1203, NULL, NULL, NULL, NULL, '', 'User_Id', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 1, 0, 1, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9950, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1204, 1, 0, 1, NULL, '帐号', 'UserName', 'string', 100, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, '', 1, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2025-03-24 00:55:19', 1, 9900, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1205, NULL, NULL, NULL, NULL, '姓名', 'UserTrueName', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 1, 'text', 1, 1, 1, NULL, 0, 0, 0, 20, '超级管理员', '2025-03-24 00:55:19', 1, 9850, '', NULL, 1, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1206, NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', 60, '', NULL, NULL, NULL, 'gender', NULL, 5, 'select', 1, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9700, '', NULL, 1, 'select', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1207, NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', 70, '', NULL, NULL, NULL, '', NULL, 20, 'img', NULL, 1, 1, 1, 0, 1, 0, 500, '超级管理员', '2025-03-24 00:55:19', 1, 9600, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1208, 0, 0, 1, NULL, '角色', 'Role_Id', 'int', 140, '', '2018-06-14 16:44:15', NULL, NULL, 'tree_roles', NULL, 5, 'cascader', NULL, 1, 1, NULL, 0, 0, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9750, '', NULL, 1, 'cascader', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1211, NULL, NULL, NULL, NULL, '邮箱', 'Email', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'mail', 2, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 00:55:19', 1, 9500, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1212, NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', 180, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 500, '超级管理员', '2025-03-24 00:55:19', 1, 9450, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1213, 1, 0, NULL, NULL, '密码', 'UserPwd', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 0, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 9800, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1214, NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, '', NULL, 1, 1, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9050, '', NULL, 1, 'datetime', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1215, 1, 0, NULL, NULL, '手机号', 'PhoneNo', 'string', 150, '', NULL, NULL, NULL, '', NULL, 0, '', NULL, 1, 0, NULL, 0, 1, 0, 11, '超级管理员', '2025-03-24 00:55:19', 1, 9350, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1216, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9300, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1217, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 1, NULL, 0, 1, 1, 200, '超级管理员', '2025-03-24 00:55:19', 1, 9150, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1218, NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', 80, '', '2018-06-14 16:44:15', NULL, NULL, 'enable', NULL, 10, 'select', NULL, 1, 1, NULL, 0, 0, 0, 1, '超级管理员', '2025-03-24 00:55:19', 1, 9550, '', NULL, NULL, 'select', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1219, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 9100, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1220, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 130, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 1, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8950, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1221, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, 'datetime', NULL, 1, 0, NULL, 0, 1, 1, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9000, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1222, NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9250, '', NULL, NULL, 'datetime', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1223, NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', 150, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, NULL, '', NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 00:55:19', 1, 9200, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1224, NULL, NULL, NULL, 12, '备注', 'Remark', 'string', 120, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 16, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 9400, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1225, NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', 90, '', '2018-06-14 16:44:15', NULL, NULL, '', NULL, 0, 'text', NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8900, '', NULL, NULL, '', 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1226, NULL, NULL, NULL, 12, '组织构架', 'DeptIds', 'string', 220, NULL, NULL, NULL, NULL, '部门级联', NULL, 12, 'treeSelect', NULL, 1, 0, NULL, 0, 1, 0, 2000, '超级管理员', '2025-03-24 00:55:19', 1, 9650, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1247, NULL, NULL, NULL, NULL, '', 'id', 'int', 110, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 1, 0, NULL, 1, 0, 0, 4, '超级管理员', '2024-12-14 17:25:45', 1, 950, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1248, NULL, NULL, NULL, NULL, '编码', 'code', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2024-12-14 17:25:45', 1, 900, NULL, NULL, NULL, 'like', 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1249, NULL, NULL, NULL, NULL, '名称', 'name', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 1, 0, 40, '超级管理员', '2024-12-14 17:25:45', 1, 850, NULL, NULL, 1, NULL, 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1250, NULL, NULL, NULL, NULL, '上级编码', 'parentId', 'int', 70, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-14 17:25:45', 1, 800, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1251, NULL, NULL, NULL, NULL, '级别', 'level', 'int', 60, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 2, 1, 1, NULL, 0, 1, 0, 4, '超级管理员', '2024-12-14 17:25:45', 1, 750, NULL, NULL, 1, NULL, 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1252, NULL, NULL, NULL, NULL, '完整地址', 'mername', 'string', 170, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 2, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2024-12-14 17:25:45', 1, 700, NULL, NULL, 1, 'like', 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1253, NULL, NULL, NULL, NULL, '经度', 'Lng', 'float', 70, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-14 17:25:45', 1, 650, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1254, NULL, NULL, NULL, NULL, '纬度', 'Lat', 'float', 70, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, 1, 1, NULL, 0, 1, 0, 8, '超级管理员', '2024-12-14 17:25:45', 1, 600, NULL, NULL, NULL, NULL, 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1255, NULL, NULL, NULL, NULL, '拼音', 'pinyin', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2024-12-14 17:25:45', 1, 550, NULL, NULL, 1, 'like', 0, 'Sys_Region', 20);
INSERT INTO "public"."Sys_TableColumn" VALUES (1270, NULL, NULL, NULL, NULL, '客户ID', 'CustomerID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:08:07', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1271, NULL, NULL, NULL, NULL, '客户名称', 'CustomerName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1272, NULL, NULL, NULL, NULL, '联系人', 'ContactPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1273, NULL, NULL, NULL, NULL, '联系电话', 'ContactPhone', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1274, NULL, NULL, NULL, NULL, '邮箱地址', 'Email', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1275, NULL, NULL, NULL, NULL, '联系地址', 'Address', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1276, NULL, NULL, NULL, NULL, '客户类型', 'CustomerType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1277, NULL, NULL, NULL, NULL, '信用评级', 'CreditRating', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1278, NULL, NULL, NULL, NULL, '业务范围', 'BusinessScope', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1279, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 20, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1280, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1281, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1282, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1283, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1284, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:08:07', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1285, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:08:07', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Customer', 55);
INSERT INTO "public"."Sys_TableColumn" VALUES (1286, NULL, NULL, NULL, NULL, '供应商ID', 'SupplierID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:14:21', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1287, NULL, NULL, NULL, NULL, '供应商名', 'SupplierName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1288, NULL, NULL, NULL, NULL, '联系人', 'ContactPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1289, NULL, NULL, NULL, NULL, '联系电话', 'ContactPhone', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1290, NULL, NULL, NULL, NULL, '邮箱地址', 'Email', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1291, NULL, NULL, NULL, NULL, '联系地址', 'Address', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1292, NULL, NULL, NULL, NULL, '供应商类型', 'SupplierType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1293, NULL, NULL, NULL, NULL, '供应范围', 'ProductRange', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1294, NULL, NULL, NULL, NULL, '质量评级', 'QualityRating', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1295, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 140, NULL, NULL, NULL, NULL, NULL, NULL, 8, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1296, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1297, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1298, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1299, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1300, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:14:21', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1301, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:14:21', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Supplier', 56);
INSERT INTO "public"."Sys_TableColumn" VALUES (1302, NULL, NULL, NULL, NULL, '设备ID', 'DeviceID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:37:04', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1303, NULL, NULL, NULL, NULL, '产线ID', 'ProductionLineID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:37:04', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1304, NULL, NULL, NULL, NULL, '设备名称', 'DeviceName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1305, NULL, NULL, NULL, NULL, '设备型号', 'DeviceModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1306, NULL, NULL, NULL, NULL, '制造商', 'Manufacturer', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1307, NULL, NULL, NULL, NULL, '购买日期', 'PurchaseDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1308, NULL, NULL, NULL, NULL, '保修日期', 'WarrantyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1309, NULL, NULL, NULL, NULL, '设备状态', 'Status', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1310, NULL, NULL, NULL, NULL, '线上位置', 'LocationOnLine', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1311, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1312, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1313, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1314, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1315, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1316, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:04', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1317, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:04', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLineDevice', 58);
INSERT INTO "public"."Sys_TableColumn" VALUES (1318, NULL, NULL, NULL, NULL, '物料ID', 'MaterialID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 11:17:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1319, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1320, NULL, NULL, NULL, NULL, '物料类型', 'MaterialType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1321, NULL, NULL, NULL, NULL, '规格型号', 'Specification', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9650, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1322, NULL, NULL, NULL, NULL, '单位', 'Unit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', NULL, 10, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9600, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1323, NULL, NULL, NULL, NULL, '单价', 'Price', 'decimal', 70, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1327, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1328, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1330, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1332, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1335, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1337, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1338, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:17:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1341, NULL, NULL, NULL, NULL, '仓库ID', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 00:26:37', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1343, NULL, NULL, NULL, NULL, '仓库编码', 'WarehouseCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1345, NULL, NULL, NULL, NULL, '仓库名称', 'WarehouseName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1347, NULL, NULL, NULL, NULL, '仓库类型', 'WarehouseType', 'string', 90, NULL, NULL, NULL, NULL, '仓库类型', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1150, NULL, NULL, 1, 'select', 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1349, NULL, NULL, NULL, NULL, '仓库面积', 'WarehouseArea', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 1100, NULL, NULL, NULL, NULL, 1, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1351, NULL, NULL, NULL, NULL, '仓库地址', 'WarehouseAddress', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1353, NULL, NULL, NULL, NULL, '仓库电话', 'WarehousePhone', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 1000, NULL, NULL, 1, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1355, NULL, NULL, NULL, NULL, '仓库管理员', 'WarehouseManager', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1357, NULL, NULL, NULL, NULL, '启用状态', 'WarehouseStatus', 'string', 60, NULL, NULL, NULL, NULL, 'enable', NULL, 6, 'radio', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1359, NULL, NULL, NULL, NULL, '仓库容量', 'WarehouseCapacity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 850, NULL, NULL, NULL, NULL, 1, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1360, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1361, NULL, NULL, NULL, NULL, '产线ID', 'ProductionLineID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:37:33', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1362, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1363, NULL, NULL, NULL, NULL, '产线名称', 'LineName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1250, NULL, NULL, 1, 'like', 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1364, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1365, NULL, NULL, NULL, NULL, '产线类型', 'LineType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1366, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1367, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:26:37', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1368, NULL, NULL, NULL, NULL, '产能信息', 'Capacity', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1369, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:26:37', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_WarehouseManagement', 57);
INSERT INTO "public"."Sys_TableColumn" VALUES (1370, NULL, NULL, NULL, NULL, '产线状态', 'Status', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1371, NULL, NULL, NULL, NULL, '负责人', 'ResponsiblePerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1372, NULL, NULL, NULL, NULL, '产线位置', 'Location', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1373, NULL, NULL, NULL, NULL, '启用日期', 'StartDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1374, NULL, NULL, NULL, NULL, '停用日期', 'EndDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1375, NULL, NULL, NULL, 12, '备注信息', 'Remarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1376, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1377, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1378, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1379, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1380, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:37:33', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1381, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:37:33', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionLine', 61);
INSERT INTO "public"."Sys_TableColumn" VALUES (1382, NULL, NULL, NULL, NULL, '库存ID', 'InventoryID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:30:20', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1383, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1384, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1385, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1386, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1387, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '货位', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:30:20', 1, 9700, NULL, NULL, 1, 'select', 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1388, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:30:20', 1, 9650, NULL, NULL, 1, 'select', 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1389, NULL, NULL, NULL, NULL, '库存数量', 'InventoryQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9600, NULL, NULL, NULL, NULL, 1, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1390, NULL, NULL, NULL, NULL, '单位', 'InventoryUnit', 'string', 90, NULL, NULL, NULL, NULL, '物料单位', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1391, NULL, NULL, NULL, NULL, '库存成本', 'InventoryCost', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1392, NULL, NULL, NULL, NULL, '库存状态', 'InventoryStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1393, NULL, NULL, NULL, NULL, '入库日期', 'InboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9400, NULL, NULL, 1, 'datetime', 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1394, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1395, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1396, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1397, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9150, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1398, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:20', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1399, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:20', 1, 9100, NULL, NULL, NULL, NULL, 0, 'MES_InventoryManagement', 62);
INSERT INTO "public"."Sys_TableColumn" VALUES (1400, NULL, NULL, NULL, NULL, '货位ID', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 00:42:18', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1401, NULL, NULL, NULL, NULL, '所属仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 00:42:18', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1402, NULL, NULL, NULL, NULL, '货位编码', 'LocationCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1403, NULL, NULL, NULL, NULL, '货位名称', 'LocationName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1404, NULL, NULL, NULL, NULL, '货位类型', 'LocationType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1405, NULL, NULL, NULL, NULL, '货位容量', 'LocationCapacity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1406, NULL, NULL, NULL, NULL, '货位状态', 'LocationStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1407, NULL, NULL, NULL, NULL, '货位行号', 'LocationRow', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1408, NULL, NULL, NULL, NULL, '货位列号', 'LocationColumn', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1409, NULL, NULL, NULL, NULL, '货位层数', 'LocationFloor', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1410, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1411, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1412, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1413, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1414, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 00:42:18', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1415, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 00:42:18', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_LocationManagement', 63);
INSERT INTO "public"."Sys_TableColumn" VALUES (1416, NULL, NULL, NULL, NULL, '出库ID', 'OutboundID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:30:09', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1417, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 130, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1418, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1300, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1419, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1420, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1421, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 01:30:09', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1422, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '货位', 3, 9, 'select', NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2025-03-17 01:30:09', 1, 1100, NULL, NULL, 1, 'select', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1423, NULL, NULL, NULL, NULL, '出库数量', 'OutboundQuantity', 'int', 70, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 1050, NULL, NULL, 3, 'range', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1424, NULL, NULL, NULL, NULL, '出库单位', 'OutboundUnit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', 3, 15, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 1000, NULL, NULL, 3, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1425, NULL, NULL, NULL, NULL, '出库日期', 'OutboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, 3, 15, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 950, NULL, NULL, 3, 'date', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1426, NULL, NULL, NULL, NULL, '维修ID', 'RepairID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:00:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1427, NULL, NULL, NULL, NULL, '出库操作员', 'OutboundOperator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1428, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:00:16', 1, 9900, NULL, NULL, 1, 'select', 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1429, NULL, NULL, NULL, NULL, '出库原因', 'OutboundReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1430, NULL, NULL, NULL, NULL, '维修日期', 'RepairDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9850, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1431, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1432, NULL, NULL, NULL, NULL, '维修原因', 'RepairReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1433, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 750, NULL, NULL, 3, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1434, NULL, NULL, NULL, NULL, '维修内容', 'RepairContent', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1435, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 700, NULL, NULL, 3, 'datetime', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1436, NULL, NULL, NULL, NULL, '维修人员', 'RepairPerson', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1437, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1438, NULL, NULL, NULL, NULL, '维修成本', 'RepairCost', 'decimal', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1439, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:30:09', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1440, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:30:09', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1441, NULL, NULL, NULL, NULL, '维修状态', 'RepairStatus', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1442, NULL, NULL, NULL, NULL, '维修开始时间', 'RepairStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'datetime', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1443, NULL, NULL, NULL, NULL, '入库ID', 'InboundID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1444, NULL, NULL, NULL, NULL, '维修结束时间', 'RepairEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1445, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1446, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1447, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1300, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1448, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1449, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1450, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1451, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1452, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1453, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1454, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1455, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '货位', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1150, NULL, NULL, 1, 'select', 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1456, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 6, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1100, NULL, NULL, 1, 'select', 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1457, NULL, NULL, NULL, NULL, '入库数量', 'InboundQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1458, NULL, NULL, NULL, NULL, '入库单位', 'InboundUnit', 'string', 90, NULL, NULL, NULL, NULL, '物料单位', NULL, 8, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1459, NULL, NULL, NULL, NULL, '入库日期', 'InboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1460, NULL, NULL, NULL, NULL, '设备ID', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:53:09', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1461, NULL, NULL, NULL, NULL, '入库操作员', 'InboundOperator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1462, NULL, NULL, NULL, NULL, '入库原因', 'InboundReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1463, NULL, NULL, NULL, NULL, '设备编码', 'EquipmentCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9900, NULL, NULL, 1, 'like', 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1464, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1465, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9850, NULL, NULL, 1, 'like', 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1466, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1467, NULL, NULL, NULL, NULL, '设备类型', 'EquipmentType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1468, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1469, NULL, NULL, NULL, NULL, '制造商', 'Manufacturer', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1470, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1471, NULL, NULL, NULL, NULL, '购买日期', 'PurchaseDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9700, NULL, NULL, 1, 'date', 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1472, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1473, NULL, NULL, NULL, NULL, '保修期', 'WarrantyPeriod', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1474, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1475, NULL, NULL, NULL, NULL, '安装位置', 'InstallationLocation', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1476, NULL, NULL, NULL, NULL, '设备状态', 'EquipmentStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9550, NULL, NULL, 1, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1477, NULL, NULL, NULL, NULL, '责任人', 'ResponsiblePerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1478, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1479, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1480, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1481, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1482, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1483, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1484, NULL, NULL, NULL, NULL, '保养ID', 'MaintenanceID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:05:27', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1485, NULL, NULL, NULL, NULL, '设备信息', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:05:27', 1, 1250, NULL, NULL, 1, 'select', 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1486, NULL, NULL, NULL, NULL, '保养日期', 'MaintenanceDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 1200, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1487, NULL, NULL, NULL, NULL, '保养类型', 'MaintenanceType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1488, NULL, NULL, NULL, NULL, '保养内容', 'MaintenanceContent', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1489, NULL, NULL, NULL, NULL, '保养人员', 'MaintenancePerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1490, NULL, NULL, NULL, NULL, '保养状态', 'MaintenanceStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1491, NULL, NULL, NULL, NULL, '下次保养日期', 'NextMaintenanceDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1492, NULL, NULL, NULL, NULL, '保养成本', 'MaintenanceCost', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1493, NULL, NULL, NULL, NULL, '保养备注', 'MaintenanceRemarks', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1494, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1495, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1496, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1497, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1498, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:05:27', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1499, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:05:27', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentMaintenance', 68);
INSERT INTO "public"."Sys_TableColumn" VALUES (1500, NULL, NULL, NULL, NULL, '故障记录ID', 'FaultRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:03:50', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1501, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:03:50', 1, 1250, NULL, NULL, 1, 'select', 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1550, NULL, NULL, NULL, NULL, '统计人', 'ReportedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1502, NULL, NULL, NULL, NULL, '故障日期', 'FaultDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 1200, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1503, NULL, NULL, NULL, NULL, '故障类型', 'FaultType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1504, NULL, NULL, NULL, NULL, '故障描述', 'FaultDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1505, NULL, NULL, NULL, NULL, '故障影响', 'FaultImpact', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1506, NULL, NULL, NULL, NULL, '故障报告人', 'FaultReportedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 1000, NULL, NULL, 1, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1507, NULL, NULL, NULL, NULL, '故障状态', 'FaultStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1508, NULL, NULL, NULL, NULL, '排查开始时间', 'TroubleshootingStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1509, NULL, NULL, NULL, NULL, '排查结束时间', 'TroubleshootingEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1510, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1511, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1512, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1513, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1514, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:03:50', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1515, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:03:50', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentFaultRecord', 69);
INSERT INTO "public"."Sys_TableColumn" VALUES (1516, NULL, NULL, NULL, NULL, '订单ID', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:20:52', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1517, NULL, NULL, NULL, NULL, '订单编号', 'OrderNumber', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1518, NULL, NULL, NULL, NULL, '客户名称', 'CustomerName', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1519, NULL, NULL, NULL, NULL, '订单日期', 'OrderDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9800, NULL, NULL, 1, 'date', 1, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1520, NULL, NULL, NULL, NULL, '交货日期', 'DeliveryDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 0, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9750, NULL, NULL, 1, 'date', 1, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1521, NULL, NULL, NULL, NULL, '工序ID', 'ProcessID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:24:19', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1522, NULL, NULL, NULL, NULL, '排产状态', 'OrderStatus', 'string', 80, NULL, NULL, NULL, NULL, '排产状态', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9600, NULL, NULL, 1, 'select', 1, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1523, NULL, NULL, NULL, NULL, '工序编码', 'ProcessCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1525, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1526, NULL, NULL, NULL, NULL, '工序名称', 'ProcessName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1527, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1528, NULL, NULL, NULL, NULL, '工序类型', 'ProcessType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1150, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1529, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1530, NULL, NULL, NULL, NULL, '工序顺序', 'ProcessSequence', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1531, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1532, NULL, NULL, NULL, NULL, '工序描述', 'ProcessDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1533, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:20:52', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1534, NULL, NULL, NULL, NULL, '工作中心', 'WorkCenter', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1535, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1536, NULL, NULL, NULL, NULL, '标准工时', 'StandardWorkingHours', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1537, NULL, NULL, NULL, NULL, '工序状态', 'ProcessStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1538, NULL, NULL, NULL, NULL, '责任人', 'ResponsibleWorker', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1539, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1540, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1541, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1542, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1543, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:19', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1544, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:19', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Process', 70);
INSERT INTO "public"."Sys_TableColumn" VALUES (1545, NULL, NULL, NULL, NULL, 'ID', 'ReportID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:35:37', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1546, NULL, NULL, NULL, NULL, '工序名称', 'ProcessID', 'string', 90, NULL, NULL, NULL, NULL, '工序', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:35:37', 1, 1250, NULL, NULL, 1, 'select', 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1547, NULL, NULL, NULL, NULL, '统计日期', 'ReportDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1548, NULL, NULL, NULL, NULL, '完成数量', 'CompletedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 1150, NULL, NULL, 1, 'range', 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1549, NULL, NULL, NULL, NULL, '不良数量', 'DefectiveQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 1100, NULL, NULL, 1, 'range', 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1551, NULL, NULL, NULL, NULL, '汇报状态', 'ReportStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1552, NULL, NULL, NULL, NULL, '备注', 'ReportRemarks', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1553, NULL, NULL, NULL, NULL, '工序开始时间', 'StartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1554, NULL, NULL, NULL, NULL, '工序结束时间', 'EndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1555, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1556, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1557, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1558, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1559, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1560, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:35:37', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProcessReport', 72);
INSERT INTO "public"."Sys_TableColumn" VALUES (1561, NULL, NULL, NULL, NULL, '路线ID', 'RouteID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1562, NULL, NULL, NULL, NULL, '工序', 'ProcessID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1563, NULL, NULL, NULL, NULL, '产品ID', 'ProductID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1564, NULL, NULL, NULL, NULL, '路线名称', 'ProductName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1565, NULL, NULL, NULL, NULL, '路线顺序', 'RouteSequence', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1566, NULL, NULL, NULL, NULL, '路线描述', 'RouteDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1567, NULL, NULL, NULL, NULL, '前工序', 'PreProcessID', 'string', 90, NULL, NULL, NULL, NULL, '工序', NULL, 7, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9650, NULL, NULL, 1, 'select', 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1568, NULL, NULL, NULL, NULL, '后工序', 'NextProcessID', 'string', 90, NULL, NULL, NULL, NULL, '工序', NULL, 9, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:24:16', 1, 9600, NULL, NULL, 1, 'select', 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1569, NULL, NULL, NULL, NULL, '启用状态', 'RouteStatus', 'string', 90, NULL, NULL, NULL, NULL, 'enable', NULL, 12, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1570, NULL, NULL, NULL, NULL, '路线责任人', 'RouteResponsible', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1571, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1572, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1573, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1574, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1575, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:24:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1576, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:24:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProcessRoute', 73);
INSERT INTO "public"."Sys_TableColumn" VALUES (1577, NULL, NULL, NULL, NULL, '计划明细ID', 'PlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 14:43:01', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1578, NULL, NULL, NULL, NULL, '订单ID', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 14:43:01', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1579, NULL, NULL, NULL, NULL, '物料编码', 'MaterialCode', 'string', 100, NULL, NULL, NULL, NULL, '物料列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1580, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 1, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1581, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1582, NULL, NULL, NULL, NULL, '单位', 'Unit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1584, NULL, NULL, NULL, NULL, '订单数量', 'PlanQuantity', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1586, NULL, NULL, NULL, NULL, '计划开始时间', 'PlannedStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1588, NULL, NULL, NULL, NULL, '计划结束时间', 'PlannedEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1590, NULL, NULL, NULL, NULL, '计划状态', 'PlanStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1592, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1594, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1596, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1598, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1600, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 14:43:01', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1602, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 14:43:01', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanDetail', 74);
INSERT INTO "public"."Sys_TableColumn" VALUES (1608, NULL, NULL, NULL, NULL, '变更记录ID', 'ChangeRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 19:32:23', 1, 1500, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1609, NULL, NULL, NULL, NULL, '计划明细ID', 'PlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 19:32:23', 1, 1450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1610, NULL, NULL, NULL, NULL, '订单编号', 'OrderNumber', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 1400, NULL, NULL, 1, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1611, NULL, NULL, NULL, NULL, '客户名称', 'CustomerName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1612, NULL, NULL, NULL, NULL, '订单日期', 'OrderDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1300, NULL, NULL, 1, 'date', 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1613, NULL, NULL, NULL, NULL, '变更日期', 'ChangeDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1250, NULL, NULL, 1, 'date', 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1614, NULL, NULL, NULL, NULL, '原计划数量', 'OriginalPlanQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1200, NULL, NULL, 1, 'range', 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1615, NULL, NULL, NULL, NULL, '新计划数量', 'NewPlanQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1616, NULL, NULL, NULL, NULL, '原计划开始时间', 'OriginalPlannedStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1617, NULL, NULL, NULL, NULL, '新计划开始时间', 'NewPlannedStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1618, NULL, NULL, NULL, NULL, '原计划结束时间', 'OriginalPlannedEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1619, NULL, NULL, NULL, NULL, '新计划结束时间', 'NewPlannedEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'date', NULL, 1, 0, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1620, NULL, NULL, NULL, NULL, '变更原因', 'ChangeReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1621, NULL, NULL, NULL, NULL, '变更人', 'ChangedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1622, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1623, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1624, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1625, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1626, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 19:32:23', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1627, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 19:32:23', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionPlanChangeRecord', 76);
INSERT INTO "public"."Sys_TableColumn" VALUES (1628, NULL, NULL, NULL, NULL, '报工ID', 'ReportingID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 16:02:05', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1629, NULL, NULL, NULL, NULL, '报工单号', 'ReportingNumber', 'string', 125, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9850, NULL, NULL, 1, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1630, NULL, NULL, NULL, NULL, '订单', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 16:02:05', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1631, NULL, NULL, NULL, NULL, '报工人', 'ReportedBy', 'string', 90, NULL, NULL, NULL, NULL, '用户列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9800, NULL, NULL, 1, 'select', 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1632, NULL, NULL, NULL, NULL, '报工时间', 'ReportingTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9750, NULL, NULL, 1, 'datetime', 1, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1634, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1635, NULL, NULL, NULL, NULL, '明细ID', 'DetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 15:57:59', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1636, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1637, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9300, NULL, NULL, NULL, 'datetime', 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1638, NULL, NULL, NULL, NULL, '报工ID', 'ReportingID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 15:57:59', 1, 9900, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1639, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1640, NULL, NULL, NULL, NULL, '报工物料', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, '物料列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1641, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1642, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 130, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1643, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1644, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1645, NULL, NULL, NULL, NULL, '报工数量', 'ReportedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1646, NULL, NULL, NULL, NULL, '合格数量', 'AcceptedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1647, NULL, NULL, NULL, NULL, '不合格数量', 'RejectedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1650, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1651, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1652, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1653, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1654, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 15:57:59', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1655, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9150, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1656, NULL, NULL, NULL, NULL, '不良品ID', 'DefectiveID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-18 18:06:50', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1657, NULL, NULL, NULL, NULL, '报工ID', 'ReportingID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-18 18:06:50', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1658, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1659, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1150, NULL, NULL, 1, 'like', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1660, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1100, NULL, NULL, 1, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1661, NULL, NULL, NULL, NULL, '不良品数量', 'DefectiveQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 1050, NULL, NULL, 1, 'range', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1662, NULL, NULL, NULL, NULL, '缺陷类型', 'DefectType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1663, NULL, NULL, NULL, NULL, '缺陷原因', 'DefectReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1664, NULL, NULL, NULL, NULL, '处理方式', 'DisposalMethod', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1665, NULL, NULL, NULL, NULL, '处理状态', 'DisposalStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1666, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1667, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1668, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 700, NULL, NULL, 1, 'datetime', 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1669, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1670, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 18:06:50', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1671, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 18:06:50', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_DefectiveProductRecord', 79);
INSERT INTO "public"."Sys_TableColumn" VALUES (1672, NULL, NULL, NULL, NULL, '检验计划ID', 'InspectionPlanID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:50:26', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1673, NULL, NULL, NULL, NULL, '检验单号', 'InspectionPlanNumber', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1674, NULL, NULL, NULL, NULL, '订单ID', 'OrderID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 01:50:26', 1, 9850, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1676, NULL, NULL, NULL, NULL, '检验开始时间', 'PlanStartTime', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9750, NULL, NULL, 1, 'datetime', 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1677, NULL, NULL, NULL, NULL, '检验结束时间', 'PlanEndTime', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9700, NULL, NULL, 1, 'datetime', 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1678, NULL, NULL, NULL, NULL, '处理记录ID', 'DisposalRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, NULL, NULL, NULL, 1100, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1679, NULL, NULL, NULL, NULL, '检验人', 'ResponsiblePerson', 'string', 90, NULL, NULL, NULL, NULL, '用户列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9650, NULL, NULL, 1, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1680, NULL, NULL, NULL, NULL, '不良品ID', 'DefectiveID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, NULL, NULL, NULL, 1050, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1681, NULL, NULL, NULL, NULL, '计划状态', 'PlanStatus', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1682, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1683, NULL, NULL, NULL, NULL, '处理人', 'DisposalPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 1000, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1684, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1685, NULL, NULL, NULL, NULL, '处理开始时间', 'DisposalStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 950, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1686, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1687, NULL, NULL, NULL, NULL, '处理结束时间', 'DisposalEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 900, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1688, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1689, NULL, NULL, NULL, NULL, '处理结果', 'DisposalResult', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 850, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1690, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:50:26', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1691, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1692, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:50:26', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlan', 80);
INSERT INTO "public"."Sys_TableColumn" VALUES (1693, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 750, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1694, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 700, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1695, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 650, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1696, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 600, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1697, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 550, NULL, NULL, NULL, NULL, NULL, 'MES_DefectiveProductDisposalRecord', 81);
INSERT INTO "public"."Sys_TableColumn" VALUES (1698, NULL, NULL, NULL, NULL, '明细ID', 'InspectionPlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:48:10', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1699, NULL, NULL, NULL, NULL, '检验id', 'InspectionPlanID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 01:48:10', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1700, NULL, NULL, NULL, NULL, '检验物料', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, '物料列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1701, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1702, NULL, NULL, NULL, NULL, '物料规格', 'MaterialSpecification', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1703, NULL, NULL, NULL, NULL, '检验数量', 'QuantityToInspect', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1704, NULL, NULL, NULL, NULL, '检验方法', 'InspectionMethod', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1705, NULL, NULL, NULL, NULL, '检验标准', 'InspectionStandard', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1706, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1707, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1708, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1709, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1710, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:48:10', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1711, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:48:10', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionPlanDetail', 82);
INSERT INTO "public"."Sys_TableColumn" VALUES (1712, NULL, NULL, NULL, NULL, '排班计划ID', 'SchedulePlanID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 02:00:34', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1713, NULL, NULL, NULL, NULL, '排班名称', 'PlanName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1714, NULL, NULL, NULL, NULL, '产线名称', 'ProductionLine', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 1000, NULL, NULL, 1, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1715, NULL, NULL, NULL, NULL, '班组名称', 'TeamName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 950, NULL, NULL, 1, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1716, NULL, NULL, NULL, NULL, '处理记录ID', 'DisposalRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, NULL, NULL, NULL, 1150, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1717, NULL, NULL, NULL, NULL, '开始时间', 'StartDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 7, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 900, NULL, NULL, 1, 'datetime', 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1718, NULL, NULL, NULL, NULL, '检验记录ID', 'InspectionRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 36, NULL, NULL, NULL, 1100, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1719, NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 850, NULL, NULL, 1, 'datetime', 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1720, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1721, NULL, NULL, NULL, NULL, '处理方法（如返工、降级使用、报废）', 'DisposalMethod', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 1050, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1722, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1723, NULL, NULL, NULL, NULL, '处理人', 'DisposalPerson', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 1000, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1724, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1725, NULL, NULL, NULL, NULL, '处理开始时间', 'DisposalStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 950, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1726, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1727, NULL, NULL, NULL, NULL, '处理结束时间', 'DisposalEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 900, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1728, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 02:00:34', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1729, NULL, NULL, NULL, NULL, '处理结果', 'DisposalResult', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 850, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1730, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:00:34', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_SchedulingPlan', 84);
INSERT INTO "public"."Sys_TableColumn" VALUES (1731, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1732, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 750, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1733, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 700, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1734, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 650, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1735, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 600, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1736, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 550, NULL, NULL, NULL, NULL, NULL, 'MES_NonConformingProductDisposalRecord', 83);
INSERT INTO "public"."Sys_TableColumn" VALUES (1737, NULL, NULL, NULL, NULL, '检验记录ID', 'InspectionRecordID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:56:36', 1, 1300, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1738, NULL, NULL, NULL, NULL, '检验计划明细ID', 'InspectionPlanDetailID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 01:56:36', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1739, NULL, NULL, NULL, NULL, '检验单号', 'InspectionNumber', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1740, NULL, NULL, NULL, NULL, '检验员', 'Inspector', 'string', 70, NULL, NULL, NULL, NULL, '用户列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1741, NULL, NULL, NULL, NULL, '检验时间', 'InspectionTime', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 1100, NULL, NULL, NULL, NULL, 1, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1742, NULL, NULL, NULL, NULL, '实际检验数量', 'InspectedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1743, NULL, NULL, NULL, NULL, '合格数量', 'PassedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 1000, NULL, NULL, NULL, NULL, 1, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1744, NULL, NULL, NULL, NULL, '不合格数量', 'FailedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 950, NULL, NULL, NULL, NULL, 1, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1745, NULL, NULL, NULL, NULL, '检验结果', 'InspectionResult', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1746, NULL, NULL, NULL, 12, '缺陷描述', 'DefectDescription', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 10, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1747, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1748, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 1, 100, '超级管理员', '2025-03-19 01:56:36', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1749, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1750, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1751, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 01:56:36', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1805, NULL, NULL, NULL, NULL, '单台用量', 'UsageQty', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1752, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:56:36', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_QualityInspectionRecord', 85);
INSERT INTO "public"."Sys_TableColumn" VALUES (1753, NULL, NULL, NULL, NULL, '物料编码', 'MaterialCode', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:17:16', 1, 9900, NULL, NULL, 1, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1754, NULL, NULL, NULL, NULL, '物料图片', 'Img', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 16, 'img', NULL, 1, 1, 1, 0, 1, 0, 2000, '超级管理员', '2025-03-17 11:17:16', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1755, NULL, NULL, NULL, NULL, '分类ID', 'CatalogID', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 11:36:05', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1759, NULL, NULL, NULL, NULL, '上级分类', 'ParentId', 'string', 110, NULL, NULL, NULL, NULL, '物料分类', NULL, 7, 'cascader', NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 11:36:05', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1760, NULL, NULL, NULL, NULL, '启用状态', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, 'enable', NULL, 8, 'radio', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9700, NULL, NULL, 1, 'select', 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1761, NULL, NULL, NULL, NULL, '备注信息', 'Remarks', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 9, 'textarea', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1762, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1763, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9550, NULL, NULL, 1, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1764, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9500, NULL, NULL, 1, 'datetime', 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1765, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1766, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1767, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 11:36:05', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1768, NULL, NULL, NULL, NULL, '物料分类', 'CatalogID', 'string', 120, NULL, NULL, NULL, NULL, '物料分类', NULL, 3, 'cascader', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 11:17:16', 1, 9750, NULL, NULL, NULL, NULL, 0, 'MES_Material', 59);
INSERT INTO "public"."Sys_TableColumn" VALUES (1769, NULL, NULL, NULL, NULL, '分类编码', 'CatalogCode', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9850, NULL, NULL, 1, 'like', 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1770, NULL, NULL, NULL, NULL, '分类名称', 'CatalogName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9900, NULL, NULL, 1, 'like', 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1771, NULL, NULL, NULL, NULL, '分类类型', 'CatalogType', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 11:36:05', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_MaterialCatalog', 86);
INSERT INTO "public"."Sys_TableColumn" VALUES (1772, NULL, NULL, NULL, NULL, '订单数量', 'OrderQty', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:20:52', 1, 9700, NULL, NULL, NULL, NULL, 1, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1773, NULL, NULL, NULL, NULL, '优先级', 'LV', 'string', 70, NULL, NULL, NULL, NULL, '优先级', NULL, 4, 'select', NULL, 1, 1, NULL, 0, 1, 0, 255, '超级管理员', '2025-03-19 01:20:52', 1, 9650, NULL, NULL, NULL, NULL, 1, 'MES_ProductionOrder', 71);
INSERT INTO "public"."Sys_TableColumn" VALUES (1774, NULL, NULL, NULL, NULL, '工时(小时)', 'ReportHour', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'decimal', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 15:57:59', 1, 9700, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReportingDetail', 78);
INSERT INTO "public"."Sys_TableColumn" VALUES (1775, NULL, NULL, NULL, NULL, '工时(小时)', 'ReportHour', 'decimal', 110, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9550, NULL, NULL, NULL, NULL, 1, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1776, NULL, NULL, NULL, NULL, '报工数量', 'Total', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9700, NULL, NULL, 1, 'range', 1, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1777, NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', 90, NULL, NULL, NULL, NULL, 'audit', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9500, NULL, NULL, 1, 'select', 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1778, NULL, NULL, NULL, NULL, '审批人', 'Auditor', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-18 16:02:05', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1779, NULL, NULL, NULL, NULL, '合格数量', 'AcceptedQuantity', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1780, NULL, NULL, NULL, NULL, '不合格数量', 'RejectedQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-18 16:02:05', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_ProductionReporting', 77);
INSERT INTO "public"."Sys_TableColumn" VALUES (1781, NULL, NULL, NULL, NULL, 'ID', 'BomId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 01:33:37', 1, 1350, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1782, NULL, NULL, NULL, NULL, 'BOM编号', 'Code', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 1300, NULL, NULL, 1, 'like', 1, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1784, NULL, NULL, NULL, NULL, '母件物料编码', 'MaterialCode', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-19 01:33:37', 1, 1200, NULL, NULL, 1, 'like', 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1785, NULL, NULL, NULL, NULL, '母件物料名称', 'MaterialName', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 300, '超级管理员', '2025-03-19 01:33:37', 1, 1150, NULL, NULL, 1, 'like', 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1786, NULL, NULL, NULL, NULL, '规格型号', 'Spec', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, '超级管理员', '2025-03-19 01:33:37', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1787, NULL, NULL, NULL, NULL, '用途', 'Purpose', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1788, NULL, NULL, NULL, NULL, '版本', 'Edition', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1789, NULL, NULL, NULL, NULL, '有效日期', 'EffectiveDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 950, NULL, NULL, 1, 'date', 1, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1790, NULL, NULL, NULL, NULL, '失效日期', 'InvalidDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'date', NULL, 1, 1, 4, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 900, NULL, NULL, NULL, NULL, 1, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1791, NULL, NULL, NULL, NULL, '启用状态', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1792, NULL, NULL, NULL, NULL, '创建人', 'CreateID', 'int', 70, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1793, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1794, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1795, NULL, NULL, NULL, NULL, '更新人', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1796, NULL, NULL, NULL, NULL, '更新人名称', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 01:33:37', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1797, NULL, NULL, NULL, NULL, '更新时间', 'ModifyDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 01:33:37', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Main', 87);
INSERT INTO "public"."Sys_TableColumn" VALUES (1798, NULL, NULL, NULL, NULL, 'ID', 'DomDetailId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-19 02:58:35', 1, 1450, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1799, NULL, NULL, NULL, NULL, 'BomId', 'BomId', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-19 02:58:35', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1800, NULL, NULL, NULL, NULL, '序号', 'Sequence', 'int', 50, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 1350, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1802, NULL, NULL, NULL, NULL, '子件物料编码', 'MaterialCode', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-19 02:58:35', 1, 1250, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1803, NULL, NULL, NULL, NULL, '子件物料名称', 'MaterialName', 'string', 130, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 300, '超级管理员', '2025-03-19 02:58:35', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1804, NULL, NULL, NULL, NULL, '规格型号', 'Spec', 'string', 80, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-19 02:58:35', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1806, NULL, NULL, NULL, NULL, '消耗方式', 'ConsumeModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-19 02:58:35', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1807, NULL, NULL, NULL, NULL, '投料仓库', 'Warehouse', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-19 02:58:35', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1808, NULL, NULL, NULL, NULL, '供应商', 'SupplierCode', 'string', 120, NULL, NULL, NULL, NULL, '供应商', NULL, 7, 'select', NULL, 1, 1, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 02:58:35', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1809, NULL, NULL, NULL, NULL, '齐套比例', 'KitScale', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1810, NULL, NULL, NULL, NULL, '启用状态', 'Enable', 'int', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1811, NULL, NULL, NULL, NULL, '创建人', 'CreateID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1812, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 02:58:35', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1813, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1814, NULL, NULL, NULL, NULL, '更新人', 'ModifyID', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1815, NULL, NULL, NULL, NULL, '更新人名称', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, '超级管理员', '2025-03-19 02:58:35', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1816, NULL, NULL, NULL, NULL, '更新时间', 'ModifyDate', 'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
INSERT INTO "public"."Sys_TableColumn" VALUES (1817, NULL, NULL, NULL, NULL, '', 'RoleName', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8850, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1818, NULL, NULL, NULL, NULL, '', 'Tel', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 20, '超级管理员', '2025-03-24 00:55:19', 1, 8800, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1819, NULL, NULL, NULL, NULL, '', 'DeptName', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 150, '超级管理员', '2025-03-24 00:55:19', 1, 8750, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1820, NULL, NULL, NULL, NULL, '', 'Dept_Id', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8700, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1821, NULL, NULL, NULL, NULL, '', 'IsRegregisterPhone', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8650, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1822, NULL, NULL, NULL, NULL, '', 'Address', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8600, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1823, NULL, NULL, NULL, NULL, '', 'AppType', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8550, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1824, NULL, NULL, NULL, NULL, '', 'AuditDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, '超级管理员', '2025-03-24 00:55:19', 1, 8500, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1825, NULL, NULL, NULL, NULL, '', 'AuditStatus', 'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, '超级管理员', '2025-03-24 00:55:19', 1, 8450, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1826, NULL, NULL, NULL, NULL, '', 'Auditor', 'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, '超级管理员', '2025-03-24 00:55:19', 1, 8400, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);
INSERT INTO "public"."Sys_TableColumn" VALUES (1827, NULL, NULL, NULL, NULL, '', 'Mobile', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-24 00:55:19', 1, 8350, NULL, NULL, NULL, NULL, 0, 'Sys_User', 6);

-- ----------------------------
-- Table structure for Sys_TableInfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_TableInfo";
CREATE TABLE "public"."Sys_TableInfo" (
  "Table_Id" int4 NOT NULL DEFAULT nextval('sys_tableinfo_id_seq'::regclass),
  "CnName" varchar(50) COLLATE "pg_catalog"."default",
  "ColumnCNName" varchar(100) COLLATE "pg_catalog"."default",
  "DBServer" text COLLATE "pg_catalog"."default",
  "DataTableType" varchar(200) COLLATE "pg_catalog"."default",
  "DetailCnName" varchar(200) COLLATE "pg_catalog"."default",
  "DetailName" varchar(200) COLLATE "pg_catalog"."default",
  "EditorType" varchar(100) COLLATE "pg_catalog"."default",
  "Enable" int4,
  "ExpressField" varchar(200) COLLATE "pg_catalog"."default",
  "FolderName" varchar(200) COLLATE "pg_catalog"."default",
  "Namespace" varchar(200) COLLATE "pg_catalog"."default",
  "OrderNo" int4,
  "ParentId" int4,
  "RichText" varchar(100) COLLATE "pg_catalog"."default",
  "SortName" varchar(50) COLLATE "pg_catalog"."default",
  "TableName" varchar(50) COLLATE "pg_catalog"."default",
  "TableTrueName" varchar(100) COLLATE "pg_catalog"."default",
  "UploadField" varchar(100) COLLATE "pg_catalog"."default",
  "UploadMaxCount" int4
)
;

-- ----------------------------
-- Records of Sys_TableInfo
-- ----------------------------
INSERT INTO "public"."Sys_TableInfo" VALUES (2, '角色管理', '角色管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, 'RoleName', 'System', 'VOL.Sys', NULL, 8, NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (3, '字典数据', '字典数据', 'SysDbContext', NULL, '字典明细', 'Sys_DictionaryList', NULL, 0, 'DicName', 'System', 'VOL.Sys', NULL, 15, NULL, NULL, 'Sys_Dictionary', 'Sys_Dictionary', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (4, '字典明细', '字典明细', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.System', NULL, 15, NULL, NULL, 'Sys_DictionaryList', 'Sys_DictionaryList', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (5, '系统日志', '系统日志', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.Sys', NULL, 10, NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (6, NULL, '用户管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, 'UserName', 'System', 'VOL.Sys', NULL, 8, NULL, '', 'Sys_User', 'Sys_User', 'HeadImageUrl', 1);
INSERT INTO "public"."Sys_TableInfo" VALUES (8, '用户基础信息', '用户管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.Sys', 200, 0, NULL, NULL, '无', '无', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (10, '日志管理', '日志管理', 'SysDbContext', NULL, NULL, NULL, NULL, 0, NULL, 'System', 'VOL.Sys', NULL, 0, NULL, '170', '日志管理', '日志管理', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (14, '部门管理', '组织架构', 'SysDbContext', NULL, NULL, NULL, NULL, 1, 'DepartmentName', 'System', 'VOL.Sys', NULL, 8, NULL, 'DepartmentName', 'Sys_Department', 'Sys_Department', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (15, '系统设置', '系统设置', 'SysDbContext', NULL, NULL, NULL, NULL, 1, NULL, '系统设置', 'ZL.System', NULL, 0, NULL, NULL, '系统设置', '系统设置', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (19, '用户部门', '用户组织部门', 'SysDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.Sys', NULL, 8, NULL, 'CreateDate', 'Sys_UserDepartment', 'Sys_UserDepartment', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (20, '省市区县', '省市区县', 'SysDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'System', 'VOL.Sys', NULL, 15, NULL, NULL, 'Sys_Region', 'Sys_Region', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (33, '审批流程', '审批流程配置', 'SysDbContext', NULL, '审批步骤', 'Sys_WorkFlowStep', NULL, 1, 'WorkName', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlow', 'Sys_WorkFlow', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (34, '审批节点', '审批节点配置', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowStep', 'Sys_WorkFlowStep', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (35, '审批流程', '审批流程', NULL, NULL, '审批节点', 'Sys_WorkFlowTableStep', NULL, 1, '', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowTable', 'Sys_WorkFlowTable', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (36, '审批节点', '审批节点', NULL, NULL, NULL, NULL, NULL, 1, '', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowTableStep', 'Sys_WorkFlowTableStep', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (37, '定时任务', '定时任务', NULL, NULL, NULL, NULL, NULL, 1, 'TaskName', 'Quartz', 'VOL.System', NULL, 15, NULL, 'TaskName', 'Sys_QuartzOptions', 'Sys_QuartzOptions', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (38, '执行记录', '执行记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Quartz', 'VOL.System', NULL, 15, NULL, 'StratDate', 'Sys_QuartzLog', 'Sys_QuartzLog', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (39, '审批记录', '审批记录', NULL, NULL, NULL, NULL, NULL, 1, '', 'flow', 'VOL.System', NULL, 15, NULL, 'CreateDate', 'Sys_WorkFlowTableAuditLog', 'Sys_WorkFlowTableAuditLog', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (54, 'MES业务', 'MES业务', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 0, NULL, NULL, 'MES业务', NULL, NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (55, '客户管理', '客户管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'CustomerName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Customer', 'MES_Customer', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (56, '供应商', '供应商', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'SupplierName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Supplier', 'MES_Supplier', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (57, '仓库管理', '仓库管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'WarehouseCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_WarehouseManagement', 'MES_WarehouseManagement', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (58, '产线设备', '产线设备', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionLineDevice', 'MES_ProductionLineDevice', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (59, '物料管理', '物料管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'MaterialCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Material', 'MES_Material', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (61, '产线管理', '产线管理', 'ServiceDbContext', NULL, '产线设备', 'MES_ProductionLineDevice', NULL, 1, 'LineName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionLine', 'MES_ProductionLine', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (62, '库存管理', '库存管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_InventoryManagement', 'MES_InventoryManagement', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (63, '货位管理', '货位管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'LocationCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_LocationManagement', 'MES_LocationManagement', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (64, '产品入库', '产品入库', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'DocumentNo', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductInbound', 'MES_ProductInbound', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (65, '设备维修', '设备维修', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'RepairReason', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentRepair', 'MES_EquipmentRepair', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (66, '产品出库', '产品出库', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'DocumentNo', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductOutbound', 'MES_ProductOutbound', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (67, '设备管理', '设备管理', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'EquipmentCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentManagement', 'MES_EquipmentManagement', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (68, '设备保养', '设备保养', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'MaintenanceContent', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentMaintenance', 'MES_EquipmentMaintenance', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (69, '设备故障', '设备故障', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'FaultDescription', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_EquipmentFaultRecord', 'MES_EquipmentFaultRecord', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (70, '工序管理', '工序管理', 'ServiceDbContext', NULL, '工艺路线', 'MES_ProcessRoute', NULL, 1, 'ProcessCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Process', 'MES_Process', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (71, '生产订单', '生产订单', 'ServiceDbContext', NULL, '订单明细', 'MES_ProductionPlanDetail', NULL, 1, 'OrderNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionOrder', 'MES_ProductionOrder', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (72, '工序统计', '工序统计', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProcessReport', 'MES_ProcessReport', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (73, '工线路线', '工线路线', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'ProductName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProcessRoute', 'MES_ProcessRoute', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (74, '订单明细表', '订单明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionPlanDetail', 'MES_ProductionPlanDetail', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (76, '变更记录', '变更记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'OrderNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionPlanChangeRecord', 'MES_ProductionPlanChangeRecord', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (77, '生产报工', '生产报工', 'ServiceDbContext', NULL, '报工明细', 'MES_ProductionReportingDetail', NULL, 1, 'ReportingNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionReporting', 'MES_ProductionReporting', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (78, '报工明细', '报工明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_ProductionReportingDetail', 'MES_ProductionReportingDetail', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (79, '生产不良记录', '生产不良记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_DefectiveProductRecord', 'MES_DefectiveProductRecord', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (80, '质量检验', '质量检验', 'ServiceDbContext', NULL, '质检明细', 'MES_QualityInspectionPlanDetail', NULL, 1, 'InspectionPlanNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_QualityInspectionPlan', 'MES_QualityInspectionPlan', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (81, '不良处理记录', '不良处理记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_DefectiveProductDisposalRecord', NULL, NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (82, '质检明细', '质检明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_QualityInspectionPlanDetail', 'MES_QualityInspectionPlanDetail', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (83, '不合格记录', '不合格记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_NonConformingProductDisposalRecord', NULL, NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (84, '排班计划', '排班计划', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'PlanName', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_SchedulingPlan', 'MES_SchedulingPlan', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (85, '质检记录', '质检记录', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'InspectionNumber', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_QualityInspectionRecord', 'MES_QualityInspectionRecord', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (86, '物料分类', '物料分类', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'CatalogCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_MaterialCatalog', 'MES_MaterialCatalog', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (87, '制造BOM', '制造BOM', 'ServiceDbContext', NULL, 'BOM明细', 'MES_Bom_Detail', NULL, 1, 'Code', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Bom_Main', 'MES_Bom_Main', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (88, 'BOM明细', 'BOM明细', 'ServiceDbContext', NULL, NULL, NULL, NULL, 1, 'MaterialCode', 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'MES_Bom_Detail', 'MES_Bom_Detail', NULL, NULL);

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_User";
CREATE TABLE "public"."Sys_User" (
  "User_Id" int4 NOT NULL DEFAULT nextval('sys_user_id_seq'::regclass),
  "Role_Id" int4 NOT NULL,
  "RoleName" varchar(200) COLLATE "pg_catalog"."default",
  "PhoneNo" varchar(11) COLLATE "pg_catalog"."default",
  "Remark" varchar(200) COLLATE "pg_catalog"."default",
  "Tel" varchar(20) COLLATE "pg_catalog"."default",
  "UserName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "UserPwd" varchar(200) COLLATE "pg_catalog"."default",
  "UserTrueName" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "DeptName" varchar(150) COLLATE "pg_catalog"."default",
  "Dept_Id" int4,
  "Email" varchar(100) COLLATE "pg_catalog"."default",
  "Enable" int2 NOT NULL,
  "Gender" int4,
  "HeadImageUrl" text COLLATE "pg_catalog"."default",
  "IsRegregisterPhone" int4,
  "LastLoginDate" timestamp(6),
  "LastModifyPwdDate" timestamp(6),
  "Address" varchar(200) COLLATE "pg_catalog"."default",
  "AppType" int4,
  "AuditDate" timestamp(6),
  "AuditStatus" int4,
  "Auditor" varchar(200) COLLATE "pg_catalog"."default",
  "OrderNo" int4,
  "Token" text COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "CreateDate" timestamp(6),
  "Creator" varchar(200) COLLATE "pg_catalog"."default",
  "Mobile" varchar(100) COLLATE "pg_catalog"."default",
  "Modifier" varchar(200) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "DeptIds" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO "public"."Sys_User" VALUES (3362, 2, '无', NULL, '。。', NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', 'Admin测试', NULL, NULL, NULL, 1, 0, 'Upload/Tables/Sys_User/202305131011047216/wechat.jpg', 1, NULL, '2019-09-22 23:03:34', '北京市还没注册', 1, '2019-08-18 00:54:06', 1, '超级管理员', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTc0Mjc1MzkzOCIsIm5iZiI6IjE3NDI3NTM5MzgiLCJleHAiOiIxNzQyNzYxMTM4IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.71p1QYrDjr8GMRU1BOFSDK9adDquZ0UHj8xinA4mRVM', NULL, '2019-08-13 14:24:27', NULL, '01012345678', '超级管理员', '2023-05-13 17:09:41', 1, 'e5d8e8af-3659-454c-aa8e-c201c7edbcfb,ec238385-f907-44de-b99b-0eddcffa6750');
INSERT INTO "public"."Sys_User" VALUES (1, 1, '无', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', NULL, 0, '283591387@qq.com', 1, 1, 'Upload/Tables/Sys_User/202305131010574561/wechat.jpg', 0, '2017-08-28 09:58:55', '2019-12-14 15:14:23', '北京市西城区', 1, '2019-08-18 00:54:06', 1, '超级管理员', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTc1MjQ4ODAyOSIsIm5iZiI6IjE3NTI0ODgwMjkiLCJleHAiOiIxNzUyNDk1MjI5IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.6NjyX4RJkdC2arjdxhbkyBWfy9y2nz9HHF1b8aHP1WU', NULL, '2012-06-10 11:10:03', NULL, NULL, '超级管理员', '2025-07-14 18:31:29', 1, NULL);

-- ----------------------------
-- Table structure for Sys_UserDepartment
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_UserDepartment";
CREATE TABLE "public"."Sys_UserDepartment" (
  "Id" uuid NOT NULL,
  "UserId" int4 NOT NULL,
  "DepartmentId" uuid NOT NULL,
  "Enable" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(255) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(255) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;

-- ----------------------------
-- Records of Sys_UserDepartment
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_WorkFlow
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_WorkFlow";
CREATE TABLE "public"."Sys_WorkFlow" (
  "WorkFlow_Id" uuid NOT NULL,
  "WorkName" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "WorkTable" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "WorkTableName" varchar(200) COLLATE "pg_catalog"."default",
  "NodeConfig" text COLLATE "pg_catalog"."default",
  "LineConfig" text COLLATE "pg_catalog"."default",
  "Remark" text COLLATE "pg_catalog"."default",
  "Weight" int4,
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Enable" int2,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "AuditingEdit" int4
)
;
COMMENT ON COLUMN "public"."Sys_WorkFlow"."WorkName" IS '流程名称';
COMMENT ON COLUMN "public"."Sys_WorkFlow"."WorkTable" IS '表名';
COMMENT ON COLUMN "public"."Sys_WorkFlow"."WorkTableName" IS '功能菜单';
COMMENT ON COLUMN "public"."Sys_WorkFlow"."NodeConfig" IS '节点信息';
COMMENT ON COLUMN "public"."Sys_WorkFlow"."LineConfig" IS '连接配置';
COMMENT ON COLUMN "public"."Sys_WorkFlow"."Remark" IS '备注';
COMMENT ON COLUMN "public"."Sys_WorkFlow"."Weight" IS '权重';

-- ----------------------------
-- Records of Sys_WorkFlow
-- ----------------------------
INSERT INTO "public"."Sys_WorkFlow" VALUES ('28e37aa6-b6df-4af2-8188-a68b0571f650', '生产报工审批', 'MES_ProductionReporting', '生产报工', '[{\"id\":\"jg8cp5ijz\",\"name\":\"报工提交\",\"type\":\"start\",\"left\":\"282px\",\"top\":\"15px\",\"ico\":\"el-icon-time\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[],\"deptId\":[]},{\"id\":\"hetlnr7jm\",\"name\":\"报工数量<=500\",\"type\":\"node\",\"left\":\"77px\",\"top\":\"137px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[{\"field\":\"Total\",\"value\":\"500\",\"filterType\":\"<=\",\"data\":null}],\"userId\":[],\"roleId\":[2],\"deptId\":[],\"auditType\":2},{\"id\":\"w9v2ssg9e8\",\"name\":\"流程结束\",\"type\":\"end\",\"left\":\"306.4px\",\"top\":\"539.4px\",\"ico\":\"el-icon-switch-button\",\"state\":\"success\"},{\"id\":\"gu2g24vswf\",\"name\":\"管理员审批\",\"type\":\"node\",\"left\":\"76px\",\"top\":\"277px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[1],\"roleId\":[],\"deptId\":[],\"auditType\":1},{\"id\":\"4zlt54it3\",\"name\":\"报工数量>500\",\"type\":\"node\",\"left\":\"539px\",\"top\":\"129px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[{\"field\":\"Total\",\"value\":\"500\",\"filterType\":\">\",\"data\":null}],\"userId\":[3362],\"roleId\":[],\"deptId\":[],\"auditType\":1},{\"id\":\"34ltn0ou0l\",\"name\":\"线长审批\",\"type\":\"node\",\"left\":\"307px\",\"top\":\"217px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[],\"deptId\":[\"ec238385-f907-44de-b99b-0eddcffa6750\"],\"auditType\":3},{\"id\":\"yxkuhlh3no\",\"name\":\"主管审批\",\"type\":\"node\",\"left\":\"76px\",\"top\":\"400px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[2],\"deptId\":[],\"auditType\":2},{\"id\":\"ug7mqx18yf\",\"name\":\"经理审批\",\"type\":\"node\",\"left\":\"539px\",\"top\":\"280px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[],\"roleId\":[4],\"deptId\":[],\"auditType\":2},{\"id\":\"sgjixpmavv\",\"name\":\"二次审批\",\"type\":\"node\",\"left\":\"307px\",\"top\":\"400px\",\"ico\":\"el-icon-news\",\"state\":\"success\",\"filters\":[],\"userId\":[1],\"roleId\":[],\"deptId\":[],\"auditType\":1}]', '[{\"from\":\"jg8cp5ijz\",\"to\":\"hetlnr7jm\",\"label\":\"x\"},{\"from\":\"hetlnr7jm\",\"to\":\"gu2g24vswf\",\"label\":\"x\"},{\"from\":\"jg8cp5ijz\",\"to\":\"4zlt54it3\",\"label\":\"x\"},{\"from\":\"4zlt54it3\",\"to\":\"34ltn0ou0l\",\"label\":\"x\"},{\"from\":\"gu2g24vswf\",\"to\":\"yxkuhlh3no\",\"label\":\"x\"},{\"from\":\"yxkuhlh3no\",\"to\":\"w9v2ssg9e8\",\"label\":\"x\"},{\"from\":\"4zlt54it3\",\"to\":\"ug7mqx18yf\",\"label\":\"x\"},{\"from\":\"34ltn0ou0l\",\"to\":\"sgjixpmavv\",\"label\":\"x\"},{\"from\":\"sgjixpmavv\",\"to\":\"w9v2ssg9e8\",\"label\":\"x\"},{\"from\":\"ug7mqx18yf\",\"to\":\"w9v2ssg9e8\",\"label\":\"x\"}]', NULL, 1, '2025-03-24 02:04:32', 1, '超级管理员', 1, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for Sys_WorkFlowStep
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_WorkFlowStep";
CREATE TABLE "public"."Sys_WorkFlowStep" (
  "WorkStepFlow_Id" uuid NOT NULL,
  "WorkFlow_Id" uuid,
  "StepId" varchar(100) COLLATE "pg_catalog"."default",
  "StepName" varchar(200) COLLATE "pg_catalog"."default",
  "StepType" int4,
  "StepValue" text COLLATE "pg_catalog"."default",
  "OrderId" int4,
  "Remark" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Enable" int2,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "NextStepIds" text COLLATE "pg_catalog"."default",
  "ParentId" text COLLATE "pg_catalog"."default",
  "AuditRefuse" int4,
  "AuditBack" int4,
  "AuditMethod" int4,
  "SendMail" int4,
  "Filters" text COLLATE "pg_catalog"."default",
  "StepAttrType" varchar(50) COLLATE "pg_catalog"."default",
  "Weight" int4
)
;
COMMENT ON COLUMN "public"."Sys_WorkFlowStep"."WorkFlow_Id" IS '流程主表id';
COMMENT ON COLUMN "public"."Sys_WorkFlowStep"."StepId" IS '流程节点Id';
COMMENT ON COLUMN "public"."Sys_WorkFlowStep"."StepName" IS '节点名称';
COMMENT ON COLUMN "public"."Sys_WorkFlowStep"."StepType" IS '节点类型(1=按用户审批,2=按角色审批)';
COMMENT ON COLUMN "public"."Sys_WorkFlowStep"."StepValue" IS '审批用户id或角色id';
COMMENT ON COLUMN "public"."Sys_WorkFlowStep"."Remark" IS '备注';

-- ----------------------------
-- Records of Sys_WorkFlowStep
-- ----------------------------
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('06bebb63-c97b-4271-b3a9-5a558e94c991', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'w9v2ssg9e8', '流程结束', NULL, NULL, 8, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'ug7mqx18yf,yxkuhlh3no,sgjixpmavv', NULL, NULL, NULL, NULL, NULL, 'end', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('11436d51-6cb2-4297-8788-44cc6845ab67', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'jg8cp5ijz', '报工提交', NULL, NULL, 0, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'start', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('172bbfde-4001-4978-b48a-fd6ea90d2363', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'gu2g24vswf', '管理员审批', 1, '1', 3, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'hetlnr7jm', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('698574c7-17c5-4627-8e47-17dc57b80715', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'hetlnr7jm', '报工数量<=500', 2, '2', 1, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'jg8cp5ijz', NULL, NULL, NULL, NULL, '[{\"field\":\"Total\",\"filterType\":\"<=\",\"value\":\"500\"}]', 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('6f649af9-7201-4609-ba06-961d5c4f3155', '28e37aa6-b6df-4af2-8188-a68b0571f650', '4zlt54it3', '报工数量>500', 1, '3362', 2, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'jg8cp5ijz', NULL, NULL, NULL, NULL, '[{\"field\":\"Total\",\"filterType\":\">\",\"value\":\"500\"}]', 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('ad9bb226-f047-4f8f-b69b-8dabd4fe1043', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'ug7mqx18yf', '经理审批', 2, '4', 5, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '4zlt54it3', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('c130466f-6165-429f-a2a0-6962554cfa5c', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'sgjixpmavv', '二次审批', 1, '1', 7, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '34ltn0ou0l', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('eaed94b3-f385-4401-8fea-41c40110bc7a', '28e37aa6-b6df-4af2-8188-a68b0571f650', '34ltn0ou0l', '线长审批', 3, 'ec238385-f907-44de-b99b-0eddcffa6750', 4, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '4zlt54it3', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('f65d2016-bb4f-4235-8609-4bdcb30b5085', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'yxkuhlh3no', '主管审批', 2, '2', 6, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'gu2g24vswf', NULL, NULL, NULL, NULL, NULL, 'node', NULL);

-- ----------------------------
-- Table structure for Sys_WorkFlowTable
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_WorkFlowTable";
CREATE TABLE "public"."Sys_WorkFlowTable" (
  "WorkFlowTable_Id" uuid NOT NULL,
  "WorkFlow_Id" uuid,
  "WorkName" varchar(200) COLLATE "pg_catalog"."default",
  "WorkTableKey" varchar(200) COLLATE "pg_catalog"."default",
  "WorkTable" varchar(200) COLLATE "pg_catalog"."default",
  "WorkTableName" varchar(200) COLLATE "pg_catalog"."default",
  "CurrentOrderId" int4,
  "AuditStatus" int4,
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Enable" int2,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "CurrentStepId" varchar(100) COLLATE "pg_catalog"."default",
  "StepName" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."Sys_WorkFlowTable"."WorkTableKey" IS '表主键id';
COMMENT ON COLUMN "public"."Sys_WorkFlowTable"."WorkTable" IS '表名';
COMMENT ON COLUMN "public"."Sys_WorkFlowTable"."WorkTableName" IS '表中文名';

-- ----------------------------
-- Records of Sys_WorkFlowTable
-- ----------------------------
INSERT INTO "public"."Sys_WorkFlowTable" VALUES ('e49271e6-0b1b-455c-a765-74c9c876db48', '28e37aa6-b6df-4af2-8188-a68b0571f650', '生产报工审批', '9356d9e8-8b3a-41c5-a2fc-f805e60ac867', 'MES_ProductionReporting', '生产报工', NULL, 0, '2025-03-24 02:12:41', 1, '超级管理员', 1, NULL, NULL, NULL, 'hetlnr7jm', '报工数量<=500');

-- ----------------------------
-- Table structure for Sys_WorkFlowTableAuditLog
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_WorkFlowTableAuditLog";
CREATE TABLE "public"."Sys_WorkFlowTableAuditLog" (
  "Id" uuid NOT NULL,
  "WorkFlowTable_Id" uuid,
  "WorkFlowTableStep_Id" uuid,
  "StepId" varchar(100) COLLATE "pg_catalog"."default",
  "StepName" varchar(200) COLLATE "pg_catalog"."default",
  "AuditId" int4,
  "Auditor" varchar(100) COLLATE "pg_catalog"."default",
  "AuditStatus" int4,
  "AuditResult" text COLLATE "pg_catalog"."default",
  "AuditDate" timestamp(6),
  "Remark" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6)
)
;

-- ----------------------------
-- Records of Sys_WorkFlowTableAuditLog
-- ----------------------------
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('032a246a-3d95-45ae-a02f-15397fe959a4', '38417b03-d70b-436b-8d24-f60ed5373dc6', 'eee0b9ef-eb93-4680-8dca-658b73c5d797', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-08 16:48:16', NULL, '2023-05-08 16:48:16');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('033009cd-4227-4088-a7f4-0fe956717005', 'f00bf32c-7d32-45b7-ac3e-4e223a6e2dd6', '0f7c0a3c-a0fa-4fb4-9d4d-fbcd441fa449', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:15:57', NULL, '2023-05-13 13:15:57');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('0404929a-1b62-4015-905f-c47b8488c0b5', 'a8a9cd0d-c885-434c-8adc-b0347e05b08a', 'be1dc0bf-96f0-46db-8a02-90362b1b0b38', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '............', '2023-05-13 16:12:02', '............', '2023-05-13 16:12:02');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('04f7dbbd-d36d-4fc0-9222-a87b8475e9f1', 'a8a9cd0d-c885-434c-8adc-b0347e05b08a', 'be1dc0bf-96f0-46db-8a02-90362b1b0b38', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '同意。。。。', '2023-05-13 16:02:58', '同意。。。。', '2023-05-13 16:02:58');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('0760aaf1-644f-4ae8-a28c-959583420365', 'd82f4733-9916-4714-bf35-900ceaa049c1', 'de5133df-9ff7-494d-bb76-c9e457dfebad', 'b9cv1h35jg', '产品部>=7000审批', 3362, 'Admin测试', 1, 'Admin测试管理员同意。。', '2023-05-13 17:11:47', 'Admin测试管理员同意。。', '2023-05-13 17:11:47');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('088bdab5-4bcf-4f12-a5c1-0f2e642ec66c', '7db5447a-7a78-40d8-9585-0aab9375b61f', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:49:18');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('08e13a05-901d-456a-9e96-39abd8054d22', '827ce743-8340-4643-8512-de6b8b998b9c', '4f5a3717-ea97-4e45-bb77-12e95a25523b', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-08 16:36:42', NULL, '2023-05-08 16:36:42');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('09087f8c-4edb-4fbf-bf04-97610d2ee880', '56a6d0fc-5b0d-4748-b436-1868865277c3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:46:23');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('1a21cc26-eb65-4a68-bcea-116f08b43882', '89f87fd9-b1fb-435b-8c92-7870d74214dd', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:20:31');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('1b780830-da10-47cf-aa55-b6049cf1bc6b', '2c0d573d-f81f-4d98-89ff-75804b8bc877', 'd1e0d9f4-2476-43e5-ba73-9a3b6d3431f2', '3nfhu1i4', '<=100', 1, '超级管理员', 0, NULL, '2023-05-13 12:07:42', NULL, '2023-05-13 12:07:42');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('267c2e5b-4b55-4f5d-8a43-2920a08b89fb', '56a6d0fc-5b0d-4748-b436-1868865277c3', '89329eb5-620e-477a-80c5-9261dc1f6c60', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:47:04', NULL, '2023-05-13 13:47:04');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('2ba41a15-768d-49db-80f4-d6b9ff2da546', 'eef3ff36-111e-4398-be9c-7c69e5d2b4c5', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:34:59');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('367ae81d-3be4-4fa3-a5ee-555330b87fbe', 'd82f4733-9916-4714-bf35-900ceaa049c1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 17:07:37');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('37ca151d-b43d-4364-aa6b-e2df02720c07', 'bff474a1-52e2-498b-8557-f7322bf34834', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:36:03');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('3a54ffcb-c687-41b3-a59c-fe287cb0ba38', 'ddd6ea0c-e3db-49ad-8dfe-bb995c23bcf3', 'd6366d71-7fe1-480d-882c-d1b9a8419210', 'mtisrzm4x', '>=200', 1, '超级管理员', 3, '原因不明。。', '2023-05-13 15:37:08', '原因不明。。', '2023-05-13 15:37:08');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('3abfda8b-c565-47cd-b965-9d49bf50f902', '0cd2d3ac-a4b3-42dc-be9b-3f3057b1ac61', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 00:54:50');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('42637473-018e-482e-b952-07e2c4afc0cc', 'cc35e127-2740-40f0-ad5a-6007cf92367e', '3e190afd-64b3-42fa-8c53-db6670d65a9d', 'mtisrzm4x', '>=200', 1, '超级管理员', 1, NULL, '2023-05-13 12:57:36', NULL, '2023-05-13 12:57:36');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('45938d60-e6de-4172-92ef-7f685e0f44e1', 'c46e07fc-6141-4de8-947c-85d312f1972f', '937eb1aa-4c9f-401a-a8e3-cc267a6ab2bc', 'mtisrzm4x', '>=200', 1, '超级管理员', 3, NULL, '2023-05-13 15:35:53', NULL, '2023-05-13 15:35:53');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('47f08e68-5ae1-467b-81f3-8a55072e9794', '60baff11-492d-4e74-8e38-7f2fed2fec8c', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 17:17:47');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('4aa1c64b-10b7-4f9e-83f4-4e9b7db22878', '9fda3a1e-1486-4bf5-bfc4-a217951a7a6a', '94407d86-77a3-4a6b-8cb5-abfa31ac3b0c', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:39:41', NULL, '2023-05-13 12:39:41');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('50d2f620-6fe3-4663-9e78-5cadced87a7f', 'ca8025cd-4b66-4127-b9d6-d9ead3d23705', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:39:57');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('576493c9-c755-4ef5-98c4-401d5bafc5a2', 'cc35e127-2740-40f0-ad5a-6007cf92367e', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:56:24');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('59dd8bcd-eddf-4882-a0e0-247844dec5e7', 'b58589a0-04a1-432e-accb-76c9c22c8bc9', 'fa069866-db1f-47f9-bb88-0132e42f7b4f', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:14:35', NULL, '2023-05-13 12:14:35');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('5ff227a0-5138-4145-ae8d-e03ea3a55cc3', '8e60e09e-cda6-4baa-b452-370dea64ada4', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 16:33:45');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('6306b03c-7c1f-4912-9b44-ceffcc609267', '75d7fb3f-049e-4103-8f6a-9f3e0d3ebb3a', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:47:17');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('673b5f2a-d798-4120-8bce-077dc208a047', 'c46e07fc-6141-4de8-947c-85d312f1972f', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 14:17:56');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('685b461f-1a68-4498-87c1-f00ee5d2f0b3', '9fda3a1e-1486-4bf5-bfc4-a217951a7a6a', '94407d86-77a3-4a6b-8cb5-abfa31ac3b0c', 'mtisrzm4x', '>=200', 1, '超级管理员', 1, NULL, '2023-05-13 12:54:29', NULL, '2023-05-13 12:54:29');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('69bfbd14-cdc2-4d70-8625-819490946116', '2d019ae7-22bb-4d25-8d06-2b4444c22c6f', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:07:14');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('6d9ae3c7-f802-4e31-ba8e-0a27acf3951d', 'a8a9cd0d-c885-434c-8adc-b0347e05b08a', '4ed73980-2e6e-4052-9722-695375d93303', 'xk0xirr5zf', '>=20', 3362, 'Admin测试', 1, '通过。。。。。', '2023-05-13 16:14:57', '通过。。。。。', '2023-05-13 16:14:57');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('6e3e6f00-3dbb-4887-b453-a9fb54fffb5c', '646d440f-2447-44b7-bd35-3690e7d1e5e8', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:49:17');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('71e15ed0-cbcc-4fea-a45e-faaf58758b18', 'd1cd7028-132c-4b97-aec3-071f0ba7da0e', '2ac1ddb2-19b7-412f-8c93-6f70228e5863', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:06:21', NULL, '2023-05-13 12:06:21');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('744382f3-0ae7-48e5-9f97-71908863f7b9', '60baff11-492d-4e74-8e38-7f2fed2fec8c', '4fc4aca8-e0f6-4b57-b66a-4a1bf8dc3f85', 'jkqinw0zc', '用户审批>=5000', 1, '超级管理员', 1, '同意。。。', '2023-05-13 17:17:59', '同意。。。', '2023-05-13 17:17:59');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('77c48d16-1d3e-4ec9-bb50-81308e51c6b1', 'e7e6a63f-3ca0-4d63-a323-790d4680d8c0', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:20:28');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('78105867-bd28-4d35-8739-0c533dc71d67', 'e49271e6-0b1b-455c-a765-74c9c876db48', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2025-03-24 02:12:41');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('85401ee1-c772-4610-b958-6d8c8c3307a7', '0134c7b2-8931-4477-9743-7adda9a4d6df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:42:01');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('860fa141-5321-45b1-8148-7b707f02c8a7', '7db5447a-7a78-40d8-9585-0aab9375b61f', '032eb689-c842-4ebf-b072-6062864b300d', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '同意。。。。', '2023-05-13 15:56:56', '同意。。。。', '2023-05-13 15:56:56');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('86c3310d-af70-45e1-8156-3259aea24c6b', 'b58589a0-04a1-432e-accb-76c9c22c8bc9', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:14:35');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('9053b951-f2fd-40df-8baf-8f267d6126ce', 'e7e6a63f-3ca0-4d63-a323-790d4680d8c0', '4fd17d32-518a-4f9c-80c5-738374f5a846', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:20:44', NULL, '2023-05-13 13:20:44');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('94d7b7ae-e6e1-44f9-b5f0-66f37eb740c2', '1b92e493-11f0-462b-971b-c91ffbe82b42', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 11:47:55');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('987de71a-afcd-4fad-99df-57b4c50192e5', 'd1cd7028-132c-4b97-aec3-071f0ba7da0e', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:06:21');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('9b2c29a0-8c8f-4cde-87c7-a6290a93ed03', '1b92e493-11f0-462b-971b-c91ffbe82b42', '839a2de4-e5be-4fcf-9ad5-8b3b26d791dc', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 11:47:55', NULL, '2023-05-13 11:47:55');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('9cb27636-cef5-4fa0-8ae0-940a759425f2', '2c0d573d-f81f-4d98-89ff-75804b8bc877', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:07:42');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('9f5c12b1-ce50-4f90-b40a-833279872b0a', '9fda3a1e-1486-4bf5-bfc4-a217951a7a6a', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 12:39:40');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('a21b38be-c2df-4edd-8efb-5f2e8e216ec4', '98590873-049b-45c1-8f75-ff7ab22ae0dd', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 14:00:08');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('a4337440-a79e-4c46-bcdd-f279ebc6ab29', '827ce743-8340-4643-8512-de6b8b998b9c', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:36:42');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('b8473b4d-c6fc-49c8-be4f-2e8c8c181f24', 'ed175615-9853-469f-9bee-dac37d4cfe49', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:30:56');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('b9d955f1-05b2-4c16-b877-ff700b2954a7', 'a8a9cd0d-c885-434c-8adc-b0347e05b08a', 'be1dc0bf-96f0-46db-8a02-90362b1b0b38', 'xebxs78ls', 'qty>10', 3362, 'Admin测试', 1, '同意。。。。。', '2023-05-13 16:14:44', '同意。。。。。', '2023-05-13 16:14:44');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('c0b40ad7-1c64-4c0a-b9d0-ea7074075583', '581940d5-848f-4493-9c66-42add81f301c', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:45:41');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('c251c391-3f13-4d05-91c1-591f0ca737d5', 'cc35e127-2740-40f0-ad5a-6007cf92367e', '3e190afd-64b3-42fa-8c53-db6670d65a9d', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 12:56:24', NULL, '2023-05-13 12:56:24');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('c4cf806a-7b5c-49a2-b4a9-721ca3bd4868', 'd82f4733-9916-4714-bf35-900ceaa049c1', '8486b561-6403-4d1c-af33-dd635bf63b8c', 'jkqinw0zc', '用户审批>=5000', 1, '超级管理员', 1, NULL, '2023-05-13 17:10:51', NULL, '2023-05-13 17:10:51');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('c6ab40f6-7a16-4e69-a7c6-f5af695ab473', '646d440f-2447-44b7-bd35-3690e7d1e5e8', '0ad966a6-a5af-4e1b-8764-29a120431351', 'mtisrzm4x', '>=200', 1, '超级管理员', 1, NULL, '2023-05-13 13:49:50', NULL, '2023-05-13 13:49:50');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('d3fbf10d-db09-4a6b-be8e-76d1506ddcd9', 'ddd6ea0c-e3db-49ad-8dfe-bb995c23bcf3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:36:45');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('dcf07982-9eda-4a19-be7e-8f4c33fb32cf', '2d019ae7-22bb-4d25-8d06-2b4444c22c6f', 'ab5de430-5007-4027-b58b-c5eb9b0bfeb8', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:07:25', NULL, '2023-05-13 13:07:25');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('df004942-44bd-4be2-ac42-316e562eeaeb', '38417b03-d70b-436b-8d24-f60ed5373dc6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:48:16');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('e0a80ad6-25be-49ee-b802-4f517991fc0a', 'd82f4733-9916-4714-bf35-900ceaa049c1', 'a2035fc1-334b-4b54-abc9-caaf5c8c7b6d', 'hnoj7gaczc', '超级管理员审批', 1, '超级管理员', 1, '超级管理员同意。。', '2023-05-13 17:12:13', '超级管理员同意。。', '2023-05-13 17:12:13');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('e1c9e5b3-a11e-478c-8169-c39032846c35', '147e53c5-231f-43cc-bba0-ab906a59b6ca', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:17:03');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('e2a55cbf-e68e-4f99-9715-d2dd27ccafe7', '62c8999f-f07e-4d47-827c-b1c4e63af323', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 17:19:06');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('e4ed2781-4d7c-4e87-81ae-16d86538bdf3', 'f00bf32c-7d32-45b7-ac3e-4e223a6e2dd6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:15:57');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('e68f23c0-fa88-4290-b975-11e044a7b7e8', '7f13eaab-f51c-4534-b839-2410501c6693', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:23:44');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('e8fdd20e-21f5-4eff-9cbf-cf810ed95692', 'bff474a1-52e2-498b-8557-f7322bf34834', '7413de5d-100c-4c83-ad91-8e808e6c41f6', 'mtisrzm4x', '>=200', 1, '超级管理员', 2, NULL, '2023-05-08 16:36:03', NULL, '2023-05-08 16:36:03');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('ef0a21c8-5896-4919-a075-bb3a46d4387c', 'a8a9cd0d-c885-434c-8adc-b0347e05b08a', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 15:58:43');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('ef617f6b-3af3-4fa3-9c4d-27c7db775a74', '83005898-c7dc-4c3a-8519-69be2debe83d', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-13 13:52:36');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('f2e57dea-d98b-45fb-bb88-fa4f187f8c8a', '385f83bd-5518-488d-a335-e9ecff0318c0', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:49:32');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('f4dd3674-9f9f-40d7-bcdb-92d35a89f89b', '75d7fb3f-049e-4103-8f6a-9f3e0d3ebb3a', 'e3ec2568-a952-4ae3-a269-67663e39bdf0', 'mtisrzm4x', '>=200', 1, '超级管理员', 0, NULL, '2023-05-13 13:47:50', NULL, '2023-05-13 13:47:50');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('f744c9ed-132f-4294-bc7b-c762201cb1b1', '9768e54c-d8d0-49ee-b943-2416f990c1df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:31:33');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('fa4c6ef4-82d8-455c-8166-3d86da68b09b', 'd5f96ffd-d50b-4581-847c-feee264243da', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 16:32:18');
INSERT INTO "public"."Sys_WorkFlowTableAuditLog" VALUES ('fbf482e7-a0ff-4842-9e37-34bf672e64f3', '2cd8ce25-650c-49ea-abb0-82aa8c6bdf72', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '[超级管理员]提交了数据', '2023-05-08 01:37:42');

-- ----------------------------
-- Table structure for Sys_WorkFlowTableStep
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_WorkFlowTableStep";
CREATE TABLE "public"."Sys_WorkFlowTableStep" (
  "Sys_WorkFlowTableStep_Id" uuid NOT NULL,
  "WorkFlowTable_Id" uuid NOT NULL,
  "WorkFlow_Id" uuid,
  "StepId" varchar(100) COLLATE "pg_catalog"."default",
  "StepName" varchar(200) COLLATE "pg_catalog"."default",
  "StepType" int4,
  "StepValue" text COLLATE "pg_catalog"."default",
  "OrderId" int4,
  "AuditId" int4,
  "Auditor" varchar(50) COLLATE "pg_catalog"."default",
  "AuditStatus" int4,
  "AuditDate" timestamp(6),
  "Remark" text COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Enable" int2,
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4,
  "StepAttrType" varchar(50) COLLATE "pg_catalog"."default",
  "ParentId" text COLLATE "pg_catalog"."default",
  "NextStepId" varchar(100) COLLATE "pg_catalog"."default",
  "Weight" int4
)
;
COMMENT ON COLUMN "public"."Sys_WorkFlowTableStep"."AuditId" IS '审核人id';
COMMENT ON COLUMN "public"."Sys_WorkFlowTableStep"."Auditor" IS '审核人';
COMMENT ON COLUMN "public"."Sys_WorkFlowTableStep"."AuditStatus" IS '审核状态';

-- ----------------------------
-- Records of Sys_WorkFlowTableStep
-- ----------------------------
INSERT INTO "public"."Sys_WorkFlowTableStep" VALUES ('458f5b2b-9ef2-4305-b339-39254587fea2', 'e49271e6-0b1b-455c-a765-74c9c876db48', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'w9v2ssg9e8', '流程结束', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'end', 'yxkuhlh3no', NULL, NULL);
INSERT INTO "public"."Sys_WorkFlowTableStep" VALUES ('aaf29521-2d1f-4fe3-953a-51abdeaf2e22', 'e49271e6-0b1b-455c-a765-74c9c876db48', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'gu2g24vswf', '管理员审批', 1, '1', 2, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'node', 'hetlnr7jm', 'yxkuhlh3no', NULL);
INSERT INTO "public"."Sys_WorkFlowTableStep" VALUES ('babc1a23-a0e9-4d3c-a8ce-9c0eb92be61a', 'e49271e6-0b1b-455c-a765-74c9c876db48', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'jg8cp5ijz', '流程开始', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', 1, '超级管理员', 1, NULL, NULL, NULL, 'start', NULL, 'hetlnr7jm', NULL);
INSERT INTO "public"."Sys_WorkFlowTableStep" VALUES ('d574ce42-88ba-457f-a9ef-fec9dd7b4e8d', 'e49271e6-0b1b-455c-a765-74c9c876db48', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'yxkuhlh3no', '主管审批', 2, '2', 3, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'node', 'gu2g24vswf', 'w9v2ssg9e8', NULL);
INSERT INTO "public"."Sys_WorkFlowTableStep" VALUES ('dd170e44-48bd-4583-a0ac-e482474350fb', 'e49271e6-0b1b-455c-a765-74c9c876db48', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'hetlnr7jm', '报工数量<=500', 2, '2', 1, NULL, NULL, NULL, NULL, NULL, '2025-03-24 02:12:41', NULL, NULL, 1, NULL, NULL, NULL, 'node', 'jg8cp5ijz', 'gu2g24vswf', NULL);

-- ----------------------------
-- Table structure for TestDb
-- ----------------------------
DROP TABLE IF EXISTS "public"."TestDb";
CREATE TABLE "public"."TestDb" (
  "Id" uuid NOT NULL,
  "TestDbName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "TestDbContent" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4
)
;

-- ----------------------------
-- Records of TestDb
-- ----------------------------

-- ----------------------------
-- Table structure for TestService
-- ----------------------------
DROP TABLE IF EXISTS "public"."TestService";
CREATE TABLE "public"."TestService" (
  "Id" uuid NOT NULL,
  "DbName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DbContent" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(30) COLLATE "pg_catalog"."default",
  "Modifier" varchar(30) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6),
  "ModifyID" int4
)
;

-- ----------------------------
-- Records of TestService
-- ----------------------------
INSERT INTO "public"."TestService" VALUES ('c0737155-ac39-4f35-87dc-22dd83896cad', '这是业务数据库', '这是业务数据库。。', '2023-05-19 11:46:34', 3362, '测试管理员', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "public"."products";
CREATE TABLE "public"."products" (
  "id" int4 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(10,2)
)
;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO "public"."products" VALUES (1, '10', NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."products_id_seq"
OWNED BY "public"."products"."id";
SELECT setval('"public"."products_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_city_id_seq"', 501, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dictionary_id_seq"', 1004, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dictionarylist_id_seq"', 1001, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_log_id_seq"', 385, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_menu_id_seq"', 202, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_province_id_seq"', 101, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_role_id_seq"', 11, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_roleauth_id_seq"', 101, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_tablecolumn_id_seq"', 1001, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_tableinfo_id_seq"', 101, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_user_id_seq"', 10001, false);

-- ----------------------------
-- Primary Key structure for table Sys_Dictionary
-- ----------------------------
ALTER TABLE "public"."Sys_Dictionary" ADD CONSTRAINT "Sys_Dictionary_pkey" PRIMARY KEY ("Dic_ID");

-- ----------------------------
-- Primary Key structure for table Sys_DictionaryList
-- ----------------------------
ALTER TABLE "public"."Sys_DictionaryList" ADD CONSTRAINT "Sys_DictionaryList_pkey" PRIMARY KEY ("DicList_ID");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "public"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");
