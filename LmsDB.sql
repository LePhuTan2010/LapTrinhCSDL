USE [master]
GO
/****** Object:  Database [LmsDB]    Script Date: 16-Sep-21 12:31:18 AM ******/
CREATE DATABASE [LmsDB] ON  PRIMARY 
( NAME = N'LmsDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LmsDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LmsDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LmsDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LmsDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LmsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LmsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LmsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LmsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LmsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LmsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LmsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LmsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LmsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LmsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LmsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LmsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LmsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LmsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LmsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LmsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LmsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LmsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LmsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LmsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LmsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LmsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LmsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LmsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LmsDB] SET  MULTI_USER 
GO
ALTER DATABASE [LmsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LmsDB] SET DB_CHAINING OFF 
GO
USE [LmsDB]
GO
/****** Object:  Table [dbo].[Book_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Master](
	[Book_Id] [varchar](50) NULL,
	[Book_Name] [varchar](100) NULL,
	[Book_Auth] [varchar](50) NULL,
	[Book_Edition] [int] NULL,
	[Book_Pages] [int] NULL,
	[Book_Publish] [int] NULL,
	[Sr_Id] [int] NULL,
	[Book_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Register_Main]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Register_Main](
	[Reg_Id] [int] NULL,
	[Reg_Date] [datetime] NULL,
	[Mem_Id] [varchar](50) NULL,
	[Reg_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Register_Sub]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Register_Sub](
	[Reg_Id] [int] NULL,
	[Reg_Date] [datetime] NULL,
	[Mem_Id] [varchar](50) NULL,
	[Brs_No] [int] NULL,
	[Book_Id] [varchar](50) NULL,
	[Br_Out_Date] [datetime] NULL,
	[Br_In_Date] [datetime] NULL,
	[Br_Qty] [int] NULL,
	[Br_Fine] [float] NULL,
	[Br_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mem_Transaction]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mem_Transaction](
	[Trans_Id] [int] NULL,
	[Trans_Date] [datetime] NULL,
	[Mem_Id] [varchar](50) NULL,
	[Mem_Name] [varchar](50) NULL,
	[Amount] [float] NULL,
	[Fine] [float] NULL,
	[Type] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member_Master](
	[Mem_Id] [varchar](50) NULL,
	[Mem_Name] [varchar](150) NULL,
	[Mem_Email] [varchar](150) NULL,
	[Mem_Mobile] [varchar](50) NULL,
	[Mem_Address] [varchar](250) NULL,
	[Mem_Dob] [datetime] NULL,
	[Mem_Doj] [datetime] NULL,
	[Plan_Id] [varchar](50) NULL,
	[Mem_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan_Master](
	[Plan_Id] [varchar](50) NULL,
	[Plan_Name] [varchar](50) NULL,
	[Plan_Doc] [datetime] NULL,
	[Plan_Book_Limit] [int] NULL,
	[Plan_Book_Hold] [int] NULL,
	[Plan_Validity] [int] NULL,
	[Plan_Amount] [float] NULL,
	[Plan_Dis] [float] NULL,
	[Plan_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile_Master](
	[Pro_User_Id] [varchar](50) NULL,
	[Pro_Name] [varchar](100) NULL,
	[Pro_Email] [varchar](150) NULL,
	[Pro_Mobile] [varchar](50) NULL,
	[Pro_Password] [varchar](50) NULL,
	[Pro_Address] [varchar](250) NULL,
	[Pro_Role] [varchar](50) NULL,
	[Pro_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Main]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Main](
	[Pur_Id] [varchar](50) NULL,
	[Pur_Date] [datetime] NULL,
	[Pur_From] [varchar](50) NULL,
	[Pur_Amount] [float] NULL,
	[Pur_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase_Sub]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Sub](
	[Pur_Id] [varchar](50) NULL,
	[Pur_Date] [datetime] NULL,
	[Pur_No] [int] NULL,
	[Book_Id] [varchar](50) NULL,
	[Book_Name] [varchar](100) NULL,
	[Qty] [int] NULL,
	[Rate] [float] NULL,
	[Amount] [float] NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rack_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rack_Master](
	[Rack_Id] [int] NULL,
	[Rack_Name] [varchar](50) NULL,
	[Rack_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Master](
	[Role_Id] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[Role_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sec_Rac_Map]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sec_Rac_Map](
	[Sr_Id] [int] NULL,
	[Sec_Id] [int] NULL,
	[Rack_Id] [int] NULL,
	[Sr_Print] [int] NULL,
	[Sr_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section_Master]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section_Master](
	[Sec_Id] [int] NULL,
	[Sec_Name] [varchar](50) NULL,
	[Sec_Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 16-Sep-21 12:31:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[Book_Id] [varchar](50) NULL,
	[Book_Name] [varchar](150) NULL,
	[Qty] [int] NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [LmsDB] SET  READ_WRITE 
GO
