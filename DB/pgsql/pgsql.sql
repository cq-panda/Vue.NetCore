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

 Date: 24/10/2025 18:16:46
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

-- ----------------------------
-- Table structure for MES_Bom_Detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Bom_Detail";
CREATE TABLE "public"."MES_Bom_Detail" (
  "DomDetailId" uuid NOT NULL,
  "BomId" uuid,
  "Sequence" int4 NOT NULL,
  "MaterialCode" varchar(200) COLLATE "pg_catalog"."default",
  "MaterialName" text COLLATE "pg_catalog"."default",
  "Spec" varchar(200) COLLATE "pg_catalog"."default",
  "UsageQty" numeric(24,3) NOT NULL,
  "ConsumeModel" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "Warehouse" varchar(100) COLLATE "pg_catalog"."default",
  "SupplierCode" varchar(50) COLLATE "pg_catalog"."default",
  "KitScale" numeric(24,3),
  "Enable" int4,
  "CreateID" int4,
  "Creator" varchar(50) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(50) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_Bom_Detail"."DomDetailId" IS 'ID';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."BomId" IS 'Bom编号';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."Sequence" IS '序号';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."MaterialCode" IS '子件物料编码';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."MaterialName" IS '子件物料名称';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."Spec" IS '规格型号';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."UsageQty" IS '单台用量';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."ConsumeModel" IS '消耗方式';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."Warehouse" IS '投料仓库';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."SupplierCode" IS '供应商';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."KitScale" IS '齐套比例';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."Enable" IS '启用状态';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."CreateID" IS '创建人';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."Creator" IS '创建人名称';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."ModifyID" IS '更新人';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."Modifier" IS '更新人名称';
COMMENT ON COLUMN "public"."MES_Bom_Detail"."ModifyDate" IS '更新时间';
COMMENT ON TABLE "public"."MES_Bom_Detail" IS 'BOM明细';

-- ----------------------------
-- Records of MES_Bom_Detail
-- ----------------------------
INSERT INTO "public"."MES_Bom_Detail" VALUES ('401fa70b-ef49-436e-9782-35b6d887759b', '1dc84b0c-2cd7-4709-b488-df42ce36ab88', 1, 'BO01-0002-4', '机壳毛坯p38x66.3', '个', 400.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:33:00', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('531e804a-df10-499b-ab26-775f68cb35ae', 'd57095e6-ef91-4f00-87cb-82e2dbb633d6', 2, 'BO01-0001-2', '机壳毛坯p38x66.2', NULL, 200.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:32:24', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('80dc11d2-ace8-479b-b60c-18454bba5cdb', '1dc84b0c-2cd7-4709-b488-df42ce36ab88', 2, 'BO01-0001-3', '机壳毛坯p38x66.3', '个', 300.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:33:00', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('91ad77cf-f062-4c4f-87b2-7fe6ab942bbf', '0b713f05-5871-471e-8f03-8c0e8654c063', 1, 'BO01-0001', '机壳镀锌p38x66.1', '个', 100.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:25:00', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('c88c38b6-cbb5-44c4-a4ea-d9e1192e0359', '0b713f05-5871-471e-8f03-8c0e8654c063', 2, 'BO01-0001-1', '机壳镀锌p38x66.1', NULL, 200.000, '推式', '成品仓库', 'fd8f3146-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:31:31', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO "public"."MES_Bom_Detail" VALUES ('ef77c899-95e9-48ab-9958-9ceb752788cd', 'd57095e6-ef91-4f00-87cb-82e2dbb633d6', 1, 'BO01-0002', '机壳毛坯p38x66.2', '个', 100.000, '推式', '成品仓库', 'fd83f9a1-0289-11f0-92bb-52540099312c', 1.000, NULL, 1, '超级管理员', '2025-03-19 01:32:24', 1, '超级管理员', '2025-03-19 01:31:31');

-- ----------------------------
-- Table structure for MES_Bom_Main
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Bom_Main";
CREATE TABLE "public"."MES_Bom_Main" (
  "BomId" uuid NOT NULL,
  "Code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialCode" varchar(200) COLLATE "pg_catalog"."default",
  "MaterialName" text COLLATE "pg_catalog"."default",
  "Spec" text COLLATE "pg_catalog"."default",
  "Purpose" varchar(50) COLLATE "pg_catalog"."default",
  "Edition" varchar(50) COLLATE "pg_catalog"."default",
  "EffectiveDate" timestamp(6) NOT NULL,
  "InvalidDate" timestamp(6) NOT NULL,
  "Enable" int4 NOT NULL,
  "CreateID" int4 NOT NULL,
  "Creator" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "CreateDate" timestamp(6) NOT NULL,
  "ModifyID" int4,
  "Modifier" varchar(50) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_Bom_Main"."BomId" IS 'ID';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Code" IS 'BOM编号';
COMMENT ON COLUMN "public"."MES_Bom_Main"."MaterialCode" IS '母件物料编码';
COMMENT ON COLUMN "public"."MES_Bom_Main"."MaterialName" IS '母件物料名称';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Spec" IS '规格型号';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Purpose" IS '用途';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Edition" IS '版本';
COMMENT ON COLUMN "public"."MES_Bom_Main"."EffectiveDate" IS '有效日期';
COMMENT ON COLUMN "public"."MES_Bom_Main"."InvalidDate" IS '失效日期';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Enable" IS '启用状态';
COMMENT ON COLUMN "public"."MES_Bom_Main"."CreateID" IS '创建人';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Creator" IS '创建人名称';
COMMENT ON COLUMN "public"."MES_Bom_Main"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_Bom_Main"."ModifyID" IS '更新人';
COMMENT ON COLUMN "public"."MES_Bom_Main"."Modifier" IS '更新人名称';
COMMENT ON COLUMN "public"."MES_Bom_Main"."ModifyDate" IS '更新时间';
COMMENT ON TABLE "public"."MES_Bom_Main" IS 'BOM';

-- ----------------------------
-- Records of MES_Bom_Main
-- ----------------------------
INSERT INTO "public"."MES_Bom_Main" VALUES ('0b713f05-5871-471e-8f03-8c0e8654c063', '001-BO01-0001', '001-BO01-0001', 'H1001机壳镀锌p38x66.1', '个', '机加工', 'v1.0', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 0, 1, '超级管理员', '2025-03-19 01:24:59', 1, '超级管理员', '2025-03-19 01:31:31');
INSERT INTO "public"."MES_Bom_Main" VALUES ('1dc84b0c-2cd7-4709-b488-df42ce36ab88', '001-BO01-0003', '001-BO01-0003', 'H1001机壳镀锌p38x66.3', '个', '机加工', 'v1.0', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 0, 1, '超级管理员', '2025-03-19 01:33:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_Bom_Main" VALUES ('d57095e6-ef91-4f00-87cb-82e2dbb633d6', '001-BO01-0002', '001-BO01-0002', 'H1001机壳镀锌p38x66.1', '个', '机加工', 'v1.0', '2025-03-19 00:00:00', '2025-03-19 00:00:00', 0, 1, '超级管理员', '2025-03-19 01:32:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_Customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Customer";
CREATE TABLE "public"."MES_Customer" (
  "CustomerID" uuid NOT NULL,
  "CustomerName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
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
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_Customer"."CustomerID" IS '客户ID';
COMMENT ON COLUMN "public"."MES_Customer"."CustomerName" IS '客户名称';
COMMENT ON COLUMN "public"."MES_Customer"."ContactPerson" IS '联系人';
COMMENT ON COLUMN "public"."MES_Customer"."ContactPhone" IS '联系电话';
COMMENT ON COLUMN "public"."MES_Customer"."Email" IS '邮箱地址';
COMMENT ON COLUMN "public"."MES_Customer"."Address" IS '联系地址';
COMMENT ON COLUMN "public"."MES_Customer"."CustomerType" IS '客户类型';
COMMENT ON COLUMN "public"."MES_Customer"."CreditRating" IS '信用评级';
COMMENT ON COLUMN "public"."MES_Customer"."BusinessScope" IS '业务范围';
COMMENT ON COLUMN "public"."MES_Customer"."Remarks" IS '备注信息';
COMMENT ON COLUMN "public"."MES_Customer"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_Customer"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_Customer"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_Customer"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_Customer"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_Customer"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_Customer
-- ----------------------------
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3835-0289-11f0-92bb-52540099312c', '辉煌科技集团', '李阳', '13900139000', 'liyang@huihuang.com', '北京市海淀区创新大道2号', '重要客户', 'A', '通信设备研发与生产', '业务量大，需重点跟进', 1, 'admin', '2023-02-01 09:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb39e8-0289-11f0-92bb-52540099312c', '星辰电子公司', '王芳', '13600136000', 'wangfang@xingchen.com', '深圳市南山区创业路3号', '新客户', 'B+', '电子零部件生产', '潜力较大，需加强沟通', 1, 'admin', '2023-03-01 10:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3aeb-0289-11f0-92bb-52540099312c', '阳光电子集团', '陈静', '13300133000', 'chenjing@yangguang.com', '杭州市西湖区科技园区5号', '长期合作客户', 'A', 'LED照明产品制造', '合作良好，定期回访', 1, 'admin', '2023-05-01 12:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3b9c-0289-11f0-92bb-52540099312c', '瑞风科技有限公司', '赵刚', '13700137000', 'zhaogang@ruifeng.com', '广州市天河区软件园4号', '普通客户', 'B', '智能家居产品研发', '偶尔下单，保持联系', 1, 'admin', '2023-04-01 11:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_Customer" VALUES ('0aeb3c2c-0289-11f0-92bb-52540099312c', '卓越电子有限公司', '张悦', '13800138000', 'zhangyue@zhuoyue.com', '上海市浦东新区科技路1号', '长期合作客户', 'A+', '消费电子产品制造', '合作多年，订单稳定', 1, 'admin', '2023-01-01 08:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_DefectiveProductDisposalRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_DefectiveProductDisposalRecord";
CREATE TABLE "public"."MES_DefectiveProductDisposalRecord" (
  "DisposalRecordID" uuid NOT NULL,
  "DefectiveID" uuid,
  "DisposalPerson" varchar(100) COLLATE "pg_catalog"."default",
  "DisposalStartTime" timestamp(6),
  "DisposalEndTime" timestamp(6),
  "DisposalResult" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."DisposalRecordID" IS '处理记录ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."DefectiveID" IS '不良品ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."DisposalPerson" IS '处理人';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."DisposalStartTime" IS '处理开始时间';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."DisposalEndTime" IS '处理结束时间';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."DisposalResult" IS '处理结果';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_DefectiveProductDisposalRecord"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_DefectiveProductDisposalRecord
-- ----------------------------

-- ----------------------------
-- Table structure for MES_DefectiveProductRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_DefectiveProductRecord";
CREATE TABLE "public"."MES_DefectiveProductRecord" (
  "DefectiveID" uuid NOT NULL,
  "ReportingID" uuid,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DefectiveQuantity" int4 NOT NULL,
  "DefectType" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DefectReason" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DisposalMethod" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DisposalStatus" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."DefectiveID" IS '不良品ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."ReportingID" IS '报工ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."MaterialSpecification" IS '物料规格';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."DefectiveQuantity" IS '不良品数量';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."DefectType" IS '缺陷类型';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."DefectReason" IS '缺陷原因';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."DisposalMethod" IS '处理方式';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."DisposalStatus" IS '处理状态';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_DefectiveProductRecord"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_DefectiveProductRecord
-- ----------------------------
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('84348030-03e0-11f0-92bb-52540099312c', '7e80d01e-03e0-11f0-92bb-52540099312c', 'M001', '电阻', '100Ω', 20, '阻值偏差', '生产工艺问题', '报废', '已处理', 1, 'admin', '2024-06-01 15:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('843483f9-03e0-11f0-92bb-52540099312c', '7e80d290-03e0-11f0-92bb-52540099312c', 'M002', '电容', '10μF', 20, '容量不达标', '原材料质量问题', '报废', '已处理', 1, 'admin', '2024-06-02 16:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('84348505-03e0-11f0-92bb-52540099312c', '7e80d2d4-03e0-11f0-92bb-52540099312c', 'M003', '线路板', 'PCB-A100', 20, '线路短路', '加工过程失误', '维修后再检验', '已处理', 1, 'admin', '2024-06-03 17:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('843485ab-03e0-11f0-92bb-52540099312c', '7e80d2fe-03e0-11f0-92bb-52540099312c', 'M004', '塑料粒子', 'PP-500', 50, '产品变形', '注塑参数不当', '报废', '已处理', 1, 'admin', '2024-06-04 18:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_DefectiveProductRecord" VALUES ('8434864a-03e0-11f0-92bb-52540099312c', '7e80d322-03e0-11f0-92bb-52540099312c', 'M005', '螺丝', 'M3x10', 50, '螺纹损坏', '加工精度不够', '报废', '已处理', 1, 'admin', '2024-06-05 19:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_EquipmentFaultRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentFaultRecord";
CREATE TABLE "public"."MES_EquipmentFaultRecord" (
  "FaultRecordID" uuid NOT NULL,
  "EquipmentID" uuid,
  "FaultDate" timestamp(6),
  "FaultType" varchar(100) COLLATE "pg_catalog"."default",
  "FaultDescription" varchar(100) COLLATE "pg_catalog"."default",
  "FaultImpact" varchar(100) COLLATE "pg_catalog"."default",
  "FaultReportedBy" varchar(100) COLLATE "pg_catalog"."default",
  "FaultStatus" varchar(100) COLLATE "pg_catalog"."default",
  "TroubleshootingStartTime" timestamp(6),
  "TroubleshootingEndTime" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultRecordID" IS '故障记录ID';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."EquipmentID" IS '设备ID';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultDate" IS '故障日期';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultType" IS '故障类型';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultDescription" IS '故障描述';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultImpact" IS '故障影响';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultReportedBy" IS '故障报告人';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."FaultStatus" IS '故障状态';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."TroubleshootingStartTime" IS '故障排查开始时间';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."TroubleshootingEndTime" IS '故障排查结束时间';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_EquipmentFaultRecord"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_EquipmentFaultRecord
-- ----------------------------
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f43c-0290-11f0-92bb-52540099312c', 'bdbb3938-028f-11f0-92bb-52540099312c', '2024-06-01 08:00:00', '电气故障', '设备突然断电', '生产中断', '李明', '已解决', '2024-06-01 08:15:00', '2024-06-01 09:30:00', 1, 'admin', '2024-06-01 08:00:00', 1, '超级管理员', '2025-03-17 02:04:14');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f60c-0290-11f0-92bb-52540099312c', 'bdbb36ec-028f-11f0-92bb-52540099312c', '2024-06-02 09:00:00', '机械故障', '模具开合异常', '影响产品成型质量', '张华', '已解决', '2024-06-02 09:10:00', '2024-06-02 11:00:00', 1, 'admin', '2024-06-02 09:00:00', 1, '超级管理员', '2025-03-17 02:04:11');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f707-0290-11f0-92bb-52540099312c', 'bdbb37ef-028f-11f0-92bb-52540099312c', '2024-06-03 10:00:00', '软件故障', '检测程序报错', '无法正常检测产品', '陈丽', '已解决', '2024-06-03 10:15:00', '2024-06-03 12:00:00', 1, 'admin', '2024-06-03 10:00:00', 1, '超级管理员', '2025-03-17 02:04:05');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f7b4-0290-11f0-92bb-52540099312c', 'bdbb3938-028f-11f0-92bb-52540099312c', '2024-06-04 11:00:00', '传感器故障', '螺丝拧紧量检测传感器失灵', '螺丝拧紧质量不稳定', '王强', '已解决', '2024-06-04 11:10:00', '2024-06-04 13:00:00', 1, 'admin', '2024-06-04 11:00:00', 1, '超级管理员', '2025-03-17 02:04:01');
INSERT INTO "public"."MES_EquipmentFaultRecord" VALUES ('f349f849-0290-11f0-92bb-52540099312c', 'bdbb34f1-028f-11f0-92bb-52540099312c', '2024-06-05 12:00:00', '加热故障', '回流焊温度达不到设定值', '焊接效果不佳', '李明', '已解决', '2024-06-05 12:15:00', '2024-06-05 14:00:00', 1, 'admin', '2024-06-05 12:00:00', 1, '超级管理员', '2025-03-17 02:03:57');

-- ----------------------------
-- Table structure for MES_EquipmentMaintenance
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentMaintenance";
CREATE TABLE "public"."MES_EquipmentMaintenance" (
  "MaintenanceID" uuid NOT NULL,
  "EquipmentID" uuid,
  "MaintenanceDate" timestamp(6),
  "MaintenanceType" varchar(100) COLLATE "pg_catalog"."default",
  "MaintenanceContent" varchar(100) COLLATE "pg_catalog"."default",
  "MaintenancePerson" varchar(100) COLLATE "pg_catalog"."default",
  "MaintenanceStatus" varchar(100) COLLATE "pg_catalog"."default",
  "NextMaintenanceDate" timestamp(6),
  "MaintenanceCost" numeric(10,2),
  "MaintenanceRemarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceID" IS '保养ID';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."EquipmentID" IS '设备ID';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceDate" IS '保养日期';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceType" IS '保养类型';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceContent" IS '保养内容';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenancePerson" IS '保养人员';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceStatus" IS '保养状态';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."NextMaintenanceDate" IS '下次保养日期';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceCost" IS '保养成本';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."MaintenanceRemarks" IS '保养备注';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_EquipmentMaintenance"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_EquipmentMaintenance
-- ----------------------------
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488d2d-0291-11f0-92bb-52540099312c', 'bdbb3938-028f-11f0-92bb-52540099312c', '2024-02-06 09:00:00', '日常保养', '润滑机械部件、检查电路', '王师傅', '已完成', '2024-03-06 09:00:00', 600.00, '无异常', 1, 'admin', '2024-02-06 09:00:00', 1, '超级管理员', '2025-03-17 02:06:41');
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488e2d-0291-11f0-92bb-52540099312c', 'bdbb36ec-028f-11f0-92bb-52540099312c', '2024-03-07 10:00:00', '深度保养', '更换易损件、全面检测', '张师傅', '已完成', '2024-04-07 10:00:00', 1200.00, '设备性能稳定', 1, 'admin', '2024-03-07 10:00:00', 1, '超级管理员', '2025-03-17 02:06:33');
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488eea-0291-11f0-92bb-52540099312c', 'bdbb36ec-028f-11f0-92bb-52540099312c', '2024-04-08 11:00:00', '定期保养', '清洁、调试设备', '李师傅', '已完成', '2024-05-08 11:00:00', 900.00, '设备正常运行', 1, 'admin', '2024-04-08 11:00:00', 1, '超级管理员', '2025-03-17 02:06:29');
INSERT INTO "public"."MES_EquipmentMaintenance" VALUES ('4f488fb2-0291-11f0-92bb-52540099312c', 'bdbb36ec-028f-11f0-92bb-52540099312c', '2024-05-09 12:00:00', '日常保养', '检查焊接头、清理灰尘', '赵师傅', '已完成', '2024-06-09 12:00:00', 700.00, '无明显问题', 1, 'admin', '2024-05-09 12:00:00', 1, '超级管理员', '2025-03-17 02:06:26');

-- ----------------------------
-- Table structure for MES_EquipmentManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentManagement";
CREATE TABLE "public"."MES_EquipmentManagement" (
  "EquipmentID" uuid NOT NULL,
  "EquipmentCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "EquipmentName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "EquipmentType" varchar(100) COLLATE "pg_catalog"."default",
  "Manufacturer" varchar(100) COLLATE "pg_catalog"."default",
  "PurchaseDate" timestamp(6),
  "WarrantyPeriod" int4,
  "InstallationLocation" varchar(100) COLLATE "pg_catalog"."default",
  "EquipmentStatus" varchar(100) COLLATE "pg_catalog"."default",
  "ResponsiblePerson" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."EquipmentID" IS '设备ID';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."EquipmentCode" IS '设备编码';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."EquipmentName" IS '设备名称';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."EquipmentType" IS '设备类型';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."Manufacturer" IS '制造商';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."PurchaseDate" IS '购买日期';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."WarrantyPeriod" IS '保修期（月）';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."InstallationLocation" IS '安装位置';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."EquipmentStatus" IS '设备状态';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."ResponsiblePerson" IS '责任人';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_EquipmentManagement"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_EquipmentManagement
-- ----------------------------
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb34f1-028f-11f0-92bb-52540099312c', 'EQ001', 'SMT贴片机', '电子制造设备', '三星电子', '2023-01-01 08:00:00', 12, '生产车间A区1号', '运行正常', '李明', 1, 'admin', '2024-01-01 08:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb36ec-028f-11f0-92bb-52540099312c', 'EQ002', '注塑机', '塑料加工设备', '海天塑机', '2023-02-01 09:00:00', 10, '生产车间B区2号', '运行中', '张华', 1, 'admin', '2024-02-01 09:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb37ef-028f-11f0-92bb-52540099312c', 'EQ003', '检测仪器', '质量检测设备', '泰瑞达科技', '2023-03-01 10:00:00', 15, '生产车间D区4号', '正常使用', '陈丽', 1, 'admin', '2024-03-01 10:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb38a2-028f-11f0-92bb-52540099312c', 'EQ004', '自动螺丝机', '装配设备', '拓普机械', '2023-04-01 11:00:00', 11, '生产车间C区3号', '运行平稳', '王强', 1, 'admin', '2024-04-01 11:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_EquipmentManagement" VALUES ('bdbb3938-028f-11f0-92bb-52540099312c', 'EQ005', '回流焊炉', '焊接设备', '日东电子', '2023-05-01 12:00:00', 13, '生产车间A区1号', '正常运转', '李明', 1, 'admin', '2024-05-01 12:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_EquipmentRepair
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_EquipmentRepair";
CREATE TABLE "public"."MES_EquipmentRepair" (
  "RepairID" uuid NOT NULL,
  "EquipmentID" uuid,
  "RepairDate" timestamp(6),
  "RepairReason" varchar(100) COLLATE "pg_catalog"."default",
  "RepairContent" varchar(100) COLLATE "pg_catalog"."default",
  "RepairPerson" varchar(100) COLLATE "pg_catalog"."default",
  "RepairCost" numeric(10,2),
  "RepairStatus" varchar(100) COLLATE "pg_catalog"."default",
  "RepairStartTime" timestamp(6),
  "RepairEndTime" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairID" IS '维修ID';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."EquipmentID" IS '设备ID';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairDate" IS '维修日期';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairReason" IS '维修原因';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairContent" IS '维修内容';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairPerson" IS '维修人员';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairCost" IS '维修成本';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairStatus" IS '维修状态';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairStartTime" IS '维修开始时间';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."RepairEndTime" IS '维修结束时间';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_EquipmentRepair"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_EquipmentRepair
-- ----------------------------
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a230-0290-11f0-92bb-52540099312c', 'bdbb3938-028f-11f0-92bb-52540099312c', '2024-01-10 09:00:00', '贴装头故障', '更换贴装头', '张师傅', 5000.00, '已完成', '2024-01-10 09:30:00', '2024-01-10 15:00:00', 1, 'admin', '2024-01-10 09:00:00', 1, '超级管理员', '2025-03-17 02:00:41');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a3fb-0290-11f0-92bb-52540099312c', 'bdbb3938-028f-11f0-92bb-52540099312c', '2024-02-15 10:00:00', '注塑压力不稳定', '检查液压系统并维修', '李师傅', 3500.00, '已完成', '2024-02-15 10:30:00', '2024-02-15 16:00:00', 1, 'admin', '2024-02-15 10:00:00', 1, '超级管理员', '2025-03-17 02:00:36');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a509-0290-11f0-92bb-52540099312c', 'bdbb38a2-028f-11f0-92bb-52540099312c', '2024-03-20 11:00:00', '检测精度下降', '校准检测传感器', '赵师傅', 2000.00, '已完成', '2024-03-20 11:30:00', '2024-03-20 14:00:00', 1, 'admin', '2024-03-20 11:00:00', 1, '超级管理员', '2025-03-17 02:00:56');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a5c0-0290-11f0-92bb-52540099312c', 'bdbb34f1-028f-11f0-92bb-52540099312c', '2024-04-25 12:00:00', '螺丝拧紧力度不均匀', '调整拧紧扭矩装置', '孙师傅', 1500.00, '已完成', '2024-04-25 12:30:00', '2024-04-25 15:30:00', 1, 'admin', '2024-04-25 12:00:00', 1, '超级管理员', '2025-03-17 02:00:24');
INSERT INTO "public"."MES_EquipmentRepair" VALUES ('5132a654-0290-11f0-92bb-52540099312c', 'bdbb34f1-028f-11f0-92bb-52540099312c', '2024-05-30 13:00:00', '温度控制异常', '维修温度控制器', '周师傅', 2500.00, '已完成', '2024-05-30 13:30:00', '2024-05-30 17:00:00', 1, 'admin', '2024-05-30 13:00:00', 1, '超级管理员', '2025-03-17 02:00:21');

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
  "WarehouseID" uuid,
  "LocationID" uuid,
  "InventoryQuantity" int4 NOT NULL,
  "InventoryUnit" varchar(100) COLLATE "pg_catalog"."default",
  "InventoryCost" numeric(10,2) NOT NULL,
  "InventoryStatus" varchar(100) COLLATE "pg_catalog"."default",
  "InboundDate" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_InventoryManagement"."InventoryID" IS '库存ID';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."DocumentNo" IS '单据号';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."SpecificationModel" IS '规格型号';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."WarehouseID" IS '仓库ID';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."LocationID" IS '货位ID';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."InventoryQuantity" IS '库存数量';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."InventoryUnit" IS '库存单位';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."InventoryCost" IS '库存成本';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."InventoryStatus" IS '库存状态';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."InboundDate" IS '入库日期';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_InventoryManagement"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_InventoryManagement
-- ----------------------------
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a95724d', 'INV001', '螺丝', 'S001', 'M5*10', '3a765f84-49a6-4f42-9639-2a9c58d832c5', '1c19c214-9d78-4596-b078-789f7755896b', 500, '个', 0.50, '在库', '2024-01-01 08:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:23');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a95724e', 'INV002', '螺母', 'N001', 'M5', '3a765f84-49a6-4f42-9639-2a9c58d832c5', '1c19c214-9d78-4596-b078-789f7755896b', 300, '个', 0.30, '在库', '2024-01-02 09:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:47:04');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a95724f', 'INV003', '成品A', 'P001', 'V1.0', '3a765f84-49a6-4f42-9639-2a9c58d832c5', '1c19c214-9d78-4596-b078-789f7755896b', 200, '件', 100.00, '在库', '2024-01-03 10:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:40');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a957250', 'INV004', '半成品B', 'SP001', '半加工状态', '3a765f84-49a6-4f42-9639-2a9c58d832c6', '1c19c214-9d78-4596-b078-789f7755896c', 150, '件', 50.00, '在库', '2024-01-04 11:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:49');
INSERT INTO "public"."MES_InventoryManagement" VALUES ('5e6f978c-2f87-4046-9577-29c96a957251', 'INV005', '包装纸箱', 'C001', '50*40*30cm', '3a765f84-49a6-4f42-9639-2a9c58d832c8', '1c19c214-9d78-4596-b078-789f7755896e', 400, '个', 5.00, '在库', '2024-01-05 12:00:00', 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:46:55');

-- ----------------------------
-- Table structure for MES_LocationManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_LocationManagement";
CREATE TABLE "public"."MES_LocationManagement" (
  "LocationID" uuid NOT NULL,
  "WarehouseID" uuid,
  "LocationCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "LocationName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "LocationType" varchar(100) COLLATE "pg_catalog"."default",
  "LocationCapacity" int4 NOT NULL,
  "LocationStatus" varchar(100) COLLATE "pg_catalog"."default",
  "LocationRow" int4 NOT NULL,
  "LocationColumn" int4 NOT NULL,
  "LocationFloor" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationID" IS '货位ID';
COMMENT ON COLUMN "public"."MES_LocationManagement"."WarehouseID" IS '所属仓库ID';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationCode" IS '货位编码';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationName" IS '货位名称';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationType" IS '货位类型';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationCapacity" IS '货位容量';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationStatus" IS '货位状态';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationRow" IS '货位行号';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationColumn" IS '货位列号';
COMMENT ON COLUMN "public"."MES_LocationManagement"."LocationFloor" IS '货位层数';
COMMENT ON COLUMN "public"."MES_LocationManagement"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_LocationManagement"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_LocationManagement"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_LocationManagement"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_LocationManagement"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_LocationManagement"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_LocationManagement
-- ----------------------------
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c4', '1c19c214-9d78-4596-b078-789f7755896a', 'L001', 'A区001', '普通货位', 100, '空闲', 1, 1, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:47:51');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c5', '1c19c214-9d78-4596-b078-789f7755896b', 'L002', 'B区002', '普通货位', 150, '占用', 2, 2, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:47:57');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c6', '1c19c214-9d78-4596-b078-789f7755896c', 'L003', 'C区003', '普通货位', 120, '空闲', 3, 3, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:48:03');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c7', '1c19c214-9d78-4596-b078-789f7755896d', 'L004', 'D区004', '不良品货位', 50, '占用', 4, 4, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:48:13');
INSERT INTO "public"."MES_LocationManagement" VALUES ('3a765f84-49a6-4f42-9639-2a9c58d832c8', '1c19c214-9d78-4596-b078-789f7755896e', 'L005', 'E区005', '普通货位', 180, '空闲', 5, 5, 1, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:48:19');

-- ----------------------------
-- Table structure for MES_Material
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Material";
CREATE TABLE "public"."MES_Material" (
  "MaterialID" uuid NOT NULL,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialType" varchar(100) COLLATE "pg_catalog"."default",
  "CatalogID" uuid,
  "Specification" varchar(100) COLLATE "pg_catalog"."default",
  "Unit" varchar(100) COLLATE "pg_catalog"."default",
  "Price" numeric(10,2),
  "Img" text COLLATE "pg_catalog"."default",
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_Material"."MaterialID" IS '物料ID';
COMMENT ON COLUMN "public"."MES_Material"."MaterialCode" IS '物料编码';
COMMENT ON COLUMN "public"."MES_Material"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_Material"."MaterialType" IS '物料类型';
COMMENT ON COLUMN "public"."MES_Material"."CatalogID" IS '物料分类';
COMMENT ON COLUMN "public"."MES_Material"."Specification" IS '规格型号';
COMMENT ON COLUMN "public"."MES_Material"."Unit" IS '计量单位';
COMMENT ON COLUMN "public"."MES_Material"."Price" IS '单价信息';
COMMENT ON COLUMN "public"."MES_Material"."Img" IS '物料图片';
COMMENT ON COLUMN "public"."MES_Material"."Remarks" IS '备注信息';
COMMENT ON COLUMN "public"."MES_Material"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_Material"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_Material"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_Material"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_Material"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_Material"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_Material
-- ----------------------------
INSERT INTO "public"."MES_Material" VALUES ('8754ed7a-e845-42a1-9b51-6735091653f4', 'AKG0000004', '米其林轮胎', NULL, '40f6f014-b41f-400e-ad49-ed4b109cf5f3', '。。。。。。。', '件', NULL, NULL, '。。。。。。。。', 1, '超级管理员', '2025-03-18 14:12:26', 1, '超级管理员', '2025-03-18 14:13:00');
INSERT INTO "public"."MES_Material" VALUES ('9f7e972a-028b-11f0-92bb-52540099312c', 'AKG0000001', '碳素结构钢', '金属材料', '40f6f014-b41f-400e-ad49-ed4b109cf5f3', 'Q235B，厚度 5mm', '吨', 4500.00, 'Upload/Tables/MES_Material/202503170240379198/wechat.jpg', '常用于建筑结构', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:47:53');
INSERT INTO "public"."MES_Material" VALUES ('9f7e990f-028b-11f0-92bb-52540099312c', 'AKG0000002', '架构芯片', '电子元器件', '40f6f014-b41f-400e-ad49-ed4b109cf5f3', 'Cortex - M3 内核，主频 100MHz', '片', 50.00, 'Upload/Tables/MES_Material/202503170240426945/wechat.jpg', '适用于嵌入式系统开发', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:48:28');
INSERT INTO "public"."MES_Material" VALUES ('9f7e99fd-028b-11f0-92bb-52540099312c', 'AKG0000003', '聚乙烯（PE）', '化工原料', '0b24acbf-ac77-4355-966a-71f394020c6d', '低密度，颗粒状', '件', 10.00, 'Upload/Tables/MES_Material/202503170240509540/wechat.jpg', '可用于塑料制品生产', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:49:11');
INSERT INTO "public"."MES_Material" VALUES ('9f7e9a54-028b-11f0-92bb-52540099312c', 'AKG0000004', '双层瓦楞纸箱', '包装材料', '43175a13-251a-4481-b515-87a9d22a547b', '尺寸：500mm×300mm×200mm', '件', 5.00, NULL, '用于产品包装运输', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:49:17');
INSERT INTO "public"."MES_Material" VALUES ('9f7e9aac-028b-11f0-92bb-52540099312c', 'AKG0000005', 'A4 复印纸', '办公用品', '43175a13-251a-4481-b515-87a9d22a547b', '70g，500 张/包', '包', 20.00, NULL, '适用于日常办公复印', 1, '管理员', '2025-03-17 01:25:14', 1, '超级管理员', '2025-03-17 11:48:52');

-- ----------------------------
-- Table structure for MES_MaterialCatalog
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_MaterialCatalog";
CREATE TABLE "public"."MES_MaterialCatalog" (
  "CatalogID" uuid NOT NULL,
  "CatalogCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CatalogName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CatalogType" varchar(100) COLLATE "pg_catalog"."default",
  "ParentId" uuid,
  "Enable" int4,
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."CatalogID" IS '分类ID';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."CatalogCode" IS '分类编码';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."CatalogName" IS '分类名称';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."CatalogType" IS '分类类型';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."ParentId" IS '上级分类';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."Enable" IS '启用状态';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."Remarks" IS '备注信息';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_MaterialCatalog"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_MaterialCatalog
-- ----------------------------
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('0b24acbf-ac77-4355-966a-71f394020c6d', 'A0008', '助焊剂', NULL, '40f6f014-b41f-400e-ad49-ed4b109cf5f3', 1, '。。。', 1, '超级管理员', '2025-03-17 11:45:07', 1, '超级管理员', '2025-03-17 11:45:14');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('40f6f014-b41f-400e-ad49-ed4b109cf5f3', 'A0001', '原材料', NULL, NULL, 1, '。。。。', 1, '超级管理员', '2025-03-17 11:36:25', 1, '超级管理员', '2025-03-17 11:46:03');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('43175a13-251a-4481-b515-87a9d22a547b', 'A0005', '引线框架', NULL, 'ef241017-fbce-42af-942a-6d2531929cc4', 1, '。。。。。', 1, '超级管理员', '2025-03-17 11:43:42', 1, '超级管理员', '2025-03-17 11:44:36');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('8f258988-157e-4e81-9076-44a86d1946cb', 'A0006', '覆铜板', NULL, 'ef241017-fbce-42af-942a-6d2531929cc4', 1, NULL, 1, '超级管理员', '2025-03-17 11:44:24', 1, '超级管理员', '2025-03-17 11:46:22');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('b8ccd002-73b9-4bb0-b40f-fbca161b3443', 'A0007', '粘合剂', NULL, '40f6f014-b41f-400e-ad49-ed4b109cf5f3', 1, '。。。', 1, '超级管理员', '2025-03-17 11:44:52', 1, '超级管理员', '2025-03-17 11:46:25');
INSERT INTO "public"."MES_MaterialCatalog" VALUES ('ef241017-fbce-42af-942a-6d2531929cc4', 'A0003', '半成品', NULL, NULL, 1, '。。。。。。', 1, '超级管理员', '2025-03-17 11:36:47', 1, '超级管理员', '2025-03-17 11:36:53');

-- ----------------------------
-- Table structure for MES_Process
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Process";
CREATE TABLE "public"."MES_Process" (
  "ProcessID" uuid NOT NULL,
  "ProcessCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ProcessName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ProcessType" varchar(100) COLLATE "pg_catalog"."default",
  "ProcessSequence" int4 NOT NULL,
  "ProcessDescription" varchar(100) COLLATE "pg_catalog"."default",
  "WorkCenter" varchar(100) COLLATE "pg_catalog"."default",
  "StandardWorkingHours" numeric(10,2) NOT NULL,
  "ProcessStatus" varchar(100) COLLATE "pg_catalog"."default",
  "ResponsibleWorker" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_Process"."ProcessID" IS '工序ID';
COMMENT ON COLUMN "public"."MES_Process"."ProcessCode" IS '工序编码';
COMMENT ON COLUMN "public"."MES_Process"."ProcessName" IS '工序名称';
COMMENT ON COLUMN "public"."MES_Process"."ProcessType" IS '工序类型';
COMMENT ON COLUMN "public"."MES_Process"."ProcessSequence" IS '工序顺序';
COMMENT ON COLUMN "public"."MES_Process"."ProcessDescription" IS '工序描述';
COMMENT ON COLUMN "public"."MES_Process"."WorkCenter" IS '工作中心';
COMMENT ON COLUMN "public"."MES_Process"."StandardWorkingHours" IS '标准工时';
COMMENT ON COLUMN "public"."MES_Process"."ProcessStatus" IS '工序状态';
COMMENT ON COLUMN "public"."MES_Process"."ResponsibleWorker" IS '责任人';
COMMENT ON COLUMN "public"."MES_Process"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_Process"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_Process"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_Process"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_Process"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_Process"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_Process
-- ----------------------------
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', 'PAK00001', '切割工序', '加工工序', 1, '对原材料进行切割处理', 'WC01', 2.50, '正常', '张师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', 'PAK00002', '焊接工序', '加工工序', 2, '将切割后的部件进行焊接组装', 'WC02', 3.00, '正常', '李师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:58');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', 'PAK00003', '打磨工序', '加工工序', 3, '对焊接后的产品进行打磨处理', 'WC03', 2.00, '正常', '王师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:40');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', 'PAK00004', '喷漆工序', '表面处理工序', 4, '对打磨后的产品进行喷漆操作', 'WC04', 1.50, '正常', '赵师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:45');
INSERT INTO "public"."MES_Process" VALUES ('4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2e', 'PAK00005', '质检工序', '质量检测工序', 5, '对产品进行质量检测', 'WC05', 1.00, '正常', '孙师傅', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:50');

-- ----------------------------
-- Table structure for MES_ProcessReport
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProcessReport";
CREATE TABLE "public"."MES_ProcessReport" (
  "ReportID" uuid NOT NULL,
  "ProcessID" uuid,
  "ReportDate" timestamp(6) NOT NULL,
  "CompletedQuantity" int4 NOT NULL,
  "DefectiveQuantity" int4 NOT NULL,
  "ReportedBy" varchar(100) COLLATE "pg_catalog"."default",
  "ReportStatus" varchar(100) COLLATE "pg_catalog"."default",
  "ReportRemarks" varchar(100) COLLATE "pg_catalog"."default",
  "StartTime" timestamp(6),
  "EndTime" timestamp(6),
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProcessReport"."ReportID" IS '汇报ID';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ProcessID" IS '工序ID';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ReportDate" IS '汇报日期';
COMMENT ON COLUMN "public"."MES_ProcessReport"."CompletedQuantity" IS '完成数量';
COMMENT ON COLUMN "public"."MES_ProcessReport"."DefectiveQuantity" IS '不良数量';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ReportedBy" IS '汇报人';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ReportStatus" IS '汇报状态';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ReportRemarks" IS '汇报备注';
COMMENT ON COLUMN "public"."MES_ProcessReport"."StartTime" IS '工序开始时间';
COMMENT ON COLUMN "public"."MES_ProcessReport"."EndTime" IS '工序结束时间';
COMMENT ON COLUMN "public"."MES_ProcessReport"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProcessReport"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProcessReport"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProcessReport"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProcessReport"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProcessReport
-- ----------------------------
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348b0e-0295-11f0-92bb-52540099312c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', '2024-01-16 08:00:00', 50, 2, '张师傅', '已完成', '切割过程中发现2个次品', '2024-01-16 07:00:00', '2024-01-16 08:00:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348cd3-0295-11f0-92bb-52540099312c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', '2024-01-16 09:30:00', 40, 1, '李师傅', '已完成', '焊接时有1个产品焊接不牢', '2024-01-16 08:30:00', '2024-01-16 09:30:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348dd7-0295-11f0-92bb-52540099312c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', '2024-01-16 11:00:00', 35, 0, '王师傅', '已完成', '打磨过程顺利', '2024-01-16 10:00:00', '2024-01-16 11:00:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348e97-0295-11f0-92bb-52540099312c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', '2024-01-16 12:30:00', 45, 3, '赵师傅', '已完成', '喷漆颜色有偏差3个产品', '2024-01-16 11:30:00', '2024-01-16 12:30:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');
INSERT INTO "public"."MES_ProcessReport" VALUES ('5b348f65-0295-11f0-92bb-52540099312c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2e', '2024-01-16 14:00:00', 50, 1, '孙师傅', '已完成', '1个产品质检不合格', '2024-01-16 13:00:00', '2024-01-16 14:00:00', 1, 'admin', '2025-03-16 23:16:25', 1, 'admin', '2025-03-16 23:16:25');

-- ----------------------------
-- Table structure for MES_ProcessRoute
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProcessRoute";
CREATE TABLE "public"."MES_ProcessRoute" (
  "RouteID" uuid NOT NULL,
  "ProcessID" uuid,
  "ProductID" varchar(100) COLLATE "pg_catalog"."default",
  "ProductName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "RouteSequence" int4 NOT NULL,
  "RouteDescription" varchar(100) COLLATE "pg_catalog"."default",
  "PreProcessID" uuid,
  "NextProcessID" uuid,
  "RouteStatus" varchar(100) COLLATE "pg_catalog"."default",
  "RouteResponsible" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProcessRoute"."RouteID" IS '路线ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."ProcessID" IS '工序ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."ProductID" IS '产品ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."ProductName" IS '产品名称';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."RouteSequence" IS '路线顺序';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."RouteDescription" IS '路线描述';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."PreProcessID" IS '前工序ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."NextProcessID" IS '后工序ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."RouteStatus" IS '路线状态';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."RouteResponsible" IS '路线责任人';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProcessRoute"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProcessRoute
-- ----------------------------
INSERT INTO "public"."MES_ProcessRoute" VALUES ('30142e89-8086-40e3-a0c4-ea8bc24ebc7d', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', NULL, '工艺路径03', 3, '工艺路径03', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', '1', NULL, 1, '超级管理员', '2025-03-18 14:00:07', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2a', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', 'P0001', '工艺路径01', 1, '产品A的工艺路线第一步 - 切割', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2b', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', 'P0001', '喷漆01', 1, '喷漆01', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-18 14:00:58');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', 'P0001', '产品A', 3, '产品A的工艺路线第三步 - 打磨', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:40');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2d', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', 'P0001', '产品A', 4, '产品A的工艺路线第四步 - 喷漆', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2e', '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:45');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('7d4c6b8e-3f5d-486f-9c7a-5d8643e78d2e', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2e', 'P0001', '产品A', 5, '产品A的工艺路线第五步 - 质检', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', NULL, '启用', '项目经理1', 1, 'admin', '2025-03-16 23:16:25', 1, '超级管理员', '2025-03-17 02:17:50');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('be7bca96-d2b1-42be-a23c-a5e75b26fc8d', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', NULL, '工艺路径02', 2, '工艺路径01', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2a', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2c', '1', NULL, 1, '超级管理员', '2025-03-17 02:22:19', 1, '超级管理员', '2025-03-18 14:00:07');
INSERT INTO "public"."MES_ProcessRoute" VALUES ('c33a1f4e-5ace-4f58-95c2-6f15f8e64950', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2b', NULL, '喷漆02', 2, '喷漆02', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2d', '4f8d7a5b-2c4e-4d75-8b9a-3d6754f97e2e', '1', NULL, 1, '超级管理员', '2025-03-18 14:00:58', 1, '超级管理员', '2025-03-18 14:00:58');

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
  "WarehouseID" uuid,
  "LocationID" uuid,
  "InboundQuantity" int4 NOT NULL,
  "InboundUnit" varchar(100) COLLATE "pg_catalog"."default",
  "InboundDate" timestamp(6),
  "InboundOperator" varchar(100) COLLATE "pg_catalog"."default",
  "InboundReason" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductInbound"."InboundID" IS '入库ID';
COMMENT ON COLUMN "public"."MES_ProductInbound"."DocumentNo" IS '单据号';
COMMENT ON COLUMN "public"."MES_ProductInbound"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_ProductInbound"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_ProductInbound"."SpecificationModel" IS '规格型号';
COMMENT ON COLUMN "public"."MES_ProductInbound"."WarehouseID" IS '仓库ID';
COMMENT ON COLUMN "public"."MES_ProductInbound"."LocationID" IS '货位ID';
COMMENT ON COLUMN "public"."MES_ProductInbound"."InboundQuantity" IS '入库数量';
COMMENT ON COLUMN "public"."MES_ProductInbound"."InboundUnit" IS '入库单位';
COMMENT ON COLUMN "public"."MES_ProductInbound"."InboundDate" IS '入库日期';
COMMENT ON COLUMN "public"."MES_ProductInbound"."InboundOperator" IS '入库操作员';
COMMENT ON COLUMN "public"."MES_ProductInbound"."InboundReason" IS '入库原因';
COMMENT ON COLUMN "public"."MES_ProductInbound"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductInbound"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductInbound"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductInbound"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductInbound"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductInbound"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductInbound
-- ----------------------------
INSERT INTO "public"."MES_ProductInbound" VALUES ('528599a8-a80b-4854-9184-03b998fcf75a', 'IN202503170001', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '1c19c214-9d78-4596-b078-789f7755896b', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:21', 1, '超级管理员', '2025-03-20 17:36:23');
INSERT INTO "public"."MES_ProductInbound" VALUES ('687c6fe1-6849-46c6-a9d7-96f80e10e827', 'IN202503170001', '米其林轮胎', 'AKG0000004', '。。。。。。。', NULL, '1c19c214-9d78-4596-b078-789f7755896d', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:59:01', 1, '超级管理员', '2025-03-20 17:35:59');
INSERT INTO "public"."MES_ProductInbound" VALUES ('75013787-8e21-49c7-a488-1cff0b051f6e', 'IN202503170001', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '1c19c214-9d78-4596-b078-789f7755896a', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:24', 1, '超级管理员', '2025-03-20 17:36:14');
INSERT INTO "public"."MES_ProductInbound" VALUES ('e080e4f0-1fd8-4bbf-97b0-045fda9a5207', 'IN202503170001', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '1c19c214-9d78-4596-b078-789f7755896d', 200, '个', '2024-01-06 08:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:58:55', 1, '超级管理员', '2025-03-20 17:36:06');

-- ----------------------------
-- Table structure for MES_ProductOutbound
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductOutbound";
CREATE TABLE "public"."MES_ProductOutbound" (
  "OutboundID" uuid NOT NULL,
  "DocumentNo" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "SpecificationModel" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseID" uuid,
  "LocationID" uuid NOT NULL,
  "OutboundQuantity" int4 NOT NULL,
  "OutboundUnit" varchar(100) COLLATE "pg_catalog"."default",
  "OutboundDate" timestamp(6),
  "OutboundOperator" varchar(100) COLLATE "pg_catalog"."default",
  "OutboundReason" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductOutbound"."OutboundID" IS '出库ID';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."DocumentNo" IS '单据号';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."SpecificationModel" IS '规格型号';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."WarehouseID" IS '仓库ID';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."LocationID" IS '货位ID';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."OutboundQuantity" IS '出库数量';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."OutboundUnit" IS '出库单位';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."OutboundDate" IS '出库日期';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."OutboundOperator" IS '出库操作员';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."OutboundReason" IS '出库原因';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductOutbound"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductOutbound
-- ----------------------------
INSERT INTO "public"."MES_ProductOutbound" VALUES ('087d6390-c914-4949-b397-3cf5bfe66df0', 'OB20250317006', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:14', 1, '超级管理员', '2025-03-20 17:38:07');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('323adf96-5391-45a6-bd03-69ebe526a933', 'OB20250317008', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:26', 1, '超级管理员', '2025-03-20 17:37:58');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('623a152c-d7d6-4aba-9456-092d1b5902b1', 'OB20250317010', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c8', 50, '个', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:34', 1, '超级管理员', '2025-03-20 17:37:47');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('688f2d79-c448-4c91-99ff-ca65448a38d7', 'OB20250317012', '聚乙烯（PE）', 'AKG0000003', '低密度，颗粒状', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c8', 12, '箱', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:47', 1, '超级管理员', '2025-03-20 17:37:34');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('7ac2fe76-c1a5-49af-b441-91c722e35759', 'OB20250317003', '包装纸箱', 'C001', '50*40*30cm', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c8', 50, '个', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:38:12', NULL, NULL, NULL);
INSERT INTO "public"."MES_ProductOutbound" VALUES ('80f59df8-dbd6-47c8-b1ee-9700ad876902', 'OB20250317009', '米其林轮胎', 'AKG0000004', '。。。。。。。', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:29', 1, '超级管理员', '2025-03-20 17:37:52');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('84a80744-df64-4b5e-b810-4028f57f405a', 'OB20250317005', 'A4 复印纸', 'AKG0000005', '70g，500 张/包', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:53:48', 1, '超级管理员', '2025-03-20 17:38:15');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('9784e034-5ef3-4a5f-bd4e-6183c2e8ee25', 'OB20250317011', '碳素结构钢', 'AKG0000001', 'Q235B，厚度 5mm', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c8', 12, '箱', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:39', 1, '超级管理员', '2025-03-20 17:37:41');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('c1151e9d-704b-4abc-b8b9-8989eff162a7', 'OB20250317007', '双层瓦楞纸箱', 'AKG0000004', '尺寸：500mm×300mm×200mm', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:54:23', 1, '超级管理员', '2025-03-20 17:38:02');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('de425c5f-114b-4f25-a5e2-a1e6f6fa166e', 'OB20250317004', '包装纸箱', 'E00X', '50*40*30cm', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c8', 12, '箱', '2024-01-15 12:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:53:44', 1, '超级管理员', '2025-03-17 00:54:06');
INSERT INTO "public"."MES_ProductOutbound" VALUES ('e3b460f4-7caa-4017-92f7-e116b7920a57', 'OB20250317002', '半成品B', 'SP001', '半加工状态', NULL, '3a765f84-49a6-4f42-9639-2a9c58d832c6', 30, '件', '2024-01-14 11:00:00', NULL, NULL, 1, '超级管理员', '2025-03-17 00:38:02', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_ProductionLine
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionLine";
CREATE TABLE "public"."MES_ProductionLine" (
  "ProductionLineID" uuid NOT NULL,
  "LineName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "LineType" varchar(100) COLLATE "pg_catalog"."default",
  "Capacity" varchar(100) COLLATE "pg_catalog"."default",
  "Status" varchar(100) COLLATE "pg_catalog"."default",
  "ResponsiblePerson" varchar(100) COLLATE "pg_catalog"."default",
  "Location" varchar(100) COLLATE "pg_catalog"."default",
  "StartDate" timestamp(6),
  "EndDate" timestamp(6),
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionLine"."ProductionLineID" IS '产线ID';
COMMENT ON COLUMN "public"."MES_ProductionLine"."LineName" IS '产线名称';
COMMENT ON COLUMN "public"."MES_ProductionLine"."LineType" IS '产线类型';
COMMENT ON COLUMN "public"."MES_ProductionLine"."Capacity" IS '产能信息';
COMMENT ON COLUMN "public"."MES_ProductionLine"."Status" IS '产线状态';
COMMENT ON COLUMN "public"."MES_ProductionLine"."ResponsiblePerson" IS '负责人';
COMMENT ON COLUMN "public"."MES_ProductionLine"."Location" IS '产线位置';
COMMENT ON COLUMN "public"."MES_ProductionLine"."StartDate" IS '启用日期';
COMMENT ON COLUMN "public"."MES_ProductionLine"."EndDate" IS '停用日期';
COMMENT ON COLUMN "public"."MES_ProductionLine"."Remarks" IS '备注信息';
COMMENT ON COLUMN "public"."MES_ProductionLine"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionLine"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionLine"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionLine"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionLine"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionLine"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionLine
-- ----------------------------
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efa4a-028a-11f0-92bb-52540099312c', '手机组装产线 1 号', '电子设备组装线', '每天 5000 部手机', '运行中', '张工', '工厂 1 楼 A 区', '2024-01-01 08:00:00', '2025-03-17 00:00:00', '效率较高', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:36:33');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efc2e-028a-11f0-92bb-52540099312c', '汽车发动机零部件加工线', '机械加工线', '每月 3000 套零部件', '运行中', '李工', '工厂 2 楼 B 区', '2024-03-15 09:30:00', '2025-03-17 00:00:00', '质量稳定', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:36:00');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efd10-028a-11f0-92bb-52540099312c', '饼干包装产线 2 号', '食品包装线', '每小时 10000 包饼干', '运行中', '王工', '工厂 3 楼 C 区', '2024-05-20 10:15:00', '2025-03-17 00:00:00', '包装精美', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:49:46');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efd6c-028a-11f0-92bb-52540099312c', '衬衫裁剪产线', '服装裁剪线', '每周 2000 件衬衫裁剪量', '运行中', '赵工', '工厂 4 楼 D 区', '2024-07-05 11:00:00', '2025-03-17 00:00:00', '裁剪精度高', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:21:04');
INSERT INTO "public"."MES_ProductionLine" VALUES ('d44efdbd-028a-11f0-92bb-52540099312c', '平板电脑检测线', '电子产品检测线', '每天 2000 台平板电脑', '运行中', '孙工', '工厂 5 楼 E 区', '2024-09-10 14:45:00', '2025-03-17 00:00:00', '检测全面', 1, '管理员', '2025-03-17 01:19:33', 1, '超级管理员', '2025-03-17 01:21:07');

-- ----------------------------
-- Table structure for MES_ProductionLineDevice
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionLineDevice";
CREATE TABLE "public"."MES_ProductionLineDevice" (
  "DeviceID" uuid NOT NULL,
  "ProductionLineID" uuid,
  "DeviceName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DeviceModel" varchar(100) COLLATE "pg_catalog"."default",
  "Manufacturer" varchar(100) COLLATE "pg_catalog"."default",
  "PurchaseDate" timestamp(6),
  "WarrantyDate" timestamp(6),
  "Status" varchar(100) COLLATE "pg_catalog"."default",
  "LocationOnLine" varchar(100) COLLATE "pg_catalog"."default",
  "Remarks" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."DeviceID" IS '设备ID';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."ProductionLineID" IS '产线ID';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."DeviceName" IS '设备名称';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."DeviceModel" IS '设备型号';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."Manufacturer" IS '制造商';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."PurchaseDate" IS '购买日期';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."WarrantyDate" IS '保修日期';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."Status" IS '设备状态';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."LocationOnLine" IS '线上位置';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."Remarks" IS '备注信息';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionLineDevice"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionLineDevice
-- ----------------------------
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('000fc915-0453-4938-a964-c63c13b00b15', 'd44efd10-028a-11f0-92bb-52540099312c', '奥利奥', '奥利奥', '奥利奥', '2025-03-17 00:00:00', '2025-03-18 00:00:00', '异常', NULL, '奥利奥', 1, '超级管理员', '2025-03-17 01:49:46', 1, '超级管理员', '2025-03-17 01:49:45');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('164d145d-7672-4993-b994-cb0cdbe12e77', 'd44efa4a-028a-11f0-92bb-52540099312c', '贴片机', 'TA0001', '台积电', '2025-03-03 00:00:00', '2025-03-18 00:00:00', '正常', NULL, '....', 1, '超级管理员', '2025-03-17 01:34:42', 1, '超级管理员', '2025-03-17 01:36:33');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('6b98a0c9-988b-401e-aff9-aa88440c80d7', 'd44efa4a-028a-11f0-92bb-52540099312c', '点胶机', 'TA0002', NULL, '2025-03-10 00:00:00', '2025-03-19 00:00:00', '正常', NULL, '...', 1, '超级管理员', '2025-03-17 01:36:33', 1, '超级管理员', '2025-03-17 01:36:32');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('8a9567b6-ab7a-4194-a152-aab255ba0c72', 'd44efd10-028a-11f0-92bb-52540099312c', '奥利奥plus', '奥利奥plus', '奥利奥plus', '2025-03-12 00:00:00', '2025-03-11 00:00:00', '正常', NULL, '奥利奥plus', 1, '超级管理员', '2025-03-17 01:49:46', 1, '超级管理员', '2025-03-17 01:49:45');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('a6ac613e-241a-41fa-a4cc-e5f08d0a0dce', 'd44efc2e-028a-11f0-92bb-52540099312c', '磨床', 'CA0002', '..。', '2025-03-11 00:00:00', NULL, '正常', NULL, '12..。', 1, '超级管理员', '2025-03-17 01:36:00', 1, '超级管理员', '2025-03-17 01:35:59');
INSERT INTO "public"."MES_ProductionLineDevice" VALUES ('cd9a6f48-5d81-46c4-9189-7f7c5fc9e163', 'd44efc2e-028a-11f0-92bb-52540099312c', '车床', 'CA0001', 'xxxx', '2025-03-03 00:00:00', NULL, '正常', NULL, '11', 1, '超级管理员', '2025-03-17 01:36:00', 1, '超级管理员', '2025-03-17 01:35:59');

-- ----------------------------
-- Table structure for MES_ProductionOrder
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionOrder";
CREATE TABLE "public"."MES_ProductionOrder" (
  "OrderID" uuid NOT NULL,
  "OrderNumber" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CustomerName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "OrderDate" timestamp(6) NOT NULL,
  "DeliveryDate" timestamp(6) NOT NULL,
  "OrderQty" int4,
  "OrderStatus" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "LV" varchar(255) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionOrder"."OrderID" IS '订单ID';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."OrderNumber" IS '订单编号';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."CustomerName" IS '客户名称';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."OrderDate" IS '订单日期';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."DeliveryDate" IS '交货日期';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."OrderQty" IS '订单数量';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."OrderStatus" IS '生产状态';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."LV" IS '优先级';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionOrder"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionOrder
-- ----------------------------
INSERT INTO "public"."MES_ProductionOrder" VALUES ('6648a795-02f5-11f0-92bb-52540099312c', 'PO00000005', '阳光电子集团', '2024-01-05 13:00:00', '2024-02-05 21:00:00', 300, '待生产', '1', 1, 'admin', '2024-01-05 13:00:00', 1, '超级管理员', '2025-03-18 14:50:47');
INSERT INTO "public"."MES_ProductionOrder" VALUES ('6648abb7-02f5-11f0-92bb-52540099312c', 'PO00000004', '瑞风科技有限公司', '2024-01-04 12:00:00', '2024-02-04 20:00:00', 8000, '待生产', '1', 1, 'admin', '2024-01-04 12:00:00', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO "public"."MES_ProductionOrder" VALUES ('6648aca8-02f5-11f0-92bb-52540099312c', 'PO00000003', '星辰电子公司', '2024-01-03 11:00:00', '2024-02-03 19:00:00', 1700, '生产中', '1', 1, 'admin', '2024-01-03 11:00:00', 1, '超级管理员', '2025-03-18 14:50:51');

-- ----------------------------
-- Table structure for MES_ProductionPlanChangeRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionPlanChangeRecord";
CREATE TABLE "public"."MES_ProductionPlanChangeRecord" (
  "ChangeRecordID" uuid NOT NULL,
  "PlanDetailID" uuid,
  "OrderNumber" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CustomerName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "OrderDate" timestamp(6),
  "ChangeDate" timestamp(6) NOT NULL,
  "OriginalPlanQuantity" int4 NOT NULL,
  "NewPlanQuantity" int4 NOT NULL,
  "OriginalPlannedStartTime" timestamp(6),
  "NewPlannedStartTime" timestamp(6),
  "OriginalPlannedEndTime" timestamp(6),
  "NewPlannedEndTime" timestamp(6),
  "ChangeReason" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ChangedBy" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."ChangeRecordID" IS '变更记录ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."PlanDetailID" IS '计划明细ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."OrderNumber" IS '订单编号';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."CustomerName" IS '客户名称';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."OrderDate" IS '订单日期';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."ChangeDate" IS '变更日期';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."OriginalPlanQuantity" IS '原计划数量';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."NewPlanQuantity" IS '新计划数量';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."OriginalPlannedStartTime" IS '原计划开始时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."NewPlannedStartTime" IS '新计划开始时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."OriginalPlannedEndTime" IS '原计划结束时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."NewPlannedEndTime" IS '新计划结束时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."ChangeReason" IS '变更原因';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."ChangedBy" IS '变更人';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionPlanChangeRecord"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionPlanChangeRecord
-- ----------------------------
INSERT INTO "public"."MES_ProductionPlanChangeRecord" VALUES ('92fd73c5-f999-4a17-a4f2-fb94253e62da', NULL, 'CA2025021000001', '星星电子', '2025-03-10 00:00:00', '2025-03-18 00:00:00', 12000, 8000, NULL, NULL, NULL, NULL, '。。。。。', 'admin', 1, '超级管理员', '2025-03-17 19:34:06', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_ProductionPlanDetail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionPlanDetail";
CREATE TABLE "public"."MES_ProductionPlanDetail" (
  "PlanDetailID" uuid NOT NULL,
  "OrderID" uuid,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default",
  "Unit" varchar(100) COLLATE "pg_catalog"."default",
  "PlanQuantity" int4,
  "PlannedStartTime" timestamp(6),
  "PlannedEndTime" timestamp(6),
  "PlanStatus" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."PlanDetailID" IS '计划明细ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."OrderID" IS '订单ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."MaterialSpecification" IS '物料规格';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."Unit" IS '单位';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."PlanQuantity" IS '计划数量';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."PlannedStartTime" IS '计划开始时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."PlannedEndTime" IS '计划结束时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."PlanStatus" IS '计划状态';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionPlanDetail"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionPlanDetail
-- ----------------------------
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('1012861c-89f2-4337-9718-3c79c72d3fd6', '6648aca8-02f5-11f0-92bb-52540099312c', 'AKG0000004', '双层瓦楞纸箱', '尺寸：500mm×300mm×200mm', '件', 800, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:34', 1, '超级管理员', '2025-03-18 14:50:51');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('40139c6f-6697-489d-8bee-46d888a1bb53', '6648aca8-02f5-11f0-92bb-52540099312c', 'AKG0000005', 'A4 复印纸', '70g，500 张/包', '包', 900, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:34', 1, '超级管理员', '2025-03-18 14:50:51');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('4d1ed687-fc78-419a-8128-29b0dc75e486', '6648abb7-02f5-11f0-92bb-52540099312c', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', '片', 2000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('6a7a9c6f-61f3-4cf4-9c1c-4304f8bc2eff', '6648abb7-02f5-11f0-92bb-52540099312c', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', '件', 2000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('af2d3f94-5912-412d-89a1-26a16d9d00ae', '6648abb7-02f5-11f0-92bb-52540099312c', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', '吨', 4000, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 19:08:29', 1, '超级管理员', '2025-03-18 14:50:49');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('afebc1a7-e112-43a4-a766-2e8987e0dbcc', '6648a795-02f5-11f0-92bb-52540099312c', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', '吨', 100, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 18:43:57', 1, '超级管理员', '2025-03-18 14:50:47');
INSERT INTO "public"."MES_ProductionPlanDetail" VALUES ('c1876253-995a-4303-bc1a-15af7742515a', '6648a795-02f5-11f0-92bb-52540099312c', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', '片', 200, NULL, NULL, NULL, 1, '超级管理员', '2025-03-17 18:43:57', 1, '超级管理员', '2025-03-18 14:50:47');

-- ----------------------------
-- Table structure for MES_ProductionReporting
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionReporting";
CREATE TABLE "public"."MES_ProductionReporting" (
  "ReportingID" uuid NOT NULL,
  "ReportingNumber" varchar(100) COLLATE "pg_catalog"."default",
  "OrderID" uuid,
  "ReportedBy" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ReportingTime" timestamp(6),
  "ReportHour" numeric(2),
  "Total" int4,
  "AcceptedQuantity" int4,
  "RejectedQuantity" int4,
  "AuditStatus" int4,
  "Auditor" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ReportingID" IS '报工ID';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ReportingNumber" IS '报工单号';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."OrderID" IS '订单ID';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ReportedBy" IS '报工人';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ReportingTime" IS '报工时间';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ReportHour" IS '工时(小时)';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."Total" IS '报工数量';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."AcceptedQuantity" IS '合格数量';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."RejectedQuantity" IS '不合格数量';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."AuditStatus" IS '审批状态';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."Auditor" IS '审批人';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionReporting"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionReporting
-- ----------------------------
INSERT INTO "public"."MES_ProductionReporting" VALUES ('34a8e0fb-1b90-4358-a1fb-004a6a9e9f93', 'BG202503180007', NULL, '3362', '2024-06-05 19:00:00', 10, 380, 490, 60, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04', NULL, NULL, '2025-03-20 21:42:04');
INSERT INTO "public"."MES_ProductionReporting" VALUES ('9356d9e8-8b3a-41c5-a2fc-f805e60ac867', 'BG202503180008', NULL, '1', '2025-03-18 00:00:00', 22, 290, 274, 6, 0, NULL, 1, '超级管理员', '2025-03-24 02:12:41', 1, '超级管理员', '2025-03-24 02:12:49');
INSERT INTO "public"."MES_ProductionReporting" VALUES ('d902044f-abd1-42ab-b3d8-9e63f431b410', 'BG202503180006', NULL, '3362', '2024-06-05 19:00:00', 4, 300, 390, 10, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04', NULL, NULL, '2025-03-20 21:42:04');
INSERT INTO "public"."MES_ProductionReporting" VALUES ('f8fb5b93-0b38-4892-aa8d-7d3a00b89afd', 'BG202503180004', NULL, '3362', '2024-06-05 19:00:00', 7, 180, 280, 30, 0, NULL, 1, '超级管理员', '2025-03-20 21:42:04', NULL, NULL, '2025-03-20 21:42:04');

-- ----------------------------
-- Table structure for MES_ProductionReportingDetail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_ProductionReportingDetail";
CREATE TABLE "public"."MES_ProductionReportingDetail" (
  "DetailID" uuid NOT NULL,
  "ReportingID" uuid,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ReportHour" numeric(11,2),
  "ReportedQuantity" int4 NOT NULL,
  "AcceptedQuantity" int4 NOT NULL,
  "RejectedQuantity" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."DetailID" IS '明细ID';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."ReportingID" IS '报工ID';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."MaterialSpecification" IS '物料规格';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."ReportHour" IS '工时(小时)';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."ReportedQuantity" IS '报工数量';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."AcceptedQuantity" IS '合格数量';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."RejectedQuantity" IS '不合格数量';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_ProductionReportingDetail"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_ProductionReportingDetail
-- ----------------------------
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('017f792c-4520-43a8-a649-c5e1ed5a28c1', 'd902044f-abd1-42ab-b3d8-9e63f431b410', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 1.50, 200, 200, 0, 1, '超级管理员', '2025-03-18 16:09:41', 1, '超级管理员', '2025-03-18 15:58:24');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('0ae90653-97a9-43a2-9ede-a38967d7b434', '34a8e0fb-1b90-4358-a1fb-004a6a9e9f93', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 1.50, 200, 200, 0, 1, '超级管理员', '2025-03-18 16:09:52', 1, '超级管理员', '2025-03-18 16:09:24');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('2988903b-f36f-439f-a0f9-ca410cb3032e', '9356d9e8-8b3a-41c5-a2fc-f805e60ac867', 'AKG0000004', '双层瓦楞纸箱', '尺寸：500mm×300mm×200mm', 10.00, 90, 84, 5, 1, '超级管理员', '2025-03-24 02:12:41', 1, '超级管理员', '2025-03-24 02:12:49');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('3f665f4b-ace1-4644-a706-d31552c84cb5', 'f8fb5b93-0b38-4892-aa8d-7d3a00b89afd', 'AKG0000004', '米其林轮胎', '。。。。。。。', 5.00, 80, 90, 20, 1, '超级管理员', '2025-03-18 16:09:20', NULL, NULL, NULL);
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('7d48b30b-8b7c-4403-abf8-690e52762e44', '34a8e0fb-1b90-4358-a1fb-004a6a9e9f93', 'AKG0000004', '米其林轮胎', '。。。。。。。', 6.00, 80, 100, 50, 1, '超级管理员', '2025-03-18 16:09:52', 1, '超级管理员', '2025-03-18 16:09:24');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('c1cf52d2-e98a-43ba-92de-3c757d7c41f1', 'f8fb5b93-0b38-4892-aa8d-7d3a00b89afd', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:20', 1, '超级管理员', '2025-03-18 15:58:24');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('c437274d-2be9-44ef-b8f0-85b8c6040c31', 'd902044f-abd1-42ab-b3d8-9e63f431b410', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:41', 1, '超级管理员', '2025-03-18 15:58:24');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('e13eda90-0c3e-436e-8b49-2631f916dbdc', '34a8e0fb-1b90-4358-a1fb-004a6a9e9f93', 'AKG0000002', '架构芯片', 'Cortex - M3 内核，主频 100MHz', 2.00, 100, 190, 10, 1, '超级管理员', '2025-03-18 16:09:52', 1, '超级管理员', '2025-03-18 16:09:24');
INSERT INTO "public"."MES_ProductionReportingDetail" VALUES ('ff6dfe2e-f793-487d-8a43-519f14dbd745', '9356d9e8-8b3a-41c5-a2fc-f805e60ac867', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 12.00, 200, 190, 1, 1, '超级管理员', '2025-03-24 02:12:41', 1, '超级管理员', '2025-03-24 02:12:49');

-- ----------------------------
-- Table structure for MES_QualityInspectionPlan
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_QualityInspectionPlan";
CREATE TABLE "public"."MES_QualityInspectionPlan" (
  "InspectionPlanID" uuid NOT NULL,
  "InspectionPlanNumber" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "OrderID" uuid,
  "PlanStartTime" timestamp(6) NOT NULL,
  "PlanEndTime" timestamp(6) NOT NULL,
  "ResponsiblePerson" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "PlanStatus" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."InspectionPlanID" IS '检验计划ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."InspectionPlanNumber" IS '检验计划单号';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."OrderID" IS '订单ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."PlanStartTime" IS '计划开始时间';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."PlanEndTime" IS '计划结束时间';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."ResponsiblePerson" IS '责任人';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."PlanStatus" IS '计划状态';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlan"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_QualityInspectionPlan
-- ----------------------------
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('60475294-c153-4c7c-8645-9209d9eb7be4', 'QIP202503190001', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '3362', NULL, 1, '超级管理员', '2025-03-19 01:48:58', 1, '超级管理员', '2025-03-19 01:50:48');
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('6e58e213-f8e9-4032-9dc7-d62d76a418d9', 'QIP202503190003', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '3362', NULL, 1, '超级管理员', '2025-03-19 01:49:46', 1, '超级管理员', '2025-03-19 01:50:41');
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('cc7fe857-0608-4872-8e8b-754e41c4609a', 'QIP202503190002', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '1', NULL, 1, '超级管理员', '2025-03-19 01:49:40', 1, '超级管理员', '2025-03-19 01:50:44');
INSERT INTO "public"."MES_QualityInspectionPlan" VALUES ('fc4a1634-e1e0-4455-acf8-4d097a95ca56', 'QIP202503190004', NULL, '2024-07-01 09:00:00', '2024-07-02 17:00:00', '1', NULL, 1, '超级管理员', '2025-03-19 01:49:50', 1, '超级管理员', '2025-03-19 01:50:38');

-- ----------------------------
-- Table structure for MES_QualityInspectionPlanDetail
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_QualityInspectionPlanDetail";
CREATE TABLE "public"."MES_QualityInspectionPlanDetail" (
  "InspectionPlanDetailID" uuid NOT NULL,
  "InspectionPlanID" uuid,
  "MaterialCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "MaterialName" varchar(100) COLLATE "pg_catalog"."default",
  "MaterialSpecification" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "QuantityToInspect" int4 NOT NULL,
  "InspectionMethod" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "InspectionStandard" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."InspectionPlanDetailID" IS '检验计划明细ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."InspectionPlanID" IS '检验计划ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."MaterialCode" IS '物料编号';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."MaterialName" IS '物料名称';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."MaterialSpecification" IS '物料规格';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."QuantityToInspect" IS '检验数量';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."InspectionMethod" IS '检验方法';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."InspectionStandard" IS '检验标准';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_QualityInspectionPlanDetail"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_QualityInspectionPlanDetail
-- ----------------------------
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('3151bae6-9b91-46cc-8615-11c3cb2afaa6', '6e58e213-f8e9-4032-9dc7-d62d76a418d9', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:47', 1, '超级管理员', '2025-03-19 01:50:41');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('4c946033-91ae-4f7e-a11e-c9fd20f0e373', 'cc7fe857-0608-4872-8e8b-754e41c4609a', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:41', 1, '超级管理员', '2025-03-19 01:50:44');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('8270f2e3-71ba-4074-bbd5-c97c981dda3d', '60475294-c153-4c7c-8645-9209d9eb7be4', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:48:59', 1, '超级管理员', '2025-03-19 01:50:48');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('89d373c2-5fce-4915-a661-0f10d47112a5', '6e58e213-f8e9-4032-9dc7-d62d76a418d9', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:47', 1, '超级管理员', '2025-03-19 01:50:41');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('b7ad76cd-0c56-40da-beee-0a096148b00f', '60475294-c153-4c7c-8645-9209d9eb7be4', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:48:59', 1, '超级管理员', '2025-03-19 01:50:48');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('bb066d57-83ad-45c5-bb6e-3041b1ea65f6', 'fc4a1634-e1e0-4455-acf8-4d097a95ca56', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:51', 1, '超级管理员', '2025-03-19 01:50:38');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('c6291518-07ca-4abd-bd9a-63f51ff4a68f', 'fc4a1634-e1e0-4455-acf8-4d097a95ca56', 'AKG0000003', '聚乙烯（PE）', '低密度，颗粒状', 290, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:51', 1, '超级管理员', '2025-03-19 01:50:38');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('e29789ce-3501-4a57-87d6-9ea292f193f8', 'cc7fe857-0608-4872-8e8b-754e41c4609a', 'AKG0000001', '碳素结构钢', 'Q235B，厚度 5mm', 100, '抽样检查', '抽样检查', 1, '超级管理员', '2025-03-19 01:49:41', 1, '超级管理员', '2025-03-19 01:50:44');
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d80f7-041f-11f0-92bb-52540099312c', 'e92bea50-041f-11f0-92bb-52540099312c', 'M001', '电阻', '100Ω', 500, '抽样检验', '阻值偏差±5%', 1, 'admin', '2024-07-01 08:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d82a2-041f-11f0-92bb-52540099312c', 'e92becd6-041f-11f0-92bb-52540099312c', 'M002', '电容', '10μF', 300, '全检', '容量偏差±3%', 1, 'admin', '2024-07-03 09:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d83cd-041f-11f0-92bb-52540099312c', 'e92bed65-041f-11f0-92bb-52540099312c', 'M003', '线路板', 'PCB-A100', 200, '功能测试', '无短路、断路', 1, 'admin', '2024-07-05 10:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d8477-041f-11f0-92bb-52540099312c', 'e92bedcf-041f-11f0-92bb-52540099312c', 'M004', '塑料粒子', 'PP-500', 400, '外观检验', '无杂质、色泽均匀', 1, 'admin', '2024-07-07 11:00:00', NULL, NULL, NULL);
INSERT INTO "public"."MES_QualityInspectionPlanDetail" VALUES ('ec9d8507-041f-11f0-92bb-52540099312c', 'e92bee39-041f-11f0-92bb-52540099312c', 'M005', '螺丝', 'M3x10', 600, '尺寸检验', '直径偏差±0.1mm', 1, 'admin', '2024-07-09 12:00:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for MES_QualityInspectionRecord
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_QualityInspectionRecord";
CREATE TABLE "public"."MES_QualityInspectionRecord" (
  "InspectionRecordID" uuid NOT NULL,
  "InspectionPlanDetailID" uuid,
  "InspectionNumber" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "Inspector" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "InspectionTime" timestamp(6) NOT NULL,
  "InspectedQuantity" int4 NOT NULL,
  "PassedQuantity" int4 NOT NULL,
  "FailedQuantity" int4 NOT NULL,
  "InspectionResult" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "DefectDescription" varchar(100) COLLATE "pg_catalog"."default",
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."InspectionRecordID" IS '检验记录ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."InspectionPlanDetailID" IS '检验计划明细ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."InspectionNumber" IS '检验单号';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."Inspector" IS '检验员';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."InspectionTime" IS '检验时间';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."InspectedQuantity" IS '实际检验数量';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."PassedQuantity" IS '合格数量';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."FailedQuantity" IS '不合格数量';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."InspectionResult" IS '检验结果（合格、不合格）';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."DefectDescription" IS '缺陷描述';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_QualityInspectionRecord"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_QualityInspectionRecord
-- ----------------------------
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769acb9-0421-11f0-92bb-52540099312c', 'ff1b025b-0421-11f0-92bb-52540099312c', 'QIR001', '1', '2024-07-01 10:00:00', 500, 480, 20, '不合格', '部分电阻阻值偏差超过±5%', 1, 'admin', '2024-07-01 10:00:00', 1, '超级管理员', '2025-03-19 01:56:01');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769ae7c-0421-11f0-92bb-52540099312c', 'ff1b049d-0421-11f0-92bb-52540099312c', 'QIR002', '3362', '2024-07-03 11:00:00', 300, 290, 10, '不合格', '少数电容容量偏差超过±3%', 1, 'admin', '2024-07-03 11:00:00', 1, '超级管理员', '2025-03-19 01:55:58');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769af6b-0421-11f0-92bb-52540099312c', 'ff1b0534-0421-11f0-92bb-52540099312c', 'QIR003', '3362', '2024-07-05 12:00:00', 200, 190, 10, '不合格', '几块线路板存在短路问题', 1, 'admin', '2024-07-05 12:00:00', 1, '超级管理员', '2025-03-19 01:55:54');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769b023-0421-11f0-92bb-52540099312c', 'ff1b05a7-0421-11f0-92bb-52540099312c', 'QIR004', '3362', '2024-07-07 13:00:00', 400, 380, 20, '合格', '部分塑料粒子有杂质', 1, 'admin', '2024-07-07 13:00:00', 1, '超级管理员', '2025-03-19 01:56:49');
INSERT INTO "public"."MES_QualityInspectionRecord" VALUES ('f769b22d-0421-11f0-92bb-52540099312c', 'ff1b0616-0421-11f0-92bb-52540099312c', 'QIR005', '1', '2024-07-09 14:00:00', 600, 570, 30, '合格', '部分螺丝直径偏差超过±0.1mm', 1, 'admin', '2024-07-09 14:00:00', 1, '超级管理员', '2025-03-19 01:56:46');

-- ----------------------------
-- Table structure for MES_SchedulingPlan
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_SchedulingPlan";
CREATE TABLE "public"."MES_SchedulingPlan" (
  "SchedulePlanID" uuid NOT NULL,
  "PlanName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ProductionLine" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "TeamName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "StartDate" timestamp(6) NOT NULL,
  "EndDate" timestamp(6) NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."SchedulePlanID" IS '排班计划ID';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."PlanName" IS '排班计划名称';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."ProductionLine" IS '产线名称';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."TeamName" IS '班组名称';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."StartDate" IS '开始时间';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."EndDate" IS '结束时间';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_SchedulingPlan"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_SchedulingPlan
-- ----------------------------
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c24f1-0422-11f0-92bb-52540099312c', 'SMT产线1月排班计划', 'SMT贴片生产线', 'SMT一组', '2024-01-01 08:00:00', '2024-01-31 17:00:00', 1, 'admin', '2024-01-01 09:00:00', 1, '超级管理员', '2025-03-19 02:00:45');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c268a-0422-11f0-92bb-52540099312c', '注塑产线1月排班计划', '注塑生产线', '注塑一组', '2024-01-01 09:00:00', '2024-01-31 18:00:00', 1, 'admin', '2024-01-02 10:00:00', 1, '超级管理员', '2025-03-19 02:00:44');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c279a-0422-11f0-92bb-52540099312c', '总装产线1月排班计划', '总装生产线', '总装一组', '2024-01-01 10:00:00', '2024-01-31 19:00:00', 1, 'admin', '2024-01-03 11:00:00', 1, '超级管理员', '2025-03-19 02:00:42');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c2835-0422-11f0-92bb-52540099312c', '检测产线1月排班计划', '检测生产线', '检测一组', '2024-01-01 11:00:00', '2024-01-31 20:00:00', 1, 'admin', '2024-01-04 12:00:00', 1, '超级管理员', '2025-03-19 02:00:40');
INSERT INTO "public"."MES_SchedulingPlan" VALUES ('9c2c28b9-0422-11f0-92bb-52540099312c', '包装产线1月排班计划', '包装生产线', '包装一组', '2024-01-01 12:00:00', '2024-01-31 21:00:00', 1, 'admin', '2024-01-05 13:00:00', 1, '超级管理员', '2025-03-19 02:00:38');

-- ----------------------------
-- Table structure for MES_Supplier
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_Supplier";
CREATE TABLE "public"."MES_Supplier" (
  "SupplierID" uuid NOT NULL,
  "SupplierName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
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
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_Supplier"."SupplierID" IS '供应商ID';
COMMENT ON COLUMN "public"."MES_Supplier"."SupplierName" IS '供应商名';
COMMENT ON COLUMN "public"."MES_Supplier"."ContactPerson" IS '联系人';
COMMENT ON COLUMN "public"."MES_Supplier"."ContactPhone" IS '联系电话';
COMMENT ON COLUMN "public"."MES_Supplier"."Email" IS '邮箱地址';
COMMENT ON COLUMN "public"."MES_Supplier"."Address" IS '联系地址';
COMMENT ON COLUMN "public"."MES_Supplier"."SupplierType" IS '供应商类型';
COMMENT ON COLUMN "public"."MES_Supplier"."ProductRange" IS '供应范围';
COMMENT ON COLUMN "public"."MES_Supplier"."QualityRating" IS '质量评级';
COMMENT ON COLUMN "public"."MES_Supplier"."Remarks" IS '备注信息';
COMMENT ON COLUMN "public"."MES_Supplier"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_Supplier"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_Supplier"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_Supplier"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_Supplier"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_Supplier"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_Supplier
-- ----------------------------
INSERT INTO "public"."MES_Supplier" VALUES ('fd83f9a1-0289-11f0-92bb-52540099312c', '绿韵包装材料供应商', '刘女士', '13378901234', 'lvyun@example.com', '杭州市西湖区', '包装材料供应商', '环保包装材料', 'A', '。。。。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:14:36');
INSERT INTO "public"."MES_Supplier" VALUES ('fd83fb2f-0289-11f0-92bb-52540099312c', '宝盛包装用品供应商', '孙先生', '13289012345', 'baosheng@example.com', '南京市鼓楼区', '包装材料供应商', '各类包装用品', 'B', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:14:53');
INSERT INTO "public"."MES_Supplier" VALUES ('fd83fb7b-0289-11f0-92bb-52540099312c', '逸彩印刷包装供应商', '周先生', '13190123456', 'yicai@example.com', '成都市武侯区', '包装材料供应商', '印刷包装产品', 'A', '印刷工艺。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:14:59');
INSERT INTO "public"."MES_Supplier" VALUES ('fd8f3146-0289-11f0-92bb-52540099312c', '宏泰生产设备供应商', '吴先生', '13001234567', 'hongtai@example.com', '武汉市武昌区', '设备供应商', '生产设备', 'A', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:15:03');
INSERT INTO "public"."MES_Supplier" VALUES ('fd8f32c3-0289-11f0-92bb-52540099312c', '锐翔检测设备供应商', '郑女士', '18812345678', 'ruixiang@example.com', '西安市碑林区', '设备供应商', '检测设备', 'B', '检测精度较高。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:15:11');
INSERT INTO "public"."MES_Supplier" VALUES ('fd8f3302-0289-11f0-92bb-52540099312c', '丰能能源设备供应商', '钱先生', '18923456789', 'fengneng@example.com', '沈阳市和平区', '设备供应商', '能源设备', 'A', '。。。。。。', 1, '管理员', '2025-03-17 01:13:33', 1, '超级管理员', '2025-03-17 01:15:07');

-- ----------------------------
-- Table structure for MES_WarehouseManagement
-- ----------------------------
DROP TABLE IF EXISTS "public"."MES_WarehouseManagement";
CREATE TABLE "public"."MES_WarehouseManagement" (
  "WarehouseID" uuid NOT NULL,
  "WarehouseCode" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "WarehouseName" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "WarehouseType" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseArea" numeric(10,2) NOT NULL,
  "WarehouseAddress" varchar(100) COLLATE "pg_catalog"."default",
  "WarehousePhone" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseManager" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseStatus" varchar(100) COLLATE "pg_catalog"."default",
  "WarehouseCapacity" int4 NOT NULL,
  "CreateID" int4,
  "Creator" varchar(100) COLLATE "pg_catalog"."default",
  "CreateDate" timestamp(6),
  "ModifyID" int4,
  "Modifier" varchar(100) COLLATE "pg_catalog"."default",
  "ModifyDate" timestamp(6)
)
;
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseID" IS '仓库ID';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseCode" IS '仓库编码';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseName" IS '仓库名称';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseType" IS '仓库类型';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseArea" IS '仓库面积';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseAddress" IS '仓库地址';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehousePhone" IS '仓库电话';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseManager" IS '仓库管理员';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseStatus" IS '仓库状态';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."WarehouseCapacity" IS '仓库容量';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."CreateID" IS '创建人ID';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."Creator" IS '创建人';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."CreateDate" IS '创建时间';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."ModifyID" IS '修改人ID';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."Modifier" IS '修改人';
COMMENT ON COLUMN "public"."MES_WarehouseManagement"."ModifyDate" IS '修改时间';

-- ----------------------------
-- Records of MES_WarehouseManagement
-- ----------------------------
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896a', 'WH001', '原材料仓库', '原材料存储', 1000.50, '工厂A区', '021-12345678', '李明', '1', 5000, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:34');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896b', 'WH002', '成品仓库', '成品存储', 1200.00, '工厂B区', '021-23456789', '张华', '1', 6000, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:37');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896c', 'WH003', '半成品仓库', '半成品存储', 800.25, '工厂C区', '021-34567890', '王强', '0', 3500, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:44');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896d', 'WH004', '不良品仓库', '不良品暂存', 300.75, '工厂D区', '021-45678901', '刘悦', '1', 1000, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:41');
INSERT INTO "public"."MES_WarehouseManagement" VALUES ('1c19c214-9d78-4596-b078-789f7755896e', 'WH005', '包装材料仓库', '包装材料存储', 650.00, '工厂E区', '021-56789012', '陈杰', '0', 4500, 1, 'admin', '2025-03-16 23:16:24', 1, '超级管理员', '2025-03-17 00:16:47');

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
  "Order_Id" uuid NOT NULL,
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
INSERT INTO "public"."SellOrderList" VALUES ('08d72cf6-d9f5-bee9-32ff-5808ff1238cb', '6efb65b8-585e-4be7-8b77-94c76e362412', '测试', '测试', 7, 8.00, NULL, 1, '超级管理员', '2019-08-30 11:05:03', 1, '超级管理员', '2019-08-30 11:05:19');
INSERT INTO "public"."SellOrderList" VALUES ('08d72cf6-ed6c-f0e0-9e97-5930a04f2ebc', 'ad698348-1535-4221-9a1a-57db5cb351e4', '2', '2', 2, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:35', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('3d1467b1-11e0-4404-e3fd-08db53868e51', '55ae8c6c-6a11-4765-952a-7b4a3adece04', '2', '20230513000001', 12400, 11.00, NULL, 1, '超级管理员', '2023-05-13 15:49:18', 1, '超级管理员', '2023-05-13 15:49:27');
INSERT INTO "public"."SellOrderList" VALUES ('893cee01-ad76-4894-fbf3-08db5392eaa0', '323ab96f-49c1-4100-9d08-17db9f209df7', '2', '123', 200, NULL, NULL, 1, '超级管理员', '2023-05-13 17:17:47', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('be0a328c-6ecc-419b-7b3c-08db53917efb', 'b1db23bd-ed48-4459-b9ed-355d97a7e16e', '2', '1000', 2000, NULL, NULL, 1, '超级管理员', '2023-05-13 17:07:37', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('ccdfcd1d-e0de-4cae-7485-08db5387deb9', 'b67b7ec0-136c-4439-a530-cd6dd4d69a9c', '2', '2023051300000002', 12321, NULL, NULL, 1, '超级管理员', '2023-05-13 15:58:43', 1, '超级管理员', '2023-05-13 17:07:14');
INSERT INTO "public"."SellOrderList" VALUES ('df13a279-7ea4-47c0-fbf4-08db5392eaa0', '81d5db86-c85a-4b06-bc3a-08142811c522', '2', '111', 2000, NULL, NULL, 1, '超级管理员', '2023-05-13 17:19:06', NULL, NULL, NULL);
INSERT INTO "public"."SellOrderList" VALUES ('fc332cef-c1eb-4063-b71c-6addf19a8e8b', '6efb65b8-585e-4be7-8b77-94c76e362412', '22', '2', 0, NULL, NULL, 1, '超级管理员', '2019-08-30 11:05:19', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for Sys_City
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_City";
CREATE TABLE "public"."Sys_City" (
  "CityId" int4 NOT NULL,
  "CityCode" varchar(20) COLLATE "pg_catalog"."default",
  "CityName" varchar(30) COLLATE "pg_catalog"."default",
  "ProvinceCode" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Sys_City
-- ----------------------------

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
INSERT INTO "public"."Sys_Department" VALUES ('41b96ea8-5475-4775-845d-fd66370c75ae', '上海市场研究院', 'H0001', NULL, NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 09:15:56', 1, '超级管理员', '2023-05-13 09:50:37');
INSERT INTO "public"."Sys_Department" VALUES ('62105dfa-ca64-4c4a-ab42-11ba677ac4db', '市场部', 'A003', '8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:12:48', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('8974177f-af6b-45b5-b7ab-88f169063f40', '北京基础研究院', 'A0001', NULL, NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 08:56:16', 1, '超级管理员', '2023-05-13 09:50:34');
INSERT INTO "public"."Sys_Department" VALUES ('97b5ff9c-5f52-4745-95f9-5fed8d505fa9', '资源部', 'H0007', '41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, '还没想好', 1, '超级管理员', '2023-05-13 09:50:27', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('9e1121a0-d5c5-4f46-8dd4-43ed90d2f963', '行政部', 'A005', '8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:13:18', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('d01eb5d9-0f02-4468-94b8-635a5dfb3142', '商务部', 'A0002', '8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:07:16', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('e5d8e8af-3659-454c-aa8e-c201c7edbcfb', '销售部', 'A004', '62105dfa-ca64-4c4a-ab42-11ba677ac4db', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:13:03', 1, '超级管理员', '2023-05-13 09:14:27');
INSERT INTO "public"."Sys_Department" VALUES ('e8c6cc16-af09-495d-b101-b651f10196de', '战略部', 'H0002', '41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:19:55', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('eae332dc-4af8-4ebf-804a-e3d6c6d00926', '人事部', NULL, '9e1121a0-d5c5-4f46-8dd4-43ed90d2f963', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:14:41', NULL, NULL, NULL);
INSERT INTO "public"."Sys_Department" VALUES ('ec238385-f907-44de-b99b-0eddcffa6750', '产品部', 'A0003', '41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, NULL, 1, '超级管理员', '2023-05-13 09:20:26', NULL, NULL, NULL);

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
INSERT INTO "public"."Sys_Dictionary" VALUES (3, '{valueField: ''Enable'',
textField: ''Enable'',
 containField: null,
  handler: null }', '2019-07-05 17:36:23', NULL, 'admin', NULL, NULL, '是否值', 'enable', 1, '超级管理员', '2024-06-03 23:59:03', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (30, '{valueField: ''Success'',
 textField: ''Success'', 
 containField: null,
 handler: null }
', '2018-06-11 18:26:05', 0, '测试超级管理员', NULL, NULL, '响应状态', 'restatus', 1, '超级管理员', '2024-06-04 00:06:59', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (31, '{valueField: ''LogType'',
 textField: ''LogType'', 
 containField: null,
 handler: null }
', '2018-06-12 14:46:07', NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', 1, '超级管理员', '2024-06-03 23:59:21', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (35, '{
 valueField: ''AuditStatus'',
 textField: ''AuditStatus'',
  containField:null 
}', '2018-07-10 10:51:37', NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', 1, '超级管理员', '2024-06-04 00:04:02', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (49, '{
 valueField: ''Gender'',
 textField: ''Gender'',
  containField:null 
}', '2018-07-23 10:04:45', NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', 1, '超级管理员', '2024-06-03 23:59:30', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (50, '{
 valueField: ''Enable'',
 textField: ''Enable'',
  containField:null 
}', '2018-07-23 15:36:43', 1, '测试超级管理员', NULL, NULL, '启用状态', 'status', 1, '超级管理员', '2024-06-04 00:03:53', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (70, NULL, '2023-05-19 01:20:29', 1, '超级管理员', 'SysDbContext', NULL, '组织类型', '组织类型', 1, '超级管理员', '2024-06-04 00:07:11', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (85, NULL, '2023-10-07 14:40:56', 1, '超级管理员', NULL, NULL, '请求方式', '请求方式', 1, '超级管理员', '2024-06-03 23:51:26', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (87, NULL, '2024-06-03 23:44:55', 1, '超级管理员', NULL, NULL, '系统字典', '系统字典', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (94, NULL, '2025-03-17 00:18:30', 1, '超级管理员', NULL, NULL, 'mes业务', 'mes业务', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (95, NULL, '2025-03-17 00:19:59', 1, '超级管理员', NULL, NULL, '仓库类型', '仓库类型', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (98, NULL, '2025-03-17 01:29:20', 1, '超级管理员', NULL, NULL, '物料单位', '物料单位', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (103, NULL, '2025-03-18 14:25:58', 1, '超级管理员', NULL, NULL, '排产状态', '排产状态', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (104, NULL, '2025-03-18 14:27:21', 1, '超级管理员', NULL, NULL, '优先级', '优先级', 1, NULL, NULL, NULL, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (106, NULL, '2025-03-19 01:27:42', 1, '超级管理员', 'ServiceDbContext', 'SELECT "SupplierID" as "key", "SupplierName" as "value" from "MES_Supplier"', '供应商', '供应商', 1, '超级管理员', '2025-10-24 17:59:22.579745', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (105, NULL, '2025-03-18 15:20:31', 1, '超级管理员', NULL, 'SELECT "User_Id" as "key", "UserTrueName" as "value" from "Sys_User"', '用户列表', '用户列表', 1, '超级管理员', '2025-10-24 17:59:39.847012', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (102, NULL, '2025-03-17 18:31:19', 1, '超级管理员', 'ServiceDbContext', 'SELECT "MaterialCode" as "key", "MaterialName" as "value", "Unit", "Specification" from "MES_Material"', '物料列表', '物料列表', 1, '超级管理员', '2025-10-24 17:59:50.597519', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (101, NULL, '2025-03-17 11:13:47', 1, '超级管理员', 'ServiceDbContext', 'SELECT "CatalogID" as "key", "CatalogID" as "id", "CatalogName" as "value", "ParentId" as "parentId" from "MES_MaterialCatalog"', '物料分类', '物料分类', 1, '超级管理员', '2025-10-24 18:00:05.859995', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (100, NULL, '2025-03-17 02:14:14', 1, '超级管理员', 'ServiceDbContext', 'SELECT "ProcessID" as "key", "ProcessName" as "value" from "MES_Process"', '工序', '工序', 1, '超级管理员', '2025-10-24 18:00:17.334158', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (99, NULL, '2025-03-17 01:56:46', 1, '超级管理员', 'ServiceDbContext', 'SELECT "EquipmentID" as "key", "EquipmentName" as "value" from "MES_EquipmentManagement"', '设备列表', '设备列表', 1, '超级管理员', '2025-10-24 18:00:29.397519', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (97, NULL, '2025-03-17 00:33:52', 1, '超级管理员', 'ServiceDbContext', 'SELECT "WarehouseID" as "key", "WarehouseName" as "value" from "MES_WarehouseManagement"', '仓库', '仓库', 1, '超级管理员', '2025-10-24 18:00:43.725105', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (96, NULL, '2025-03-17 00:32:39', 1, '超级管理员', 'ServiceDbContext', 'SELECT "LocationID" as "key", "LocationName" as "value", "WarehouseID" from "MES_LocationManagement"', '货位', '货位', 1, '超级管理员', '2025-10-24 18:00:56.166009', 1, NULL, 94, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (67, NULL, '2023-05-04 02:13:14', 1, '超级管理员', NULL, 'SELECT "DepartmentId" AS "id", "DepartmentId" AS "key", "ParentId" AS "parentId", "DepartmentName" AS "value" FROM "Sys_Department"', '部门级联', '部门级联', 1, '超级管理员', '2025-10-24 18:01:41.526607', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (32, '{valueField: ''Role_Id'',
 textField: ''RoleName'', 
 containField: [''Role_Id'',''RoleName''],
 handler: null }
', '2018-06-14 16:48:35', NULL, '测试超级管理员', NULL, 'SELECT "Role_Id" as "key", "RoleName" as "value" FROM "Sys_Role" WHERE "Enable"=1', '角色列表', 'roles', 1, '超级管理员', '2025-10-24 18:02:15.845293', 1, 123, 87, 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "public"."Sys_Dictionary" VALUES (66, NULL, '2020-12-29 21:50:16', 1, '超级管理员', NULL, 'SELECT "Role_Id" AS "id", "ParentId" as "parentId", "Role_Id" AS "key", "RoleName" AS "value" FROM "Sys_Role"', '级联角色', 'tree_roles', 1, '超级管理员', '2025-10-24 18:03:53.018992', 1, NULL, 87, NULL);
INSERT INTO "public"."Sys_Dictionary" VALUES (1001, NULL, '2025-10-24 18:14:56.943726', 1, '超级管理员', NULL, NULL, '321', '11', 1, NULL, NULL, NULL, NULL, 87, NULL);

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
INSERT INTO "public"."Sys_DictionaryList" VALUES (447, '2023-10-07 14:40:56', 1, '超级管理员', 'post', 'post', 85, 0, '超级管理员', '2024-06-03 23:51:26', 1, NULL, NULL);
INSERT INTO "public"."Sys_DictionaryList" VALUES (448, '2023-10-07 14:40:56', 1, '超级管理员', 'get', 'get', 85, 0, '超级管理员', '2024-06-03 23:51:26', 1, NULL, NULL);
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
INSERT INTO "public"."Sys_DictionaryList" VALUES (1001, '2025-10-24 18:14:56.951757', 1, '超级管理员', '2', NULL, 1001, 0, NULL, NULL, NULL, 2, NULL);

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
INSERT INTO "public"."Sys_Menu" VALUES (2, '用户管理', '[{"text":"查询","value":"Search"}]', 'el-icon-user', NULL, 1, 9000, '.', 61, NULL, '2017-08-28 12:21:13', '2017-08-28 11:12:45', '2025-03-24 01:26:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (3, '角色管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 900, 'Sys_Role', 2, '/Sys_Role', '2017-09-12 16:20:02', '2017-08-28 14:19:13', '2023-05-08 02:10:41', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (5, '日志管理', '[{"text":"查询","value":"Search"}]', 'el-icon-date', NULL, 1, 1300, 'xxx', 61, '/', '2017-09-22 17:59:37', '2017-09-22 17:59:37', '2025-03-23 23:23:28', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (6, '系统日志', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', '', NULL, 1, 0, 'Sys_Log', 5, '/Sys_Log/Manager', '2017-09-22 18:00:25', '2017-09-22 18:0:25', '2019-08-14 16:20:35', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (8, '图表开发', '[{"text":"查询","value":"Search"}]', 'el-icon-monitor', NULL, 1, 10000, '.', 32, '/ProductionState', NULL, NULL, '2025-03-24 02:52:54', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (9, '用户管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', '', NULL, 1, 2000, 'Sys_User', 2, '/Sys_User', NULL, NULL, '2023-05-08 02:11:52', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (32, '基础组件', '[{"text":"查询","value":"Search"}]', 'el-icon-full-screen', NULL, 1, 1720, '/', 0, '', NULL, NULL, '2025-03-24 01:25:40', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (36, '图表+表单', '[{"text":"查询","value":"Search"}]', 'el-icon-data-analysis', NULL, 1, 900, '/', 32, 'formChart', NULL, NULL, '2025-03-24 02:46:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (45, '不用节点', '', '', NULL, 0, 0, '/', 0, NULL, NULL, NULL, '2020-05-05 13:20:14', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (61, '系统设置', '[{"text":"查询","value":"Search"}]', 'el-icon-setting', NULL, 1, 1000, '系统设置', 0, '/', '2019-07-12 14:04:04', '超级管理员', '2023-05-13 11:09:04', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (62, '菜单设置', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 8000, 'Sys_Menu', 291, '/sysmenu', '2019-07-12 14:04:35', '超级管理员', '2025-03-24 01:37:47', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (63, '数据字典', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 7000, 'Sys_Dictionary', 292, '/Sys_Dictionary', '2019-07-12 14:05:58', '超级管理员', '2025-03-24 01:38:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (64, '代码生成', '[{"text":"查询","value":"Search"}]', 'el-icon-paperclip', NULL, 1, 1500, '代码生成', 61, '/coding', '2019-07-12 14:07:55', '超级管理员', '2025-03-24 01:39:58', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (65, '代码生成', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 10, '/', 64, '/coder', '2019-07-12 14:08:58', '超级管理员', '2022-01-03 19:01:21', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (71, '权限管理', '[{"text":"查询","value":"Search"},{"text":"编辑","value":"Update"}]', 'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, ',', 2, '/permission', '2019-08-10 10:25:36', '超级管理员', '2023-05-08 02:11:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (91, '图表+表格', '[{"text":"查询","value":"Search"}]', 'el-icon-odometer', NULL, 1, 800, '数字排版', 32, '/flex', '2020-04-07 21:51:38', '超级管理员', '2025-03-24 02:46:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (104, '角色管理(tree)', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 0, 'Sys_Role1', 2, '/Sys_Role1', '2021-05-02 13:41:35', '超级管理员', '2023-05-13 08:51:01', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (106, '表单设计', '[{"text":"查询","value":"Search"}]', 'el-icon-postcard', NULL, 1, 3000, '.', 61, '', '2021-08-28 00:39:04', '超级管理员', '2025-03-23 23:24:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (107, '表单设计', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 100, '.', 106, '/formDraggable', '2021-08-28 00:40:00', '超级管理员', '2022-01-03 19:01:45', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (109, '表单配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'FormDesignOptions', 106, '/FormDesignOptions', '2021-12-29 23:27:28', '超级管理员', '2022-01-03 19:03:58', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (110, '数据采集', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', '', NULL, 1, 0, '.', 106, '/formCollectionResultTree', '2021-12-29 23:28:44', '超级管理员', '2021-12-30 23:11:51', '超级管理员', NULL);
INSERT INTO "public"."Sys_Menu" VALUES (113, '基础页面', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 9000, '.', 0, '', '2022-03-26 00:58:41', '超级管理员', '2022-04-04 13:39:54', '超级管理员', 1);
INSERT INTO "public"."Sys_Menu" VALUES (115, '水平显示', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 0, '.', 113, '/pages/order/App_Appointment1/App_Appointment1', '2022-03-26 01:00:38', '超级管理员', '2025-03-23 23:22:51', '超级管理员', 1);
INSERT INTO "public"."Sys_Menu" VALUES (125, '表单只读', '', '', NULL, 1, 0, '.', 113, 'pages/form/form1', '2022-03-26 03:12:52', '超级管理员', '2022-03-27 15:38:00', '超级管理员', 1);
INSERT INTO "public"."Sys_Menu" VALUES (132, '消息推送', '[{"text":"查询","value":"Search"}]', 'el-icon-chat-line-round', NULL, 1, 1700, '.', 293, '/signalR', '2022-05-03 03:31:02', '超级管理员', '2025-03-24 01:41:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (133, '审批管理', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile', NULL, 1, 6800, '流程管理', 61, '', '2022-07-25 00:39:22', '超级管理员', '2025-03-24 01:39:07', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (134, '流程管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 0, 'Sys_WorkFlow', 133, '/Sys_WorkFlow', '2022-07-25 00:39:56', '超级管理员', '2022-08-01 03:18:05', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (135, '我的审批', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"}]', '', NULL, 1, 0, 'Sys_WorkFlowTable', 133, '/Sys_WorkFlowTable', '2022-08-01 00:35:05', '超级管理员', '2022-08-16 01:00:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (136, '发起流程', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 0, '发起流程', 133, '/flowdemo', '2022-08-16 00:21:39', '超级管理员', '2022-08-16 00:21:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (137, '定时任务', '[{"text":"查询","value":"Search"}]', 'el-icon-alarm-clock', NULL, 1, 1725, '定时任务', 61, '', '2022-09-05 03:19:10', '超级管理员', '2025-03-23 23:24:34', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (138, '任务配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 0, 'Sys_QuartzOptions', 137, '/Sys_QuartzOptions', '2022-09-05 03:19:45', '超级管理员', '2022-08-01 00:33:46', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (139, '执行记录', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', '', NULL, 1, 0, 'Sys_QuartzLog', 137, '/Sys_QuartzLog', '2022-09-05 03:20:06', '超级管理员', '2022-09-05 03:20:08', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (142, '组织架构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 2500, 'Sys_Department', 2, '/Sys_Department', '2023-05-08 02:12:15', '超级管理员', '2023-05-08 02:12:43', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (235, 'MES业务', '[{"text":"查询","value":"Search"}]', 'el-icon-monitor', NULL, 1, 9000, '.', 0, '', '2025-03-13 19:35:58', '超级管理员', '2025-03-18 19:09:44', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (236, '基础设置', '[{"text":"查询","value":"Search"}]', 'el-icon-receiving', NULL, 1, 2000, '.', 235, '', '2025-03-13 19:36:33', '超级管理员', '2025-03-14 10:55:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (237, '仓库管理', '[{"text":"查询","value":"Search"}]', 'el-icon-house', NULL, 1, 1800, '.', 235, '', '2025-03-13 19:39:28', '超级管理员', '2025-03-13 19:39:39', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (238, '设备管理', '[{"text":"查询","value":"Search"}]', 'el-icon-news', NULL, 1, 1600, '.', 235, '', '2025-03-13 19:40:30', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (239, '生产计划', '[{"text":"查询","value":"Search"}]', 'el-icon-shopping-cart-1', NULL, 1, 1400, '.', 235, '', '2025-03-13 19:40:53', '超级管理员', '2025-03-13 22:06:59', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (240, '质检中心', '[{"text":"查询","value":"Search"}]', 'el-icon-edit-outline', NULL, 1, 1200, '.', 235, '', '2025-03-13 19:41:41', '超级管理员', '2025-03-14 10:54:23', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (241, '工序管理', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile-phone', NULL, 1, 1500, '.', 235, '', '2025-03-13 19:42:11', '超级管理员', '2025-03-13 19:44:09', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (242, '生产排班', '[{"text":"查询","value":"Search"}]', 'el-icon-stopwatch', NULL, 1, 1000, '.', 235, '', '2025-03-13 19:42:44', '超级管理员', '2025-03-16 21:53:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (244, '生产报工', '[{"text":"查询","value":"Search"}]', 'el-icon-tickets', NULL, 1, 1300, '.', 235, '', '2025-03-14 00:44:21', '超级管理员', '2025-03-14 00:44:36', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (247, '审批流程', '[{"text":"查询","value":"Search"}]', 'el-icon-date', NULL, 1, 2900, '.', 235, '', '2025-03-14 17:11:15', '超级管理员', '2025-03-18 17:26:06', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (249, ' 客户管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 800, 'MES_Customer', 236, '/MES_Customer', '2025-03-14 17:19:51', '超级管理员', '2025-03-17 11:53:53', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (250, '供应商', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', '', NULL, 1, 700, 'MES_Supplier', 236, '/MES_Supplier', '2025-03-14 17:21:07', '超级管理员', '2025-03-14 17:28:05', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (251, '产线管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 600, 'MES_ProductionLine', 236, '/MES_ProductionLine', '2025-03-14 17:21:53', '超级管理员', '2025-03-17 01:50:19', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (252, '产线设备', '[{"text":"查询","value":"Search"}]', '', NULL, 0, 500, 'MES_ProductionLineDevice', 236, '/MES_ProductionLineDevice', '2025-03-14 17:23:26', '超级管理员', '2025-03-14 17:20:07', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (253, '物料管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"打印","value":"Print"}]', '', NULL, 1, 510, 'MES_Material', 236, '/MES_Material', '2025-03-14 17:24:13', '超级管理员', '2025-03-17 11:18:57', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (254, '物料分类', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 550, 'MES_MaterialCatalog', 236, '/MES_MaterialCatalog', '2025-03-14 17:25:23', '超级管理员', '2025-03-17 11:18:26', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (255, '仓库管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', '', NULL, 1, 900, 'MES_WarehouseManagement', 237, '/MES_WarehouseManagement', '2025-03-14 17:31:20', '超级管理员', '2025-03-13 19:39:39', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (256, '货位管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', '', NULL, 1, 800, 'MES_LocationManagement', 237, '/MES_LocationManagement', '2025-03-14 17:31:54', '超级管理员', '2025-03-13 19:39:39', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (257, '库存管理', '[{"text":"查询","value":"Search"},{"text":"复制","value":"CopyData"},{"text":"导出","value":"Export"},{"text":"打印","value":"Print"}]', '', NULL, 1, 700, 'MES_InventoryManagement', 237, '/MES_InventoryManagement', '2025-03-14 17:32:40', '超级管理员', '2025-03-17 02:10:34', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (258, '产品入库', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 600, 'MES_ProductInbound', 237, '/MES_ProductInbound', '2025-03-14 17:33:07', '超级管理员', '2025-03-17 01:00:49', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (259, '产品出库', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 500, 'MES_ProductOutbound', 237, '/MES_ProductOutbound', '2025-03-14 17:33:31', '超级管理员', '2025-03-17 00:54:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (260, '设备管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 900, 'MES_EquipmentManagement', 238, '/MES_EquipmentManagement', '2025-03-14 17:35:22', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (261, '设备维修', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', '', NULL, 1, 800, 'MES_EquipmentRepair', 238, '/MES_EquipmentRepair', '2025-03-14 17:35:49', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (262, '设备保养', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 0, 'MES_EquipmentMaintenance', 238, '/MES_EquipmentMaintenance', '2025-03-14 17:36:36', '超级管理员', '2025-03-17 02:06:18', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (263, '设备故障', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', '', NULL, 1, 500, 'MES_EquipmentFaultRecord', 238, '/MES_EquipmentFaultRecord', '2025-03-14 17:37:22', '超级管理员', '2025-03-13 19:36:51', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (264, '工序管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"打印","value":"Print"}]', '', NULL, 1, 800, 'MES_Process', 241, '/MES_Process', '2025-03-16 21:26:13', '超级管理员', '2025-03-17 02:10:42', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (265, '工线路线', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 700, 'MES_ProcessRoute', 241, '/MES_ProcessRoute', '2025-03-16 21:27:19', '超级管理员', '2025-03-16 21:27:35', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (266, '工序统计', '[{"text":"查询","value":"Search"},{"text":"导出","value":"Export"},{"text":"打印","value":"Print"}]', '', NULL, 1, 600, 'MES_ProcessReport', 241, '/MES_ProcessReport', '2025-03-16 21:29:22', '超级管理员', '2025-03-17 02:37:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (267, '生产订单', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"},{"text":"打印","value":"Print"}]', '', NULL, 1, 900, 'MES_ProductionOrder', 239, '/MES_ProductionOrder', '2025-03-16 21:36:43', '超级管理员', '2025-03-18 17:13:19', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (268, '订单明细表', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 0, 800, 'MES_ProductionPlanDetail', 239, '/MES_ProductionPlanDetail', '2025-03-16 21:38:21', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (270, '变更记录', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 600, 'MES_ProductionPlanChangeRecord', 239, '/MES_ProductionPlanChangeRecord', '2025-03-16 21:40:30', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (271, '生产报工', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"审核","value":"Audit"},{"text":"反审","value":"AntiAudit"},{"text":"打印","value":"Print"}]', '', NULL, 1, 900, 'MES_ProductionReporting', 244, '/MES_ProductionReporting', '2025-03-16 21:41:46', '超级管理员', '2025-03-18 17:13:22', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (272, '报工明细', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"}]', '', NULL, 2, 800, 'MES_ProductionReportingDetail', 244, '/MES_ProductionReportingDetail', '2025-03-16 21:42:15', '超级管理员', '2025-03-16 21:42:17', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (273, '生产不良记录', '[{"text":"查询","value":"Search"},{"text":"导出","value":"Export"}]', '', NULL, 1, 600, 'MES_DefectiveProductRecord', 244, '/MES_DefectiveProductRecord', '2025-03-16 21:42:49', '超级管理员', '2025-03-18 18:06:14', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (275, '质量检验', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"导出","value":"Export"}]', '', NULL, 1, 900, 'MES_QualityInspectionPlan', 240, '/MES_QualityInspectionPlan', '2025-03-16 21:47:04', '超级管理员', '2025-03-19 01:43:31', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (276, '质检明细', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"}]', '', NULL, 0, 700, 'MES_QualityInspectionPlanDetail', 240, '/MES_QualityInspectionPlanDetail', '2025-03-16 21:47:51', '超级管理员', '2025-03-16 21:52:24', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (277, '质检记录', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 500, 'MES_QualityInspectionRecord', 240, '/MES_QualityInspectionRecord', '2025-03-16 21:48:41', '超级管理员', '2025-03-14 10:54:23', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (279, '排班计划', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"导出","value":"Export"}]', '', NULL, 1, 800, 'MES_SchedulingPlan', 242, '/MES_SchedulingPlan', '2025-03-16 21:56:15', '超级管理员', '2025-03-16 22:00:46', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (280, '排班日历', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 600, '.', 242, 'MES_Calendar', '2025-03-16 22:10:57', '超级管理员', '2025-03-19 02:01:39', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (281, '我的审批', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 800, '.', 247, '/Sys_WorkFlowTable', '2025-03-16 22:12:04', '超级管理员', '2025-03-16 22:11:25', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (282, '流程配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', '', NULL, 1, 700, '.', 247, 'Sys_WorkFlow', '2025-03-16 22:12:47', '超级管理员', '2025-03-16 22:12:47', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (286, '制造BOM', '[{"text":"查询","value":"Search"}]', 'el-icon-setting', NULL, 1, 1400, '.', 235, '', '2025-03-18 17:24:00', '超级管理员', '2025-03-18 17:24:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (287, '制造BOM', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"复制","value":"CopyData"},{"text":"导出","value":"Export"}]', '', NULL, 1, 200, 'MES_Bom_Main', 286, '/MES_Bom_Main', '2025-03-18 17:24:47', '超级管理员', '2025-03-18 18:24:02', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (289, '生产任务', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 500, '.', 239, '/list', '2025-03-19 13:46:28', '超级管理员', '2025-03-13 22:06:59', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (290, 'Bom明细', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 2, 0, 'MES_Bom_Detail', 286, '/MES_Bom_Detail', '2025-03-19 14:21:12', '超级管理员', '2025-03-18 18:24:02', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (291, '菜单设置', '[{"text":"查询","value":"Search"}]', 'el-icon-folder', NULL, 1, 8100, '.', 61, '', '2025-03-24 01:37:14', '超级管理员', '2025-03-24 01:38:19', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (292, '数据字典', '[{"text":"查询","value":"Search"}]', 'el-icon-receiving', NULL, 1, 7100, '.', 61, '', '2025-03-24 01:38:39', '超级管理员', '2025-03-24 01:38:47', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (293, '消息推送', '[{"text":"查询","value":"Search"}]', 'el-icon-chat-dot-round', NULL, 1, 1800, '.', 61, '', '2025-03-24 01:40:39', '超级管理员', '2025-03-24 01:41:40', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (294, '统计报表', '[{"text":"查询","value":"Search"}]', 'el-icon-data-line', NULL, 1, 700, '.', 235, '', '2025-03-24 02:20:27', '超级管理员', '2025-03-16 21:53:03', NULL, 0);
INSERT INTO "public"."Sys_Menu" VALUES (295, '生产统计', '[{"text":"查询","value":"Search"}]', '', NULL, 1, 800, '.', 294, '/ProductionState', '2025-03-24 02:20:59', '超级管理员', '2025-03-24 02:28:10', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (296, '图表统计', '[{"text":"查询","value":"Search"}]', 'el-icon-data-line', NULL, 1, 2000, '.', 32, '', '2025-03-24 02:40:46', '超级管理员', '2025-03-24 02:42:09', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (297, '多页签配置', '[{"text":"查询","value":"Search"}]', 'el-icon-receiving', NULL, 1, 700, '.', 32, '', '2025-03-24 02:44:22', '超级管理员', '2025-03-24 02:45:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (298, '一对多配置', '[{"text":"查询","value":"Search"}]', 'el-icon-coin', NULL, 1, 710, '.', 32, '', '2025-03-24 02:45:51', '超级管理员', '2025-03-24 02:52:20', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (299, '文本编辑', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile-phone', NULL, 1, 780, '.', 32, '', '2025-03-24 02:47:09', '超级管理员', '2025-03-24 02:50:24', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (300, '主从结构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"}]', 'el-icon-office-building', NULL, 1, 760, '.', 32, '/MES_Process', '2025-03-24 02:48:59', '超级管理员', '2025-03-24 02:49:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (301, '树形结构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"}]', 'el-icon-guide', NULL, 1, 740, '.', 32, '/MES_Material', '2025-03-24 02:49:56', '超级管理员', '2025-03-24 02:50:03', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (302, '移动端开发', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile-phone', NULL, 1, 600, '.', 32, 'http://app.volcore.xyz/', '2025-03-24 02:51:31', '超级管理员', '2025-03-24 02:51:51', '超级管理员', 0);
INSERT INTO "public"."Sys_Menu" VALUES (304, '测试', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', '', NULL, 1, 0, 'TestService', 235, '/TestService', '2025-03-25 14:50:47', '超级管理员', '2025-03-18 17:26:06', NULL, 0);

-- ----------------------------
-- Table structure for Sys_Province
-- ----------------------------
DROP TABLE IF EXISTS "public"."Sys_Province";
CREATE TABLE "public"."Sys_Province" (
  "ProvinceId" int4 NOT NULL,
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
INSERT INTO "public"."Sys_TableColumn" VALUES (1416, NULL, NULL, NULL, NULL, '出库ID', 'OutboundID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-25 15:13:13', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1417, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 130, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1418, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 1300, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1419, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, '物料列表', 1, 3, 'select', NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1420, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 1200, NULL, NULL, 1, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1421, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-25 15:13:13', 1, 1150, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1422, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '货位', 3, 9, 'select', NULL, 1, 1, NULL, 0, 0, 0, 36, '超级管理员', '2025-03-25 15:13:13', 1, 1100, NULL, NULL, 1, 'select', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1423, NULL, NULL, NULL, NULL, '出库数量', 'OutboundQuantity', 'int', 70, NULL, NULL, NULL, NULL, NULL, 3, 9, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-25 15:13:13', 1, 1050, NULL, NULL, 3, 'range', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1424, NULL, NULL, NULL, NULL, '出库单位', 'OutboundUnit', 'string', 70, NULL, NULL, NULL, NULL, '物料单位', 3, 15, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 1000, NULL, NULL, 3, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1425, NULL, NULL, NULL, NULL, '出库日期', 'OutboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, 3, 15, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-25 15:13:13', 1, 950, NULL, NULL, 3, 'date', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1426, NULL, NULL, NULL, NULL, '维修ID', 'RepairID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 02:00:16', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1427, NULL, NULL, NULL, NULL, '出库操作员', 'OutboundOperator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1428, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, '设备列表', NULL, 1, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-17 02:00:16', 1, 9900, NULL, NULL, 1, 'select', 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1429, NULL, NULL, NULL, NULL, '出库原因', 'OutboundReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1430, NULL, NULL, NULL, NULL, '维修日期', 'RepairDate', 'DateTime', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9850, NULL, NULL, 1, 'datetime', 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1431, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-25 15:13:13', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1432, NULL, NULL, NULL, NULL, '维修原因', 'RepairReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9800, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1433, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 750, NULL, NULL, 3, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1434, NULL, NULL, NULL, NULL, '维修内容', 'RepairContent', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1435, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 140, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-25 15:13:13', 1, 700, NULL, NULL, 3, 'datetime', 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1436, NULL, NULL, NULL, NULL, '维修人员', 'RepairPerson', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9700, NULL, NULL, 1, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1437, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-25 15:13:13', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1438, NULL, NULL, NULL, NULL, '维修成本', 'RepairCost', 'decimal', 70, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1439, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-25 15:13:13', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1440, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-25 15:13:13', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductOutbound', 66);
INSERT INTO "public"."Sys_TableColumn" VALUES (1441, NULL, NULL, NULL, NULL, '维修状态', 'RepairStatus', 'string', 70, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9600, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1442, NULL, NULL, NULL, NULL, '维修开始时间', 'RepairStartTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'datetime', NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9550, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1444, NULL, NULL, NULL, NULL, '维修结束时间', 'RepairEndTime', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'datetime', NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9500, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1446, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9450, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1448, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9400, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1449, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9350, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1451, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9300, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1453, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:00:16', 1, 9250, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1454, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 02:00:16', 1, 9200, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentRepair', 65);
INSERT INTO "public"."Sys_TableColumn" VALUES (1460, NULL, NULL, NULL, NULL, '设备ID', 'EquipmentID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-17 01:53:09', 1, 9950, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1463, NULL, NULL, NULL, NULL, '设备编码', 'EquipmentCode', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9900, NULL, NULL, 1, 'like', 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1465, NULL, NULL, NULL, NULL, '设备名称', 'EquipmentName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9850, NULL, NULL, 1, 'like', 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1467, NULL, NULL, NULL, NULL, '设备类型', 'EquipmentType', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9800, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1469, NULL, NULL, NULL, NULL, '制造商', 'Manufacturer', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 01:53:09', 1, 9750, NULL, NULL, 1, NULL, 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1471, NULL, NULL, NULL, NULL, '购买日期', 'PurchaseDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, 'date', NULL, 1, 1, 4, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9700, NULL, NULL, 1, 'date', 0, 'MES_EquipmentManagement', 67);
INSERT INTO "public"."Sys_TableColumn" VALUES (1473, NULL, NULL, NULL, NULL, '保修期', 'WarrantyPeriod', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-17 01:53:09', 1, 9650, NULL, NULL, NULL, NULL, 0, 'MES_EquipmentManagement', 67);
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
INSERT INTO "public"."Sys_TableColumn" VALUES (1550, NULL, NULL, NULL, NULL, '统计人', 'ReportedBy', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-17 02:35:37', 1, 1050, NULL, NULL, 1, NULL, 0, 'MES_ProcessReport', 72);
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
INSERT INTO "public"."Sys_TableColumn" VALUES (1805, NULL, NULL, NULL, NULL, '单台用量', 'UsageQty', 'decimal', 90, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'number', NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-19 02:58:35', 1, 1100, NULL, NULL, NULL, NULL, 0, 'MES_Bom_Detail', 88);
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
INSERT INTO "public"."Sys_TableColumn" VALUES (1882, NULL, NULL, NULL, NULL, '入库ID', 'InboundID', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1400, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1883, NULL, NULL, NULL, NULL, '单据号', 'DocumentNo', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1350, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1884, NULL, NULL, NULL, NULL, '物料名称', 'MaterialName', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1300, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1885, NULL, NULL, NULL, NULL, '物料编号', 'MaterialCode', 'string', 90, NULL, NULL, NULL, NULL, '物料列表', NULL, 3, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1250, NULL, NULL, 1, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1886, NULL, NULL, NULL, NULL, '规格型号', 'SpecificationModel', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1200, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1887, NULL, NULL, NULL, NULL, '仓库', 'WarehouseID', 'string', 90, NULL, NULL, NULL, NULL, '货位', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1150, NULL, NULL, 1, 'select', 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1888, NULL, NULL, NULL, NULL, '货位', 'LocationID', 'string', 90, NULL, NULL, NULL, NULL, '仓库', NULL, 6, 'select', NULL, 1, 1, NULL, 0, 1, 0, 36, '超级管理员', '2025-03-20 17:31:08', 1, 1100, NULL, NULL, 1, 'select', 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1889, NULL, NULL, NULL, NULL, '入库数量', 'InboundQuantity', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 1050, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1890, NULL, NULL, NULL, NULL, '入库单位', 'InboundUnit', 'string', 90, NULL, NULL, NULL, NULL, '物料单位', NULL, 8, 'select', NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 1000, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1891, NULL, NULL, NULL, NULL, '入库日期', 'InboundDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 950, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1892, NULL, NULL, NULL, NULL, '入库操作员', 'InboundOperator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 900, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1893, NULL, NULL, NULL, NULL, '入库原因', 'InboundReason', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 850, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1894, NULL, NULL, NULL, NULL, '创建人ID', 'CreateID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 800, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1895, NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 750, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1896, NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 700, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1897, NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 650, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1898, NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 100, '超级管理员', '2025-03-20 17:31:08', 1, 600, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1899, NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', 90, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '超级管理员', '2025-03-20 17:31:08', 1, 550, NULL, NULL, NULL, NULL, 0, 'MES_ProductInbound', 64);
INSERT INTO "public"."Sys_TableColumn" VALUES (1918, NULL, NULL, NULL, NULL, '', 'Id', 'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, NULL, NULL, NULL, 950, NULL, NULL, NULL, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1919, NULL, NULL, NULL, NULL, 'DbName', 'DbName', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, NULL, NULL, NULL, 900, NULL, NULL, 1, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1920, NULL, NULL, NULL, NULL, 'DbContent', 'DbContent', 'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, NULL, NULL, NULL, 850, NULL, NULL, 1, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1921, NULL, NULL, NULL, NULL, 'CreateDate', 'CreateDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1922, NULL, NULL, NULL, NULL, '', 'CreateID', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 750, NULL, NULL, NULL, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1923, NULL, NULL, NULL, NULL, 'Creator', 'Creator', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, NULL, NULL, NULL, 700, NULL, NULL, NULL, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1924, NULL, NULL, NULL, NULL, '', 'Modifier', 'string', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, NULL, NULL, NULL, 650, NULL, NULL, NULL, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1925, NULL, NULL, NULL, NULL, '', 'ModifyDate', 'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 600, NULL, NULL, NULL, NULL, 0, 'TestService', 89);
INSERT INTO "public"."Sys_TableColumn" VALUES (1926, NULL, NULL, NULL, NULL, '', 'ModifyID', 'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, NULL, 550, NULL, NULL, NULL, NULL, 0, 'TestService', 89);

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
INSERT INTO "public"."Sys_TableInfo" VALUES (89, '测试', '测试', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'mes', 'VOL.MES', NULL, 54, NULL, 'CreateDate', 'TestService', 'TestService', NULL, NULL);
INSERT INTO "public"."Sys_TableInfo" VALUES (101, '11', '11', NULL, NULL, NULL, NULL, NULL, 1, NULL, '111', 'VOL.MES', NULL, 0, NULL, NULL, '1', NULL, NULL, NULL);

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
INSERT INTO "public"."Sys_User" VALUES (1, 1, '无', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', NULL, 0, '283591387@qq.com', 1, 1, 'Upload/Tables/Sys_User/202305131010574561/wechat.jpg', 0, '2017-08-28 09:58:55', '2019-12-14 15:14:23', '北京市西城区', 1, '2019-08-18 00:54:06', 1, '超级管理员', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTc2MTI5OTc4OSIsIm5iZiI6IjE3NjEyOTk3ODkiLCJleHAiOiIxNzYxMzA2OTg5IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.AiAmc4JSD4cDIOCN5pM338RAYfTch_Ap_uXcWpBFr20', NULL, '2012-06-10 11:10:03', NULL, NULL, '超级管理员', '2025-03-24 00:32:44', 1, NULL);

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
INSERT INTO "public"."Sys_WorkFlow" VALUES ('28e37aa6-b6df-4af2-8188-a68b0571f650', '生产报工审批', 'MES_ProductionReporting', '生产报工', '[{"id":"jg8cp5ijz","name":"报工提交","type":"start","left":"282px","top":"15px","ico":"el-icon-time","state":"success","filters":[],"userId":[],"roleId":[],"deptId":[]},{"id":"hetlnr7jm","name":"报工数量<=500","type":"node","left":"77px","top":"137px","ico":"el-icon-news","state":"success","filters":[{"field":"Total","value":"500","filterType":"<=","data":null}],"userId":[],"roleId":[2],"deptId":[],"auditType":2},{"id":"w9v2ssg9e8","name":"流程结束","type":"end","left":"306.4px","top":"539.4px","ico":"el-icon-switch-button","state":"success"},{"id":"gu2g24vswf","name":"管理员审批","type":"node","left":"76px","top":"277px","ico":"el-icon-news","state":"success","filters":[],"userId":[1],"roleId":[],"deptId":[],"auditType":1},{"id":"4zlt54it3","name":"报工数量>500","type":"node","left":"539px","top":"129px","ico":"el-icon-news","state":"success","filters":[{"field":"Total","value":"500","filterType":">","data":null}],"userId":[3362],"roleId":[],"deptId":[],"auditType":1},{"id":"34ltn0ou0l","name":"线长审批","type":"node","left":"307px","top":"217px","ico":"el-icon-news","state":"success","filters":[],"userId":[],"roleId":[],"deptId":["ec238385-f907-44de-b99b-0eddcffa6750"],"auditType":3},{"id":"yxkuhlh3no","name":"主管审批","type":"node","left":"76px","top":"400px","ico":"el-icon-news","state":"success","filters":[],"userId":[],"roleId":[2],"deptId":[],"auditType":2},{"id":"ug7mqx18yf","name":"经理审批","type":"node","left":"539px","top":"280px","ico":"el-icon-news","state":"success","filters":[],"userId":[],"roleId":[4],"deptId":[],"auditType":2},{"id":"sgjixpmavv","name":"二次审批","type":"node","left":"307px","top":"400px","ico":"el-icon-news","state":"success","filters":[],"userId":[1],"roleId":[],"deptId":[],"auditType":1}]', '[{"from":"jg8cp5ijz","to":"hetlnr7jm","label":"x"},{"from":"hetlnr7jm","to":"gu2g24vswf","label":"x"},{"from":"jg8cp5ijz","to":"4zlt54it3","label":"x"},{"from":"4zlt54it3","to":"34ltn0ou0l","label":"x"},{"from":"gu2g24vswf","to":"yxkuhlh3no","label":"x"},{"from":"yxkuhlh3no","to":"w9v2ssg9e8","label":"x"},{"from":"4zlt54it3","to":"ug7mqx18yf","label":"x"},{"from":"34ltn0ou0l","to":"sgjixpmavv","label":"x"},{"from":"sgjixpmavv","to":"w9v2ssg9e8","label":"x"},{"from":"ug7mqx18yf","to":"w9v2ssg9e8","label":"x"}]', NULL, 1, '2025-03-24 02:04:32', 1, '超级管理员', 1, NULL, NULL, NULL, 0);
INSERT INTO "public"."Sys_WorkFlow" VALUES ('75f196b0-889e-49b8-be03-8b3ce214cc4f', '231', 'MES_ProductionReporting', '生产报工', '[{"id":"ak2e0dq0ys","name":"流程开始","type":"start","left":"250.1px","top":"272.2px","ico":"el-icon-time","state":"success","filters":[],"userId":[],"roleId":[],"deptId":[]},{"id":"eywgrki6hd","name":"流程结束","type":"end","left":"242.1px","top":"390.2px","ico":"el-icon-switch-button","state":"success"},{"id":"c62ygk8wm8","name":"流程节点","type":"node","left":"246.1px","top":"324.2px","ico":"el-icon-news","state":"success","filters":[],"userId":[3362],"roleId":[],"deptId":[],"auditType":1}]', '[{"from":"ak2e0dq0ys","to":"c62ygk8wm8","label":"x"},{"from":"c62ygk8wm8","to":"eywgrki6hd","label":"x"}]', NULL, 1, '2025-10-24 18:15:18.595658', 1, '超级管理员', 1, NULL, NULL, NULL, 0);

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
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('698574c7-17c5-4627-8e47-17dc57b80715', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'hetlnr7jm', '报工数量<=500', 2, '2', 1, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'jg8cp5ijz', NULL, NULL, NULL, NULL, '[{"field":"Total","filterType":"<=","value":"500"}]', 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('6f649af9-7201-4609-ba06-961d5c4f3155', '28e37aa6-b6df-4af2-8188-a68b0571f650', '4zlt54it3', '报工数量>500', 1, '3362', 2, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'jg8cp5ijz', NULL, NULL, NULL, NULL, '[{"field":"Total","filterType":">","value":"500"}]', 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('ad9bb226-f047-4f8f-b69b-8dabd4fe1043', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'ug7mqx18yf', '经理审批', 2, '4', 5, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '4zlt54it3', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('c130466f-6165-429f-a2a0-6962554cfa5c', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'sgjixpmavv', '二次审批', 1, '1', 7, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '34ltn0ou0l', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('eaed94b3-f385-4401-8fea-41c40110bc7a', '28e37aa6-b6df-4af2-8188-a68b0571f650', '34ltn0ou0l', '线长审批', 3, 'ec238385-f907-44de-b99b-0eddcffa6750', 4, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, '4zlt54it3', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('f65d2016-bb4f-4235-8609-4bdcb30b5085', '28e37aa6-b6df-4af2-8188-a68b0571f650', 'yxkuhlh3no', '主管审批', 2, '2', 6, NULL, '2025-03-24 02:04:32', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'gu2g24vswf', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('4680ee0c-828d-43b2-8805-9a6c81f0187f', '75f196b0-889e-49b8-be03-8b3ce214cc4f', 'c62ygk8wm8', '流程节点', 1, '3362', 1, NULL, '2025-10-24 18:15:18.668708', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'ak2e0dq0ys', NULL, NULL, NULL, NULL, NULL, 'node', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('95bb3ed6-9c6d-441e-b558-cea64576479f', '75f196b0-889e-49b8-be03-8b3ce214cc4f', 'ak2e0dq0ys', '流程开始', NULL, NULL, 0, NULL, '2025-10-24 18:15:18.633693', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'start', NULL);
INSERT INTO "public"."Sys_WorkFlowStep" VALUES ('ab259d32-2d37-41e8-9af3-df3ed0a40ac6', '75f196b0-889e-49b8-be03-8b3ce214cc4f', 'eywgrki6hd', '流程结束', NULL, NULL, 2, NULL, '2025-10-24 18:15:18.669415', 1, '超级管理员', NULL, NULL, NULL, NULL, NULL, 'c62ygk8wm8', NULL, NULL, NULL, NULL, NULL, 'end', NULL);

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
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."products_id_seq"', 3, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_city_id_seq"', 502, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dictionary_id_seq"', 1002, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dictionarylist_id_seq"', 1002, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_log_id_seq"', 319, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_menu_id_seq"', 202, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_province_id_seq"', 102, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_role_id_seq"', 12, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_roleauth_id_seq"', 229, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_tablecolumn_id_seq"', 1002, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_tableinfo_id_seq"', 102, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_user_id_seq"', 10002, false);

-- ----------------------------
-- Primary Key structure for table FormCollectionObject
-- ----------------------------
ALTER TABLE "public"."FormCollectionObject" ADD CONSTRAINT "FormCollectionObject_pkey" PRIMARY KEY ("FormCollectionId");

-- ----------------------------
-- Primary Key structure for table FormDesignOptions
-- ----------------------------
ALTER TABLE "public"."FormDesignOptions" ADD CONSTRAINT "FormDesignOptions_pkey" PRIMARY KEY ("FormId");

-- ----------------------------
-- Primary Key structure for table MES_Bom_Detail
-- ----------------------------
ALTER TABLE "public"."MES_Bom_Detail" ADD CONSTRAINT "MES_Bom_Detail_pkey" PRIMARY KEY ("DomDetailId");

-- ----------------------------
-- Primary Key structure for table MES_Bom_Main
-- ----------------------------
ALTER TABLE "public"."MES_Bom_Main" ADD CONSTRAINT "MES_Bom_Main_pkey" PRIMARY KEY ("BomId");

-- ----------------------------
-- Primary Key structure for table MES_Customer
-- ----------------------------
ALTER TABLE "public"."MES_Customer" ADD CONSTRAINT "MES_Customer_pkey" PRIMARY KEY ("CustomerID");

-- ----------------------------
-- Primary Key structure for table MES_DefectiveProductDisposalRecord
-- ----------------------------
ALTER TABLE "public"."MES_DefectiveProductDisposalRecord" ADD CONSTRAINT "MES_DefectiveProductDisposalRecord_pkey" PRIMARY KEY ("DisposalRecordID");

-- ----------------------------
-- Primary Key structure for table MES_DefectiveProductRecord
-- ----------------------------
ALTER TABLE "public"."MES_DefectiveProductRecord" ADD CONSTRAINT "MES_DefectiveProductRecord_pkey" PRIMARY KEY ("DefectiveID");

-- ----------------------------
-- Primary Key structure for table MES_EquipmentFaultRecord
-- ----------------------------
ALTER TABLE "public"."MES_EquipmentFaultRecord" ADD CONSTRAINT "MES_EquipmentFaultRecord_pkey" PRIMARY KEY ("FaultRecordID");

-- ----------------------------
-- Primary Key structure for table MES_EquipmentMaintenance
-- ----------------------------
ALTER TABLE "public"."MES_EquipmentMaintenance" ADD CONSTRAINT "MES_EquipmentMaintenance_pkey" PRIMARY KEY ("MaintenanceID");

-- ----------------------------
-- Primary Key structure for table MES_EquipmentManagement
-- ----------------------------
ALTER TABLE "public"."MES_EquipmentManagement" ADD CONSTRAINT "MES_EquipmentManagement_pkey" PRIMARY KEY ("EquipmentID");

-- ----------------------------
-- Primary Key structure for table MES_EquipmentRepair
-- ----------------------------
ALTER TABLE "public"."MES_EquipmentRepair" ADD CONSTRAINT "MES_EquipmentRepair_pkey" PRIMARY KEY ("RepairID");

-- ----------------------------
-- Primary Key structure for table MES_InventoryManagement
-- ----------------------------
ALTER TABLE "public"."MES_InventoryManagement" ADD CONSTRAINT "MES_InventoryManagement_pkey" PRIMARY KEY ("InventoryID");

-- ----------------------------
-- Primary Key structure for table MES_LocationManagement
-- ----------------------------
ALTER TABLE "public"."MES_LocationManagement" ADD CONSTRAINT "MES_LocationManagement_pkey" PRIMARY KEY ("LocationID");

-- ----------------------------
-- Primary Key structure for table MES_Material
-- ----------------------------
ALTER TABLE "public"."MES_Material" ADD CONSTRAINT "MES_Material_pkey" PRIMARY KEY ("MaterialID");

-- ----------------------------
-- Primary Key structure for table MES_MaterialCatalog
-- ----------------------------
ALTER TABLE "public"."MES_MaterialCatalog" ADD CONSTRAINT "MES_MaterialCatalog_pkey" PRIMARY KEY ("CatalogID");

-- ----------------------------
-- Primary Key structure for table MES_Process
-- ----------------------------
ALTER TABLE "public"."MES_Process" ADD CONSTRAINT "MES_Process_pkey" PRIMARY KEY ("ProcessID");

-- ----------------------------
-- Primary Key structure for table MES_ProcessReport
-- ----------------------------
ALTER TABLE "public"."MES_ProcessReport" ADD CONSTRAINT "MES_ProcessReport_pkey" PRIMARY KEY ("ReportID");

-- ----------------------------
-- Primary Key structure for table MES_ProcessRoute
-- ----------------------------
ALTER TABLE "public"."MES_ProcessRoute" ADD CONSTRAINT "MES_ProcessRoute_pkey" PRIMARY KEY ("RouteID");

-- ----------------------------
-- Primary Key structure for table MES_ProductInbound
-- ----------------------------
ALTER TABLE "public"."MES_ProductInbound" ADD CONSTRAINT "MES_ProductInbound_pkey" PRIMARY KEY ("InboundID");

-- ----------------------------
-- Primary Key structure for table MES_ProductOutbound
-- ----------------------------
ALTER TABLE "public"."MES_ProductOutbound" ADD CONSTRAINT "MES_ProductOutbound_pkey" PRIMARY KEY ("OutboundID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionLine
-- ----------------------------
ALTER TABLE "public"."MES_ProductionLine" ADD CONSTRAINT "MES_ProductionLine_pkey" PRIMARY KEY ("ProductionLineID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionLineDevice
-- ----------------------------
ALTER TABLE "public"."MES_ProductionLineDevice" ADD CONSTRAINT "MES_ProductionLineDevice_pkey" PRIMARY KEY ("DeviceID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionOrder
-- ----------------------------
ALTER TABLE "public"."MES_ProductionOrder" ADD CONSTRAINT "MES_ProductionOrder_pkey" PRIMARY KEY ("OrderID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionPlanChangeRecord
-- ----------------------------
ALTER TABLE "public"."MES_ProductionPlanChangeRecord" ADD CONSTRAINT "MES_ProductionPlanChangeRecord_pkey" PRIMARY KEY ("ChangeRecordID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionPlanDetail
-- ----------------------------
ALTER TABLE "public"."MES_ProductionPlanDetail" ADD CONSTRAINT "MES_ProductionPlanDetail_pkey" PRIMARY KEY ("PlanDetailID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionReporting
-- ----------------------------
ALTER TABLE "public"."MES_ProductionReporting" ADD CONSTRAINT "MES_ProductionReporting_pkey" PRIMARY KEY ("ReportingID");

-- ----------------------------
-- Primary Key structure for table MES_ProductionReportingDetail
-- ----------------------------
ALTER TABLE "public"."MES_ProductionReportingDetail" ADD CONSTRAINT "MES_ProductionReportingDetail_pkey" PRIMARY KEY ("DetailID");

-- ----------------------------
-- Primary Key structure for table MES_QualityInspectionPlan
-- ----------------------------
ALTER TABLE "public"."MES_QualityInspectionPlan" ADD CONSTRAINT "MES_QualityInspectionPlan_pkey" PRIMARY KEY ("InspectionPlanID");

-- ----------------------------
-- Primary Key structure for table MES_QualityInspectionPlanDetail
-- ----------------------------
ALTER TABLE "public"."MES_QualityInspectionPlanDetail" ADD CONSTRAINT "MES_QualityInspectionPlanDetail_pkey" PRIMARY KEY ("InspectionPlanDetailID");

-- ----------------------------
-- Primary Key structure for table MES_QualityInspectionRecord
-- ----------------------------
ALTER TABLE "public"."MES_QualityInspectionRecord" ADD CONSTRAINT "MES_QualityInspectionRecord_pkey" PRIMARY KEY ("InspectionRecordID");

-- ----------------------------
-- Primary Key structure for table MES_SchedulingPlan
-- ----------------------------
ALTER TABLE "public"."MES_SchedulingPlan" ADD CONSTRAINT "MES_SchedulingPlan_pkey" PRIMARY KEY ("SchedulePlanID");

-- ----------------------------
-- Primary Key structure for table MES_Supplier
-- ----------------------------
ALTER TABLE "public"."MES_Supplier" ADD CONSTRAINT "MES_Supplier_pkey" PRIMARY KEY ("SupplierID");

-- ----------------------------
-- Primary Key structure for table MES_WarehouseManagement
-- ----------------------------
ALTER TABLE "public"."MES_WarehouseManagement" ADD CONSTRAINT "MES_WarehouseManagement_pkey" PRIMARY KEY ("WarehouseID");

-- ----------------------------
-- Primary Key structure for table SellOrder
-- ----------------------------
ALTER TABLE "public"."SellOrder" ADD CONSTRAINT "SellOrder_pkey" PRIMARY KEY ("Order_Id");

-- ----------------------------
-- Primary Key structure for table SellOrderList
-- ----------------------------
ALTER TABLE "public"."SellOrderList" ADD CONSTRAINT "SellOrderList_pkey" PRIMARY KEY ("OrderList_Id");

-- ----------------------------
-- Primary Key structure for table Sys_Department
-- ----------------------------
ALTER TABLE "public"."Sys_Department" ADD CONSTRAINT "Sys_Department_pkey" PRIMARY KEY ("DepartmentId");

-- ----------------------------
-- Primary Key structure for table Sys_Dictionary
-- ----------------------------
ALTER TABLE "public"."Sys_Dictionary" ADD CONSTRAINT "Sys_Dictionary_pkey" PRIMARY KEY ("Dic_ID");

-- ----------------------------
-- Primary Key structure for table Sys_DictionaryList
-- ----------------------------
ALTER TABLE "public"."Sys_DictionaryList" ADD CONSTRAINT "Sys_DictionaryList_pkey" PRIMARY KEY ("DicList_ID");

-- ----------------------------
-- Primary Key structure for table Sys_Menu
-- ----------------------------
ALTER TABLE "public"."Sys_Menu" ADD CONSTRAINT "Sys_Menu_pkey" PRIMARY KEY ("Menu_Id");

-- ----------------------------
-- Primary Key structure for table Sys_Province
-- ----------------------------
ALTER TABLE "public"."Sys_Province" ADD CONSTRAINT "Sys_Province_pkey" PRIMARY KEY ("ProvinceId");

-- ----------------------------
-- Primary Key structure for table Sys_QuartzLog
-- ----------------------------
ALTER TABLE "public"."Sys_QuartzLog" ADD CONSTRAINT "Sys_QuartzLog_pkey" PRIMARY KEY ("LogId");

-- ----------------------------
-- Primary Key structure for table Sys_QuartzOptions
-- ----------------------------
ALTER TABLE "public"."Sys_QuartzOptions" ADD CONSTRAINT "Sys_QuartzOptions_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table Sys_Role
-- ----------------------------
ALTER TABLE "public"."Sys_Role" ADD CONSTRAINT "Sys_Role_pkey" PRIMARY KEY ("Role_Id");

-- ----------------------------
-- Primary Key structure for table Sys_RoleAuth
-- ----------------------------
ALTER TABLE "public"."Sys_RoleAuth" ADD CONSTRAINT "Sys_RoleAuth_pkey" PRIMARY KEY ("Auth_Id");

-- ----------------------------
-- Primary Key structure for table Sys_TableColumn
-- ----------------------------
ALTER TABLE "public"."Sys_TableColumn" ADD CONSTRAINT "Sys_TableColumn_pkey" PRIMARY KEY ("ColumnId");

-- ----------------------------
-- Primary Key structure for table Sys_TableInfo
-- ----------------------------
ALTER TABLE "public"."Sys_TableInfo" ADD CONSTRAINT "Sys_TableInfo_pkey" PRIMARY KEY ("Table_Id");

-- ----------------------------
-- Primary Key structure for table Sys_User
-- ----------------------------
ALTER TABLE "public"."Sys_User" ADD CONSTRAINT "Sys_User_pkey" PRIMARY KEY ("User_Id");

-- ----------------------------
-- Primary Key structure for table Sys_UserDepartment
-- ----------------------------
ALTER TABLE "public"."Sys_UserDepartment" ADD CONSTRAINT "Sys_UserDepartment_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table Sys_WorkFlow
-- ----------------------------
ALTER TABLE "public"."Sys_WorkFlow" ADD CONSTRAINT "Sys_WorkFlow_pkey" PRIMARY KEY ("WorkFlow_Id");

-- ----------------------------
-- Primary Key structure for table Sys_WorkFlowTableStep
-- ----------------------------
ALTER TABLE "public"."Sys_WorkFlowTableStep" ADD CONSTRAINT "Sys_WorkFlowTableStep_pkey" PRIMARY KEY ("Sys_WorkFlowTableStep_Id");

-- ----------------------------
-- Primary Key structure for table TestDb
-- ----------------------------
ALTER TABLE "public"."TestDb" ADD CONSTRAINT "TestDb_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Primary Key structure for table TestService
-- ----------------------------
ALTER TABLE "public"."TestService" ADD CONSTRAINT "TestService_pkey" PRIMARY KEY ("Id");
