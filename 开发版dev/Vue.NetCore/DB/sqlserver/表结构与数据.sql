
USE [netcoredev]
GO
/****** Object:  Table [dbo].[App_Appointment]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[App_Expert]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[App_News]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[App_ReportPrice]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[App_Transaction]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[App_TransactionAvgPrice]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[FormCollectionObject]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[FormDesignOptions]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[SellOrder]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[SellOrderList]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_City]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Department]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_Department](
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[DepartmentName] [nvarchar](200) NOT NULL,
	[DepartmentCode] [nvarchar](50) NULL,
	[ParentId] [uniqueidentifier] NULL,
	[DepartmentType] [nvarchar](50) NULL,
	[Enable] [int] NULL,
	[Remark] [nvarchar](500) NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Dictionary]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_DictionaryList]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_Log]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 2023-05-13 19:24:57 ******/
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
	[MenuType] [int] NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Province]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_QuartzLog]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_QuartzLog](
	[LogId] [uniqueidentifier] NOT NULL,
	[Id] [uniqueidentifier] NULL,
	[TaskName] [nvarchar](500) NULL,
	[ElapsedTime] [int] NULL,
	[StratDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Result] [int] NULL,
	[ResponseContent] [nvarchar](max) NULL,
	[ErrorMsg] [nvarchar](max) NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK__Sys_Quar__5E54864815AC1510] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_QuartzOptions]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_QuartzOptions](
	[Id] [uniqueidentifier] NOT NULL,
	[TaskName] [nvarchar](500) NOT NULL,
	[GroupName] [nvarchar](500) NOT NULL,
	[CronExpression] [varchar](100) NOT NULL,
	[Method] [varchar](50) NULL,
	[ApiUrl] [nvarchar](2000) NULL,
	[AuthKey] [nvarchar](200) NULL,
	[AuthValue] [nvarchar](200) NULL,
	[Describe] [nvarchar](2000) NULL,
	[LastRunTime] [datetime] NULL,
	[Status] [int] NULL,
	[PostData] [nvarchar](max) NULL,
	[TimeOut] [int] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK__Sys_Quar__3214EC071E78A418] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Role]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_RoleAuth]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_TableColumn]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_TableInfo]    Script Date: 2023-05-13 19:24:57 ******/
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
/****** Object:  Table [dbo].[Sys_User]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[RoleName] [nvarchar](200) NULL,
	[PhoneNo] [nvarchar](11) NULL,
	[Remark] [nvarchar](200) NULL,
	[Tel] [nvarchar](20) NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPwd] [nvarchar](200) NULL,
	[UserTrueName] [nvarchar](20) NOT NULL,
	[DeptName] [nvarchar](150) NULL,
	[Dept_Id] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Enable] [tinyint] NOT NULL,
	[Gender] [int] NULL,
	[HeadImageUrl] [nvarchar](500) NULL,
	[IsRegregisterPhone] [int] NULL,
	[LastLoginDate] [datetime] NULL,
	[LastModifyPwdDate] [datetime] NULL,
	[Address] [nvarchar](200) NULL,
	[AppType] [int] NULL,
	[AuditDate] [datetime] NULL,
	[AuditStatus] [int] NULL,
	[Auditor] [nvarchar](200) NULL,
	[OrderNo] [int] NULL,
	[Token] [nvarchar](500) NULL,
	[CreateID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Creator] [nvarchar](200) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Modifier] [nvarchar](200) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[DeptIds] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Sys_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_UserDepartment]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_UserDepartment](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[Enable] [int] NOT NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[Modifier] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_WorkFlow]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_WorkFlow](
	[WorkFlow_Id] [uniqueidentifier] NOT NULL,
	[WorkName] [nvarchar](200) NOT NULL,
	[WorkTable] [nvarchar](200) NOT NULL,
	[WorkTableName] [nvarchar](200) NULL,
	[NodeConfig] [nvarchar](max) NULL,
	[LineConfig] [nvarchar](max) NULL,
	[Remark] [nvarchar](500) NULL,
	[Weight] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[AuditingEdit] [int] NULL,
 CONSTRAINT [PK__Sys_Work__2A1726C38AD06D4D] PRIMARY KEY CLUSTERED 
(
	[WorkFlow_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_WorkFlowStep]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_WorkFlowStep](
	[WorkStepFlow_Id] [uniqueidentifier] NOT NULL,
	[WorkFlow_Id] [uniqueidentifier] NULL,
	[StepId] [varchar](100) NULL,
	[StepName] [nvarchar](200) NULL,
	[StepType] [int] NULL,
	[StepValue] [varchar](500) NULL,
	[OrderId] [int] NULL,
	[Remark] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[NextStepIds] [varchar](500) NULL,
	[ParentId] [varchar](2000) NULL,
	[AuditRefuse] [int] NULL,
	[AuditBack] [int] NULL,
	[AuditMethod] [int] NULL,
	[SendMail] [int] NULL,
	[Filters] [nvarchar](4000) NULL,
	[StepAttrType] [varchar](50) NULL,
	[Weight] [int] NULL,
 CONSTRAINT [PK__Sys_Work__26A928370FFD6659] PRIMARY KEY CLUSTERED 
(
	[WorkStepFlow_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_WorkFlowTable]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_WorkFlowTable](
	[WorkFlowTable_Id] [uniqueidentifier] NOT NULL,
	[WorkFlow_Id] [uniqueidentifier] NULL,
	[WorkName] [nvarchar](200) NULL,
	[WorkTableKey] [nvarchar](200) NULL,
	[WorkTable] [nvarchar](200) NULL,
	[WorkTableName] [nvarchar](200) NULL,
	[CurrentOrderId] [int] NULL,
	[AuditStatus] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[CurrentStepId] [nvarchar](100) NULL,
	[StepName] [nvarchar](500) NULL,
 CONSTRAINT [PK__Sys_Work__E731D35B8DAE74D6] PRIMARY KEY CLUSTERED 
(
	[WorkFlowTable_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_WorkFlowTableAuditLog]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_WorkFlowTableAuditLog](
	[Id] [uniqueidentifier] NOT NULL,
	[WorkFlowTable_Id] [uniqueidentifier] NULL,
	[WorkFlowTableStep_Id] [uniqueidentifier] NULL,
	[StepId] [nvarchar](100) NULL,
	[StepName] [nvarchar](200) NULL,
	[AuditId] [int] NULL,
	[Auditor] [nvarchar](100) NULL,
	[AuditStatus] [int] NULL,
	[AuditResult] [nvarchar](1000) NULL,
	[AuditDate] [datetime] NULL,
	[Remark] [nvarchar](1000) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_WorkFlowTableStep]    Script Date: 2023-05-13 19:24:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_WorkFlowTableStep](
	[Sys_WorkFlowTableStep_Id] [uniqueidentifier] NOT NULL,
	[WorkFlowTable_Id] [uniqueidentifier] NOT NULL,
	[WorkFlow_Id] [uniqueidentifier] NULL,
	[StepId] [nvarchar](100) NULL,
	[StepName] [nvarchar](200) NULL,
	[StepType] [int] NULL,
	[StepValue] [varchar](500) NULL,
	[OrderId] [int] NULL,
	[AuditId] [int] NULL,
	[Auditor] [nvarchar](50) NULL,
	[AuditStatus] [int] NULL,
	[AuditDate] [datetime] NULL,
	[Remark] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[CreateID] [int] NULL,
	[Creator] [nvarchar](30) NULL,
	[Enable] [tinyint] NULL,
	[Modifier] [nvarchar](30) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyID] [int] NULL,
	[StepAttrType] [varchar](50) NULL,
	[ParentId] [varchar](2000) NULL,
	[NextStepId] [varchar](100) NULL,
	[Weight] [int] NULL,
 CONSTRAINT [PK__Sys_Work__2CBB561BDE0F2FDA] PRIMARY KEY CLUSTERED 
(
	[Sys_WorkFlowTableStep_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[App_Appointment] ([Id], [CreateDate], [CreateID], [Creator], [Describe], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo]) VALUES (N'08da0e85-17db-4da5-85ed-1400a5fce2c5', CAST(N'2022-03-26 01:30:02.000' AS DateTime), 1, N'超级管理员', N'人中吕布,马中赤兔,方天画戟,专杀义父', N'超级管理员', CAST(N'2022-03-26 01:32:55.000' AS DateTime), 1, N'人中吕布', N'138888887698')
GO
INSERT [dbo].[App_Appointment] ([Id], [CreateDate], [CreateID], [Creator], [Describe], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo]) VALUES (N'08d9fcbc-b5e9-4833-8bfb-3b3ce77bc704', CAST(N'2022-03-03 10:22:48.000' AS DateTime), 1, N'超级管理员', N'古埃及第十九王朝法老第三位法老，杰出的政治家、军事家、文学家、诗人、建筑家，其执政时期是埃及新王国最后的强盛年', N'超级管理员', CAST(N'2022-03-03 10:24:14.000' AS DateTime), 1, N'拉美西斯', N'138888887692')
GO
INSERT [dbo].[App_Appointment] ([Id], [CreateDate], [CreateID], [Creator], [Describe], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo]) VALUES (N'08d9fcbc-b5eb-4c1f-80bc-3c5029d935e7', CAST(N'2022-03-03 10:22:48.000' AS DateTime), 1, N'超级管理员', N'奈菲尔塔利（Nefertari ）是古埃及著名法老，拉美西斯二世八位王后中唯一一个拥有神庙的王后', N'超级管理员', CAST(N'2022-03-03 10:24:16.000' AS DateTime), 1, N'奈菲尔塔利', N'138888887691')
GO
INSERT [dbo].[App_Appointment] ([Id], [CreateDate], [CreateID], [Creator], [Describe], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo]) VALUES (N'08da0e85-17db-4e08-8b4e-450a5f98f8ba', CAST(N'2022-03-26 01:30:02.000' AS DateTime), 1, N'超级管理员', N'非礼啊!非礼啊!非礼啊!', N'超级管理员', CAST(N'2022-03-26 01:32:57.000' AS DateTime), 1, N'貂蝉西施', N'138888887693')
GO
SET IDENTITY_INSERT [dbo].[App_Expert] ON 

GO
INSERT [dbo].[App_Expert] ([ExpertId], [AuditDate], [AuditId], [AuditStatus], [Auditor], [Certificate], [City], [Company], [CreateDate], [CreateID], [Creator], [Education], [Enable], [ExpertName], [HeadImageUrl], [IDNumber], [Modifier], [ModifyDate], [ModifyID], [PhoneNo], [Professional], [ReallyName], [Resume], [SpecialField], [UserName], [UserTrueName], [User_Id]) VALUES (1, CAST(N'2018-09-07 10:58:17.000' AS DateTime), 1, 1, N'测试超级管理员', NULL, N'上海市', N'中国农业大学', CAST(N'2018-09-04 15:49:44.000' AS DateTime), 3344, N'User31110458', N'博士', 1, N'宫本七号', N'Upload/Tables/App_Expert/202103061750152777/head2.jpg', N'150124199911110116', N'超级管理员', CAST(N'2021-03-07 21:55:31.000' AS DateTime), 1, N'1388886666', N'教授', N'拉美西斯', N'二十九岁,对于一个人男人而言不算老,可是对于爱情来说已是风烛残年', N'Upload/Tables/App_Expert/201911271400081947/启用图片支持 (1).xlsx', N'13381277739', N'User31110458', 3344)
GO
INSERT [dbo].[App_Expert] ([ExpertId], [AuditDate], [AuditId], [AuditStatus], [Auditor], [Certificate], [City], [Company], [CreateDate], [CreateID], [Creator], [Education], [Enable], [ExpertName], [HeadImageUrl], [IDNumber], [Modifier], [ModifyDate], [ModifyID], [PhoneNo], [Professional], [ReallyName], [Resume], [SpecialField], [UserName], [UserTrueName], [User_Id]) VALUES (2, CAST(N'2019-09-22 22:30:08.000' AS DateTime), 3362, 1, N'zs', N'', N'天津市', N'窦天宝传奇', CAST(N'2018-09-18 17:45:54.000' AS DateTime), 3358, N'较瘦', N'小学', 1, N'干将莫邪', N'Upload/Tables/App_Expert/202304051526079577/gj.png', N'250124123911110121', N'超级管理员', CAST(N'2023-04-05 15:26:08.000' AS DateTime), 1, N'1388887777', N'演员', N'木兰', N'干将莫邪是一个高伤害、高收益的心流型远程狙击法师，完全依靠精准的技能施法仅仅是一个合格的干将的基础要求。当视野外或无视野的时候，沉浸在心流中的干将玩家，甩狙盲剑都会让干将使用者获得巨大的满足', N'Upload/Tables/App_Expert/201912111717154170/exceltest.xlsx', N'17612519002', N'较瘦', 3358)
GO
INSERT [dbo].[App_Expert] ([ExpertId], [AuditDate], [AuditId], [AuditStatus], [Auditor], [Certificate], [City], [Company], [CreateDate], [CreateID], [Creator], [Education], [Enable], [ExpertName], [HeadImageUrl], [IDNumber], [Modifier], [ModifyDate], [ModifyID], [PhoneNo], [Professional], [ReallyName], [Resume], [SpecialField], [UserName], [UserTrueName], [User_Id]) VALUES (3, NULL, NULL, 0, NULL, NULL, N'天津市', NULL, CAST(N'2021-03-06 17:52:07.000' AS DateTime), 1, N'超级管理员', NULL, 1, N'小鲁班', N'Upload/Tables/App_Expert/202304051203334519/nb.png', NULL, N'超级管理员', CAST(N'2023-04-05 12:03:34.000' AS DateTime), 1, N'1388888888', NULL, N'女秘书', N'别看小鲁班的腿很短，但是在对线上边基本上没有能与他一战的射手。', NULL, N'17612519001', NULL, NULL)
GO
INSERT [dbo].[App_Expert] ([ExpertId], [AuditDate], [AuditId], [AuditStatus], [Auditor], [Certificate], [City], [Company], [CreateDate], [CreateID], [Creator], [Education], [Enable], [ExpertName], [HeadImageUrl], [IDNumber], [Modifier], [ModifyDate], [ModifyID], [PhoneNo], [Professional], [ReallyName], [Resume], [SpecialField], [UserName], [UserTrueName], [User_Id]) VALUES (4, NULL, NULL, 0, NULL, NULL, N'北京市', NULL, CAST(N'2023-04-05 14:36:04.000' AS DateTime), 1, N'超级管理员', NULL, 0, N'vol-table', N'Upload/Tables/App_Expert/202304051436032612/wechart.png', NULL, N'超级管理员', CAST(N'2023-04-05 15:30:38.000' AS DateTime), 1, NULL, NULL, NULL, N'vol-table增加自定义表格内容,内置了分页,高度自适应功能,需要自己写内容..', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[App_Expert] OFF
GO
SET IDENTITY_INSERT [dbo].[App_ReportPrice] ON 

GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (81, N'30', CAST(N'2019-07-18 11:41:20.000' AS DateTime), 1, 2, N'超级管理员', N'石家庄市', CAST(N'2019-07-18 11:17:34.000' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2023-05-13 11:18:20.000' AS DateTime), 1, CAST(1900.00 AS Numeric(10, 2)), N'单反相机')
GO
INSERT [dbo].[App_ReportPrice] ([Id], [Age], [AuditDate], [AuditId], [AuditStatus], [Auditor], [City], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [Price], [Variety]) VALUES (82, N'20', CAST(N'2019-07-18 12:42:06.000' AS DateTime), 1, 1, N'超级管理员', N'天津市', CAST(N'2019-07-18 11:40:09.000' AS DateTime), 1, N'超级管理员', 0, N'超级管理员', CAST(N'2023-05-13 11:18:06.000' AS DateTime), 1, CAST(1000.00 AS Numeric(10, 2)), N'数码相机')
GO
SET IDENTITY_INSERT [dbo].[App_ReportPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[App_Transaction] ON 

GO
INSERT [dbo].[App_Transaction] ([Id], [CowType], [CreateDate], [CreateID], [Creator], [Describe], [Enable], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo], [Quantity], [TransactionType]) VALUES (4, N'1', CAST(N'2019-09-18 18:10:01.000' AS DateTime), 1, N'超级管理员', N'买买买买买买1', NULL, N'超级管理员', CAST(N'2019-11-17 15:07:23.000' AS DateTime), 1, N'大锤1', N'13419098211', 25, 0)
GO
INSERT [dbo].[App_Transaction] ([Id], [CowType], [CreateDate], [CreateID], [Creator], [Describe], [Enable], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo], [Quantity], [TransactionType]) VALUES (6, N'3', CAST(N'2019-09-18 18:22:25.000' AS DateTime), 1, N'超级管理员', N'买买买买买买3', NULL, N'超级管理员', CAST(N'2019-11-17 15:33:53.000' AS DateTime), 1, N'小乔', N'13419444422', 199, 1)
GO
INSERT [dbo].[App_Transaction] ([Id], [CowType], [CreateDate], [CreateID], [Creator], [Describe], [Enable], [Modifier], [ModifyDate], [ModifyID], [Name], [PhoneNo], [Quantity], [TransactionType]) VALUES (7, N'0', CAST(N'2020-12-29 21:39:22.000' AS DateTime), 1, N'超级管理员', N'12312119023', NULL, N'超级管理员', CAST(N'2020-12-29 21:41:29.000' AS DateTime), 1, N'林中鸟', N'18612119123', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[App_Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[App_TransactionAvgPrice] ON 

GO
INSERT [dbo].[App_TransactionAvgPrice] ([Id], [AgeRange], [AvgPrice], [City], [CreateDate], [CreateID], [Creator], [Date], [Enable], [IsTop], [Modifier], [ModifyDate], [ModifyID], [Variety]) VALUES (12, N'20', CAST(2000.00 AS Decimal(18, 2)), N'北京市', CAST(N'2022-06-20 02:09:49.000' AS DateTime), 1, N'超级管理员', CAST(N'2022-06-19' AS Date), NULL, 1, N'超级管理员', CAST(N'2023-05-13 10:49:07.000' AS DateTime), 1, N'单反相机')
GO
INSERT [dbo].[App_TransactionAvgPrice] ([Id], [AgeRange], [AvgPrice], [City], [CreateDate], [CreateID], [Creator], [Date], [Enable], [IsTop], [Modifier], [ModifyDate], [ModifyID], [Variety]) VALUES (13, N'30', CAST(1200.00 AS Decimal(18, 2)), N'天津市', CAST(N'2022-06-20 02:10:53.000' AS DateTime), 1, N'超级管理员', CAST(N'2022-06-20' AS Date), NULL, 1, N'超级管理员', CAST(N'2023-05-13 10:49:12.000' AS DateTime), 1, N'微单相机')
GO
SET IDENTITY_INSERT [dbo].[App_TransactionAvgPrice] OFF
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'cccc519c-c448-4292-85d1-6a0ac2828fd9', N'0431a578-bfc9-407f-b95e-321c350f10cb', NULL, N'{"FormId":"0431a578-bfc9-407f-b95e-321c350f10cb","field1640871905593":"1","field1640871902689":"2022-01-04","field1641207457900":"123456","field1641207424694":""}', CAST(N'2022-01-03 19:09:53.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'a37c1956-ddc0-457b-8f0a-93cdc44c257d', N'8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, N'{"FormId":"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da","field1641205615398":"1","field1641206170991":"十分满意,相当满意","field1641205647957":"相当满意","field1641206608182":"没有意见"}', CAST(N'2022-01-03 19:05:46.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'e913389c-e11a-4675-b8eb-a25c75086e37', N'8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', NULL, N'{"FormId":"8e6d9e7c-16c2-48b8-9d67-f1a1a19453da","field1641205615398":"1","field1641206170991":"非常满意,十分满意,相当满意","field1641205647957":"非常满意","field1641206608182":"1111"}', CAST(N'2022-01-03 19:09:45.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormCollectionObject] ([FormCollectionId], [FormId], [Title], [FormData], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'90513c4c-b639-4d0d-8c9d-fb69b77620f8', N'0431a578-bfc9-407f-b95e-321c350f10cb', NULL, N'{"FormId":"0431a578-bfc9-407f-b95e-321c350f10cb","field1640871905593":"1","field1640871902689":"2022-01-05","field1641207457900":null,"field1641207424694":""}', CAST(N'2022-01-03 19:06:50.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[FormDesignOptions] ([FormId], [Title], [DaraggeOptions], [FormOptions], [FormConfig], [FormFields], [TableConfig], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'0431a578-bfc9-407f-b95e-321c350f10cb', N'2021开发语言使用调查', N'[{"id":5,"name":"是否同时使用多种语言开发","type":"radio","icon":"el-icon-aim","value":0,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"key":"enable","field":"field1640871905593","width":100,"readonly":false,"required":true,"values":["否"]},{"id":3,"name":"从什么时候开始做开发?","type":"date","icon":"el-icon-date","value":null,"field":"field1640871902689","width":100,"readonly":false,"required":true},{"id":2,"name":"说点什么","type":"textarea","value":"","icon":"el-icon-document-copy","field":"field1641207457900","width":100,"readonly":false,"required":false},{"id":9,"name":"图片上传","type":"img","url":"","maxSize":3,"fileInfo":[],"multiple":false,"autoUpload":false,"maxFile":5,"icon":"el-icon-picture-outline","field":"field1641207424694","width":100,"readonly":false,"required":false}]', N'{"fields":{"field1640871905593":[],"field1640871902689":null,"field1641207457900":null,"field1641207424694":null},"formOptions":[[{"field":"field1640871905593","title":"是否同时使用多种语言开发","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"}],[{"field":"field1640871902689","title":"从什么时候开始做开发?","type":"date","required":true,"readonly":false,"colSize":12}],[{"field":"field1641207457900","title":"说点什么","type":"textarea","required":false,"readonly":false,"colSize":12}],[{"field":"field1641207424694","title":"图片上传","type":"img","required":false,"readonly":false,"colSize":12,"maxSize":3,"fileInfo":[],"multiple":false,"autoUpload":false,"maxFile":5,"url":""}]],"tables":[],"tabs":[]}', N'[{"field":"field1640871905593","title":"是否同时使用多种语言开发","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"},{"field":"field1640871902689","title":"从什么时候开始做开发?","type":"date","required":true,"readonly":false,"colSize":12},{"field":"field1641207457900","title":"说点什么","type":"textarea","required":false,"readonly":false,"colSize":12},{"field":"field1641207424694","title":"图片上传","type":"img","required":false,"readonly":false,"colSize":12,"maxSize":3,"fileInfo":[],"multiple":false,"autoUpload":false,"maxFile":5,"url":""}]', NULL, N'[]', CAST(N'2021-12-29 23:39:22.000' AS DateTime), 1, N'超级管理员', N'超级管理员', CAST(N'2022-01-03 19:00:30.000' AS DateTime), 1)
GO
INSERT [dbo].[FormDesignOptions] ([FormId], [Title], [DaraggeOptions], [FormOptions], [FormConfig], [FormFields], [TableConfig], [CreateDate], [CreateID], [Creator], [Modifier], [ModifyDate], [ModifyID]) VALUES (N'8e6d9e7c-16c2-48b8-9d67-f1a1a19453da', N'2021双减政策调查', N'[{"id":5,"name":"您的孩子放学后是否有学校布置的书面作业?","type":"radio","icon":"el-icon-aim","value":0,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"key":"enable","field":"field1641205615398","width":100,"readonly":false,"required":true,"values":["否"]},{"id":6,"name":"您认为放学后作业对孩子的负担怎样?","values":["非常满意"],"type":"checkbox","key":"满意度","data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"icon":"el-icon-circle-check","field":"field1641206170991","width":100,"readonly":false,"required":true},{"id":5,"name":"作为家长,对当前双减政策是否满意？","type":"radio","icon":"el-icon-aim","value":0,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"key":"满意度","field":"field1641205647957","width":100,"readonly":false,"required":true,"values":["非常满意"]},{"id":2,"name":"其他意见","type":"textarea","value":"","icon":"el-icon-document-copy","field":"field1641206608182","width":100,"readonly":false,"required":false}]', N'{"fields":{"field1641205615398":[],"field1641206170991":[],"field1641205647957":[],"field1641206608182":null},"formOptions":[[{"field":"field1641205615398","title":"您的孩子放学后是否有学校布置的书面作业?","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"}],[{"field":"field1641206170991","title":"您认为放学后作业对孩子的负担怎样?","type":"checkbox","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"}],[{"field":"field1641205647957","title":"作为家长,对当前双减政策是否满意？","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"}],[{"field":"field1641206608182","title":"其他意见","type":"textarea","required":false,"readonly":false,"colSize":12}]],"tables":[],"tabs":[]}', N'[{"field":"field1641205615398","title":"您的孩子放学后是否有学校布置的书面作业?","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"0","value":"否"},{"key":"2","value":"xx11"},{"key":"1","value":"是"}],"dataKey":"enable"},{"field":"field1641206170991","title":"您认为放学后作业对孩子的负担怎样?","type":"checkbox","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"},{"field":"field1641205647957","title":"作为家长,对当前双减政策是否满意？","type":"radio","required":true,"readonly":false,"colSize":12,"data":[{"key":"非常满意","value":"非常满意"},{"key":"十分满意","value":"十分满意"},{"key":"相当满意","value":"相当满意"}],"dataKey":"满意度"},{"field":"field1641206608182","title":"其他意见","type":"textarea","required":false,"readonly":false,"colSize":12}]', NULL, N'[]', CAST(N'2021-12-30 21:45:16.000' AS DateTime), 1, N'超级管理员', N'超级管理员', CAST(N'2022-01-03 18:43:46.000' AS DateTime), 1)
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'81d5db86-c85a-4b06-bc3a-08142811c522', 1, N'2023051300000005', N'2023051300000005', 5050, NULL, 0, NULL, NULL, N'2023051300000005', 1, N'超级管理员', CAST(N'2023-05-13 17:19:06.427' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'323ab96f-49c1-4100-9d08-17db9f209df7', 1, N'2023051300000004', N'2023051300000004', 5505, NULL, 2, NULL, NULL, N'部门+角色+用户审批', 1, N'超级管理员', CAST(N'2023-05-13 17:17:46.850' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'b1db23bd-ed48-4459-b9ed-355d97a7e16e', 1, N'2023051300000003', N'2023051300000003', 5000, NULL, 1, NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 17:07:36.867' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'55ae8c6c-6a11-4765-952a-7b4a3adece04', 2, N'2023051300000001', N'20230513000001', 200, NULL, 2, NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 15:49:18.100' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 15:49:26.660' AS DateTime))
GO
INSERT [dbo].[SellOrder] ([Order_Id], [OrderType], [TranNo], [SellNo], [Qty], [AuditDate], [AuditStatus], [AuditId], [Auditor], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'b67b7ec0-136c-4439-a530-cd6dd4d69a9c', 2, N'2023051300000002', N'20230513000002', 120, NULL, 1, NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 15:58:42.417' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 17:07:13.920' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'3d1467b1-11e0-4404-e3fd-08db53868e51', N'55ae8c6c-6a11-4765-952a-7b4a3adece04', N'2', N'20230513000001', 12400, CAST(11.00 AS Decimal(18, 2)), NULL, 1, N'超级管理员', CAST(N'2023-05-13 15:49:18.147' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 15:49:26.663' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'ccdfcd1d-e0de-4cae-7485-08db5387deb9', N'b67b7ec0-136c-4439-a530-cd6dd4d69a9c', N'2', N'2023051300000002', 12321, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 15:58:42.540' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 17:07:13.967' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'be0a328c-6ecc-419b-7b3c-08db53917efb', N'b1db23bd-ed48-4459-b9ed-355d97a7e16e', N'2', N'1000', 2000, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 17:07:36.880' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'893cee01-ad76-4894-fbf3-08db5392eaa0', N'323ab96f-49c1-4100-9d08-17db9f209df7', N'2', N'123', 200, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 17:17:46.977' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'df13a279-7ea4-47c0-fbf4-08db5392eaa0', N'81d5db86-c85a-4b06-bc3a-08142811c522', N'2', N'111', 2000, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 17:19:06.437' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'08d72cf6-d9f5-bee9-32ff-5808ff1238cb', N'6efb65b8-585e-4be7-8b77-94c76e362412', N'测试', N'测试', 7, CAST(8.00 AS Decimal(18, 2)), NULL, 1, N'超级管理员', CAST(N'2019-08-30 11:05:03.000' AS DateTime), 1, N'超级管理员', CAST(N'2019-08-30 11:05:19.000' AS DateTime))
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'08d72cf6-ed6c-f0e0-9e97-5930a04f2ebc', N'ad698348-1535-4221-9a1a-57db5cb351e4', N'2', N'2', 2, NULL, NULL, 1, N'超级管理员', CAST(N'2019-08-30 11:05:35.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[SellOrderList] ([OrderList_Id], [Order_Id], [ProductName], [MO], [Qty], [Weight], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'fc332cef-c1eb-4063-b71c-6addf19a8e8b', N'6efb65b8-585e-4be7-8b77-94c76e362412', N'22', N'2', 0, NULL, NULL, 1, N'超级管理员', CAST(N'2019-08-30 11:05:19.000' AS DateTime), NULL, NULL, NULL)
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
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'ec238385-f907-44de-b99b-0eddcffa6750', N'产品部', N'A0003', N'41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:20:26.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'62105dfa-ca64-4c4a-ab42-11ba677ac4db', N'市场部', N'A003', N'8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:12:48.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'9e1121a0-d5c5-4f46-8dd4-43ed90d2f963', N'行政部', N'A005', N'8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:13:18.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'97b5ff9c-5f52-4745-95f9-5fed8d505fa9', N'资源部', N'H0007', N'41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, N'还没想好', 1, N'超级管理员', CAST(N'2023-05-13 09:50:27.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'd01eb5d9-0f02-4468-94b8-635a5dfb3142', N'商务部', N'A0002', N'8974177f-af6b-45b5-b7ab-88f169063f40', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:07:16.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'8974177f-af6b-45b5-b7ab-88f169063f40', N'北京基础研究院', N'A0001', NULL, NULL, NULL, N'还没想好', 1, N'超级管理员', CAST(N'2023-05-13 08:56:16.000' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 09:50:34.000' AS DateTime))
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'e8c6cc16-af09-495d-b101-b651f10196de', N'战略部', N'H0002', N'41b96ea8-5475-4775-845d-fd66370c75ae', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:19:55.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'e5d8e8af-3659-454c-aa8e-c201c7edbcfb', N'销售部', N'A004', N'62105dfa-ca64-4c4a-ab42-11ba677ac4db', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:13:03.000' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 09:14:27.000' AS DateTime))
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'eae332dc-4af8-4ebf-804a-e3d6c6d00926', N'人事部', NULL, N'9e1121a0-d5c5-4f46-8dd4-43ed90d2f963', NULL, NULL, NULL, 1, N'超级管理员', CAST(N'2023-05-13 09:14:41.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Department] ([DepartmentId], [DepartmentName], [DepartmentCode], [ParentId], [DepartmentType], [Enable], [Remark], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'41b96ea8-5475-4775-845d-fd66370c75ae', N'上海市场研究院', N'H0001', NULL, NULL, NULL, N'还没想好', 1, N'超级管理员', CAST(N'2023-05-13 09:15:56.000' AS DateTime), 1, N'超级管理员', CAST(N'2023-05-13 09:50:37.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sys_Dictionary] ON 

GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (3, N'{valueField: ''Enable'',
textField: ''Enable'',
 containField: null,
  handler: null }', CAST(N'2019-07-05 17:36:23.000' AS DateTime), NULL, N'admin', N'1', NULL, N'是否值', N'enable', 1, N'超级管理员', CAST(N'2022-01-03 18:30:18.113' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (30, N'{valueField: ''Success'',
 textField: ''Success'', 
 containField: null,
 handler: null }
', CAST(N'2018-06-11 18:26:05.000' AS DateTime), 0, N'测试超级管理员', NULL, NULL, N'响应状态', N'restatus', 1, N'测试超级管理员', CAST(N'2018-06-12 10:21:48.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (31, N'{valueField: ''LogType'',
 textField: ''LogType'', 
 containField: null,
 handler: null }
', CAST(N'2018-06-12 14:46:07.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'日志类型', N'log', 1, N'超级管理员', CAST(N'2022-04-04 13:21:54.927' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (32, N'{valueField: ''Role_Id'',
 textField: ''RoleName'', 
 containField: [''Role_Id'',''RoleName''],
 handler: null }
', CAST(N'2018-06-14 16:48:35.000' AS DateTime), NULL, N'测试超级管理员', NULL, N'SELECT Role_Id as ''key'',RoleName as ''value'' FROM Sys_Role WHERE Enable=1
', N'角色列表', N'roles', 1, N'测试超级管理员', CAST(N'2018-07-13 15:03:53.000' AS DateTime), 1, 123, 0, N'sql语句需要key,value列，界面才能绑定数据源')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (35, N'{
 valueField: ''AuditStatus'',
 textField: ''AuditStatus'',
  containField:null 
}', CAST(N'2018-07-10 10:51:37.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'审核状态', N'audit', 1, N'超级管理员', CAST(N'2023-05-08 01:05:44.193' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (36, N'{
 valueField: ''Variety'',
 textField: ''Variety'',
  containField:null 
}', CAST(N'2018-07-10 14:06:12.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'分类', N'pz', 1, N'超级管理员', CAST(N'2023-05-08 01:03:15.950' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (37, N'{
 valueField: ''AgeRange'',
 textField: ''AgeRange'',
  containField:null 
}', CAST(N'2018-07-10 14:07:46.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'年龄', N'age', 1, N'超级管理员', CAST(N'2023-05-13 10:49:00.057' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (38, N'{
 valueField: ''City'',
 textField: ''City'',
  containField:null 
}', CAST(N'2018-07-10 14:18:25.000' AS DateTime), NULL, N'测试超级管理员', NULL, N'
SELECT  CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''key'',CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''value''  FROM Sys_City AS a 
INNER JOIN Sys_Province AS b 
ON a.ProvinceCode=b.ProvinceCode
WHERE a.CityName<> ''县''', N'城市', N'city', 1, N'超级管理员', CAST(N'2020-02-01 22:27:08.157' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (44, N'{
 valueField: ''NewsType'',
 textField: ''NewsType'',
  containField:null 
}', CAST(N'2018-07-10 16:15:59.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'新闻类型', N'news', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (46, N'{
 valueField: ''ProvinceName'',
 textField: ''ProvinceName'',
  containField:null 
}', CAST(N'2018-07-16 13:27:34.000' AS DateTime), NULL, N'测试超级管理员', NULL, N'
SELECT  CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''key'',CASE WHEN  CityName=''市辖区'' THEN  ProvinceName ELSE CityName end  as  ''value''  FROM Sys_City AS a 
INNER JOIN Sys_Province AS b 
ON a.ProvinceCode=b.ProvinceCode
WHERE a.CityName<> ''县''', N'省列表', N'pro', 1, N'超级管理员', CAST(N'2020-02-01 22:26:59.223' AS DateTime), 1, NULL, 0, N'sql语句需要key,value列，界面才能绑定数据源')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (49, N'{
 valueField: ''Gender'',
 textField: ''Gender'',
  containField:null 
}', CAST(N'2018-07-23 10:04:45.000' AS DateTime), NULL, N'测试超级管理员', NULL, NULL, N'性别', N'gender', 1, N'测试超级管理员', CAST(N'2018-07-23 11:10:28.000' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (50, N'{
 valueField: ''Enable'',
 textField: ''Enable'',
  containField:null 
}', CAST(N'2018-07-23 15:36:43.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'启用状态', N'status', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (59, N'{
 valueField: ''IsRegregisterPhone'',
 textField: ''IsRegregisterPhone'',
  containField:null 
}', CAST(N'2018-08-29 15:54:21.000' AS DateTime), 1, N'测试超级管理员', NULL, NULL, N'手机用户', N'isphone', 1, N'超级管理员', CAST(N'2020-11-20 23:05:48.303' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (64, NULL, CAST(N'2019-09-18 19:25:47.000' AS DateTime), 1, N'超级管理员', NULL, NULL, N'订单类型', N'ordertype', 1, N'超级管理员', CAST(N'2019-11-01 10:04:20.833' AS DateTime), 1, NULL, 0, N'xxxxx')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (65, NULL, CAST(N'2019-09-19 10:07:23.000' AS DateTime), 1, N'超级管理员', NULL, NULL, N'商品名称', N'pn', 1, N'超级管理员', CAST(N'2022-07-12 23:28:40.550' AS DateTime), 1, 2, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (66, NULL, CAST(N'2020-11-20 23:03:56.000' AS DateTime), 1, N'超级管理员', NULL, N'SELECT Role_Id AS id,parentId,Role_Id AS [key],RoleName AS value FROM Sys_Role', N'级联角色', N'tree_roles', 1, N'超级管理员', CAST(N'2020-11-20 23:08:03.217' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (67, NULL, CAST(N'2020-12-29 21:41:15.593' AS DateTime), 1, N'超级管理员', NULL, NULL, N'nav', N'nav', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (68, NULL, CAST(N'2022-01-03 18:29:14.040' AS DateTime), 1, N'超级管理员', NULL, NULL, N'满意度', N'满意度', 1, N'超级管理员', CAST(N'2022-06-27 00:52:39.887' AS DateTime), 1, NULL, 0, N'表单设计使用')
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (70, NULL, CAST(N'2022-09-06 00:48:09.877' AS DateTime), 1, N'超级管理员', NULL, NULL, N'请求方式', N'请求方式', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (71, NULL, CAST(N'2022-09-06 00:50:53.530' AS DateTime), 1, N'超级管理员', NULL, NULL, N'定时任务状态', N'定时任务状态', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Sys_Dictionary] ([Dic_ID], [Config], [CreateDate], [CreateID], [Creator], [DBServer], [DbSql], [DicName], [DicNo], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [ParentId], [Remark]) VALUES (72, NULL, CAST(N'2023-05-13 08:58:31.000' AS DateTime), 1, N'超级管理员', NULL, N'SELECT DepartmentId AS ''key'',DepartmentId AS ''id'',ParentId AS parentId,DepartmentName as ''value'' FROM Sys_Department', N'组织机构', N'组织机构', 1, NULL, NULL, NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_Dictionary] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_DictionaryList] ON 

GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (3, NULL, 1, N'admin', N'否', N'0', 3, NULL, N'超级管理员', CAST(N'2022-01-03 18:30:18.113' AS DateTime), 1, 2, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (4, NULL, 1, N'xxx', N'是', N'1', 3, NULL, N'超级管理员', CAST(N'2022-01-03 18:30:18.113' AS DateTime), 1, 1, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (22, CAST(N'2018-06-11 18:26:05.000' AS DateTime), 1, N'测试超级管理员', N'其他', N'0', 30, NULL, N'超级管理员', CAST(N'2019-08-21 16:49:43.000' AS DateTime), 1, 10, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (23, CAST(N'2018-06-11 18:26:05.000' AS DateTime), 1, N'测试超级管理员', N'成功', N'1', 30, NULL, N'超级管理员', CAST(N'2019-08-21 16:49:43.000' AS DateTime), 1, 100, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (24, CAST(N'2018-06-12 09:41:58.000' AS DateTime), 1, N'测试超级管理员', N'异常', N'2', 30, NULL, N'超级管理员', CAST(N'2019-08-21 16:49:43.000' AS DateTime), 1, 50, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (25, CAST(N'2018-06-12 14:46:08.000' AS DateTime), 1, N'测试超级管理员', N'系统', N'System', 31, NULL, N'超级管理员', CAST(N'2022-04-04 13:21:54.947' AS DateTime), 1, 100, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (26, CAST(N'2018-06-12 14:47:32.000' AS DateTime), 1, N'测试超级管理员', N'登陆', N'Login', 31, NULL, N'超级管理员', CAST(N'2022-04-04 13:21:54.947' AS DateTime), 1, 90, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (27, CAST(N'2018-06-15 15:29:58.000' AS DateTime), 1, N'测试超级管理员', N'新建', N'Add', 31, NULL, N'超级管理员', CAST(N'2022-04-04 13:21:54.943' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (28, CAST(N'2018-06-15 15:29:58.000' AS DateTime), 1, N'测试超级管理员', N'删除', N'Del', 31, 1, N'超级管理员', CAST(N'2022-04-04 13:21:54.943' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (29, CAST(N'2018-06-15 15:30:34.000' AS DateTime), 1, N'测试超级管理员', N'编辑', N'Edit', 31, 1, N'超级管理员', CAST(N'2022-04-04 13:21:54.943' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (37, CAST(N'2018-07-10 10:51:38.000' AS DateTime), 1, N'测试超级管理员', N'待审核', N'0', 35, 0, N'超级管理员', CAST(N'2023-05-08 01:05:44.193' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (38, CAST(N'2018-07-10 10:51:38.000' AS DateTime), 1, N'测试超级管理员', N'审核通过', N'1', 35, NULL, N'超级管理员', CAST(N'2023-05-08 01:05:44.193' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (39, CAST(N'2018-07-10 10:51:38.000' AS DateTime), 1, N'测试超级管理员', N'审核中', N'2', 35, 0, N'超级管理员', CAST(N'2023-05-08 01:05:44.193' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (64, CAST(N'2018-07-10 16:15:59.000' AS DateTime), 1, N'测试超级管理员', N'行业新闻', N'1', 44, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (65, CAST(N'2018-07-10 16:15:59.000' AS DateTime), 1, N'测试超级管理员', N'行情资讯', N'2', 44, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (71, CAST(N'2018-07-11 17:11:19.000' AS DateTime), 1, N'测试超级管理员', N'异常', N'Exception', 31, 0, N'超级管理员', CAST(N'2022-04-04 13:21:54.943' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (90, CAST(N'2018-07-23 10:04:45.000' AS DateTime), 1, N'测试超级管理员', N'男', N'0', 49, NULL, N'测试超级管理员', CAST(N'2018-07-23 11:10:28.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (91, CAST(N'2018-07-23 10:04:45.000' AS DateTime), 1, N'测试超级管理员', N'女', N'1', 49, NULL, N'测试超级管理员', CAST(N'2018-07-23 11:10:28.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (96, CAST(N'2018-07-23 15:36:43.000' AS DateTime), 1, N'测试超级管理员', N'未启用', N'0', 50, 1, N'超级管理员', CAST(N'2019-08-16 18:17:47.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (97, CAST(N'2018-07-23 15:36:43.000' AS DateTime), 1, N'测试超级管理员', N'已启用', N'1', 50, 1, N'超级管理员', CAST(N'2019-08-16 18:17:47.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (98, CAST(N'2018-07-23 15:36:43.000' AS DateTime), 1, N'测试超级管理员', N'已删除', N'2', 50, 1, N'超级管理员', CAST(N'2019-08-16 18:17:47.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (128, CAST(N'2018-08-29 15:54:21.000' AS DateTime), 1, N'测试超级管理员', N'是', N'1', 59, 0, N'超级管理员', CAST(N'2020-11-20 23:05:48.303' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (129, CAST(N'2018-08-29 15:54:21.000' AS DateTime), 1, N'测试超级管理员', N'否', N'0', 59, 1, N'超级管理员', CAST(N'2020-11-20 23:05:48.303' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (144, CAST(N'2019-08-21 16:40:50.000' AS DateTime), 1, N'超级管理员', N'刷新Token', N'ReplaceToeken', 31, NULL, N'超级管理员', CAST(N'2022-04-04 13:21:54.937' AS DateTime), 1, 110, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (145, CAST(N'2019-08-21 16:49:43.000' AS DateTime), 1, N'超级管理员', N'Info', N'3', 30, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (149, CAST(N'2019-09-18 19:25:47.000' AS DateTime), 1, N'超级管理员', N'发货', N'1', 64, 1, N'超级管理员', CAST(N'2019-11-01 10:04:20.837' AS DateTime), 1, NULL, N'fd')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (150, CAST(N'2019-09-18 19:25:47.000' AS DateTime), 1, N'超级管理员', N'退货', N'2', 64, 0, N'超级管理员', CAST(N'2019-11-01 10:04:20.837' AS DateTime), 1, NULL, N'fs')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (151, CAST(N'2019-09-18 19:25:47.000' AS DateTime), 1, N'超级管理员', N'返单', N'3', 64, 1, N'超级管理员', CAST(N'2019-11-01 10:04:20.833' AS DateTime), 1, NULL, N'xx')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (152, CAST(N'2019-09-19 10:07:23.000' AS DateTime), 1, N'超级管理员', N'家居', N'4', 65, 1, N'超级管理员', CAST(N'2020-02-07 17:57:12.107' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (153, CAST(N'2019-09-19 10:07:23.000' AS DateTime), 1, N'超级管理员', N'男装', N'3', 65, 1, N'超级管理员', CAST(N'2020-02-07 17:57:12.103' AS DateTime), 1, 4, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (154, CAST(N'2019-09-19 10:07:23.000' AS DateTime), 1, N'超级管理员', N'女装', N'2', 65, 0, N'超级管理员', CAST(N'2020-02-07 17:57:12.103' AS DateTime), 1, 6, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (155, CAST(N'2019-09-19 10:07:23.000' AS DateTime), 1, N'超级管理员', N'食品', N'1', 65, 0, N'超级管理员', CAST(N'2020-02-07 17:57:12.047' AS DateTime), 1, NULL, N'数码相机,单反相机')
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (423, CAST(N'2020-12-29 21:41:15.647' AS DateTime), 1, N'超级管理员', N'是', N'1', 67, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (424, CAST(N'2020-12-29 21:41:15.670' AS DateTime), 1, N'超级管理员', N'否', N'0', 67, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (425, CAST(N'2022-01-03 18:29:14.120' AS DateTime), 1, N'超级管理员', N'非常满意', N'非常满意', 68, 0, N'超级管理员', CAST(N'2022-01-03 18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (426, CAST(N'2022-01-03 18:29:14.127' AS DateTime), 1, N'超级管理员', N'十分满意', N'十分满意', 68, 0, N'超级管理员', CAST(N'2022-01-03 18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (427, CAST(N'2022-01-03 18:29:14.127' AS DateTime), 1, N'超级管理员', N'相当满意', N'相当满意', 68, 0, N'超级管理员', CAST(N'2022-01-03 18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (428, CAST(N'2022-01-03 18:37:39.750' AS DateTime), 1, N'超级管理员', N'比较满意', N'比较满意', 68, 0, N'超级管理员', CAST(N'2022-01-03 18:37:52.983' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (429, CAST(N'2022-01-03 19:14:32.960' AS DateTime), 1, N'超级管理员', N'数码相机', N'数码相机', 36, 0, N'超级管理员', CAST(N'2023-05-08 01:03:16.007' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (430, CAST(N'2022-01-03 19:14:32.960' AS DateTime), 1, N'超级管理员', N'单反相机', N'单反相机', 36, 0, N'超级管理员', CAST(N'2023-05-08 01:03:16.007' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (431, CAST(N'2022-01-03 19:14:32.960' AS DateTime), 1, N'超级管理员', N'微单相机', N'微单相机', 36, 0, N'超级管理员', CAST(N'2023-05-08 01:03:16.007' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (432, CAST(N'2022-01-03 19:14:32.960' AS DateTime), 1, N'超级管理员', N'运动相机', N'运动相机', 36, 0, N'超级管理员', CAST(N'2023-05-08 01:03:15.997' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (435, CAST(N'2022-08-29 02:59:52.130' AS DateTime), 1, N'超级管理员', N'审核未通过', N'3', 35, 0, N'超级管理员', CAST(N'2023-05-08 01:05:44.193' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (436, CAST(N'2022-09-06 00:48:09.920' AS DateTime), 1, N'超级管理员', N'get', N'get', 70, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (437, CAST(N'2022-09-06 00:48:09.927' AS DateTime), 1, N'超级管理员', N'post', N'post', 70, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (438, CAST(N'2022-09-06 00:50:53.533' AS DateTime), 1, N'超级管理员', N'正常', N'0', 71, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (439, CAST(N'2022-09-06 00:50:53.537' AS DateTime), 1, N'超级管理员', N'暂停', N'1', 71, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (440, CAST(N'2022-09-07 01:50:51.050' AS DateTime), 1, N'超级管理员', N'20', N'20', 37, 0, N'超级管理员', CAST(N'2023-05-13 10:49:00.073' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (441, CAST(N'2022-09-07 01:50:51.070' AS DateTime), 1, N'超级管理员', N'30', N'30', 37, 0, N'超级管理员', CAST(N'2023-05-13 10:49:00.067' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[Sys_DictionaryList] ([DicList_ID], [CreateDate], [CreateID], [Creator], [DicName], [DicValue], [Dic_ID], [Enable], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Remark]) VALUES (442, CAST(N'2023-05-08 01:05:44.193' AS DateTime), 1, N'超级管理员', N'驳回', N'4', 35, 0, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_DictionaryList] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Menu] ON 

GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (2, N'用户管理', N'[{"text":"查询","value":"Search"}]', N'el-icon-user', NULL, 1, 2400, N'.', 0, NULL, CAST(N'2017-08-28 12:21:13.000' AS DateTime), N'2017-08-28 11:12:45', CAST(N'2023-05-13 18:23:55.990' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (3, N'角色管理', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 900, N'Sys_Role', 2, N'/Sys_Role', CAST(N'2017-09-12 16:20:02.000' AS DateTime), N'2017-08-28 14:19:13', CAST(N'2023-05-08 02:10:41.200' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (5, N'日志管理', N'[{"text":"查询","value":"Search"}]', N'el-icon-date', NULL, 1, 1300, N'xxx', 0, N'/', CAST(N'2017-09-22 17:59:37.000' AS DateTime), N'2017-09-22 17:59:37', CAST(N'2023-05-13 11:09:23.653' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (6, N'系统日志', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'Sys_Log', 5, N'/Sys_Log/Manager', CAST(N'2017-09-22 18:00:25.000' AS DateTime), N'2017-09-22 18:0:25', CAST(N'2019-08-14 16:20:35.000' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (8, N'图表', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 10000, N'/', 32, N'chart', NULL, NULL, CAST(N'2020-04-05 21:20:29.177' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (9, N'用户管理', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 2000, N'Sys_User', 2, N'/Sys_User', NULL, NULL, CAST(N'2023-05-08 02:11:51.710' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (13, N'表单+图表', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 800, N'.', 55, N'/multi3', CAST(N'2017-08-28 14:22:08.000' AS DateTime), N'null', CAST(N'2023-05-13 11:15:47.880' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (25, N'其他组件', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1100, N'/', 29, N'/form6', NULL, NULL, CAST(N'2019-09-20 12:44:50.000' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (28, N'基础可编辑table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1500, N'vtable', 33, N'table1', NULL, NULL, CAST(N'2019-11-10 14:25:14.940' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (29, N'其他组件', N'[{"text":"查询","value":"Search"}]', N'el-icon-monitor', NULL, 1, 1690, N'/', 0, N'', NULL, NULL, CAST(N'2023-05-13 11:07:47.627' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (31, N'表单一对多table', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 950, N'App_TransactionAvgPrice1', 55, N'/multi1', NULL, NULL, CAST(N'2019-11-08 17:06:27.160' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (32, N'图表+表单', N'[{"text":"查询","value":"Search"}]', N'el-icon-full-screen', NULL, 1, 1720, N'/', 0, N'', NULL, NULL, CAST(N'2023-05-13 11:06:36.577' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (33, N'table组件', N'[{"text":"查询","value":"Search"}]', N'el-icon-mobile-phone', NULL, 1, 1710, N'tables', 0, N'/', NULL, NULL, CAST(N'2023-05-13 11:06:56.587' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (34, N'表单与上传下载', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 0, N'表单与上传下载', 84, N'/formUpload', NULL, NULL, CAST(N'2019-11-24 21:07:25.177' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (36, N'图表+表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'/', 32, N'formChart', NULL, NULL, CAST(N'2019-11-09 18:23:53.990' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (37, N'图片上传与预览 ', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 800, N'图片上传与预览 ', 84, N'', NULL, NULL, CAST(N'2019-11-24 08:24:39.550' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (40, N'api加载table数据', N'[{"text":"查询","value":"Search"}]', N'ivu-icon ivu-icon-ios-add-circle', NULL, 1, 900, N'table2', 33, N'table2', NULL, NULL, CAST(N'2019-11-10 14:25:09.340' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (42, N'下载已上传文件', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'下载已上传文件', 84, N'', NULL, NULL, CAST(N'2019-11-24 08:25:12.490' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (45, N'不用节点', N'', N'', NULL, 0, 0, N'/', 0, NULL, NULL, NULL, CAST(N'2020-05-05 13:20:14.130' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (48, N'单表数据', N'[{"text":"查询","value":"Search"}]', N'el-icon-news', NULL, 1, 2000, N'Table+表单数据', 0, N'/', CAST(N'2019-07-12 13:26:32.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:05:00.173' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (49, N'只读页面', N'[{"text":"查询","value":"Search"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"test","value":"test"}]', N'el-icon-postcard', NULL, 1, 1000, N'App_Appointment', 48, N'/App_Appointment', CAST(N'2019-07-12 13:28:17.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:17:30.247' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (50, N'自动数据源', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 900, N'App_TransactionAvgPrice', 48, N'/App_TransactionAvgPrice', CAST(N'2019-07-12 13:53:32.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:10:03.150' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (51, N'自定义扩展一对多', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 800, N'App_ReportPrice', 74, N'/App_ReportPrice', CAST(N'2019-07-12 13:55:21.000' AS DateTime), N'超级管理员', CAST(N'2022-08-22 01:02:59.227' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (52, N'导入导出表单', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 600, N'App_Transaction', 48, N'/App_Transaction', CAST(N'2019-07-12 13:56:15.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:16:49.197' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (53, N'混合表单一对多', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 900, N'App_ReportPrice', 55, N'/multi2', CAST(N'2019-07-12 13:57:05.000' AS DateTime), N'超级管理员', CAST(N'2019-11-08 19:03:19.680' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (55, N'表单一对多', N'[{"text":"查询","value":"Search"}]', N'el-icon-c-scale-to-original', NULL, 1, 1740, N'/', 0, NULL, CAST(N'2019-07-12 13:58:34.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:06:06.910' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (56, N'表单布局', N'[{"text":"查询","value":"Search"}]', N'el-icon-mouse', NULL, 1, 1750, N'/', 0, NULL, CAST(N'2019-07-12 14:00:19.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:35:03.910' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (57, N'单列表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1000, N'.', 56, N'/form1', CAST(N'2019-07-12 14:01:12.000' AS DateTime), N'超级管理员', CAST(N'2020-04-05 21:11:52.390' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (58, N'两列表单', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 900, N'两列表单', 56, N'/form2', CAST(N'2019-07-12 14:01:43.000' AS DateTime), N'超级管理员', CAST(N'2019-09-20 13:59:03.000' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (59, N'多列表单', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 800, N'多列表单', 56, N'/form3', CAST(N'2019-07-12 14:02:17.000' AS DateTime), N'超级管理员', CAST(N'2020-04-07 21:48:03.980' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (60, N'Table+表单', N'[{"text":"查询","value":"Search"}]', N'el-icon-mouse', NULL, 1, 700, N'Table+表单', 56, N'/form4', CAST(N'2019-07-12 14:03:14.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:34:48.137' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (61, N'系统设置', N'[{"text":"查询","value":"Search"}]', N'el-icon-setting', NULL, 1, 1000, N'系统设置', 0, N'/', CAST(N'2019-07-12 14:04:04.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:09:04.317' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (62, N'菜单设置', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 10, N'Sys_Menu', 61, N'/sysmenu', CAST(N'2019-07-12 14:04:35.000' AS DateTime), N'超级管理员', CAST(N'2019-10-24 12:00:38.507' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (63, N'下拉框绑定设置', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 10, N'Sys_Dictionary', 61, N'/Sys_Dictionary', CAST(N'2019-07-12 14:05:58.000' AS DateTime), N'超级管理员', CAST(N'2019-08-16 17:41:15.000' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (64, N'代码生成', N'[{"text":"查询","value":"Search"}]', N'el-icon-edit', NULL, 1, 1500, N'代码生成', 0, N'/coding', CAST(N'2019-07-12 14:07:55.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:08:42.787' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (65, N'代码生成', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 10, N'/', 64, N'/coder', CAST(N'2019-07-12 14:08:58.000' AS DateTime), N'超级管理员', CAST(N'2022-01-03 19:01:20.673' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (66, N'编辑器与HTML', N'[{"text":"查询","value":"Search"}]', N'el-icon-document-copy', NULL, 1, 1520, N'静态页面发布', 0, N'/', CAST(N'2019-07-12 14:12:38.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:08:55.940' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (67, N'静态页面发布', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'App_News', 66, N'/App_News', CAST(N'2019-07-12 14:14:16.000' AS DateTime), N'超级管理员', CAST(N'2019-12-22 14:46:38.830' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (68, N'图片上传', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 700, N'App_Expert', 48, N'/App_Expert', CAST(N'2019-07-12 14:24:15.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:10:17.480' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (71, N'权限管理', N'[{"text":"查询","value":"Search"},{"text":"编辑","value":"Update"}]', N'ivu-icon ivu-icon-ios-boat', NULL, 1, 1000, N',', 2, N'/permission', CAST(N'2019-08-10 10:25:36.000' AS DateTime), N'超级管理员', CAST(N'2023-05-08 02:11:07.183' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (72, N'移动H5开发', N'[{"text":"查询","value":"Search"}]', N'el-icon-mobile', NULL, 1, 1650, N'/', 0, N'', CAST(N'2019-08-14 13:16:06.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:07:59.450' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (73, N'移动H5开发打包介绍', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, NULL, N'/', 72, N'/app/guide', CAST(N'2019-08-14 13:16:55.000' AS DateTime), N'超级管理员', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (74, N'一对一(多)', N'[{"text":"查询","value":"Search"}]', N'el-icon-copy-document', NULL, 1, 1770, N'/', 0, N'/', CAST(N'2019-08-22 17:43:58.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:05:17.753' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (75, N'主从一对一(1)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'', NULL, 1, 1000, N'SellOrder', 74, N'/SellOrder', CAST(N'2019-08-22 18:12:43.000' AS DateTime), N'超级管理员', CAST(N'2021-03-14 22:21:06.567' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (77, N'表单只读', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 600, N'表单只读', 56, N'/form7', CAST(N'2019-08-26 11:58:55.000' AS DateTime), N'超级管理员', CAST(N'2019-09-20 13:59:13.000' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (84, N'文件上传', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"},{"text":"审核","value":"Audit"}]', N'el-icon-document', NULL, 1, 1700, N'文件上传', 0, N'/', CAST(N'2019-11-11 12:59:02.637' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:07:15.620' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (85, N'基本文件上传', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1000, N'基本文件上传', 84, N'/volUploadExample', CAST(N'2019-11-20 18:03:07.417' AS DateTime), N'超级管理员', CAST(N'2019-12-17 11:18:34.193' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (86, N'后台校验', N'[{"text":"查询","value":"Search"}]', N'el-icon-connection', NULL, 1, 1700, N'/', 0, N'', CAST(N'2019-11-22 11:17:21.897' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:07:30.840' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (87, N'KindEditor编辑器', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1000, N'KindEditor编辑器', 66, N'/kindEditor', CAST(N'2019-12-19 11:37:30.843' AS DateTime), N'超级管理员', CAST(N'2019-12-23 10:01:38.163' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (88, N'静态页面列表', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 900, N'htmlList', 66, N'/htmlList', CAST(N'2019-12-22 14:31:21.500' AS DateTime), N'超级管理员', CAST(N'2019-12-23 10:01:42.770' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (89, N'后台参数校验', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 1700, N'.', 86, N'/validator', CAST(N'2020-02-02 17:00:05.203' AS DateTime), N'超级管理员', CAST(N'2020-02-02 17:00:49.313' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (90, N'从表图片上传', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'vSellOrderImg', 74, N'/vSellOrderImg', CAST(N'2020-04-07 20:41:33.930' AS DateTime), N'超级管理员', CAST(N'2022-05-23 21:14:40.880' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (91, N'数字排版', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'数字排版', 32, N'/flex', CAST(N'2020-04-07 21:51:38.487' AS DateTime), N'超级管理员', CAST(N'2019-11-09 18:23:53.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (92, N'树形菜单', N'[{"text":"查询","value":"Search"}]', N'el-icon-bank-card', NULL, 1, 1705, N'树形菜单与表', 0, N'', CAST(N'2020-04-26 14:19:01.283' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:07:06.673' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (93, N'tree与代码生成页面', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 1000, N'tree与代码生成页面', 92, N'treetable1', CAST(N'2020-04-26 14:20:35.840' AS DateTime), N'超级管理员', CAST(N'2020-04-26 14:19:51.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (94, N'tree与自定义table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'treetable2', 92, N'/treetable2', CAST(N'2020-04-26 18:12:46.497' AS DateTime), N'超级管理员', CAST(N'2020-04-26 14:19:51.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (96, N'默认编辑器', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"},{"text":"上传","value":"Upload"}]', N'', NULL, 1, 0, N'App_NewsEditor', 48, N'/App_NewsEditor', CAST(N'2021-01-16 10:57:44.280' AS DateTime), N'超级管理员', CAST(N'2019-11-17 19:10:37.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (97, N'多列合并显示', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 0, N'App_Expert2', 48, N'/App_Expert2', CAST(N'2021-03-06 15:51:13.727' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:12:37.237' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (98, N'主从一对一(2)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 990, N'SellOrder2', 74, N'/SellOrder2', CAST(N'2021-03-14 22:20:12.583' AS DateTime), N'超级管理员', CAST(N'2021-03-14 22:21:13.203' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (99, N'主从一对多(3)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 980, N'SellOrder3', 74, N'/SellOrder3', CAST(N'2021-03-14 22:42:48.537' AS DateTime), N'超级管理员', CAST(N'2021-03-14 22:21:13.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (100, N'表格编辑', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'App_Transaction2', 48, N'/App_Transaction2', CAST(N'2021-03-19 22:35:06.357' AS DateTime), N'超级管理员', CAST(N'2019-10-31 10:09:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (101, N'table编辑(2)', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'table3', 33, N'/table3', CAST(N'2021-03-20 12:58:52.953' AS DateTime), N'超级管理员', CAST(N'2019-11-10 14:25:09.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (104, N'角色管理(tree)', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 0, 0, N'Sys_Role1', 2, N'/Sys_Role1', CAST(N'2021-05-02 13:41:35.287' AS DateTime), N'超级管理员', CAST(N'2023-05-13 08:51:01.390' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (105, N'tree自定义table数据', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'/treetable2', 92, N'/treetable2', CAST(N'2021-05-02 15:06:12.423' AS DateTime), N'超级管理员', CAST(N'2021-05-02 15:05:15.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (106, N'表单设计', N'[{"text":"查询","value":"Search"}]', N'el-icon-postcard', NULL, 1, 3000, N'.', 0, N'', CAST(N'2021-08-28 00:39:03.907' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:04:27.993' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (107, N'表单设计', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 100, N'.', 106, N'/formDraggable', CAST(N'2021-08-28 00:40:00.293' AS DateTime), N'超级管理员', CAST(N'2022-01-03 19:01:45.043' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (109, N'表单配置', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 0, N'FormDesignOptions', 106, N'/FormDesignOptions', CAST(N'2021-12-29 23:27:28.453' AS DateTime), N'超级管理员', CAST(N'2022-01-03 19:03:57.537' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (110, N'数据采集', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'.', 106, N'/formCollectionResultTree', CAST(N'2021-12-29 23:28:44.173' AS DateTime), N'超级管理员', CAST(N'2021-12-30 23:11:50.513' AS DateTime), N'超级管理员', NULL)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (113, N'基础页面', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 9000, N'.', 0, N'', CAST(N'2022-03-26 00:58:41.000' AS DateTime), N'超级管理员', CAST(N'2022-04-04 13:39:53.600' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (114, N'只读页面', N'', N'', NULL, 1, 10, N'App_Appointment', 123, N'pages/order/App_Appointment/App_Appointment', CAST(N'2022-03-26 00:59:36.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:39:42.623' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (115, N'水平显示', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'.', 113, N'/pages/order/App_Appointment1/App_Appointment1', CAST(N'2022-03-26 01:00:38.000' AS DateTime), N'超级管理员', CAST(N'2022-08-22 01:13:22.003' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (116, N'数据源绑定', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 8500, N'.', 0, N'', CAST(N'2022-03-26 02:03:48.000' AS DateTime), N'超级管理员', CAST(N'2022-04-04 13:39:49.603' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (117, N'数据源绑定', N'', N'', NULL, 1, 10, N'App_TransactionAvgPrice', 116, N'pages/appmanager/App_TransactionAvgPrice/App_TransactionAvgPrice', CAST(N'2022-03-26 02:04:58.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:38:12.497' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (118, N'事件格式化', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 8200, N'.', 0, N'', CAST(N'2022-03-26 03:08:59.000' AS DateTime), N'超级管理员', CAST(N'2022-04-04 13:40:00.947' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (119, N'事件绑定', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导入","value":"Import"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 10, N'App_Transaction', 118, N'/pages/appmanager/App_Transaction/App_Transaction', CAST(N'2022-03-26 03:09:17.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 11:16:37.033' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (120, N'格式化', N'', N'', NULL, 1, 0, N'.', 118, N'/pages/appmanager/App_Transaction1/App_Transaction1', CAST(N'2022-03-26 03:09:45.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:38:49.790' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (121, N'主从表页面', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 8100, N'.', 0, N'', CAST(N'2022-03-26 03:10:46.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 13:54:31.873' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (122, N'主表1对1', N'', N'', NULL, 1, 0, N'SellOrder', 121, N'/pages/order/SellOrder/SellOrder', CAST(N'2022-03-26 03:11:13.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:39:07.800' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (123, N'表单vol-form', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 8000, N'.', 0, N'', CAST(N'2022-03-26 03:12:06.000' AS DateTime), N'超级管理员', CAST(N'2022-08-16 00:56:14.550' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (124, N'表单配置', N'', N'', NULL, 1, 10, N'.', 123, N'/pages/form/form2', CAST(N'2022-03-26 03:12:39.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:39:44.700' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (125, N'表单只读', N'', N'', NULL, 1, 0, N'.', 113, N'pages/form/form1', CAST(N'2022-03-26 03:12:52.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:38:00.233' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (126, N'表格vol-table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 7900, N'.', 0, N'', CAST(N'2022-03-26 03:13:22.000' AS DateTime), N'超级管理员', CAST(N'2023-05-13 13:54:36.220' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (127, N'列表显示table', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'.', 126, N'pages/table/table2/table2', CAST(N'2022-03-26 03:13:47.000' AS DateTime), N'超级管理员', CAST(N'2022-08-16 00:56:12.420' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (128, N'表格显示table', N'', N'', NULL, 1, 0, N'App_Expert', 126, N'/pages/table/table1/table1', CAST(N'2022-03-26 03:13:59.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:40:01.087' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (129, N'自定义扩展', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 8050, N'.', 0, N'', CAST(N'2022-03-26 03:16:13.000' AS DateTime), N'超级管理员', CAST(N'2022-08-16 00:56:19.537' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (130, N'生成页面扩展组件', N'', N'', NULL, 1, 0, N'.', 129, N'pages/pagedemo/pagedemo', CAST(N'2022-03-26 03:16:51.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:39:26.357' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (131, N'手动绑定数据', N'', N'', NULL, 1, 0, N'.', 126, N'pages/table/table3/table3', CAST(N'2022-03-27 03:02:06.000' AS DateTime), N'超级管理员', CAST(N'2022-03-27 15:40:03.403' AS DateTime), N'超级管理员', 1)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (132, N'消息推送', N'[{"text":"查询","value":"Search"}]', N'el-icon-chat-line-round', NULL, 1, 1700, N'.', 0, N'/signalR', CAST(N'2022-05-03 03:31:02.093' AS DateTime), N'超级管理员', CAST(N'2022-05-03 03:31:19.693' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (133, N'流程管理', N'[{"text":"查询","value":"Search"}]', N'el-icon-mobile', NULL, 1, 2500, N'流程管理', 0, N'', CAST(N'2022-07-25 00:39:21.913' AS DateTime), N'超级管理员', CAST(N'2023-05-13 18:24:03.953' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (134, N'流程管理', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'Sys_WorkFlow', 133, N'/Sys_WorkFlow', CAST(N'2022-07-25 00:39:55.930' AS DateTime), N'超级管理员', CAST(N'2022-08-01 03:18:05.227' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (135, N'我的审批', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"}]', N'', NULL, 1, 0, N'Sys_WorkFlowTable', 133, N'/Sys_WorkFlowTable', CAST(N'2022-08-01 00:35:05.387' AS DateTime), N'超级管理员', CAST(N'2022-08-16 01:00:45.523' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (136, N'发起流程', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 0, N'发起流程', 133, N'/flowdemo', CAST(N'2022-08-16 00:21:39.313' AS DateTime), N'超级管理员', CAST(N'2022-08-16 00:21:45.720' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (137, N'定时任务', N'[{"text":"查询","value":"Search"}]', N'el-icon-alarm-clock', NULL, 1, 1725, N'定时任务', 0, N'', CAST(N'2022-09-05 03:19:09.657' AS DateTime), N'超级管理员', CAST(N'2022-08-01 00:33:46.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (138, N'任务配置', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 0, N'Sys_QuartzOptions', 137, N'/Sys_QuartzOptions', CAST(N'2022-09-05 03:19:44.700' AS DateTime), N'超级管理员', CAST(N'2022-08-01 00:33:46.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (139, N'执行记录', N'[{"text":"查询","value":"Search"},{"text":"删除","value":"Delete"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 0, N'Sys_QuartzLog', 137, N'/Sys_QuartzLog', CAST(N'2022-09-05 03:20:06.227' AS DateTime), N'超级管理员', CAST(N'2022-09-05 03:20:08.263' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (142, N'组织架构', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"},{"text":"导出","value":"Export"}]', N'', NULL, 1, 2500, N'Sys_Department', 2, N'/Sys_Department', CAST(N'2023-05-08 02:12:15.200' AS DateTime), N'超级管理员', CAST(N'2023-05-08 02:12:43.127' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (143, N'多页签/多表头', N'[{"text":"查询","value":"Search"}]', N'el-icon-document', NULL, 1, 1760, N'.', 0, N'', CAST(N'2023-05-13 18:26:48.940' AS DateTime), N'超级管理员', CAST(N'2023-05-13 18:27:01.230' AS DateTime), N'超级管理员', 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (144, N'多页签', N'[{"text":"查询","value":"Search"}]', N'', NULL, 1, 200, N'.', 143, N'/tabsTable', CAST(N'2023-05-13 18:27:27.757' AS DateTime), N'超级管理员', CAST(N'2023-05-13 18:27:01.000' AS DateTime), NULL, 0)
GO
INSERT [dbo].[Sys_Menu] ([Menu_Id], [MenuName], [Auth], [Icon], [Description], [Enable], [OrderNo], [TableName], [ParentId], [Url], [CreateDate], [Creator], [ModifyDate], [Modifier], [MenuType]) VALUES (145, N'多表头', N'[{"text":"查询","value":"Search"},{"text":"新建","value":"Add"},{"text":"删除","value":"Delete"},{"text":"编辑","value":"Update"}]', N'', NULL, 1, 100, N'.', 143, N'/App_Appointment2', CAST(N'2023-05-13 18:27:47.737' AS DateTime), N'超级管理员', CAST(N'2023-05-13 18:27:01.000' AS DateTime), NULL, 0)
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
INSERT [dbo].[Sys_QuartzOptions] ([Id], [TaskName], [GroupName], [CronExpression], [Method], [ApiUrl], [AuthKey], [AuthValue], [Describe], [LastRunTime], [Status], [PostData], [TimeOut], [CreateID], [Creator], [CreateDate], [ModifyID], [Modifier], [ModifyDate]) VALUES (N'7d223549-c8ee-461d-80a9-e4601eeb5c0a', N'1秒执行一次', N'测试', N'* * * * * ?	', N'get', N'http://localhost:9991/api/Sys_QuartzOptions/test', NULL, NULL, NULL, CAST(N'2023-05-13 11:35:22.013' AS DateTime), 1, NULL, 180, 1, N'超级管理员', CAST(N'2022-09-07 01:45:04.000' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_Role] ON 

GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (1, CAST(N'2018-08-23 11:46:06.000' AS DateTime), N'超级管理员', NULL, N'无', 0, 1, N'测试超级管理员', CAST(N'2018-09-06 17:08:35.000' AS DateTime), 1000, 0, N'超级管理员')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (2, CAST(N'2018-08-23 11:46:52.000' AS DateTime), N'超级管理员', NULL, N'1', 0, 1, N'超级管理员', CAST(N'2022-04-17 20:11:05.000' AS DateTime), NULL, 1, N'测试管理员')
GO
INSERT [dbo].[Sys_Role] ([Role_Id], [CreateDate], [Creator], [DeleteBy], [DeptName], [Dept_Id], [Enable], [Modifier], [ModifyDate], [OrderNo], [ParentId], [RoleName]) VALUES (4, CAST(N'2018-08-23 11:47:41.000' AS DateTime), N'超级管理员', NULL, N'无  ', 0, 1, N'超级管理员', CAST(N'2019-12-08 21:11:11.000' AS DateTime), NULL, 2, N'信息员')
GO
SET IDENTITY_INSERT [dbo].[Sys_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_RoleAuth] ON 

GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (1, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 9, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (2, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 53, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (3, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 50, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (4, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 40, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (5, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 3, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (6, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 37, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (7, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 51, N'超级管理员', CAST(N'2022-08-22 01:13:37.823' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (8, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 59, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (9, N'Search,Add,Delete,Update', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 13, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (10, N'', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 44, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (11, N'', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 24, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (12, N'', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 35, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (13, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 60, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (14, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 58, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (15, N'Search,Add,Delete,Update,Export,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 68, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (16, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 52, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (17, N'Search,Add,Delete,Update', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 65, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (18, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 62, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (19, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 63, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (20, N'', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 54, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (21, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 94, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (22, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 42, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (23, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 34, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (24, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 90, N'超级管理员', CAST(N'2022-08-16 00:56:47.903' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (25, N'Search,Add,Delete,Update,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 67, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (26, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 91, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (27, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 36, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (28, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 77, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (29, N'Search,Delete,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 6, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (30, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 88, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (31, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 61, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (32, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 8, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (33, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 48, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (34, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 74, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (35, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 56, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (36, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 55, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (37, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 32, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (38, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 33, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (39, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 92, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (40, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 89, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (41, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 86, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (42, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 84, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (43, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 29, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (44, N'Search,Add,Delete,Update,Import,Export', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 31, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (45, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 72, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (46, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 66, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (47, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 28, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (48, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 64, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (49, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 5, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (50, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 25, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (51, N'Search,Add,Delete,Update', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 93, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (52, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 85, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (53, N'Search,Add,Delete,Update,Import,Export,Upload,Audit', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 75, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (54, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 87, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (55, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 57, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (56, N'Search,Import,Export,test', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 49, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (57, N'Search,Update', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 71, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (58, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 2, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (59, N'Search', CAST(N'2020-05-05 13:23:11.197' AS DateTime), N'超级管理员', 73, N'超级管理员', CAST(N'2020-05-05 13:23:11.197' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (60, N'Search', CAST(N'2022-08-16 00:56:47.903' AS DateTime), N'超级管理员', 133, N'超级管理员', CAST(N'2022-08-16 00:56:47.903' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (61, N'Search,Add,Delete,Update,Export', CAST(N'2022-08-16 00:56:47.903' AS DateTime), N'超级管理员', 134, N'超级管理员', CAST(N'2022-08-16 00:56:47.903' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (62, N'Search,Delete', CAST(N'2022-08-16 00:56:47.903' AS DateTime), N'超级管理员', 135, N'超级管理员', CAST(N'2022-08-16 00:56:47.903' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (63, N'Search', CAST(N'2022-08-16 00:56:47.903' AS DateTime), N'超级管理员', 136, N'超级管理员', CAST(N'2022-08-16 00:56:47.903' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (64, N'Search', CAST(N'2022-08-22 01:13:37.823' AS DateTime), N'超级管理员', 113, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (65, N'Search', CAST(N'2022-08-22 01:13:37.823' AS DateTime), N'超级管理员', 115, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (66, N'Search', CAST(N'2022-09-09 17:53:16.153' AS DateTime), N'超级管理员', 118, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (67, N'Search,Add,Delete,Update,Import,Export', CAST(N'2022-09-09 17:53:16.153' AS DateTime), N'超级管理员', 119, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (68, N'Search', CAST(N'2022-09-09 17:53:20.693' AS DateTime), N'超级管理员', 116, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (69, N'Search', CAST(N'2022-09-09 17:53:37.963' AS DateTime), N'超级管理员', 129, N'超级管理员', CAST(N'2022-09-09 17:53:37.963' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (70, N'Search', CAST(N'2022-09-09 17:53:44.957' AS DateTime), N'超级管理员', 106, N'超级管理员', CAST(N'2022-09-09 17:53:44.957' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (71, N'Search', CAST(N'2022-09-09 17:53:44.957' AS DateTime), N'超级管理员', 107, N'超级管理员', CAST(N'2022-09-09 17:53:44.957' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (72, N'Search', CAST(N'2022-09-09 17:53:44.957' AS DateTime), N'超级管理员', 127, N'超级管理员', CAST(N'2022-09-09 17:53:44.957' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (73, N'Search,Add,Delete,Update', CAST(N'2022-09-09 17:53:44.957' AS DateTime), N'超级管理员', 109, N'超级管理员', CAST(N'2022-09-09 17:53:44.957' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (74, N'Search,Delete,Export', CAST(N'2022-09-09 17:53:44.957' AS DateTime), N'超级管理员', 110, N'超级管理员', CAST(N'2022-09-09 17:53:44.957' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (75, N'Search', CAST(N'2022-09-09 17:54:02.607' AS DateTime), N'超级管理员', 137, N'超级管理员', CAST(N'2022-09-09 17:54:02.607' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (76, N'Search,Add,Delete,Update', CAST(N'2022-09-09 17:54:02.607' AS DateTime), N'超级管理员', 138, N'超级管理员', CAST(N'2022-09-09 17:54:02.607' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (77, N'Search,Delete,Export', CAST(N'2022-09-09 17:54:02.607' AS DateTime), N'超级管理员', 139, N'超级管理员', CAST(N'2022-09-09 17:54:02.607' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (78, N'Search', CAST(N'2022-09-09 17:55:31.273' AS DateTime), N'zs', 129, N'zs', CAST(N'2022-09-09 17:55:31.273' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (79, N'Search', CAST(N'2022-09-09 17:55:31.273' AS DateTime), N'zs', 106, N'zs', CAST(N'2022-09-09 17:55:31.273' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (80, N'Search', CAST(N'2022-09-09 17:55:31.273' AS DateTime), N'zs', 107, N'zs', CAST(N'2022-09-09 17:55:31.273' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (81, N'Search,Add,Delete,Update', CAST(N'2022-09-09 17:55:31.273' AS DateTime), N'zs', 109, N'zs', CAST(N'2022-09-09 17:55:31.273' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (82, N'Search,Delete,Export', CAST(N'2022-09-09 17:55:31.273' AS DateTime), N'zs', 110, N'zs', CAST(N'2022-09-09 17:55:31.273' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (83, N'Search', CAST(N'2023-02-03 16:51:47.783' AS DateTime), N'超级管理员', 113, N'超级管理员', CAST(N'2023-02-03 16:51:47.783' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (84, N'Search', CAST(N'2023-02-03 16:51:47.783' AS DateTime), N'超级管理员', 116, N'超级管理员', CAST(N'2023-02-03 16:51:47.783' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (85, N'Search', CAST(N'2023-02-03 16:51:47.783' AS DateTime), N'超级管理员', 118, N'超级管理员', CAST(N'2023-02-03 16:51:47.783' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (86, N'Search,Add,Delete,Update', CAST(N'2023-02-03 16:51:47.783' AS DateTime), N'超级管理员', 119, N'超级管理员', CAST(N'2023-02-03 16:51:47.783' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (87, N'Search', CAST(N'2023-02-03 16:51:47.783' AS DateTime), N'超级管理员', 115, N'超级管理员', CAST(N'2023-02-03 16:51:47.783' AS DateTime), 4, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (88, N'Search', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 101, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (89, N'Search,Add,Delete,Update,Import,Export', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 100, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (90, N'Search,Add,Delete,Update,Import,Export,Upload', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 96, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (91, N'Search', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 105, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (92, N'Search,Add,Delete,Update,Import,Export', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 99, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (93, N'Search,Add,Delete,Update,Import,Export', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 98, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (94, N'Search', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 132, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (95, N'Search,Add,Delete,Update,Export', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 142, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (96, N'Search,Add,Delete,Update', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 97, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (97, N'Search', CAST(N'2023-05-13 13:53:23.677' AS DateTime), N'超级管理员', 123, N'超级管理员', CAST(N'2023-05-13 13:53:23.677' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (98, N'Search', CAST(N'2023-05-13 13:54:48.570' AS DateTime), N'超级管理员', 121, N'超级管理员', CAST(N'2023-05-13 13:54:48.570' AS DateTime), 2, NULL)
GO
INSERT [dbo].[Sys_RoleAuth] ([Auth_Id], [AuthValue], [CreateDate], [Creator], [Menu_Id], [Modifier], [ModifyDate], [Role_Id], [User_Id]) VALUES (99, N'Search', CAST(N'2023-05-13 13:54:48.570' AS DateTime), N'超级管理员', 126, N'超级管理员', CAST(N'2023-05-13 13:54:48.570' AS DateTime), 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_RoleAuth] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] ON 

GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (20, NULL, NULL, NULL, NULL, N'角色ID', N'Role_Id', N'int', 70, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1420, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (21, NULL, NULL, NULL, NULL, N'父级ID', N'ParentId', N'int', 70, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1410, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (22, NULL, NULL, NULL, NULL, N'角色名称', N'RoleName', N'string', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1400, N'', NULL, 1, N'text', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (23, NULL, NULL, NULL, NULL, N'部门ID', N'Dept_Id', N'int', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1390, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (24, NULL, NULL, NULL, NULL, N'部门名称', N'DeptName', N'string', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 2, N'', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1380, N'', NULL, 1, N'text', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (25, NULL, NULL, NULL, NULL, N'排序', N'OrderNo', N'int', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1370, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (26, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 4, N'', NULL, 1, 1, NULL, 0, 1, 1, 100, N'超级管理员', CAST(N'2023-02-03 17:22:23.413' AS DateTime), 1, 1360, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (27, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 4, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-02-03 17:22:23.413' AS DateTime), 1, 1350, N'', NULL, 2, N'datetime', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (28, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 5, N'', NULL, 1, 1, NULL, 0, 1, 1, 100, N'超级管理员', CAST(N'2023-02-03 17:22:23.413' AS DateTime), 1, 1340, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (29, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, 5, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-02-03 17:22:23.413' AS DateTime), 1, 1330, N'', NULL, 2, N'datetime', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (30, NULL, NULL, NULL, NULL, N'', N'DeleteBy', N'string', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 0, 0, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-02-03 17:22:23.413' AS DateTime), 1, 1320, N'', NULL, NULL, N'', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (31, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, N'', CAST(N'2018-06-04 10:14:21.000' AS DateTime), NULL, NULL, N'enable', NULL, 2, N'switch', NULL, 1, 1, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-02-03 17:22:23.410' AS DateTime), 1, 1375, N'', NULL, 1, N'select', 0, N'Sys_Role', 2)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (32, NULL, NULL, NULL, NULL, N'字典ID', N'Dic_ID', N'int', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1300, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (33, NULL, NULL, NULL, NULL, N'字典名称', N'DicName', N'string', 140, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1290, NULL, NULL, 1, N'textarea', 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (34, NULL, NULL, NULL, NULL, N'父级ID', N'ParentId', N'int', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1280, NULL, NULL, 1, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (35, NULL, NULL, NULL, NULL, N'配置项', N'Config', N'string', 300, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1270, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (36, NULL, NULL, NULL, 8, N'sql语句', N'DbSql', N'string', 200, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 6, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1260, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (37, NULL, NULL, NULL, NULL, N'DBServer', N'DBServer', N'string', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1250, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (38, NULL, NULL, NULL, NULL, N'排序号', N'OrderNo', N'int', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1240, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (39, NULL, NULL, NULL, NULL, N'字典编号', N'DicNo', N'string', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2022-07-18 01:41:33.523' AS DateTime), 1, 1295, NULL, NULL, 1, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (40, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 6, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 4000, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1220, NULL, NULL, NULL, N'无', 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (41, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, N'enable', NULL, 2, N'select', NULL, 1, 1, NULL, 0, 0, 0, 1, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1210, NULL, NULL, 2, N'select', 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (42, NULL, NULL, NULL, NULL, NULL, N'CreateID', N'int', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (43, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1190, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (44, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, 2, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1180, NULL, NULL, 2, N'datetime', 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (45, NULL, NULL, NULL, NULL, NULL, N'ModifyID', N'int', 90, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1170, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (46, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1160, NULL, NULL, NULL, NULL, 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (47, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2018-06-06 14:05:43.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'datetime', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2022-07-18 01:41:33.527' AS DateTime), 1, 1150, NULL, NULL, 2, N'datetime', 0, N'Sys_Dictionary', 3)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (48, NULL, NULL, NULL, NULL, N'', N'DicList_ID', N'int', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2022-06-27 00:37:25.103' AS DateTime), 1, 1140, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (49, NULL, NULL, NULL, NULL, N'数据源ID', N'Dic_ID', N'int', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 1, NULL, 0, 1, 1, 4, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1130, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (50, NULL, NULL, NULL, NULL, N'数据源Value', N'DicValue', N'string', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1120, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (51, NULL, NULL, NULL, NULL, N'数据源Text', N'DicName', N'string', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1110, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (52, NULL, NULL, NULL, NULL, N'排序号', N'OrderNo', N'int', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'text', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1100, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (53, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'pz', NULL, 1, N'selectList', NULL, 1, 1, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1090, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (54, NULL, NULL, NULL, NULL, N'是否可用', N'Enable', N'byte', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'enable', NULL, 1, N'switch', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1080, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (55, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'无', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1070, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (56, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1060, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (57, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1050, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (58, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1040, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (59, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1030, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (60, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, N'', CAST(N'2018-06-06 14:12:18.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-06-27 00:37:25.120' AS DateTime), 1, 1020, N'', NULL, NULL, N'', 0, N'Sys_DictionaryList', 4)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (61, NULL, NULL, NULL, NULL, NULL, N'Id', N'int', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2022-07-18 01:41:17.837' AS DateTime), 1, 10000, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (62, NULL, NULL, NULL, 12, N'日志类型', N'LogType', N'string', 80, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, N'log', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 8888, NULL, NULL, 3, N'checkbox', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (63, NULL, NULL, NULL, NULL, N'请求参数', N'RequestParameter', N'string', 70, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7990, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (64, NULL, NULL, NULL, NULL, N'响应参数', N'ResponseParameter', N'string', 70, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7980, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (65, NULL, NULL, NULL, NULL, N'异常信息', N'ExceptionInfo', N'string', 70, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 20000, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7970, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (66, NULL, NULL, NULL, NULL, N'响应状态', N'Success', N'int', 80, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, N'restatus', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 8700, NULL, NULL, 2, N'selectList', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (67, NULL, NULL, NULL, NULL, N'开始时间', N'BeginDate', N'DateTime', 140, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 9999, NULL, NULL, 2, N'datetime', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (68, NULL, NULL, NULL, NULL, N'结束时间', N'EndDate', N'DateTime', 150, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 880, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (69, NULL, NULL, NULL, NULL, N'时长', N'ElapsedTime', N'int', 60, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 8600, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (70, NULL, NULL, NULL, NULL, N'用户IP', N'UserIP', N'string', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7920, NULL, NULL, 1, N'text', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (71, NULL, NULL, NULL, NULL, N'服务器IP', N'ServiceIP', N'string', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7910, NULL, NULL, 1, N'text', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (72, NULL, NULL, NULL, NULL, N'浏览器类型', N'BrowserType', N'string', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7900, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (73, NULL, NULL, NULL, NULL, N'请求地址', N'Url', N'string', 110, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 9000, NULL, NULL, 1, N'text', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (74, NULL, NULL, NULL, NULL, N'用户ID', N'User_Id', N'int', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7880, NULL, NULL, NULL, N'text', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (75, NULL, NULL, NULL, NULL, N'用户名称', N'UserName', N'string', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8000, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 9100, NULL, NULL, NULL, NULL, 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (76, NULL, NULL, NULL, NULL, N'角色ID', N'Role_Id', N'int', 90, NULL, CAST(N'2018-06-11 18:22:16.000' AS DateTime), NULL, NULL, N'roles', NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-07-18 01:41:17.857' AS DateTime), 1, 7860, NULL, NULL, 2, N'select', 0, N'Sys_Log', 5)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (77, NULL, NULL, NULL, NULL, N'', N'User_Id', N'int', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 8000, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (78, NULL, NULL, NULL, NULL, N'不用', N'Dept_Id', N'int', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7840, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (79, 0, NULL, 1, NULL, N'不用', N'DeptName', N'string', 150, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 150, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7830, N'', NULL, 2, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (80, 0, 0, 1, NULL, N'角色', N'Role_Id', N'int', 130, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'tree_roles', NULL, 5, N'cascader', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7820, N'', NULL, 2, N'select', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (81, NULL, NULL, NULL, NULL, N'不用', N'RoleName', N'string', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7810, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (82, 1, 0, 1, NULL, N'帐号', N'UserName', N'string', 120, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 0, 1, 100, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7945, N'', NULL, 1, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (83, 1, 0, NULL, NULL, N'密码', N'UserPwd', N'string', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 0, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7790, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (84, NULL, NULL, NULL, NULL, N'姓名', N'UserTrueName', N'string', 120, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 2, N'text', NULL, 1, 1, NULL, 0, 0, 0, 20, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7944, N'', NULL, 1, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (85, NULL, NULL, NULL, NULL, N'地址', N'Address', N'string', 190, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7270, N'', NULL, 4, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (86, NULL, NULL, NULL, NULL, N'电话', N'Mobile', N'string', 140, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7260, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (87, NULL, NULL, NULL, NULL, N'Email', N'Email', N'string', 140, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'mail', NULL, 1, 0, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7250, N'', NULL, 4, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (88, NULL, NULL, NULL, NULL, N'', N'Tel', N'string', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7740, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (89, NULL, NULL, NULL, 12, N'备注', N'Remark', N'string', 180, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 13, N'textarea', NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7230, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (90, NULL, NULL, NULL, NULL, N'排序号', N'OrderNo', N'int', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'text', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7220, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (91, NULL, NULL, NULL, NULL, N'是否可用', N'Enable', N'byte', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'enable', NULL, 10, N'select', NULL, 1, 1, NULL, 0, 0, 0, 1, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7670, N'', NULL, 4, N'select', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (92, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7700, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (93, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 1, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7690, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (94, NULL, NULL, NULL, NULL, N'注册时间', N'CreateDate', N'DateTime', 150, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7780, N'', NULL, 5, N'datetime', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (95, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7670, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (96, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 1, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7660, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (97, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'datetime', NULL, 1, 0, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7650, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (98, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'audit', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7640, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (99, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 90, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7630, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (100, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 150, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7620, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (101, NULL, NULL, NULL, NULL, N'最后登陆时间', N'LastLoginDate', N'DateTime', 150, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7610, N'', NULL, 5, N'datetime', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (102, NULL, NULL, NULL, NULL, N'最后密码修改时间', N'LastModifyPwdDate', N'DateTime', 150, N'', CAST(N'2018-06-14 16:44:15.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7600, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (114, NULL, NULL, NULL, NULL, N'头像', N'HeadImageUrl', N'string', 90, N'', NULL, NULL, NULL, N'', NULL, 20, N'img', NULL, 1, 1, 1, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7842, N'', NULL, NULL, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (142, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8570, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (143, NULL, NULL, NULL, 12, N'分类', N'Variety', N'string', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, N'pz', NULL, 1, N'checkbox', NULL, 1, 1, NULL, 0, 0, 0, 20, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8560, NULL, NULL, 1, N'select', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (144, NULL, NULL, NULL, 12, N'年龄', N'AgeRange', N'string', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, N'age', NULL, 10, N'select', NULL, 1, 1, NULL, 0, 0, 0, 50, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8561, NULL, NULL, 1, N'select', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (145, NULL, NULL, NULL, 12, N'城市', N'City', N'string', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, N'city', NULL, 15, N'select', NULL, 1, 1, NULL, 0, 0, 0, 15, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8540, NULL, NULL, 1, N'select', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (146, NULL, NULL, NULL, 12, N'价格', N'AvgPrice', N'decimal', 80, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 20, NULL, NULL, 1, 1, NULL, 0, 0, 0, 9, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8530, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (147, NULL, NULL, NULL, 12, N'日期', N'Date', N'DateTime', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 25, N'date', NULL, 1, 1, 4, 0, 0, 0, 3, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8520, NULL, NULL, 2, N'datetime', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (148, NULL, NULL, NULL, NULL, N'远程', N'Enable', N'byte', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, N'enable', NULL, NULL, N'selectList', NULL, 1, 0, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8510, NULL, NULL, 2, N'selectList', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (149, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8500, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (150, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 100, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8490, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (151, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 40, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8480, NULL, NULL, NULL, N'datetime', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (152, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8470, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (153, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 90, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8460, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (154, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 140, NULL, CAST(N'2018-07-10 13:57:15.000' AS DateTime), NULL, NULL, NULL, NULL, 50, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8450, NULL, NULL, NULL, NULL, 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (155, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8440, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (156, NULL, NULL, NULL, NULL, N'分类', N'Variety', N'string', 80, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, N'pz', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 40, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8430, NULL, NULL, 1, N'select', 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (157, NULL, NULL, NULL, NULL, N'年龄', N'Age', N'string', 80, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, N'age', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8420, NULL, NULL, 1, N'select', 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (158, NULL, NULL, NULL, NULL, N'城市', N'City', N'string', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, N'city', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 30, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8410, NULL, NULL, 1, N'select', 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (159, NULL, NULL, NULL, NULL, N'价格', N'Price', N'decimal', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 2, N'decimal', NULL, 1, 1, NULL, 0, 0, 0, 9, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8400, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (160, 0, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, N'audit', NULL, NULL, N'select', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8382, NULL, NULL, 2, N'select', 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (161, NULL, NULL, NULL, NULL, N'审核人Id', N'AuditId', N'int', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8380, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (162, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 40, N'超级管理员', CAST(N'2023-05-13 11:31:51.447' AS DateTime), 1, 8370, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (163, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, N'enable', NULL, 2, N'switch', NULL, 1, 1, NULL, 0, 1, 1, 1, N'超级管理员', CAST(N'2023-05-13 11:31:51.447' AS DateTime), 1, 8360, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (164, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:31:51.447' AS DateTime), 1, 8350, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (165, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 100, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 0, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8388, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (166, NULL, 0, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 5, N'datetime', NULL, 1, 0, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8387, NULL, NULL, 2, N'datetime', 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (167, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:31:51.447' AS DateTime), 1, 8320, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (168, NULL, NULL, NULL, 12, N'测试', N'Modifier', N'string', 100, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2023-05-13 11:31:51.447' AS DateTime), 1, 8310, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (169, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2018-07-10 15:02:46.000' AS DateTime), NULL, NULL, NULL, NULL, 5, N'无', NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2023-05-13 11:31:51.447' AS DateTime), 1, 8300, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (170, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 110, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0, 0, NULL, NULL, 1, 1, NULL, N'超级管理员', CAST(N'2023-05-13 11:31:51.443' AS DateTime), 1, 8381, NULL, NULL, NULL, NULL, 0, N'App_ReportPrice', 16)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (193, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 90, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8060, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (194, NULL, NULL, NULL, NULL, N'姓名', N'Name', N'string', 120, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 50, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8050, NULL, NULL, 1, N'text', 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (195, NULL, NULL, NULL, NULL, N'电话', N'PhoneNo', N'string', 150, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, 50, N'phone', NULL, 1, 1, NULL, 0, 0, 0, 15, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8040, NULL, NULL, 1, N'text', 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (196, NULL, NULL, NULL, NULL, N'数量', N'Quantity', N'int', 90, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8030, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (197, NULL, NULL, NULL, NULL, N'购买类型', N'CowType', N'string', 90, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, N'nav', NULL, 30, N'select', NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8020, NULL, NULL, 2, N'selectList', 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (198, NULL, NULL, NULL, NULL, N'描述', N'Describe', N'string', 190, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, 60, N'textarea', NULL, 1, 1, NULL, 0, 0, 0, 500, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8010, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (199, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8000, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (200, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 90, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 7990, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (201, NULL, NULL, NULL, NULL, N'提交人', N'Creator', N'string', 130, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 7980, NULL, NULL, 2, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (202, NULL, NULL, NULL, NULL, N'提交时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 7970, NULL, NULL, 2, N'datetime', 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (203, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 90, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 7960, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (204, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 7950, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (205, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 15:12:25.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 7940, NULL, NULL, NULL, NULL, 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (206, 1, 1, 0, NULL, N'主键ID', N'ExpertId', N'int', 80, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7930, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (207, NULL, NULL, NULL, NULL, N'名称', N'ExpertName', N'string', 120, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 1, N'', NULL, 1, 1, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7920, N'', NULL, 1, N'like', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (208, NULL, NULL, NULL, NULL, N'姓名', N'ReallyName', N'string', 90, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 2, N'', NULL, 1, 1, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7910, N'', NULL, 1, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (209, NULL, NULL, NULL, NULL, N'身份证号', N'IDNumber', N'string', 200, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 18, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7900, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (210, NULL, NULL, NULL, NULL, N'头像', N'HeadImageUrl', N'string', 90, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 10, N'img', NULL, 1, 1, 1, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7920, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (211, NULL, NULL, NULL, NULL, N'学历', N'Education', N'string', 120, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7880, N'', NULL, NULL, N'text', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (212, NULL, NULL, NULL, NULL, N'职业', N'Professional', N'string', 120, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7870, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (213, NULL, NULL, NULL, NULL, N'所在公司', N'Company', N'string', 150, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7860, N'', NULL, NULL, N'无', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (214, NULL, NULL, NULL, NULL, N'地区', N'City', N'string', 100, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'city', NULL, 5, N'select', NULL, 1, 1, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7850, N'', NULL, NULL, N'selectList', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (215, NULL, NULL, NULL, NULL, N'擅长', N'SpecialField', N'string', 120, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, NULL, N'textarea', NULL, 0, 1, NULL, 0, 1, 0, 800, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7840, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (216, NULL, NULL, NULL, 12, N'简介', N'Resume', N'string', 150, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 7, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7830, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (217, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 100, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'audit', NULL, 0, N'select', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7919, N'', NULL, 1, N'selectList', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (218, NULL, NULL, NULL, NULL, N'审核人Id', N'AuditId', N'int', 80, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7810, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (219, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 90, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 20, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7919, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (220, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 150, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'datetime', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7790, N'', NULL, NULL, N'datetime', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (221, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 90, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'enable', NULL, 3, N'select', NULL, 1, 1, NULL, 0, 0, 0, 1, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7919, N'', NULL, 1, N'select', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (222, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 80, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7770, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (223, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7760, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (224, NULL, NULL, NULL, NULL, N'申请时间', N'CreateDate', N'DateTime', 130, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7750, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (225, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 80, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7740, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (226, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7730, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (227, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 130, N'', CAST(N'2018-07-10 15:29:01.000' AS DateTime), NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7720, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (308, NULL, NULL, NULL, NULL, N'主键ID', N'Id', N'int', 80, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 4, N'超级管理员', CAST(N'2020-01-06 11:21:07.177' AS DateTime), 1, 6910, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (309, NULL, NULL, NULL, 12, N'标题', N'Title', N'string', 250, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6900, NULL, NULL, 1, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (310, NULL, NULL, NULL, NULL, N'发布人', N'Author', N'string', 120, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 100, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6890, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (311, 0, NULL, NULL, NULL, N'发布时间', N'ReleaseDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6880, NULL, NULL, 3, N'datetime', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (312, NULL, NULL, NULL, 12, N'封面图片', N'ImageUrl', N'string', 220, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 9, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6870, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (313, NULL, NULL, NULL, NULL, N'图片(大图)', N'BigImageUrls', N'string', 220, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6860, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (314, NULL, NULL, NULL, 12, N'新闻地址', N'DetailUrl', N'string', 90, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 0, 1, 0, 400, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6850, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (315, NULL, NULL, NULL, NULL, N'浏览次数', N'ViewCount', N'int', 110, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6840, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (316, NULL, NULL, NULL, NULL, N'新闻类型', N'NewsType', N'int', 110, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, N'news', 1, 3, N'select', NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6830, NULL, NULL, 1, N'select', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (317, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'int', 90, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, N'enable', NULL, 7, N'select', NULL, 1, 1, NULL, 0, 1, 0, 2, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6820, NULL, NULL, 3, N'select', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (318, NULL, NULL, NULL, NULL, N'创建人Id', N'CreateID', N'int', 80, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6810, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (319, NULL, NULL, NULL, NULL, N'发布人', N'Creator', N'string', 130, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 60, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6800, NULL, NULL, 3, N'无', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (320, NULL, NULL, NULL, NULL, N'发布时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 6, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6790, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (321, NULL, NULL, NULL, NULL, N'修改人ID', N'ModifyID', N'int', 80, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6780, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (322, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6770, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (323, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2018-07-10 16:11:59.000' AS DateTime), NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6760, NULL, NULL, NULL, N'datetime', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (324, NULL, NULL, NULL, 12, N'新闻内容', N'Content', N'string', 300, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 1, 0, NULL, NULL, 1, 0, 0, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6896, NULL, NULL, NULL, NULL, NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (429, 1, 0, NULL, NULL, N'手机号', N'PhoneNo', N'string', 150, N'', NULL, NULL, NULL, N'', NULL, NULL, N'', NULL, 1, 0, NULL, NULL, 1, 0, 11, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7760, N'', NULL, 3, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (431, NULL, NULL, NULL, NULL, N'Token', N'Token', N'string', 180, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7810, N'', NULL, 2, N'', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (446, NULL, NULL, NULL, 12, N'测试', N'IsTop', N'int', 90, NULL, NULL, NULL, NULL, N'enable', NULL, 30, N'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2023-05-13 10:48:26.650' AS DateTime), 1, 8515, NULL, NULL, 2, N'select', 0, N'App_TransactionAvgPrice', 15)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (457, NULL, NULL, NULL, NULL, N'是否可用', N'TransactionType', N'int', 120, NULL, NULL, NULL, NULL, N'enable', NULL, 20, N'select', NULL, 1, 1, NULL, 0, 0, 0, 8, N'超级管理员', CAST(N'2023-05-13 11:14:30.477' AS DateTime), 1, 8021, NULL, NULL, 1, N'select', 0, N'App_Transaction', 19)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (506, NULL, NULL, NULL, NULL, N'性别', N'Gender', N'int', 80, N'', NULL, NULL, NULL, N'gender', NULL, 12, N'select', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7843, N'', NULL, 1, N'select', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (523, NULL, NULL, NULL, NULL, N'电话', N'PhoneNo', N'string', 150, N'', NULL, NULL, NULL, N'', NULL, NULL, N'phone', NULL, 1, 0, NULL, NULL, 1, 0, 11, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7900, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (550, NULL, NULL, NULL, NULL, N'申请人帐号Id', N'User_Id', N'int', 90, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7921, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (551, NULL, NULL, NULL, NULL, N'帐号', N'UserName', N'string', 120, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7920, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (552, NULL, NULL, NULL, NULL, N'申请人', N'UserTrueName', N'string', 100, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 1, 0, NULL, NULL, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 10:59:07.420' AS DateTime), 1, 7920, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (603, NULL, NULL, NULL, NULL, N'资质证书', N' Certificate', N'string', 200, N'', NULL, NULL, NULL, N'', NULL, 0, N'', NULL, 0, 0, 1, 0, 1, 0, 2500, N'超级管理员', CAST(N'2023-05-13 10:59:07.423' AS DateTime), 1, 7828, N'', NULL, NULL, N'', 0, N'App_Expert', 20)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (654, NULL, NULL, NULL, NULL, N'类型', N'AppType', N'int', 150, N'', NULL, NULL, NULL, N'ut', NULL, 0, N'', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7809, N'', NULL, 3, N'selectList', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (659, NULL, NULL, NULL, NULL, N'手机用户', N'IsRegregisterPhone', N'int', 120, N'', NULL, NULL, NULL, N'isphone', NULL, NULL, N'select', NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7771, N'', NULL, 3, N'select', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (663, NULL, NULL, NULL, NULL, N'是否今日推荐', N'DailyRecommend', N'int', 120, NULL, NULL, NULL, NULL, N'dr', NULL, 5, N'select', NULL, 1, 1, NULL, NULL, 0, 0, 2, N'超级管理员', CAST(N'2020-01-06 11:21:07.290' AS DateTime), 1, 6825, NULL, NULL, 1, N'select', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (664, NULL, NULL, NULL, NULL, N'推荐排序', N'OrderNo', N'int', 120, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 4, N'超级管理员', CAST(N'2020-01-06 11:21:07.293' AS DateTime), 1, 6822, NULL, NULL, NULL, N'无', NULL, N'App_News', 28)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (714, NULL, NULL, NULL, NULL, N'Id', N'Order_Id', N'string', 90, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, N'超级管理员', CAST(N'2019-12-31 13:21:18.797' AS DateTime), 1, 2850, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (715, NULL, NULL, NULL, NULL, N'订单类型', N'OrderType', N'int', 90, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', N'ordertype', 1, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2840, NULL, 1, 1, N'select', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (716, NULL, NULL, NULL, NULL, N'运单号', N'TranNo', N'string', 150, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 1, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2830, NULL, NULL, 1, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (717, NULL, NULL, NULL, NULL, N'销售订单号', N'SellNo', N'string', 200, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 2, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2820, NULL, NULL, 1, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (718, NULL, NULL, NULL, NULL, N'销售数量', N'Qty', N'int', 90, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 2, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2810, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (719, NULL, NULL, NULL, 8, N'备注', N'Remark', N'string', 100, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2800, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (720, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2790, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (721, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 100, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 255, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2780, NULL, NULL, 3, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (722, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 3, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2770, NULL, NULL, 3, N'datetime', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (723, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2760, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (724, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 4, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 1, 255, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2750, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (725, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2019-08-22 17:26:55.000' AS DateTime), 1, N'超级管理员', NULL, 4, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2740, NULL, NULL, 3, N'datetime', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (726, NULL, NULL, NULL, NULL, N'', N'OrderList_Id', N'string', 90, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 0, 36, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2730, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (727, NULL, NULL, NULL, NULL, N'订单Id', N'Order_Id', N'string', 90, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 0, 1, 36, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2720, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (728, NULL, NULL, NULL, NULL, N'商品名称', N'ProductName', N'string', 150, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', N'pn', NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2710, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (729, NULL, NULL, NULL, NULL, N'批次', N'MO', N'string', 100, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 255, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2700, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (730, NULL, NULL, NULL, NULL, N'数量', N'Qty', N'int', 90, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, N'select', NULL, 1, 1, NULL, 0, 0, 0, NULL, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2690, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (731, NULL, NULL, NULL, NULL, N'重量', N'Weight', N'decimal', 90, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2680, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (732, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 120, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2670, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (733, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2660, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (734, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2650, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (735, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 90, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2640, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (736, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2630, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (737, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2620, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (738, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2019-08-28 09:17:39.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-09-19 14:54:58.000' AS DateTime), 1, 2610, NULL, NULL, NULL, NULL, NULL, N'SellOrderList', 78)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (739, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 120, NULL, CAST(N'2019-08-28 09:32:29.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2805, NULL, NULL, 2, N'datetime', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (740, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', NULL, NULL, CAST(N'2019-08-28 09:32:29.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 0, 100, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2803, NULL, NULL, 2, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (741, NULL, NULL, NULL, NULL, N'审核人Id', N'AuditId', N'int', NULL, NULL, CAST(N'2019-08-28 09:32:29.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.887' AS DateTime), 1, 2801, NULL, NULL, NULL, NULL, NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (742, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', NULL, NULL, CAST(N'2019-08-28 09:32:29.000' AS DateTime), 1, N'超级管理员', N'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 0, 0, NULL, N'超级管理员', CAST(N'2019-12-31 13:21:18.883' AS DateTime), 1, 2808, NULL, NULL, 2, N'select', NULL, N'SellOrder', 77)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (743, NULL, NULL, NULL, NULL, N'', N'Id', N'string', 90, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 5, 1, NULL, NULL, 1, 0, NULL, 1, 0, 1, 36, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2560, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (744, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 120, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 1, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2550, NULL, NULL, 1, N'datetime', NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (745, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2540, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (746, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 2, 3, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2530, NULL, NULL, 1, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (747, NULL, NULL, NULL, NULL, N'描述', N'Describe', N'string', 180, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 250, N'超级管理员', CAST(N'2019-12-06 20:31:39.377' AS DateTime), 1, 3490, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (748, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2510, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (749, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 90, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, 1, 4, NULL, NULL, 1, 1, NULL, 0, 1, 1, NULL, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2500, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (750, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 2490, NULL, NULL, NULL, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (751, NULL, NULL, NULL, NULL, N'姓名', N'Name', N'string', 100, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 1, 50, N'超级管理员', CAST(N'2019-12-06 20:31:39.353' AS DateTime), 1, 3500, NULL, NULL, 1, N'like', NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (752, NULL, NULL, NULL, NULL, N'电话', N'PhoneNo', N'string', 130, NULL, CAST(N'2019-09-18 15:46:43.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 0, 1, 15, N'超级管理员', CAST(N'2019-12-06 20:31:39.387' AS DateTime), 1, 3470, NULL, NULL, 1, NULL, NULL, N'App_Appointment', 80)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (753, NULL, NULL, NULL, NULL, N'', N'FormId', N'guid', 110, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (754, NULL, NULL, NULL, NULL, N'表单名称', N'Title', N'string', 140, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, 0, 1, N'textarea', NULL, 1, 1, NULL, 0, 0, 0, 1000, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 1100, NULL, NULL, 1, N'like', 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (755, NULL, NULL, NULL, NULL, N'设计器配置', N'DaraggeOptions', N'string', 140, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (756, NULL, NULL, NULL, NULL, N'表单参数', N'FormOptions', N'string', 140, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (757, NULL, NULL, NULL, NULL, N'表单配置', N'FormConfig', N'string', 110, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (758, NULL, NULL, NULL, NULL, N'表单字段', N'FormFields', N'string', 110, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (760, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 110, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-29 23:40:25.050' AS DateTime), 1, 800, NULL, NULL, 1, N'datetime', 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (761, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-29 23:40:25.050' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (762, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-29 23:40:25.050' AS DateTime), 1, 810, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (763, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-29 23:40:25.050' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (764, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-29 23:40:25.050' AS DateTime), 1, 600, NULL, NULL, 1, N'datetime', 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (765, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2021-12-29 23:17:25.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-29 23:40:25.050' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (766, NULL, NULL, NULL, NULL, N'表格配置', N'TableConfig', N'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-29 23:40:25.047' AS DateTime), 1, 880, NULL, NULL, NULL, NULL, 0, N'FormDesignOptions', 82)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (767, NULL, NULL, NULL, NULL, N'', N'FormCollectionId', N'guid', 110, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2021-12-30 23:00:15.140' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (768, NULL, NULL, NULL, NULL, N'表单ID', N'FormId', N'guid', 110, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (769, NULL, NULL, NULL, NULL, N'标题', N'Title', N'string', 110, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 900, NULL, NULL, 1, N'like', 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (770, NULL, NULL, NULL, NULL, N'表单数据', N'FormData', N'string', 110, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (771, NULL, NULL, NULL, NULL, N'提交时间', N'CreateDate', N'DateTime', 145, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 800, NULL, NULL, 1, N'datetime', 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (772, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (773, NULL, NULL, NULL, NULL, N'提交人', N'Creator', N'string', 100, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 810, NULL, NULL, 1, N'like', 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (774, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 130, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 60, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (775, NULL, NULL, NULL, NULL, N'', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (776, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2021-12-29 23:23:35.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2021-12-30 23:00:15.143' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'FormCollectionObject', 83)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (777, NULL, NULL, NULL, NULL, N'', N'WorkFlow_Id', N'guid', 110, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (778, NULL, NULL, NULL, NULL, N'流程名称', N'WorkName', N'string', 140, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1150, NULL, NULL, 1, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (779, NULL, NULL, NULL, NULL, N'表名', N'WorkTable', N'string', 100, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1100, NULL, NULL, 1, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (780, NULL, NULL, NULL, NULL, N'功能菜单', N'WorkTableName', N'string', 120, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (781, NULL, NULL, NULL, NULL, N'节点信息', N'NodeConfig', N'string', 110, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (782, NULL, NULL, NULL, NULL, N'连接配置', N'LineConfig', N'string', 110, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (783, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 130, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (784, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 740, NULL, NULL, 1, N'datetime', 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (785, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (786, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 100, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 750, NULL, NULL, NULL, N'', 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (787, NULL, NULL, NULL, NULL, N'是否启用', N'Enable', N'byte', 100, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', N'enable', NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1010, NULL, NULL, NULL, N'select', 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (788, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 100, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (789, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 160, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 600, NULL, NULL, NULL, N'datetime', 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (790, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2022-07-25 00:31:26.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 660, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (809, NULL, NULL, NULL, NULL, N'', N'WorkStepFlow_Id', N'guid', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-05-13 16:40:14.430' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (810, NULL, NULL, NULL, NULL, N'流程主表id', N'WorkFlow_Id', N'guid', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (811, NULL, NULL, NULL, NULL, N'流程节点Id', N'StepId', N'string', 120, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 1100, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (812, NULL, NULL, NULL, NULL, N'节点名称', N'StepName', N'string', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (813, NULL, NULL, NULL, NULL, N'节点类型(1=按用户审批,2=按角色审批)', N'StepType', N'int', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (814, NULL, NULL, NULL, NULL, N'审批用户id或角色id', N'StepValue', N'string', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (815, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 220, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (816, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (817, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (818, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (819, NULL, NULL, NULL, NULL, N'', N'Enable', N'byte', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 700, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (820, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 130, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (821, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (822, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2022-07-31 22:43:02.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (823, NULL, NULL, NULL, NULL, N'审批顺序', N'OrderId', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 880, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (824, NULL, NULL, NULL, NULL, N'', N'WorkFlowTable_Id', N'guid', 110, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-05-13 12:59:47.220' AS DateTime), 1, 1250, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (825, NULL, NULL, NULL, NULL, N'流程id', N'WorkFlow_Id', N'guid', 110, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (826, NULL, NULL, NULL, NULL, N'流程名称', N'WorkName', N'string', 130, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 1150, NULL, 2, 1, N'like', 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (827, NULL, NULL, NULL, NULL, N'表主键id', N'WorkTableKey', N'string', 180, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 1100, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (828, NULL, NULL, NULL, NULL, N'表名', N'WorkTable', N'string', 100, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (829, NULL, NULL, NULL, NULL, N'业务名称', N'WorkTableName', N'string', 120, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 1000, NULL, 3, 1, N'like', 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (830, NULL, NULL, NULL, NULL, N'不用', N'CurrentOrderId', N'int', 90, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (831, NULL, NULL, NULL, NULL, N'审批状态', N'AuditStatus', N'int', 110, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', N'audit', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 900, NULL, 1, 1, N'select', 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (832, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 850, NULL, 4, 1, N'datetime', 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (833, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (834, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 100, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 860, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (835, NULL, NULL, NULL, NULL, N'', N'Enable', N'byte', 110, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 700, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (836, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 130, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (837, NULL, NULL, NULL, NULL, N'', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (838, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2022-08-01 00:15:40.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (839, NULL, NULL, NULL, NULL, N'', N'Sys_WorkFlowTableStep_Id', N'guid', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-05-13 16:40:30.490' AS DateTime), 1, 1300, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (840, NULL, NULL, NULL, NULL, N'主表id', N'WorkFlowTable_Id', N'guid', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, 0, NULL, NULL, NULL, 1, 1, NULL, 0, 0, 0, 16, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 1250, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (841, NULL, NULL, NULL, NULL, N'流程id', N'WorkFlow_Id', N'guid', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (842, NULL, NULL, NULL, NULL, N'节点id', N'StepId', N'string', 120, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (843, NULL, NULL, NULL, NULL, N'节名称', N'StepName', N'string', 180, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 1100, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (844, NULL, NULL, NULL, NULL, N'审批类型', N'StepType', N'int', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (845, NULL, NULL, NULL, NULL, N'节点类型(1=按用户审批,2=按角色审批)', N'StepValue', N'string', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (846, NULL, NULL, NULL, NULL, N'审批顺序', N'OrderId', N'int', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (847, NULL, NULL, NULL, NULL, N'', N'Remark', N'string', 220, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (848, NULL, NULL, NULL, NULL, N'', N'CreateDate', N'DateTime', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (849, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (850, NULL, NULL, NULL, NULL, N'', N'Creator', N'string', 130, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (851, NULL, NULL, NULL, NULL, N'', N'Enable', N'byte', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 700, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (852, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 130, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (853, NULL, NULL, NULL, NULL, N'', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (854, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2022-08-01 00:21:19.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (855, NULL, NULL, NULL, NULL, N'审核人id', N'AuditId', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (856, NULL, NULL, NULL, NULL, N'审核人', N'Auditor', N'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (857, NULL, NULL, NULL, NULL, N'审核状态', N'AuditStatus', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (858, NULL, NULL, NULL, NULL, N'审核时间', N'AuditDate', N'DateTime', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (859, NULL, NULL, NULL, NULL, N'', N'Id', N'guid', 110, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2022-09-07 01:42:44.713' AS DateTime), 1, 1300, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (860, NULL, NULL, NULL, NULL, N'任务名称', N'TaskName', N'string', 120, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, 0, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1250, NULL, NULL, 1, N'like', 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (861, NULL, NULL, NULL, NULL, N'任务分组', N'GroupName', N'string', 100, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, 0, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 500, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (862, NULL, NULL, NULL, NULL, N'Corn表达式', N'CronExpression', N'string', 120, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, 0, 2, NULL, NULL, 1, 1, NULL, 0, 0, 0, 100, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (863, NULL, NULL, NULL, 12, N'Url地址', N'ApiUrl', N'string', 150, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1100, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (864, NULL, NULL, NULL, NULL, N'AuthKey', N'AuthKey', N'string', 100, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 6, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (865, NULL, NULL, NULL, NULL, N'AuthValue', N'AuthValue', N'string', 100, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 6, NULL, NULL, 1, 0, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (866, NULL, NULL, NULL, NULL, N'描述', N'Describe', N'string', 120, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 5, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (867, NULL, NULL, NULL, NULL, N'最后执行执行', N'LastRunTime', N'DateTime', 150, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 900, NULL, NULL, 1, N'datetime', 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (868, NULL, NULL, NULL, NULL, N'运行状态', N'Status', N'int', 90, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', N'', NULL, 0, N'', NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (869, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (870, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 130, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 10, NULL, NULL, 1, 0, NULL, 0, 1, 1, 30, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (871, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 10, NULL, NULL, 1, 0, NULL, 0, 1, 1, 8, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 700, NULL, NULL, 1, N'datetime', 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (872, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (873, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 130, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (874, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2022-09-05 03:09:08.000' AS DateTime), 1, N'超级管理员', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 550, NULL, NULL, 1, N'datetime', 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (889, NULL, NULL, NULL, NULL, N'', N'LogId', N'guid', 110, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2022-09-05 23:49:31.747' AS DateTime), 1, 1200, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (890, NULL, NULL, NULL, NULL, N'任务id', N'Id', N'guid', 110, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (891, NULL, NULL, NULL, NULL, N'任务名称', N'TaskName', N'string', 120, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 1100, NULL, NULL, 1, N'like', 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (892, NULL, NULL, NULL, NULL, N'耗时(秒)', N'ElapsedTime', N'int', 90, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 1050, NULL, NULL, 1, N'range', 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (893, NULL, NULL, NULL, NULL, N'开始时间', N'StratDate', N'DateTime', 150, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 1000, NULL, NULL, 1, N'datetime', 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (894, NULL, NULL, NULL, NULL, N'结束时间', N'EndDate', N'DateTime', 150, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (895, NULL, NULL, NULL, NULL, N'是否成功', N'Result', N'int', 100, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', N'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 900, NULL, NULL, 1, N'select', 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (896, NULL, NULL, NULL, NULL, N'返回内容', N'ResponseContent', N'string', 250, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (897, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 80, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (898, NULL, NULL, NULL, NULL, N'', N'Creator', N'string', 130, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (899, NULL, NULL, NULL, NULL, N'', N'CreateDate', N'DateTime', 110, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 700, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (900, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 80, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (901, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 130, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (902, NULL, NULL, NULL, NULL, N'', N'ModifyDate', N'DateTime', 110, NULL, CAST(N'2022-09-05 03:14:51.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (904, NULL, NULL, NULL, 12, N'post参数', N'PostData', N'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 8, N'textarea', NULL, 1, 0, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1060, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (905, NULL, NULL, NULL, NULL, N'请求方式', N'Method', N'string', 110, NULL, NULL, NULL, NULL, N'请求方式', NULL, 2, N'select', NULL, 1, 1, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1160, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (906, NULL, NULL, NULL, NULL, N'超时时间(秒)', N'TimeOut', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2022-09-07 01:42:44.753' AS DateTime), 1, 1152, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzOptions', 91)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (907, NULL, NULL, NULL, NULL, N'异常信息', N'ErrorMsg', N'string', 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, N'超级管理员', CAST(N'2022-09-05 23:49:31.760' AS DateTime), 1, 840, NULL, NULL, NULL, NULL, 0, N'Sys_QuartzLog', 93)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (908, NULL, NULL, NULL, NULL, N'下一个审批节点', N'NextStepIds', N'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (909, NULL, NULL, NULL, NULL, N'父级节点', N'ParentId', N'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (911, NULL, NULL, NULL, NULL, N'审核未通过(返回上一节点,流程重新开始,流程结束)', N'AuditRefuse', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (912, NULL, NULL, NULL, NULL, N'驳回(返回上一节点,流程重新开始,流程结束)', N'AuditBack', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (913, NULL, NULL, NULL, NULL, N'审批方式(启用会签)', N'AuditMethod', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (914, NULL, NULL, NULL, NULL, N'审核后发送邮件通知', N'SendMail', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (915, NULL, NULL, NULL, NULL, N'审核条件', N'Filters', N'string', 220, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4000, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (918, NULL, NULL, NULL, NULL, N'审核中数据是否可以编辑', N'AuditingEdit', N'int', 80, NULL, NULL, NULL, NULL, N'enable', NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1010, NULL, NULL, 1, N'select', 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (919, NULL, NULL, NULL, NULL, N'节点属性(start、node、end))', N'StepAttrType', N'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (920, NULL, NULL, NULL, NULL, N'节点属性(start、node、end))', N'StepAttrType', N'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (921, NULL, NULL, NULL, NULL, N'当前审核节点ID', N'CurrentStepId', N'string', 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 960, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (922, NULL, NULL, NULL, NULL, N'', N'ParentId', N'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (924, NULL, NULL, NULL, NULL, N'', N'NextStepId', N'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (925, NULL, NULL, NULL, NULL, N'', N'Id', N'guid', 110, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-04-26 11:54:07.813' AS DateTime), 1, 1100, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (926, NULL, NULL, NULL, NULL, N'', N'WorkFlowTable_Id', N'guid', 110, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 1050, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (927, NULL, NULL, NULL, NULL, N'', N'WorkFlowTableStep_Id', N'guid', 110, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (928, NULL, NULL, NULL, NULL, N'节点id', N'StepId', N'string', 120, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (929, NULL, NULL, NULL, NULL, N'节点名称', N'StepName', N'string', 180, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 200, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (930, NULL, NULL, NULL, NULL, N'', N'AuditId', N'int', 110, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (931, NULL, NULL, NULL, NULL, N'', N'Auditor', N'string', 120, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 100, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (932, NULL, NULL, NULL, NULL, N'', N'AuditStatus', N'int', 110, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (933, NULL, NULL, NULL, NULL, N'', N'AuditResult', N'string', 220, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 700, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (934, NULL, NULL, NULL, NULL, N'', N'AuditDate', N'DateTime', 150, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (935, NULL, NULL, NULL, NULL, N'', N'Remark', N'string', 220, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 1000, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (936, NULL, NULL, NULL, NULL, N'', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2023-04-26 11:52:20.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-04-26 11:54:07.817' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableAuditLog', 94)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (937, NULL, NULL, NULL, NULL, N'', N'DepartmentId', N'guid', 110, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-05-13 09:51:06.180' AS DateTime), 1, 1150, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (938, NULL, NULL, NULL, NULL, N'组织名称', N'DepartmentName', N'string', 180, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 0, 0, 0, 200, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 1100, NULL, NULL, 1, N'like', 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (939, NULL, NULL, NULL, NULL, N'组织编号', N'DepartmentCode', N'string', 90, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 2, NULL, NULL, 1, 1, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 1050, NULL, NULL, 1, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (940, NULL, NULL, NULL, NULL, N'上级组织', N'ParentId', N'guid', 110, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', N'组织机构', NULL, 3, N'cascader', NULL, 1, 0, NULL, 0, 1, 0, 16, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (941, NULL, NULL, NULL, NULL, N'组织类型', N'DepartmentType', N'string', 110, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 50, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (942, NULL, NULL, NULL, NULL, N'是否可用', N'Enable', N'int', 110, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (943, NULL, NULL, NULL, NULL, N'备注', N'Remark', N'string', 100, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 5, N'textarea', NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (944, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 100, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (945, NULL, NULL, NULL, NULL, N'创建人', N'Creator', N'string', 90, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 750, NULL, NULL, 1, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (946, NULL, NULL, NULL, NULL, N'创建时间', N'CreateDate', N'DateTime', 145, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 700, NULL, NULL, 1, N'datetime', 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (947, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 100, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (948, NULL, NULL, NULL, NULL, N'修改人', N'Modifier', N'string', 90, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 30, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (949, NULL, NULL, NULL, NULL, N'修改时间', N'ModifyDate', N'DateTime', 140, NULL, CAST(N'2023-05-08 02:05:31.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 09:51:06.200' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_Department', 95)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (950, NULL, NULL, NULL, NULL, N'', N'Id', N'guid', 110, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 1, 0, 1, 16, N'超级管理员', CAST(N'2023-05-13 10:08:36.677' AS DateTime), 1, 1000, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (951, NULL, NULL, NULL, NULL, N'', N'UserId', N'int', 110, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 950, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (952, NULL, NULL, NULL, NULL, N'', N'DepartmentId', N'guid', 110, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 16, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 900, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (953, NULL, NULL, NULL, NULL, N'', N'Enable', N'int', 110, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, 0, 0, NULL, NULL, 1, 1, NULL, 0, 0, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 850, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (954, NULL, NULL, NULL, NULL, N'', N'CreateID', N'int', 100, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 800, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (955, NULL, NULL, NULL, NULL, N'', N'Creator', N'string', 100, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 750, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (956, NULL, NULL, NULL, NULL, N'', N'CreateDate', N'DateTime', 150, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 700, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (957, NULL, NULL, NULL, NULL, N'', N'ModifyID', N'int', 100, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 0, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 650, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (958, NULL, NULL, NULL, NULL, N'', N'Modifier', N'string', 100, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 255, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 600, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (959, NULL, NULL, NULL, NULL, N'', N'ModifyDate', N'DateTime', 150, NULL, CAST(N'2023-05-08 02:07:44.000' AS DateTime), 1, N'超级管理员', NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 8, N'超级管理员', CAST(N'2023-05-13 10:08:36.697' AS DateTime), 1, 550, NULL, NULL, NULL, NULL, 0, N'Sys_UserDepartment', 96)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (960, NULL, NULL, NULL, 12, N'组织构架', N'DeptIds', N'string', 140, NULL, NULL, NULL, NULL, N'组织机构', NULL, 6, N'treeSelect', NULL, 1, 0, NULL, 0, 1, 0, 2000, N'超级管理员', CAST(N'2023-05-13 10:20:05.173' AS DateTime), 1, 7800, NULL, NULL, NULL, N'cascader', 0, N'Sys_User', 6)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (961, NULL, NULL, NULL, NULL, N'当前审核节点名称', N'StepName', N'string', 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 500, N'超级管理员', CAST(N'2023-05-13 12:59:47.233' AS DateTime), 1, 955, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTable', 88)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (962, NULL, NULL, NULL, NULL, N'权重(相同条件权重大的优先匹配)', N'Weight', N'int', 100, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 17:04:21.500' AS DateTime), 1, 1011, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlow', 85)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (963, NULL, NULL, NULL, NULL, N'权重(相同条件权重大的优先匹配)', N'Weight', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:14.433' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowStep', 87)
GO
INSERT [dbo].[Sys_TableColumn] ([ColumnId], [ApiInPut], [ApiIsNull], [ApiOutPut], [ColSize], [ColumnCNName], [ColumnName], [ColumnType], [ColumnWidth], [Columnformat], [CreateDate], [CreateID], [Creator], [DropNo], [EditColNo], [EditRowNo], [EditType], [Enable], [IsColumnData], [IsDisplay], [IsImage], [IsKey], [IsNull], [IsReadDataset], [Maxlength], [Modifier], [ModifyDate], [ModifyID], [OrderNo], [Script], [SearchColNo], [SearchRowNo], [SearchType], [Sortable], [TableName], [Table_Id]) VALUES (964, NULL, NULL, NULL, NULL, N'', N'Weight', N'int', 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 4, N'超级管理员', CAST(N'2023-05-13 16:40:30.493' AS DateTime), 1, 0, NULL, NULL, NULL, NULL, 0, N'Sys_WorkFlowTableStep', 89)
GO
SET IDENTITY_INSERT [dbo].[Sys_TableColumn] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_TableInfo] ON 

GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (2, N'角色管理', N'角色管理', NULL, NULL, NULL, NULL, NULL, 0, N'RoleName', N'System', N'VOL.System', NULL, 8, NULL, NULL, N'Sys_Role', N'Sys_Role', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (3, N'字典数据', N'字典数据', NULL, NULL, N'字典明细', N'Sys_DictionaryList', NULL, 0, N'DicName', N'System', N'VOL.System', NULL, 11, NULL, NULL, N'Sys_Dictionary', N'Sys_Dictionary', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (4, N'字典明细', N'字典明细', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 11, NULL, NULL, N'Sys_DictionaryList', N'Sys_DictionaryList', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (5, N'系统日志', N'系统日志', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 10, NULL, NULL, N'Sys_Log', N'Sys_Log', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (6, NULL, N'用户管理', NULL, NULL, NULL, NULL, NULL, 0, N'UserName', N'System', N'VOL.System', NULL, 8, NULL, N'', N'Sys_User', N'Sys_User', N'HeadImageUrl', 1)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (8, N'用户基础信息', N'用户管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', 200, 0, NULL, NULL, N'无', N'无', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (10, N'日志管理', N'日志管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 0, NULL, N'170', N'日志管理', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (11, N'配置管理', N'配置管理', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'System', N'VOL.System', NULL, 0, NULL, N'250', N'配置管理', N'配置管理', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (15, N'成交均价', N'自动绑定下拉框', NULL, NULL, NULL, NULL, NULL, 0, N'AvgPrice', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_TransactionAvgPrice', N'App_TransactionAvgPrice', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (16, NULL, N'自定义实现一对多', NULL, NULL, NULL, NULL, NULL, 0, N'Price', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_ReportPrice', N'App_ReportPrice', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (19, NULL, N'导入导出', NULL, NULL, NULL, NULL, NULL, 0, N'PhoneNo', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_Transaction', N'App_Transaction', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (20, NULL, N'启用图片支持', NULL, NULL, NULL, NULL, NULL, 0, N'ExpertName', N'App', N'VOL.AppManager', NULL, 79, NULL, NULL, N'App_Expert', N'App_Expert', N'HeadImageUrl', 1)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (27, N' 资讯', N'静态页面发布', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'News', N'VOL.AppManager', NULL, 0, NULL, NULL, N' 资讯', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (28, NULL, N'新闻列表', NULL, NULL, NULL, NULL, NULL, 0, N'Title', N'News', N'VOL.AppManager', NULL, 27, N'Content', N'CreateDate', N'App_News', N'App_News', N'ImageUrl', 3)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (76, N'订单管理', N'测试完整示例', NULL, NULL, NULL, NULL, NULL, 0, NULL, N'订单管理', N'VOL.Order', NULL, 0, NULL, NULL, N'订单管理', N'订单管理', NULL, NULL)
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
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (84, N'审批流程', N'审批流程', NULL, NULL, NULL, NULL, NULL, 1, NULL, N'flow', N'VOL.System', NULL, 0, NULL, NULL, N'审批流程', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (85, N'审批流程', N'审批流程配置', NULL, NULL, N'审批步骤', N'Sys_WorkFlowStep', NULL, 1, N'WorkName', N'flow', N'VOL.System', NULL, 84, NULL, N'CreateDate', N'Sys_WorkFlow', N'Sys_WorkFlow', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (87, N'审批节点', N'审批节点配置', NULL, NULL, NULL, NULL, NULL, 1, NULL, N'flow', N'VOL.System', NULL, 84, NULL, N'CreateDate', N'Sys_WorkFlowStep', N'Sys_WorkFlowStep', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (88, N'审批流程', N'审批流程', NULL, NULL, N'审批节点', N'Sys_WorkFlowTableStep', NULL, 1, N'', N'flow', N'VOL.System', NULL, 84, NULL, N'CreateDate', N'Sys_WorkFlowTable', N'Sys_WorkFlowTable', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (89, N'审批节点', N'审批节点', NULL, NULL, NULL, NULL, NULL, 1, N'', N'flow', N'VOL.System', NULL, 84, NULL, N'CreateDate', N'Sys_WorkFlowTableStep', N'Sys_WorkFlowTableStep', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (90, N'定时任务', N'定时任务', NULL, NULL, NULL, NULL, NULL, 1, NULL, N'定时任务', N'VOL.System', NULL, 0, NULL, NULL, N'定时任务', NULL, NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (91, N'定时任务', N'定时任务', NULL, NULL, NULL, NULL, NULL, 1, N'TaskName', N'Quartz', N'VOL.System', NULL, 90, NULL, N'TaskName', N'Sys_QuartzOptions', N'Sys_QuartzOptions', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (93, N'执行记录', N'执行记录', NULL, NULL, NULL, NULL, NULL, 1, NULL, N'Quartz', N'VOL.System', NULL, 90, NULL, N'StratDate', N'Sys_QuartzLog', N'Sys_QuartzLog', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (94, N'审批记录', N'审批记录', NULL, NULL, NULL, NULL, NULL, 1, N'', N'flow', N'VOL.System', NULL, 84, NULL, N'CreateDate', N'Sys_WorkFlowTableAuditLog', N'Sys_WorkFlowTableAuditLog', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (95, N'组织架构', N'组织架构', NULL, NULL, NULL, NULL, NULL, 1, N'DepartmentName', N'System', N'VOL.System', NULL, 8, NULL, N'CreateDate', N'Sys_Department', N'Sys_Department', NULL, NULL)
GO
INSERT [dbo].[Sys_TableInfo] ([Table_Id], [CnName], [ColumnCNName], [DBServer], [DataTableType], [DetailCnName], [DetailName], [EditorType], [Enable], [ExpressField], [FolderName], [Namespace], [OrderNo], [ParentId], [RichText], [SortName], [TableName], [TableTrueName], [UploadField], [UploadMaxCount]) VALUES (96, N'用户部门', N'用户所属组织', NULL, NULL, NULL, NULL, NULL, 1, NULL, N'System', N'VOL.System', NULL, 8, NULL, N'CreateDate', N'Sys_UserDepartment', N'Sys_UserDepartment', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_TableInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_User] ON 

GO
INSERT [dbo].[Sys_User] ([User_Id], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [OrderNo], [Token], [CreateID], [CreateDate], [Creator], [Mobile], [Modifier], [ModifyDate], [ModifyID], [DeptIds]) VALUES (1, 1, N'无', N'13888888888', N'~还没想好...', NULL, N'admin', N'j79rYYvCz4vdhcboB1Ausg==', N'超级管理员', NULL, 0, N'283591387@qq.com', 1, 1, N'Upload/Tables/Sys_User/202305131010574561/wechat.jpg', 0, CAST(N'2017-08-28 09:58:55.000' AS DateTime), CAST(N'2019-12-14 15:14:22.730' AS DateTime), N'北京市西城区', 1, CAST(N'2019-08-18 00:54:06.000' AS DateTime), 1, N'超级管理员', 0, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIxIiwiaWF0IjoiMTY4Mzk3NDQyNSIsIm5iZiI6IjE2ODM5NzQ0MjUiLCJleHAiOiIxNjgzOTgxNjI1IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.MhQ8t--gVyQ9IG-OpAIZPdBGrV_JuHh4RxR4r1Rx53k', NULL, CAST(N'2012-06-10 11:10:03.000' AS DateTime), NULL, NULL, N'超级管理员', CAST(N'2023-05-13 10:10:58.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Sys_User] ([User_Id], [Role_Id], [RoleName], [PhoneNo], [Remark], [Tel], [UserName], [UserPwd], [UserTrueName], [DeptName], [Dept_Id], [Email], [Enable], [Gender], [HeadImageUrl], [IsRegregisterPhone], [LastLoginDate], [LastModifyPwdDate], [Address], [AppType], [AuditDate], [AuditStatus], [Auditor], [OrderNo], [Token], [CreateID], [CreateDate], [Creator], [Mobile], [Modifier], [ModifyDate], [ModifyID], [DeptIds]) VALUES (3362, 2, N'无', NULL, N'。。', NULL, N'admin666', N'j79rYYvCz4vdhcboB1Ausg==', N'Admin测试', NULL, NULL, NULL, 1, 0, N'Upload/Tables/Sys_User/202305131011047216/wechat.jpg', 1, NULL, CAST(N'2019-09-22 23:03:33.580' AS DateTime), N'北京市还没注册', 1, CAST(N'2019-08-18 00:54:06.000' AS DateTime), 1, N'超级管理员', NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzMzYyIiwiaWF0IjoiMTY4Mzk2OTQ4NCIsIm5iZiI6IjE2ODM5Njk0ODQiLCJleHAiOiIxNjgzOTc2Njg0IiwiaXNzIjoidm9sLmNvcmUub3duZXIiLCJhdWQiOiJ2b2wuY29yZSJ9.AusSAJoTD3Bk90PFCmhNj7Mrlv06IA3XM2mubfwBJu0', NULL, CAST(N'2019-08-13 14:24:27.000' AS DateTime), NULL, N'01012345678', N'超级管理员', CAST(N'2023-05-13 17:09:41.000' AS DateTime), 1, N'e5d8e8af-3659-454c-aa8e-c201c7edbcfb,ec238385-f907-44de-b99b-0eddcffa6750')
GO
SET IDENTITY_INSERT [dbo].[Sys_User] OFF
GO
INSERT [dbo].[Sys_WorkFlow] ([WorkFlow_Id], [WorkName], [WorkTable], [WorkTableName], [NodeConfig], [LineConfig], [Remark], [Weight], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [AuditingEdit]) VALUES (N'be42a851-147a-493a-b42f-3dc7d3061e32', N'退货单数量>10流程', N'SellOrder', N'销售订单', N'[{"id":"18umlmt5a","name":"qty<10","type":"node","left":"186px","top":"181px","ico":"el-icon-news","state":"success","filters":[{"field":"Qty","value":"10","filterType":"<","data":null}],"auditType":1,"userId":3362},{"id":"qq4qwkz9il","name":"流程结束","type":"end","left":"241px","top":"400px","ico":"el-icon-switch-button","state":"success","filters":[]},{"id":"yuo5z0v07p","name":"流程开始","type":"start","left":"343px","top":"59px","ico":"el-icon-time","state":"success","filters":[{"field":"OrderType","value":["2"],"filterType":"=","data":[{"value":"1","label":"发货","key":"1"},{"value":"2","label":"退货","key":"2"},{"value":"3","label":"返单","key":"3"}]}]},{"id":"xebxs78ls","name":"qty>10","type":"node","left":"501px","top":"175px","ico":"el-icon-news","state":"success","filters":[{"field":"Qty","value":"10","filterType":">=","data":null}],"auditType":1,"userId":3362},{"id":"xk0xirr5zf","name":">=20","type":"node","left":"479px","top":"299px","ico":"el-icon-news","state":"success","filters":[{"field":"Qty","value":"20","filterType":">=","data":null}],"auditType":2,"roleId":2}]', N'[{"from":"yuo5z0v07p","to":"18umlmt5a","label":"x"},{"from":"yuo5z0v07p","to":"xebxs78ls","label":"x"},{"from":"18umlmt5a","to":"qq4qwkz9il","label":"x"},{"from":"xebxs78ls","to":"xk0xirr5zf","label":"x"},{"from":"xk0xirr5zf","to":"qq4qwkz9il","label":"x"}]', NULL, 50, CAST(N'2023-05-06 19:58:08.097' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2023-05-13 17:03:22.727' AS DateTime), 1, 1)
GO
INSERT [dbo].[Sys_WorkFlow] ([WorkFlow_Id], [WorkName], [WorkTable], [WorkTableName], [NodeConfig], [LineConfig], [Remark], [Weight], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [AuditingEdit]) VALUES (N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'部门+角色按条件审核', N'SellOrder', N'订单管理', N'[{"id":"iyzakw0c8","name":"发货订单流程","type":"start","left":"325px","top":"16px","ico":"el-icon-time","state":"success","filters":[{"field":"OrderType","value":["1"],"filterType":"=","data":[{"value":"1","label":"发货","key":"1"},{"value":"2","label":"退货","key":"2"},{"value":"3","label":"返单","key":"3"}]}]},{"id":"jkqinw0zc","name":"用户审批>=5000","type":"node","left":"56px","top":"92px","ico":"el-icon-news","state":"success","filters":[{"field":"Qty","value":"5000","filterType":">=","data":null}],"auditType":1,"userId":1,"auditRefuse":1,"auditBack":2,"sendMail":1},{"id":"5zfqhzz198","name":"流程结束","type":"end","left":"322px","top":"530px","ico":"el-icon-switch-button","state":"success","filters":[]},{"id":"bth346cr4d","name":"其他测试管理员审批","type":"node","left":"574px","top":"152px","ico":"el-icon-news","state":"success","filters":[],"auditType":1,"userId":3362,"auditRefuse":1,"auditBack":1},{"id":"b9cv1h35jg","name":"产品部>=7000审批","type":"node","left":"327px","top":"225px","ico":"el-icon-news","state":"success","filters":[],"auditType":3,"deptId":"ec238385-f907-44de-b99b-0eddcffa6750"},{"id":"mcpdtusm42","name":"测试管理员<5500审批","type":"node","left":"14px","top":"234px","ico":"el-icon-news","state":"success","filters":[{"field":"Qty","value":"5500","filterType":"<","data":null}],"auditType":2,"roleId":2},{"id":"hnoj7gaczc","name":"超级管理员审批","type":"node","left":"173px","top":"429px","ico":"el-icon-news","state":"success","filters":[],"auditType":1,"userId":1}]', N'[{"from":"iyzakw0c8","to":"jkqinw0zc","label":"x"},{"from":"iyzakw0c8","to":"bth346cr4d","label":"x"},{"from":"bth346cr4d","to":"5zfqhzz198","label":"x"},{"from":"jkqinw0zc","to":"mcpdtusm42","label":"x"},{"from":"jkqinw0zc","to":"b9cv1h35jg","label":"x"},{"from":"mcpdtusm42","to":"hnoj7gaczc","label":"x"},{"from":"hnoj7gaczc","to":"5zfqhzz198","label":"x"},{"from":"b9cv1h35jg","to":"hnoj7gaczc","label":"x"}]', N'部门、角色、条件同时审批', 100, CAST(N'2023-05-13 16:31:42.003' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2023-05-13 16:49:15.590' AS DateTime), 1, 0)
GO
INSERT [dbo].[Sys_WorkFlow] ([WorkFlow_Id], [WorkName], [WorkTable], [WorkTableName], [NodeConfig], [LineConfig], [Remark], [Weight], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [AuditingEdit]) VALUES (N'25f1b307-4562-4d0b-9acc-73fce3c57eb8', N'测试流程', N'SellOrder', N'销售订单', N'[{"id":"folpb3e1qe","name":"流程开始","type":"start","left":"296px","top":"16px","ico":"el-icon-time","state":"success","filters":[{"field":"OrderType","value":["1"],"filterType":"=","data":[{"value":"1","label":"发货","key":"1"},{"value":"2","label":"退货","key":"2"},{"value":"3","label":"返单","key":"3"}]}]},{"id":"3nfhu1i4","name":"<=100","type":"node","left":"52px","top":"190px","ico":"el-icon-news","state":"success","auditType":1,"userId":3362,"filters":[{"field":"Qty","value":"100","filterType":"<=","data":null}]},{"id":"eah755bg8","name":"流程结束","type":"end","left":"302.2px","top":"346.7px","ico":"el-icon-switch-button","state":"success"},{"id":"mtisrzm4x","name":">=200","type":"node","left":"446px","top":"182px","ico":"el-icon-news","state":"success","filters":[{"field":"Qty","value":"200","filterType":">=","data":null}],"auditType":1,"userId":1}]', N'[{"from":"folpb3e1qe","to":"3nfhu1i4","label":"x"},{"from":"3nfhu1i4","to":"eah755bg8","label":"x"},{"from":"folpb3e1qe","to":"mtisrzm4x","label":"x"},{"from":"mtisrzm4x","to":"eah755bg8","label":"x"}]', NULL, 50, CAST(N'2023-05-06 16:30:30.333' AS DateTime), 1, N'超级管理员', 1, N'超级管理员', CAST(N'2023-05-13 17:04:35.757' AS DateTime), 1, 0)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'ac58fe6a-b5dc-4a1f-b5e2-08db4e0c2701', N'25f1b307-4562-4d0b-9acc-73fce3c57eb8', N'folpb3e1qe', N'流程开始', NULL, NULL, 0, NULL, CAST(N'2023-05-06 16:30:30.403' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:04:35.757' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"field":"OrderType","filterType":"=","value":"1"}]', N'start', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'4d7781b0-fead-4267-b5e3-08db4e0c2701', N'25f1b307-4562-4d0b-9acc-73fce3c57eb8', N'3nfhu1i4', N'<=100', 1, N'3362', 1, NULL, CAST(N'2023-05-06 16:30:30.410' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:04:35.757' AS DateTime), 1, NULL, N'folpb3e1qe', NULL, NULL, NULL, 0, N'[{"field":"Qty","filterType":"<=","value":"100"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'549425ad-43a9-450c-b5e4-08db4e0c2701', N'25f1b307-4562-4d0b-9acc-73fce3c57eb8', N'eah755bg8', N'流程结束', NULL, NULL, 3, NULL, CAST(N'2023-05-06 16:30:30.410' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:04:35.757' AS DateTime), 1, NULL, N'3nfhu1i4,mtisrzm4x', NULL, NULL, NULL, 0, NULL, N'end', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'0d89e5ad-40e4-4b1a-e6eb-08db4e292860', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'yuo5z0v07p', N'流程开始', NULL, NULL, 0, NULL, CAST(N'2023-05-06 19:58:08.110' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:03:22.777' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"field":"OrderType","filterType":"=","value":"2"}]', N'start', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'717567ab-19cb-46fb-e6ec-08db4e292860', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'18umlmt5a', N'qty<10', 1, N'3362', 1, NULL, CAST(N'2023-05-06 19:58:08.117' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:03:22.790' AS DateTime), 1, NULL, N'yuo5z0v07p', NULL, NULL, NULL, 0, N'[{"field":"Qty","filterType":"<","value":"10"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'34611b20-83ea-4166-2ae8-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'iyzakw0c8', N'发货订单流程', NULL, NULL, 0, NULL, CAST(N'2023-05-13 16:31:42.130' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.643' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"field":"OrderType","filterType":"=","value":"1"}]', N'start', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'1ce1abdb-5fba-44a8-2ae9-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'jkqinw0zc', N'用户审批>=5000', 1, N'1', 1, NULL, CAST(N'2023-05-13 16:31:42.150' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.653' AS DateTime), 1, NULL, N'iyzakw0c8', 1, 2, NULL, 0, N'[{"field":"Qty","filterType":">=","value":"5000"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'b25c3bf2-8878-4283-2aea-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'bth346cr4d', N'其他测试管理员审批', 1, N'3362', 2, NULL, CAST(N'2023-05-13 16:31:42.150' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.653' AS DateTime), 1, NULL, N'iyzakw0c8', 1, 1, NULL, 0, NULL, N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'5fe5984e-3bb8-4a5d-2aeb-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'mcpdtusm42', N'测试管理员<5500审批', 2, N'2', 3, NULL, CAST(N'2023-05-13 16:31:42.150' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.653' AS DateTime), 1, NULL, N'jkqinw0zc', NULL, NULL, NULL, 0, N'[{"field":"Qty","filterType":"<","value":"5500"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'a490b734-a54d-411e-2aec-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'b9cv1h35jg', N'产品部>=7000审批', 3, N'ec238385-f907-44de-b99b-0eddcffa6750', 4, NULL, CAST(N'2023-05-13 16:31:42.150' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.653' AS DateTime), 1, NULL, N'jkqinw0zc', NULL, NULL, NULL, 0, NULL, N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'b95667c1-95dd-4370-2aed-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'5zfqhzz198', N'流程结束', NULL, NULL, 5, NULL, CAST(N'2023-05-13 16:31:42.150' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.653' AS DateTime), 1, NULL, N'bth346cr4d,hnoj7gaczc', NULL, NULL, NULL, 0, NULL, N'end', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'beb46da8-ef43-4844-2aee-08db538c7aa7', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'hnoj7gaczc', N'超级管理员审批', 1, N'1', 6, NULL, CAST(N'2023-05-13 16:31:42.150' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 16:49:15.653' AS DateTime), 1, NULL, N'mcpdtusm42,b9cv1h35jg', NULL, NULL, NULL, 0, NULL, N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'e63d434b-a434-44c1-93c2-8a8493c78ed2', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'xk0xirr5zf', N'>=20', 2, N'2', 4, NULL, CAST(N'2023-05-06 20:01:23.710' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:03:22.790' AS DateTime), 1, NULL, N'xebxs78ls', NULL, NULL, NULL, 0, N'[{"field":"Qty","filterType":">=","value":"20"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'9babc207-2159-42c1-92aa-960f689a6aad', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'qq4qwkz9il', N'流程结束', NULL, NULL, 3, NULL, CAST(N'2023-05-06 20:01:23.710' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:03:22.790' AS DateTime), 1, NULL, N'18umlmt5a,xk0xirr5zf', NULL, NULL, NULL, 0, NULL, N'end', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'342e50a6-92f3-4a05-bb7f-a025e3fa0da7', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'xebxs78ls', N'qty>10', 1, N'3362', 2, NULL, CAST(N'2023-05-06 20:01:23.710' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:03:22.790' AS DateTime), 1, NULL, N'yuo5z0v07p', NULL, NULL, NULL, 0, N'[{"field":"Qty","filterType":">=","value":"10"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowStep] ([WorkStepFlow_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [NextStepIds], [ParentId], [AuditRefuse], [AuditBack], [AuditMethod], [SendMail], [Filters], [StepAttrType], [Weight]) VALUES (N'bcd55dbe-f145-4532-bc0c-ba876b4b48d3', N'25f1b307-4562-4d0b-9acc-73fce3c57eb8', N'mtisrzm4x', N'>=200', 1, N'1', 2, NULL, CAST(N'2023-05-06 19:56:37.443' AS DateTime), 1, N'超级管理员', NULL, N'超级管理员', CAST(N'2023-05-13 17:04:35.757' AS DateTime), 1, NULL, N'folpb3e1qe', NULL, NULL, NULL, 0, N'[{"field":"Qty","filterType":">=","value":"200"}]', N'node', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTable] ([WorkFlowTable_Id], [WorkFlow_Id], [WorkName], [WorkTableKey], [WorkTable], [WorkTableName], [CurrentOrderId], [AuditStatus], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [CurrentStepId], [StepName]) VALUES (N'7db5447a-7a78-40d8-9585-0aab9375b61f', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'退货单数量>10流程', N'55ae8c6c-6a11-4765-952a-7b4a3adece04', N'SellOrder', N'订单管理', NULL, 2, CAST(N'2023-05-13 15:49:18.203' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'xk0xirr5zf', N'qty>10')
GO
INSERT [dbo].[Sys_WorkFlowTable] ([WorkFlowTable_Id], [WorkFlow_Id], [WorkName], [WorkTableKey], [WorkTable], [WorkTableName], [CurrentOrderId], [AuditStatus], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [CurrentStepId], [StepName]) VALUES (N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'部门+角色按条件审核', N'323ab96f-49c1-4100-9d08-17db9f209df7', N'SellOrder', N'订单管理', NULL, 2, CAST(N'2023-05-13 17:17:47.037' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'b9cv1h35jg', N'用户审批>=5000')
GO
INSERT [dbo].[Sys_WorkFlowTable] ([WorkFlowTable_Id], [WorkFlow_Id], [WorkName], [WorkTableKey], [WorkTable], [WorkTableName], [CurrentOrderId], [AuditStatus], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [CurrentStepId], [StepName]) VALUES (N'd82f4733-9916-4714-bf35-900ceaa049c1', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'部门+角色按条件审核', N'b1db23bd-ed48-4459-b9ed-355d97a7e16e', N'SellOrder', N'订单管理', NULL, 1, CAST(N'2023-05-13 17:07:36.923' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'审核完成', N'用户审批>=5000')
GO
INSERT [dbo].[Sys_WorkFlowTable] ([WorkFlowTable_Id], [WorkFlow_Id], [WorkName], [WorkTableKey], [WorkTable], [WorkTableName], [CurrentOrderId], [AuditStatus], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [CurrentStepId], [StepName]) VALUES (N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'退货单数量>10流程', N'b67b7ec0-136c-4439-a530-cd6dd4d69a9c', N'SellOrder', N'订单管理', NULL, 1, CAST(N'2023-05-13 15:58:42.600' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'审核完成', N'qty>10')
GO
INSERT [dbo].[Sys_WorkFlowTable] ([WorkFlowTable_Id], [WorkFlow_Id], [WorkName], [WorkTableKey], [WorkTable], [WorkTableName], [CurrentOrderId], [AuditStatus], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [CurrentStepId], [StepName]) VALUES (N'62c8999f-f07e-4d47-827c-b1c4e63af323', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'部门+角色按条件审核', N'81d5db86-c85a-4b06-bc3a-08142811c522', N'SellOrder', N'订单管理', NULL, 0, CAST(N'2023-05-13 17:19:06.443' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'jkqinw0zc', N'用户审批>=5000')
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'673b5f2a-d798-4120-8bce-077dc208a047', N'c46e07fc-6141-4de8-947c-85d312f1972f', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 14:17:56.407' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'42637473-018e-482e-b952-07e2c4afc0cc', N'cc35e127-2740-40f0-ad5a-6007cf92367e', N'3e190afd-64b3-42fa-8c53-db6670d65a9d', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 1, NULL, CAST(N'2023-05-13 12:57:36.423' AS DateTime), NULL, CAST(N'2023-05-13 12:57:36.467' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'6d9ae3c7-f802-4e31-ba8e-0a27acf3951d', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'4ed73980-2e6e-4052-9722-695375d93303', N'xk0xirr5zf', N'>=20', 3362, N'Admin测试', 1, N'通过。。。。。', CAST(N'2023-05-13 16:14:56.523' AS DateTime), N'通过。。。。。', CAST(N'2023-05-13 16:14:56.523' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'088bdab5-4bcf-4f12-a5c1-0f2e642ec66c', N'7db5447a-7a78-40d8-9585-0aab9375b61f', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 15:49:18.207' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'033009cd-4227-4088-a7f4-0fe956717005', N'f00bf32c-7d32-45b7-ac3e-4e223a6e2dd6', N'0f7c0a3c-a0fa-4fb4-9d4d-fbcd441fa449', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 13:15:56.740' AS DateTime), NULL, CAST(N'2023-05-13 13:15:56.740' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'1a21cc26-eb65-4a68-bcea-116f08b43882', N'89f87fd9-b1fb-435b-8c92-7870d74214dd', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:20:30.997' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'e68f23c0-fa88-4290-b975-11e044a7b7e8', N'7f13eaab-f51c-4534-b839-2410501c6693', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:23:44.113' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'032a246a-3d95-45ae-a02f-15397fe959a4', N'38417b03-d70b-436b-8d24-f60ed5373dc6', N'eee0b9ef-eb93-4680-8dca-658b73c5d797', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-08 16:48:16.470' AS DateTime), NULL, CAST(N'2023-05-08 16:48:16.470' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'e4ed2781-4d7c-4e87-81ae-16d86538bdf3', N'f00bf32c-7d32-45b7-ac3e-4e223a6e2dd6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:15:56.653' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'59dd8bcd-eddf-4882-a0e0-247844dec5e7', N'b58589a0-04a1-432e-accb-76c9c22c8bc9', N'fa069866-db1f-47f9-bb88-0132e42f7b4f', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 12:14:35.080' AS DateTime), NULL, CAST(N'2023-05-13 12:14:35.080' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'ef617f6b-3af3-4fa3-9c4d-27c7db775a74', N'83005898-c7dc-4c3a-8519-69be2debe83d', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:52:36.083' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'267c2e5b-4b55-4f5d-8a43-2920a08b89fb', N'56a6d0fc-5b0d-4748-b436-1868865277c3', N'89329eb5-620e-477a-80c5-9261dc1f6c60', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 13:47:03.850' AS DateTime), NULL, CAST(N'2023-05-13 13:47:03.870' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'b8473b4d-c6fc-49c8-be4f-2e8c8c181f24', N'ed175615-9853-469f-9bee-dac37d4cfe49', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:30:55.623' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'df004942-44bd-4be2-ac42-316e562eeaeb', N'38417b03-d70b-436b-8d24-f60ed5373dc6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:48:16.393' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'86c3310d-af70-45e1-8156-3259aea24c6b', N'b58589a0-04a1-432e-accb-76c9c22c8bc9', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 12:14:35.070' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'fbf482e7-a0ff-4842-9e37-34bf672e64f3', N'2cd8ce25-650c-49ea-abb0-82aa8c6bdf72', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:37:42.090' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'08e13a05-901d-456a-9e96-39abd8054d22', N'827ce743-8340-4643-8512-de6b8b998b9c', N'4f5a3717-ea97-4e45-bb77-12e95a25523b', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-08 16:36:42.387' AS DateTime), NULL, CAST(N'2023-05-08 16:36:42.390' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'fa4c6ef4-82d8-455c-8166-3d86da68b09b', N'd5f96ffd-d50b-4581-847c-feee264243da', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:32:18.363' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'576493c9-c755-4ef5-98c4-401d5bafc5a2', N'cc35e127-2740-40f0-ad5a-6007cf92367e', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 12:56:24.440' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'4aa1c64b-10b7-4f9e-83f4-4e9b7db22878', N'9fda3a1e-1486-4bf5-bfc4-a217951a7a6a', N'94407d86-77a3-4a6b-8cb5-abfa31ac3b0c', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 12:39:40.540' AS DateTime), NULL, CAST(N'2023-05-13 12:39:40.540' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'e0a80ad6-25be-49ee-b802-4f517991fc0a', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'a2035fc1-334b-4b54-abc9-caaf5c8c7b6d', N'hnoj7gaczc', N'超级管理员审批', 1, N'超级管理员', 1, N'超级管理员同意。。', CAST(N'2023-05-13 17:12:12.903' AS DateTime), N'超级管理员同意。。', CAST(N'2023-05-13 17:12:12.903' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'367ae81d-3be4-4fa3-a5ee-555330b87fbe', N'd82f4733-9916-4714-bf35-900ceaa049c1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 17:07:36.927' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'987de71a-afcd-4fad-99df-57b4c50192e5', N'd1cd7028-132c-4b97-aec3-071f0ba7da0e', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 12:06:21.073' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'c251c391-3f13-4d05-91c1-591f0ca737d5', N'cc35e127-2740-40f0-ad5a-6007cf92367e', N'3e190afd-64b3-42fa-8c53-db6670d65a9d', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 12:56:24.483' AS DateTime), NULL, CAST(N'2023-05-13 12:56:24.483' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'50d2f620-6fe3-4663-9e78-5cadced87a7f', N'ca8025cd-4b66-4127-b9d6-d9ead3d23705', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:39:57.407' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'a21b38be-c2df-4edd-8efb-5f2e8e216ec4', N'98590873-049b-45c1-8f75-ff7ab22ae0dd', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 14:00:07.973' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'94d7b7ae-e6e1-44f9-b5f0-66f37eb740c2', N'1b92e493-11f0-462b-971b-c91ffbe82b42', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 11:47:55.093' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'85401ee1-c772-4610-b958-6d8c8c3307a7', N'0134c7b2-8931-4477-9743-7adda9a4d6df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 15:42:00.860' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'744382f3-0ae7-48e5-9f97-71908863f7b9', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'4fc4aca8-e0f6-4b57-b66a-4a1bf8dc3f85', N'jkqinw0zc', N'用户审批>=5000', 1, N'超级管理员', 1, N'同意。。。', CAST(N'2023-05-13 17:17:59.407' AS DateTime), N'同意。。。', CAST(N'2023-05-13 17:17:59.407' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'c4cf806a-7b5c-49a2-b4a9-721ca3bd4868', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'8486b561-6403-4d1c-af33-dd635bf63b8c', N'jkqinw0zc', N'用户审批>=5000', 1, N'超级管理员', 1, NULL, CAST(N'2023-05-13 17:10:51.357' AS DateTime), NULL, CAST(N'2023-05-13 17:10:51.407' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'd3fbf10d-db09-4a6b-be8e-76d1506ddcd9', N'ddd6ea0c-e3db-49ad-8dfe-bb995c23bcf3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 15:36:45.003' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'860fa141-5321-45b1-8148-7b707f02c8a7', N'7db5447a-7a78-40d8-9585-0aab9375b61f', N'032eb689-c842-4ebf-b072-6062864b300d', N'xebxs78ls', N'qty>10', 3362, N'Admin测试', 1, N'同意。。。。', CAST(N'2023-05-13 15:56:55.567' AS DateTime), N'同意。。。。', CAST(N'2023-05-13 15:56:55.567' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'45938d60-e6de-4172-92ef-7f685e0f44e1', N'c46e07fc-6141-4de8-947c-85d312f1972f', N'937eb1aa-4c9f-401a-a8e3-cc267a6ab2bc', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 3, NULL, CAST(N'2023-05-13 15:35:53.463' AS DateTime), NULL, CAST(N'2023-05-13 15:35:53.463' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'77c48d16-1d3e-4ec9-bb50-81308e51c6b1', N'e7e6a63f-3ca0-4d63-a323-790d4680d8c0', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:20:27.617' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'69bfbd14-cdc2-4d70-8625-819490946116', N'2d019ae7-22bb-4d25-8d06-2b4444c22c6f', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:07:13.690' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'9f5c12b1-ce50-4f90-b40a-833279872b0a', N'9fda3a1e-1486-4bf5-bfc4-a217951a7a6a', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 12:39:40.460' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'47f08e68-5ae1-467b-81f3-8a55072e9794', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 17:17:47.040' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'9053b951-f2fd-40df-8baf-8f267d6126ce', N'e7e6a63f-3ca0-4d63-a323-790d4680d8c0', N'4fd17d32-518a-4f9c-80c5-738374f5a846', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 13:20:43.707' AS DateTime), NULL, CAST(N'2023-05-13 13:20:43.760' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'dcf07982-9eda-4a19-be7e-8f4c33fb32cf', N'2d019ae7-22bb-4d25-8d06-2b4444c22c6f', N'ab5de430-5007-4027-b58b-c5eb9b0bfeb8', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 13:07:24.913' AS DateTime), NULL, CAST(N'2023-05-13 13:07:24.913' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'f4dd3674-9f9f-40d7-bcdb-92d35a89f89b', N'75d7fb3f-049e-4103-8f6a-9f3e0d3ebb3a', N'e3ec2568-a952-4ae3-a269-67663e39bdf0', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 13:47:49.620' AS DateTime), NULL, CAST(N'2023-05-13 13:47:49.620' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'9cb27636-cef5-4fa0-8ae0-940a759425f2', N'2c0d573d-f81f-4d98-89ff-75804b8bc877', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 12:07:41.940' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'0760aaf1-644f-4ae8-a28c-959583420365', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'de5133df-9ff7-494d-bb76-c9e457dfebad', N'b9cv1h35jg', N'产品部>=7000审批', 3362, N'Admin测试', 1, N'Admin测试管理员同意。。', CAST(N'2023-05-13 17:11:47.383' AS DateTime), N'Admin测试管理员同意。。', CAST(N'2023-05-13 17:11:47.383' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'09087f8c-4edb-4fbf-bf04-97610d2ee880', N'56a6d0fc-5b0d-4748-b436-1868865277c3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:46:22.857' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'3abfda8b-c565-47cd-b965-9d49bf50f902', N'0cd2d3ac-a4b3-42dc-be9b-3f3057b1ac61', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 00:54:50.383' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'9b2c29a0-8c8f-4cde-87c7-a6290a93ed03', N'1b92e493-11f0-462b-971b-c91ffbe82b42', N'839a2de4-e5be-4fcf-9ad5-8b3b26d791dc', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 11:47:55.167' AS DateTime), NULL, CAST(N'2023-05-13 11:47:55.167' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'04f7dbbd-d36d-4fc0-9222-a87b8475e9f1', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be1dc0bf-96f0-46db-8a02-90362b1b0b38', N'xebxs78ls', N'qty>10', 3362, N'Admin测试', 1, N'同意。。。。', CAST(N'2023-05-13 16:02:57.847' AS DateTime), N'同意。。。。', CAST(N'2023-05-13 16:02:57.847' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'6e3e6f00-3dbb-4887-b453-a9fb54fffb5c', N'646d440f-2447-44b7-bd35-3690e7d1e5e8', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:49:17.000' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'1b780830-da10-47cf-aa55-b6049cf1bc6b', N'2c0d573d-f81f-4d98-89ff-75804b8bc877', N'd1e0d9f4-2476-43e5-ba73-9a3b6d3431f2', N'3nfhu1i4', N'<=100', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 12:07:42.040' AS DateTime), NULL, CAST(N'2023-05-13 12:07:42.040' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'ef0a21c8-5896-4919-a075-bb3a46d4387c', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 15:58:42.603' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'e1c9e5b3-a11e-478c-8169-c39032846c35', N'147e53c5-231f-43cc-bba0-ab906a59b6ca', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:17:02.797' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'0404929a-1b62-4015-905f-c47b8488c0b5', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be1dc0bf-96f0-46db-8a02-90362b1b0b38', N'xebxs78ls', N'qty>10', 3362, N'Admin测试', 1, N'............', CAST(N'2023-05-13 16:12:02.050' AS DateTime), N'............', CAST(N'2023-05-13 16:12:02.093' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'f744c9ed-132f-4294-bc7b-c762201cb1b1', N'9768e54c-d8d0-49ee-b943-2416f990c1df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:31:33.363' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'6306b03c-7c1f-4912-9b44-ceffcc609267', N'75d7fb3f-049e-4103-8f6a-9f3e0d3ebb3a', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 13:47:16.840' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'e8fdd20e-21f5-4eff-9cbf-cf810ed95692', N'bff474a1-52e2-498b-8557-f7322bf34834', N'7413de5d-100c-4c83-ad91-8e808e6c41f6', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 2, NULL, CAST(N'2023-05-08 16:36:02.780' AS DateTime), NULL, CAST(N'2023-05-08 16:36:02.780' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'e2a55cbf-e68e-4f99-9715-d2dd27ccafe7', N'62c8999f-f07e-4d47-827c-b1c4e63af323', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 17:19:06.443' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'2ba41a15-768d-49db-80f4-d6b9ff2da546', N'eef3ff36-111e-4398-be9c-7c69e5d2b4c5', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:34:58.977' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'5ff227a0-5138-4145-ae8d-e03ea3a55cc3', N'8e60e09e-cda6-4baa-b452-370dea64ada4', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-13 16:33:44.773' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'37ca151d-b43d-4364-aa6b-e2df02720c07', N'bff474a1-52e2-498b-8557-f7322bf34834', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:36:02.707' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'c0b40ad7-1c64-4c0a-b9d0-ea7074075583', N'581940d5-848f-4493-9c66-42add81f301c', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:45:41.130' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'685b461f-1a68-4498-87c1-f00ee5d2f0b3', N'9fda3a1e-1486-4bf5-bfc4-a217951a7a6a', N'94407d86-77a3-4a6b-8cb5-abfa31ac3b0c', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 1, NULL, CAST(N'2023-05-13 12:54:28.593' AS DateTime), NULL, CAST(N'2023-05-13 12:54:28.593' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'a4337440-a79e-4c46-bcdd-f279ebc6ab29', N'827ce743-8340-4643-8512-de6b8b998b9c', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 16:36:42.323' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'c6ab40f6-7a16-4e69-a7c6-f5af695ab473', N'646d440f-2447-44b7-bd35-3690e7d1e5e8', N'0ad966a6-a5af-4e1b-8764-29a120431351', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 1, NULL, CAST(N'2023-05-13 13:49:49.673' AS DateTime), NULL, CAST(N'2023-05-13 13:49:49.730' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'f2e57dea-d98b-45fb-bb88-fa4f187f8c8a', N'385f83bd-5518-488d-a335-e9ecff0318c0', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'[超级管理员]提交了数据', CAST(N'2023-05-08 01:49:32.247' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'71e15ed0-cbcc-4fea-a45e-faaf58758b18', N'd1cd7028-132c-4b97-aec3-071f0ba7da0e', N'2ac1ddb2-19b7-412f-8c93-6f70228e5863', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 0, NULL, CAST(N'2023-05-13 12:06:21.153' AS DateTime), NULL, CAST(N'2023-05-13 12:06:21.153' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'3a54ffcb-c687-41b3-a59c-fe287cb0ba38', N'ddd6ea0c-e3db-49ad-8dfe-bb995c23bcf3', N'd6366d71-7fe1-480d-882c-d1b9a8419210', N'mtisrzm4x', N'>=200', 1, N'超级管理员', 3, N'原因不明。。', CAST(N'2023-05-13 15:37:07.950' AS DateTime), N'原因不明。。', CAST(N'2023-05-13 15:37:07.950' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableAuditLog] ([Id], [WorkFlowTable_Id], [WorkFlowTableStep_Id], [StepId], [StepName], [AuditId], [Auditor], [AuditStatus], [AuditResult], [AuditDate], [Remark], [CreateDate]) VALUES (N'b9d955f1-05b2-4c16-b877-ff700b2954a7', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be1dc0bf-96f0-46db-8a02-90362b1b0b38', N'xebxs78ls', N'qty>10', 3362, N'Admin测试', 1, N'同意。。。。。', CAST(N'2023-05-13 16:14:43.537' AS DateTime), N'同意。。。。。', CAST(N'2023-05-13 16:14:43.537' AS DateTime))
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'bacdbb3c-d50d-4082-83e1-0e932b9f7d0f', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'yuo5z0v07p', N'流程开始', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, CAST(N'2023-05-13 15:58:42.603' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'start', NULL, N'xebxs78ls', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'03e1881f-6a73-4e4c-a3ae-148a7d47e8d5', N'7db5447a-7a78-40d8-9585-0aab9375b61f', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'qq4qwkz9il', N'流程结束', NULL, NULL, 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-05-13 15:49:18.207' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'end', N'xk0xirr5zf', NULL, NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'53dd80a6-dd77-4c98-8531-1d648c5773e8', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'iyzakw0c8', N'流程开始', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:17:47.037' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'start', NULL, N'jkqinw0zc', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'8676db90-4a31-4670-b3f8-24d7c752071e', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'b9cv1h35jg', N'产品部>=7000审批', 3, N'ec238385-f907-44de-b99b-0eddcffa6750', 2, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:17:47.040' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'jkqinw0zc', N'hnoj7gaczc', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'6f7b76c5-82ea-49e5-9878-3965792d8988', N'62c8999f-f07e-4d47-827c-b1c4e63af323', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'b9cv1h35jg', N'产品部>=7000审批', 3, N'ec238385-f907-44de-b99b-0eddcffa6750', 2, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:19:06.443' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'jkqinw0zc', N'hnoj7gaczc', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'3021e4e6-ec9b-43ae-a7d2-443f1cb7ba44', N'62c8999f-f07e-4d47-827c-b1c4e63af323', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'iyzakw0c8', N'流程开始', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:19:06.443' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'start', NULL, N'jkqinw0zc', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'4fc4aca8-e0f6-4b57-b66a-4a1bf8dc3f85', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'jkqinw0zc', N'用户审批>=5000', 1, N'1', 1, 1, N'超级管理员', 1, CAST(N'2023-05-13 17:17:59.407' AS DateTime), N'同意。。。', CAST(N'2023-05-13 17:17:47.040' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'iyzakw0c8', N'b9cv1h35jg', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'f5cea9d2-c567-497a-ad6c-4b483a198aa4', N'62c8999f-f07e-4d47-827c-b1c4e63af323', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'jkqinw0zc', N'用户审批>=5000', 1, N'1', 1, 1, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:19:06.443' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'iyzakw0c8', N'b9cv1h35jg', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'032eb689-c842-4ebf-b072-6062864b300d', N'7db5447a-7a78-40d8-9585-0aab9375b61f', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'xebxs78ls', N'qty>10', 1, N'3362', 1, 3362, N'Admin测试', 0, CAST(N'2023-05-13 15:56:55.567' AS DateTime), N'同意。。。。', CAST(N'2023-05-13 15:49:18.207' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'yuo5z0v07p', N'xk0xirr5zf', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'0284ca27-cd47-48b2-9228-6731d86091ce', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'qq4qwkz9il', N'流程结束', NULL, NULL, 3, NULL, NULL, 0, NULL, NULL, CAST(N'2023-05-13 15:58:42.603' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'end', N'xk0xirr5zf', NULL, NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'4ed73980-2e6e-4052-9722-695375d93303', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'xk0xirr5zf', N'>=20', 2, N'2', 2, 3362, N'Admin测试', 1, CAST(N'2023-05-13 16:14:56.523' AS DateTime), N'通过。。。。。', CAST(N'2023-05-13 15:58:42.603' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'xebxs78ls', N'qq4qwkz9il', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'3c690619-948a-484e-88cd-6ad17371eafd', N'62c8999f-f07e-4d47-827c-b1c4e63af323', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'hnoj7gaczc', N'超级管理员审批', 1, N'1', 3, 1, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:19:06.443' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'b9cv1h35jg', N'5zfqhzz198', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'af2ef5d3-a9a3-4403-99ad-77a19ac79262', N'7db5447a-7a78-40d8-9585-0aab9375b61f', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'yuo5z0v07p', N'流程开始', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, CAST(N'2023-05-13 15:49:18.203' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'start', NULL, N'xebxs78ls', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'79dc0faa-4e29-47f4-bf8b-7be72244d848', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'hnoj7gaczc', N'超级管理员审批', 1, N'1', 3, 1, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:17:47.040' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'b9cv1h35jg', N'5zfqhzz198', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'3e9ff38c-dadc-4af4-8771-8c30791b0669', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'5zfqhzz198', N'流程结束', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:07:36.927' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'end', N'hnoj7gaczc', NULL, NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'be1dc0bf-96f0-46db-8a02-90362b1b0b38', N'a8a9cd0d-c885-434c-8adc-b0347e05b08a', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'xebxs78ls', N'qty>10', 1, N'3362', 1, 3362, N'Admin测试', 1, CAST(N'2023-05-13 16:14:43.537' AS DateTime), N'同意。。。。。', CAST(N'2023-05-13 15:58:42.603' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'yuo5z0v07p', N'xk0xirr5zf', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'2a273253-bc06-4721-91fa-996c72c85858', N'60baff11-492d-4e74-8e38-7f2fed2fec8c', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'5zfqhzz198', N'流程结束', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:17:47.040' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'end', N'hnoj7gaczc', NULL, NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'ba1a3451-535f-4831-8208-af87a880c7bf', N'7db5447a-7a78-40d8-9585-0aab9375b61f', N'be42a851-147a-493a-b42f-3dc7d3061e32', N'xk0xirr5zf', N'>=20', 2, N'2', 2, 3362, N'Admin测试', 0, CAST(N'2023-05-13 15:56:55.580' AS DateTime), N'同意。。。。', CAST(N'2023-05-13 15:49:18.207' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'xebxs78ls', N'qq4qwkz9il', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'c0a682a2-6043-492a-a15d-becb374353bd', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'iyzakw0c8', N'流程开始', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:07:36.927' AS DateTime), 1, N'超级管理员', 1, NULL, NULL, NULL, N'start', NULL, N'jkqinw0zc', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'de5133df-9ff7-494d-bb76-c9e457dfebad', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'b9cv1h35jg', N'产品部>=7000审批', 3, N'ec238385-f907-44de-b99b-0eddcffa6750', 2, 3362, N'Admin测试', 1, CAST(N'2023-05-13 17:11:47.383' AS DateTime), N'Admin测试管理员同意。。', CAST(N'2023-05-13 17:07:36.927' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'jkqinw0zc', N'hnoj7gaczc', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'a2035fc1-334b-4b54-abc9-caaf5c8c7b6d', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'hnoj7gaczc', N'超级管理员审批', 1, N'1', 3, 1, N'超级管理员', 1, CAST(N'2023-05-13 17:12:12.903' AS DateTime), N'超级管理员同意。。', CAST(N'2023-05-13 17:07:36.927' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'b9cv1h35jg', N'5zfqhzz198', NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'8f3a845e-6c12-4ba7-a24c-cf04884c9981', N'62c8999f-f07e-4d47-827c-b1c4e63af323', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'5zfqhzz198', N'流程结束', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-05-13 17:19:06.443' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'end', N'hnoj7gaczc', NULL, NULL)
GO
INSERT [dbo].[Sys_WorkFlowTableStep] ([Sys_WorkFlowTableStep_Id], [WorkFlowTable_Id], [WorkFlow_Id], [StepId], [StepName], [StepType], [StepValue], [OrderId], [AuditId], [Auditor], [AuditStatus], [AuditDate], [Remark], [CreateDate], [CreateID], [Creator], [Enable], [Modifier], [ModifyDate], [ModifyID], [StepAttrType], [ParentId], [NextStepId], [Weight]) VALUES (N'8486b561-6403-4d1c-af33-dd635bf63b8c', N'd82f4733-9916-4714-bf35-900ceaa049c1', N'aa7099a6-cfee-4845-ba95-56e425a11ace', N'jkqinw0zc', N'用户审批>=5000', 1, N'1', 1, 1, N'超级管理员', 1, CAST(N'2023-05-13 17:10:59.577' AS DateTime), NULL, CAST(N'2023-05-13 17:07:36.927' AS DateTime), NULL, NULL, 1, NULL, NULL, NULL, N'node', N'iyzakw0c8', N'b9cv1h35jg', NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzLog', @level2type=N'COLUMN',@level2name=N'TaskName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'耗时(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzLog', @level2type=N'COLUMN',@level2name=N'ElapsedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzLog', @level2type=N'COLUMN',@level2name=N'StratDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzLog', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzLog', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返回内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzLog', @level2type=N'COLUMN',@level2name=N'ResponseContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'TaskName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务分组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Corn表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'CronExpression'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'Method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Url地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'ApiUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'Describe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后执行执行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'LastRunTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运行状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'post参数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'PostData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'超时时间(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'TimeOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_QuartzOptions', @level2type=N'COLUMN',@level2name=N'ModifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'WorkName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'WorkTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'WorkTableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'NodeConfig'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'LineConfig'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权重' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlow', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程主表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowStep', @level2type=N'COLUMN',@level2name=N'WorkFlow_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程节点Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowStep', @level2type=N'COLUMN',@level2name=N'StepId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowStep', @level2type=N'COLUMN',@level2name=N'StepName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点类型(1=按用户审批,2=按角色审批)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowStep', @level2type=N'COLUMN',@level2name=N'StepType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批用户id或角色id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowStep', @level2type=N'COLUMN',@level2name=N'StepValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowStep', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowTable', @level2type=N'COLUMN',@level2name=N'WorkTableKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowTable', @level2type=N'COLUMN',@level2name=N'WorkTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表中文名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowTable', @level2type=N'COLUMN',@level2name=N'WorkTableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowTableStep', @level2type=N'COLUMN',@level2name=N'AuditId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowTableStep', @level2type=N'COLUMN',@level2name=N'Auditor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_WorkFlowTableStep', @level2type=N'COLUMN',@level2name=N'AuditStatus'
GO
USE [master]
GO
ALTER DATABASE [netcoredev] SET  READ_WRITE 
GO
