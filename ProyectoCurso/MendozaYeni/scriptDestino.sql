USE [master]
GO
/****** Object:  Database [destino_bdlibreria]    Script Date: 27/12/2020 12:35:48 ******/
CREATE DATABASE [destino_bdlibreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'destino_bdlibreria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\destino_bdlibreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'destino_bdlibreria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\destino_bdlibreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [destino_bdlibreria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [destino_bdlibreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [destino_bdlibreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [destino_bdlibreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [destino_bdlibreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET  ENABLE_BROKER 
GO
ALTER DATABASE [destino_bdlibreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [destino_bdlibreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET RECOVERY FULL 
GO
ALTER DATABASE [destino_bdlibreria] SET  MULTI_USER 
GO
ALTER DATABASE [destino_bdlibreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [destino_bdlibreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [destino_bdlibreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [destino_bdlibreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [destino_bdlibreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [destino_bdlibreria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'destino_bdlibreria', N'ON'
GO
ALTER DATABASE [destino_bdlibreria] SET QUERY_STORE = OFF
GO
USE [destino_bdlibreria]
GO
/****** Object:  Table [dbo].[Destino dimcliente]    Script Date: 27/12/2020 12:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino dimcliente](
	[idcliente] [varchar](10) NULL,
	[ruc_cliente] [varchar](15) NULL,
	[importe_venta] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino_dimcliente]    Script Date: 27/12/2020 12:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino_dimcliente](
	[idcliente] [varchar](10) NULL,
	[ruc_cliente] [varchar](15) NULL,
	[importe_venta] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[destino_Ejecucion]    Script Date: 27/12/2020 12:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[destino_Ejecucion](
	[idcliente] [varchar](10) NULL,
	[tipo_ejecucion] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino_producto]    Script Date: 27/12/2020 12:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino_producto](
	[idproducto] [varchar](10) NULL,
	[tipo_producto] [varchar](50) NULL,
	[subproducto] [varchar](10) NULL,
	[importe_venta] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino_Tiempo]    Script Date: 27/12/2020 12:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino_Tiempo](
	[dia] [date] NULL,
	[idtiempo] [varchar](10) NULL,
	[mes] [int] NULL,
	[año] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C011', N'1065987413     ', 80.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C019', N'1056448921     ', 20.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C017', N'10985623247    ', 74.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C013', N'1025365974     ', 78.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C002', N'10462108999    ', 50.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C005', N'10489653227    ', 100.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C004', N'11234563221    ', 40.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C003', N'10653214812    ', 25.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C006', N'10326598278    ', 50.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C018', N'1056448921     ', 9.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C007', N'1036598742     ', 25.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C014', N'10462108456    ', 15.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C012', N'2015433998     ', 33.6000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C008', N'1065987453     ', 30.0100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C001', N'10456329879    ', 122.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C010', N'1058964853     ', 20.2000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C020', N'1056448921     ', 75.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C015', N'10256987431    ', 36.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C016', N'10398654231    ', 86.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C009', N'1654322185     ', 14.2000)
GO
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C011', N'1065987413     ', 80.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C019', N'1056448921     ', 20.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C017', N'10985623247    ', 74.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C013', N'1025365974     ', 78.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C002', N'10462108999    ', 50.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C005', N'10489653227    ', 100.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C004', N'11234563221    ', 40.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C003', N'10653214812    ', 25.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C006', N'10326598278    ', 50.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C018', N'1056448921     ', 9.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C007', N'1036598742     ', 25.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C014', N'10462108456    ', 15.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C012', N'2015433998     ', 33.6000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C008', N'1065987453     ', 30.0100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C001', N'10456329879    ', 122.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C010', N'1058964853     ', 20.2000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C020', N'1056448921     ', 75.0000)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C015', N'10256987431    ', 36.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C016', N'10398654231    ', 86.3100)
INSERT [dbo].[Destino dimcliente] ([idcliente], [ruc_cliente], [importe_venta]) VALUES (N'C009', N'1654322185     ', 14.2000)
GO
INSERT [dbo].[destino_Ejecucion] ([idcliente], [tipo_ejecucion]) VALUES (NULL, N'pedido')
INSERT [dbo].[destino_Ejecucion] ([idcliente], [tipo_ejecucion]) VALUES (NULL, N'atendido')
GO
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P001', N'evento', N'expomina', 122.3100)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P002', N'Revista', N'Perucontru', 50.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P003', N'evento', N'expomina', 25.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P004', N'evento', N'expomina', 40.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P005', N'evento', N'expomina', 100.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P006', N'Revista', N'Perucontru', 50.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P007', N'Revista', N'Perucontru', 25.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P008', N'Revista', N'Perucontru', 30.0100)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P009', N'Revista', N'Perucontru', 14.2000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P010', N'evento', N'expomina', 20.2000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P011', N'evento', N'expomina', 80.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P012', N'Revista', N'Perucontru', 33.6000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P013', N'Revista', N'Perucontru', 78.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P014', N'Revista', N'Perucontru', 15.3100)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P015', N'Revista', N'Perucontru', 36.3100)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P016', N'Revista', N'Perucontru', 86.3100)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P017', N'Revista', N'Perucontru', 74.3100)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P018', N'evento', N'expomina', 9.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P019', N'evento', N'expomina', 20.0000)
INSERT [dbo].[Destino_producto] ([idproducto], [tipo_producto], [subproducto], [importe_venta]) VALUES (N'P020', N'evento', N'expomina', 75.0000)
GO
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 7, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 8, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 9, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 10, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 1, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 4, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 6, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 11, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 12, 22)
INSERT [dbo].[Destino_Tiempo] ([dia], [idtiempo], [mes], [año]) VALUES (CAST(N'1900-01-21' AS Date), NULL, 2, 22)
GO
USE [master]
GO
ALTER DATABASE [destino_bdlibreria] SET  READ_WRITE 
GO
