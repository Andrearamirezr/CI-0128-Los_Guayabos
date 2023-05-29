USE [master]
GO

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE Ficus
  CONTAINMENT = NONE
  ON PRIMARY (NAME = N''Ficus'', FILENAME = N''' + @device_directory + N'Ficus.mdf'' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB)
  LOG ON (NAME = N''Ficus_log'',  FILENAME = N''' + @device_directory + N'Ficus.ldf'', SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
  WITH CATALOG_COLLATION = DATABASE_DEFAULT')
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ficus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Ficus] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Ficus] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Ficus] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Ficus] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Ficus] SET ARITHABORT OFF 
GO

ALTER DATABASE [Ficus] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Ficus] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Ficus] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Ficus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Ficus] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Ficus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Ficus] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Ficus] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Ficus] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Ficus] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Ficus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Ficus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Ficus] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Ficus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Ficus] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Ficus] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Ficus] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Ficus] SET RECOVERY FULL 
GO

ALTER DATABASE [Ficus] SET  MULTI_USER 
GO

ALTER DATABASE [Ficus] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Ficus] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Ficus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Ficus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Ficus] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Ficus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Ficus] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Ficus] SET  READ_WRITE 
GO

