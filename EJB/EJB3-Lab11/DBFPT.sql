USE [master]
GO
/****** Object:  Database [JAVALAB]    Script Date: 3/5/2017 1:52:38 PM ******/
CREATE DATABASE [JAVALAB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JAVALAB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JAVALAB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JAVALAB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\JAVALAB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JAVALAB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JAVALAB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JAVALAB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JAVALAB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JAVALAB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JAVALAB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JAVALAB] SET ARITHABORT OFF 
GO
ALTER DATABASE [JAVALAB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JAVALAB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JAVALAB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JAVALAB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JAVALAB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JAVALAB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JAVALAB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JAVALAB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JAVALAB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JAVALAB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JAVALAB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JAVALAB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JAVALAB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JAVALAB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JAVALAB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JAVALAB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JAVALAB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JAVALAB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JAVALAB] SET  MULTI_USER 
GO
ALTER DATABASE [JAVALAB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JAVALAB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JAVALAB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JAVALAB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JAVALAB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JAVALAB] SET QUERY_STORE = OFF
GO
USE [JAVALAB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [JAVALAB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/5/2017 1:52:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [varchar](10) NOT NULL,
	[FullName] [nvarchar](80) NOT NULL,
	[Balance] [float] NOT NULL,
	[Role] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/5/2017 1:52:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/5/2017 1:52:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[ProductIDList] [ntext] NOT NULL,
	[QuantityList] [ntext] NOT NULL,
	[PriceList] [ntext] NOT NULL,
	[IssuedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/5/2017 1:52:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[QuantityPerUnit] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 3/5/2017 1:52:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[Lastname] [nchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([ID], [FullName], [Balance], [Role]) VALUES (N'123', N'DUC', 1000, 1)
INSERT [dbo].[Account] ([ID], [FullName], [Balance], [Role]) VALUES (N'1234', N'1234', 0, 1)
INSERT [dbo].[Account] ([ID], [FullName], [Balance], [Role]) VALUES (N'999', N'DU', 0, 1)
INSERT [dbo].[Account] ([ID], [FullName], [Balance], [Role]) VALUES (N'9999', N'UUU', 0, 1)
INSERT [dbo].[Account] ([ID], [FullName], [Balance], [Role]) VALUES (N'DUC', N'DUC', 0, 1)
INSERT [dbo].[Account] ([ID], [FullName], [Balance], [Role]) VALUES (N'HELLO', N'HELLO', 0, 1)
INSERT [dbo].[Customers] ([Username], [Password]) VALUES (N'123                                               ', N'123                                               ')
INSERT [dbo].[Customers] ([Username], [Password]) VALUES (N'456                                               ', N'456                                               ')
INSERT [dbo].[Customers] ([Username], [Password]) VALUES (N'789                                               ', N'789                                               ')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (1, N'123', N'123', N'123', N'123', CAST(N'2017-02-08T23:21:08.200' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (2, N'123', N'1;', N'10 x 10 ;', N'100;', CAST(N'2017-02-08T23:41:33.713' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (3, N'123', N'1;', N'10 x 10 ;', N'100;', CAST(N'2017-02-08T23:41:47.847' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (4, N'123', N'3;1;2;', N'3;7;3;', N'500;100;200;', CAST(N'2017-02-08T23:45:17.400' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (5, N'123', N'1;3;2;', N'7;3;3;', N'100;500;200;', CAST(N'2017-02-08T23:45:40.633' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (6, N'123', N'3;1;2;', N'3;7;3;', N'500;100;200;', CAST(N'2017-02-08T23:54:28.410' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (7, N'123', N'2;1;3;', N'0;0;0;', N'200;100;500;', CAST(N'2017-02-08T23:54:36.967' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (8, N'123', N'', N'', N'', CAST(N'2017-02-08T23:57:28.787' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (9, N'123', N'3;1;2;', N'1;2;2;', N'500;100;200;', CAST(N'2017-02-09T00:02:23.690' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (10, N'123', N'2;3;1;', N'2;1;2;', N'200;500;100;', CAST(N'2017-02-09T00:02:32.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (11, N'123', N'2;3;1;', N'2;1;2;', N'200;500;100;', CAST(N'2017-02-09T00:02:34.517' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (12, N'123', N'2;3;1;', N'3;1;2;', N'200;500;100;', CAST(N'2017-02-09T00:03:57.927' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerName], [ProductIDList], [QuantityList], [PriceList], [IssuedDate]) VALUES (13, N'123', N'1;3;2;', N'2;1;3;', N'100;500;200;', CAST(N'2017-02-09T00:08:34.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [QuantityPerUnit], [Price]) VALUES (1, N'Duc', N'10 x 10 ', 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [QuantityPerUnit], [Price]) VALUES (2, N'Hello', N'20 x 20', 200)
INSERT [dbo].[Products] ([ProductID], [ProductName], [QuantityPerUnit], [Price]) VALUES (3, N'Love', N'50 x 50 ', 500)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Registration] ([Username], [Password], [Lastname], [isAdmin]) VALUES (N'123                                               ', N'123                                               ', N'123                                               ', 1)
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_IssuedDate]  DEFAULT (getdate()) FOR [IssuedDate]
GO
USE [master]
GO
ALTER DATABASE [JAVALAB] SET  READ_WRITE 
GO
