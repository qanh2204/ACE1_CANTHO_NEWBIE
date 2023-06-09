USE [master]
GO
/****** Object:  Database [DB_MOCK]    Script Date: 8/14/2022 1:35:14 ******/
CREATE DATABASE [DB_MOCK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_MOCK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_MOCK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_MOCK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_MOCK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_MOCK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_MOCK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_MOCK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_MOCK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_MOCK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_MOCK] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_MOCK] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_MOCK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_MOCK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_MOCK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_MOCK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_MOCK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_MOCK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_MOCK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_MOCK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_MOCK] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_MOCK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_MOCK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_MOCK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_MOCK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_MOCK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_MOCK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_MOCK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_MOCK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_MOCK] SET  MULTI_USER 
GO
ALTER DATABASE [DB_MOCK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_MOCK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_MOCK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_MOCK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_MOCK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_MOCK] SET QUERY_STORE = OFF
GO
USE [DB_MOCK]
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Comment]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Image_Product]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Image_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](255) NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Manufacturer]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Order]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Phone] [varchar](255) NULL,
	[PaymentId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Order_Detail]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Order_Detail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Payment]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Method] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CategoryId] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_User]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Username] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Status] [int] NOT NULL,
	[Type] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Vote]    Script Date: 8/14/2022 1:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Vote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Star] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Category] ON 

INSERT [dbo].[Tbl_Category] ([Id], [Name]) VALUES (1, N'T-SHIRTS')
INSERT [dbo].[Tbl_Category] ([Id], [Name]) VALUES (2, N'Tank Top')
INSERT [dbo].[Tbl_Category] ([Id], [Name]) VALUES (3, N'Dresses')
INSERT [dbo].[Tbl_Category] ([Id], [Name]) VALUES (4, N'Leggings')
INSERT [dbo].[Tbl_Category] ([Id], [Name]) VALUES (5, N'Mini Skirts')
INSERT [dbo].[Tbl_Category] ([Id], [Name]) VALUES (6, N'Sweatshirts & Hoodies')
SET IDENTITY_INSERT [dbo].[Tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Comment] ON 

INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (2, 2, 1039, N'beauty', CAST(N'2022-08-13T22:20:45.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (4, 2, 1, N'nice', CAST(N'2022-08-13T23:20:45.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (5, 2, 2, N'good', CAST(N'2022-08-13T22:23:24.457' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (6, 2, 1034, N'haha', CAST(N'2022-08-13T22:25:17.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (7, 2, 1035, N'good', CAST(N'2022-08-13T22:25:28.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (8, 2, 1036, N'nice
', CAST(N'2022-08-13T22:25:38.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (9, 2, 1037, N'lala', CAST(N'2022-08-13T22:25:48.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (10, 2, 1037, N'lala', CAST(N'2022-08-13T22:26:11.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (11, 2, 1038, N'ulala', CAST(N'2022-08-13T22:26:36.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (12, 2, 1038, N'nice', CAST(N'2022-08-13T22:26:40.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (13, 2, 1039, N'good', CAST(N'2022-08-13T22:26:55.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (14, 2, 1028, N'hihi', CAST(N'2022-08-13T22:27:18.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (15, 2, 1029, N'yumy', CAST(N'2022-08-13T22:58:10.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (16, 2, 1030, N'good quality', CAST(N'2022-08-13T22:58:34.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (17, 2, 1031, N'nice', CAST(N'2022-08-13T22:58:44.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (18, 2, 1033, N'lala', CAST(N'2022-08-13T22:58:56.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (19, 2, 1032, N'yes', CAST(N'2022-08-13T22:59:12.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (20, 2, 1033, N'good', CAST(N'2022-08-14T00:56:59.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (21, 2, 1033, N'haha', CAST(N'2022-08-14T01:02:09.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (22, 2, 1024, N'good', CAST(N'2022-08-14T01:04:07.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (23, 2, 1023, N'good', CAST(N'2022-08-14T01:04:17.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (24, 2, 1022, N'good', CAST(N'2022-08-14T01:04:24.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (25, 2, 1024, N'nice', CAST(N'2022-08-14T01:04:30.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (26, 2, 1023, N'nice', CAST(N'2022-08-14T01:04:38.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (27, 2, 1022, N'nice', CAST(N'2022-08-14T01:04:41.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (28, 2, 1025, N'nice', CAST(N'2022-08-14T01:04:48.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (29, 2, 1026, N'nice', CAST(N'2022-08-14T01:04:57.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (30, 2, 1027, N'nice', CAST(N'2022-08-14T01:05:03.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (31, 2, 1025, N'beauty', CAST(N'2022-08-14T01:05:14.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (32, 2, 1026, N'beauty', CAST(N'2022-08-14T01:05:20.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (33, 2, 1027, N'beauty', CAST(N'2022-08-14T01:05:26.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (34, 2, 17, N'beauty', CAST(N'2022-08-14T01:06:04.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (35, 2, 16, N'beauty', CAST(N'2022-08-14T01:06:14.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (36, 2, 15, N'beauty', CAST(N'2022-08-14T01:06:20.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (37, 2, 21, N'beauty', CAST(N'2022-08-14T01:06:32.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (38, 2, 1014, N'beauty', CAST(N'2022-08-14T01:06:39.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (39, 2, 1015, N'beauty', CAST(N'2022-08-14T01:06:45.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (40, 2, 1018, N'beauty', CAST(N'2022-08-14T01:06:52.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (41, 2, 1017, N'beauty', CAST(N'2022-08-14T01:06:57.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (42, 2, 1016, N'beauty', CAST(N'2022-08-14T01:07:03.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (43, 2, 1019, N'beauty', CAST(N'2022-08-14T01:07:09.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (44, 2, 1020, N'beauty', CAST(N'2022-08-14T01:07:15.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (45, 2, 1021, N'beauty', CAST(N'2022-08-14T01:07:21.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (46, 2, 1021, N'nice', CAST(N'2022-08-14T01:07:28.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (47, 2, 1020, N'nice', CAST(N'2022-08-14T01:07:33.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (48, 2, 1019, N'nice', CAST(N'2022-08-14T01:07:36.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (49, 2, 1016, N'nice', CAST(N'2022-08-14T01:07:38.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (50, 2, 1017, N'nice', CAST(N'2022-08-14T01:07:42.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (51, 2, 1018, N'nice', CAST(N'2022-08-14T01:07:45.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (52, 2, 1015, N'nice', CAST(N'2022-08-14T01:07:49.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (53, 2, 1014, N'nice', CAST(N'2022-08-14T01:07:53.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (54, 2, 21, N'nice', CAST(N'2022-08-14T01:07:56.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (55, 2, 15, N'nice', CAST(N'2022-08-14T01:07:59.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (56, 2, 16, N'nice', CAST(N'2022-08-14T01:08:02.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (57, 2, 17, N'nice', CAST(N'2022-08-14T01:08:06.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (58, 2, 17, N'good', CAST(N'2022-08-14T01:08:17.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (59, 2, 16, N'good', CAST(N'2022-08-14T01:08:24.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (60, 2, 15, N'good', CAST(N'2022-08-14T01:08:27.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (61, 2, 21, N'good', CAST(N'2022-08-14T01:08:30.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (62, 2, 1014, N'good', CAST(N'2022-08-14T01:08:33.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (63, 2, 1015, N'good', CAST(N'2022-08-14T01:08:37.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (64, 2, 1018, N'good', CAST(N'2022-08-14T01:08:40.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (65, 2, 1017, N'good', CAST(N'2022-08-14T01:08:44.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (66, 2, 1016, N'good', CAST(N'2022-08-14T01:08:47.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (67, 2, 1019, N'good', CAST(N'2022-08-14T01:08:50.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (68, 2, 1020, N'good', CAST(N'2022-08-14T01:08:53.000' AS DateTime))
INSERT [dbo].[Tbl_Comment] ([Id], [UserId], [ProductId], [Content], [CreateTime]) VALUES (69, 2, 1021, N'good', CAST(N'2022-08-14T01:08:57.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Image_Product] ON 

INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (20, N'6_1 (17).jpg', 6)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (21, N'7_1 (20).jpg', 7)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (22, N'8_1 (23).jpg', 8)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (23, N'9_ssrco,classic_tee,mens,101010_01c5ca27c6,front_alt,square_product,600x600.jpg', 9)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (24, N'10_ssrco,slim_fit_t_shirt,womens,101010_01c5ca27c6,front,square_product,600x600.jpg', 10)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (25, N'11_ra,tank,x1860,fafafa_ca443f4786,front-c,288,321,600,600-bg,f8f8f8.jpg', 11)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (26, N'12_ssrco,racerback,womens,101010_01c5ca27c6,front,square_product,x600-bg,f8f8f8.1.jpg', 12)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (27, N'14_gtdr,x1500,front,black-c,216,320,600,600-bg,f8f8f8.jpg', 14)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (28, N'15_aldr,x1440,front-c,168,326,600,600-bg,f8f8f8.jpg', 15)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (29, N'13_ssrco,classic_tee,mens,101010_01c5ca27c6,front_alt,square_product,600x600.jpg', 13)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (30, N'16_aldr,x1440,front-c,168,326,600,600-bg,f8f8f8.u2.jpg', 16)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (31, N'17_1.jpg', 17)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (34, N'21_ssrco,mhoodie,womens,fafafa_ca443f4786,front,square_product,x600-bg,f8f8f8.1.jpg', 21)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1002, N'1014_ssrco,lightweight_hoodie,mens,grey_lightweight_hoodie,front,square_product,x600-bg,f8f8f8.2u5.jpg', 1014)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1003, N'1015_ssrco,lightweight_hoodie,womens,charcoal_lightweight_hoodie,front,square_product,x600-bg,f8f8f8.1.jpg', 1015)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1004, N'1016_ssrco,lightweight_hoodie,womens,grey_lightweight_hoodie,front,square_product,x600-bg,f8f8f8.1.jpg', 1016)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1005, N'1017_ssrco,mhoodie,mens,101010_01c5ca27c6,front,square_product,x600-bg,f8f8f8.1.jpg', 1017)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1006, N'1018_ssrco,mhoodie,womens,charcoal_heather,front,square_product,x600-bg,f8f8f8.1.jpg', 1018)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1007, N'1019_ssrco,mhoodiez,mens,322e3f_696a94a5d4,front,square_product,600x600-bg,f8f8f8.jpg', 1019)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1008, N'1020_ssrco,mhoodiez,mens,oatmeal_heather,front,square_product,600x600-bg,f8f8f8.jpg', 1020)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1009, N'1021_ssrco,mhoodiez,mens,charcoal_heather,front,square_product,600x600-bg,f8f8f8.jpg', 1021)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1010, N'1022_ssrco,mhoodiez,mens,101010_01c5ca27c6,front,square_product,600x600-bg,f8f8f8.jpg', 1022)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1011, N'1023_ssrco,mhoodiez,mens,322e3f_696a94a5d4,front,square_product,600x600-bg,f8f8f8.jpg', 1023)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1012, N'1024_ssrco,mhoodie,womens,charcoal_heather,front,square_product,x600-bg,f8f8f8.1.jpg', 1024)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1013, N'1_ssrco,slim_fit_t_shirt,mens,fafafa_ca443f4786,front,square_product,600x600.u3.jpg', 1)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1014, N'2_ssrco,slim_fit_t_shirt,mens,101010_01c5ca27c6,front,square_product,600x600.jpg', 2)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1015, N'3_ssrco,classic_tee,mens,101010_01c5ca27c6,front_alt,square_product,600x600.jpg', 3)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1016, N'4_ssrco,classic_tee,mens,fafafa_ca443f4786,front_alt,square_product,600x600.jpg', 4)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1017, N'5_ssrco,classic_tee,womens,fafafa_ca443f4786,front_alt,square_product,600x600.jpg', 5)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1018, N'1025_ssrco,racerback,womens,322e3f_696a94a5d4,front,square_product,x600-bg,f8f8f8.1.jpg', 1025)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1019, N'1026_ra,tank,x1860,fafafa_ca443f4786,front-c,288,321,600,600-bg,f8f8f8.u5.jpg', 1026)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1020, N'1027_ra,tank,x1860,322e3f_696a94a5d4,front-c,288,321,600,600-bg,f8f8f8.jpg', 1027)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1021, N'1028_ra,tank,x1860,101010_01c5ca27c6,front-c,288,321,600,600-bg,f8f8f8.jpg', 1028)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1022, N'1029_ra,tank,x1860,322e3f_696a94a5d4,front-c,288,321,600,600-bg,f8f8f8.jpg', 1029)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1023, N'1030_gtdr,x1500,front,black-c,216,320,600,600-bg,f8f8f8.u2.jpg', 1030)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1024, N'1031_gtdr,x1500,front,black-c,216,320,600,600-bg,f8f8f8.jpg', 1031)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1025, N'1032_gptr,1265x,front,black-c,330,402,600,600-bg,f8f8f8.jpg', 1032)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1026, N'1033_gtdr,x1500,front,black-c,216,320,600,600-bg,f8f8f8.jpg', 1033)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1027, N'1034_leggings,m,x540,front-pad,600x600,f8f8f8.u2.jpg', 1034)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1028, N'1035_leggings,m,x540,front-pad,600x600,f8f8f8.jpg', 1035)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1029, N'1036_leggings,m,x540,front-pad,600x600,f8f8f8.jpg', 1036)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1030, N'1037_leggings,m,x540,front-pad,600x600,f8f8f8.u2.jpg', 1037)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1031, N'1038_pencil_skirt,x600,front-c,227,0,523,523-bg,f8f8f8.u6.jpg', 1038)
INSERT [dbo].[Tbl_Image_Product] ([Id], [Source], [ProductId]) VALUES (1032, N'1039_pencil_skirt,x600,front-c,227,0,523,523-bg,f8f8f8.jpg', 1039)
SET IDENTITY_INSERT [dbo].[Tbl_Image_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Manufacturer] ON 

INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (1, N' Adidas')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (2, N'Abacab')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (3, N'Air Jordan')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (4, N' 4 Fatherz')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (5, N'Winners Circle')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (6, N'Uniform')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (7, N'Discover Singapore')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (8, N' Roslotto')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (9, N'Dolce & Gabbana')
INSERT [dbo].[Tbl_Manufacturer] ([Id], [Name]) VALUES (10, N'Best Company')
SET IDENTITY_INSERT [dbo].[Tbl_Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Order] ON 

INSERT [dbo].[Tbl_Order] ([Id], [UserId], [Total], [Address], [Phone], [PaymentId], [Status], [CreateTime], [UpdateTime]) VALUES (1, 2, 45, N'vn, cantho', N'0998787654', 1, 0, CAST(N'2022-08-14T00:55:37.063' AS DateTime), CAST(N'2022-08-14T00:55:37.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Order_Detail] ON 

INSERT [dbo].[Tbl_Order_Detail] ([Id], [OrderId], [ProductId], [Price], [Amount], [CreateTime], [UpdateTime]) VALUES (1, 1, 1038, 45, 1, CAST(N'2022-08-14T00:55:37.143' AS DateTime), CAST(N'2022-08-14T00:55:37.143' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Payment] ON 

INSERT [dbo].[Tbl_Payment] ([Id], [Method]) VALUES (1, N'cash')
INSERT [dbo].[Tbl_Payment] ([Id], [Method]) VALUES (2, N'Reddit Card')
INSERT [dbo].[Tbl_Payment] ([Id], [Method]) VALUES (3, N'Banking')
SET IDENTITY_INSERT [dbo].[Tbl_Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON 

INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1, N'VINTAGE ABACAB T-SHIRT - SMALL GREY COTTON', 12, 100, N'Description:

Vintage grey Abacab t-shirt, fits small.

CONDITION: very good.
STYLE: t-shirt
ERA: 1990s
COLOUR: grey
FABRIC: cotton

More by: Abacab', 1, 2)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (2, N'VINTAGE GUESS T-SHIRT - LARGE GREY COTTON', 11, 100, N'Description:

 Vintage grey Guess t-shirt, fits large.

CONDITION: good - marks on front and back as shown.
STYLE: t-shirt
ERA: 1990s
COLOUR: grey
FABRIC: cotton

More by: Air Jordan', 1, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (3, N'VINTAGE GUESS LONG SLEEVE T-SHIRT - XL ', 10, 220, N'Description:

 Vintage white Guess long sleeve t-shirt, fits x-large.

CONDITION: very good.
STYLE: long sleeve t-shirt
ERA: 1990s
COLOUR: white
FABRIC: cotton

More by: 4 Fatherz', 1, 4)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (4, N'VINTAGE DOLCE  GABBANA T-SHIRT - MEDIUM ', 23, 50, N'Description:

Vintage black Dolce & Gabbana t-shirt, fits medium.

CONDITION: very good
STYLE: t-shirt
ERA: 1990s
COLOUR: black
FABRIC: cotton

Notes: Labelled as Underwear.

More by: Dolce & Gabbana', 1, 9)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (5, N'VINTAGE DOLCE GABBANA T-SHIRT - MEDIUM ', 34, 600, N'Description:

Vintage red Dolce & Gabbana t-shirt, fits medium.

CONDITION: very good.
STYLE: t-shirt
ERA: 1990s
COLOUR: red
FABRIC: cotton

Notes: Labeled as x-large

More by: Dolce & Gabbana', 1, 9)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (6, N'VINTAGE GUESS LONG SLEEVE T-SHIRT', 87, 69, N'Description:

Vintage black & purple Guess long sleeve t-shirt, fits medium.

CONDITION: very good.
STYLE: long sleeve t-shirt
ERA: 1990s
COLOUR: black & purple
FABRIC: cotton', 1, 8)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (7, N'VINTAGE GUESS T-SHIRT', 56, 50, N'Description:

Vintage multicoloured Guess t-shirt, fits large.

CONDITION: good - marks on back as shown.
STYLE: t-shirt
ERA: 1990s
COLOUR: multicoloured
FABRIC: cotton', 1, 10)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (8, N'Vintage Adidas T-Shirt', 45, 987, N'Description:
Vintage white Adidas t-shirt, fits large.

CONDITION: good - faint mark on front as shown.
STYLE: t-shirt
ERA: 1990s
COLOUR: white
FABRIC: cotton

More by: Adidas', 1, 1)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (9, N'LA HAINE  LODIO Classic T-Shirt', 34, 45, N'Features
The standard, traditional t-shirt for everyday wear
Classic, generous, boxy fit
Male model shown is 6''0" / 183 cm tall and wearing size Medium
Female model shown is 5''8" / 173 cm tall and wearing size Small
Heavyweight 5.3 oz / 180 gsm fabric, solid colors are 100% preshrunk cotton, heather grey is 90% cotton/10% polyester, denim heather is 50% cotton/ 50% polyester
Double-needle hems and neck band for durability', 1, 1)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (10, N'think its not illegal yet Essential', 45, 987, N'Features
Just your everyday smooth, comfy tee, a wardrobe staple
Slim fit, so size up if you prefer a looser fit, or check out the Classic T-Shirt
Male model shown is 6''0" / 183 cm tall and wearing size Large
Female model shown is 5''8" / 173 cm tall and wearing size Small
Midweight 4.2 oz. / 145 gsm fabric, solid color t-shirts are 100% cotton, heather grey t-shirts are 90% cotton/10% polyester charcoal heather t-shirts are 52% cotton/48% polyester', 1, 2)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (11, N'Online shopping Tank Top', 65, 765, N'Features
Slim fit, but if that’s not your thing, order a size up
Solid colors are 100% cotton; heathered and marled fabrics are 90% cotton, 10% polyester
Ethically sourced', 2, 8)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (12, N'Online Shopping is my Jam', 34, 567, N'Features
Form-fitting shirt for women who like a feminine tank top
100% cotton, generous arm openings and exceptionally smooth finish
Sweatshop-free, ethically sourced cotton apparel
Cold wash and hang out to dry', 2, 8)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (13, N'ONLINE SHOPPING Racerback Tank Top', 56, 345, N'Features
Form-fitting shirt for women who like a feminine tank top
100% cotton, generous arm openings and exceptionally smooth finish
Sweatshop-free, ethically sourced cotton apparel
Cold wash and hang out to dry', 2, 7)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (14, N'Online shopping A Line Dress', 76, 234, N'Features
Loose swing shape for an easy, flowy fit
Sizes run large, so order a size down from your usual
Print covers entire front and back panel with your chosen design, by an independent artist
97% polyester, 3% elastane woven dress fabric with silky handfeel
Note that due to the production process, the placement of the print may vary slightly from the preview
A-Line dresses are made in the USA', 3, 7)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (15, N'SUNFLOWERS ON BLACK A-Line Dress', 22, 867, N'Features
Loose swing shape for an easy, flowy fit
Sizes run large, so order a size down from your usual
Print covers entire front and back panel with your chosen design, by an independent artist
97% polyester, 3% elastane woven dress fabric with silky handfeel
Note that due to the production process, the placement of the print may vary slightly from the preview
A-Line dresses are made in the USA', 3, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (16, N'Fashion Art - 338 A-Line Dress', 87, 345, N'Features
Loose swing shape for an easy, flowy fit
Sizes run large, so order a size down from your usual
Print covers entire front and back panel with your chosen design, by an independent artist
97% polyester, 3% elastane woven dress fabric with silky handfeel
Note that due to the production process, the placement of the print may vary slightly from the preview
A-Line dresses are made in the USA', 3, 6)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (17, N'The Coolest Sport Hockey Hockey Lovers Leggings', 67, 678, N'Features
Artwork printed all over leggings
Constructed from 83% polyester, 17% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size
Product dimensions refer to the garment measurements, not the measurements of the person
Machine washable', 4, 4)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (21, N'Online shopping Lightweight Sweatshirt', 34, 564, N'Features
Raglan sleeve for a great vintage-inspired slim fit
Heathered and marled fabric ringspun for softness
Midweight 7.5 oz (250gsm) French terry
Solid colors are 80% ring-spun cotton, 20% polyester. Heather colors are 60% ring-spun cotton, 40% polyester
1 x 1 rib cuffs and crewneck band with spandex, to maintain shape
Cold wash and hang out to dry to preserve your print', 6, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1014, N'Shopping Cart Lightweight Hoodie', 85, 456, N'Features
Slim fit, so size up if you prefer a regular fit, or go two sizes up for a baggy fit
Midweight 7.5 oz (250gsm) French terry, ring-spun for softness
Solid colors are 80% ring-spun cotton, 20% polyester. Heather colors are 60% ring-spun cotton, 40% polyester
Cold wash and hang out to dry to preserve your print
1 x 1 rib cuffs with spandex to maintain shape
Front pouch (kangaroo) pocket and dyed to match drawcord detailing
Custom printed with your chosen artwork, when you order', 6, 4)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1015, N'LETS GO LOVELY SHOPPING Pullover Hoodie', 65, 65, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Front pouch pocket, matching drawstring and rib cuffs
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 5)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1016, N'My Favorite Sport is Tracking My Online', 34, 76, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Front pouch pocket, matching drawstring and rib cuffs
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1017, N'My Favorite Sport is Tracking My Online Orders ', 45, 45, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Front pouch pocket, matching drawstring and rib cuffs
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1018, N' Tracking My Online Orders Pullover Sweatshirt', 54, 56, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Crew neck sweatshirt with ribbed cuffs, neckband and hem
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 5)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1019, N'Tracking My Online Orders Zipped Hoodie', 54, 34, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Front pouch pocket, matching drawstring and rib cuffs
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 8)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1020, N'Zipped Hoodie', 45, 65, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Front pouch pocket, matching drawstring and rib cuffs
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 5)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1021, N'Tracking My Online Orders Pullover Sweatshirt', 54, 45, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Crew neck sweatshirt with ribbed cuffs, neckband and hem
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 2)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1022, N'Everything Has Beauty T Shirt Zipped Hoodie', 45, 43, N'Features
Heavyweight 8.25 oz. (~280 gsm) cotton-rich fleece
Solid colors are 80% cotton, 20% polyester. Heather Grey is 70% cotton, 30% polyester. Charcoal Heather is 60% cotton, 40% polyester
Front pouch pocket, matching drawstring and rib cuffs
Ethically sourced following the World Responsible Apparel Practices Standards
Note: If you like your hoodies baggy go 2 sizes up', 6, 7)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1023, N'Just Chilling Lightweight Hoodie', 34, 98, N'Features
Slim fit, so size up if you prefer a regular fit, or go two sizes up for a baggy fit
Midweight 7.5 oz (250gsm) French terry, ring-spun for softness
Solid colors are 80% ring-spun cotton, 20% polyester. Heather colors are 60% ring-spun cotton, 40% polyester
Cold wash and hang out to dry to preserve your print
1 x 1 rib cuffs with spandex to maintain shape
Front pouch (kangaroo) pocket and dyed to match drawcord detailing
Custom printed with your chosen artwork, when you order', 6, 8)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1024, N'support your local Dealer Lightweight Hoodie', 54, 54, N'Features
Slim fit, so size up if you prefer a regular fit, or go two sizes up for a baggy fit
Midweight 7.5 oz (250gsm) French terry, ring-spun for softness
Solid colors are 80% ring-spun cotton, 20% polyester. Heather colors are 60% ring-spun cotton, 40% polyester
Cold wash and hang out to dry to preserve your print
1 x 1 rib cuffs with spandex to maintain shape
Front pouch (kangaroo) pocket and dyed to match drawcord detailing
Custom printed with your chosen artwork, when you order', 6, 6)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1025, N'Tracking My Online Orders Tank Top', 54, 54, N'Features
Slim fit, but if that’s not your thing, order a size up
Solid colors are 100% cotton; heathered and marled fabrics are 90% cotton, 10% polyester
Ethically sourced', 2, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1026, N'support your local Dealer Tank Top', 45, 53, N'Features
Slim fit, but if that’s not your thing, order a size up
Solid colors are 100% cotton; heathered and marled fabrics are 90% cotton, 10% polyester
Ethically sourced', 2, 8)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1027, N'Everything Has Beauty T Shirt Tank Top', 23, 32, N'Features
Slim fit, but if that’s not your thing, order a size up
Solid colors are 100% cotton; heathered and marled fabrics are 90% cotton, 10% polyester
Ethically sourced', 2, 1)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1028, N'Shopaholic and Shopping Lover Racerback Tank Top', 14, 43, N'Features
Form-fitting shirt for women who like a feminine tank top
100% cotton, generous arm openings and exceptionally smooth finish
Sweatshop-free, ethically sourced cotton apparel
Cold wash and hang out to dry', 2, 7)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1029, N'Racerback Tank Top', 67, 54, N'Features
Form-fitting shirt for women who like a feminine tank top
100% cotton, generous arm openings and exceptionally smooth finish
Sweatshop-free, ethically sourced cotton apparel
Cold wash and hang out to dry', 2, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1030, N'Young Turq Graphic T-Shirt Dress', 45, 345, N'Features
Graphic T-shirt Dresses feature your chosen design, by an independent artist
Sublimation printed 96% polyester, 4% elastane front panel
Solid color 100% cotton back/sleeves/rib
Loose casual fit
Graphic T-Shirt Dresses are made and printed in the USA', 3, 9)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1031, N'Im probably online shopping ALine Dress', 54, 345, N'Features
Loose swing shape for an easy, flowy fit
Sizes run large, so order a size down from your usual
Print covers entire front and back panel with your chosen design, by an independent artist
97% polyester, 3% elastane woven dress fabric with silky handfeel
Note that due to the production process, the placement of the print may vary slightly from the preview', 3, 9)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1032, N'LETS GO SHOPPING Graphic TShirt Dress', 34, 54, N'Features
Graphic T-shirt Dresses feature your chosen design, by an independent artist
Sublimation printed 96% polyester, 4% elastane front panel
Solid color 100% cotton back/sleeves/rib
Loose casual fit
Graphic T-Shirt Dresses are made and printed in the USA', 3, 4)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1033, N'Yeah Whatever ALine Dress', 54, 45, N'Features
Loose swing shape for an easy, flowy fit
Sizes run large, so order a size down from your usual
Print covers entire front and back panel with your chosen design, by an independent artist
97% polyester, 3% elastane woven dress fabric with silky handfeel
Note that due to the production process, the placement of the print may vary slightly from the preview
A-Line dresses are made in the USA', 3, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1034, N'new arrival Leggings', 34, 54, N'Features
Artwork printed all over leggings
Constructed from 83% polyester, 17% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size
Product dimensions refer to the garment measurements, not the measurements of the person
Machine washable', 4, 6)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1035, N'Alopeno flower collection Ladies Tshirt Leggings', 45, 87, N'Features
Artwork printed all over leggings
Constructed from 83% polyester, 17% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size
Product dimensions refer to the garment measurements, not the measurements of the person
Machine washable', 4, 3)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1036, N'THANKS SHOPPING WITH US. Leggings', 87, 890, N'Features
Artwork printed all over leggings
Constructed from 83% polyester, 17% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size
Product dimensions refer to the garment measurements, not the measurements of the person
Machine washable', 4, 1)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1037, N'The Coolest Sport Hockey Hockey Lovers', 45, 65, N'Features
Artwork printed all over leggings
Constructed from 83% polyester, 17% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size
Product dimensions refer to the garment measurements, not the measurements of the person
Machine washable', 4, 7)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1038, N'Online shopping Mini Skirt', 45, 53, N'Features
Repeated artwork on front and back
Constructed from 88% polyester, 12% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size', 5, 6)
INSERT [dbo].[Tbl_Product] ([Id], [Name], [Price], [Amount], [Description], [CategoryId], [ManufacturerId]) VALUES (1039, N'Evolution Shopping Shopping Buy', 34, 98, N'Features
Repeated artwork on front and back
Constructed from 88% polyester, 12% elastane
Elastic waistband and stretchy knit fabric allows you to move. For in-between sizes, choose the larger size
Product dimensions refer to the garment measurements, not the measurements of the person
Machine washable', 5, 7)
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_User] ON 

INSERT [dbo].[Tbl_User] ([Id], [Name], [Username], [Password], [Email], [Phone], [Address], [Status], [Type]) VALUES (2, N'pham thanh duy', N'admin123', N'4297F44B13955235245B2497399D7A93', N'biolife@gmail.com', N'0987654321', N'vn', 1, 1)
INSERT [dbo].[Tbl_User] ([Id], [Name], [Username], [Password], [Email], [Phone], [Address], [Status], [Type]) VALUES (3, N'anh dao', N'anhdao', N'4297F44B13955235245B2497399D7A93', N'qanh2204@gmail.com', N'0987654567', N'vn', 0, 0)
SET IDENTITY_INSERT [dbo].[Tbl_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Vote] ON 

INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (2, 2, 1039, 2, CAST(N'2022-08-13T22:26:55.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (3, 2, 1034, 3, CAST(N'2022-08-13T22:25:17.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (4, 2, 1035, 5, CAST(N'2022-08-13T22:25:28.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (5, 2, 1036, 4, CAST(N'2022-08-13T22:25:38.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (6, 2, 1037, 2, CAST(N'2022-08-13T22:26:11.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (7, 2, 1038, 5, CAST(N'2022-08-13T22:26:40.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (8, 2, 1028, 2, CAST(N'2022-08-13T22:27:18.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (9, 2, 1029, 5, CAST(N'2022-08-13T22:58:10.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (10, 2, 1030, 4, CAST(N'2022-08-13T22:58:34.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (11, 2, 1031, 3, CAST(N'2022-08-13T22:58:44.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (12, 2, 1033, 4, CAST(N'2022-08-14T01:02:09.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (13, 2, 1032, 5, CAST(N'2022-08-13T22:59:12.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (14, 2, 1024, 3, CAST(N'2022-08-14T01:04:30.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (15, 2, 1023, 5, CAST(N'2022-08-14T01:04:38.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (16, 2, 1022, 5, CAST(N'2022-08-14T01:04:41.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (17, 2, 1025, 4, CAST(N'2022-08-14T01:05:14.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (18, 2, 1026, 3, CAST(N'2022-08-14T01:05:20.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (19, 2, 1027, 1, CAST(N'2022-08-14T01:05:26.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (20, 2, 17, 2, CAST(N'2022-08-14T01:08:17.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (21, 2, 16, 4, CAST(N'2022-08-14T01:08:24.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (22, 2, 15, 2, CAST(N'2022-08-14T01:08:27.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (23, 2, 21, 5, CAST(N'2022-08-14T01:08:30.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (24, 2, 1014, 5, CAST(N'2022-08-14T01:08:33.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (25, 2, 1015, 2, CAST(N'2022-08-14T01:08:37.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (26, 2, 1018, 5, CAST(N'2022-08-14T01:08:40.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (27, 2, 1017, 2, CAST(N'2022-08-14T01:08:44.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (28, 2, 1016, 5, CAST(N'2022-08-14T01:08:47.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (29, 2, 1019, 1, CAST(N'2022-08-14T01:08:50.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (30, 2, 1020, 3, CAST(N'2022-08-14T01:08:53.000' AS DateTime))
INSERT [dbo].[Tbl_Vote] ([Id], [UserId], [ProductId], [Star], [CreateTime]) VALUES (31, 2, 1021, 2, CAST(N'2022-08-14T01:08:57.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Vote] OFF
GO
ALTER TABLE [dbo].[Tbl_Comment] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Tbl_Order] ADD  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Tbl_Order_Detail] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Tbl_Order_Detail] ADD  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Tbl_Product] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Tbl_User] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Tbl_User] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Tbl_Vote] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Tbl_Comment]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Comment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Tbl_User] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Image_Product]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Tbl_Payment] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Tbl_User] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Order_Detail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Tbl_Order] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Order_Detail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Tbl_Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Vote]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Vote]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Tbl_User] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Order]  WITH CHECK ADD CHECK  (([Status]=(0) OR [Status]=(1) OR [Status]=(2) OR [Status]=(3)))
GO
ALTER TABLE [dbo].[Tbl_User]  WITH CHECK ADD CHECK  (([Status]=(1) OR [Status]=(0)))
GO
ALTER TABLE [dbo].[Tbl_Vote]  WITH CHECK ADD CHECK  (([Star]=(1) OR [Star]=(2) OR [Star]=(3) OR [Star]=(4) OR [Star]=(5)))
GO
USE [master]
GO
ALTER DATABASE [DB_MOCK] SET  READ_WRITE 
GO
