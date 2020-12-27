USE [master]
GO
/****** Object:  Database [dbSQL]    Script Date: 16/12/2020 18:55:40 ******/
CREATE DATABASE [dbSQL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbSQLDM', FILENAME = N'D:\DM\dbSQLDM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbSQLDM_log', FILENAME = N'D:\DM\dbSQLDM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbSQL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbSQL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbSQL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbSQL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbSQL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbSQL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbSQL] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbSQL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbSQL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbSQL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbSQL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbSQL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbSQL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbSQL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbSQL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbSQL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbSQL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbSQL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbSQL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbSQL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbSQL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbSQL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbSQL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbSQL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbSQL] SET RECOVERY FULL 
GO
ALTER DATABASE [dbSQL] SET  MULTI_USER 
GO
ALTER DATABASE [dbSQL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbSQL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbSQL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbSQL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbSQL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbSQL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbSQL', N'ON'
GO
ALTER DATABASE [dbSQL] SET QUERY_STORE = OFF
GO
USE [dbSQL]
GO
/****** Object:  Table [dbo].[dimcliente]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimcliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_compañia] [nvarchar](50) NOT NULL,
	[tel_cli] [nvarchar](25) NOT NULL,
	[ciudad] [nvarchar](50) NOT NULL,
	[region] [nvarchar](50) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimcompañia]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimcompañia](
	[idcompañia] [int] IDENTITY(1,1) NOT NULL,
	[nombre_compañia] [nvarchar](50) NOT NULL,
	[tel_compañia] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcompañia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimempleado]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimempleado](
	[idempleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empleado] [nvarchar](50) NOT NULL,
	[apellido_empleado] [nvarchar](50) NOT NULL,
	[nombre_empresa] [nvarchar](50) NOT NULL,
	[cargo_empleado] [nvarchar](50) NOT NULL,
	[ciudad] [nvarchar](50) NOT NULL,
	[region] [nvarchar](50) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
	[tel_empleado] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimpedido]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimpedido](
	[idpedido] [int] IDENTITY(1,1) NOT NULL,
	[destinatario] [nvarchar](50) NOT NULL,
	[ciudad_destinatario] [nvarchar](50) NOT NULL,
	[region_destinatario] [nvarchar](50) NOT NULL,
	[pais_destinatario] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimproducto]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimproducto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [nvarchar](50) NOT NULL,
	[precio_uni] [int] NOT NULL,
	[uni_exis] [int] NOT NULL,
	[uni_pedidos] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[supendidos] [int] NOT NULL,
	[categ_producto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimproveedor]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimproveedor](
	[idproveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_compañia] [nvarchar](50) NOT NULL,
	[cargo_proveedor] [nvarchar](50) NOT NULL,
	[ciudad] [nvarchar](50) NOT NULL,
	[provincia] [nvarchar](50) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
	[tel_proveedor] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimtiempo]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimtiempo](
	[idtiempo] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[año] [smallint] NOT NULL,
	[nmes] [varchar](10) NOT NULL,
	[dsemana] [varchar](10) NOT NULL,
	[ndia] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idtiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 16/12/2020 18:55:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idcliente] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[idempleado] [int] NOT NULL,
	[idpedido] [int] NOT NULL,
	[idproveedor] [int] NOT NULL,
	[idcompañia] [int] NOT NULL,
	[idtiempo] [int] NOT NULL,
	[cantidad] [decimal](11, 2) NOT NULL,
	[descuento] [decimal](18, 2) NULL,
 CONSTRAINT [pkventa] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC,
	[idproducto] ASC,
	[idempleado] ASC,
	[idpedido] ASC,
	[idproveedor] ASC,
	[idcompañia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkclientes] FOREIGN KEY([idcliente])
REFERENCES [dbo].[dimcliente] ([idcliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkclientes]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkcompañia] FOREIGN KEY([idcompañia])
REFERENCES [dbo].[dimcompañia] ([idcompañia])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkcompañia]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkempleado] FOREIGN KEY([idempleado])
REFERENCES [dbo].[dimempleado] ([idempleado])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkempleado]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkpedido] FOREIGN KEY([idpedido])
REFERENCES [dbo].[dimpedido] ([idpedido])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkpedido]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkproducto] FOREIGN KEY([idproducto])
REFERENCES [dbo].[dimproducto] ([idproducto])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkproducto]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkproveedor] FOREIGN KEY([idproveedor])
REFERENCES [dbo].[dimproveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkproveedor]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fktiempo] FOREIGN KEY([idtiempo])
REFERENCES [dbo].[dimtiempo] ([idtiempo])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fktiempo]
GO
USE [master]
GO
ALTER DATABASE [dbSQL] SET  READ_WRITE 
GO
