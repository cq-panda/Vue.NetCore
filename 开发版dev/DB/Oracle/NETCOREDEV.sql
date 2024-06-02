/*
 Navicat Premium Data Transfer

 Source Server         : oracle127
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Host           : localhost:1521
 Source Schema         : C##NETCOREDEV

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 31/05/2023 22:18:54
*/


-- ----------------------------
-- Table structure for FORMCOLLECTIONOBJECT
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."FORMCOLLECTIONOBJECT";
CREATE TABLE "C##NETCOREDEV"."FORMCOLLECTIONOBJECT" (
  "FORMCOLLECTIONID" NVARCHAR2(36) VISIBLE NOT NULL,
  "FORMID" NVARCHAR2(36) VISIBLE,
  "TITLE" NCLOB VISIBLE,
  "FORMDATA" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FORMCOLLECTIONOBJECT
-- ----------------------------

-- ----------------------------
-- Table structure for FORMDESIGNOPTIONS
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS";
CREATE TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS" (
  "FORMID" NVARCHAR2(36) VISIBLE NOT NULL,
  "TITLE" NCLOB VISIBLE NOT NULL,
  "DARAGGEOPTIONS" NCLOB VISIBLE,
  "FORMOPTIONS" NCLOB VISIBLE,
  "FORMCONFIG" NCLOB VISIBLE,
  "FORMFIELDS" NCLOB VISIBLE,
  "TABLECONFIG" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FORMDESIGNOPTIONS
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_CITY
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_CITY";
CREATE TABLE "C##NETCOREDEV"."SYS_CITY" (
  "CITYID" NUMBER(11,0) VISIBLE NOT NULL,
  "CITYCODE" NVARCHAR2(20) VISIBLE,
  "CITYNAME" NVARCHAR2(30) VISIBLE,
  "PROVINCECODE" NVARCHAR2(20) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_CITY
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_DEPARTMENT
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_DEPARTMENT";
CREATE TABLE "C##NETCOREDEV"."SYS_DEPARTMENT" (
  "DEPARTMENTID" NVARCHAR2(36) VISIBLE NOT NULL,
  "DEPARTMENTNAME" NVARCHAR2(200) VISIBLE NOT NULL,
  "DEPARTMENTCODE" NVARCHAR2(50) VISIBLE,
  "PARENTID" NVARCHAR2(36) VISIBLE,
  "DEPARTMENTTYPE" NVARCHAR2(50) VISIBLE,
  "ENABLE" NUMBER(11,0) VISIBLE,
  "REMARK" NCLOB VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_DEPARTMENT
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_DEPARTMENT" VALUES (HEXTORAW('531F6B3B89D4904E9DA08ED8938D50A9'), '2', NULL, NULL, NULL, NULL, '2', '1', '超级管理员', TO_DATE('2023-05-21 15:03:23', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DEPARTMENT" VALUES (HEXTORAW('E9DD1281C08C9540AD4AEDEEAD4EF530'), '1', '1', NULL, NULL, NULL, '1', '1', '超级管理员', TO_DATE('2023-05-21 15:02:42', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DEPARTMENT" VALUES (HEXTORAW('FCCF5994AE922E408964E395FB4CA018'), '1', '1', NULL, NULL, NULL, '1', '1', '超级管理员', TO_DATE('2023-05-21 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DEPARTMENT" VALUES (HEXTORAW('3918DD4C304FA34B8698C7CF76538A1E'), '1', '1', NULL, NULL, NULL, '1', '1', '超级管理员', TO_DATE('2023-05-21 15:02:47', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DEPARTMENT" VALUES (HEXTORAW('5F8F45F24DFD5A47B3919D97AE3AF78E'), '1', '1', NULL, NULL, NULL, '1', '1', '超级管理员', TO_DATE('2023-05-21 15:02:47', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DEPARTMENT" VALUES (HEXTORAW('845DF25B4A50D64BB454662AA5F12F11'), '2', NULL, NULL, NULL, NULL, '2', '1', '超级管理员', TO_DATE('2023-05-21 15:03:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL);

-- ----------------------------
-- Table structure for SYS_DICTIONARY
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_DICTIONARY";
CREATE TABLE "C##NETCOREDEV"."SYS_DICTIONARY" (
  "DIC_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "CONFIG" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "DBSERVER" NCLOB VISIBLE,
  "DBSQL" NCLOB VISIBLE,
  "DICNAME" NVARCHAR2(100) VISIBLE NOT NULL,
  "DICNO" NVARCHAR2(100) VISIBLE NOT NULL,
  "ENABLE" NUMBER(4,0) VISIBLE NOT NULL,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "PARENTID" NUMBER(11,0) VISIBLE NOT NULL,
  "REMARK" NCLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_DICTIONARY
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('3', '{valueField: ''Enable'',
textField: ''Enable'',
 containField: null,
  handler: null }', TO_DATE('2019-07-05 17:36:23', 'SYYYY-MM-DD HH24:MI:SS'), NULL, 'admin', '1', NULL, '是否值', 'enable', '1', '超级管理员', TO_DATE('2022-01-03 18:30:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('30', '{valueField: ''Success'',
 textField: ''Success'', 
 containField: null,
 handler: null }
', TO_DATE('2018-06-11 18:26:05', 'SYYYY-MM-DD HH24:MI:SS'), '0', '测试超级管理员', NULL, NULL, '响应状态', 'restatus', '1', '测试超级管理员', TO_DATE('2018-06-12 10:21:48', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('31', '{valueField: ''LogType'',
 textField: ''LogType'', 
 containField: null,
 handler: null }
', TO_DATE('2018-06-12 14:46:07', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, NULL, '日志类型', 'log', '1', '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('32', '{valueField: ''Role_Id'',
 textField: ''RoleName'', 
 containField: [''Role_Id'',''RoleName''],
 handler: null }
', TO_DATE('2018-06-14 16:48:35', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, 'SELECT Role_Id as ''key'',RoleName as ''value'' FROM Sys_Role WHERE Enable=1
', '角色列表', 'roles', '1', '测试超级管理员', TO_DATE('2018-07-13 15:03:53', 'SYYYY-MM-DD HH24:MI:SS'), '1', '123', '0', 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('35', '{
 valueField: ''AuditStatus'',
 textField: ''AuditStatus'',
  containField:null 
}', TO_DATE('2018-07-10 10:51:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, NULL, '审核状态', 'audit', '1', '超级管理员', TO_DATE('2023-05-08 01:05:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('36', '{
 valueField: ''Variety'',
 textField: ''Variety'',
  containField:null 
}', TO_DATE('2018-07-10 14:06:12', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', NULL, NULL, '分类', 'pz', '1', '超级管理员', TO_DATE('2023-05-08 01:03:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('37', '{
 valueField: ''AgeRange'',
 textField: ''AgeRange'',
  containField:null 
}', TO_DATE('2018-07-10 14:07:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, NULL, '年龄', 'age', '1', '超级管理员', TO_DATE('2023-05-13 10:49:00', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('38', '{
 valueField: ''City'',
 textField: ''City'',
  containField:null 
}', TO_DATE('2018-07-10 14:18:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, '
SELECT  CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''key'',CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''value''  FROM Sys_City AS a 
INNER JOIN Sys_Province AS b 
ON a.ProvinceCode=b.ProvinceCode
WHERE a.CityName<> ''县''', '城市', 'city', '1', '超级管理员', TO_DATE('2020-02-01 22:27:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('44', '{
 valueField: ''NewsType'',
 textField: ''NewsType'',
  containField:null 
}', TO_DATE('2018-07-10 16:15:59', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', NULL, NULL, '新闻类型', 'news', '1', NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('46', '{
 valueField: ''ProvinceName'',
 textField: ''ProvinceName'',
  containField:null 
}', TO_DATE('2018-07-16 13:27:34', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, '
SELECT  CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''key'',CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''value''  FROM Sys_City AS a 
INNER JOIN Sys_Province AS b 
ON a.ProvinceCode=b.ProvinceCode
WHERE a.CityName<> ''县''', '省列表', 'pro', '1', '超级管理员', TO_DATE('2020-02-01 22:26:59', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', 'sql语句需要key,value列，界面才能绑定数据源');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('49', '{
 valueField: ''Gender'',
 textField: ''Gender'',
  containField:null 
}', TO_DATE('2018-07-23 10:04:45', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '测试超级管理员', NULL, NULL, '性别', 'gender', '1', '测试超级管理员', TO_DATE('2018-07-23 11:10:28', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('50', '{
 valueField: ''Enable'',
 textField: ''Enable'',
  containField:null 
}', TO_DATE('2018-07-23 15:36:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', NULL, NULL, '启用状态', 'status', '1', NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('59', '{
 valueField: ''IsRegregisterPhone'',
 textField: ''IsRegregisterPhone'',
  containField:null 
}', TO_DATE('2018-08-29 15:54:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', NULL, NULL, '手机用户', 'isphone', '1', '超级管理员', TO_DATE('2020-11-20 23:05:48', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('64', NULL, TO_DATE('2019-09-18 19:25:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '订单类型', 'ordertype', '1', '超级管理员', TO_DATE('2019-11-01 10:04:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', 'xxxxx');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('65', NULL, TO_DATE('2019-09-19 10:07:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '商品名称', 'pn', '1', '超级管理员', TO_DATE('2022-07-12 23:28:41', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2', '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('66', NULL, TO_DATE('2020-11-20 23:03:56', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, 'SELECT Role_Id AS id,parentId,Role_Id AS [key],RoleName AS value FROM Sys_Role', '级联角色', 'tree_roles', '1', '超级管理员', TO_DATE('2020-11-20 23:08:03', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('67', NULL, TO_DATE('2020-12-29 21:41:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, 'nav', 'nav', '1', NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('68', NULL, TO_DATE('2022-01-03 18:29:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '满意度', '满意度', '1', '超级管理员', TO_DATE('2022-06-27 00:52:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '0', '表单设计使用');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('70', NULL, TO_DATE('2022-09-06 00:48:10', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '请求方式', '请求方式', '1', NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('71', NULL, TO_DATE('2022-09-06 00:50:54', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '定时任务状态', '定时任务状态', '1', NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARY" VALUES ('72', NULL, TO_DATE('2023-05-13 08:58:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, 'SELECT DepartmentId AS ''key'',DepartmentId AS ''id'',ParentId AS parentId,DepartmentName as ''value'' FROM Sys_Department', '组织机构', '组织机构', '1', NULL, NULL, NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for SYS_DICTIONARYLIST
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_DICTIONARYLIST";
CREATE TABLE "C##NETCOREDEV"."SYS_DICTIONARYLIST" (
  "DICLIST_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "DICNAME" NVARCHAR2(100) VISIBLE,
  "DICVALUE" NVARCHAR2(100) VISIBLE,
  "DIC_ID" NUMBER(11,0) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "REMARK" NCLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_DICTIONARYLIST
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('3', NULL, '1', 'admin', '否', '0', '3', NULL, '超级管理员', TO_DATE('2022-01-03 18:30:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('4', NULL, '1', 'xxx', '是', '1', '3', NULL, '超级管理员', TO_DATE('2022-01-03 18:30:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('22', TO_DATE('2018-06-11 18:26:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '其他', '0', '30', NULL, '超级管理员', TO_DATE('2019-08-21 16:49:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '10', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('23', TO_DATE('2018-06-11 18:26:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '成功', '1', '30', NULL, '超级管理员', TO_DATE('2019-08-21 16:49:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '100', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('24', TO_DATE('2018-06-12 09:41:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '异常', '2', '30', NULL, '超级管理员', TO_DATE('2019-08-21 16:49:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '50', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('25', TO_DATE('2018-06-12 14:46:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '系统', 'System', '31', NULL, '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '100', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('26', TO_DATE('2018-06-12 14:47:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '登陆', 'Login', '31', NULL, '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '90', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('27', TO_DATE('2018-06-15 15:29:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '新建', 'Add', '31', NULL, '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('28', TO_DATE('2018-06-15 15:29:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '删除', 'Del', '31', '1', '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('29', TO_DATE('2018-06-15 15:30:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '编辑', 'Edit', '31', '1', '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('37', TO_DATE('2018-07-10 10:51:38', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '待审核', '0', '35', '0', '超级管理员', TO_DATE('2023-05-08 01:05:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('38', TO_DATE('2018-07-10 10:51:38', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '审核通过', '1', '35', NULL, '超级管理员', TO_DATE('2023-05-08 01:05:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('39', TO_DATE('2018-07-10 10:51:38', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '审核中', '2', '35', '0', '超级管理员', TO_DATE('2023-05-08 01:05:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('64', TO_DATE('2018-07-10 16:15:59', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '行业新闻', '1', '44', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('65', TO_DATE('2018-07-10 16:15:59', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '行情资讯', '2', '44', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('71', TO_DATE('2018-07-11 17:11:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '异常', 'Exception', '31', '0', '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('90', TO_DATE('2018-07-23 10:04:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '男', '0', '49', NULL, '测试超级管理员', TO_DATE('2018-07-23 11:10:28', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('91', TO_DATE('2018-07-23 10:04:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '女', '1', '49', NULL, '测试超级管理员', TO_DATE('2018-07-23 11:10:28', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('96', TO_DATE('2018-07-23 15:36:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '未启用', '0', '50', '1', '超级管理员', TO_DATE('2019-08-16 18:17:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('97', TO_DATE('2018-07-23 15:36:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '已启用', '1', '50', '1', '超级管理员', TO_DATE('2019-08-16 18:17:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('98', TO_DATE('2018-07-23 15:36:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '已删除', '2', '50', '1', '超级管理员', TO_DATE('2019-08-16 18:17:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('128', TO_DATE('2018-08-29 15:54:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '是', '1', '59', '0', '超级管理员', TO_DATE('2020-11-20 23:05:48', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('129', TO_DATE('2018-08-29 15:54:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', '测试超级管理员', '否', '0', '59', '1', '超级管理员', TO_DATE('2020-11-20 23:05:48', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('144', TO_DATE('2019-08-21 16:40:50', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '刷新Token', 'ReplaceToeken', '31', NULL, '超级管理员', TO_DATE('2022-04-04 13:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '110', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('145', TO_DATE('2019-08-21 16:49:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'Info', '3', '30', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('149', TO_DATE('2019-09-18 19:25:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '发货', '1', '64', '1', '超级管理员', TO_DATE('2019-11-01 10:04:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, 'fd');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('150', TO_DATE('2019-09-18 19:25:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '退货', '2', '64', '0', '超级管理员', TO_DATE('2019-11-01 10:04:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, 'fs');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('151', TO_DATE('2019-09-18 19:25:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '返单', '3', '64', '1', '超级管理员', TO_DATE('2019-11-01 10:04:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, 'xx');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('152', TO_DATE('2019-09-19 10:07:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '家居', '4', '65', '1', '超级管理员', TO_DATE('2020-02-07 17:57:12', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('153', TO_DATE('2019-09-19 10:07:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '男装', '3', '65', '1', '超级管理员', TO_DATE('2020-02-07 17:57:12', 'SYYYY-MM-DD HH24:MI:SS'), '1', '4', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('154', TO_DATE('2019-09-19 10:07:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '女装', '2', '65', '0', '超级管理员', TO_DATE('2020-02-07 17:57:12', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('155', TO_DATE('2019-09-19 10:07:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '食品', '1', '65', '0', '超级管理员', TO_DATE('2020-02-07 17:57:12', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, '数码相机,单反相机');
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('423', TO_DATE('2020-12-29 21:41:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '是', '1', '67', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('424', TO_DATE('2020-12-29 21:41:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '否', '0', '67', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('425', TO_DATE('2022-01-03 18:29:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '非常满意', '非常满意', '68', '0', '超级管理员', TO_DATE('2022-01-03 18:37:53', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('426', TO_DATE('2022-01-03 18:29:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '十分满意', '十分满意', '68', '0', '超级管理员', TO_DATE('2022-01-03 18:37:53', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('427', TO_DATE('2022-01-03 18:29:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '相当满意', '相当满意', '68', '0', '超级管理员', TO_DATE('2022-01-03 18:37:53', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('428', TO_DATE('2022-01-03 18:37:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '比较满意', '比较满意', '68', '0', '超级管理员', TO_DATE('2022-01-03 18:37:53', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('429', TO_DATE('2022-01-03 19:14:33', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '数码相机', '数码相机', '36', '0', '超级管理员', TO_DATE('2023-05-08 01:03:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('430', TO_DATE('2022-01-03 19:14:33', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '单反相机', '单反相机', '36', '0', '超级管理员', TO_DATE('2023-05-08 01:03:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('431', TO_DATE('2022-01-03 19:14:33', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '微单相机', '微单相机', '36', '0', '超级管理员', TO_DATE('2023-05-08 01:03:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('432', TO_DATE('2022-01-03 19:14:33', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '运动相机', '运动相机', '36', '0', '超级管理员', TO_DATE('2023-05-08 01:03:16', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('435', TO_DATE('2022-08-29 02:59:52', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '审核未通过', '3', '35', '0', '超级管理员', TO_DATE('2023-05-08 01:05:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('436', TO_DATE('2022-09-06 00:48:10', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'get', 'get', '70', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('437', TO_DATE('2022-09-06 00:48:10', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'post', 'post', '70', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('438', TO_DATE('2022-09-06 00:50:54', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '正常', '0', '71', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('439', TO_DATE('2022-09-06 00:50:54', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '暂停', '1', '71', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('440', TO_DATE('2022-09-07 01:50:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '20', '20', '37', '0', '超级管理员', TO_DATE('2023-05-13 10:49:00', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('441', TO_DATE('2022-09-07 01:50:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '30', '30', '37', '0', '超级管理员', TO_DATE('2023-05-13 10:49:00', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_DICTIONARYLIST" VALUES ('442', TO_DATE('2023-05-08 01:05:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '驳回', '4', '35', '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for SYS_LOG
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_LOG";
CREATE TABLE "C##NETCOREDEV"."SYS_LOG" (
  "ID" NUMBER(11,0) VISIBLE NOT NULL,
  "BEGINDATE" DATE VISIBLE,
  "BROWSERTYPE" NVARCHAR2(200) VISIBLE,
  "ELAPSEDTIME" NUMBER(11,0) VISIBLE,
  "ENDDATE" DATE VISIBLE,
  "EXCEPTIONINFO" NCLOB VISIBLE,
  "LOGTYPE" NVARCHAR2(50) VISIBLE,
  "REQUESTPARAMETER" NCLOB VISIBLE,
  "RESPONSEPARAMETER" NCLOB VISIBLE,
  "ROLE_ID" NUMBER(11,0) VISIBLE,
  "SERVICEIP" NVARCHAR2(100) VISIBLE,
  "SUCCESS" NUMBER(11,0) VISIBLE,
  "URL" NCLOB VISIBLE,
  "USERIP" NVARCHAR2(100) VISIBLE,
  "USERNAME" NCLOB VISIBLE,
  "USER_ID" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_MENU
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_MENU";
CREATE TABLE "C##NETCOREDEV"."SYS_MENU" (
  "MENU_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "MENUNAME" NVARCHAR2(50) VISIBLE NOT NULL,
  "AUTH" NCLOB VISIBLE,
  "ICON" NVARCHAR2(50) VISIBLE,
  "DESCRIPTION" NVARCHAR2(200) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "TABLENAME" NVARCHAR2(200) VISIBLE,
  "PARENTID" NUMBER(11,0) VISIBLE NOT NULL,
  "URL" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATOR" NVARCHAR2(50) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFIER" NVARCHAR2(50) VISIBLE,
  "MENUTYPE" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_MENU
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('104', '角色管理(tree)', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '0', '0', 'Sys_Role1', '2', '/Sys_Role1', TO_DATE('2021-05-02 13:41:35', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 08:51:01', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('105', 'tree自定义table数据', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '/treetable2', '92', '/treetable2', TO_DATE('2021-05-02 15:06:12', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2021-05-02 15:05:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('106', '表单设计', '[{"text":"查询","value":"Search"}]', 'el-icon-postcard', NULL, '1', '3000', '.', '0', NULL, TO_DATE('2021-08-28 00:39:04', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:04:28', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('107', '表单设计', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '100', '.', '106', '/formDraggable', TO_DATE('2021-08-28 00:40:00', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-01-03 19:01:45', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('109', '表单配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '0', 'FormDesignOptions', '106', '/FormDesignOptions', TO_DATE('2021-12-29 23:27:28', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-01-03 19:03:58', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('110', '数据采集', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', '.', '106', '/formCollectionResultTree', TO_DATE('2021-12-29 23:28:44', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2021-12-30 23:11:51', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('113', '基础页面', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '9000', '.', '0', NULL, TO_DATE('2022-03-26 00:58:41', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-04-04 13:39:54', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('114', '只读页面', NULL, NULL, NULL, '1', '10', 'App_Appointment', '123', 'pages/order/App_Appointment/App_Appointment', TO_DATE('2022-03-26 00:59:36', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:39:43', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('115', '水平显示', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '.', '113', '/pages/order/App_Appointment1/App_Appointment1', TO_DATE('2022-03-26 01:00:38', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-21 15:05:13', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('116', '数据源绑定', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '8500', '.', '0', NULL, TO_DATE('2022-03-26 02:03:48', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-04-04 13:39:50', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('117', '数据源绑定', NULL, NULL, NULL, '1', '10', 'App_TransactionAvgPrice', '116', 'pages/appmanager/App_TransactionAvgPrice/App_TransactionAvgPrice', TO_DATE('2022-03-26 02:04:58', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:38:12', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('118', '事件格式化', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '8200', '.', '0', NULL, TO_DATE('2022-03-26 03:08:59', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-04-04 13:40:01', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('119', '事件绑定', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '10', 'App_Transaction', '118', '/pages/appmanager/App_Transaction/App_Transaction', TO_DATE('2022-03-26 03:09:17', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:16:37', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('120', '格式化', NULL, NULL, NULL, '1', '0', '.', '118', '/pages/appmanager/App_Transaction1/App_Transaction1', TO_DATE('2022-03-26 03:09:45', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:38:50', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('121', '主从表页面', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '8100', '.', '0', NULL, TO_DATE('2022-03-26 03:10:46', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 13:54:32', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('122', '主表1对1', NULL, NULL, NULL, '1', '0', 'SellOrder', '121', '/pages/order/SellOrder/SellOrder', TO_DATE('2022-03-26 03:11:13', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:39:08', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('123', '表单vol-form', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '8000', '.', '0', NULL, TO_DATE('2022-03-26 03:12:06', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-16 00:56:15', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('124', '表单配置', NULL, NULL, NULL, '1', '10', '.', '123', '/pages/form/form2', TO_DATE('2022-03-26 03:12:39', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:39:45', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('125', '表单只读', NULL, NULL, NULL, '1', '0', '.', '113', 'pages/form/form1', TO_DATE('2022-03-26 03:12:52', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:38:00', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('126', '表格vol-table', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '7900', '.', '0', NULL, TO_DATE('2022-03-26 03:13:22', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 13:54:36', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('127', '列表显示table', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '.', '126', 'pages/table/table2/table2', TO_DATE('2022-03-26 03:13:47', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-16 00:56:12', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('128', '表格显示table', NULL, NULL, NULL, '1', '0', 'App_Expert', '126', '/pages/table/table1/table1', TO_DATE('2022-03-26 03:13:59', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:40:01', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('129', '自定义扩展', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '8050', '.', '0', NULL, TO_DATE('2022-03-26 03:16:13', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-16 00:56:20', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('130', '生成页面扩展组件', NULL, NULL, NULL, '1', '0', '.', '129', 'pages/pagedemo/pagedemo', TO_DATE('2022-03-26 03:16:51', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:39:26', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('131', '手动绑定数据', NULL, NULL, NULL, '1', '0', '.', '126', 'pages/table/table3/table3', TO_DATE('2022-03-27 03:02:06', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-03-27 15:40:03', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '1');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('132', '消息推送', '[{"text":"查询","value":"Search"}]', 'el-icon-chat-line-round', NULL, '1', '1700', '.', '0', '/signalR', TO_DATE('2022-05-03 03:31:02', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-05-03 03:31:20', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('133', '流程管理', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile', NULL, '1', '2500', '流程管理', '0', NULL, TO_DATE('2022-07-25 00:39:22', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 18:24:04', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('134', '流程管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', 'Sys_WorkFlow', '133', '/Sys_WorkFlow', TO_DATE('2022-07-25 00:39:56', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-01 03:18:05', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('135', '我的审批', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"}]', NULL, NULL, '1', '0', 'Sys_WorkFlowTable', '133', '/Sys_WorkFlowTable', TO_DATE('2022-08-01 00:35:05', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-16 01:00:46', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('136', '发起流程', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '发起流程', '133', '/flowdemo', TO_DATE('2022-08-16 00:21:39', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-16 00:21:46', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('36', '图表+表单', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '/', '32', 'formChart', NULL, NULL, TO_DATE('2019-11-09 18:23:54', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('37', '图片上传与预览 ', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '800', '图片上传与预览 ', '84', NULL, NULL, NULL, TO_DATE('2019-11-24 08:24:40', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('40', 'api加载table数据', '[{"text":"查询","value":"Search"}]', 'ivu-icon ivu-icon-ios-add-circle', NULL, '1', '900', 'table2', '33', 'table2', NULL, NULL, TO_DATE('2019-11-10 14:25:09', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('42', '下载已上传文件', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '下载已上传文件', '84', NULL, NULL, NULL, TO_DATE('2019-11-24 08:25:12', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('45', '不用节点', NULL, NULL, NULL, '0', '0', '/', '0', NULL, NULL, NULL, TO_DATE('2020-05-05 13:20:14', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('48', '单表数据', '[{"text":"查询","value":"Search"}]', 'el-icon-news', NULL, '1', '2000', 'Table+表单数据', '0', '/', TO_DATE('2019-07-12 13:26:32', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:05:00', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('49', '只读页面', '[{"text":"查询","value":"Search"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"test","value":"test"}]', 'el-icon-postcard', NULL, '1', '1000', 'App_Appointment', '48', '/App_Appointment', TO_DATE('2019-07-12 13:28:17', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:17:30', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('50', '自动数据源', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', NULL, NULL, '1', '900', 'App_TransactionAvgPrice', '48', '/App_TransactionAvgPrice', TO_DATE('2019-07-12 13:53:32', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:10:03', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('51', '自定义扩展一对多', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '800', 'App_ReportPrice', '74', '/App_ReportPrice', TO_DATE('2019-07-12 13:55:21', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-22 01:02:59', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('52', '导入导出表单', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '600', 'App_Transaction', '48', '/App_Transaction', TO_DATE('2019-07-12 13:56:15', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:16:49', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('53', '混合表单一对多', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '900', 'App_ReportPrice', '55', '/multi2', TO_DATE('2019-07-12 13:57:05', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-11-08 19:03:20', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('55', '表单一对多', '[{"text":"查询","value":"Search"}]', 'el-icon-c-scale-to-original', NULL, '1', '1740', '/', '0', NULL, TO_DATE('2019-07-12 13:58:34', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:06:07', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('56', '表单布局', '[{"text":"查询","value":"Search"}]', 'el-icon-mouse', NULL, '1', '1750', '/', '0', NULL, TO_DATE('2019-07-12 14:00:19', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:35:04', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('57', '单列表单', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '1000', '.', '56', '/form1', TO_DATE('2019-07-12 14:01:12', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2020-04-05 21:11:52', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('58', '两列表单', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '900', '两列表单', '56', '/form2', TO_DATE('2019-07-12 14:01:43', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-09-20 13:59:03', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('59', '多列表单', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', NULL, NULL, '1', '800', '多列表单', '56', '/form3', TO_DATE('2019-07-12 14:02:17', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2020-04-07 21:48:04', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('60', 'Table+表单', '[{"text":"查询","value":"Search"}]', 'el-icon-mouse', NULL, '1', '700', 'Table+表单', '56', '/form4', TO_DATE('2019-07-12 14:03:14', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:34:48', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('61', '系统设置', '[{"text":"查询","value":"Search"}]', 'el-icon-setting', NULL, '1', '1000', '系统设置', '0', '/', TO_DATE('2019-07-12 14:04:04', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:09:04', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('62', '菜单设置', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '10', 'Sys_Menu', '61', '/sysmenu', TO_DATE('2019-07-12 14:04:35', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-10-24 12:00:39', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('63', '下拉框绑定设置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '10', 'Sys_Dictionary', '61', '/Sys_Dictionary', TO_DATE('2019-07-12 14:05:58', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-08-16 17:41:15', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('64', '代码生成', '[{"text":"查询","value":"Search"}]', 'el-icon-edit', NULL, '1', '1500', '代码生成', '0', '/coding', TO_DATE('2019-07-12 14:07:55', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:08:43', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('65', '代码生成', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '10', '/', '64', '/coder', TO_DATE('2019-07-12 14:08:58', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-01-03 19:01:21', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('66', '编辑器与HTML', '[{"text":"查询","value":"Search"}]', 'el-icon-document-copy', NULL, '1', '1520', '静态页面发布', '0', '/', TO_DATE('2019-07-12 14:12:38', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:08:56', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('67', '静态页面发布', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', 'App_News', '66', '/App_News', TO_DATE('2019-07-12 14:14:16', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-12-22 14:46:39', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('68', '图片上传', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"},{"text":"审核","value":"Audit"}]', NULL, NULL, '1', '700', 'App_Expert', '48', '/App_Expert', TO_DATE('2019-07-12 14:24:15', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:10:17', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('71', '权限管理', '[{"text":"查询","value":"Search"},{"text":"编辑","value":"Update"}]', 'ivu-icon ivu-icon-ios-boat', NULL, '1', '1000', ',', '2', '/permission', TO_DATE('2019-08-10 10:25:36', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-08 02:11:07', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('72', '移动H5开发', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile', NULL, '1', '1650', '/', '0', NULL, TO_DATE('2019-08-14 13:16:06', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:07:59', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('73', '移动H5开发打包介绍', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', NULL, '/', '72', '/app/guide', TO_DATE('2019-08-14 13:16:55', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('74', '一对一(多)', '[{"text":"查询","value":"Search"}]', 'el-icon-copy-document', NULL, '1', '1770', '/', '0', '/', TO_DATE('2019-08-22 17:43:58', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:05:18', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('137', '定时任务', '[{"text":"查询","value":"Search"}]', 'el-icon-alarm-clock', NULL, '1', '1725', '定时任务', '0', NULL, TO_DATE('2022-09-05 03:19:10', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-01 00:33:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('138', '任务配置', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '0', 'Sys_QuartzOptions', '137', '/Sys_QuartzOptions', TO_DATE('2022-09-05 03:19:45', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-08-01 00:33:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('139', '执行记录', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', 'Sys_QuartzLog', '137', '/Sys_QuartzLog', TO_DATE('2022-09-05 03:20:06', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-09-05 03:20:08', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('142', '组织架构', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '2500', 'Sys_Department', '2', '/Sys_Department', TO_DATE('2023-05-08 02:12:15', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-21 15:08:56', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('143', '多页签/多表头', '[{"text":"查询","value":"Search"}]', 'el-icon-document', NULL, '1', '1760', '.', '0', NULL, TO_DATE('2023-05-13 18:26:49', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 18:27:01', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('144', '多页签', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '200', '.', '143', '/tabsTable', TO_DATE('2023-05-13 18:27:28', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 18:27:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('145', '多表头', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '100', '.', '143', '/App_Appointment2', TO_DATE('2023-05-13 18:27:48', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 18:27:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('2', '用户管理', '[{"text":"查询","value":"Search"}]', 'el-icon-user', NULL, '1', '2400', '.', '0', NULL, TO_DATE('2017-08-28 12:21:13', 'SYYYY-MM-DD HH24:MI:SS'), '2017-08-28 11:12:45', TO_DATE('2023-05-13 18:23:56', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('3', '角色管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '900', 'Sys_Role', '2', '/Sys_Role', TO_DATE('2017-09-12 16:20:02', 'SYYYY-MM-DD HH24:MI:SS'), '2017-08-28 14:19:13', TO_DATE('2023-05-08 02:10:41', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('5', '日志管理', '[{"text":"查询","value":"Search"}]', 'el-icon-date', NULL, '1', '1300', 'xxx', '0', '/', TO_DATE('2017-09-22 17:59:37', 'SYYYY-MM-DD HH24:MI:SS'), '2017-09-22 17:59:37', TO_DATE('2023-05-13 11:09:24', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('6', '系统日志', '[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', 'Sys_Log', '5', '/Sys_Log/Manager', TO_DATE('2017-09-22 18:00:25', 'SYYYY-MM-DD HH24:MI:SS'), '2017-09-22 18:0:25', TO_DATE('2019-08-14 16:20:35', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('8', '图表', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '10000', '/', '32', 'chart', NULL, NULL, TO_DATE('2020-04-05 21:20:29', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('9', '用户管理', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', NULL, NULL, '1', '2000', 'Sys_User', '2', '/Sys_User', NULL, NULL, TO_DATE('2023-05-08 02:11:52', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('13', '表单+图表', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '800', '.', '55', '/multi3', TO_DATE('2017-08-28 14:22:08', 'SYYYY-MM-DD HH24:MI:SS'), 'null', TO_DATE('2023-05-13 11:15:48', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('25', '其他组件', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '1100', '/', '29', '/form6', NULL, NULL, TO_DATE('2019-09-20 12:44:50', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('28', '基础可编辑table', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '1500', 'vtable', '33', 'table1', NULL, NULL, TO_DATE('2019-11-10 14:25:15', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('29', '其他组件', '[{"text":"查询","value":"Search"}]', 'el-icon-monitor', NULL, '1', '1690', '/', '0', NULL, NULL, NULL, TO_DATE('2023-05-13 11:07:48', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('31', '表单一对多table', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '950', 'App_TransactionAvgPrice1', '55', '/multi1', NULL, NULL, TO_DATE('2019-11-08 17:06:27', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('32', '图表+表单', '[{"text":"查询","value":"Search"}]', 'el-icon-full-screen', NULL, '1', '1720', '/', '0', NULL, NULL, NULL, TO_DATE('2023-05-13 11:06:37', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('33', 'table组件', '[{"text":"查询","value":"Search"}]', 'el-icon-mobile-phone', NULL, '1', '1710', 'tables', '0', '/', NULL, NULL, TO_DATE('2023-05-13 11:06:57', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('34', '表单与上传下载', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', NULL, NULL, '1', '0', '表单与上传下载', '84', '/formUpload', NULL, NULL, TO_DATE('2019-11-24 21:07:25', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('75', '主从一对一(1)', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', NULL, NULL, '1', '1000', 'SellOrder', '74', '/SellOrder', TO_DATE('2019-08-22 18:12:43', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2021-03-14 22:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('77', '表单只读', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '600', '表单只读', '56', '/form7', TO_DATE('2019-08-26 11:58:55', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-09-20 13:59:13', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('84', '文件上传', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', 'el-icon-document', NULL, '1', '1700', '文件上传', '0', '/', TO_DATE('2019-11-11 12:59:03', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:07:16', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('85', '基本文件上传', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '1000', '基本文件上传', '84', '/volUploadExample', TO_DATE('2019-11-20 18:03:07', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-12-17 11:18:34', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('86', '后台校验', '[{"text":"查询","value":"Search"}]', 'el-icon-connection', NULL, '1', '1700', '/', '0', NULL, TO_DATE('2019-11-22 11:17:22', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:07:31', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('87', 'KindEditor编辑器', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '1000', 'KindEditor编辑器', '66', '/kindEditor', TO_DATE('2019-12-19 11:37:31', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-12-23 10:01:38', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('88', '静态页面列表', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '900', 'htmlList', '66', '/htmlList', TO_DATE('2019-12-22 14:31:22', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-12-23 10:01:43', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('89', '后台参数校验', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '1700', '.', '86', '/validator', TO_DATE('2020-02-02 17:00:05', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2020-02-02 17:00:49', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('90', '从表图片上传', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', 'vSellOrderImg', '74', '/vSellOrderImg', TO_DATE('2020-04-07 20:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2022-05-23 21:14:41', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('91', '数字排版', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', '数字排版', '32', '/flex', TO_DATE('2020-04-07 21:51:38', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-11-09 18:23:53', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('92', '树形菜单', '[{"text":"查询","value":"Search"}]', 'el-icon-bank-card', NULL, '1', '1705', '树形菜单与表', '0', NULL, TO_DATE('2020-04-26 14:19:01', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:07:07', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('93', 'tree与代码生成页面', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '1000', 'tree与代码生成页面', '92', 'treetable1', TO_DATE('2020-04-26 14:20:36', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2020-04-26 14:19:51', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('94', 'tree与自定义table', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', 'treetable2', '92', '/treetable2', TO_DATE('2020-04-26 18:12:46', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2020-04-26 14:19:51', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('96', '默认编辑器', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"}]', NULL, NULL, '1', '0', 'App_NewsEditor', '48', '/App_NewsEditor', TO_DATE('2021-01-16 10:57:44', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-11-17 19:10:37', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('97', '多列合并显示', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', NULL, NULL, '1', '0', 'App_Expert2', '48', '/App_Expert2', TO_DATE('2021-03-06 15:51:14', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2023-05-13 11:12:37', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', '0');
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('98', '主从一对一(2)', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '990', 'SellOrder2', '74', '/SellOrder2', TO_DATE('2021-03-14 22:20:13', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2021-03-14 22:21:13', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('99', '主从一对多(3)', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '980', 'SellOrder3', '74', '/SellOrder3', TO_DATE('2021-03-14 22:42:49', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2021-03-14 22:21:13', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('100', '表格编辑', '[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', NULL, NULL, '1', '0', 'App_Transaction2', '48', '/App_Transaction2', TO_DATE('2021-03-19 22:35:06', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-10-31 10:09:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_MENU" VALUES ('101', 'table编辑(2)', '[{"text":"查询","value":"Search"}]', NULL, NULL, '1', '0', 'table3', '33', '/table3', TO_DATE('2021-03-20 12:58:53', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', TO_DATE('2019-11-10 14:25:09', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);

-- ----------------------------
-- Table structure for SYS_PROVINCE
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_PROVINCE";
CREATE TABLE "C##NETCOREDEV"."SYS_PROVINCE" (
  "PROVINCEID" NUMBER(11,0) VISIBLE NOT NULL,
  "PROVINCECODE" NVARCHAR2(20) VISIBLE NOT NULL,
  "PROVINCENAME" NVARCHAR2(30) VISIBLE NOT NULL,
  "REGIONCODE" NVARCHAR2(20) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_PROVINCE
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('1', '110000', '北京市', '华北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('2', '120000', '天津市', '华北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('3', '130000', '河北省', '华北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('4', '140000', '山西省', '华北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('5', '150000', '内蒙古自治区', '华北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('6', '210000', '辽宁省', '东北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('7', '220000', '吉林省', '东北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('8', '230000', '黑龙江省', '东北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('9', '310000', '上海市', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('10', '320000', '江苏省', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('11', '330000', '浙江省', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('12', '340000', '安徽省', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('13', '350000', '福建省', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('14', '360000', '江西省', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('15', '370000', '山东省', '华东');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('16', '410000', '河南省', '华中');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('17', '420000', '湖北省', '华中');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('18', '430000', '湖南省', '华中');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('19', '440000', '广东省', '华南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('20', '450000', '广西壮族自治区', '华南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('21', '460000', '海南省', '华南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('22', '500000', '重庆市', '西南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('23', '510000', '四川省', '西南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('24', '520000', '贵州省', '西南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('25', '530000', '云南省', '西南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('26', '540000', '西藏自治区', '西南');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('27', '610000', '陕西省', '西北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('28', '620000', '甘肃省', '西北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('29', '630000', '青海省', '西北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('30', '640000', '宁夏回族自治区', '西北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('31', '650000', '新疆维吾尔自治区', '西北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('32', '710000', '台湾省', '港澳台');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('33', '810000', '香港特别行政区', '港澳台');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('34', '820000', '澳门特别行政区', '港澳台');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('35', 'thd', '桃花岛', '东北');
INSERT INTO "C##NETCOREDEV"."SYS_PROVINCE" VALUES ('43', '测试1', '测试1', '港澳台');

-- ----------------------------
-- Table structure for SYS_QUARTZLOG
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_QUARTZLOG";
CREATE TABLE "C##NETCOREDEV"."SYS_QUARTZLOG" (
  "LOGID" NVARCHAR2(36) VISIBLE NOT NULL,
  "ID" NVARCHAR2(36) VISIBLE,
  "TASKNAME" NCLOB VISIBLE,
  "ELAPSEDTIME" NUMBER(11,0) VISIBLE,
  "STRATDATE" DATE VISIBLE,
  "ENDDATE" DATE VISIBLE,
  "RESULT" NUMBER(11,0) VISIBLE,
  "RESPONSECONTENT" NCLOB VISIBLE,
  "ERRORMSG" NCLOB VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZLOG"."TASKNAME" IS '任务名称';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZLOG"."ELAPSEDTIME" IS '耗时(秒)';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZLOG"."STRATDATE" IS '开始时间';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZLOG"."ENDDATE" IS '结束时间';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZLOG"."RESULT" IS '执行结果';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZLOG"."RESPONSECONTENT" IS '返回内容';

-- ----------------------------
-- Records of SYS_QUARTZLOG
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_QUARTZOPTIONS
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS";
CREATE TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" (
  "ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "TASKNAME" NCLOB VISIBLE NOT NULL,
  "GROUPNAME" NCLOB VISIBLE NOT NULL,
  "CRONEXPRESSION" NVARCHAR2(100) VISIBLE NOT NULL,
  "METHOD" NVARCHAR2(50) VISIBLE,
  "APIURL" NCLOB VISIBLE,
  "AUTHKEY" NVARCHAR2(200) VISIBLE,
  "AUTHVALUE" NVARCHAR2(200) VISIBLE,
  "DESCRIBE" NCLOB VISIBLE,
  "LASTRUNTIME" DATE VISIBLE,
  "STATUS" NUMBER(11,0) VISIBLE,
  "POSTDATA" NCLOB VISIBLE,
  "TIMEOUT" NUMBER(11,0) VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."TASKNAME" IS '任务名称';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."GROUPNAME" IS '任务分组';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."CRONEXPRESSION" IS 'Corn表达式';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."METHOD" IS '请求方式';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."APIURL" IS 'Url地址';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."DESCRIBE" IS '描述';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."LASTRUNTIME" IS '最后执行执行';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."STATUS" IS '运行状态';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."POSTDATA" IS 'post参数';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."TIMEOUT" IS '超时时间(秒)';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."CREATEDATE" IS '创建时间';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_QUARTZOPTIONS"."MODIFYDATE" IS '修改时间';

-- ----------------------------
-- Records of SYS_QUARTZOPTIONS
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_ROLE";
CREATE TABLE "C##NETCOREDEV"."SYS_ROLE" (
  "ROLE_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "CREATEDATE" DATE VISIBLE,
  "CREATOR" NVARCHAR2(50) VISIBLE,
  "DELETEBY" NVARCHAR2(50) VISIBLE,
  "DEPTNAME" NVARCHAR2(50) VISIBLE,
  "DEPT_ID" NUMBER(11,0) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "MODIFIER" NVARCHAR2(50) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "PARENTID" NUMBER(11,0) VISIBLE NOT NULL,
  "ROLENAME" NVARCHAR2(50) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_ROLE" VALUES ('1', TO_DATE('2018-08-23 11:46:06', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL, '无', '0', '1', '测试超级管理员', TO_DATE('2018-09-06 17:08:35', 'SYYYY-MM-DD HH24:MI:SS'), '1000', '0', '超级管理员');
INSERT INTO "C##NETCOREDEV"."SYS_ROLE" VALUES ('2', TO_DATE('2018-08-23 11:46:52', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL, '1', '0', '1', '超级管理员', TO_DATE('2022-04-17 20:11:05', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '1', '测试管理员');
INSERT INTO "C##NETCOREDEV"."SYS_ROLE" VALUES ('4', TO_DATE('2018-08-23 11:47:41', 'SYYYY-MM-DD HH24:MI:SS'), '超级管理员', NULL, '无  ', '0', '1', '超级管理员', TO_DATE('2019-12-08 21:11:11', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '2', '信息员');

-- ----------------------------
-- Table structure for SYS_ROLEAUTH
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_ROLEAUTH";
CREATE TABLE "C##NETCOREDEV"."SYS_ROLEAUTH" (
  "AUTH_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "AUTHVALUE" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATOR" NCLOB VISIBLE,
  "MENU_ID" NUMBER(11,0) VISIBLE,
  "MODIFIER" NCLOB VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "ROLE_ID" NUMBER(11,0) VISIBLE,
  "USER_ID" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_ROLEAUTH

-- ----------------------------
-- Table structure for SYS_TABLECOLUMN
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_TABLECOLUMN";
CREATE TABLE "C##NETCOREDEV"."SYS_TABLECOLUMN" (
  "COLUMNID" NUMBER(11,0) VISIBLE NOT NULL,
  "APIINPUT" NUMBER(11,0) VISIBLE,
  "APIISNULL" NUMBER(11,0) VISIBLE,
  "APIOUTPUT" NUMBER(11,0) VISIBLE,
  "COLSIZE" NUMBER(11,0) VISIBLE,
  "COLUMNCNNAME" NVARCHAR2(100) VISIBLE,
  "COLUMNNAME" NVARCHAR2(100) VISIBLE,
  "COLUMNTYPE" NCLOB VISIBLE,
  "COLUMNWIDTH" NUMBER(11,0) VISIBLE,
  "COLUMNFORMAT" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(200) VISIBLE,
  "DROPNO" NVARCHAR2(50) VISIBLE,
  "EDITCOLNO" NUMBER(11,0) VISIBLE,
  "EDITROWNO" NUMBER(11,0) VISIBLE,
  "EDITTYPE" NVARCHAR2(200) VISIBLE,
  "ENABLE" NUMBER(11,0) VISIBLE,
  "ISCOLUMNDATA" NUMBER(11,0) VISIBLE,
  "ISDISPLAY" NUMBER(11,0) VISIBLE,
  "ISIMAGE" NUMBER(11,0) VISIBLE,
  "ISKEY" NUMBER(11,0) VISIBLE,
  "ISNULL" NUMBER(11,0) VISIBLE,
  "ISREADDATASET" NUMBER(11,0) VISIBLE,
  "MAXLENGTH" NUMBER(11,0) VISIBLE,
  "MODIFIER" NCLOB VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "SCRIPT" NCLOB VISIBLE,
  "SEARCHCOLNO" NUMBER(11,0) VISIBLE,
  "SEARCHROWNO" NUMBER(11,0) VISIBLE,
  "SEARCHTYPE" NVARCHAR2(200) VISIBLE,
  "SORTABLE" NUMBER(11,0) VISIBLE,
  "TABLENAME" NVARCHAR2(200) VISIBLE,
  "TABLE_ID" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_TABLECOLUMN
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('157', NULL, NULL, NULL, NULL, '年龄', 'Age', 'string', '80', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'age', NULL, '1', 'select', NULL, '1', '1', NULL, '0', '0', '0', '100', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8420', NULL, NULL, '1', 'select', '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('158', NULL, NULL, NULL, NULL, '城市', 'City', 'string', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'city', NULL, '1', 'select', NULL, '1', '1', NULL, '0', '0', '0', '30', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8410', NULL, NULL, '1', 'select', '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('159', NULL, NULL, NULL, NULL, '价格', 'Price', 'decimal', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', 'decimal', NULL, '1', '1', NULL, '0', '0', '0', '9', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8400', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('160', '0', NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'audit', NULL, NULL, 'select', NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8382', NULL, NULL, '2', 'select', '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('161', NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8380', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('162', NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '40', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8370', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('163', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '2', 'switch', NULL, '1', '1', NULL, '0', '1', '1', '1', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8360', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('164', NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8350', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('165', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '100', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '0', NULL, '0', '1', '1', '60', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8388', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('166', NULL, '0', NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '5', 'datetime', NULL, '1', '0', NULL, '0', '1', '1', NULL, '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8387', NULL, NULL, '2', 'datetime', '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('167', NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8320', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('168', NULL, NULL, NULL, '12', '测试', 'Modifier', 'string', '100', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '60', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8310', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('169', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '5', '无', NULL, '1', '1', NULL, '0', '1', '1', NULL, '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8300', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('170', NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', '110', NULL, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, '0', '0', NULL, NULL, '1', '1', NULL, '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8381', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('193', NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', '90', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8060', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('194', NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', '120', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '0', '0', '50', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8050', NULL, NULL, '1', 'text', '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('195', NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', '150', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '50', 'phone', NULL, '1', '1', NULL, '0', '0', '0', '15', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8040', NULL, NULL, '1', 'text', '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('196', NULL, NULL, NULL, NULL, '数量', 'Quantity', 'int', '90', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8030', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('197', NULL, NULL, NULL, NULL, '购买类型', 'CowType', 'string', '90', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'nav', NULL, '30', 'select', NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8020', NULL, NULL, '2', 'selectList', '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('198', NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', '190', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '60', 'textarea', NULL, '1', '1', NULL, '0', '0', '0', '500', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8010', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('199', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8000', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('200', NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', '90', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7990', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('201', NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', '130', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7980', NULL, NULL, '2', NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('202', NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7970', NULL, NULL, '2', 'datetime', '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('203', NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', '90', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7960', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('204', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7950', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('205', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 15:12:25', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7940', NULL, NULL, NULL, NULL, '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('206', '1', '1', '0', NULL, '主键ID', 'ExpertId', 'int', '80', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7930', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('207', NULL, NULL, NULL, NULL, '名称', 'ExpertName', 'string', '120', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '1', '0', '20', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7920', NULL, NULL, '1', 'like', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('208', NULL, NULL, NULL, NULL, '姓名', 'ReallyName', 'string', '90', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '1', '0', '20', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7910', NULL, NULL, '1', NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('209', NULL, NULL, NULL, NULL, '身份证号', 'IDNumber', 'string', '200', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '18', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7900', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('210', NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', '90', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '10', 'img', NULL, '1', '1', '1', '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7920', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('211', NULL, NULL, NULL, NULL, '学历', 'Education', 'string', '120', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7880', NULL, NULL, NULL, 'text', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('212', NULL, NULL, NULL, NULL, '职业', 'Professional', 'string', '120', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7870', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('21', NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', '70', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1410', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('22', NULL, NULL, NULL, NULL, '角色名称', 'RoleName', 'string', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '100', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1400', NULL, NULL, '1', 'text', '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('23', NULL, NULL, NULL, NULL, '部门ID', 'Dept_Id', 'int', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1390', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('24', NULL, NULL, NULL, NULL, '部门名称', 'DeptName', 'string', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1380', NULL, NULL, '1', 'text', '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('25', NULL, NULL, NULL, NULL, '排序', 'OrderNo', 'int', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1370', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('26', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', NULL, '0', '1', '1', '100', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1360', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('27', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '4', 'datetime', NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1350', NULL, NULL, '2', 'datetime', '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('28', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '1', NULL, '0', '1', '1', '100', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1340', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('29', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1330', NULL, NULL, '2', 'datetime', '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('30', NULL, NULL, NULL, NULL, NULL, 'DeleteBy', 'string', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1320', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('31', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '2', 'switch', NULL, '1', '1', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1375', NULL, NULL, '1', 'select', '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('32', NULL, NULL, NULL, NULL, '字典ID', 'Dic_ID', 'int', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1300', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('33', NULL, NULL, NULL, NULL, '字典名称', 'DicName', 'string', '140', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '200', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1290', NULL, NULL, '1', 'textarea', '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('34', NULL, NULL, NULL, NULL, '父级ID', 'ParentId', 'int', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1280', NULL, NULL, '1', NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('35', NULL, NULL, NULL, NULL, '配置项', 'Config', 'string', '300', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8000', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1270', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('36', NULL, NULL, NULL, '8', 'sql语句', 'DbSql', 'string', '200', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '6', 'textarea', NULL, '1', '1', NULL, '0', '1', '0', '8000', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1260', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('37', NULL, NULL, NULL, NULL, 'DBServer', 'DBServer', 'string', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8000', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1250', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('38', NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1240', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('39', NULL, NULL, NULL, NULL, '字典编号', 'DicNo', 'string', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '200', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1295', NULL, NULL, '1', NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('40', NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '6', 'textarea', NULL, '1', '1', NULL, '0', '1', '0', '4000', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1220', NULL, NULL, NULL, '无', '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('41', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '2', 'select', NULL, '1', '1', NULL, '0', '0', '0', '1', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1210', NULL, NULL, '2', 'select', '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('42', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('43', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '1', '60', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1190', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('44', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', 'datetime', NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1180', NULL, NULL, '2', 'datetime', '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('45', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '90', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1170', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('46', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '1', '60', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1160', NULL, NULL, NULL, NULL, '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('47', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '150', NULL, TO_DATE('2018-06-06 14:05:43', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2022-07-18 01:41:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, '2', 'datetime', '0', 'Sys_Dictionary', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('48', NULL, NULL, NULL, NULL, NULL, 'DicList_ID', 'int', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1140', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('49', NULL, NULL, NULL, NULL, '数据源ID', 'Dic_ID', 'int', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '1', '4', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1130', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('50', NULL, NULL, NULL, NULL, '数据源Value', 'DicValue', 'string', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', 'text', NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1120', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('51', NULL, NULL, NULL, NULL, '数据源Text', 'DicName', 'string', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', 'text', NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1110', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('52', NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', 'text', NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('53', NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'pz', NULL, '1', 'selectList', NULL, '1', '1', NULL, '0', '1', '0', '2000', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1090', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('54', NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '1', 'switch', NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1080', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('55', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, '无', NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1070', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('56', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '1', '30', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1060', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('57', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('58', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1040', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('59', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1030', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('60', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2018-06-06 14:12:18', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-06-27 00:37:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1020', NULL, NULL, NULL, NULL, '0', 'Sys_DictionaryList', '4');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('61', NULL, NULL, NULL, NULL, NULL, 'Id', 'int', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '10000', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('62', NULL, NULL, NULL, '12', '日志类型', 'LogType', 'string', '80', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'log', NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8888', NULL, NULL, '3', 'checkbox', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('63', NULL, NULL, NULL, NULL, '请求参数', 'RequestParameter', 'string', '70', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '20000', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7990', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('64', NULL, NULL, NULL, NULL, '响应参数', 'ResponseParameter', 'string', '70', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '20000', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7980', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('65', NULL, NULL, NULL, NULL, '异常信息', 'ExceptionInfo', 'string', '70', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '20000', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7970', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('66', NULL, NULL, NULL, NULL, '响应状态', 'Success', 'int', '80', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'restatus', NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8700', NULL, NULL, '2', 'selectList', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('67', NULL, NULL, NULL, NULL, '开始时间', 'BeginDate', 'DateTime', '140', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '9999', NULL, NULL, '2', 'datetime', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('68', NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', '150', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '880', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('69', NULL, NULL, NULL, NULL, '时长', 'ElapsedTime', 'int', '60', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8600', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('70', NULL, NULL, NULL, NULL, '用户IP', 'UserIP', 'string', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7920', NULL, NULL, '1', 'text', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('71', NULL, NULL, NULL, NULL, '服务器IP', 'ServiceIP', 'string', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7910', NULL, NULL, '1', 'text', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('72', NULL, NULL, NULL, NULL, '浏览器类型', 'BrowserType', 'string', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '400', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7900', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('73', NULL, NULL, NULL, NULL, '请求地址', 'Url', 'string', '110', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8000', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '9000', NULL, NULL, '1', 'text', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('74', NULL, NULL, NULL, NULL, '用户ID', 'User_Id', 'int', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7880', NULL, NULL, NULL, 'text', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('75', NULL, NULL, NULL, NULL, '用户名称', 'UserName', 'string', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8000', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '9100', NULL, NULL, NULL, NULL, '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('76', NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', '90', NULL, TO_DATE('2018-06-11 18:22:16', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'roles', NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-07-18 01:41:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7860', NULL, NULL, '2', 'select', '0', 'Sys_Log', '5');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('77', NULL, NULL, NULL, NULL, NULL, 'User_Id', 'int', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8000', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('78', NULL, NULL, NULL, NULL, '不用', 'Dept_Id', 'int', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7840', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('79', '0', NULL, '1', NULL, '不用', 'DeptName', 'string', '150', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', 'text', NULL, '1', '0', NULL, '0', '1', '0', '150', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7830', NULL, NULL, '2', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('80', '0', '0', '1', NULL, '角色', 'Role_Id', 'int', '130', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'tree_roles', NULL, '5', 'cascader', NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7820', NULL, NULL, '2', 'select', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('81', NULL, NULL, NULL, NULL, '不用', 'RoleName', 'string', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7810', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('82', '1', '0', '1', NULL, '帐号', 'UserName', 'string', '120', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '1', '100', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7945', NULL, NULL, '1', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('83', '1', '0', NULL, NULL, '密码', 'UserPwd', 'string', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7790', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('84', NULL, NULL, NULL, NULL, '姓名', 'UserTrueName', 'string', '120', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '2', 'text', NULL, '1', '1', NULL, '0', '0', '0', '20', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7944', NULL, NULL, '1', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('85', NULL, NULL, NULL, NULL, '地址', 'Address', 'string', '190', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', 'text', NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7270', NULL, NULL, '4', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('86', NULL, NULL, NULL, NULL, '电话', 'Mobile', 'string', '140', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', 'text', NULL, '1', '0', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7260', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('213', NULL, NULL, NULL, NULL, '所在公司', 'Company', 'string', '150', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7860', NULL, NULL, NULL, '无', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('214', NULL, NULL, NULL, NULL, '地区', 'City', 'string', '100', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'city', NULL, '5', 'select', NULL, '1', '1', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7850', NULL, NULL, NULL, 'selectList', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('215', NULL, NULL, NULL, NULL, '擅长', 'SpecialField', 'string', '120', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, 'textarea', NULL, '0', '1', NULL, '0', '1', '0', '800', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7840', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('216', NULL, NULL, NULL, '12', '简介', 'Resume', 'string', '150', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '7', 'textarea', NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7830', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('217', NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', '100', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'audit', NULL, '0', 'select', NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7919', NULL, NULL, '1', 'selectList', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('218', NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', '80', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7810', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('219', NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', '90', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '20', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7919', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('220', NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', 'datetime', NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7790', NULL, NULL, NULL, 'datetime', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('221', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '3', 'select', NULL, '1', '1', NULL, '0', '0', '0', '1', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7919', NULL, NULL, '1', 'select', '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('222', NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', '80', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7770', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('223', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7760', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('224', NULL, NULL, NULL, NULL, '申请时间', 'CreateDate', 'DateTime', '130', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7750', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('225', NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', '80', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7740', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('226', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '100', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7730', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('227', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '130', NULL, TO_DATE('2018-07-10 15:29:01', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7720', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('308', NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', '80', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6910', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('309', NULL, NULL, NULL, '12', '标题', 'Title', 'string', '250', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '100', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6900', NULL, NULL, '1', NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('310', NULL, NULL, NULL, NULL, '发布人', 'Author', 'string', '120', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '1', '100', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6890', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('311', '0', NULL, NULL, NULL, '发布时间', 'ReleaseDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6880', NULL, NULL, '3', 'datetime', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('312', NULL, NULL, NULL, '12', '封面图片', 'ImageUrl', 'string', '220', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '9', NULL, NULL, '1', '1', '1', '0', '1', '0', '0', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6870', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('313', NULL, NULL, NULL, NULL, '图片(大图)', 'BigImageUrls', 'string', '220', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '1000', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6860', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('314', NULL, NULL, NULL, '12', '新闻地址', 'DetailUrl', 'string', '90', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '8', NULL, NULL, '1', '1', NULL, '0', '1', '0', '400', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6850', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('315', NULL, NULL, NULL, NULL, '浏览次数', 'ViewCount', 'int', '110', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, '2', '3', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6840', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('316', NULL, NULL, NULL, NULL, '新闻类型', 'NewsType', 'int', '110', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'news', '1', '3', 'select', NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6830', NULL, NULL, '1', 'select', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('317', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'int', '90', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '7', 'select', NULL, '1', '1', NULL, '0', '1', '0', '2', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6820', NULL, NULL, '3', 'select', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('318', NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', '80', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6810', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('319', NULL, NULL, NULL, NULL, '发布人', 'Creator', 'string', '130', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '6', NULL, NULL, '1', '1', NULL, '0', '1', '1', '60', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6800', NULL, NULL, '3', '无', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('320', NULL, NULL, NULL, NULL, '发布时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '6', NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6790', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('321', NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', '80', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6780', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('322', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '60', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6770', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('323', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 16:11:59', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '7', NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6760', NULL, NULL, NULL, 'datetime', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('324', NULL, NULL, NULL, '12', '新闻内容', 'Content', 'string', '300', NULL, NULL, NULL, NULL, NULL, NULL, '10', NULL, NULL, '1', '0', NULL, NULL, '1', '0', '0', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6896', NULL, NULL, NULL, NULL, NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('429', '1', '0', NULL, NULL, '手机号', 'PhoneNo', 'string', '150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, '1', '0', '11', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7760', NULL, NULL, '3', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('20', NULL, NULL, NULL, NULL, '角色ID', 'Role_Id', 'int', '70', NULL, TO_DATE('2018-06-04 10:14:21', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2023-02-03 17:22:23', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1420', NULL, NULL, NULL, NULL, '0', 'Sys_Role', '2');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('87', NULL, NULL, NULL, NULL, 'Email', 'Email', 'string', '140', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', 'mail', NULL, '1', '0', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7250', NULL, NULL, '4', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('88', NULL, NULL, NULL, NULL, NULL, 'Tel', 'string', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '20', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7740', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('89', NULL, NULL, NULL, '12', '备注', 'Remark', 'string', '180', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '13', 'textarea', NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7230', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('90', NULL, NULL, NULL, NULL, '排序号', 'OrderNo', 'int', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '0', 'text', NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7220', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('91', NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'byte', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, '10', 'select', NULL, '1', '1', NULL, '0', '0', '0', '1', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7670', NULL, NULL, '4', 'select', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('92', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7700', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('93', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '1', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7690', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('94', NULL, NULL, NULL, NULL, '注册时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7780', NULL, NULL, '5', 'datetime', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('95', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7670', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('96', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '1', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7660', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('97', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, 'datetime', NULL, '1', '0', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7650', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('98', NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'audit', NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7640', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('99', NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', '90', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7630', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('100', NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', '150', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7620', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('101', NULL, NULL, NULL, NULL, '最后登陆时间', 'LastLoginDate', 'DateTime', '150', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7610', NULL, NULL, '5', 'datetime', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('102', NULL, NULL, NULL, NULL, '最后密码修改时间', 'LastModifyPwdDate', 'DateTime', '150', NULL, TO_DATE('2018-06-14 16:44:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7600', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('114', NULL, NULL, NULL, NULL, '头像', 'HeadImageUrl', 'string', '90', NULL, NULL, NULL, NULL, NULL, NULL, '20', 'img', NULL, '1', '1', '1', '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7842', NULL, NULL, NULL, NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('142', NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8570', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('143', NULL, NULL, NULL, '12', '分类', 'Variety', 'string', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'pz', NULL, '1', 'checkbox', NULL, '1', '1', NULL, '0', '0', '0', '20', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8560', NULL, NULL, '1', 'select', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('144', NULL, NULL, NULL, '12', '年龄', 'AgeRange', 'string', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'age', NULL, '10', 'select', NULL, '1', '1', NULL, '0', '0', '0', '50', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8561', NULL, NULL, '1', 'select', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('145', NULL, NULL, NULL, '12', '城市', 'City', 'string', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'city', NULL, '15', 'select', NULL, '1', '1', NULL, '0', '0', '0', '15', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8540', NULL, NULL, '1', 'select', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('146', NULL, NULL, NULL, '12', '价格', 'AvgPrice', 'decimal', '80', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '20', NULL, NULL, '1', '1', NULL, '0', '0', '0', '9', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8530', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('147', NULL, NULL, NULL, '12', '日期', 'Date', 'DateTime', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '25', 'date', NULL, '1', '1', '4', '0', '0', '0', '3', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8520', NULL, NULL, '2', 'datetime', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('148', NULL, NULL, NULL, NULL, '远程', 'Enable', 'byte', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'enable', NULL, NULL, 'selectList', NULL, '1', '0', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8510', NULL, NULL, '2', 'selectList', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('149', NULL, NULL, NULL, NULL, '创建人Id', 'CreateID', 'int', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8500', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('150', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '100', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '40', NULL, NULL, '1', '1', NULL, '0', '1', '1', '30', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8490', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('151', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '40', NULL, NULL, '1', '1', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8480', NULL, NULL, NULL, 'datetime', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('152', NULL, NULL, NULL, NULL, '修改人ID', 'ModifyID', 'int', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8470', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('153', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '90', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '50', NULL, NULL, '1', '0', NULL, '0', '1', '1', '30', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8460', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('154', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '140', NULL, TO_DATE('2018-07-10 13:57:15', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, '50', NULL, NULL, '1', '0', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8450', NULL, NULL, NULL, NULL, '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('155', NULL, NULL, NULL, NULL, '主键ID', 'Id', 'int', '90', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '4', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8440', NULL, NULL, NULL, NULL, '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('156', NULL, NULL, NULL, NULL, '分类', 'Variety', 'string', '80', NULL, TO_DATE('2018-07-10 15:02:46', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, 'pz', NULL, '1', 'select', NULL, '1', '1', NULL, '0', '0', '0', '40', '超级管理员', TO_DATE('2023-05-13 11:31:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8430', NULL, NULL, '1', 'select', '0', 'App_ReportPrice', '16');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('891', NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', '120', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, '1', 'like', '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('892', NULL, NULL, NULL, NULL, '耗时(秒)', 'ElapsedTime', 'int', '90', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, '1', 'range', '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('893', NULL, NULL, NULL, NULL, '开始时间', 'StratDate', 'DateTime', '150', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, '1', 'datetime', '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('894', NULL, NULL, NULL, NULL, '结束时间', 'EndDate', 'DateTime', '150', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('895', NULL, NULL, NULL, NULL, '是否成功', 'Result', 'int', '100', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'enable', NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, '1', 'select', '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('896', NULL, NULL, NULL, NULL, '返回内容', 'ResponseContent', 'string', '250', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('897', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('898', NULL, NULL, NULL, NULL, NULL, 'Creator', 'string', '130', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('899', NULL, NULL, NULL, NULL, NULL, 'CreateDate', 'DateTime', '110', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('900', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('901', NULL, NULL, NULL, NULL, NULL, 'Modifier', 'string', '130', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('902', NULL, NULL, NULL, NULL, NULL, 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('904', NULL, NULL, NULL, '12', 'post参数', 'PostData', 'string', '110', NULL, NULL, NULL, NULL, NULL, NULL, '8', 'textarea', NULL, '1', '0', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1060', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('905', NULL, NULL, NULL, NULL, '请求方式', 'Method', 'string', '110', NULL, NULL, NULL, NULL, '请求方式', NULL, '2', 'select', NULL, '1', '1', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1160', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('906', NULL, NULL, NULL, NULL, '超时时间(秒)', 'TimeOut', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1152', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('907', NULL, NULL, NULL, NULL, '异常信息', 'ErrorMsg', 'string', '150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '840', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('908', NULL, NULL, NULL, NULL, '下一个审批节点', 'NextStepIds', 'string', '220', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('909', NULL, NULL, NULL, NULL, '父级节点', 'ParentId', 'string', '120', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '2000', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('911', NULL, NULL, NULL, NULL, '审核未通过(返回上一节点,流程重新开始,流程结束)', 'AuditRefuse', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('912', NULL, NULL, NULL, NULL, '驳回(返回上一节点,流程重新开始,流程结束)', 'AuditBack', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('913', NULL, NULL, NULL, NULL, '审批方式(启用会签)', 'AuditMethod', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('914', NULL, NULL, NULL, NULL, '审核后发送邮件通知', 'SendMail', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('915', NULL, NULL, NULL, NULL, '审核条件', 'Filters', 'string', '220', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4000', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('918', NULL, NULL, NULL, NULL, '审核中数据是否可以编辑', 'AuditingEdit', 'int', '80', NULL, NULL, NULL, NULL, 'enable', NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1010', NULL, NULL, '1', 'select', '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('919', NULL, NULL, NULL, NULL, '节点属性(start、node、end))', 'StepAttrType', 'string', '110', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('920', NULL, NULL, NULL, NULL, '节点属性(start、node、end))', 'StepAttrType', 'string', '110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('921', NULL, NULL, NULL, NULL, '当前审核节点ID', 'CurrentStepId', 'string', '110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '960', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('922', NULL, NULL, NULL, NULL, NULL, 'ParentId', 'string', '120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '2000', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('924', NULL, NULL, NULL, NULL, NULL, 'NextStepId', 'string', '120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('925', NULL, NULL, NULL, NULL, NULL, 'Id', 'guid', '110', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('926', NULL, NULL, NULL, NULL, NULL, 'WorkFlowTable_Id', 'guid', '110', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('927', NULL, NULL, NULL, NULL, NULL, 'WorkFlowTableStep_Id', 'guid', '110', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('928', NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', '120', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('929', NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', '180', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('930', NULL, NULL, NULL, NULL, NULL, 'AuditId', 'int', '110', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('931', NULL, NULL, NULL, NULL, NULL, 'Auditor', 'string', '120', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('932', NULL, NULL, NULL, NULL, NULL, 'AuditStatus', 'int', '110', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('933', NULL, NULL, NULL, NULL, NULL, 'AuditResult', 'string', '220', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '1000', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('934', NULL, NULL, NULL, NULL, NULL, 'AuditDate', 'DateTime', '150', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('935', NULL, NULL, NULL, NULL, NULL, 'Remark', 'string', '220', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '1000', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('936', NULL, NULL, NULL, NULL, NULL, 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2023-04-26 11:52:20', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-04-26 11:54:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableAuditLog', '94');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('937', NULL, NULL, NULL, NULL, NULL, 'DepartmentId', 'guid', '110', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('938', NULL, NULL, NULL, NULL, '组织名称', 'DepartmentName', 'string', '180', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '200', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, '1', 'like', '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('939', NULL, NULL, NULL, NULL, '组织编号', 'DepartmentCode', 'string', '90', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, '1', NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('940', NULL, NULL, NULL, NULL, '上级组织', 'ParentId', 'guid', '110', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '组织机构', NULL, '3', 'cascader', NULL, '1', '0', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('941', NULL, NULL, NULL, NULL, '组织类型', 'DepartmentType', 'string', '110', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('942', NULL, NULL, NULL, NULL, '是否可用', 'Enable', 'int', '110', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('943', NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', '100', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '5', 'textarea', NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('944', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '100', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('945', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '90', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, '1', NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('946', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '145', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, '1', 'datetime', '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('947', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '100', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('948', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '90', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('949', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '140', NULL, TO_DATE('2023-05-08 02:05:31', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 09:51:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_Department', '95');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('950', NULL, NULL, NULL, NULL, NULL, 'Id', 'guid', '110', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('951', NULL, NULL, NULL, NULL, NULL, 'UserId', 'int', '110', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '0', NULL, NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('952', NULL, NULL, NULL, NULL, NULL, 'DepartmentId', 'guid', '110', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '0', NULL, NULL, '1', '1', NULL, '0', '0', '0', '16', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('953', NULL, NULL, NULL, NULL, NULL, 'Enable', 'int', '110', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '0', NULL, NULL, '1', '1', NULL, '0', '0', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('954', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '100', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('955', NULL, NULL, NULL, NULL, NULL, 'Creator', 'string', '100', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '255', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('956', NULL, NULL, NULL, NULL, NULL, 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('957', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '100', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('958', NULL, NULL, NULL, NULL, NULL, 'Modifier', 'string', '100', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '255', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('959', NULL, NULL, NULL, NULL, NULL, 'ModifyDate', 'DateTime', '150', NULL, TO_DATE('2023-05-08 02:07:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:08:37', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_UserDepartment', '96');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('960', NULL, NULL, NULL, '12', '组织构架', 'DeptIds', 'string', '140', NULL, NULL, NULL, NULL, '组织机构', NULL, '6', 'treeSelect', NULL, '1', '0', NULL, '0', '1', '0', '2000', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7800', NULL, NULL, NULL, 'cascader', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('961', NULL, NULL, NULL, NULL, '当前审核节点名称', 'StepName', 'string', '120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '955', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('962', NULL, NULL, NULL, NULL, '权重(相同条件权重大的优先匹配)', 'Weight', 'int', '100', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1011', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('963', NULL, NULL, NULL, NULL, '权重(相同条件权重大的优先匹配)', 'Weight', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('964', NULL, NULL, NULL, NULL, NULL, 'Weight', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('735', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '90', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2640', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('736', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2630', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('737', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '100', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '255', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2620', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('738', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2610', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('739', NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', '120', NULL, TO_DATE('2019-08-28 09:32:29', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '1', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2805', NULL, NULL, '2', 'datetime', NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('740', NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', NULL, NULL, TO_DATE('2019-08-28 09:32:29', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '1', '0', '100', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2803', NULL, NULL, '2', NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('741', NULL, NULL, NULL, NULL, '审核人Id', 'AuditId', 'int', NULL, NULL, TO_DATE('2019-08-28 09:32:29', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, '1', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2801', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('742', NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', NULL, NULL, TO_DATE('2019-08-28 09:32:29', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'audit', NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, '0', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2808', NULL, NULL, '2', 'select', NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('743', NULL, NULL, NULL, NULL, NULL, 'Id', 'string', '90', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '5', '1', NULL, NULL, '1', '0', NULL, '1', '0', '1', '36', '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2560', NULL, NULL, NULL, NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('744', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '120', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '1', '3', NULL, NULL, '1', '1', NULL, '0', '1', '1', NULL, '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2550', NULL, NULL, '1', 'datetime', NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('745', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2540', NULL, NULL, NULL, NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('746', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '2', '3', NULL, NULL, '1', '1', NULL, '0', '1', '1', '30', '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2530', NULL, NULL, '1', NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('747', NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', '180', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '0', '1', '250', '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '3490', NULL, NULL, NULL, NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('748', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '4', NULL, NULL, '1', '1', NULL, '0', '1', '1', '30', '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2510', NULL, NULL, NULL, NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('749', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '1', '4', NULL, NULL, '1', '1', NULL, '0', '1', '1', NULL, '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2500', NULL, NULL, NULL, NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('750', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2490', NULL, NULL, NULL, NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('751', NULL, NULL, NULL, NULL, '姓名', 'Name', 'string', '100', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '1', '50', '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '3500', NULL, NULL, '1', 'like', NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('752', NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', '130', NULL, TO_DATE('2019-09-18 15:46:43', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '0', '1', '15', '超级管理员', TO_DATE('2019-12-06 20:31:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '3470', NULL, NULL, '1', NULL, NULL, 'App_Appointment', '80');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('753', NULL, NULL, NULL, NULL, NULL, 'FormId', 'guid', '110', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('754', NULL, NULL, NULL, NULL, '表单名称', 'Title', 'string', '140', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '1', 'textarea', NULL, '1', '1', NULL, '0', '0', '0', '1000', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, '1', 'like', '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('755', NULL, NULL, NULL, NULL, '设计器配置', 'DaraggeOptions', 'string', '140', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('756', NULL, NULL, NULL, NULL, '表单参数', 'FormOptions', 'string', '140', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('757', NULL, NULL, NULL, NULL, '表单配置', 'FormConfig', 'string', '110', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('758', NULL, NULL, NULL, NULL, '表单字段', 'FormFields', 'string', '110', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('760', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '110', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, '1', 'datetime', '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('761', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('762', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '60', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '810', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('763', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '60', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('764', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, '1', 'datetime', '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('765', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2021-12-29 23:17:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('766', NULL, NULL, NULL, NULL, '表格配置', 'TableConfig', 'string', '110', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-29 23:40:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '880', NULL, NULL, NULL, NULL, '0', 'FormDesignOptions', '82');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('767', NULL, NULL, NULL, NULL, NULL, 'FormCollectionId', 'guid', '110', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('768', NULL, NULL, NULL, NULL, '表单ID', 'FormId', 'guid', '110', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('769', NULL, NULL, NULL, NULL, '标题', 'Title', 'string', '110', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, '1', 'like', '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('770', NULL, NULL, NULL, NULL, '表单数据', 'FormData', 'string', '110', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '0', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('771', NULL, NULL, NULL, NULL, '提交时间', 'CreateDate', 'DateTime', '145', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, '1', 'datetime', '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('772', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('773', NULL, NULL, NULL, NULL, '提交人', 'Creator', 'string', '100', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '60', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '810', NULL, NULL, '1', 'like', '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('774', NULL, NULL, NULL, NULL, NULL, 'Modifier', 'string', '130', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '60', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('775', NULL, NULL, NULL, NULL, NULL, 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('776', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2021-12-29 23:23:35', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2021-12-30 23:00:15', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'FormCollectionObject', '83');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('777', NULL, NULL, NULL, NULL, NULL, 'WorkFlow_Id', 'guid', '110', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('778', NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', '140', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '200', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, '1', NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('779', NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', '100', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '200', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, '1', NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('780', NULL, NULL, NULL, NULL, '功能菜单', 'WorkTableName', 'string', '120', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('781', NULL, NULL, NULL, NULL, '节点信息', 'NodeConfig', 'string', '110', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('782', NULL, NULL, NULL, NULL, '连接配置', 'LineConfig', 'string', '110', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '0', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('783', NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', '130', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('784', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '740', NULL, NULL, '1', 'datetime', '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('785', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('786', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '100', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('787', NULL, NULL, NULL, NULL, '是否启用', 'Enable', 'byte', '100', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'enable', NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1010', NULL, NULL, NULL, 'select', '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('788', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '100', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('789', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '160', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, 'datetime', '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('790', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2022-07-25 00:31:26', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 17:04:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '660', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlow', '85');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('809', NULL, NULL, NULL, NULL, NULL, 'WorkStepFlow_Id', 'guid', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('810', NULL, NULL, NULL, NULL, '流程主表id', 'WorkFlow_Id', 'guid', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('811', NULL, NULL, NULL, NULL, '流程节点Id', 'StepId', 'string', '120', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('812', NULL, NULL, NULL, NULL, '节点名称', 'StepName', 'string', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('813', NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批)', 'StepType', 'int', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('814', NULL, NULL, NULL, NULL, '审批用户id或角色id', 'StepValue', 'string', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('815', NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', '220', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('816', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('817', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('818', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('819', NULL, NULL, NULL, NULL, NULL, 'Enable', 'byte', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('820', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '130', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('821', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('822', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2022-07-31 22:43:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('823', NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:14', 'SYYYY-MM-DD HH24:MI:SS'), '1', '880', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowStep', '87');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('824', NULL, NULL, NULL, NULL, NULL, 'WorkFlowTable_Id', 'guid', '110', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1250', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('825', NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'guid', '110', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('826', NULL, NULL, NULL, NULL, '流程名称', 'WorkName', 'string', '130', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, '2', '1', 'like', '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('827', NULL, NULL, NULL, NULL, '表主键id', 'WorkTableKey', 'string', '180', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('828', NULL, NULL, NULL, NULL, '表名', 'WorkTable', 'string', '100', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('829', NULL, NULL, NULL, NULL, '业务名称', 'WorkTableName', 'string', '120', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, '3', '1', 'like', '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('830', NULL, NULL, NULL, NULL, '不用', 'CurrentOrderId', 'int', '90', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('831', NULL, NULL, NULL, NULL, '审批状态', 'AuditStatus', 'int', '110', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'audit', NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, '1', '1', 'select', '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('832', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, '4', '1', 'datetime', '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('833', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('834', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '100', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '860', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('835', NULL, NULL, NULL, NULL, NULL, 'Enable', 'byte', '110', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('836', NULL, NULL, NULL, NULL, NULL, 'Modifier', 'string', '130', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('837', NULL, NULL, NULL, NULL, NULL, 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('838', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2022-08-01 00:15:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 12:59:47', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTable', '88');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('839', NULL, NULL, NULL, NULL, NULL, 'Sys_WorkFlowTableStep_Id', 'guid', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1300', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('840', NULL, NULL, NULL, NULL, '主表id', 'WorkFlowTable_Id', 'guid', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', NULL, NULL, NULL, '1', '1', NULL, '0', '0', '0', '16', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1250', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('841', NULL, NULL, NULL, NULL, '流程id', 'WorkFlow_Id', 'guid', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('842', NULL, NULL, NULL, NULL, '节点id', 'StepId', 'string', '120', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '100', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('843', NULL, NULL, NULL, NULL, '节名称', 'StepName', 'string', '180', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('844', NULL, NULL, NULL, NULL, '审批类型', 'StepType', 'int', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('845', NULL, NULL, NULL, NULL, '节点类型(1=按用户审批,2=按角色审批)', 'StepValue', 'string', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('846', NULL, NULL, NULL, NULL, '审批顺序', 'OrderId', 'int', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('431', NULL, NULL, NULL, NULL, 'Token', 'Token', 'string', '180', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7810', NULL, NULL, '2', NULL, '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('446', NULL, NULL, NULL, '12', '测试', 'IsTop', 'int', '90', NULL, NULL, NULL, NULL, 'enable', NULL, '30', 'select', NULL, '1', '1', NULL, '0', '0', '0', NULL, '超级管理员', TO_DATE('2023-05-13 10:48:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8515', NULL, NULL, '2', 'select', '0', 'App_TransactionAvgPrice', '15');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('457', NULL, NULL, NULL, NULL, '是否可用', 'TransactionType', 'int', '120', NULL, NULL, NULL, NULL, 'enable', NULL, '20', 'select', NULL, '1', '1', NULL, '0', '0', '0', '8', '超级管理员', TO_DATE('2023-05-13 11:14:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '8021', NULL, NULL, '1', 'select', '0', 'App_Transaction', '19');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('506', NULL, NULL, NULL, NULL, '性别', 'Gender', 'int', '80', NULL, NULL, NULL, NULL, 'gender', NULL, '12', 'select', NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7843', NULL, NULL, '1', 'select', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('523', NULL, NULL, NULL, NULL, '电话', 'PhoneNo', 'string', '150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'phone', NULL, '1', '0', NULL, NULL, '1', '0', '11', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7900', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('550', NULL, NULL, NULL, NULL, '申请人帐号Id', 'User_Id', 'int', '90', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, NULL, '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7921', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('551', NULL, NULL, NULL, NULL, '帐号', 'UserName', 'string', '120', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, NULL, '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7920', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('552', NULL, NULL, NULL, NULL, '申请人', 'UserTrueName', 'string', '100', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', '0', NULL, NULL, '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7920', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('603', NULL, NULL, NULL, NULL, '资质证书', ' Certificate', 'string', '200', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', '0', '1', '0', '1', '0', '2500', '超级管理员', TO_DATE('2023-05-13 10:59:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7828', NULL, NULL, NULL, NULL, '0', 'App_Expert', '20');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('654', NULL, NULL, NULL, NULL, '类型', 'AppType', 'int', '150', NULL, NULL, NULL, NULL, 'ut', NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7809', NULL, NULL, '3', 'selectList', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('659', NULL, NULL, NULL, NULL, '手机用户', 'IsRegregisterPhone', 'int', '120', NULL, NULL, NULL, NULL, 'isphone', NULL, NULL, 'select', NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 10:20:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '7771', NULL, NULL, '3', 'select', '0', 'Sys_User', '6');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('663', NULL, NULL, NULL, NULL, '是否今日推荐', 'DailyRecommend', 'int', '120', NULL, NULL, NULL, NULL, 'dr', NULL, '5', 'select', NULL, '1', '1', NULL, NULL, '0', '0', '2', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6825', NULL, NULL, '1', 'select', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('664', NULL, NULL, NULL, NULL, '推荐排序', 'OrderNo', 'int', '120', NULL, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '1', NULL, NULL, '1', '0', '4', '超级管理员', TO_DATE('2020-01-06 11:21:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '6822', NULL, NULL, NULL, '无', NULL, 'App_News', '28');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('714', NULL, NULL, NULL, NULL, 'Id', 'Order_Id', 'string', '90', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '36', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2850', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('715', NULL, NULL, NULL, NULL, '订单类型', 'OrderType', 'int', '90', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'ordertype', '1', '1', 'select', NULL, '1', '1', NULL, '0', '0', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2840', NULL, '1', '1', 'select', NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('716', NULL, NULL, NULL, NULL, '运单号', 'TranNo', 'string', '150', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '1', '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '100', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2830', NULL, NULL, '1', NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('717', NULL, NULL, NULL, NULL, '销售订单号', 'SellNo', 'string', '200', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '2', '2', NULL, NULL, '1', '1', NULL, '0', '0', '0', '255', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2820', NULL, NULL, '1', NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('718', NULL, NULL, NULL, NULL, '销售数量', 'Qty', 'int', '90', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '2', '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2810', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('719', NULL, NULL, NULL, '8', '备注', 'Remark', 'string', '100', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '2', 'textarea', NULL, '1', '1', NULL, '0', '1', '0', '1000', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2800', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('720', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2790', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('721', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '100', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '3', '3', NULL, NULL, '1', '1', NULL, '0', '1', '1', '255', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2780', NULL, NULL, '3', NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('722', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '90', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '3', '3', NULL, NULL, '1', '1', NULL, '0', '1', '1', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2770', NULL, NULL, '3', 'datetime', NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('723', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2760', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('724', NULL, NULL, NULL, NULL, '修改人', 'Modifier', 'string', '100', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '4', NULL, NULL, NULL, '1', '0', NULL, '0', '1', '1', '255', '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2750', NULL, NULL, NULL, NULL, NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('725', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '90', NULL, TO_DATE('2019-08-22 17:26:55', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '4', '3', NULL, NULL, '1', '1', NULL, '0', '1', '1', NULL, '超级管理员', TO_DATE('2019-12-31 13:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2740', NULL, NULL, '3', 'datetime', NULL, 'SellOrder', '77');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('726', NULL, NULL, NULL, NULL, NULL, 'OrderList_Id', 'string', '90', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '0', '36', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2730', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('727', NULL, NULL, NULL, NULL, '订单Id', 'Order_Id', 'string', '90', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '0', '1', '36', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2720', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('728', NULL, NULL, NULL, NULL, '商品名称', 'ProductName', 'string', '150', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', 'pn', NULL, '1', 'select', NULL, '1', '1', NULL, '0', '0', '0', '200', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2710', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('729', NULL, NULL, NULL, NULL, '批次', 'MO', 'string', '100', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '255', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2700', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('730', NULL, NULL, NULL, NULL, '数量', 'Qty', 'int', '90', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '1', 'select', NULL, '1', '1', NULL, '0', '0', '0', NULL, '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2690', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('731', NULL, NULL, NULL, NULL, '重量', 'Weight', 'decimal', '90', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2680', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('732', NULL, NULL, NULL, NULL, '备注', 'Remark', 'string', '120', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '2', NULL, NULL, '1', '1', NULL, '0', '1', '0', '1000', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2670', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('733', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', NULL, '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2660', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('734', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2019-08-28 09:17:39', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '255', '超级管理员', TO_DATE('2019-09-19 14:54:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', '2650', NULL, NULL, NULL, NULL, NULL, 'SellOrderList', '78');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('847', NULL, NULL, NULL, NULL, NULL, 'Remark', 'string', '220', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '500', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('848', NULL, NULL, NULL, NULL, NULL, 'CreateDate', 'DateTime', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('849', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('850', NULL, NULL, NULL, NULL, NULL, 'Creator', 'string', '130', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('851', NULL, NULL, NULL, NULL, NULL, 'Enable', 'byte', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '1', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('852', NULL, NULL, NULL, NULL, NULL, 'Modifier', 'string', '130', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('853', NULL, NULL, NULL, NULL, NULL, 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('854', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2022-08-01 00:21:19', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('855', NULL, NULL, NULL, NULL, '审核人id', 'AuditId', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('856', NULL, NULL, NULL, NULL, '审核人', 'Auditor', 'string', '120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '50', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('857', NULL, NULL, NULL, NULL, '审核状态', 'AuditStatus', 'int', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('858', NULL, NULL, NULL, NULL, '审核时间', 'AuditDate', 'DateTime', '150', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2023-05-13 16:40:30', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', NULL, NULL, NULL, NULL, '0', 'Sys_WorkFlowTableStep', '89');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('859', NULL, NULL, NULL, NULL, NULL, 'Id', 'guid', '110', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1300', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('860', NULL, NULL, NULL, NULL, '任务名称', 'TaskName', 'string', '120', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '500', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1250', NULL, NULL, '1', 'like', '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('861', NULL, NULL, NULL, NULL, '任务分组', 'GroupName', 'string', '100', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '1', NULL, NULL, '1', '1', NULL, '0', '0', '0', '500', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('862', NULL, NULL, NULL, NULL, 'Corn表达式', 'CronExpression', 'string', '120', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, '0', '2', NULL, NULL, '1', '1', NULL, '0', '0', '0', '100', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('863', NULL, NULL, NULL, '12', 'Url地址', 'ApiUrl', 'string', '150', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '7', NULL, NULL, '1', '1', NULL, '0', '1', '0', '2000', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1100', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('864', NULL, NULL, NULL, NULL, 'AuthKey', 'AuthKey', 'string', '100', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '6', NULL, NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1050', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('865', NULL, NULL, NULL, NULL, 'AuthValue', 'AuthValue', 'string', '100', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '6', NULL, NULL, '1', '0', NULL, '0', '1', '0', '200', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1000', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('866', NULL, NULL, NULL, NULL, '描述', 'Describe', 'string', '120', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '5', NULL, NULL, '1', '1', NULL, '0', '1', '0', '2000', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '950', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('867', NULL, NULL, NULL, NULL, '最后执行执行', 'LastRunTime', 'DateTime', '150', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', 'textarea', NULL, '1', '1', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '900', NULL, NULL, '1', 'datetime', '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('868', NULL, NULL, NULL, NULL, '运行状态', 'Status', 'int', '90', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '1', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '850', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('869', NULL, NULL, NULL, NULL, NULL, 'CreateID', 'int', '80', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '800', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('870', NULL, NULL, NULL, NULL, '创建人', 'Creator', 'string', '130', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '10', NULL, NULL, '1', '0', NULL, '0', '1', '1', '30', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '750', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('871', NULL, NULL, NULL, NULL, '创建时间', 'CreateDate', 'DateTime', '150', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '10', NULL, NULL, '1', '0', NULL, '0', '1', '1', '8', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '700', NULL, NULL, '1', 'datetime', '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('872', NULL, NULL, NULL, NULL, NULL, 'ModifyID', 'int', '80', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '4', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '650', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('873', NULL, NULL, NULL, NULL, NULL, 'Modifier', 'string', '130', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '30', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '600', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('874', NULL, NULL, NULL, NULL, '修改时间', 'ModifyDate', 'DateTime', '110', NULL, TO_DATE('2022-09-05 03:09:08', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, '0', '1', '0', '8', '超级管理员', TO_DATE('2022-09-07 01:42:45', 'SYYYY-MM-DD HH24:MI:SS'), '1', '550', NULL, NULL, '1', 'datetime', '0', 'Sys_QuartzOptions', '91');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('889', NULL, NULL, NULL, NULL, NULL, 'LogId', 'guid', '110', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '1', '0', '1', '16', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1200', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');
INSERT INTO "C##NETCOREDEV"."SYS_TABLECOLUMN" VALUES ('890', NULL, NULL, NULL, NULL, '任务id', 'Id', 'guid', '110', NULL, TO_DATE('2022-09-05 03:14:51', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, NULL, '0', NULL, NULL, '1', '0', NULL, '0', '1', '0', '16', '超级管理员', TO_DATE('2022-09-05 23:49:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1150', NULL, NULL, NULL, NULL, '0', 'Sys_QuartzLog', '93');

-- ----------------------------
-- Table structure for SYS_TABLEINFO
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_TABLEINFO";
CREATE TABLE "C##NETCOREDEV"."SYS_TABLEINFO" (
  "TABLE_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "CNNAME" NVARCHAR2(50) VISIBLE,
  "COLUMNCNNAME" NVARCHAR2(100) VISIBLE,
  "DBSERVER" NCLOB VISIBLE,
  "DATATABLETYPE" NVARCHAR2(200) VISIBLE,
  "DETAILCNNAME" NVARCHAR2(200) VISIBLE,
  "DETAILNAME" NVARCHAR2(200) VISIBLE,
  "EDITORTYPE" NVARCHAR2(100) VISIBLE,
  "ENABLE" NUMBER(11,0) VISIBLE,
  "EXPRESSFIELD" NVARCHAR2(200) VISIBLE,
  "FOLDERNAME" NVARCHAR2(200) VISIBLE,
  "NAMESPACE" NVARCHAR2(200) VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "PARENTID" NUMBER(11,0) VISIBLE,
  "RICHTEXT" NVARCHAR2(100) VISIBLE,
  "SORTNAME" NVARCHAR2(50) VISIBLE,
  "TABLENAME" NVARCHAR2(50) VISIBLE,
  "TABLETRUENAME" NVARCHAR2(100) VISIBLE,
  "UPLOADFIELD" NVARCHAR2(100) VISIBLE,
  "UPLOADMAXCOUNT" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_TABLEINFO
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('2', '角色管理', '角色管理', NULL, NULL, NULL, NULL, NULL, '0', 'RoleName', 'System', 'VOL.System', NULL, '8', NULL, NULL, 'Sys_Role', 'Sys_Role', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('3', '字典数据', '字典数据', NULL, NULL, '字典明细', 'Sys_DictionaryList', NULL, '0', 'DicName', 'System', 'VOL.System', NULL, '11', NULL, NULL, 'Sys_Dictionary', 'Sys_Dictionary', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('4', '字典明细', '字典明细', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'System', 'VOL.System', NULL, '11', NULL, NULL, 'Sys_DictionaryList', 'Sys_DictionaryList', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('5', '系统日志', '系统日志', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'System', 'VOL.System', NULL, '10', NULL, NULL, 'Sys_Log', 'Sys_Log', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('6', NULL, '用户管理', NULL, NULL, NULL, NULL, NULL, '0', 'UserName', 'System', 'VOL.System', NULL, '8', NULL, NULL, 'Sys_User', 'Sys_User', 'HeadImageUrl', '1');
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('8', '用户基础信息', '用户管理', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'System', 'VOL.System', '200', '0', NULL, NULL, '无', '无', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('10', '日志管理', '日志管理', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'System', 'VOL.System', NULL, '0', NULL, '170', '日志管理', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('11', '配置管理', '配置管理', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'System', 'VOL.System', NULL, '0', NULL, '250', '配置管理', '配置管理', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('15', '成交均价', '自动绑定下拉框', NULL, NULL, NULL, NULL, NULL, '0', 'AvgPrice', 'App', 'VOL.AppManager', NULL, '79', NULL, NULL, 'App_TransactionAvgPrice', 'App_TransactionAvgPrice', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('16', NULL, '自定义实现一对多', NULL, NULL, NULL, NULL, NULL, '0', 'Price', 'App', 'VOL.AppManager', NULL, '79', NULL, NULL, 'App_ReportPrice', 'App_ReportPrice', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('19', NULL, '导入导出', NULL, NULL, NULL, NULL, NULL, '0', 'PhoneNo', 'App', 'VOL.AppManager', NULL, '79', NULL, NULL, 'App_Transaction', 'App_Transaction', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('20', NULL, '启用图片支持', NULL, NULL, NULL, NULL, NULL, '0', 'ExpertName', 'App', 'VOL.AppManager', NULL, '79', NULL, NULL, 'App_Expert', 'App_Expert', 'HeadImageUrl', '1');
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('27', ' 资讯', '静态页面发布', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'News', 'VOL.AppManager', NULL, '0', NULL, NULL, ' 资讯', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('28', NULL, '新闻列表', NULL, NULL, NULL, NULL, NULL, '0', 'Title', 'News', 'VOL.AppManager', NULL, '27', 'Content', 'CreateDate', 'App_News', 'App_News', 'ImageUrl', '3');
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('76', '订单管理', '测试完整示例', NULL, NULL, NULL, NULL, NULL, '0', NULL, '订单管理', 'VOL.Order', NULL, '0', NULL, NULL, '订单管理', '订单管理', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('77', '销售订单', '销售订单', NULL, NULL, '订单明细', 'SellOrderList', NULL, '0', 'TranNo', 'Sell', 'VOL.Order', NULL, '76', NULL, 'CreateDate', 'SellOrder', 'SellOrder', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('78', '订单明细', '订单明细', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'Order', 'VOL.Order', NULL, '76', NULL, 'CreateDate', 'SellOrderList', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('79', 'Table 单表数据', 'Table+单表数据', NULL, NULL, NULL, NULL, NULL, '0', NULL, 'Order', 'VOL.Order', NULL, '0', NULL, NULL, 'Table+单表数据', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('80', '基础表单查询', '基础表单+编辑只读', NULL, NULL, NULL, NULL, NULL, '0', 'Name', 'Appointment', 'VOL.Order', NULL, '79', NULL, 'CreateDate', 'App_Appointment', 'App_Appointment', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('81', '表单设计', '表单设计', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'form', 'VOL.System', NULL, '0', NULL, NULL, '0', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('82', '表单设计', '表单设计', NULL, NULL, NULL, NULL, NULL, '1', 'Title', 'form', 'VOL.System', NULL, '81', NULL, 'CreateDate', 'FormDesignOptions', 'FormDesignOptions', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('83', '数据采集', '数据采集', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'form', 'VOL.System', NULL, '81', NULL, 'CreateDate', 'FormCollectionObject', 'FormCollectionObject', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('84', '审批流程', '审批流程', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'flow', 'VOL.System', NULL, '0', NULL, NULL, '审批流程', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('85', '审批流程', '审批流程配置', NULL, NULL, '审批步骤', 'Sys_WorkFlowStep', NULL, '1', 'WorkName', 'flow', 'VOL.System', NULL, '84', NULL, 'CreateDate', 'Sys_WorkFlow', 'Sys_WorkFlow', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('87', '审批节点', '审批节点配置', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'flow', 'VOL.System', NULL, '84', NULL, 'CreateDate', 'Sys_WorkFlowStep', 'Sys_WorkFlowStep', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('88', '审批流程', '审批流程', NULL, NULL, '审批节点', 'Sys_WorkFlowTableStep', NULL, '1', NULL, 'flow', 'VOL.System', NULL, '84', NULL, 'CreateDate', 'Sys_WorkFlowTable', 'Sys_WorkFlowTable', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('89', '审批节点', '审批节点', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'flow', 'VOL.System', NULL, '84', NULL, 'CreateDate', 'Sys_WorkFlowTableStep', 'Sys_WorkFlowTableStep', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('90', '定时任务', '定时任务', NULL, NULL, NULL, NULL, NULL, '1', NULL, '定时任务', 'VOL.System', NULL, '0', NULL, NULL, '定时任务', NULL, NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('91', '定时任务', '定时任务', NULL, NULL, NULL, NULL, NULL, '1', 'TaskName', 'Quartz', 'VOL.System', NULL, '90', NULL, 'TaskName', 'Sys_QuartzOptions', 'Sys_QuartzOptions', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('93', '执行记录', '执行记录', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'Quartz', 'VOL.System', NULL, '90', NULL, 'StratDate', 'Sys_QuartzLog', 'Sys_QuartzLog', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('94', '审批记录', '审批记录', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'flow', 'VOL.System', NULL, '84', NULL, 'CreateDate', 'Sys_WorkFlowTableAuditLog', 'Sys_WorkFlowTableAuditLog', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('95', '组织架构', '组织架构', NULL, NULL, NULL, NULL, NULL, '1', 'DepartmentName', 'System', 'VOL.System', NULL, '8', NULL, 'CreateDate', 'Sys_Department', 'Sys_Department', NULL, NULL);
INSERT INTO "C##NETCOREDEV"."SYS_TABLEINFO" VALUES ('96', '用户部门', '用户所属组织', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'System', 'VOL.System', NULL, '8', NULL, 'CreateDate', 'Sys_UserDepartment', 'Sys_UserDepartment', NULL, NULL);

-- ----------------------------
-- Table structure for SYS_USER
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_USER";
CREATE TABLE "C##NETCOREDEV"."SYS_USER" (
  "USER_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "ROLE_ID" NUMBER(11,0) VISIBLE NOT NULL,
  "ROLENAME" NVARCHAR2(200) VISIBLE,
  "PHONENO" NVARCHAR2(11) VISIBLE,
  "REMARK" NVARCHAR2(200) VISIBLE,
  "TEL" NVARCHAR2(20) VISIBLE,
  "USERNAME" NVARCHAR2(100) VISIBLE NOT NULL,
  "USERPWD" NVARCHAR2(200) VISIBLE,
  "USERTRUENAME" NVARCHAR2(20) VISIBLE NOT NULL,
  "DEPTNAME" NVARCHAR2(150) VISIBLE,
  "DEPT_ID" NUMBER(11,0) VISIBLE,
  "EMAIL" NVARCHAR2(100) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE NOT NULL,
  "GENDER" NUMBER(11,0) VISIBLE,
  "HEADIMAGEURL" NCLOB VISIBLE,
  "ISREGREGISTERPHONE" NUMBER(11,0) VISIBLE,
  "LASTLOGINDATE" DATE VISIBLE,
  "LASTMODIFYPWDDATE" DATE VISIBLE,
  "ADDRESS" NVARCHAR2(200) VISIBLE,
  "APPTYPE" NUMBER(11,0) VISIBLE,
  "AUDITDATE" DATE VISIBLE,
  "AUDITSTATUS" NUMBER(11,0) VISIBLE,
  "AUDITOR" NVARCHAR2(200) VISIBLE,
  "ORDERNO" NUMBER(11,0) VISIBLE,
  "TOKEN" NCLOB VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATOR" NVARCHAR2(200) VISIBLE,
  "MOBILE" NVARCHAR2(100) VISIBLE,
  "MODIFIER" NVARCHAR2(200) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "DEPTIDS" NCLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO "C##NETCOREDEV"."SYS_USER" VALUES ('1', '1', '无', '13888888888', '~还没想好...', NULL, 'admin', 'j79rYYvCz4vdhcboB1Ausg==', '超级管理员', NULL, '0', '283591387@qq.com', '1', '1', 'Upload/Tables/Sys_User/202305131010574561/wechat.jpg', '0', TO_DATE('2017-08-28 09:58:55', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-12-14 15:14:23', 'SYYYY-MM-DD HH24:MI:SS'), '北京市西城区', '1', TO_DATE('2019-08-18 00:54:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', '0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTY4NDY1MzM2MiIsIm5iZiI6IjE2ODQ2NTMzNjIiLCJleHAiOiIxNjg0NjYwNTYyIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.QLbKvw5H7vaBx5BHJa_LXprCrcXEgXMP5o_VFoZyXe0', NULL, TO_DATE('2012-06-10 11:10:03', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL, '超级管理员', TO_DATE('2023-05-13 10:10:58', 'SYYYY-MM-DD HH24:MI:SS'), '1', NULL);
INSERT INTO "C##NETCOREDEV"."SYS_USER" VALUES ('3362', '2', '无', NULL, '。。', NULL, 'admin666', 'j79rYYvCz4vdhcboB1Ausg==', 'Admin测试', NULL, NULL, NULL, '1', '0', 'Upload/Tables/Sys_User/202305131011047216/wechat.jpg', '1', NULL, TO_DATE('2019-09-22 23:03:34', 'SYYYY-MM-DD HH24:MI:SS'), '北京市还没注册', '1', TO_DATE('2019-08-18 00:54:06', 'SYYYY-MM-DD HH24:MI:SS'), '1', '超级管理员', NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTY4Mzk2OTQ4NCIsIm5iZiI6IjE2ODM5Njk0ODQiLCJleHAiOiIxNjgzOTc2Njg0IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.AusSAJoTD3Bk90PFCmhNj7Mrlv06IA3XM2mubfwBJu0', NULL, TO_DATE('2019-08-13 14:24:27', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '01012345678', '超级管理员', TO_DATE('2023-05-13 17:09:41', 'SYYYY-MM-DD HH24:MI:SS'), '1', 'e5d8e8af-3659-454c-aa8e-c201c7edbcfb,ec238385-f907-44de-b99b-0eddcffa6750');

-- ----------------------------
-- Table structure for SYS_USERDEPARTMENT
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT";
CREATE TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" (
  "ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "USERID" NUMBER(11,0) VISIBLE NOT NULL,
  "DEPARTMENTID" NVARCHAR2(36) VISIBLE NOT NULL,
  "ENABLE" NUMBER(11,0) VISIBLE NOT NULL,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(255) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "MODIFIER" NVARCHAR2(255) VISIBLE,
  "MODIFYDATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_USERDEPARTMENT
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_WORKFLOW
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_WORKFLOW";
CREATE TABLE "C##NETCOREDEV"."SYS_WORKFLOW" (
  "WORKFLOW_ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "WORKNAME" NVARCHAR2(200) VISIBLE NOT NULL,
  "WORKTABLE" NVARCHAR2(200) VISIBLE NOT NULL,
  "WORKTABLENAME" NVARCHAR2(200) VISIBLE,
  "NODECONFIG" NCLOB VISIBLE,
  "LINECONFIG" NCLOB VISIBLE,
  "REMARK" NCLOB VISIBLE,
  "WEIGHT" NUMBER(11,0) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "AUDITINGEDIT" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."WORKNAME" IS '流程名称';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."WORKTABLE" IS '表名';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."WORKTABLENAME" IS '功能菜单';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."NODECONFIG" IS '节点信息';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."LINECONFIG" IS '连接配置';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."REMARK" IS '备注';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOW"."WEIGHT" IS '权重';

-- ----------------------------
-- Records of SYS_WORKFLOW
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_WORKFLOWSTEP
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_WORKFLOWSTEP";
CREATE TABLE "C##NETCOREDEV"."SYS_WORKFLOWSTEP" (
  "WORKSTEPFLOW_ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "WORKFLOW_ID" NVARCHAR2(36) VISIBLE,
  "STEPID" NVARCHAR2(100) VISIBLE,
  "STEPNAME" NVARCHAR2(200) VISIBLE,
  "STEPTYPE" NUMBER(11,0) VISIBLE,
  "STEPVALUE" NCLOB VISIBLE,
  "ORDERID" NUMBER(11,0) VISIBLE,
  "REMARK" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "NEXTSTEPIDS" NCLOB VISIBLE,
  "PARENTID" NCLOB VISIBLE,
  "AUDITREFUSE" NUMBER(11,0) VISIBLE,
  "AUDITBACK" NUMBER(11,0) VISIBLE,
  "AUDITMETHOD" NUMBER(11,0) VISIBLE,
  "SENDMAIL" NUMBER(11,0) VISIBLE,
  "FILTERS" NCLOB VISIBLE,
  "STEPATTRTYPE" NVARCHAR2(50) VISIBLE,
  "WEIGHT" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWSTEP"."WORKFLOW_ID" IS '流程主表id';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWSTEP"."STEPID" IS '流程节点Id';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWSTEP"."STEPNAME" IS '节点名称';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWSTEP"."STEPTYPE" IS '节点类型(1=按用户审批,2=按角色审批)';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWSTEP"."STEPVALUE" IS '审批用户id或角色id';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWSTEP"."REMARK" IS '备注';

-- ----------------------------
-- Records of SYS_WORKFLOWSTEP
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_WORKFLOWTABLE
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLE";
CREATE TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLE" (
  "WORKFLOWTABLE_ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "WORKFLOW_ID" NVARCHAR2(36) VISIBLE,
  "WORKNAME" NVARCHAR2(200) VISIBLE,
  "WORKTABLEKEY" NVARCHAR2(200) VISIBLE,
  "WORKTABLE" NVARCHAR2(200) VISIBLE,
  "WORKTABLENAME" NVARCHAR2(200) VISIBLE,
  "CURRENTORDERID" NUMBER(11,0) VISIBLE,
  "AUDITSTATUS" NUMBER(11,0) VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "CURRENTSTEPID" NVARCHAR2(100) VISIBLE,
  "STEPNAME" NCLOB VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWTABLE"."WORKTABLEKEY" IS '表主键id';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWTABLE"."WORKTABLE" IS '表名';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWTABLE"."WORKTABLENAME" IS '表中文名';

-- ----------------------------
-- Records of SYS_WORKFLOWTABLE
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_WORKFLOWTABLEAUDITLOG
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLEAUDITLOG";
CREATE TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLEAUDITLOG" (
  "ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "WORKFLOWTABLE_ID" NVARCHAR2(36) VISIBLE,
  "WORKFLOWTABLESTEP_ID" NVARCHAR2(36) VISIBLE,
  "STEPID" NVARCHAR2(100) VISIBLE,
  "STEPNAME" NVARCHAR2(200) VISIBLE,
  "AUDITID" NUMBER(11,0) VISIBLE,
  "AUDITOR" NVARCHAR2(100) VISIBLE,
  "AUDITSTATUS" NUMBER(11,0) VISIBLE,
  "AUDITRESULT" NCLOB VISIBLE,
  "AUDITDATE" DATE VISIBLE,
  "REMARK" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SYS_WORKFLOWTABLEAUDITLOG
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_WORKFLOWTABLESTEP
-- ----------------------------
--DROP TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP";
CREATE TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP" (
  "SYS_WORKFLOWTABLESTEP_ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "WORKFLOWTABLE_ID" NVARCHAR2(36) VISIBLE NOT NULL,
  "WORKFLOW_ID" NVARCHAR2(36) VISIBLE,
  "STEPID" NVARCHAR2(100) VISIBLE,
  "STEPNAME" NVARCHAR2(200) VISIBLE,
  "STEPTYPE" NUMBER(11,0) VISIBLE,
  "STEPVALUE" NCLOB VISIBLE,
  "ORDERID" NUMBER(11,0) VISIBLE,
  "AUDITID" NUMBER(11,0) VISIBLE,
  "AUDITOR" NVARCHAR2(50) VISIBLE,
  "AUDITSTATUS" NUMBER(11,0) VISIBLE,
  "AUDITDATE" DATE VISIBLE,
  "REMARK" NCLOB VISIBLE,
  "CREATEDATE" DATE VISIBLE,
  "CREATEID" NUMBER(11,0) VISIBLE,
  "CREATOR" NVARCHAR2(30) VISIBLE,
  "ENABLE" NUMBER(4,0) VISIBLE,
  "MODIFIER" NVARCHAR2(30) VISIBLE,
  "MODIFYDATE" DATE VISIBLE,
  "MODIFYID" NUMBER(11,0) VISIBLE,
  "STEPATTRTYPE" NVARCHAR2(50) VISIBLE,
  "PARENTID" NCLOB VISIBLE,
  "NEXTSTEPID" NVARCHAR2(100) VISIBLE,
  "WEIGHT" NUMBER(11,0) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP"."AUDITID" IS '审核人id';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP"."AUDITOR" IS '审核人';
COMMENT ON COLUMN "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP"."AUDITSTATUS" IS '审核状态';

-- ----------------------------
-- Records of SYS_WORKFLOWTABLESTEP
-- ----------------------------

-- ----------------------------
-- Sequence structure for T_SYS_DICTIONARYLIST_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_DICTIONARYLIST_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_DICTIONARYLIST_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for T_SYS_DICTIONARY_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_DICTIONARY_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_DICTIONARY_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for T_SYS_LANGUAGE1_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_LANGUAGE1_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_LANGUAGE1_SEQ" MINVALUE 2000 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for T_SYS_LANGUAGE_SEQ 
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_LANGUAGE_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_LANGUAGE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_LOG_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_LOG_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

--DROP TRIGGER "C##NETCOREDEV"."T_SYS_LOG_TRIGGER"
CREATE TRIGGER "C##NETCOREDEV"."T_SYS_LOG_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_LOG" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.ID is null) 
begin
 select T_SYS_LOG_SEQ.nextval into:new.ID from dual;
 end;


-- ----------------------------
-- Sequence structure for T_SYS_MENU_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_MENU_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_MENU_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

CREATE TRIGGER "C##NETCOREDEV"."T_SYS_MENU_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_MENU" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.MENU_ID is null) 
begin
 select T_SYS_MENU_SEQ.nextval into:new.MENU_ID from dual;
 end;
-- ----------------------------
-- Sequence structure for T_SYS_TABLECOLUMN1_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_TABLECOLUMN1_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_TABLECOLUMN1_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for T_SYS_TABLEINFO1_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_TABLEINFO1_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_TABLEINFO1_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for T_SYS_TABLEINFO_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_TABLEINFO_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_TABLEINFO_SEQ" MINVALUE 9000 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Sequence structure for T_SYS_USER_SEQ
-- ----------------------------
--DROP SEQUENCE "C##NETCOREDEV"."T_SYS_USER_SEQ";
CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_USER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;

-- ----------------------------
-- Primary Key structure for table FORMCOLLECTIONOBJECT
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."FORMCOLLECTIONOBJECT" ADD CONSTRAINT "SYS_C0010683" PRIMARY KEY ("FORMCOLLECTIONID");

-- ----------------------------
-- Checks structure for table FORMCOLLECTIONOBJECT
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."FORMCOLLECTIONOBJECT" ADD CONSTRAINT "SYS_C0010622" CHECK ("FORMCOLLECTIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."FORMCOLLECTIONOBJECT" ADD CONSTRAINT "SYS_C0011166" CHECK ("FORMCOLLECTIONID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table FORMDESIGNOPTIONS
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS" ADD CONSTRAINT "SYS_C0010685" PRIMARY KEY ("FORMID");

-- ----------------------------
-- Checks structure for table FORMDESIGNOPTIONS
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS" ADD CONSTRAINT "SYS_C0010623" CHECK ("FORMID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS" ADD CONSTRAINT "SYS_C0010624" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS" ADD CONSTRAINT "SYS_C0011167" CHECK ("FORMID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."FORMDESIGNOPTIONS" ADD CONSTRAINT "SYS_C0011168" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_CITY
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_CITY" ADD CONSTRAINT "SYS_C0010687" PRIMARY KEY ("CITYID");

-- ----------------------------
-- Checks structure for table SYS_CITY
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_CITY" ADD CONSTRAINT "SYS_C0010625" CHECK ("CITYID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_CITY" ADD CONSTRAINT "SYS_C0011169" CHECK ("CITYID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_DEPARTMENT
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_DEPARTMENT" ADD CONSTRAINT "SYS_C0010686" PRIMARY KEY ("DEPARTMENTID");

-- ----------------------------
-- Checks structure for table SYS_DEPARTMENT
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_DEPARTMENT" ADD CONSTRAINT "SYS_C0010626" CHECK ("DEPARTMENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DEPARTMENT" ADD CONSTRAINT "SYS_C0010627" CHECK ("DEPARTMENTNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DEPARTMENT" ADD CONSTRAINT "SYS_C0011170" CHECK ("DEPARTMENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DEPARTMENT" ADD CONSTRAINT "SYS_C0011171" CHECK ("DEPARTMENTNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0010691" PRIMARY KEY ("DIC_ID");

-- ----------------------------
-- Checks structure for table SYS_DICTIONARY
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0010640" CHECK ("DIC_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0010641" CHECK ("DICNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0010642" CHECK ("DICNO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0010643" CHECK ("ENABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0010644" CHECK ("PARENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0011172" CHECK ("DIC_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0011173" CHECK ("DICNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0011174" CHECK ("DICNO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0011175" CHECK ("ENABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C0011176" CHECK ("PARENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARY" ADD CONSTRAINT "SYS_C007556" CHECK ("DIC_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table SYS_DICTIONARY
-- ----------------------------
CREATE TRIGGER "C##NETCOREDEV"."T_SYS_DICTIONARY_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_DICTIONARY" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.DIC_ID is null) 
begin
 select t_SYS_DICTIONARY_seq.nextval into:new.DIC_ID from dual;
 end;
/

-- ----------------------------
-- Primary Key structure for table SYS_DICTIONARYLIST
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARYLIST" ADD CONSTRAINT "SYS_C0010690" PRIMARY KEY ("DICLIST_ID");

-- ----------------------------
-- Checks structure for table SYS_DICTIONARYLIST
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARYLIST" ADD CONSTRAINT "SYS_C0010638" CHECK ("DICLIST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_DICTIONARYLIST" ADD CONSTRAINT "SYS_C0011177" CHECK ("DICLIST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_LOG
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_LOG" ADD CONSTRAINT "SYS_C0010693" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table SYS_LOG
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_LOG" ADD CONSTRAINT "SYS_C0010639" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_LOG" ADD CONSTRAINT "SYS_C0011178" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_MENU
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0010694" PRIMARY KEY ("MENU_ID");

-- ----------------------------
-- Checks structure for table SYS_MENU
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0010645" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0010646" CHECK ("MENUNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0010647" CHECK ("PARENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0011179" CHECK ("MENU_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0011180" CHECK ("MENUNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_MENU" ADD CONSTRAINT "SYS_C0011181" CHECK ("PARENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_PROVINCE
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0010692" PRIMARY KEY ("PROVINCEID");

-- ----------------------------
-- Checks structure for table SYS_PROVINCE
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0010648" CHECK ("PROVINCEID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0010649" CHECK ("PROVINCECODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0010650" CHECK ("PROVINCENAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0011182" CHECK ("PROVINCEID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0011183" CHECK ("PROVINCECODE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_PROVINCE" ADD CONSTRAINT "SYS_C0011184" CHECK ("PROVINCENAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_QUARTZLOG
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZLOG" ADD CONSTRAINT "SYS_C0010697" PRIMARY KEY ("LOGID");

-- ----------------------------
-- Checks structure for table SYS_QUARTZLOG
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZLOG" ADD CONSTRAINT "SYS_C0010657" CHECK ("LOGID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZLOG" ADD CONSTRAINT "SYS_C0011185" CHECK ("LOGID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_QUARTZOPTIONS
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0010696" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table SYS_QUARTZOPTIONS
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0010653" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0010654" CHECK ("TASKNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0010655" CHECK ("GROUPNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0010656" CHECK ("CRONEXPRESSION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0011186" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0011187" CHECK ("TASKNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0011188" CHECK ("GROUPNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_QUARTZOPTIONS" ADD CONSTRAINT "SYS_C0011189" CHECK ("CRONEXPRESSION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_ROLE
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_ROLE" ADD CONSTRAINT "SYS_C0010698" PRIMARY KEY ("ROLE_ID");

-- ----------------------------
-- Checks structure for table SYS_ROLE
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_ROLE" ADD CONSTRAINT "SYS_C0010658" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_ROLE" ADD CONSTRAINT "SYS_C0010659" CHECK ("PARENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011190" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_ROLE" ADD CONSTRAINT "SYS_C0011191" CHECK ("PARENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_ROLEAUTH
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_ROLEAUTH" ADD CONSTRAINT "SYS_C0010695" PRIMARY KEY ("AUTH_ID");


-- ----------------------------
-- Checks structure for table SYS_ROLEAUTH
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_ROLEAUTH" ADD CONSTRAINT "SYS_C0010651" CHECK ("AUTH_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_ROLEAUTH" ADD CONSTRAINT "SYS_C0011192" CHECK ("AUTH_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_TABLECOLUMN
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_TABLECOLUMN" ADD CONSTRAINT "SYS_C0010701" PRIMARY KEY ("COLUMNID");

-- ----------------------------
-- Checks structure for table SYS_TABLECOLUMN
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_TABLECOLUMN" ADD CONSTRAINT "SYS_C0010652" CHECK ("COLUMNID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_TABLECOLUMN" ADD CONSTRAINT "SYS_C0011193" CHECK ("COLUMNID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_TABLECOLUMN" ADD CONSTRAINT "SYS_C007563" CHECK ("COLUMNID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table SYS_TABLECOLUMN
-- ----------------------------
CREATE TRIGGER "C##NETCOREDEV"."T_SYS_TABLECOLUMN1_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_TABLECOLUMN" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.COLUMNID is null) 
begin
 select t_SYS_TABLECOLUMN1_seq.nextval into:new.COLUMNID from dual;
 end;
/

-- ----------------------------
-- Primary Key structure for table SYS_TABLEINFO
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_TABLEINFO" ADD CONSTRAINT "SYS_C0010700" PRIMARY KEY ("TABLE_ID");

-- ----------------------------
-- Checks structure for table SYS_TABLEINFO
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_TABLEINFO" ADD CONSTRAINT "SYS_C0010660" CHECK ("TABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_TABLEINFO" ADD CONSTRAINT "SYS_C0011194" CHECK ("TABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_TABLEINFO" ADD CONSTRAINT "SYS_C007564" CHECK ("TABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table SYS_TABLEINFO
-- ----------------------------
CREATE TRIGGER "C##NETCOREDEV"."T_SYS_TABLEINFO1_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_TABLEINFO" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.TABLE_ID is null) 
begin
 select t_SYS_TABLEINFO1_seq.nextval into:new.TABLE_ID from dual;
 end;
/
CREATE TRIGGER "C##NETCOREDEV"."T_SYS_TABLEINFO_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_TABLEINFO" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.TABLE_ID is null) 
begin
 select t_SYS_TABLEINFO_seq.nextval into:new.TABLE_ID from dual;
 end;
/

-- ----------------------------
-- Primary Key structure for table SYS_USER
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0010705" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Checks structure for table SYS_USER
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0010670" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0010671" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0010672" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0010673" CHECK ("USERTRUENAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0010674" CHECK ("ENABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0011195" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0011196" CHECK ("ROLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0011197" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0011198" CHECK ("USERTRUENAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C0011199" CHECK ("ENABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USER" ADD CONSTRAINT "SYS_C007047" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_USERDEPARTMENT
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0010699" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table SYS_USERDEPARTMENT
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0010661" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0010662" CHECK ("USERID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0010663" CHECK ("DEPARTMENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0010664" CHECK ("ENABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0011200" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0011201" CHECK ("USERID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0011202" CHECK ("DEPARTMENTID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_USERDEPARTMENT" ADD CONSTRAINT "SYS_C0011203" CHECK ("ENABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_WORKFLOW
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0010702" PRIMARY KEY ("WORKFLOW_ID");

-- ----------------------------
-- Checks structure for table SYS_WORKFLOW
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0010665" CHECK ("WORKFLOW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0010666" CHECK ("WORKNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0010667" CHECK ("WORKTABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0011204" CHECK ("WORKFLOW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0011205" CHECK ("WORKNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOW" ADD CONSTRAINT "SYS_C0011206" CHECK ("WORKTABLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_WORKFLOWSTEP
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWSTEP" ADD CONSTRAINT "SYS_C0010703" PRIMARY KEY ("WORKSTEPFLOW_ID");

-- ----------------------------
-- Checks structure for table SYS_WORKFLOWSTEP
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWSTEP" ADD CONSTRAINT "SYS_C0010668" CHECK ("WORKSTEPFLOW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWSTEP" ADD CONSTRAINT "SYS_C0011207" CHECK ("WORKSTEPFLOW_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_WORKFLOWTABLE
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLE" ADD CONSTRAINT "SYS_C0010704" PRIMARY KEY ("WORKFLOWTABLE_ID");

-- ----------------------------
-- Checks structure for table SYS_WORKFLOWTABLE
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLE" ADD CONSTRAINT "SYS_C0010669" CHECK ("WORKFLOWTABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLE" ADD CONSTRAINT "SYS_C0011208" CHECK ("WORKFLOWTABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_WORKFLOWTABLEAUDITLOG
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLEAUDITLOG" ADD CONSTRAINT "SYS_C0010706" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table SYS_WORKFLOWTABLEAUDITLOG
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLEAUDITLOG" ADD CONSTRAINT "SYS_C0010675" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLEAUDITLOG" ADD CONSTRAINT "SYS_C0011209" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table SYS_WORKFLOWTABLESTEP
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP" ADD CONSTRAINT "SYS_C0010707" PRIMARY KEY ("SYS_WORKFLOWTABLESTEP_ID");

-- ----------------------------
-- Checks structure for table SYS_WORKFLOWTABLESTEP
-- ----------------------------
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP" ADD CONSTRAINT "SYS_C0010676" CHECK ("SYS_WORKFLOWTABLESTEP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP" ADD CONSTRAINT "SYS_C0010677" CHECK ("WORKFLOWTABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP" ADD CONSTRAINT "SYS_C0011210" CHECK ("SYS_WORKFLOWTABLESTEP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##NETCOREDEV"."SYS_WORKFLOWTABLESTEP" ADD CONSTRAINT "SYS_C0011211" CHECK ("WORKFLOWTABLE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;




CREATE SEQUENCE "C##NETCOREDEV"."T_SYS_ROLEAUTH_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 NOCACHE;


CREATE TRIGGER "C##NETCOREDEV"."T_SYS_ROLEAUTH_TRIGGER" BEFORE INSERT ON "C##NETCOREDEV"."SYS_ROLEAUTH" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW WHEN (new.AUTH_ID is null) 
begin
 select T_SYS_ROLEAUTH_SEQ.nextval into:new.AUTH_ID from dual;
 end;

