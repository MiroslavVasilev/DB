USE [master]
GO
/****** Object:  Database [Homework_Modelling]    Script Date: 9.10.2015 г. 16:05:39 ******/
CREATE DATABASE [Homework_Modelling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Homework_Modelling', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Homework_Modelling.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Homework_Modelling_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Homework_Modelling_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Homework_Modelling] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Homework_Modelling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Homework_Modelling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Homework_Modelling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Homework_Modelling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Homework_Modelling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Homework_Modelling] SET ARITHABORT OFF 
GO
ALTER DATABASE [Homework_Modelling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Homework_Modelling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Homework_Modelling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Homework_Modelling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Homework_Modelling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Homework_Modelling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Homework_Modelling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Homework_Modelling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Homework_Modelling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Homework_Modelling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Homework_Modelling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Homework_Modelling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Homework_Modelling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Homework_Modelling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Homework_Modelling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Homework_Modelling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Homework_Modelling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Homework_Modelling] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Homework_Modelling] SET  MULTI_USER 
GO
ALTER DATABASE [Homework_Modelling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Homework_Modelling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Homework_Modelling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Homework_Modelling] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Homework_Modelling]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 9.10.2015 г. 16:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] NOT NULL,
	[address_text] [nvarchar](350) NOT NULL,
	[town_id] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 9.10.2015 г. 16:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[ContinentId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 9.10.2015 г. 16:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[coninent_id] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 9.10.2015 г. 16:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 9.10.2015 г. 16:05:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[townId] [int] NOT NULL CONSTRAINT [DF_Town_id]  DEFAULT ((0)),
	[name] [nvarchar](50) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[townId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Town] FOREIGN KEY([town_id])
REFERENCES [dbo].[Town] ([townId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent1] FOREIGN KEY([coninent_id])
REFERENCES [dbo].[Continent] ([ContinentId])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent1]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses1] FOREIGN KEY([address_id])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses1]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country1] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country1]
GO
USE [master]
GO
ALTER DATABASE [Homework_Modelling] SET  READ_WRITE 
GO
