USE [master]
GO
/****** Object:  Database [JAVALAB]    Script Date: 2/8/2017 11:52:42 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 2/8/2017 11:52:43 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2/8/2017 11:52:43 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2/8/2017 11:52:43 PM ******/
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
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_IssuedDate]  DEFAULT (getdate()) FOR [IssuedDate]
GO
USE [master]
GO
ALTER DATABASE [JAVALAB] SET  READ_WRITE 
GO
