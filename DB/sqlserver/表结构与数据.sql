
USE [netcoredev]
GO

/****** Object:  Table [dbo].[App_Appointment]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Appointment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Describe] [nvarchar](250) NOT NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_App_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_Expert]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Expert](
	[ExpertId] [int] IDENTITY(1,1) NOT NULL,
	[AuditDate] [datetime] NULL,
	[AuditId] [int] NULL,
	[AuditStatus] [int] NOT NULL,
	[Auditor] [nvarchar](20) NULL,
	[Certificate] [nvarchar](2500) NULL,
	[City] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Education] [nvarchar](50) NULL,
	[Enable] [tinyint] NOT NULL,
	[ExpertName] [nvarchar](20) NULL,
	[HeadImageUrl] [nvarchar](500) NULL,
	[IDNumber] [nvarchar](18) NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[PhoneNo] [nvarchar](11) NULL,
	[Professional] [nvarchar](50) NULL,
	[ReallyName] [nvarchar](20) NULL,
	[Resume] [nvarchar](500) NULL,
	[SpecialField] [nvarchar](800) NULL,
	[UserName] [nvarchar](30) NULL,
	[UserTrueName] [nvarchar](50) NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_App_Expert] PRIMARY KEY CLUSTERED 
(
	[ExpertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_News]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Author] [nvarchar](50) NULL,
	[BigImageUrls] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[DailyRecommend] [smallint] NOT NULL,
	[DetailUrl] [nvarchar](200) NULL,
	[Enable] [smallint] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[NewsType] [int] NOT NULL,
	[OrderNo] [int] NULL,
	[ReleaseDate] [datetime] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_App_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_ReportPrice]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_ReportPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Age] [nvarchar](50) NOT NULL,
	[AuditDate] [datetime] NULL,
	[AuditId] [int] NULL,
	[AuditStatus] [int] NULL,
	[Auditor] [nvarchar](20) NULL,
	[City] [nvarchar](30) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[Variety] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_App_ReportPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_Transaction]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CowType] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Describe] [nvarchar](500) NOT NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](15) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TransactionType] [int] NOT NULL,
 CONSTRAINT [PK_App_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_TransactionAvgPrice]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_TransactionAvgPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgeRange] [nvarchar](50) NOT NULL,
	[AvgPrice] [decimal](18, 2) NOT NULL,
	[City] [nvarchar](15) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Date] [date] NOT NULL,
	[Enable] [tinyint] NULL,
	[IsTop] [int] NOT NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Variety] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_App_TransactionAvgPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormCollectionObject]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormCollectionObject](
	[FormCollectionId] [uniqueidentifier] NOT NULL,
	[FormId] [uniqueidentifier] NULL,
	[Title] [nvarchar](max) NULL,
	[FormData] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
 CONSTRAINT [PK_FormCollectionList] PRIMARY KEY CLUSTERED 
(
	[FormCollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormDesignOptions]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormDesignOptions](
	[FormId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[DaraggeOptions] [nvarchar](max) NULL,
	[FormOptions] [nvarchar](max) NULL,
	[FormConfig] [nvarchar](max) NULL,
	[FormFields] [nvarchar](max) NULL,
	[TableConfig] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
 CONSTRAINT [PK_FormCollectionOptions] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellOrder]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellOrder](
	[Order_Id] [uniqueidentifier] NOT NULL,
	[OrderType] [int] NOT NULL,
	[TranNo] [nvarchar](100) NOT NULL,
	[SellNo] [nvarchar](255) NOT NULL,
	[Qty] [int] NOT NULL,
	[AuditDate] [datetime] NULL,
	[AuditStatus] [int] NOT NULL,
	[AuditId] [int] NULL,
	[Auditor] [nvarchar](100) NULL,
	[Remark] [nvarchar](1000) NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Modifier] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_SellOrder] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellOrderList]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellOrderList](
	[OrderList_Id] [uniqueidentifier] NOT NULL,
	[Order_Id] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[MO] [nvarchar](255) NULL,
	[Qty] [int] NOT NULL,
	[Weight] [decimal](18, 2) NULL,
	[Remark] [nvarchar](1000) NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Modifier] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_SellOrderList] PRIMARY KEY CLUSTERED 
(
	[OrderList_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_City]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityCode] [nvarchar](20) NULL,
	[CityName] [nvarchar](30) NULL,
	[ProvinceCode] [varchar](20) NULL,
 CONSTRAINT [PK_Sys_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Dictionary]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Dictionary](
	[Dic_ID] [int] IDENTITY(1,1) NOT NULL,
	[Config] [nvarchar](4000) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[DBServer] [nvarchar](4000) NULL,
	[DbSql] [nvarchar](4000) NULL,
	[DicName] [nvarchar](100) NOT NULL,
	[DicNo] [nvarchar](100) NOT NULL,
	[Enable] [tinyint] NOT NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[OrderNo] [int] NULL,
	[ParentId] [int] NOT NULL,
	[Remark] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Sys_Dictionary] PRIMARY KEY CLUSTERED 
(
	[Dic_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_DictionaryList]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_DictionaryList](
	[DicList_ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[DicName] [nvarchar](100) NULL,
	[DicValue] [nvarchar](100) NULL,
	[Dic_ID] [int] NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[OrderNo] [int] NULL,
	[Remark] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Sys_DictionaryList] PRIMARY KEY CLUSTERED 
(
	[DicList_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Log]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] NULL,
	[BrowserType] [nvarchar](200) NULL,
	[ElapsedTime] [int] NULL,
	[EndDate] [datetime] NULL,
	[ExceptionInfo] [nvarchar](max) NULL,
	[LogType] [nvarchar](50) NULL,
	[RequestParameter] [nvarchar](max) NULL,
	[ResponseParameter] [nvarchar](max) NULL,
	[Role_Id] [int] NULL,
	[ServiceIP] [nvarchar](100) NULL,
	[Success] [int] NULL,
	[Url] [nvarchar](4000) NULL,
	[UserIP] [nvarchar](100) NULL,
	[UserName] [nvarchar](4000) NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Sys_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[Menu_Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Auth] [nvarchar](4000) NULL,
	[Icon] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Enable] [tinyint] NULL,
	[OrderNo] [int] NULL,
	[TableName] [nvarchar](200) NULL,
	[ParentId] [int] NOT NULL,
	[Url] [nvarchar](4000) NULL,
	[CreateDate] [datetime] NULL,
	[Creator] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[Modifier] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Province]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Province](
	[ProvinceId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceCode] [nvarchar](20) NOT NULL,
	[ProvinceName] [nvarchar](30) NOT NULL,
	[RegionCode] [nvarchar](20) NULL,
 CONSTRAINT [PK_Sys_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_Role]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Creator] [nvarchar](50) NULL,
	[DeleteBy] [nvarchar](50) NULL,
	[DeptName] [nvarchar](50) NULL,
	[Dept_Id] [int] NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](50) NULL,
	[ModifyDate] [datetime] NULL,
	[OrderNo] [int] NULL,
	[ParentId] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sys_Role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_RoleAuth]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_RoleAuth](
	[Auth_Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthValue] [nvarchar](1000) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Creator] [nvarchar](1000) NULL,
	[Menu_Id] [int] NOT NULL,
	[Modifier] [nvarchar](1000) NULL,
	[ModifyDate] [datetime] NULL,
	[Role_Id] [int] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Sys_RoleAuth] PRIMARY KEY CLUSTERED 
(
	[Auth_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_TableColumn]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_TableColumn](
	[ColumnId] [int] IDENTITY(1,1) NOT NULL,
	[ApiInPut] [int] NULL,
	[ApiIsNull] [int] NULL,
	[ApiOutPut] [int] NULL,
	[ColSize] [int] NULL,
	[ColumnCNName] [nvarchar](100) NULL,
	[ColumnName] [nvarchar](100) NULL,
	[ColumnType] [nvarchar](max) NULL,
	[ColumnWidth] [int] NULL,
	[Columnformat] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](200) NULL,
	[DropNo] [nvarchar](50) NULL,
	[EditColNo] [int] NULL,
	[EditRowNo] [int] NULL,
	[EditType] [nvarchar](200) NULL,
	[Enable] [int] NULL,
	[IsColumnData] [int] NULL,
	[IsDisplay] [int] NULL,
	[IsImage] [int] NULL,
	[IsKey] [int] NULL,
	[IsNull] [int] NULL,
	[IsReadDataset] [int] NULL,
	[Maxlength] [int] NULL,
	[Modifier] [ntext] NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[OrderNo] [int] NULL,
	[Script] [ntext] NULL,
	[SearchColNo] [int] NULL,
	[SearchRowNo] [int] NULL,
	[SearchType] [nvarchar](200) NULL,
	[Sortable] [int] NULL,
	[TableName] [nvarchar](200) NULL,
	[Table_Id] [int] NULL,
 CONSTRAINT [PK_Sys_TableColumn] PRIMARY KEY CLUSTERED 
(
	[ColumnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_TableInfo]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_TableInfo](
	[Table_Id] [int] IDENTITY(1,1) NOT NULL,
	[CnName] [nvarchar](50) NULL,
	[ColumnCNName] [nvarchar](100) NULL,
	[DBServer] [nvarchar](2000) NULL,
	[DataTableType] [nvarchar](200) NULL,
	[DetailCnName] [nvarchar](200) NULL,
	[DetailName] [nvarchar](200) NULL,
	[EditorType] [nvarchar](100) NULL,
	[Enable] [int] NULL,
	[ExpressField] [nvarchar](200) NULL,
	[FolderName] [nvarchar](200) NULL,
	[Namespace] [nvarchar](200) NULL,
	[OrderNo] [int] NULL,
	[ParentId] [int] NULL,
	[RichText] [nvarchar](100) NULL,
	[SortName] [nvarchar](50) NULL,
	[TableName] [nvarchar](50) NULL,
	[TableTrueName] [nvarchar](100) NULL,
	[UploadField] [nvarchar](100) NULL,
	[UploadMaxCount] [int] NULL,
 CONSTRAINT [PK_Sys_TableInfo] PRIMARY KEY CLUSTERED 
(
	[Table_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_User]    Script Date: 2022-01-03 19:15:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[AppType] [int] NULL,
	[AuditDate] [datetime] NULL,
	[AuditStatus] [int] NULL,
	[Auditor] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](200) NULL,
	[DeptName] [nvarchar](150) NULL,
	[Dept_Id] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Enable] [tinyint] NOT NULL,
	[Gender] [int] NULL,
	[HeadImageUrl] [nvarchar](200) NULL,
	[IsRegregisterPhone] [int] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[LastModifyPwdDate] [datetime] NULL,
	[Mobile] [nvarchar](100) NULL,
	[Modifier] [nvarchar](200) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[OrderNo] [int] NULL,
	[Role_Id] [int] NOT NULL,
	[RoleName] [nvarchar](150) NOT NULL,
	[PhoneNo] [nvarchar](11) NULL,
	[Remark] [nvarchar](200) NULL,
	[Tel] [nvarchar](20) NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPwd] [nvarchar](200) NULL,
	[UserTrueName] [nvarchar](20) NOT NULL,
	[Token] [nvarchar](500) NULL,
 CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[App_Appointment] ([Id], [CreateDate], [CreateID], [Creator], [Describe], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo]) VALUES (N'08d73c0e-edef-0a68-ab81-c3dc5e0fe407', CAST(N'2019-09-18T16:05:11.000' AS DateTime), 1, N'超级管理员', N'来自火星。。。', N'超级管理员', CAST(N'2019-12-17T10:34:07.000' AS DateTime), 1, N'元霸', N'138888887698')
GO
INSERT [dbo].[App_Appointment] ([Id], [CreateDate], [CreateID], [Creator], [Describe], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo]) VALUES (N'08d73c11-6a43-97e8-ca70-e8b0d906807e', CAST(N'2019-09-18T16:22:59.000' AS DateTime), 1, N'超级管理员', N'来自火星。。。', N'超级管理员', CAST(N'2019-12-17T10:34:17.000' AS DateTime), 1, N'元华', N'138888887698')
GO
SET IDENTITY_INSERT [dbo].[App_Expert] ON 
GO
INSERT [dbo].[App_Expert] ([ExpertId], [AuditDate], [AuditId], [AuditStatus], [Auditor], [Certificate], [City], [Company], [CreateDate], [CreateID], [Creator], [Education], [Enable], [ExpertName], [HeadImageUrl], [IDNumber], [Modifier], [ModifyDate], [ModifyID], [PhoneNo], [Professional], [ReallyName], [Resume], [SpecialField], [UserName], [UserTrueName], [User_Id]) VALUES (275, CAST(N'2018-09-07T10:58:17.000' AS DateTime), 1, 1, N'测试超级管理员', NULL, N'北京市', N'中国农业大学', CAST(N'2018-09-04T15:49:44.000' AS DateTime), 3344, N'User31110458', N'博士', 1, N'起个名字好难', N'Upload/Tables/App_Expert/201912082211146054/x1.jpg', N'150124199911110116', N'超级管理员', CAST(N'2020-04-21T21:07:43.000' AS DateTime), 1, N'13381277739', N'教授', N'拉美西斯', N'....', N'Upload/Tables/App_Expert/201912061918189488/采购单管理.xlsx', N'13381277739', N'User31110458', 3344)
GO
INSERT [dbo].[App_Expert] ([ExpertId], [AuditDate], [AuditId], [AuditStatus], [Auditor], [Certificate], [City], [Company], [CreateDate], [CreateID], [Creator], [Education], [Enable], [ExpertName], [HeadImageUrl], [IDNumber], [Modifier], [ModifyDate], [ModifyID], [PhoneNo], [Professional], [ReallyName], [Resume], [SpecialField], [UserName], [UserTrueName], [User_Id]) VALUES (276, CAST(N'2020-03-03T12:19:08.993' AS DateTime), 1, 2, N'超级管理员', N'', N'上饶市', N'窦天宝传奇', CAST(N'2018-09-18T17:45:54.000' AS DateTime), 3358, N'较瘦', N'小学', 1, N'国家一级演员', N'Upload/Tables/App_Expert/202004032214264280/1.jpg,Upload/Tables/App_Expert/202004032214264280/02.jpg,Upload/Tables/App_Expert/202004032214361481/04.jpg', N'88888', N'超级管理员', CAST(N'2020-04-03T22:14:37.000' AS DateTime), 1, N'18612119021', N'演员', N'木兰', N'啊啊啊啊', N'xxxxxx', N'18612119023', N'较瘦', 3358)
GO
SET IDENTITY_INSERT [dbo].[App_Expert] OFF
GO
SET IDENTITY_INSERT [dbo].[App_News] ON 
GO
INSERT [dbo].[App_News] ([Id], [Author], [BigImageUrls], [Content], [CreateDate], [CreateID], [Creator], [DailyRecommend], [DetailUrl], [Enable], [ImageUrl], [Modifier], [ModifyDate], [ModifyID], [NewsType], [OrderNo], [ReleaseDate], [Title], [ViewCount]) VALUES (73756, NULL, NULL, N'<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	<b>网易娱乐12月21日报道</b>&nbsp;日前，杨幂在个人平台晒出自拍照，沈腾喊话魏大勋，再度引来网友对杨幂与魏大勋恋情的猜想。随后，又有网友发现魏大勋疯狂点赞微博，疑似承认与杨幂恋情。12月20日晚间，魏大勋工作室回应称，当天魏大勋的账号没有登陆过，点赞并非艺人本人的操作行为，是新浪微博系统故障导致。
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	据了解，20日晚，有网友发现魏大勋的微博账号在疯狂点赞微博，其中有一条是“女人三十如狼四十如虎”，而杨幂1986年出生，今年33岁，再度引发网友的猜想
</p>', CAST(N'2018-09-06T11:00:35.000' AS DateTime), 3357, N' 小编', 0, N'static/news/20191223/1016167531.html', 1, N'https://bj.bcebos.com/common1/180905/15361176985178184.jpeg@w_500', N'超级管理员', CAST(N'2019-12-23T10:16:52.000' AS DateTime), 1, 1, NULL, NULL, N'魏大勋点赞"女人三十如狼"微博 工作室这样回应，又有网友发现魏大勋疯狂点赞微博，疑似承认与杨幂恋情', 53)
GO
INSERT [dbo].[App_News] ([Id], [Author], [BigImageUrls], [Content], [CreateDate], [CreateID], [Creator], [DailyRecommend], [DetailUrl], [Enable], [ImageUrl], [Modifier], [ModifyDate], [ModifyID], [NewsType], [OrderNo], [ReleaseDate], [Title], [ViewCount]) VALUES (73762, NULL, NULL, N'<p style="text-indent:32px;">
	<span style="font-size:16px;font-family:'';">
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		<b>相关阅读：</b>
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		<a href="https://tech.163.com/19/1221/17/F0UFROFU00097U7R.html" target="_self" style="color:#0F6B99;line-height:1;"><b>马云回应指挥交响乐争议：企业家最大的资源不是钱</b></a>
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		网易科技讯 12月21日消息，今日，马云在“2019世界浙商上海论坛暨上海市浙江商会年会”上谈到，2019年很不容易，但是我们做企业的都知道，每一年都不容易。唯一2019年最不容易的是，以往可能是部分人不容易，2019年可能是大部分企业不容易。
	</p>
	<p style="text-align:center;margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;color:#404040;white-space:normal;background-color:#FFFFFF;padding:0px;">
		<img src="http://cms-bucket.ws.126.net/2019/1221/3e42a18ej00q2uvfx0030c000t600jgc.jpg?imageView&amp;thumbnail=550x0" style="vertical-align:top;max-width:550px;" />
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		马云以自己为例称，“昨天一天，我收到很多朋友借钱的电话，一天内5个电话。过去一个礼拜，要卖楼的朋友大概有10个，确实不容易。”（易科）
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		<span style="font-weight:700;">以下为马云演讲实录：</span>
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		马云：我想讲三句话，三个意思。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		第一，祝贺王均金会长、喻渭蛟执行会长的完美的工作。2019年，商会取得了那么多的成绩，这是不容易的，这主要是奉献，通过帮助别人来提升自己。我们看到了商会的巨大努力。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		第二，2019年很不容易，但是我们做企业的都知道，每一年都不容易。唯一2019年最不容易的是，以往可能是部分人不容易，2019年可能是大部分企业不容易。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		到了年底了，昨天一天，我收到很多朋友借钱的电话，一天内5个电话。过去一个礼拜，要卖楼的朋友大概有10个，确实不容易。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		我们所有的企业家都要明白，做企业2019年不容易，要想到这可能是不容易的开始，大家都不容易，就好办了。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		第三层，大家要明白，浙商过不去，其他商人肯定也过不去，我们要有这个自信。世界正在进入巨大的变化之中，中国经济也面临巨大的调整，我们只有改变自己，才能适应这种调整，我相信这是机会的开始。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		我们每一年的浙商大会，尤其是上海商会，会开得非常好，我们在这不是炫耀成绩，不是谈怎么赚钱，而是互相交流，互相学习，提升自己。只有学习的人，才能面向未来，只有改变自己的人，才有未来，只有为未来解决问题的企业，才有希望。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		祝大家2020年，在最困难的时候能够度过，我相信，我也对浙商，所有爱学习的企业家、爱交流的企业家、实干的企业家、改变自己的企业家，我相信他们能度过。
	</p>
	<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
		再次祝贺大家，祝福大家，2020年，我们一起努力
	</p>
</span>
</p>
<p>
	<br />
</p>', CAST(N'2018-09-06T17:10:56.000' AS DateTime), 3357, N' 小编', 0, N'static/news/20191223/1015441258.html', 1, N'https://bj.bcebos.com/common1/180905/15361158996288828.jpg@w_500', N'超级管理员', CAST(N'2019-12-23T10:15:51.000' AS DateTime), 1, 2, NULL, NULL, N'马云谈2019太难了：光昨天我就收到5个朋友借钱电话', 12)
GO
INSERT [dbo].[App_News] ([Id], [Author], [BigImageUrls], [Content], [CreateDate], [CreateID], [Creator], [DailyRecommend], [DetailUrl], [Enable], [ImageUrl], [Modifier], [ModifyDate], [ModifyID], [NewsType], [OrderNo], [ReleaseDate], [Title], [ViewCount]) VALUES (73765, NULL, NULL, N'<p style="text-align:justify;text-justify:inter-ideograph;text-indent:32px;line-height:150%;">
	<a></a><a><span style="line-height:150%;font-family:'';">
	<div class="content" style="white-space:normal;box-sizing:border-box;padding:0px;margin:0px;text-align:center;color:#888888;font-family:&quot;font-size:14px;background-color:#FFFFFF;">
		<p style="margin-top:40px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;最近，无意中从网上看到一部名为《school lunch in Japan》的纪录片，反映了日本一家五年级小学生午餐的情况，虽然视频仅有8分钟，但看完后好多人不禁感叹：
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;很多孩子与日本孩子在午餐上，原来差那么多。。。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/6cb92cadj00q2r17v001dc000f700a4m.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;在影片的刚开始，日本那学校的校长就说了这样一句话：
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;“这45分钟的午餐时间，同样也是学习时间，跟他们的数学课或是阅读课没有什么不同。”
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;从这句话中，可以感受到什么？
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;大概是日本一直提倡的<strong>“食育”</strong>精神吧，在“吃”中渗入潜移默化的教育。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/44569443j00q2r17v001bc000dw00ctm.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;在影片中，我们的主角yui每天早上出门上学，与我们国家的孩子们不同，他们的书包里除了书本之外，还有餐巾布、筷子、牙刷等。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/ab09f1d4j00q2r17v000wc000dw00dwm.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;在小学里，还有5个厨师，在3小时要做出720份午餐。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/e74b1222j00q2r17v000rc000eu008cm.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;里面有一个特色菜，不简单的土豆泥。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;这土豆，可是孩子们自己种的，在教学楼边上，学校开发了一大片农场，孩子们可以在这里种水果蔬菜，有了这个体验，孩子们对食物会更珍惜用心。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;记得小时候看樱桃小丸子的时候，小丸子会说：“午餐值日生真辛苦！”
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/a2429afaj00q2r17v001dc000qo00kcm.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;所以可以看出日本小学生的午餐，是需要孩子们自己轮流值班分配的呀。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/aec6b83fj00q2r17v002lc000rs00iim.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;领饭之前，所有的值日生都要先检查卫生，并且询问孩子们的身体健康情况，并在每个孩子的手上抹好消毒液进行消毒。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;日本小学生的午餐，上面一层是饭菜、餐盘和碗，下面一层则是牛奶和蔬菜。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/ae382f4dj00q2r17v001rc000qa00jym.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;在拿到饭菜的时候，要一边鞠躬，一边向给自己准备饭菜的师傅们介绍自己并表示感谢，然后再齐心协力将饭菜拿到教室。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;分发完午餐还剩炸鱼怎么办呢？好几个小男生都想要，所以孩子们采取了“石头、剪刀、布”的方式决定了谁吃剩下的炸鱼，简单快速~
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/3b116376j00q2r17v0025c000rs00kum.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;餐后整理环节也十分重要，大家将喝完了的牛奶盒拆开、摊平，进行回收利用，日本回收利用的观念深入人心，从小抓起。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/d5ace7c2j00q2r17v000tc000rs00kum.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;这些处理好了之后，孩子们便开始刷牙，可见日本在保护牙齿上面做的功夫也很多。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;刷完牙后，负责发牛奶的同学会集齐全班的奶盒，将其冲洗干净，并晾干，防止残留的牛奶生菌。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;你以为这样午餐时间就结束了吗？
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;no。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;下面要进行大扫除，同学们非常自觉的找到自己分配好的活，教室、楼梯。卫生间....
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/fc7659e6j00q2r17v000zc000go00dwm.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;大扫除结束后，45分钟的<strong>食育</strong>才算是真正的告一段落，看完后，可能我们会觉得孩子们除了上课之外，还有这么多的任务要做，太累了。但是，实际上日本的小学生对此感到很开心，很喜欢。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;再仔细想想，也许，日本能够多年来蝉联——全球小学生营养最佳水平的国家，并不止是丰富的物质生活的贡献，更重要的，是精神生活。
		</p>
		<p style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;毕竟孩子是国家的未来，或许日本的“食育”，能给越来越重视素质教育的我们多一点思考吧。
		</p>
		<p align="center" style="margin-top:20px;margin-bottom:20px;box-sizing:border-box;padding:0px;font-size:18px;line-height:34px;color:#333333;text-align:left;">
			&emsp;&emsp;<img src="http://dingyue.ws.126.net/2019/1219/b272928dj00q2r17v0012c000hs00a2m.jpg" style="box-sizing:border-box;vertical-align:baseline;max-width:100%;margin:20px 0px;" />
		</p>
	</div>
	<div class="statement" style="white-space:normal;box-sizing:border-box;padding:0px 0px 60px;margin:40px 0px 0px;color:#888888;line-height:24px;font-family:&quot;font-size:14px;background-color:#FFFFFF;">
		<span style="box-sizing:border-box;display:inline-block;width:750px;height:12px;background-image:url(&quot;background-position:initial;background-size:initial;background-repeat:initial;background-attachment:initial;background-origin:initial;background-clip:initial;"></span>
		<p style="margin-top:0px;margin-bottom:0px;box-sizing:border-box;padding:0px;">
			特别声明：本文为网易自媒体平台“网易号”作者上传并发布，仅代表该作者观点。网易仅提供信息发布平台。
		</p>
	</div>
</span></a>
</p>
<p>
	<span style="font-size:14px;font-family:仿宋;"></span>
</p>', CAST(N'2018-09-07T08:52:48.000' AS DateTime), 3357, N' 小编', 1, N'static/news/20191222/1446528970.html', 1, N'Upload/Tables/App_News/201912231015164124/1.jpg,Upload/Tables/App_News/201912231015164124/02.jpg,Upload/Tables/App_News/201912231015164124/03.jpg', N'超级管理员', CAST(N'2019-12-23T10:14:42.000' AS DateTime), 1, 1, NULL, NULL, N'日本小学生10块钱一顿的午餐，震惊了全世界...', 13)
GO
INSERT [dbo].[App_News] ([Id], [Author], [BigImageUrls], [Content], [CreateDate], [CreateID], [Creator], [DailyRecommend], [DetailUrl], [Enable], [ImageUrl], [Modifier], [ModifyDate], [ModifyID], [NewsType], [OrderNo], [ReleaseDate], [Title], [ViewCount]) VALUES (73766, NULL, NULL, N',,<img style="width:100%;" src="http://127.0.0.1:9991/Upload/Tables/App_News/202005021803327050/07.jpg" />
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	11月28日，世界旅游联盟（WTA）在北京举办招待会。世界旅游联盟主席段强、阿尔及利亚、突尼斯驻华大使出席并致辞，联盟秘书长刘士军、巴巴多斯、缅甸、罗马尼亚、约旦驻华大使以及40位驻华使馆和国际组织代表、10余家境外旅游机构驻华办事处、53家世界旅游联盟境内外会员单位、世界银行、中国国际扶贫中心、媒体代表等共近300人出席活动。
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;color:#404040;text-align:center;white-space:normal;background-color:#FFFFFF;padding:0px;">
	<img src="http://cms-bucket.ws.126.net/2019/11/28/939c200a063a434aae3c24225c2e5ae5.jpeg?imageView&amp;thumbnail=550x0" style="vertical-align:top;max-width:550px;margin:0px auto;display:block;" /> 
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	段强表示，世界旅游联盟成立两年来，以“旅游让世界和生活更美好”为宗旨，以旅游促进和平、旅游促进发展、旅游促进减贫为使命，成功举办“湘湖对话”、“大河文明旅游论坛”等系列活动，发布了《世界旅游联盟旅游减贫案例》、《2019中国入境旅游数据分析报告》、《2019世界旅游发展报告》、《中国国内旅游市场景气调查报告》、《中国入境旅游市场景气调查报告》、《中国出境旅游市场景气调查报告》等，为会员搭建了交流、合作的平台，为国际旅游业发展提供智力支持和决策服务，推动世界旅游减贫事业进一步发展。未来，世界旅游联盟将顺应世界旅游业发展大势，继续搭建好交流、合作及发展的平台，推进世界各国、各地区深化交流合作，推动全球旅游业持续健康发展。
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	阿尔及利亚驻华大使艾哈桑·布哈利法表示，旅游合作是经贸合作和人文交流最活跃、最具潜力的部分，未来希望世界旅游联盟更好的促进世界各国旅游产业交流。
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	突尼斯驻华大使迪亚·哈立德表示，世界旅游联盟开展了众多具有前瞻性的工作，增强了世界各地旅游行业主要参与者之的间理解与合作。《大河文明旅游报告》的发布将对旅游行业及相关机构起到积极的指导作用。
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;color:#404040;text-align:center;white-space:normal;background-color:#FFFFFF;padding:0px;">
	<img src="http://cms-bucket.ws.126.net/2019/11/28/5a17ad3aac864fc0bbea73b6c6894dcb.jpeg?imageView&amp;thumbnail=550x0" style="vertical-align:top;max-width:550px;margin:0px auto;display:block;" /> 
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;text-indent:2em;color:#404040;text-align:justify;white-space:normal;background-color:#FFFFFF;padding:0px;">
	段强宣布世界旅游联盟2020年年会、理事会及“湘湖对话”将于明年9月6—9日在杭州召开。并将于2020年继续举办“义乌对话”、“大河文明旅游论坛”，在广州、法国、保加利亚、意大利等地举办中欧旅游合作和目的地推广主题研讨等会员日活动。
</p>
<p style="margin-top:32px;margin-bottom:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:18px;line-height:32px;font-family:&quot;color:#404040;text-align:center;white-space:normal;background-color:#FFFFFF;padding:0px;">
	<img src="http://cms-bucket.ws.126.net/2019/11/28/cf8eee29f11746a0a8a1ce8e97aa536f.jpeg?imageView&amp;thumbnail=550x0" style="vertical-align:top;max-width:550px;margin:0px auto;display:block;" /> 
</p>', CAST(N'2019-12-23T10:17:26.000' AS DateTime), 1, N'超级管理员', 1, N'static/news/20191223/1017279676.html', NULL, N'Upload/Tables/App_News/201912231017475391/2222.jpg,Upload/Tables/App_News/201912231017475391/h51.jpg,Upload/Tables/App_News/201912231017475391/h52.jpg', N'超级管理员', CAST(N'2020-05-02T18:04:01.000' AS DateTime), 1, 1, NULL, NULL, N'世界旅游联盟在京举办招待会 发布《大河文明旅游报告》', NULL)
GO
SET IDENTITY_INSERT [dbo].[App_News] OFF
GO
SET IDENTITY_INSERT [dbo].[App_ReportPrice] ON 
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (66, N'0-2月龄', CAST(N'2018-09-10T09:13:49.000' AS DateTime), 1, 1, N'测试超级管理员', N'重庆市', CAST(N'2018-09-07T18:18:15.000' AS DateTime), 3331, N'Mr.G', 0, N'超级管理员', CAST(N'2020-01-31T12:10:03.000' AS DateTime), 1, CAST(13.00 AS Numeric(10, 2)), N'5')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (67, N'12-16月龄', CAST(N'2018-09-10T10:16:59.000' AS DateTime), 1, 1, N'测试超级管理员', N'忻州市', CAST(N'2018-09-10T10:12:50.000' AS DateTime), 3344, N'啊啊啊', 0, N'超级管理员', CAST(N'2019-07-16T15:07:16.000' AS DateTime), 1, CAST(29.00 AS Numeric(10, 2)), N'西门塔尔')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (71, N'7-12月龄', CAST(N'2019-07-16T15:02:36.000' AS DateTime), 1, 1, N'超级管理员', N'石家庄市', CAST(N'2019-07-11T17:10:03.000' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2020-01-31T12:10:29.000' AS DateTime), 1, CAST(22.00 AS Numeric(10, 2)), N'6')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (74, N'7-12月龄', CAST(N'2019-07-16T15:05:39.000' AS DateTime), 1, 2, N'超级管理员', N'唐山市', CAST(N'2019-07-11T18:25:35.000' AS DateTime), 1, N'超级管理员', 0, N'超级管理员', CAST(N'2020-01-31T12:10:11.000' AS DateTime), 1, CAST(65.00 AS Numeric(10, 2)), N'7')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (75, N'7-12月龄', CAST(N'2019-07-16T10:29:11.000' AS DateTime), 1, 1, N'超级管理员', N'北京市', CAST(N'2019-07-11T18:28:53.000' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2020-01-31T12:09:53.000' AS DateTime), 1, CAST(43.00 AS Numeric(10, 2)), N'5')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (81, N'2-6月龄', CAST(N'2019-07-18T11:41:20.000' AS DateTime), 1, 2, N'超级管理员', N'石家庄市', CAST(N'2019-07-18T11:17:34.000' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2020-01-31T12:09:37.000' AS DateTime), 1, CAST(14.00 AS Numeric(10, 2)), N'4')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (82, N'7-12月龄', CAST(N'2019-07-18T12:42:06.000' AS DateTime), 1, 1, N'超级管理员', N'天津市', CAST(N'2019-07-18T11:40:09.000' AS DateTime), 1, N'超级管理员', 0, N'超级管理员', CAST(N'2020-03-27T22:06:57.000' AS DateTime), 1, CAST(78.00 AS Numeric(10, 2)), N'8')
GO
SET IDENTITY_INSERT [dbo].[App_ReportPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[App_Transaction] ON 
GO
INSERT [dbo].[App_Transaction] ([Id], [CowType], [CreateDate], [CreateID], [Creator], [Describe], [Enable], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo], [Quantity], [TransactionType]) VALUES (4, N'1', CAST(N'2019-09-18T18:10:01.000' AS DateTime), 1, N'超级管理员', N'买买买买买买1', NULL, N'超级管理员', CAST(N'2019-11-17T15:07:23.000' AS DateTime), 1, N'大锤1', N'13419098211', 25, 0)
GO
INSERT [dbo].[App_Transaction] ([Id], [CowType], [CreateDate], [CreateID], [Creator], [Describe], [Enable], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo], [Quantity], [TransactionType]) VALUES (6, N'3', CAST(N'2019-09-18T18:22:25.000' AS DateTime), 1, N'超级管理员', N'买买买买买买3', NULL, N'超级管理员', CAST(N'2019-11-17T15:33:53.000' AS DateTime), 1, N'小乔', N'13419444422', 199, 1)
GO
INSERT [dbo].[App_Transaction] ([Id], [CowType], [CreateDate], [CreateID], [Creator], [Describe], [Enable], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo], [Quantity], [TransactionType]) VALUES (7, N'0', CAST(N'2020-12-29T21:39:22.000' AS DateTime), 1, N'超级管理员', N'12312119023', NULL, N'超级管理员', CAST(N'2020-12-29T21:41:29.000' AS DateTime), 1, N'林中鸟', N'18612119123', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[App_Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[App_TransactionAvgPrice] ON 
GO
INSERT [dbo].[App_TransactionAvgPrice] ([Id], [AgeRange], [AvgPrice], [City], [CreateDate], [CreateID], [Creator], [Date], [Enable], [IsTop], [Modifier], [ModifyDate], [ModifyID], [Variety]) VALUES (2, N'12-16月龄', CAST(22.00 AS Decimal(18, 2)), N'天津市', CAST(N'2019-05-06T14:06:15.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-05-30' AS Date), 0, 2, N'超级管理员', CAST(N'2020-02-01T20:57:40.000' AS DateTime), 1, N'8')
GO
INSERT [dbo].[App_TransactionAvgPrice] ([Id], [AgeRange], [AvgPrice], [City], [CreateDate], [CreateID], [Creator], [Date], [Enable], [IsTop], [Modifier], [ModifyDate], [ModifyID], [Variety]) VALUES (6, N'7-12月龄', CAST(22.00 AS Decimal(18, 2)), N'北京市', CAST(N'2019-05-08T15:42:30.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-05-07' AS Date), 0, 2, N'超级管理员', CAST(N'2020-05-03T11:57:32.000' AS DateTime), 1, N'8,7,6,5')
GO
INSERT [dbo].[App_TransactionAvgPrice] ([Id], [AgeRange], [AvgPrice], [City], [CreateDate], [CreateID], [Creator], [Date], [Enable], [IsTop], [Modifier], [ModifyDate], [ModifyID], [Variety]) VALUES (7, N'2-6月龄', CAST(22.00 AS Decimal(18, 2)), N'北京市', CAST(N'2019-07-12T10:39:44.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-07-16' AS Date), 0, 0, N'超级管理员', CAST(N'2020-05-03T11:23:49.000' AS DateTime), 1, N'6,5,4,3,7,8')
GO
INSERT [dbo].[App_TransactionAvgPrice] ([Id], [AgeRange], [AvgPrice], [City], [CreateDate], [CreateID], [Creator], [Date], [Enable], [IsTop], [Modifier], [ModifyDate], [ModifyID], [Variety]) VALUES (8, N'12-16月龄', CAST(0.22 AS Decimal(18, 2)), N'黄石市', CAST(N'2019-07-12T14:32:29.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-07-10' AS Date), 0, 0, N'超级管理员', CAST(N'2020-05-03T11:59:37.000' AS DateTime), 1, N'6')
GO
SET IDENTITY_INSERT [dbo].[App_TransactionAvgPrice] OFF
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'cccc519c-c448-4292-85d1-6a0ac2828fd9', N'0431a578-bfc9-407f-b95e-321c350f10cb', NULL, N'{"FormId":"0431a578-bfc9-407f-b95e-321c350f10cb","field1640871905593":"1","field1640871902689":"2022-01-04","field1641207457900":"123456","field1641207424694":""}', CAST(N'2022-01-03T19:09:53.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'a37c1956-ddc0-457b-8f0a-93cdc44c257d', N'8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, N'{"FormId":"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da","field1641205615398":"1","field1641206170991":"十分满意,相当满意","field1641205647957":"相当满意","field1641206608182":"没有意见"}', CAST(N'2022-01-03T19:05:46.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'e913389c-e11a-4675-b8eb-a25c75086e37', N'8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, N'{"FormId":"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da","field1641205615398":"1","field1641206170991":"非常满意,十分满意,相当满意","field1641205647957":"非常满意","field1641206608182":"1111"}', CAST(N'2022-01-03T19:09:45.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'90513c4c-b639-4d0d-8c9d-fb69b77620f8', N'0431a578-bfc9-407f-b95e-321c350f10cb', NULL, N'{"FormId":"0431a578-bfc9-407f-b95e-321c350f10cb","field1640871905593":"1","field1640871902689":"2022-01-05","field1641207457900":null,"field1641207424694":""}', CAST(N'2022-01-03T19:06:50.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormDesignOptions] ([FormId], [Title], [DaraggeOptions], [FormOptions], [FormConfig], [FormFields], [TableConfig], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'0431a578-bfc9-407f-b95e-321c350f10cb', N'2021开发语言使用调查', N'[{"id":5,"name":"是否同时使用多种语言开发","type":"radio","icon":"el-icon-aim","value":0,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"key":"enable","field":"field1640871905593","width":100,"readonly":false,"required":true,"values":["否"]},{"id":3,"name":"从什么时候开始做开发?","type":"date","icon":"el-icon-date","value":null,"field":"field1640871902689","width":100,"readonly":false,"required":true},{"id":2,"name":"说点什么","type":"textarea","value":"","icon":"el-icon-document-copy","field":"field1641207457900","width":100,"readonly":false,"required":false},{"id":9,"name":"图片上传","type":"img","url":"","maxSize":3,"fileInfo":[],"multiple":false,"autoUpload":false,"maxFile":5,"icon":"el-icon-picture-outline","field":"field1641207424694","width":100,"readonly":false,"required":false}]', N'{"fields":{"field1640871905593":[],"field1640871902689":null,"field1641207457900":null,"field1641207424694":null},"formOptions":[[{"field":"field1640871905593","title":"是否同时使用多种语言开发","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"}],[{"field":"field1640871902689","title":"从什么时候开始做开发?","type":"date","required":true,"readonly":false,"colSize":12}],[{"field":"field1641207457900","title":"说点什么","type":"textarea","required":false,"readonly":false,"colSize":12}],[{"field":"field1641207424694","title":"图片上传","type":"img","required":false,"readonly":false,"colSize":12,"maxSize":3,"fileInfo":[],"multiple":false,"autoUpload":false,"maxFile":5,"url":""}]],"tables":[],"tabs":[]}', N'[{"field":"field1640871905593","title":"是否同时使用多种语言开发","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"},{"field":"field1640871902689","title":"从什么时候开始做开发?","type":"date","required":true,"readonly":false,"colSize":12},{"field":"field1641207457900","title":"说点什么","type":"textarea","required":false,"readonly":false,"colSize":12},{"field":"field1641207424694","title":"图片上传","type":"img","required":false,"readonly":false,"colSize":12,"maxSize":3,"fileInfo":[],"multiple":false,"autoUpload":false,"maxFile":5,"url":""}]', NULL, N'[]', CAST(N'2021-12-29T23:39:22.000' AS DateTime), 1, N'超级管理员', N'超级管理员', CAST(N'2022-01-03T19:00:30.000' AS DateTime), 1)
GO
INSERT [dbo].[FormDesignOptions] ([FormId], [Title], [DaraggeOptions], [FormOptions], [FormConfig], [FormFields], [TableConfig], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', N'2021双减政策调查', N'[{"id":5,"name":"您的孩子放学后是否有学校布置的书面作业?","type":"radio","icon":"el-icon-aim","value":0,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"key":"enable","field":"field1641205615398","width":100,"readonly":false,"required":true,"values":["否"]},{"id":6,"name":"您认为放学后作业对孩子的负担怎样?","values":["非常满意"],"type":"checkbox","key":"满意度","data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"icon":"el-icon-circle-check","field":"field1641206170991","width":100,"readonly":false,"required":true},{"id":5,"name":"作为家长,对当前双减政策是否满意？","type":"radio","icon":"el-icon-aim","value":0,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"key":"满意度","field":"field1641205647957","width":100,"readonly":false,"required":true,"values":["非常满意"]},{"id":2,"name":"其他意见","type":"textarea","value":"","icon":"el-icon-document-copy","field":"field1641206608182","width":100,"readonly":false,"required":false}]', N'{"fields":{"field1641205615398":[],"field1641206170991":[],"field1641205647957":[],"field1641206608182":null},"formOptions":[[{"field":"field1641205615398","title":"您的孩子放学后是否有学校布置的书面作业?","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"}],[{"field":"field1641206170991","title":"您认为放学后作业对孩子的负担怎样?","type":"checkbox","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"}],[{"field":"field1641205647957","title":"作为家长,对当前双减政策是否满意？","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"}],[{"field":"field1641206608182","title":"其他意见","type":"textarea","required":false,"readonly":false,"colSize":12}]],"tables":[],"tabs":[]}', N'[{"field":"field1641205615398","title":"您的孩子放学后是否有学校布置的书面作业?","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"},{"field":"field1641206170991","title":"您认为放学后作业对孩子的负担怎样?","type":"checkbox","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"},{"field":"field1641205647957","title":"作为家长,对当前双减政策是否满意？","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"},{"field":"field1641206608182","title":"其他意见","type":"textarea","required":false,"readonly":false,"colSize":12}]', NULL, N'[]', CAST(N'2021-12-30T21:45:16.000' AS DateTime), 1, N'超级管理员', N'超级管理员', CAST(N'2022-01-03T18:43:46.000' AS DateTime), 1)
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'8e68188b-a9a2-45f5-87cd-58c421b14090', 1, N'2019000001810005', N'2019000001810006', 22, CAST(N'2019-09-18T13:28:06.000' AS DateTime), 1, 1, N'超级管理员', N'还没想好...8888', 1, N'超级管理员', CAST(N'2019-09-18T12:21:12.000' AS DateTime), 1, N'超级管理员', CAST(N'2020-05-03T12:10:33.977' AS DateTime))
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'f30e1d98-b2c6-4150-b372-a9154553041e', 2, N'2019000001810003', N'2019000001810004', 56, CAST(N'2019-09-18T13:28:06.000' AS DateTime), 1, 1, N'超级管理员', NULL, 1, N'超级管理员', CAST(N'2019-09-18T12:20:52.000' AS DateTime), 1, N'超级管理员', CAST(N'2020-04-07T21:22:37.403' AS DateTime))
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'da70748d-6c95-4bdb-bcf2-beb55c1693e3', 2, N'2019000001810001', N'2019000001810002', 200, NULL, 0, NULL, NULL, N'买家女朋友不要了', 1, N'超级管理员', CAST(N'2019-09-17T18:51:11.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-09-19T14:56:35.000' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'a79fd603-c30c-444f-8532-1b0be27c5f86', N'8e68188b-a9a2-45f5-87cd-58c421b14090', N'女装', N'2', 333, CAST(21.00 AS Decimal(18, 2)), N'Upload/Tables/Sys_Dictionary/202004072137326929/111.jpg', 1, N'超级管理员', CAST(N'2020-01-07T17:50:46.353' AS DateTime), 1, N'超级管理员', CAST(N'2020-05-03T12:10:34.157' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'49dded16-b1f1-4840-926d-5554e2587228', N'f30e1d98-b2c6-4150-b372-a9154553041e', N'男装', N'fds', 1, CAST(1.00 AS Decimal(18, 2)), N'Upload/Tables/Sys_Dictionary/202004072118229531/06.jpg,Upload/Tables/Sys_Dictionary/202004072118229531/07.jpg,Upload/Tables/Sys_Dictionary/202004072118229531/111.jpg', 1, N'超级管理员', CAST(N'2019-11-21T18:09:04.360' AS DateTime), 1, N'超级管理员', CAST(N'2020-04-07T21:22:37.407' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'08d72cf6-d9f5-bee9-32ff-5808ff1238cb', N'6efb65b8-585e-4be7-8b77-94c76e362412', N'测试', N'测试', 7, CAST(8.00 AS Decimal(18, 2)), NULL, 1, N'超级管理员', CAST(N'2019-08-30T11:05:03.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-08-30T11:05:19.000' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'08d72cf6-ed6c-f0e0-9e97-5930a04f2ebc', N'ad698348-1535-4221-9a1a-57db5cb351e4', N'2', N'2', 2, NULL, NULL, 1, N'超级管理员', CAST(N'2019-08-30T11:05:35.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'08d73b5c-f448-6ac7-5db9-66be4d4e6ca5', N'da70748d-6c95-4bdb-bcf2-beb55c1693e3', N'男装', N'32', 2, CAST(2.00 AS Decimal(18, 2)), N'33', 1, N'超级管理员', CAST(N'2019-09-17T18:51:12.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-09-19T14:56:35.000' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'fc332cef-c1eb-4063-b71c-6addf19a8e8b', N'6efb65b8-585e-4be7-8b77-94c76e362412', N'22', N'2', 0, NULL, NULL, 1, N'超级管理员', CAST(N'2019-08-30T11:05:19.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'08d73bef-a3a7-4ce3-00fb-8a1249593c9c', N'8e68188b-a9a2-45f5-87cd-58c421b14090', N'男装', N'4', 1, CAST(11.20 AS Decimal(18, 2)), N'Upload/Tables/Sys_Dictionary/202004072112537465/06.jpg', 1, N'超级管理员', CAST(N'2019-09-18T12:21:13.000' AS DateTime), 1, N'超级管理员', CAST(N'2020-05-03T12:10:34.157' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'4d9b81da-0319-4d9a-99ce-d1251c5eb464', N'8e68188b-a9a2-45f5-87cd-58c421b14090', N'女装', N'2', 3, NULL, N'Upload/Tables/Sys_Dictionary/202004072140236770/02.jpg', 1, N'超级管理员', CAST(N'2020-04-07T21:27:09.077' AS DateTime), 1, N'超级管理员', CAST(N'2020-05-03T12:10:34.107' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sys_City] ON 
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (1, N'110100', N'市辖区', N'110000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (2, N'110200', N'县', N'110000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (3, N'120100', N'市辖区', N'120000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (4, N'120200', N'县', N'120000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (5, N'130100', N'石家庄市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (6, N'130200', N'唐山市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (7, N'130300', N'秦皇岛市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (8, N'130400', N'邯郸市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (9, N'130500', N'邢台市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (10, N'130600', N'保定市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (11, N'130700', N'张家口市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (12, N'130800', N'承德市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (13, N'130900', N'沧州市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (14, N'131000', N'廊坊市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (15, N'131100', N'衡水市', N'130000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (16, N'140100', N'太原市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (17, N'140200', N'大同市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (18, N'140300', N'阳泉市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (19, N'140400', N'长治市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (20, N'140500', N'晋城市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (21, N'140600', N'朔州市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (22, N'140700', N'晋中市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (23, N'140800', N'运城市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (24, N'140900', N'忻州市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (25, N'141000', N'临汾市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (26, N'141100', N'吕梁市', N'140000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (27, N'150100', N'呼和浩特市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (28, N'150200', N'包头市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (29, N'150300', N'乌海市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (30, N'150400', N'赤峰市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (31, N'150500', N'通辽市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (32, N'150600', N'鄂尔多斯市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (33, N'150700', N'呼伦贝尔市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (34, N'150800', N'巴彦淖尔市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (35, N'150900', N'乌兰察布市', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (36, N'152200', N'兴安盟', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (37, N'152500', N'锡林郭勒盟', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (38, N'152900', N'阿拉善盟', N'150000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (39, N'210100', N'沈阳市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (40, N'210200', N'大连市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (41, N'210300', N'鞍山市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (42, N'210400', N'抚顺市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (43, N'210500', N'本溪市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (44, N'210600', N'丹东市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (45, N'210700', N'锦州市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (46, N'210800', N'营口市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (47, N'210900', N'阜新市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (48, N'211000', N'辽阳市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (49, N'211100', N'盘锦市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (50, N'211200', N'铁岭市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (51, N'211300', N'朝阳市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (52, N'211400', N'葫芦岛市', N'210000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (53, N'220100', N'长春市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (54, N'220200', N'吉林市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (55, N'220300', N'四平市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (56, N'220400', N'辽源市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (57, N'220500', N'通化市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (58, N'220600', N'白山市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (59, N'220700', N'松原市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (60, N'220800', N'白城市', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (61, N'222400', N'延边朝鲜族自治州', N'220000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (62, N'230100', N'哈尔滨市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (63, N'230200', N'齐齐哈尔市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (64, N'230300', N'鸡西市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (65, N'230400', N'鹤岗市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (66, N'230500', N'双鸭山市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (67, N'230600', N'大庆市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (68, N'230700', N'伊春市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (69, N'230800', N'佳木斯市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (70, N'230900', N'七台河市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (71, N'231000', N'牡丹江市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (72, N'231100', N'黑河市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (73, N'231200', N'绥化市', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (74, N'232700', N'大兴安岭地区', N'230000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (75, N'310100', N'市辖区', N'310000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (76, N'310200', N'县', N'310000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (77, N'320100', N'南京市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (78, N'320200', N'无锡市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (79, N'320300', N'徐州市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (80, N'320400', N'常州市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (81, N'320500', N'苏州市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (82, N'320600', N'南通市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (83, N'320700', N'连云港市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (84, N'320800', N'淮安市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (85, N'320900', N'盐城市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (86, N'321000', N'扬州市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (87, N'321100', N'镇江市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (88, N'321200', N'泰州市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (89, N'321300', N'宿迁市', N'320000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (90, N'330100', N'杭州市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (91, N'330200', N'宁波市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (92, N'330300', N'温州市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (93, N'330400', N'嘉兴市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (94, N'330500', N'湖州市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (95, N'330600', N'绍兴市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (96, N'330700', N'金华市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (97, N'330800', N'衢州市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (98, N'330900', N'舟山市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (99, N'331000', N'台州市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (100, N'331100', N'丽水市', N'330000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (101, N'340100', N'合肥市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (102, N'340200', N'芜湖市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (103, N'340300', N'蚌埠市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (104, N'340400', N'淮南市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (105, N'340500', N'马鞍山市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (106, N'340600', N'淮北市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (107, N'340700', N'铜陵市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (108, N'340800', N'安庆市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (109, N'341000', N'黄山市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (110, N'341100', N'滁州市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (111, N'341200', N'阜阳市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (112, N'341300', N'宿州市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (113, N'341400', N'巢湖市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (114, N'341500', N'六安市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (115, N'341600', N'亳州市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (116, N'341700', N'池州市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (117, N'341800', N'宣城市', N'340000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (118, N'350100', N'福州市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (119, N'350200', N'厦门市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (120, N'350300', N'莆田市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (121, N'350400', N'三明市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (122, N'350500', N'泉州市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (123, N'350600', N'漳州市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (124, N'350700', N'南平市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (125, N'350800', N'龙岩市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (126, N'350900', N'宁德市', N'350000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (127, N'360100', N'南昌市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (128, N'360200', N'景德镇市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (129, N'360300', N'萍乡市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (130, N'360400', N'九江市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (131, N'360500', N'新余市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (132, N'360600', N'鹰潭市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (133, N'360700', N'赣州市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (134, N'360800', N'吉安市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (135, N'360900', N'宜春市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (136, N'361000', N'抚州市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (137, N'361100', N'上饶市', N'360000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (138, N'370100', N'济南市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (139, N'370200', N'青岛市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (140, N'370300', N'淄博市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (141, N'370400', N'枣庄市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (142, N'370500', N'东营市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (143, N'370600', N'烟台市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (144, N'370700', N'潍坊市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (145, N'370800', N'济宁市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (146, N'370900', N'泰安市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (147, N'371000', N'威海市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (148, N'371100', N'日照市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (149, N'371200', N'莱芜市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (150, N'371300', N'临沂市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (151, N'371400', N'德州市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (152, N'371500', N'聊城市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (153, N'371600', N'滨州市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (154, N'371700', N'荷泽市', N'370000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (155, N'410100', N'郑州市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (156, N'410200', N'开封市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (157, N'410300', N'洛阳市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (158, N'410400', N'平顶山市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (159, N'410500', N'安阳市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (160, N'410600', N'鹤壁市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (161, N'410700', N'新乡市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (162, N'410800', N'焦作市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (163, N'410900', N'濮阳市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (164, N'411000', N'许昌市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (165, N'411100', N'漯河市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (166, N'411200', N'三门峡市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (167, N'411300', N'南阳市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (168, N'411400', N'商丘市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (169, N'411500', N'信阳市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (170, N'411600', N'周口市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (171, N'411700', N'驻马店市', N'410000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (172, N'420100', N'武汉市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (173, N'420200', N'黄石市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (174, N'420300', N'十堰市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (175, N'420500', N'宜昌市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (176, N'420600', N'襄樊市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (177, N'420700', N'鄂州市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (178, N'420800', N'荆门市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (179, N'420900', N'孝感市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (180, N'421000', N'荆州市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (181, N'421100', N'黄冈市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (182, N'421200', N'咸宁市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (183, N'421300', N'随州市', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (184, N'422800', N'恩施土家族苗族自治州', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (185, N'429000', N'省直辖行政单位', N'420000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (186, N'430100', N'长沙市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (187, N'430200', N'株洲市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (188, N'430300', N'湘潭市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (189, N'430400', N'衡阳市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (190, N'430500', N'邵阳市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (191, N'430600', N'岳阳市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (192, N'430700', N'常德市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (193, N'430800', N'张家界市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (194, N'430900', N'益阳市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (195, N'431000', N'郴州市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (196, N'431100', N'永州市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (197, N'431200', N'怀化市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (198, N'431300', N'娄底市', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (199, N'433100', N'湘西土家族苗族自治州', N'430000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (200, N'440100', N'广州市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (201, N'440200', N'韶关市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (202, N'440300', N'深圳市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (203, N'440400', N'珠海市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (204, N'440500', N'汕头市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (205, N'440600', N'佛山市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (206, N'440700', N'江门市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (207, N'440800', N'湛江市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (208, N'440900', N'茂名市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (209, N'441200', N'肇庆市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (210, N'441300', N'惠州市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (211, N'441400', N'梅州市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (212, N'441500', N'汕尾市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (213, N'441600', N'河源市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (214, N'441700', N'阳江市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (215, N'441800', N'清远市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (216, N'441900', N'东莞市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (217, N'442000', N'中山市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (218, N'445100', N'潮州市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (219, N'445200', N'揭阳市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (220, N'445300', N'云浮市', N'440000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (221, N'450100', N'南宁市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (222, N'450200', N'柳州市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (223, N'450300', N'桂林市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (224, N'450400', N'梧州市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (225, N'450500', N'北海市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (226, N'450600', N'防城港市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (227, N'450700', N'钦州市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (228, N'450800', N'贵港市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (229, N'450900', N'玉林市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (230, N'451000', N'百色市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (231, N'451100', N'贺州市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (232, N'451200', N'河池市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (233, N'451300', N'来宾市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (234, N'451400', N'崇左市', N'450000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (235, N'460100', N'海口市', N'460000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (236, N'460200', N'三亚市', N'460000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (237, N'469000', N'省直辖县级行政单位', N'460000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (238, N'500100', N'市辖区', N'500000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (239, N'500200', N'县', N'500000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (240, N'500300', N'市', N'500000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (241, N'510100', N'成都市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (242, N'510300', N'自贡市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (243, N'510400', N'攀枝花市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (244, N'510500', N'泸州市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (245, N'510600', N'德阳市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (246, N'510700', N'绵阳市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (247, N'510800', N'广元市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (248, N'510900', N'遂宁市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (249, N'511000', N'内江市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (250, N'511100', N'乐山市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (251, N'511300', N'南充市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (252, N'511400', N'眉山市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (253, N'511500', N'宜宾市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (254, N'511600', N'广安市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (255, N'511700', N'达州市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (256, N'511800', N'雅安市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (257, N'511900', N'巴中市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (258, N'512000', N'资阳市', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (259, N'513200', N'阿坝藏族羌族自治州', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (260, N'513300', N'甘孜藏族自治州', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (261, N'513400', N'凉山彝族自治州', N'510000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (262, N'520100', N'贵阳市', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (263, N'520200', N'六盘水市', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (264, N'520300', N'遵义市', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (265, N'520400', N'安顺市', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (266, N'522200', N'铜仁地区', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (267, N'522300', N'黔西南布依族苗族自治州', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (268, N'522400', N'毕节地区', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (269, N'522600', N'黔东南苗族侗族自治州', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (270, N'522700', N'黔南布依族苗族自治州', N'520000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (271, N'530100', N'昆明市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (272, N'530300', N'曲靖市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (273, N'530400', N'玉溪市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (274, N'530500', N'保山市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (275, N'530600', N'昭通市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (276, N'530700', N'丽江市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (277, N'530800', N'思茅市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (278, N'530900', N'临沧市', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (279, N'532300', N'楚雄彝族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (280, N'532500', N'红河哈尼族彝族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (281, N'532600', N'文山壮族苗族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (282, N'532800', N'西双版纳傣族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (283, N'532900', N'大理白族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (284, N'533100', N'德宏傣族景颇族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (285, N'533300', N'怒江傈僳族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (286, N'533400', N'迪庆藏族自治州', N'530000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (287, N'540100', N'拉萨市', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (288, N'542100', N'昌都地区', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (289, N'542200', N'山南地区', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (290, N'542300', N'日喀则地区', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (291, N'542400', N'那曲地区', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (292, N'542500', N'阿里地区', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (293, N'542600', N'林芝地区', N'540000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (294, N'610100', N'西安市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (295, N'610200', N'铜川市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (296, N'610300', N'宝鸡市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (297, N'610400', N'咸阳市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (298, N'610500', N'渭南市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (299, N'610600', N'延安市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (300, N'610700', N'汉中市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (301, N'610800', N'榆林市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (302, N'610900', N'安康市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (303, N'611000', N'商洛市', N'610000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (304, N'620100', N'兰州市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (305, N'620200', N'嘉峪关市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (306, N'620300', N'金昌市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (307, N'620400', N'白银市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (308, N'620500', N'天水市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (309, N'620600', N'武威市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (310, N'620700', N'张掖市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (311, N'620800', N'平凉市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (312, N'620900', N'酒泉市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (313, N'621000', N'庆阳市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (314, N'621100', N'定西市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (315, N'621200', N'陇南市', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (316, N'622900', N'临夏回族自治州', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (317, N'623000', N'甘南藏族自治州', N'620000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (318, N'630100', N'西宁市', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (319, N'632100', N'海东地区', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (320, N'632200', N'海北藏族自治州', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (321, N'632300', N'黄南藏族自治州', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (322, N'632500', N'海南藏族自治州', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (323, N'632600', N'果洛藏族自治州', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (324, N'632700', N'玉树藏族自治州', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (325, N'632800', N'海西蒙古族藏族自治州', N'630000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (326, N'640100', N'银川市', N'640000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (327, N'640200', N'石嘴山市', N'640000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (328, N'640300', N'吴忠市', N'640000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (329, N'640400', N'固原市', N'640000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (330, N'640500', N'中卫市', N'640000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (331, N'650100', N'乌鲁木齐市', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (332, N'650200', N'克拉玛依市', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (333, N'652100', N'吐鲁番地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (334, N'652200', N'哈密地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (335, N'652300', N'昌吉回族自治州', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (336, N'652700', N'博尔塔拉蒙古自治州', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (337, N'652800', N'巴音郭楞蒙古自治州', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (338, N'652900', N'阿克苏地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (339, N'653000', N'克孜勒苏柯尔克孜自治州', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (340, N'653100', N'喀什地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (341, N'653200', N'和田地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (342, N'654000', N'伊犁哈萨克自治州', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (343, N'654200', N'塔城地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (344, N'654300', N'阿勒泰地区', N'650000')
GO
INSERT [dbo].[Sys_City] ([CityId], [CityCode], [CityName], [ProvinceCode]) VALUES (345, N'659000', N'省直辖行政单位', N'650000')
GO
SET IDENTITY_INSERT [dbo].[Sys_City] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Dictionary] ON 
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (3, N'{valueField: ''Enable'',
textField: ''Enable'',
 containField: null,
  handler: null }', CAST(N'2019-07-05T17:36:23.000' AS DateTime), NULL, N'admin', N'1', NULL, N'是否值', N'enable', 1, N'超级管理员', CAST(N'2022-01-03T18:30:18.113' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (30, N'{valueField: ''Success'',
 textField: ''Success'', 
 containField: null,
 handler: null }
', CAST(N'2018-06-11T18:26:05.000' AS DateTime), 0, N'测试超级管理员', NULL, NULL, N'响应状态', N'restatus', 1, N'测试超级管理员', CAST(N'2018-06-12T10:21:48.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (31, N'{valueField: ''LogType'',
 textField: ''LogType'', 
 containField: null,
 handler: null }
', CAST(N'2018-06-12T14:46:07.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'日志类型', N'log', 1, N'测试超级管理员', CAST(N'2018-08-01T14:41:48.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (32, N'{valueField: ''Role_Id'',
 textField: ''RoleName'', 
 containField: [''Role_Id'',''RoleName''],
 handler: null }
', CAST(N'2018-06-14T16:48:35.000' AS DateTime), NULL, N'测试超级管理员', NULL, N'SELECT Role_Id as ''key'',RoleName as ''value'' FROM Sys_Role WHERE Enable=1
', N'角色列表', N'roles', 1, N'测试超级管理员', CAST(N'2018-07-13T15:03:53.000' AS DateTime), 1, 123, 0, N'sql语句需要key,value列，界面才能绑定数据源')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (35, N'{
 valueField: ''AuditStatus'',
 textField: ''AuditStatus'',
  containField:null 
}', CAST(N'2018-07-10T10:51:37.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'审核状态', N'audit', 1, N'测试超级管理员', CAST(N'2018-07-10T11:02:59.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (36, N'{
 valueField: ''Variety'',
 textField: ''Variety'',
  containField:null 
}', CAST(N'2018-07-10T14:06:12.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'品种', N'pz', 1, N'超级管理员', CAST(N'2022-01-03T19:14:32.960' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (37, N'{
 valueField: ''AgeRange'',
 textField: ''AgeRange'',
  containField:null 
}', CAST(N'2018-07-10T14:07:46.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'月龄', N'age', 1, N'测试超级管理员', CAST(N'2018-07-10T14:14:49.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (38, N'{
 valueField: ''City'',
 textField: ''City'',
  containField:null 
}', CAST(N'2018-07-10T14:18:25.000' AS DateTime), NULL, N'测试超级管理员', NULL, N'
SELECT  CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''key'',CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''value''  FROM Sys_City AS a 
INNER JOIN Sys_Province AS b 
ON a.ProvinceCode=b.ProvinceCode
WHERE a.CityName<> ''县''', N'城市', N'city', 1, N'超级管理员', CAST(N'2020-02-01T22:27:08.157' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (41, N'{
 valueField: ''Sex'',
 textField: ''Sex'',
  containField:null 
}', CAST(N'2018-07-10T15:43:44.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'性别', N'sex', 1, N'超级管理员', CAST(N'2020-11-20T23:04:20.733' AS DateTime), 1, NULL, 1, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (44, N'{
 valueField: ''NewsType'',
 textField: ''NewsType'',
  containField:null 
}', CAST(N'2018-07-10T16:15:59.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'新闻类型', N'news', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (46, N'{
 valueField: ''ProvinceName'',
 textField: ''ProvinceName'',
  containField:null 
}', CAST(N'2018-07-16T13:27:34.000' AS DateTime), NULL, N'测试超级管理员', NULL, N'
SELECT  CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''key'',CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''value''  FROM Sys_City AS a 
INNER JOIN Sys_Province AS b 
ON a.ProvinceCode=b.ProvinceCode
WHERE a.CityName<> ''县''', N'省列表', N'pro', 1, N'超级管理员', CAST(N'2020-02-01T22:26:59.223' AS DateTime), 1, NULL, 0, N'sql语句需要key,value列，界面才能绑定数据源')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (49, N'{
 valueField: ''Gender'',
 textField: ''Gender'',
  containField:null 
}', CAST(N'2018-07-23T10:04:45.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'性别', N'gender', 1, N'测试超级管理员', CAST(N'2018-07-23T11:10:28.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (50, N'{
 valueField: ''Enable'',
 textField: ''Enable'',
  containField:null 
}', CAST(N'2018-07-23T15:36:43.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'启用状态', N'status', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (52, N'{
 valueField: ''Choiceness'',
 textField: ''Choiceness'',
  containField:null 
}', CAST(N'2018-07-24T15:45:47.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'是否买入', N'cq', 1, N'超级管理员', CAST(N'2019-09-18T17:32:36.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (59, N'{
 valueField: ''IsRegregisterPhone'',
 textField: ''IsRegregisterPhone'',
  containField:null 
}', CAST(N'2018-08-29T15:54:21.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'手机用户', N'isphone', 1, N'超级管理员', CAST(N'2020-11-20T23:05:48.303' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (64, NULL, CAST(N'2019-09-18T19:25:47.000' AS DateTime), 1, N'超级管理员', NULL, NULL, N'订单类型', N'ordertype', 1, N'超级管理员', CAST(N'2019-11-01T10:04:20.833' AS DateTime), 1, NULL, 0, N'xxxxx')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (65, NULL, CAST(N'2019-09-19T10:07:23.000' AS DateTime), 1, N'超级管理员', NULL, NULL, N'商品名称', N'pn', 1, N'超级管理员', CAST(N'2020-02-07T17:57:11.940' AS DateTime), 1, 2, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (66, NULL, CAST(N'2020-11-20T23:03:56.000' AS DateTime), 1, N'超级管理员', NULL, N'SELECT Role_Id AS id,parentId,Role_Id AS [key],RoleName AS value FROM Sys_Role', N'级联角色', N'tree_roles', 1, N'超级管理员', CAST(N'2020-11-20T23:08:03.217' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (67, NULL, CAST(N'2020-12-29T21:41:15.593' AS DateTime), 1, N'超级管理员', NULL, NULL, N'nav', N'nav', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (68, NULL, CAST(N'2022-01-03T18:29:14.040' AS DateTime), 1, N'超级管理员', NULL, NULL, N'满意度', N'满意度', 1, N'超级管理员', CAST(N'2022-01-03T18:37:52.980' AS DateTime), 1, NULL, 0, N'表单设计使用')
GO
SET IDENTITY_INSERT [dbo].[Sys_Dictionary] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_DictionaryList] ON 
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (3, NULL, 1, N'admin', N'否', N'0', 3, NULL, N'超级管理员', CAST(N'2022-01-03T18:30:18.113' AS DateTime), 1, 2, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (4, NULL, 1, N'xxx', N'是', N'1', 3, NULL, N'超级管理员', CAST(N'2022-01-03T18:30:18.113' AS DateTime), 1, 1, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (22, CAST(N'2018-06-11T18:26:05.000' AS DateTime), 1, N'测试超级管理员', N'其他', N'0', 30, NULL, N'超级管理员', CAST(N'2019-08-21T16:49:43.000' AS DateTime), 1, 10, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (23, CAST(N'2018-06-11T18:26:05.000' AS DateTime), 1, N'测试超级管理员', N'成功', N'1', 30, NULL, N'超级管理员', CAST(N'2019-08-21T16:49:43.000' AS DateTime), 1, 100, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (24, CAST(N'2018-06-12T09:41:58.000' AS DateTime), 1, N'测试超级管理员', N'异常', N'2', 30, NULL, N'超级管理员', CAST(N'2019-08-21T16:49:43.000' AS DateTime), 1, 50, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (25, CAST(N'2018-06-12T14:46:08.000' AS DateTime), 1, N'测试超级管理员', N'系统', N'System', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, 100, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (26, CAST(N'2018-06-12T14:47:32.000' AS DateTime), 1, N'测试超级管理员', N'登陆', N'Login', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, 90, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (27, CAST(N'2018-06-15T15:29:58.000' AS DateTime), 1, N'测试超级管理员', N'新建', N'Add', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (28, CAST(N'2018-06-15T15:29:58.000' AS DateTime), 1, N'测试超级管理员', N'删除', N'Del', 31, 1, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (29, CAST(N'2018-06-15T15:30:34.000' AS DateTime), 1, N'测试超级管理员', N'编辑', N'Edit', 31, 1, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (37, CAST(N'2018-07-10T10:51:38.000' AS DateTime), 1, N'测试超级管理员', N'审核中', N'0', 35, NULL, N'测试超级管理员', CAST(N'2018-07-10T11:02:59.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (38, CAST(N'2018-07-10T10:51:38.000' AS DateTime), 1, N'测试超级管理员', N'审核通过', N'1', 35, NULL, N'测试超级管理员', CAST(N'2018-07-10T11:02:59.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (39, CAST(N'2018-07-10T10:51:38.000' AS DateTime), 1, N'测试超级管理员', N'审核未通过', N'2', 35, NULL, N'测试超级管理员', CAST(N'2018-07-10T11:02:59.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (47, CAST(N'2018-07-10T14:07:46.000' AS DateTime), 1, N'测试超级管理员', N'0-2月龄', N'0-2月龄', 37, NULL, N'测试超级管理员', CAST(N'2018-09-06T15:57:29.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (48, CAST(N'2018-07-10T14:07:46.000' AS DateTime), 1, N'测试超级管理员', N'2-6月龄', N'2-6月龄', 37, NULL, N'测试超级管理员', CAST(N'2018-09-06T15:57:29.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (49, CAST(N'2018-07-10T14:07:46.000' AS DateTime), 1, N'测试超级管理员', N'7-12月龄', N'7-12月龄', 37, NULL, N'测试超级管理员', CAST(N'2018-09-06T15:57:29.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (50, CAST(N'2018-07-10T14:07:46.000' AS DateTime), 1, N'测试超级管理员', N'12-16月龄', N'12-16月龄', 37, NULL, N'测试超级管理员', CAST(N'2018-09-06T15:57:29.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (51, CAST(N'2018-07-10T14:07:46.000' AS DateTime), 1, N'测试超级管理员', N'16月龄以上', N'16月龄以上', 37, NULL, N'测试超级管理员', CAST(N'2018-09-06T15:57:29.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (56, CAST(N'2018-07-10T15:43:44.000' AS DateTime), 1, N'测试超级管理员', N'公牛', N'公牛', 41, NULL, N'超级管理员', CAST(N'2020-11-20T23:04:20.743' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (57, CAST(N'2018-07-10T15:43:44.000' AS DateTime), 1, N'测试超级管理员', N'母牛', N'母牛', 41, NULL, N'超级管理员', CAST(N'2020-11-20T23:04:20.737' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (64, CAST(N'2018-07-10T16:15:59.000' AS DateTime), 1, N'测试超级管理员', N'行业新闻', N'1', 44, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (65, CAST(N'2018-07-10T16:15:59.000' AS DateTime), 1, N'测试超级管理员', N'行情资讯', N'2', 44, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (68, CAST(N'2018-07-11T13:20:11.000' AS DateTime), 1, N'测试超级管理员', N'App登陆', N'ApiLogin', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (69, CAST(N'2018-07-11T15:57:03.000' AS DateTime), 1, N'测试超级管理员', N'App发送验证码', N'ApiSendPIN', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (70, CAST(N'2018-07-11T17:11:18.000' AS DateTime), 1, N'测试超级管理员', N'App请求异常', N'ApiException', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (71, CAST(N'2018-07-11T17:11:19.000' AS DateTime), 1, N'测试超级管理员', N'PC请求异常', N'Exception', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (86, CAST(N'2018-07-19T11:34:35.000' AS DateTime), 1, N'测试超级管理员', N'App首页', N'AppHome', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (89, CAST(N'2018-07-20T17:35:36.000' AS DateTime), 1, N'测试超级管理员', N'加入会议', N'JoinMeeting', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (90, CAST(N'2018-07-23T10:04:45.000' AS DateTime), 1, N'测试超级管理员', N'男', N'0', 49, NULL, N'测试超级管理员', CAST(N'2018-07-23T11:10:28.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (91, CAST(N'2018-07-23T10:04:45.000' AS DateTime), 1, N'测试超级管理员', N'女', N'1', 49, NULL, N'测试超级管理员', CAST(N'2018-07-23T11:10:28.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (92, CAST(N'2018-07-23T10:44:14.000' AS DateTime), 1, N'测试超级管理员', N'修改密码', N'ApiModifyPwd', 31, 0, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (93, CAST(N'2018-07-23T13:51:27.000' AS DateTime), 1, N'测试超级管理员', N'加入我们', N'JoinUs', 31, 0, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (96, CAST(N'2018-07-23T15:36:43.000' AS DateTime), 1, N'测试超级管理员', N'未启用', N'0', 50, 1, N'超级管理员', CAST(N'2019-08-16T18:17:47.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (97, CAST(N'2018-07-23T15:36:43.000' AS DateTime), 1, N'测试超级管理员', N'已启用', N'1', 50, 1, N'超级管理员', CAST(N'2019-08-16T18:17:47.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (98, CAST(N'2018-07-23T15:36:43.000' AS DateTime), 1, N'测试超级管理员', N'已删除', N'2', 50, 1, N'超级管理员', CAST(N'2019-08-16T18:17:47.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (101, CAST(N'2018-07-24T15:45:47.000' AS DateTime), 1, N'测试超级管理员', N'否', N'0', 52, 0, N'超级管理员', CAST(N'2019-09-18T17:32:36.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (102, CAST(N'2018-07-24T15:45:47.000' AS DateTime), 1, N'测试超级管理员', N'是', N'1', 52, 0, N'超级管理员', CAST(N'2019-09-18T17:32:36.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (104, CAST(N'2018-07-25T18:51:07.000' AS DateTime), 1, N'测试超级管理员', N'iPhone测试', N'IPhoneTest', 31, 0, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (128, CAST(N'2018-08-29T15:54:21.000' AS DateTime), 1, N'测试超级管理员', N'是', N'1', 59, 0, N'超级管理员', CAST(N'2020-11-20T23:05:48.303' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (129, CAST(N'2018-08-29T15:54:21.000' AS DateTime), 1, N'测试超级管理员', N'否', N'0', 59, 1, N'超级管理员', CAST(N'2020-11-20T23:05:48.303' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (144, CAST(N'2019-08-21T16:40:50.000' AS DateTime), 1, N'超级管理员', N'刷新Token', N'ReplaceToeken', 31, NULL, N'超级管理员', CAST(N'2019-08-21T16:44:10.000' AS DateTime), 1, 110, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (145, CAST(N'2019-08-21T16:49:43.000' AS DateTime), 1, N'超级管理员', N'Info', N'3', 30, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (149, CAST(N'2019-09-18T19:25:47.000' AS DateTime), 1, N'超级管理员', N'发货', N'1', 64, 1, N'超级管理员', CAST(N'2019-11-01T10:04:20.837' AS DateTime), 1, NULL, N'fd')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (150, CAST(N'2019-09-18T19:25:47.000' AS DateTime), 1, N'超级管理员', N'退货', N'2', 64, 0, N'超级管理员', CAST(N'2019-11-01T10:04:20.837' AS DateTime), 1, NULL, N'fs')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (151, CAST(N'2019-09-18T19:25:47.000' AS DateTime), 1, N'超级管理员', N'返单', N'3', 64, 1, N'超级管理员', CAST(N'2019-11-01T10:04:20.833' AS DateTime), 1, NULL, N'xx')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (152, CAST(N'2019-09-19T10:07:23.000' AS DateTime), 1, N'超级管理员', N'家居', N'家居', 65, 1, N'超级管理员', CAST(N'2020-02-07T17:57:12.107' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (153, CAST(N'2019-09-19T10:07:23.000' AS DateTime), 1, N'超级管理员', N'男装', N'男装', 65, 1, N'超级管理员', CAST(N'2020-02-07T17:57:12.103' AS DateTime), 1, 4, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (154, CAST(N'2019-09-19T10:07:23.000' AS DateTime), 1, N'超级管理员', N'女装', N'女装', 65, NULL, N'超级管理员', CAST(N'2020-02-07T17:57:12.103' AS DateTime), 1, 6, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (155, CAST(N'2019-09-19T10:07:23.000' AS DateTime), 1, N'超级管理员', N'食品', N'食品', 65, NULL, N'超级管理员', CAST(N'2020-02-07T17:57:12.047' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (423, CAST(N'2020-12-29T21:41:15.647' AS DateTime), 1, N'超级管理员', N'是', N'1', 67, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (424, CAST(N'2020-12-29T21:41:15.670' AS DateTime), 1, N'超级管理员', N'否', N'0', 67, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (425, CAST(N'2022-01-03T18:29:14.120' AS DateTime), 1, N'超级管理员', N'非常满意', N'非常满意', 68, 0, N'超级管理员', CAST(N'2022-01-03T18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (426, CAST(N'2022-01-03T18:29:14.127' AS DateTime), 1, N'超级管理员', N'十分满意', N'十分满意', 68, 0, N'超级管理员', CAST(N'2022-01-03T18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (427, CAST(N'2022-01-03T18:29:14.127' AS DateTime), 1, N'超级管理员', N'相当满意', N'相当满意', 68, 0, N'超级管理员', CAST(N'2022-01-03T18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (428, CAST(N'2022-01-03T18:37:39.750' AS DateTime), 1, N'超级管理员', N'比较满意', N'比较满意', 68, 0, N'超级管理员', CAST(N'2022-01-03T18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (429, CAST(N'2022-01-03T19:14:32.960' AS DateTime), 1, N'超级管理员', N'数码相机', N'数码相机', 36, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (430, CAST(N'2022-01-03T19:14:32.960' AS DateTime), 1, N'超级管理员', N'单反相机', N'单反相机', 36, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (431, CAST(N'2022-01-03T19:14:32.960' AS DateTime), 1, N'超级管理员', N'微单相机', N'微单相机', 36, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (432, CAST(N'2022-01-03T19:14:32.960' AS DateTime), 1, N'超级管理员', N'运动相机', N'运动相机', 36, 0, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_DictionaryList] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Menu] ON 
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (2, N'用户基础信息', N'[{"text":"查询","value":"Search"}]', N'ios-people', NULL, 1, 1600, N'.', 0, NULL, CAST(N'2017-08-28T12:21:13.000' AS DateTime), N'2017-08-28 11:12:45', CAST(N'2020-02-02T20:51:29.740' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (3, N'角色管理', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 900, N'Sys_Role', 2, N'/Sys_Role/Manager', CAST(N'2017-09-12T16:20:02.000' AS DateTime), N'2017-08-28 14:19:13', CAST(N'2019-08-15T10:27:41.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (5, N'日志管理', N'[{"text":"查询","value":"Search"}]', N'ios-chatbubbles', NULL, 1, 1300, N'xxx', 0, N'/', CAST(N'2017-09-22T17:59:37.000' AS DateTime), N'2017-09-22 17:59:37', CAST(N'2020-02-02T20:53:00.330' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (6, N'系统日志', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'Sys_Log', 5, N'/Sys_Log/Manager', CAST(N'2017-09-22T18:00:25.000' AS DateTime), N'2017-09-22 18:0:25', CAST(N'2019-08-14T16:20:35.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (7, N'角色权限分配', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 0, 10, N'Sys_Role1', 2, N'/Sys_Role/TreeManager', NULL, NULL, CAST(N'2019-09-19T15:15:54.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (8, N'图表', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 10000, N'/', 32, N'chart', NULL, NULL, CAST(N'2020-04-05T21:20:29.177' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (9, N'用户管理', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 11110, N'Sys_User', 2, N'/Sys_User/Manager', NULL, NULL, CAST(N'2019-08-14T14:28:43.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (13, N'表单+图表', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 800, N'App_Transaction', 55, N'/multi3', CAST(N'2017-08-28T14:22:08.000' AS DateTime), N'null', CAST(N'2019-11-08T19:03:23.187' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (17, N'用户注册信息', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 0, 10, N'Sys_UserRegisterRecord', 2, N'/Sys_UserRegisterRecord/Manager', NULL, NULL, CAST(N'2019-09-18T15:31:24.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (24, N'后台加载table数据', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 750, N'/', 56, N'/table', NULL, NULL, CAST(N'2019-09-20T14:59:25.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (25, N'其他组件', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1100, N'/', 29, N'/form6', NULL, NULL, CAST(N'2019-09-20T12:44:50.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (28, N'基础可编辑table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1500, N'vtable', 33, N'table1', NULL, NULL, CAST(N'2019-11-10T14:25:14.940' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (29, N'其他组件', N'[{"text":"查询","value":"Search"}]', N'md-build', NULL, 1, 1690, N'/', 0, N'', NULL, NULL, CAST(N'2020-02-02T20:49:43.983' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (31, N'表单一对多table', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 950, N'App_TransactionAvgPrice1', 55, N'/multi1', NULL, NULL, CAST(N'2019-11-08T17:06:27.160' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (32, N'图表+表单', N'[{"text":"查询","value":"Search"}]', N'ios-pie', NULL, 1, 1720, N'/', 0, N'', NULL, NULL, CAST(N'2020-02-02T20:48:42.890' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (33, N'table组件', N'[{"text":"查询","value":"Search"}]', N'ios-keypad', NULL, 1, 1710, N'tables', 0, N'/', NULL, NULL, CAST(N'2021-02-28T22:07:05.680' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (34, N'表单与上传下载', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 0, N'表单与上传下载', 84, N'/formUpload', NULL, NULL, CAST(N'2019-11-24T21:07:25.177' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (35, N'可编辑的table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 730, N'editTable', 56, N'/editTable', NULL, NULL, CAST(N'2019-09-20T15:50:21.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (36, N'图表+表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'/', 32, N'formChart', NULL, NULL, CAST(N'2019-11-09T18:23:53.990' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (37, N'图片上传与预览 ', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 800, N'图片上传与预览 ', 84, N'', NULL, NULL, CAST(N'2019-11-24T08:24:39.550' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (39, N'用户Token生成记录', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 0, 10, N'x', 2, N'/Sys_UserTokenLog/Manager', NULL, NULL, CAST(N'2019-09-18T15:31:19.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (40, N'api加载table数据', N'[{"text":"查询","value":"Search"}]', N'ivu-icon ivu-icon-ios-add-circle', NULL, 1, 900, N'table2', 33, N'table2', NULL, NULL, CAST(N'2019-11-10T14:25:09.340' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (42, N'下载已上传文件', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'下载已上传文件', 84, N'', NULL, NULL, CAST(N'2019-11-24T08:25:12.490' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (44, N'table+forms', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 800, N'tableForms', 33, N'tableForms', NULL, NULL, CAST(N'2019-11-10T18:20:36.140' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (45, N'不用节点', N'', N'', NULL, 0, 0, N'/', 0, NULL, NULL, NULL, CAST(N'2020-05-05T13:20:14.130' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (48, N'单表数据', N'[{"text":"查询","value":"Search"}]', N'ios-apps', NULL, 1, 2000, N'Table+表单数据', 0, N'/', CAST(N'2019-07-12T13:26:32.000' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:01:49.560' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (49, N'基础表单+编辑只读', N'[{"text":"查询","value":"Search"},{"text":"导出","value":"Export"},{"text":"test","value":"test"}]', N'', NULL, 1, 1000, N'App_Appointment', 48, N'/App_Appointment', CAST(N'2019-07-12T13:28:17.000' AS DateTime), N'超级管理员', CAST(N'2020-03-17T12:56:33.107' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (50, N'自动绑定下拉框', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 900, N'App_TransactionAvgPrice', 48, N'/App_TransactionAvgPrice', CAST(N'2019-07-12T13:53:32.000' AS DateTime), N'超级管理员', CAST(N'2020-04-07T21:47:48.153' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (51, N'自定义扩展一对多', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 800, N'App_ReportPrice', 74, N'/App_ReportPrice', CAST(N'2019-07-12T13:55:21.000' AS DateTime), N'超级管理员', CAST(N'2020-04-03T21:58:21.133' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (52, N'导入导出表单', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 600, N'App_Transaction', 48, N'/App_Transaction', CAST(N'2019-07-12T13:56:15.000' AS DateTime), N'超级管理员', CAST(N'2019-10-31T10:09:00.100' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (53, N'混合表单一对多', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 900, N'App_ReportPrice', 55, N'/multi2', CAST(N'2019-07-12T13:57:05.000' AS DateTime), N'超级管理员', CAST(N'2019-11-08T19:03:19.680' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (54, N'主从表单明细一对多', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 10, N'SellOrder1', 55, N'/multi4', CAST(N'2019-07-12T13:57:56.000' AS DateTime), N'超级管理员', CAST(N'2020-04-03T21:57:16.087' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (55, N'表单一对多', N'[{"text":"查询","value":"Search"}]', N'md-cube', NULL, 1, 1740, N'/', 0, NULL, CAST(N'2019-07-12T13:58:34.000' AS DateTime), N'超级管理员', CAST(N'2020-12-29T21:36:36.803' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (56, N'表单布局', N'[{"text":"查询","value":"Search"}]', N'md-podium', NULL, 1, 1750, N'/', 0, NULL, CAST(N'2019-07-12T14:00:19.000' AS DateTime), N'超级管理员', CAST(N'2020-12-29T21:36:33.933' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (57, N'单列表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1000, N'.', 56, N'/form1', CAST(N'2019-07-12T14:01:12.000' AS DateTime), N'超级管理员', CAST(N'2020-04-05T21:11:52.390' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (58, N'两列表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 900, N'两列表单', 56, N'/form2', CAST(N'2019-07-12T14:01:43.000' AS DateTime), N'超级管理员', CAST(N'2019-09-20T13:59:03.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (59, N'多列表单', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 800, N'多列表单', 56, N'/form3', CAST(N'2019-07-12T14:02:17.000' AS DateTime), N'超级管理员', CAST(N'2020-04-07T21:48:03.980' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (60, N'Table+表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 700, N'Table+表单', 56, N'/form4', CAST(N'2019-07-12T14:03:14.000' AS DateTime), N'超级管理员', CAST(N'2019-09-20T13:59:09.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (61, N'系统设置', N'[{"text":"查询","value":"Search"}]', N'ios-cog', NULL, 1, 1000, N'系统设置', 0, N'/', CAST(N'2019-07-12T14:04:04.000' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:01:09.193' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (62, N'菜单设置', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 10, N'Sys_Menu', 61, N'/sysmenu', CAST(N'2019-07-12T14:04:35.000' AS DateTime), N'超级管理员', CAST(N'2019-10-24T12:00:38.507' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (63, N'下拉框绑定设置', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 10, N'Sys_Dictionary', 61, N'/Sys_Dictionary', CAST(N'2019-07-12T14:05:58.000' AS DateTime), N'超级管理员', CAST(N'2019-08-16T17:41:15.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (64, N'代码生成', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1500, N'代码生成', 0, N'/coding', CAST(N'2019-07-12T14:07:55.000' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:01:17.387' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (65, N'代码生成', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 10, N'/', 64, N'/coder', CAST(N'2019-07-12T14:08:58.000' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:01:20.673' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (66, N'编辑器与HTML', N'[{"text":"查询","value":"Search"}]', N'md-options', NULL, 1, 1520, N'静态页面发布', 0, N'/', CAST(N'2019-07-12T14:12:38.000' AS DateTime), N'超级管理员', CAST(N'2020-02-02T20:51:45.970' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (67, N'静态页面发布', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'App_News', 66, N'/App_News', CAST(N'2019-07-12T14:14:16.000' AS DateTime), N'超级管理员', CAST(N'2019-12-22T14:46:38.830' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (68, N'审核、启用图片支持', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 700, N'App_Expert', 48, N'/App_Expert', CAST(N'2019-07-12T14:24:15.000' AS DateTime), N'超级管理员', CAST(N'2020-04-02T18:34:49.170' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (69, N'前端自定义扩展', N'', N'', NULL, 0, 500, N'前端自定义扩展', 48, N'/coding', CAST(N'2019-07-12T14:26:25.000' AS DateTime), N'超级管理员', CAST(N'2019-11-17T19:10:35.503' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (70, N'后台自定义扩展', N'', N'', NULL, 0, 400, N'后台自定义扩展', 48, N'/coding', CAST(N'2019-07-12T14:28:45.000' AS DateTime), N'超级管理员', CAST(N'2019-11-17T19:10:37.867' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (71, N'vue权限管理', N'[{"text":"查询","value":"Search"},{"text":"编辑","value":"Update"}]', N'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, N'Sys_Role', 2, N'/permission', CAST(N'2019-08-10T10:25:36.000' AS DateTime), N'超级管理员', NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (72, N'移动H5开发', N'[{"text":"查询","value":"Search"}]', N'logo-apple', NULL, 1, 1650, N'/', 0, N'', CAST(N'2019-08-14T13:16:06.000' AS DateTime), N'超级管理员', CAST(N'2020-02-02T20:51:11.670' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (73, N'移动H5开发打包介绍', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, NULL, N'/', 72, N'/app/guide', CAST(N'2019-08-14T13:16:55.000' AS DateTime), N'超级管理员', NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (74, N'一对一(多)', N'[{"text":"查询","value":"Search"}]', N'ios-color-filter', NULL, 1, 1770, N'/', 0, N'/', CAST(N'2019-08-22T17:43:58.000' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:02:15.757' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (75, N'主从一对一(1)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 1000, N'SellOrder', 74, N'/SellOrder', CAST(N'2019-08-22T18:12:43.000' AS DateTime), N'超级管理员', CAST(N'2021-03-14T22:21:06.567' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (77, N'表单只读', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 600, N'表单只读', 56, N'/form7', CAST(N'2019-08-26T11:58:55.000' AS DateTime), N'超级管理员', CAST(N'2019-09-20T13:59:13.000' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (84, N'文件上传', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'ios-folder-open', NULL, 1, 1700, N'文件上传', 0, N'/', CAST(N'2019-11-11T12:59:02.637' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:03:11.747' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (85, N'基本文件上传', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1000, N'基本文件上传', 84, N'/volUploadExample', CAST(N'2019-11-20T18:03:07.417' AS DateTime), N'超级管理员', CAST(N'2019-12-17T11:18:34.193' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (86, N'后台校验', N'[{"text":"查询","value":"Search"}]', N'logo-rss', NULL, 1, 1700, N'/', 0, N'', CAST(N'2019-11-22T11:17:21.897' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:02:57.747' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (87, N'KindEditor编辑器', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1000, N'KindEditor编辑器', 66, N'/kindEditor', CAST(N'2019-12-19T11:37:30.843' AS DateTime), N'超级管理员', CAST(N'2019-12-23T10:01:38.163' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (88, N'静态页面列表', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 900, N'htmlList', 66, N'/htmlList', CAST(N'2019-12-22T14:31:21.500' AS DateTime), N'超级管理员', CAST(N'2019-12-23T10:01:42.770' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (89, N'后台参数校验', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1700, N'.', 86, N'/validator', CAST(N'2020-02-02T17:00:05.203' AS DateTime), N'超级管理员', CAST(N'2020-02-02T17:00:49.313' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (90, N'从表图片上传', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'vSellOrderImg', 74, N'/vSellOrderImg', CAST(N'2020-04-07T20:41:33.930' AS DateTime), N'超级管理员', CAST(N'2020-04-03T21:58:21.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (91, N'数字排版', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'数字排版', 32, N'/flex', CAST(N'2020-04-07T21:51:38.487' AS DateTime), N'超级管理员', CAST(N'2019-11-09T18:23:53.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (92, N'树形菜单', N'[{"text":"查询","value":"Search"}]', N'md-analytics', NULL, 1, 1705, N'树形菜单与表', 0, N'', CAST(N'2020-04-26T14:19:01.283' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:02:49.300' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (93, N'tree与代码生成页面', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 1000, N'tree与代码生成页面', 92, N'treetable1', CAST(N'2020-04-26T14:20:35.840' AS DateTime), N'超级管理员', CAST(N'2020-04-26T14:19:51.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (94, N'tree与自定义table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'treetable2', 92, N'/treetable2', CAST(N'2020-04-26T18:12:46.497' AS DateTime), N'超级管理员', CAST(N'2020-04-26T14:19:51.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (95, N'放此节点下', N'', N'', NULL, 1, 1, N'/', 45, N'', CAST(N'2020-05-05T13:20:30.740' AS DateTime), N'超级管理员', CAST(N'2019-09-20T09:54:26.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (96, N'默认编辑器', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"}]', N'', NULL, 1, 0, N'App_NewsEditor', 48, N'/App_NewsEditor', CAST(N'2021-01-16T10:57:44.280' AS DateTime), N'超级管理员', CAST(N'2019-11-17T19:10:37.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (97, N'多列数据合并显示', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 0, N'App_Expert2', 48, N'/App_Expert2', CAST(N'2021-03-06T15:51:13.727' AS DateTime), N'超级管理员', CAST(N'2021-03-06T17:40:53.333' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (98, N'主从一对一(2)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 990, N'SellOrder2', 74, N'/SellOrder2', CAST(N'2021-03-14T22:20:12.583' AS DateTime), N'超级管理员', CAST(N'2021-03-14T22:21:13.203' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (99, N'主从一对多(3)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 980, N'SellOrder3', 74, N'/SellOrder3', CAST(N'2021-03-14T22:42:48.537' AS DateTime), N'超级管理员', CAST(N'2021-03-14T22:21:13.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (100, N'表格编辑', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'App_Transaction2', 48, N'/App_Transaction2', CAST(N'2021-03-19T22:35:06.357' AS DateTime), N'超级管理员', CAST(N'2019-10-31T10:09:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (101, N'table编辑(2)', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'table3', 33, N'/table3', CAST(N'2021-03-20T12:58:52.953' AS DateTime), N'超级管理员', CAST(N'2019-11-10T14:25:09.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (104, N'角色管理(tree)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 0, N'Sys_Role1', 2, N'/Sys_Role1', CAST(N'2021-05-02T13:41:35.287' AS DateTime), N'超级管理员', CAST(N'2019-08-15T10:27:41.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (105, N'tree自定义table数据', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'/treetable2', 92, N'/treetable2', CAST(N'2021-05-02T15:06:12.423' AS DateTime), N'超级管理员', CAST(N'2021-05-02T15:05:15.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (106, N'表单设计', N'[{"text":"查询","value":"Search"}]', N'el-icon-s-operation', NULL, 1, 3000, N'.', 0, N'', CAST(N'2021-08-28T00:39:03.907' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:03:34.563' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (107, N'表单设计', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 100, N'.', 106, N'/formDraggable', CAST(N'2021-08-28T00:40:00.293' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:01:45.043' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (109, N'表单配置', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 0, N'FormDesignOptions', 106, N'/FormDesignOptions', CAST(N'2021-12-29T23:27:28.453' AS DateTime), N'超级管理员', CAST(N'2022-01-03T19:03:57.537' AS DateTime), N'超级管理员')
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) VALUES (110, N'数据采集', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'.', 106, N'/formCollectionResultTree', CAST(N'2021-12-29T23:28:44.173' AS DateTime), N'超级管理员', CAST(N'2021-12-30T23:11:50.513' AS DateTime), N'超级管理员')
GO
SET IDENTITY_INSERT [dbo].[Sys_Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Province] ON 
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (1, N'110000', N'北京市', N'华北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (2, N'120000', N'天津市', N'华北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (3, N'130000', N'河北省', N'华北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (4, N'140000', N'山西省', N'华北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (5, N'150000', N'内蒙古自治区', N'华北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (6, N'210000', N'辽宁省', N'东北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (7, N'220000', N'吉林省', N'东北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (8, N'230000', N'黑龙江省', N'东北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (9, N'310000', N'上海市', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (10, N'320000', N'江苏省', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (11, N'330000', N'浙江省', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (12, N'340000', N'安徽省', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (13, N'350000', N'福建省', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (14, N'360000', N'江西省', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (15, N'370000', N'山东省', N'华东')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (16, N'410000', N'河南省', N'华中')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (17, N'420000', N'湖北省', N'华中')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (18, N'430000', N'湖南省', N'华中')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (19, N'440000', N'广东省', N'华南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (20, N'450000', N'广西壮族自治区', N'华南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (21, N'460000', N'海南省', N'华南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (22, N'500000', N'重庆市', N'西南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (23, N'510000', N'四川省', N'西南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (24, N'520000', N'贵州省', N'西南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (25, N'530000', N'云南省', N'西南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (26, N'540000', N'西藏自治区', N'西南')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (27, N'610000', N'陕西省', N'西北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (28, N'620000', N'甘肃省', N'西北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (29, N'630000', N'青海省', N'西北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (30, N'640000', N'宁夏回族自治区', N'西北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (31, N'650000', N'新疆维吾尔自治区', N'西北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (32, N'710000', N'台湾省', N'港澳台')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (33, N'810000', N'香港特别行政区', N'港澳台')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (34, N'820000', N'澳门特别行政区', N'港澳台')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (35, N'thd', N'桃花岛', N'东北')
GO
INSERT [dbo].[Sys_Province] ([ProvinceId], [ProvinceCode], [ProvinceName], [RegionCode]) VALUES (43, N'测试1', N'测试1', N'港澳台')
GO
SET IDENTITY_INSERT [dbo].[Sys_Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Role] ON 
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (1, CAST(N'2018-08-23T11:46:06.000' AS DateTime), N'超级管理员', NULL, N'无', 0, 1, N'测试超级管理员', CAST(N'2018-09-06T17:08:35.000' AS DateTime), 1000, 0, N'超级管理员')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (2, CAST(N'2018-08-23T11:46:52.000' AS DateTime), N'超级管理员', NULL, N'1', 0, 1, N'超级管理员', CAST(N'2019-12-08T21:30:10.000' AS DateTime), NULL, 1, N'测试管理员')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (3, CAST(N'2018-08-23T11:47:10.000' AS DateTime), N'超级管理员', NULL, N'无', 0, 0, N'超级管理员', CAST(N'2019-12-08T22:03:31.000' AS DateTime), NULL, 2, N'小编x')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (4, CAST(N'2018-08-23T11:47:41.000' AS DateTime), N'超级管理员', NULL, N'无  ', 0, 1, N'超级管理员', CAST(N'2019-12-08T21:11:11.000' AS DateTime), NULL, 2, N'信息员')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (5, CAST(N'2019-05-30T10:59:13.000' AS DateTime), N'超级管理员', NULL, N'还没想好', NULL, 1, N'超级管理员', CAST(N'2019-12-08T21:14:23.000' AS DateTime), NULL, 1, N'主管')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (7, CAST(N'2019-11-20T18:00:18.000' AS DateTime), N'超级管理员', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2019-12-08T21:29:38.000' AS DateTime), NULL, 1, N'测试')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (13, CAST(N'2020-01-12T19:11:10.000' AS DateTime), N'超级管理员', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2020-04-26T17:26:35.000' AS DateTime), NULL, 2, N'测试1')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (14, CAST(N'2020-01-12T19:11:17.000' AS DateTime), N'超级管理员', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2020-04-26T17:24:57.000' AS DateTime), NULL, 2, N'测试2')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (15, CAST(N'2020-01-12T19:11:23.000' AS DateTime), N'超级管理员', NULL, NULL, NULL, 1, N'', NULL, NULL, 1, N'测试3')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (16, CAST(N'2020-01-12T19:11:30.000' AS DateTime), N'超级管理员', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2020-11-20T23:08:13.000' AS DateTime), NULL, 17, N'测试4')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (17, CAST(N'2020-01-12T19:11:37.000' AS DateTime), N'超级管理员', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2020-04-26T17:41:01.000' AS DateTime), NULL, 13, N'测试5')
GO
SET IDENTITY_INSERT [dbo].[Sys_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_RoleAuth] ON 
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (1, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 9, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (2, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 53, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (3, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 50, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (4, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 40, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (5, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 3, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (6, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 37, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (7, N'Search,Add,Delete,Update,Export,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 51, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (8, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 59, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (9, N'Search,Add,Delete,Update', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 13, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (10, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 44, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (11, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 24, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (12, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 35, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (13, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 60, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (14, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 58, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (15, N'Search,Add,Delete,Update,Export,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 68, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (16, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 52, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (17, N'Search,Add,Delete,Update', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 65, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (18, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 62, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (19, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 63, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (20, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 54, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (21, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 94, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (22, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 42, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (23, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 34, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (24, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 90, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (25, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 67, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (26, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 91, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (27, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 36, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (28, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 77, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (29, N'Search,Delete,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 6, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (30, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 88, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (31, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 61, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (32, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 8, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (33, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 48, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (34, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 74, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (35, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 56, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (36, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 55, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (37, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 32, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (38, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 33, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (39, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 92, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (40, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 89, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (41, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 86, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (42, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 84, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (43, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 29, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (44, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 31, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (45, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 72, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (46, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 66, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (47, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 28, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (48, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 64, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (49, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 5, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (50, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 25, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (51, N'Search,Add,Delete,Update', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 93, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (52, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 85, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (53, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 75, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (54, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 87, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (55, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 57, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (56, N'Search,Export,test', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 49, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (57, N'Search,Update', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 71, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (58, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 2, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (59, N'Search', CAST(N'2020-05-05T13:23:11.197' AS DateTime), N'超级管理员', 73, N'超级管理员', CAST(N'2020-05-05T13:23:11.197' AS DateTime), 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_RoleAuth] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] ON 
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (20, NULL, NULL, NULL, NULL, N'角色ID', N'Role_Id', N'int', 70, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2019-12-22T14:16:42.287' AS DateTime), 1, 1420, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (21, NULL, NULL, NULL, NULL, N'父级ID', N'ParentId', N'int', 70, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2019-12-22T14:16:42.287' AS DateTime), 1, 1410, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (22, NULL, NULL, NULL, NULL, N'角色名称', N'RoleName', N'string', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2019-12-22T14:16:42.287' AS DateTime), 1, 1400, N'', NULL, 1, N'text', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (23, NULL, NULL, NULL, NULL, N'部门ID', N'Dept_Id', N'int', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-12-22T14:16:42.287' AS DateTime), 1, 1390, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (24, NULL, NULL, NULL, NULL, N'部门名称', N'DeptName', N'string', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 2, N'', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2019-12-22T14:16:42.287' AS DateTime), 1, 1380, N'', NULL, 1, N'text', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (25, NULL, NULL, NULL, NULL, N'排序', N'OrderNo', N'int', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1370, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (26, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 4, N'', NULL, 1, 1, NULL, 0, 1, 1, 100, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1360, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (27, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 4, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1350, N'', NULL, 2, N'datetime', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (28, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 5, N'', NULL, 1, 1, NULL, 0, 1, 1, 100, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1340, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (29, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 5, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1330, N'', NULL, 2, N'datetime', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (30, NULL, NULL, NULL, NULL, N'', N'DeleteBy', N'string', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 0, 0, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1320, N'', NULL, NULL, N'', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (31, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, N'', CAST(N'2018-06-04T10:14:21.000' AS DateTime), NULL, NULL, N'enable', NULL, 2, N'switch', NULL, 1, 1, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2019-12-22T14:16:42.290' AS DateTime), 1, 1375, N'', NULL, 1, N'select', NULL, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (32, NULL, NULL, NULL, NULL, N'字典ID', N'Dic_ID', N'int', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-04-25T11:15:33.197' AS DateTime), 1, 1300, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (33, NULL, NULL, NULL, NULL, N'字典名称', N'DicName', N'string', 140, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1290, NULL, NULL, 1, N'textarea', NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (34, NULL, NULL, NULL, NULL, N'父级ID', N'ParentId', N'int', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1280, NULL, NULL, 1, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (35, NULL, NULL, NULL, NULL, N'配置项', N'Config', N'string', 300, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1270, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (36, NULL, NULL, NULL, 8, N'sql语句', N'DbSql', N'string', 200, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 6, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1260, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (37, NULL, NULL, NULL, NULL, N'DBServer', N'DBServer', N'string', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1250, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (38, NULL, NULL, NULL, NULL, N'排序号', N'OrderNo', N'int', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1240, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (39, NULL, NULL, NULL, NULL, N'字典编号', N'DicNo', N'string', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2020-04-25T11:15:33.260' AS DateTime), 1, 1295, NULL, NULL, 1, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (40, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 6, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 4000, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1220, NULL, NULL, NULL, N'无', NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (41, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, N'enable', NULL, 2, N'select', NULL, 1, 1, NULL, 0, 0, 0, 1, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1210, NULL, NULL, 2, N'select', NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (42, NULL, NULL, NULL, NULL, NULL, N'CreateID', N'int', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (43, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1190, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (44, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 2, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1180, NULL, NULL, 2, N'datetime', NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (45, NULL, NULL, NULL, NULL, NULL, N'ModifyID', N'int', 90, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1170, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (46, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1160, NULL, NULL, NULL, NULL, NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (47, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2018-06-06T14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-04-25T11:15:33.263' AS DateTime), 1, 1150, NULL, NULL, 2, N'datetime', NULL, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (48, NULL, NULL, NULL, NULL, N'', N'DicList_ID', N'int', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1140, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (49, NULL, NULL, NULL, NULL, N'数据源ID', N'Dic_ID', N'int', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 1, NULL, 0, 1, 1, 4, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1130, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (50, NULL, NULL, NULL, NULL, N'数据源Value', N'DicValue', N'string', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1120, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (51, NULL, NULL, NULL, NULL, N'数据源Text', N'DicName', N'string', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1110, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (52, NULL, NULL, NULL, NULL, N'排序号', N'OrderNo', N'int', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1100, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (53, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1090, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (54, NULL, NULL, NULL, NULL, N'是否可用', N'Enable', N'byte', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'enable', NULL, 1, N'switch', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1080, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (55, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'无', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1070, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (56, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1060, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (57, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1050, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (58, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1040, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (59, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1030, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (60, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, N'', CAST(N'2018-06-06T14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2019-08-20T10:08:56.000' AS DateTime), 1, 1020, N'', NULL, NULL, N'', NULL, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (61, NULL, NULL, NULL, NULL, NULL, N'Id', N'int', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-03-02T20:10:13.143' AS DateTime), 1, 10000, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (62, NULL, NULL, NULL, 12, N'日志类型', N'LogType', N'string', 80, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, N'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2020-03-02T20:10:13.143' AS DateTime), 1, 8888, NULL, NULL, 3, N'checkbox', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (63, NULL, NULL, NULL, NULL, N'请求参数', N'RequestParameter', N'string', 70, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7990, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (64, NULL, NULL, NULL, NULL, N'响应参数', N'ResponseParameter', N'string', 70, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7980, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (65, NULL, NULL, NULL, NULL, N'异常信息', N'ExceptionInfo', N'string', 70, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7970, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (66, NULL, NULL, NULL, NULL, N'响应状态', N'Success', N'int', 80, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, N'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 8700, NULL, NULL, 2, N'selectList', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (67, NULL, NULL, NULL, NULL, N'开始时间', N'BeginDate', N'DateTime', 140, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2020-03-02T20:10:13.143' AS DateTime), 1, 9999, NULL, NULL, 2, N'datetime', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (68, NULL, NULL, NULL, NULL, N'结束时间', N'EndDate', N'DateTime', 150, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 880, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (69, NULL, NULL, NULL, NULL, N'时长', N'ElapsedTime', N'int', 60, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 8600, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (70, NULL, NULL, NULL, NULL, N'用户IP', N'UserIP', N'string', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7920, NULL, NULL, 1, N'text', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (71, NULL, NULL, NULL, NULL, N'服务器IP', N'ServiceIP', N'string', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7910, NULL, NULL, 1, N'text', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (72, NULL, NULL, NULL, NULL, N'浏览器类型', N'BrowserType', N'string', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7900, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (73, NULL, NULL, NULL, NULL, N'请求地址', N'Url', N'string', 110, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2020-03-02T20:10:13.143' AS DateTime), 1, 9000, NULL, NULL, 1, N'text', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (74, NULL, NULL, NULL, NULL, N'用户ID', N'User_Id', N'int', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7880, NULL, NULL, NULL, N'text', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (75, NULL, NULL, NULL, NULL, N'用户名称', N'UserName', N'string', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2020-03-02T20:10:13.143' AS DateTime), 1, 9100, NULL, NULL, NULL, NULL, NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (76, NULL, NULL, NULL, NULL, N'角色ID', N'Role_Id', N'int', 90, NULL, CAST(N'2018-06-11T18:22:16.000' AS DateTime), NULL, NULL, N'roles', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-02T20:10:13.147' AS DateTime), 1, 7860, NULL, NULL, 2, N'select', NULL, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (77, NULL, NULL, NULL, NULL, N'', N'User_Id', N'int', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 1, 0, 1, 4, N'zs', CAST(N'2020-05-01T16:36:53.830' AS DateTime), 3362, 7850, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (78, NULL, NULL, NULL, NULL, N'', N'Dept_Id', N'int', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7840, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (79, 0, NULL, 1, NULL, N'部门', N'DeptName', N'string', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 300, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7830, N'', NULL, 2, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (80, 0, 0, 1, NULL, N'角色', N'Role_Id', N'int', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'roles', NULL, 2, N'select', NULL, 1, 1, NULL, 0, 0, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7820, N'', NULL, 2, N'select', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (81, NULL, NULL, NULL, NULL, N'', N'RoleName', N'string', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 0, 0, 300, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7810, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (82, 1, 0, 1, NULL, N'帐号', N'UserName', N'string', 120, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 0, 1, 200, N'zs', CAST(N'2020-05-01T16:36:53.767' AS DateTime), 3362, 7945, N'', NULL, 1, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (83, 1, 0, NULL, NULL, N'密码', N'UserPwd', N'string', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 0, 0, NULL, 0, 1, 0, 400, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7790, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (84, NULL, NULL, NULL, NULL, N'真实姓名', N'UserTrueName', N'string', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 0, 0, 40, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7792, N'', NULL, 1, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (85, NULL, NULL, NULL, NULL, N'地址', N'Address', N'string', 190, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 400, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7270, N'', NULL, 4, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (86, NULL, NULL, NULL, NULL, N'电话', N'Mobile', N'string', 140, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 200, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7260, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (87, NULL, NULL, NULL, NULL, N'Email', N'Email', N'string', 140, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'mail', NULL, 1, 0, NULL, 0, 1, 0, 200, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7250, N'', NULL, 4, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (88, NULL, NULL, NULL, NULL, N'', N'Tel', N'string', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 40, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7740, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (89, NULL, NULL, NULL, 12, N'备注', N'Remark', N'string', 180, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 7, N'textarea', NULL, 1, 0, NULL, 0, 1, 0, 400, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7230, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (90, NULL, NULL, NULL, NULL, N'排序号', N'OrderNo', N'int', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7220, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (91, NULL, NULL, NULL, NULL, N'是否可用', N'Enable', N'byte', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'enable', NULL, 4, N'select', NULL, 1, 1, NULL, 0, 0, 0, 1, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7670, N'', NULL, 4, N'select', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (92, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7700, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (93, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 6, N'', NULL, 1, 1, NULL, 0, 1, 1, 400, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7690, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (94, NULL, NULL, NULL, NULL, N'注册时间', N'CreateDate', N'DateTime', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 6, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7780, N'', NULL, 5, N'datetime', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (95, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7670, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (96, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 1, 400, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7660, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (97, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7650, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (98, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'audit', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7640, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (99, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 90, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 400, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7630, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (100, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7620, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (101, NULL, NULL, NULL, NULL, N'最后登陆时间', N'LastLoginDate', N'DateTime', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7610, N'', NULL, 5, N'datetime', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (102, NULL, NULL, NULL, NULL, N'最后密码修改时间', N'LastModifyPwdDate', N'DateTime', 150, N'', CAST(N'2018-06-14T16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'zs', CAST(N'2020-05-01T16:36:53.837' AS DateTime), 3362, 7600, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (114, NULL, NULL, NULL, NULL, N'头像', N'HeadImageUrl', N'string', 150, N'', NULL, NULL, NULL, N'', NULL, 9, N'img', NULL, 1, 1, 1, NULL, NULL, 0, 400, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7842, N'', NULL, NULL, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (142, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8570, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (143, NULL, NULL, NULL, 12, N'品种', N'Variety', N'string', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, N'pz', NULL, 1, N'checkbox', NULL, 1, 1, NULL, 0, 0, 0, 20, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8560, NULL, NULL, 1, N'select', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (144, NULL, NULL, NULL, 12, N'月龄', N'AgeRange', N'string', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, N'age', NULL, 10, N'select', NULL, 1, 1, NULL, 0, 0, 0, 50, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8561, NULL, NULL, 1, N'select', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (145, NULL, NULL, NULL, 12, N'城市', N'City', N'string', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, N'city', NULL, 15, N'select', NULL, 1, 1, NULL, 0, 0, 0, 15, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8540, NULL, NULL, 1, N'select', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (146, NULL, NULL, NULL, 12, N'成交均价', N'AvgPrice', N'decimal', 80, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 20, NULL, NULL, 1, 1, NULL, 0, 0, 0, 9, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8530, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (147, NULL, NULL, NULL, 12, N'成交日期', N'Date', N'DateTime', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 25, N'date', NULL, 1, 1, NULL, 0, 0, 0, 3, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8520, NULL, NULL, 2, N'datetime', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (148, NULL, NULL, NULL, NULL, N'远程', N'Enable', N'byte', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, N'enable', NULL, NULL, N'selectList', NULL, 1, 0, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8510, NULL, NULL, 2, N'selectList', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (149, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8500, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (150, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8490, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (151, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8480, NULL, NULL, NULL, N'datetime', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (152, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8470, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (153, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8460, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (154, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2018-07-10T13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8450, NULL, NULL, NULL, NULL, NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (155, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-03-27T22:23:07.033' AS DateTime), 1, 8440, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (156, NULL, NULL, NULL, NULL, N'品种', N'Variety', N'string', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, N'pz', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 40, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8430, NULL, NULL, 1, N'select', NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (157, NULL, NULL, NULL, NULL, N'月龄', N'Age', N'string', 100, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, N'age', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8420, NULL, NULL, 1, N'select', NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (158, NULL, NULL, NULL, NULL, N'城市', N'City', N'string', 120, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, N'city', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 30, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8410, NULL, NULL, 1, N'select', NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (159, NULL, NULL, NULL, NULL, N'价格', N'Price', N'decimal', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 2, N'decimal', NULL, 1, 1, NULL, 0, 0, 0, 9, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8400, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (160, 0, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, N'audit', NULL, NULL, N'select', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8382, NULL, NULL, 2, N'select', NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (161, NULL, NULL, NULL, NULL, N'审核人Id', N'AuditId', N'int', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8380, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (162, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 40, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8370, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (163, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, N'enable', NULL, 2, N'switch', NULL, 1, 1, NULL, 0, 1, 1, 1, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8360, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (164, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8350, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (165, NULL, NULL, NULL, NULL, N'上报人', N'Creator', N'string', 100, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 0, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8388, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (166, NULL, 0, NULL, NULL, N'上报时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 5, N'datetime', NULL, 1, 0, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8387, NULL, NULL, 2, N'datetime', NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (167, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8320, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (168, NULL, NULL, NULL, 12, N'测试', N'Modifier', N'string', 100, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8310, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (169, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2018-07-10T15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 5, N'无', NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8300, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (170, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'超级管理员', CAST(N'2020-03-27T22:23:07.127' AS DateTime), 1, 8381, NULL, NULL, NULL, NULL, NULL, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (193, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 90, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2019-11-15T13:45:33.503' AS DateTime), 1, 8060, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (194, NULL, NULL, NULL, NULL, N'姓名', N'Name', N'string', 120, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, N'超级管理员', CAST(N'2019-11-15T13:45:33.503' AS DateTime), 1, 8050, NULL, NULL, 1, N'text', NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (195, NULL, NULL, NULL, NULL, N'电话', N'PhoneNo', N'string', 150, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, 50, N'phone', NULL, 1, 1, NULL, 0, 0, 0, 15, N'超级管理员', CAST(N'2019-11-15T13:45:33.503' AS DateTime), 1, 8040, NULL, NULL, 1, N'text', NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (196, NULL, NULL, NULL, NULL, N'数量', N'Quantity', N'int', 90, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 8030, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (197, NULL, NULL, NULL, NULL, N'购买类型', N'CowType', N'string', 90, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, N'nav', NULL, 30, N'select', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 8020, NULL, NULL, 2, N'selectList', NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (198, NULL, NULL, NULL, NULL, N'描述', N'Describe', N'string', 190, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, 60, N'textarea', NULL, 1, 1, NULL, 0, 0, 0, 500, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 8010, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (199, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 8000, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (200, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 90, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 7990, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (201, NULL, NULL, NULL, NULL, N'提交人', N'Creator', N'string', 130, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 7980, NULL, NULL, 2, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (202, NULL, NULL, NULL, NULL, N'提交时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 7970, NULL, NULL, 2, N'datetime', NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (203, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 90, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2019-11-15T13:45:33.510' AS DateTime), 1, 7960, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (204, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2019-11-15T13:45:33.510' AS DateTime), 1, 7950, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (205, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2018-07-10T15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2019-11-15T13:45:33.510' AS DateTime), 1, 7940, NULL, NULL, NULL, NULL, NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (206, 1, 1, 0, NULL, N'主键ID', N'ExpertId', N'int', 80, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-03-23T18:50:56.547' AS DateTime), 1, 7930, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (207, NULL, NULL, NULL, NULL, N'名称', N'ExpertName', N'string', 120, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2020-03-23T18:50:56.620' AS DateTime), 1, 7920, N'', NULL, 1, N'like', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (208, NULL, NULL, NULL, NULL, N'真实姓名', N'ReallyName', N'string', 150, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7910, N'', NULL, 1, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (209, NULL, NULL, NULL, NULL, N'身份证号', N'IDNumber', N'string', 200, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 18, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7900, N'', NULL, 1, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (210, NULL, NULL, NULL, NULL, N'头像', N'HeadImageUrl', N'string', 150, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 10, N'img', NULL, 1, 1, 1, 0, 1, 0, 500, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7920, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (211, NULL, NULL, NULL, NULL, N'学历', N'Education', N'string', 120, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7880, N'', NULL, 2, N'text', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (212, NULL, NULL, NULL, NULL, N'职业', N'Professional', N'string', 120, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7870, N'', NULL, 2, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (213, NULL, NULL, NULL, NULL, N'所在公司', N'Company', N'string', 150, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7860, N'', NULL, 2, N'无', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (214, NULL, NULL, NULL, NULL, N'地区', N'City', N'string', 100, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'city', NULL, 3, N'select', NULL, 1, 1, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7850, N'', NULL, 3, N'selectList', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (215, NULL, NULL, NULL, NULL, N'擅长领域', N'SpecialField', N'string', 120, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'textarea', NULL, 0, 1, NULL, 0, 1, 0, 800, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7840, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (216, NULL, NULL, NULL, 12, N'个人简介', N'Resume', N'string', 150, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 7, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7830, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (217, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 120, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'audit', NULL, 0, N'select', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7919, N'', NULL, 3, N'selectList', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (218, NULL, NULL, NULL, NULL, N'审核人Id', N'AuditId', N'int', 80, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7810, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (219, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 150, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7919, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (220, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 150, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'datetime', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7790, N'', NULL, 3, N'datetime', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (221, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'enable', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 1, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7919, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (222, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 80, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7770, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (223, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7760, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (224, NULL, NULL, NULL, NULL, N'申请时间', N'CreateDate', N'DateTime', 130, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 3, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7750, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (225, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 80, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7740, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (226, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7730, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (227, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 130, N'', CAST(N'2018-07-10T15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7720, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (308, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 80, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-01-06T11:21:07.177' AS DateTime), 1, 6910, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (309, NULL, NULL, NULL, 12, N'标题', N'Title', N'string', 250, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6900, NULL, NULL, 1, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (310, NULL, NULL, NULL, NULL, N'发布人', N'Author', N'string', 120, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 100, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6890, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (311, 0, NULL, NULL, NULL, N'发布时间', N'ReleaseDate', N'DateTime', 150, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6880, NULL, NULL, 3, N'datetime', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (312, NULL, NULL, NULL, 12, N'封面图片', N'ImageUrl', N'string', 220, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6870, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (313, NULL, NULL, NULL, NULL, N'图片(大图)', N'BigImageUrls', N'string', 220, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6860, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (314, NULL, NULL, NULL, 12, N'新闻地址', N'DetailUrl', N'string', 90, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6850, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (315, NULL, NULL, NULL, NULL, N'浏览次数', N'ViewCount', N'int', 110, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6840, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (316, NULL, NULL, NULL, NULL, N'新闻类型', N'NewsType', N'int', 110, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, N'news', 1, 3, N'select', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6830, NULL, NULL, 1, N'select', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (317, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'int', 90, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, N'enable', NULL, 7, N'select', NULL, 1, 1, NULL, 0, 1, 0, 2, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6820, NULL, NULL, 3, N'select', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (318, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 80, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6810, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (319, NULL, NULL, NULL, NULL, N'发布人', N'Creator', N'string', 130, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6800, NULL, NULL, 3, N'无', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (320, NULL, NULL, NULL, NULL, N'发布时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6790, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (321, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 80, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6780, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (322, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6770, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (323, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2018-07-10T16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6760, NULL, NULL, NULL, N'datetime', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (324, NULL, NULL, NULL, 12, N'新闻内容', N'Content', N'string', 300, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 1, 0, NULL, NULL, 1, 0, 0, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6896, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (429, 1, 0, NULL, NULL, N'手机号', N'PhoneNo', N'string', 150, N'', NULL, NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, NULL, NULL, 0, 22, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7760, N'', NULL, 3, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (431, NULL, NULL, NULL, NULL, N'Token', N'Token', N'string', 180, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 1000, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7810, N'', NULL, 2, N'', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (446, NULL, NULL, NULL, 12, N'测试', N'IsTop', N'int', 90, NULL, NULL, NULL, NULL, N'enable', NULL, 30, N'select', NULL, 1, 1, NULL, NULL, 0, 0, NULL, N'超级管理员', CAST(N'2020-05-03T11:25:45.673' AS DateTime), 1, 8515, NULL, NULL, 2, N'select', NULL, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (457, NULL, NULL, NULL, NULL, N'是否买入', N'TransactionType', N'int', 120, NULL, NULL, NULL, NULL, N'cq', NULL, 20, N'select', NULL, 1, 1, NULL, NULL, NULL, 0, 8, N'超级管理员', CAST(N'2019-11-15T13:45:33.507' AS DateTime), 1, 8021, NULL, NULL, 1, N'select', NULL, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (506, NULL, NULL, NULL, NULL, N'性别', N'Gender', N'int', 100, N'', NULL, NULL, NULL, N'gender', NULL, 4, N'select', NULL, 1, 1, NULL, NULL, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.830' AS DateTime), 3362, 7843, N'', NULL, 1, N'select', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (523, NULL, NULL, NULL, NULL, N'电话', N'PhoneNo', N'string', 150, N'', NULL, NULL, NULL, N'', NULL, NULL, N'phone', NULL, 1, 0, NULL, NULL, 1, 0, 11, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7900, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (550, NULL, NULL, NULL, NULL, N'申请人帐号Id', N'User_Id', N'int', 90, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 8, N'超级管理员', CAST(N'2020-03-23T18:50:56.620' AS DateTime), 1, 7921, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (551, NULL, NULL, NULL, NULL, N'帐号', N'UserName', N'string', 120, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 30, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7920, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (552, NULL, NULL, NULL, NULL, N'申请人', N'UserTrueName', N'string', 100, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 50, N'超级管理员', CAST(N'2020-03-23T18:50:56.623' AS DateTime), 1, 7920, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (603, NULL, NULL, NULL, NULL, N'资质证书', N' Certificate', N'string', 200, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 0, 0, 1, NULL, 1, 0, 2500, N'超级管理员', CAST(N'2020-03-23T18:50:56.627' AS DateTime), 1, 7828, N'', NULL, NULL, N'', NULL, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (654, NULL, NULL, NULL, NULL, N'登陆设备类型', N'AppType', N'int', 150, N'', NULL, NULL, NULL, N'ut', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7809, N'', NULL, 3, N'selectList', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (659, NULL, NULL, NULL, NULL, N'手机用户', N'IsRegregisterPhone', N'int', 120, N'', NULL, NULL, NULL, N'isphone', NULL, 2, N'select', NULL, 1, 0, NULL, NULL, 0, 0, 4, N'zs', CAST(N'2020-05-01T16:36:53.833' AS DateTime), 3362, 7771, N'', NULL, 3, N'select', NULL, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (663, NULL, NULL, NULL, NULL, N'是否今日推荐', N'DailyRecommend', N'int', 120, NULL, NULL, NULL, NULL, N'dr', NULL, 5, N'select', NULL, 1, 1, NULL, NULL, 0, 0, 2, N'超级管理员', CAST(N'2020-01-06T11:21:07.290' AS DateTime), 1, 6825, NULL, NULL, 1, N'select', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (664, NULL, NULL, NULL, NULL, N'推荐排序', N'OrderNo', N'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06T11:21:07.293' AS DateTime), 1, 6822, NULL, NULL, NULL, N'无', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (714, NULL, NULL, NULL, NULL, N'Id', N'Order_Id', N'string', 90, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, N'超级管理员', CAST(N'2019-12-31T13:21:18.797' AS DateTime), 1, 2850, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (715, NULL, NULL, NULL, NULL, N'订单类型', N'OrderType', N'int', 90, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', N'ordertype', 1, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2840, NULL, 1, 1, N'select', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (716, NULL, NULL, NULL, NULL, N'运单号', N'TranNo', N'string', 150, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2830, NULL, NULL, 1, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (717, NULL, NULL, NULL, NULL, N'销售订单号', N'SellNo', N'string', 200, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 2, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2820, NULL, NULL, 1, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (718, NULL, NULL, NULL, NULL, N'销售数量', N'Qty', N'int', 90, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 2, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2810, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (719, NULL, NULL, NULL, 8, N'备注', N'Remark', N'string', 100, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2800, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (720, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2790, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (721, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 100, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 255, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2780, NULL, NULL, 3, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (722, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2770, NULL, NULL, 3, N'datetime', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (723, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2760, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (724, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 4, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 255, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2750, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (725, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2019-08-22T17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 4, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2740, NULL, NULL, 3, N'datetime', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (726, NULL, NULL, NULL, NULL, N'', N'OrderList_Id', N'string', 90, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 0, 36, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2730, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (727, NULL, NULL, NULL, NULL, N'订单Id', N'Order_Id', N'string', 90, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 1, 36, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2720, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (728, NULL, NULL, NULL, NULL, N'商品名称', N'ProductName', N'string', 150, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', N'pn', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2710, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (729, NULL, NULL, NULL, NULL, N'批次', N'MO', N'string', 100, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2700, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (730, NULL, NULL, NULL, NULL, N'数量', N'Qty', N'int', 90, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2690, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (731, NULL, NULL, NULL, NULL, N'重量', N'Weight', N'decimal', 90, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2680, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (732, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 120, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2670, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (733, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2660, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (734, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2650, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (735, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2640, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (736, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2630, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (737, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2620, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (738, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2019-08-28T09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19T14:54:58.000' AS DateTime), 1, 2610, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (739, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 120, NULL, CAST(N'2019-08-28T09:32:29.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2805, NULL, NULL, 2, N'datetime', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (740, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', NULL, NULL, CAST(N'2019-08-28T09:32:29.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 100, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2803, NULL, NULL, 2, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (741, NULL, NULL, NULL, NULL, N'审核人Id', N'AuditId', N'int', NULL, NULL, CAST(N'2019-08-28T09:32:29.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.887' AS DateTime), 1, 2801, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (742, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', NULL, NULL, CAST(N'2019-08-28T09:32:29.000' AS DateTime), 1, N'超级管理员', N'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 0, NULL, N'超级管理员', CAST(N'2019-12-31T13:21:18.883' AS DateTime), 1, 2808, NULL, NULL, 2, N'select', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (743, NULL, NULL, NULL, NULL, N'', N'Id', N'string', 90, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 5, 1, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2560, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (744, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 120, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2550, NULL, NULL, 1, N'datetime', NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (745, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2540, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (746, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2530, NULL, NULL, 1, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (747, NULL, NULL, NULL, NULL, N'描述', N'Describe', N'string', 180, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 250, N'超级管理员', CAST(N'2019-12-06T20:31:39.377' AS DateTime), 1, 3490, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (748, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2510, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (749, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 1, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2500, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (750, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 2490, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (751, NULL, NULL, NULL, NULL, N'姓名', N'Name', N'string', 100, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 1, 50, N'超级管理员', CAST(N'2019-12-06T20:31:39.353' AS DateTime), 1, 3500, NULL, NULL, 1, N'like', NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (752, NULL, NULL, NULL, NULL, N'电话', N'PhoneNo', N'string', 130, NULL, CAST(N'2019-09-18T15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 15, N'超级管理员', CAST(N'2019-12-06T20:31:39.387' AS DateTime), 1, 3470, NULL, NULL, 1, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (753, NULL, NULL, NULL, NULL, N'', N'FormId', N'guid', 110, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (754, NULL, NULL, NULL, NULL, N'表单名称', N'Title', N'string', 140, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, 0, 1, N'textarea', NULL, 1, 1, NULL, 0, 0, 0, 1000, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 1100, NULL, NULL, 1, N'like', 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (755, NULL, NULL, NULL, NULL, N'设计器配置', N'DaraggeOptions', N'string', 140, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (756, NULL, NULL, NULL, NULL, N'表单参数', N'FormOptions', N'string', 140, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (757, NULL, NULL, NULL, NULL, N'表单配置', N'FormConfig', N'string', 110, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (758, NULL, NULL, NULL, NULL, N'表单字段', N'FormFields', N'string', 110, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (760, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 110, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-29T23:40:25.050' AS DateTime), 1, 800, NULL, NULL, 1, N'datetime', 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (761, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-29T23:40:25.050' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (762, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-29T23:40:25.050' AS DateTime), 1, 810, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (763, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-29T23:40:25.050' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (764, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-29T23:40:25.050' AS DateTime), 1, 600, NULL, NULL, 1, N'datetime', 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (765, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2021-12-29T23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-29T23:40:25.050' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (766, NULL, NULL, NULL, NULL, N'表格配置', N'TableConfig', N'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29T23:40:25.047' AS DateTime), 1, 880, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (767, NULL, NULL, NULL, NULL, N'', N'FormCollectionId', N'guid', 110, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2021-12-30T23:00:15.140' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (768, NULL, NULL, NULL, NULL, N'表单ID', N'FormId', N'guid', 110, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (769, NULL, NULL, NULL, NULL, N'标题', N'Title', N'string', 110, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 900, NULL, NULL, 1, N'like', 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (770, NULL, NULL, NULL, NULL, N'表单数据', N'FormData', N'string', 110, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (771, NULL, NULL, NULL, NULL, N'提交时间', N'CreateDate', N'DateTime', 145, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 800, NULL, NULL, 1, N'datetime', 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (772, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (773, NULL, NULL, NULL, NULL, N'提交人', N'Creator', N'string', 100, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 810, NULL, NULL, 1, N'like', 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (774, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 130, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (775, NULL, NULL, NULL, NULL, N'', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (776, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2021-12-29T23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-30T23:00:15.143' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_TableInfo] ON 
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (2, N'角色管理', N'角色管理', NULL, NULL, NULL, NULL, NULL, 0, N'RoleName', N'System', N'VOL.System', NULL, 8, NULL, NULL, N'Sys_Role', N'Sys_Role', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (3, N'字典数据', N'字典数据', NULL, NULL, N'字典明细', N'Sys_DictionaryList', NULL, 0, N'DicName', N'System', N'VOL.System', NULL, 11, NULL, NULL, N'Sys_Dictionary', N'Sys_Dictionary', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (4, N'字典明细', N'字典明细', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 11, NULL, NULL, N'Sys_DictionaryList', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (5, N'系统日志', N'系统日志', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 10, NULL, NULL, N'Sys_Log', N'Sys_Log', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (6, NULL, N'用户管理', NULL, NULL, NULL, NULL, NULL, 0, N'UserName', N'System', N'VOL.System', NULL, 8, NULL, N'', N'Sys_User', N'Sys_User', N'HeadImageUrl', 1)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (8, N'用户基础信息', N'用户基础信息', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', 200, 0, NULL, NULL, N'无', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (10, N'日志管理', N'日志管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 0, NULL, N'170', N'日志管理', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (11, N'配置管理', N'配置管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 0, NULL, N'250', N'配置管理', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (15, N'成交均价', N'自动绑定下拉框', NULL, NULL, NULL, NULL, NULL, 0, N'AvgPrice', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_TransactionAvgPrice', N'App_TransactionAvgPrice', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (16, NULL, N'自定义实现一对多', NULL, NULL, NULL, NULL, NULL, 0, N'Price', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_ReportPrice', N'App_ReportPrice', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (19, NULL, N'导入导出', NULL, NULL, NULL, NULL, NULL, 0, N'PhoneNo', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_Transaction', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (20, NULL, N'启用图片支持', NULL, NULL, NULL, NULL, NULL, 0, N'ExpertName', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_Expert', N'App_Expert', N'HeadImageUrl', 1)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (27, N' 资讯', N'静态页面发布', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'News', N'VOL.AppManager', NULL, 0, NULL, NULL, N' 资讯', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (28, NULL, N'新闻列表', NULL, NULL, NULL, NULL, NULL, 0, N'Title', N'News', N'VOL.AppManager', NULL, 27, N'Content', N'CreateDate', N'App_News', N'App_News', N'ImageUrl', 3)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (76, N'订单管理', N'测试完整示例', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'订单管理', N'VOL.Order', NULL, 0, NULL, NULL, N'订单管理', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (77, N'销售订单', N'销售订单', NULL, NULL, N'订单明细', N'SellOrderList', NULL, 0, N'TranNo', N'Sell', N'VOL.Order', NULL, 76, NULL, N'CreateDate', N'SellOrder', N'SellOrder', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (78, N'订单明细', N'订单明细', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'Order', N'VOL.Order', NULL, 76, NULL, N'CreateDate', N'SellOrderList', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (79, N'Table 单表数据', N'Table+单表数据', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'Order', N'VOL.Order', NULL, 0, NULL, NULL, N'Table+单表数据', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (80, N'基础表单查询', N'基础表单+编辑只读', NULL, NULL, NULL, NULL, NULL, 0, N'Name', N'Appointment', N'VOL.Order', NULL, 79, NULL, N'CreateDate', N'App_Appointment', N'App_Appointment', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (81, N'表单设计', N'表单设计', NULL, NULL, NULL, NULL, NULL, 1, NULL, N'form', N'VOL.System', NULL, 0, NULL, NULL, N'0', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (82, N'表单设计', N'表单设计', NULL, NULL, NULL, NULL, NULL, 1, N'Title', N'form', N'VOL.System', NULL, 81, NULL, N'CreateDate', N'FormDesignOptions', N'FormDesignOptions', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (83, N'数据采集', N'数据采集', NULL, NULL, NULL, N'', NULL, 1, NULL, N'form', N'VOL.System', NULL, 81, NULL, N'CreateDate', N'FormCollectionObject', N'FormCollectionObject', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_TableInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_User] ON 
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (1, N'北京市西城区', 1, CAST(N'2019-08-18T00:54:06.000' AS DateTime), 1, N'超级管理员', CAST(N'2012-06-10T11:10:03.000' AS DateTime), NULL, NULL, NULL, 0, N'283591387@qq.com', 1, 1, N'Upload/Tables/Sys_User/202004271001535915/04.jpg', 0, CAST(N'2017-08-28T09:58:55.000' AS DateTime), CAST(N'2019-12-14T15:14:22.730' AS DateTime), NULL, N'超级管理员', CAST(N'2020-04-27T10:02:10.000' AS DateTime), 1, 0, 1, N'超级管理员', N'13888888888', N'~还没想好...', NULL, N'admin', N'j79rYYvCz4vdhcboB1Ausg==', N'超级管理员', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTY0MTIwODQzMiIsIm5iZiI6IjE2NDEyMDg0MzIiLCJleHAiOiIxNjQxMjE1NjMyIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.LLILvWpv2qJJNfNuJffVdiFq7bGEUnQkICpC0S97C_Y')
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (3362, N'北京市还没注册', 1, CAST(N'2019-08-18T00:54:06.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-08-13T14:24:27.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, 0, 0, N'Upload/Tables/Sys_User/201912141113355553/07.jpg', 1, NULL, CAST(N'2019-09-22T23:03:33.580' AS DateTime), N'01012345678', N'zs', CAST(N'2020-05-01T16:37:19.000' AS DateTime), 3362, NULL, 2, N'测试管理员', NULL, N'null', NULL, N'admin666', N'j79rYYvCz4vdhcboB1Ausg==', N'zs', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTU4ODQxMTc4MSIsIm5iZiI6IjE1ODg0MTE3ODEiLCJleHAiOiIxNTg4NDE4OTgxIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.CfH7pDGNTqMTxs1oHtT9jyQO7eOMZDFd00F1eJ06S4I')
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (3366, NULL, 1, NULL, NULL, NULL, CAST(N'2019-11-25T16:03:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, 1, 0, N'Upload/Tables/Sys_User/201912082213149562/head1.jpg', 0, NULL, NULL, NULL, N'超级管理员', CAST(N'2020-04-04T12:41:25.000' AS DateTime), 1, NULL, 15, N'测试3', NULL, NULL, NULL, N'test123', N'1nC8gJ2R7slXiotmNrLCEA==', N'test123', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzY2IiwiaWF0IjoiMTU3NDY2OTAzMyIsIm5iZiI6IjE1NzQ2NjkwMzMiLCJleHAiOiIxNTc0Njc2MjMzIiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.MZFrEsYLMy5zH4ZfXUz_wwr62hJkeQsX7CJyg_x_fxg')
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (3367, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-26T17:19:34.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, N'测试2', NULL, N'1', NULL, N'user2', N'aPuAteBy8iDwlNvTNPGqzA==', N'角色帐号2', NULL)
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (3368, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-26T17:20:41.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, N'zs', CAST(N'2020-05-01T16:34:25.000' AS DateTime), 3362, NULL, 2, N'测试管理员', NULL, NULL, NULL, N'user2_1', N'FVUjlxZXEhBaFk1425xDSw==', N'角色帐号2_1', NULL)
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (3369, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-26T17:24:15.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, N'zs', CAST(N'2020-05-01T20:56:05.000' AS DateTime), 3362, NULL, 13, N'测试1', NULL, NULL, NULL, N'user1_1', N'LwCgs8V3buuNG1Tmsoa2Ow==', N'测试帐号1_1', NULL)
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (3380, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-01T16:43:45.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, N'超级管理员', CAST(N'2020-05-01T20:49:41.000' AS DateTime), 1, NULL, 1, N'超级管理员', NULL, NULL, NULL, N'1231', N'Z~PIbBMR_qYqiN5dnp6zHg==', N'31', NULL)
GO
INSERT [dbo].[Sys_User] ([User_Id], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [CreateDate], [CreateID], [Creator], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Mobile], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [Token]) VALUES (4378, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-05-01T20:56:16.000' AS DateTime), 3362, N'zs', NULL, NULL, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, N'zs', CAST(N'2020-05-01T21:08:04.000' AS DateTime), 3362, NULL, 4, N'信息员', NULL, NULL, NULL, N'111', N'BshtCHSBJ_JxFWc9KnNOXw==', N'11', NULL)
GO
INSERT [dbo].[Sys_Menu] ([MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier]) 
VALUES ( N'多表页签', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'.', 48, N'/tabsTable', CAST(N'2022-01-08T12:58:35.983' AS DateTime),
N'超级管理员', CAST(N'2019-10-31T10:09:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Sys_Menu] ([MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate],
[Creator], [ModifyDate], [Modifier]) 
VALUES ( N'多级表头', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]',
N'', NULL, 1, 0, N'.', 48, N'App_Appointment2', CAST(N'2022-01-08T16:42:53.887' AS DateTime), N'超级管理员', CAST(N'2022-01-08T16:43:06.173' AS DateTime), N'超级管理员')
go 
SET IDENTITY_INSERT [dbo].[Sys_User] OFF
GO
USE [master]
GO
ALTER DATABASE [netcoredev] SET  READ_WRITE 
GO
