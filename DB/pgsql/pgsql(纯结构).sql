CREATE TABLE "app_appointment" (
  "Id" varchar(36) NOT NULL,
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "Describe" varchar(250) NOT NULL,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "Name" varchar(50) NOT NULL,
  "PhoneNo" varchar(15) NOT NULL,
  CONSTRAINT "_copy_18" PRIMARY KEY ("Id")
);

CREATE TABLE "app_news" (
  "Id" int4 NOT NULL,
  "Author" varchar(50),
  "BigImageUrls" varchar(500),
  "Content" text,
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "DailyRecommend" int2 NOT NULL,
  "DetailUrl" varchar(200),
  "Enable" int2,
  "ImageUrl" varchar(500),
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "NewsType" int4 NOT NULL,
  "OrderNo" int4,
  "ReleaseDate" timestamp,
  "Title" varchar(50) NOT NULL,
  "ViewCount" int4,
  CONSTRAINT "_copy_17" PRIMARY KEY ("Id")
);

CREATE TABLE "app_reportprice" (
  "Id" int4 NOT NULL,
  "Age" varchar(50) NOT NULL,
  "AuditDate" timestamp,
  "AuditId" int4,
  "AuditStatus" int4,
  "Auditor" varchar(20),
  "City" varchar(15) NOT NULL,
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "Enable" int2,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "Price" numeric(10) NOT NULL,
  "Variety" varchar(20) NOT NULL,
  CONSTRAINT "_copy_16" PRIMARY KEY ("Id")
);

CREATE TABLE "app_transaction" (
  "Id" int4 NOT NULL,
  "CowType" varchar(100),
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "Describe" varchar(500) NOT NULL,
  "Enable" int2,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "Name" varchar(50) NOT NULL,
  "PhoneNo" varchar(15) NOT NULL,
  "Quantity" int4 NOT NULL,
  "TransactionType" int4 NOT NULL,
  CONSTRAINT "_copy_15" PRIMARY KEY ("Id")
);

CREATE TABLE "app_transactionavgprice" (
  "Id" int4 NOT NULL,
  "AgeRange" varchar(50) NOT NULL,
  "AvgPrice" numeric(10,2) NOT NULL,
  "City" varchar(15) NOT NULL,
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "Date" date NOT NULL,
  "Enable" int2,
  "IsTop" int4 NOT NULL,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "Variety" varchar(20) NOT NULL,
  CONSTRAINT "_copy_14" PRIMARY KEY ("Id")
);

CREATE TABLE "news_article" (
  "Id" char(36) NOT NULL,
  "CreateID" int4,
  "Creator" varchar(30),
  "CreateDate" timestamp,
  "ModifyID" int4,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "Author" varchar(50),
  "Content" text,
  "Title" varchar(50) NOT NULL,
  CONSTRAINT "_copy_13" PRIMARY KEY ("Id")
);

CREATE TABLE "sellorder" (
  "Order_Id" char(36) NOT NULL,
  "OrderType" int4 NOT NULL,
  "TranNo" varchar(100) NOT NULL,
  "SellNo" varchar(255) NOT NULL,
  "Qty" int4 NOT NULL,
  "AuditDate" timestamp,
  "AuditStatus" int4 NOT NULL,
  "AuditId" int4,
  "Auditor" varchar(100),
  "Remark" varchar(1000),
  "CreateID" int4,
  "Creator" varchar(255),
  "CreateDate" timestamp,
  "ModifyID" int4,
  "Modifier" varchar(255),
  "ModifyDate" timestamp,
  CONSTRAINT "_copy_12" PRIMARY KEY ("Order_Id")
);

CREATE TABLE "sellorderlist" (
  "OrderList_Id" char(36) NOT NULL,
  "Order_Id" varchar(36) NOT NULL,
  "ProductName" varchar(200) NOT NULL,
  "MO" varchar(255) NOT NULL,
  "Qty" int4 NOT NULL,
  "Weight" numeric(11,2),
  "Remark" varchar(1000),
  "CreateID" int4,
  "Creator" varchar(255),
  "CreateDate" timestamp,
  "ModifyID" int4,
  "Modifier" varchar(255),
  "ModifyDate" timestamp,
  CONSTRAINT "_copy_11" PRIMARY KEY ("OrderList_Id")
);

CREATE TABLE "sys_city" (
  "CityId" int4 NOT NULL,
  "CityCode" varchar(20),
  "CityName" varchar(30),
  "ProvinceCode" varchar(20)
);

CREATE TABLE "Sys_Dictionary" (
  "Dic_ID" int4 NOT NULL,
  "Config" varchar(4000),
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "DBServer" varchar(4000),
  "DbSql" varchar(4000),
  "DicName" varchar(100) NOT NULL,
  "DicNo" varchar(100) NOT NULL,
  "Enable" int2 NOT NULL,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "OrderNo" int4,
  "ParentId" int4 NOT NULL,
  "Remark" varchar(2000),
  PRIMARY KEY ("Dic_ID")
);

CREATE TABLE "Sys_DictionaryList" (
  "DicList_ID" int4 NOT NULL,
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(30),
  "DicName" varchar(100),
  "DicValue" varchar(100),
  "Dic_ID" int4,
  "Enable" int2,
  "Modifier" varchar(30),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "OrderNo" int4,
  "Remark" varchar(2000),
  CONSTRAINT "_copy_19" PRIMARY KEY ("DicList_ID")
);

CREATE TABLE "sys_log" (
  "Id" int4 NOT NULL,
  "BeginDate" timestamp,
  "BrowserType" varchar(200),
  "ElapsedTime" int4,
  "EndDate" timestamp,
  "ExceptionInfo" text,
  "LogType" varchar(50),
  "RequestParameter" text,
  "ResponseParameter" text,
  "Role_Id" int4,
  "ServiceIP" varchar(100),
  "Success" int4,
  "Url" varchar(4000),
  "UserIP" varchar(100),
  "UserName" varchar(4000),
  "User_Id" int4,
  CONSTRAINT "_copy_10" PRIMARY KEY ("Id")
);

CREATE TABLE "sys_menu" (
  "Menu_Id" int4 NOT NULL,
  "MenuName" varchar(50) NOT NULL,
  "Auth" varchar(4000),
  "Icon" varchar(50),
  "Description" varchar(200),
  "Enable" int2,
  "OrderNo" int4,
  "TableName" varchar(200),
  "ParentId" int4 NOT NULL,
  "Url" varchar(4000),
  "CreateDate" timestamp,
  "Creator" varchar(50),
  "ModifyDate" timestamp,
  "Modifier" varchar(50),
  CONSTRAINT "_copy_9" PRIMARY KEY ("Menu_Id")
);

CREATE TABLE "sys_menu_copy1" (
  "Menu_Id" int4 NOT NULL,
  "MenuName" varchar(50) NOT NULL,
  "Auth" varchar(4000),
  "Icon" varchar(50),
  "Description" varchar(200),
  "Enable" int2,
  "OrderNo" int4,
  "TableName" varchar(200),
  "ParentId" int4 NOT NULL,
  "Url" varchar(4000),
  "CreateDate" timestamp,
  "Creator" varchar(50),
  "ModifyDate" timestamp,
  "Modifier" varchar(50),
  CONSTRAINT "_copy_8" PRIMARY KEY ("Menu_Id")
);

CREATE TABLE "sys_province" (
  "ProvinceId" int4 NOT NULL,
  "ProvinceCode" varchar(20) NOT NULL,
  "ProvinceName" varchar(30) NOT NULL,
  "RegionCode" varchar(20),
  CONSTRAINT "_copy_7" PRIMARY KEY ("ProvinceId")
);

CREATE TABLE "sys_role" (
  "Role_Id" int4 NOT NULL,
  "CreateDate" timestamp,
  "Creator" varchar(50),
  "DeleteBy" varchar(50),
  "DeptName" varchar(50),
  "Dept_Id" int4,
  "Enable" int2,
  "Modifier" varchar(50),
  "ModifyDate" timestamp,
  "OrderNo" int4,
  "ParentId" int4 NOT NULL,
  "RoleName" varchar(50),
  CONSTRAINT "_copy_6" PRIMARY KEY ("Role_Id")
);

CREATE TABLE "sys_roleauth" (
  "Auth_Id" int4 NOT NULL,
  "AuthValue" varchar(1000) NOT NULL,
  "CreateDate" timestamp,
  "Creator" varchar(1000),
  "Menu_Id" int4 NOT NULL,
  "Modifier" varchar(1000),
  "ModifyDate" timestamp,
  "Role_Id" int4,
  "User_Id" int4,
  CONSTRAINT "_copy_5" PRIMARY KEY ("Auth_Id")
);

CREATE TABLE "sys_roleauthdata" (
  "Auth_Id" int4 NOT NULL,
  "DataType_Id" int4,
  "Role_Id" int4,
  "User_Id" int4,
  "Node_Id" varchar(50),
  "LevelID" int4,
  "AuthValue" varchar(4000),
  "Creator" varchar(50),
  "CreateDate" timestamp,
  "Modifier" varchar(50),
  "ModifyDate" timestamp,
  CONSTRAINT "_copy_4" PRIMARY KEY ("Auth_Id")
);

CREATE TABLE "sys_tablecolumn" (
  "ColumnId" int4 NOT NULL,
  "ApiInPut" int4,
  "ApiIsNull" int4,
  "ApiOutPut" int4,
  "ColSize" int4,
  "ColumnCNName" varchar(100),
  "ColumnName" varchar(100),
  "ColumnType" text,
  "ColumnWidth" int4,
  "Columnformat" text,
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(200),
  "DropNo" varchar(50),
  "EditColNo" int4,
  "EditRowNo" int4,
  "EditType" varchar(200),
  "Enable" int4,
  "IsColumnData" int4,
  "IsDisplay" int4,
  "IsImage" int4,
  "IsKey" int4,
  "IsNull" int4,
  "IsReadDataset" int4,
  "Maxlength" int4,
  "Modifier" text,
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "OrderNo" int4,
  "Script" text,
  "SearchColNo" int4,
  "SearchRowNo" int4,
  "SearchType" varchar(200),
  "Sortable" int4,
  "TableName" varchar(200),
  "Table_Id" int4,
  CONSTRAINT "_copy_3" PRIMARY KEY ("ColumnId")
);

CREATE TABLE "sys_tableinfo" (
  "Table_Id" int4 NOT NULL,
  "CnName" varchar(50),
  "ColumnCNName" varchar(100),
  "DBServer" varchar(2000),
  "DataTableType" varchar(200),
  "DetailCnName" varchar(200),
  "DetailName" varchar(200),
  "EditorType" varchar(100),
  "Enable" int4,
  "ExpressField" varchar(200),
  "FolderName" varchar(200),
  "Namespace" varchar(200),
  "OrderNo" int4,
  "ParentId" int4,
  "RichText" varchar(100),
  "SortName" varchar(50),
  "TableName" varchar(50),
  "TableTrueName" varchar(100),
  "UploadField" varchar(100),
  "UploadMaxCount" int4,
  CONSTRAINT "_copy_2" PRIMARY KEY ("Table_Id")
);

CREATE TABLE "sys_user" (
  "User_Id" int4 NOT NULL,
  "Address" varchar(200),
  "AppType" int4,
  "AuditDate" timestamp,
  "AuditStatus" int4,
  "Auditor" varchar(200),
  "CreateDate" timestamp,
  "CreateID" int4,
  "Creator" varchar(200),
  "DeptName" varchar(150),
  "Dept_Id" int4,
  "Email" varchar(100),
  "Enable" int2 NOT NULL,
  "Gender" int4,
  "HeadImageUrl" varchar(200),
  "IsRegregisterPhone" int4 NOT NULL,
  "LastLoginDate" timestamp,
  "LastModifyPwdDate" timestamp,
  "Mobile" varchar(100),
  "Modifier" varchar(200),
  "ModifyDate" timestamp,
  "ModifyID" int4,
  "OrderNo" int4,
  "Role_Id" int4 NOT NULL,
  "RoleName" varchar(150) NOT NULL,
  "PhoneNo" varchar(11),
  "Remark" varchar(200),
  "Tel" varchar(20),
  "UserName" varchar(100) NOT NULL,
  "UserPwd" varchar(200),
  "UserTrueName" varchar(20) NOT NULL,
  "Token" varchar(500),
  CONSTRAINT "_copy_1" PRIMARY KEY ("User_Id")
);

