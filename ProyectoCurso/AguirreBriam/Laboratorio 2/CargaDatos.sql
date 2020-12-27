USE [master]
GO
/****** Object:  Database [dbSQL]    Script Date: 21/12/2020 19:23:35 ******/
CREATE DATABASE [dbSQL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbSQLDM', FILENAME = N'D:\DM\dbSQLDM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbSQLDM_log', FILENAME = N'D:\DM\dbSQLDM_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[dimcliente]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimcliente](
	[idCliente] [varchar](5) NOT NULL,
	[nombre_cliente] [varchar](100) NULL,
	[nombre_compañia] [varchar](100) NOT NULL,
	[ciudad] [varchar](100) NULL,
	[region] [varchar](100) NULL,
	[pais] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimcompañia]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimcompañia](
	[idCompañiaEnvios] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empresa] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompañiaEnvios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimempleado]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimempleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[apellido_empleado] [varchar](20) NULL,
	[nombre_empleado] [varchar](20) NULL,
	[cargo] [varchar](40) NULL,
	[ciudad] [varchar](15) NULL,
	[region] [varchar](15) NULL,
	[pais] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimproducto]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimproducto](
	[idproducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](40) NULL,
	[precio_unit] [decimal](18, 0) NULL,
	[unid_exist] [smallint] NULL,
	[unid_suspendidas] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimproveedor]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimproveedor](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_compañia] [varchar](40) NOT NULL,
	[cargo] [varchar](30) NULL,
	[ciudad] [varchar](15) NULL,
	[region] [varchar](15) NULL,
	[pais] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimtiempo]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimtiempo](
	[idtiempo] [int] NOT NULL,
	[fecha_entrega] [date] NULL,
	[fecha_envio] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idtiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 21/12/2020 19:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idCliente] [varchar](5) NOT NULL,
	[idproducto] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[idProveedor] [int] NOT NULL,
	[idCompañiaEnvios] [int] NOT NULL,
	[idtiempo] [int] NOT NULL,
	[cant_vend] [int] NOT NULL,
	[descuento] [decimal](18, 2) NULL,
 CONSTRAINT [pkventa] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC,
	[idproducto] ASC,
	[IdEmpleado] ASC,
	[idProveedor] ASC,
	[idCompañiaEnvios] ASC,
	[idtiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'ALFKI', N'Maria Anders', N'Alfreds Futterkiste', N'Berlín', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'ANATR', N'Ana Trujillo', N'Ana Trujillo Emparedados y helados', N'México D.F.', NULL, N'México')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'ANTON', N'Antonio Moreno', N'Antonio Moreno Taquería', N'México D.F.', NULL, N'México')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'AROUT', N'Thomas Hardy', N'Around the Horn', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BERGS', N'Christina Berglund', N'Berglunds snabbköp', N'Luleå', NULL, N'Suecia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BLAUS', N'Hanna Moos', N'Blauer See Delikatessen', N'Mannheim', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BLONP', N'Frédérique Citeaux', N'Blondel père et fils', N'Estrasburgo', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BOLID', N'Martín Sommer', N'Bólido Comidas preparadas', N'Madrid', NULL, N'España')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BONAP', N'Laurence Lebihan', N'Bon app''', N'Marsella', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BOTTM', N'Elizabeth Lincoln', N'Bottom-Dollar Markets', N'Tsawassen', N'BC', N'Canadá')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'BSBEV', N'Victoria Ashworth', N'B''s Beverages', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'CACTU', N'Patricio Simpson', N'Cactus Comidas para llevar', N'Buenos Aires', NULL, N'Argentina')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'CENTC', N'Francisco Chang', N'Centro comercial Moctezuma', N'México D.F.', NULL, N'México')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'CHOPS', N'Yang Wang', N'Chop-suey Chinese', N'Berna', NULL, N'Suiza')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'COMMI', N'Pedro Afonso', N'Comércio Mineiro', N'São Paulo', N'SP', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'CONSH', N'Elizabeth Brown', N'Consolidated Holdings', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'DRACD', N'Sven Ottlieb', N'Drachenblut Delikatessen', N'Aachen', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'DUMON', N'Janine Labrune', N'Du monde entier', N'Nantes', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'EASTC', N'Ann Devon', N'Eastern Connection', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'ERNSH', N'Roland Mendel', N'Ernst Handel', N'Graz', NULL, N'Austria')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FAMIA', N'Aria Cruz', N'Familia Arquibaldo', N'Sao Paulo', N'SP', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FISSA', N'Diego Roel', N'FISSA Fabrica Inter. Salchichas S.A.', N'Madrid', NULL, N'España')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FOLIG', N'Martine Rancé', N'Folies gourmandes', N'Lille', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FOLKO', N'Maria Larsson', N'Folk och fä HB', N'Bräcke', NULL, N'Suecia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FRANK', N'Peter Franken', N'Frankenversand', N'München', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FRANR', N'Carine Schmitt', N'France restauration', N'Nantes', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FRANS', N'Paolo Accorti', N'Franchi S.p.A.', N'Torino', NULL, N'Italia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'FURIB', N'Lino Rodriguez ', N'Furia Bacalhau e Frutos do Mar', N'Lisboa', NULL, N'Portugal')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'GALED', N'Eduardo Saavedra', N'Galería del gastrónomo', N'Barcelona', NULL, N'España')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'GODOS', N'José Pedro Freyre', N'Godos Cocina Típica', N'Sevilla', NULL, N'España')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'GOURL', N'André Fonseca', N'Gourmet Lanchonetes', N'Campinas', N'SP', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'GREAL', N'Howard Snyder', N'Great Lakes Food Market', N'Eugenia', N'OR', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'GROSR', N'Manuel Pereira', N'GROSELLA-Restaurante', N'Caracas', N'DF', N'Venezuela')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'HANAR', N'Mario Pontes', N'Hanari Carnes', N'Rio de Janeiro', N'RJ', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'HILAA', N'Carlos Hernández', N'HILARIÓN-Abastos', N'San Cristóbal', N'Táchira', N'Venezuela')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'HUNGC', N'Yoshi Latimer', N'Hungry Coyote Import Store', N'Elgin', N'OR', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'HUNGO', N'Patricia McKenna', N'Hungry Owl All-Night Grocers', N'Cork', N'Co. Cork', N'Irlanda')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'ISLAT', N'Helen Bennett', N'Island Trading', N'Cowes', N'Isla de Wight', N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'KOENE', N'Philip Cramer', N'Königlich Essen', N'Brandenburgo', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LACOR', N'Daniel Tonini', N'La corne d''abondance', N'Versalles', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LAMAI', N'Annette Roulet', N'La maison d''Asie', N'Toulouse', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LAUGB', N'Yoshi Tannamuri', N'Laughing Bacchus Wine Cellars', N'Vancouver', N'BC', N'Canadá')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LAZYK', N'John Steel', N'Lazy K Kountry Store', N'Walla Walla', N'WA', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LEHMS', N'Renate Messner', N'Lehmanns Marktstand', N'Francfurt', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LETSS', N'Jaime Yorres', N'Let''s Stop N Shop', N'San Francisco', N'CA', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LILAS', N'Carlos González', N'LILA-Supermercado', N'Barquisimeto', N'Lara', N'Venezuela')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LINOD', N'Felipe Izquierdo', N'LINO-Delicateses', N'I. de Margarita', N'Nueva Esparta', N'Venezuela')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'LONEP', N'Fran Wilson', N'Lonesome Pine Restaurant', N'Portland', N'OR', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'MAGAA', N'Giovanni Rovelli', N'Magazzini Alimentari Riuniti', N'Bérgamo', NULL, N'Italia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'MAISD', N'Catherine Dewey', N'Maison Dewey', N'Bruselas', NULL, N'Bélgica')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'MEREP', N'Jean Fresnière', N'Mère Paillarde', N'Montreal', N'Québec', N'Canadá')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'MORGK', N'Alexander Feuer', N'Morgenstern Gesundkost', N'Leipzig', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'NORTS', N'Simon Crowther', N'North/South', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'OCEAN', N'Yvonne Moncada', N'Océano Atlántico Ltda.', N'Buenos Aires', NULL, N'Argentina')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'OLDWO', N'Rene Phillips', N'Old World Delicatessen', N'Anchorage', N'AK', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'OTTIK', N'Henriette Pfalzheim', N'Ottilies Käseladen', N'Köln', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'PARIS', N'Marie Bertrand', N'Paris spécialités', N'París', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'PERIC', N'Guillermo Fernández', N'Pericles Comidas clásicas', N'México D.F.', NULL, N'México')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'PICCO', N'Georg Pipps', N'Piccolo und mehr', N'Salzburgo', NULL, N'Austria')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'PRINI', N'Isabel de Castro', N'Princesa Isabel Vinhos', N'Lisboa', NULL, N'Portugal')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'QUEDE', N'Bernardo Batista', N'Que Delícia', N'Rio de Janeiro', N'RJ', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'QUEEN', N'Lúcia Carvalho', N'Queen Cozinha', N'Sao Paulo', N'SP', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'QUICK', N'Horst Kloss', N'QUICK-Stop', N'Cunewalde', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'RANCH', N'Sergio Gutiérrez', N'Rancho grande', N'Buenos Aires', NULL, N'Argentina')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'RATTC', N'Paula Wilson', N'Rattlesnake Canyon Grocery', N'Albuquerque', N'NM', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'REGGC', N'Maurizio Moroni', N'Reggiani Caseifici', N'Reggio Emilia', NULL, N'Italia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'RICAR', N'Janete Limeira', N'Ricardo Adocicados', N'Rio de Janeiro', N'RJ', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'RICSU', N'Michael Holz', N'Richter Supermarkt', N'Génova', NULL, N'Suiza')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'ROMEY', N'Alejandra Camino', N'Romero y tomillo', N'Madrid', NULL, N'España')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SANTG', N'Jonas Bergulfsen', N'Santé Gourmet', N'Stavern', NULL, N'Noruega')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SAVEA', N'Jose Pavarotti', N'Save-a-lot Markets', N'Boise', N'ID', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SEVES', N'Hari Kumar', N'Seven Seas Imports', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SIMOB', N'Jytte Petersen', N'Simons bistro', N'København', NULL, N'Dinamarca')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SPECD', N'Dominique Perrier', N'Spécialités du monde', N'París', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SPLIR', N'Art Braunschweiger', N'Split Rail Beer & Ale', N'Lander', N'WY', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'SUPRD', N'Pascale Cartrain', N'Suprêmes délices', N'Charleroi', NULL, N'Bélgica')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'THEBI', N'Liz Nixon', N'The Big Cheese', N'Portland', N'OR', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'THECR', N'Liu Wong', N'The Cracker Box', N'Butte', N'MT', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'TOMSP', N'Karin Josephs', N'Toms Spezialitäten', N'Münster', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'TORTU', N'Miguel Angel Paolino', N'Tortuga Restaurante', N'México D.F.', NULL, N'México')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'TRADH', N'Anabela Domingues', N'Tradição Hipermercados', N'Sao Paulo', N'SP', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'TRAIH', N'Helvetius Nagy', N'Trail''s Head Gourmet Provisioners', N'Kirkland', N'WA', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'VAFFE', N'Palle Ibsen', N'Vaffeljernet', N'Århus', NULL, N'Dinamarca')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'VICTE', N'Mary Saveley', N'Victuailles en stock', N'Lion', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'VINET', N'Paul Henriot', N'Vins et alcools Chevalier', N'Reims', NULL, N'Francia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'WANDK', N'Rita Müller', N'Die Wandernde Kuh', N'Stuttgart', NULL, N'Alemania')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'WARTH', N'Pirkko Koskitalo', N'Wartian Herkku', N'Oulu', NULL, N'Finlandia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'WELLI', N'Paula Parente', N'Wellington Importadora', N'Resende', N'SP', N'Brasil')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'WHITC', N'Karl Jablonski', N'White Clover Markets', N'Seattle', N'WA', N'Estados Unidos')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'WILMK', N'Matti Karttunen', N'Wilman Kala', N'Helsinki', NULL, N'Finlandia')
GO
INSERT [dbo].[dimcliente] ([idCliente], [nombre_cliente], [nombre_compañia], [ciudad], [region], [pais]) VALUES (N'WOLZA', N'Zbyszek Piestrzeniewicz', N'Wolski  Zajazd', N'Warszawa', NULL, N'Polonia')
GO
SET IDENTITY_INSERT [dbo].[dimcompañia] ON 
GO
INSERT [dbo].[dimcompañia] ([idCompañiaEnvios], [nombre_empresa]) VALUES (1, N'Speedy Express')
GO
INSERT [dbo].[dimcompañia] ([idCompañiaEnvios], [nombre_empresa]) VALUES (2, N'United Package')
GO
INSERT [dbo].[dimcompañia] ([idCompañiaEnvios], [nombre_empresa]) VALUES (3, N'Federal Shipping')
GO
SET IDENTITY_INSERT [dbo].[dimcompañia] OFF
GO
SET IDENTITY_INSERT [dbo].[dimempleado] ON 
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (1, N'Davolio', N'Nancy', N'Representante de ventas', N'Seattle', N'WA', N'EE.UU.')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (2, N'Fuller', N'Andrew', N'Vicepresidente comercial', N'Tacoma', N'WA', N'EE.UU.')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (3, N'Leverling', N'Janet', N'Representante de ventas', N'Kirkland', N'WA', N'EE.UU.')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (4, N'Peacock', N'Margaret', N'Representante de ventas', N'Redmond', N'WA', N'EE.UU.')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (5, N'Buchanan', N'Steven', N'Gerente de ventas', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (6, N'Suyama', N'Michael', N'Representante de ventas', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (7, N'King', N'Robert', N'Representante de ventas', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (8, N'Callahan', N'Laura', N'Coordinador ventas interno', N'Seattle', N'WA', N'EE.UU.')
GO
INSERT [dbo].[dimempleado] ([IdEmpleado], [apellido_empleado], [nombre_empleado], [cargo], [ciudad], [region], [pais]) VALUES (9, N'Dodsworth', N'Anne', N'Representante de ventas', N'Londres', NULL, N'Reino Unido')
GO
SET IDENTITY_INSERT [dbo].[dimempleado] OFF
GO
SET IDENTITY_INSERT [dbo].[dimproducto] ON 
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (1, N'Té Dharamsala', CAST(18 AS Decimal(18, 0)), 39, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (2, N'Cerveza tibetana Barley', CAST(19 AS Decimal(18, 0)), 17, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (3, N'Sirope de regaliz', CAST(10 AS Decimal(18, 0)), 13, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (4, N'Especias Cajun del chef Anton', CAST(22 AS Decimal(18, 0)), 53, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (5, N'Mezcla Gumbo del chef Anton', CAST(21 AS Decimal(18, 0)), 0, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (6, N'Mermelada de grosellas de la abuela', CAST(25 AS Decimal(18, 0)), 120, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (7, N'Peras secas orgánicas del tío Bob', CAST(30 AS Decimal(18, 0)), 15, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (8, N'Salsa de arándanos Northwoods', CAST(40 AS Decimal(18, 0)), 6, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (9, N'Buey Mishi Kobe', CAST(97 AS Decimal(18, 0)), 29, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (10, N'Pez espada', CAST(31 AS Decimal(18, 0)), 31, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (11, N'Queso Cabrales', CAST(21 AS Decimal(18, 0)), 22, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (12, N'Queso Manchego La Pastora', CAST(38 AS Decimal(18, 0)), 86, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (13, N'Algas Konbu', CAST(6 AS Decimal(18, 0)), 24, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (14, N'Cuajada de judías', CAST(23 AS Decimal(18, 0)), 35, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (15, N'Salsa de soja baja en sodio', CAST(16 AS Decimal(18, 0)), 39, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (16, N'Postre de merengue Pavlova', CAST(17 AS Decimal(18, 0)), 29, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (17, N'Cordero Alice Springs', CAST(39 AS Decimal(18, 0)), 0, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (18, N'Langostinos tigre Carnarvon', CAST(63 AS Decimal(18, 0)), 42, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (19, N'Pastas de té de chocolate', CAST(9 AS Decimal(18, 0)), 25, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (20, N'Mermelada de Sir Rodney''s', CAST(81 AS Decimal(18, 0)), 40, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (21, N'Bollos de Sir Rodney''s', CAST(10 AS Decimal(18, 0)), 3, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (22, N'Pan de centeno crujiente estilo Gustaf''s', CAST(21 AS Decimal(18, 0)), 104, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (23, N'Pan fino', CAST(9 AS Decimal(18, 0)), 61, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (24, N'Refresco Guaraná Fantástica', CAST(5 AS Decimal(18, 0)), 20, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (25, N'Crema de chocolate y nueces NuNuCa', CAST(14 AS Decimal(18, 0)), 76, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (26, N'Ositos de goma Gumbär', CAST(31 AS Decimal(18, 0)), 15, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (27, N'Chocolate Schoggi', CAST(44 AS Decimal(18, 0)), 49, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (28, N'Col fermentada Rössle', CAST(46 AS Decimal(18, 0)), 26, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (29, N'Salchicha Thüringer', CAST(124 AS Decimal(18, 0)), 0, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (30, N'Arenque blanco del noroeste', CAST(26 AS Decimal(18, 0)), 10, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (31, N'Queso gorgonzola Telino', CAST(13 AS Decimal(18, 0)), 0, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (32, N'Queso Mascarpone Fabioli', CAST(32 AS Decimal(18, 0)), 9, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (33, N'Queso de cabra', CAST(3 AS Decimal(18, 0)), 112, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (34, N'Cerveza Sasquatch', CAST(14 AS Decimal(18, 0)), 111, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (35, N'Cerveza negra Steeleye', CAST(18 AS Decimal(18, 0)), 20, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (36, N'Escabeche de arenque', CAST(19 AS Decimal(18, 0)), 112, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (37, N'Salmón ahumado Gravad', CAST(26 AS Decimal(18, 0)), 11, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (38, N'Vino Côte de Blaye', CAST(264 AS Decimal(18, 0)), 17, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (39, N'Licor verde Chartreuse', CAST(18 AS Decimal(18, 0)), 69, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (40, N'Carne de cangrejo de Boston', CAST(18 AS Decimal(18, 0)), 123, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (41, N'Crema de almejas estilo Nueva Inglaterra', CAST(10 AS Decimal(18, 0)), 85, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (42, N'Tallarines de Singapur', CAST(14 AS Decimal(18, 0)), 26, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (43, N'Café de Malasia', CAST(46 AS Decimal(18, 0)), 17, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (44, N'Azúcar negra Malacca', CAST(19 AS Decimal(18, 0)), 27, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (45, N'Arenque ahumado', CAST(10 AS Decimal(18, 0)), 5, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (46, N'Arenque salado', CAST(12 AS Decimal(18, 0)), 95, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (47, N'Galletas Zaanse', CAST(10 AS Decimal(18, 0)), 36, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (48, N'Chocolate holandés', CAST(13 AS Decimal(18, 0)), 15, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (49, N'Regaliz', CAST(20 AS Decimal(18, 0)), 10, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (50, N'Chocolate blanco', CAST(16 AS Decimal(18, 0)), 65, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (51, N'Manzanas secas Manjimup', CAST(53 AS Decimal(18, 0)), 20, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (52, N'Cereales para Filo', CAST(7 AS Decimal(18, 0)), 38, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (53, N'Empanada de carne', CAST(33 AS Decimal(18, 0)), 0, 1)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (54, N'Empanada de cerdo', CAST(7 AS Decimal(18, 0)), 21, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (55, N'Paté chino', CAST(24 AS Decimal(18, 0)), 115, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (56, N'Gnocchi de la abuela Alicia', CAST(38 AS Decimal(18, 0)), 21, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (57, N'Raviolis Angelo', CAST(20 AS Decimal(18, 0)), 36, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (58, N'Caracoles de Borgoña', CAST(13 AS Decimal(18, 0)), 62, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (59, N'Raclet de queso Courdavault', CAST(55 AS Decimal(18, 0)), 79, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (60, N'Camembert Pierrot', CAST(34 AS Decimal(18, 0)), 19, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (61, N'Sirope de arce', CAST(29 AS Decimal(18, 0)), 113, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (62, N'Tarta de azúcar', CAST(49 AS Decimal(18, 0)), 17, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (63, N'Sandwich de vegetales', CAST(44 AS Decimal(18, 0)), 24, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (64, N'Bollos de pan de Wimmer', CAST(33 AS Decimal(18, 0)), 22, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (65, N'Salsa de pimiento picante de Luisiana', CAST(21 AS Decimal(18, 0)), 76, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (66, N'Especias picantes de Luisiana', CAST(17 AS Decimal(18, 0)), 4, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (67, N'Cerveza Laughing Lumberjack', CAST(14 AS Decimal(18, 0)), 52, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (68, N'Barras de pan de Escocia', CAST(13 AS Decimal(18, 0)), 6, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (69, N'Queso Gudbrandsdals', CAST(36 AS Decimal(18, 0)), 26, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (70, N'Cerveza Outback', CAST(15 AS Decimal(18, 0)), 15, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (71, N'Crema de queso Fløtemys', CAST(22 AS Decimal(18, 0)), 26, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (72, N'Queso Mozzarella Giovanni', CAST(35 AS Decimal(18, 0)), 14, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (73, N'Caviar rojo', CAST(15 AS Decimal(18, 0)), 101, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (74, N'Queso de soja Longlife', CAST(10 AS Decimal(18, 0)), 4, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (75, N'Cerveza Klosterbier Rhönbräu', CAST(8 AS Decimal(18, 0)), 125, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (76, N'Licor Cloudberry', CAST(18 AS Decimal(18, 0)), 57, 0)
GO
INSERT [dbo].[dimproducto] ([idproducto], [nombre_producto], [precio_unit], [unid_exist], [unid_suspendidas]) VALUES (77, N'Salsa verde original Frankfurter', CAST(13 AS Decimal(18, 0)), 32, 0)
GO
SET IDENTITY_INSERT [dbo].[dimproducto] OFF
GO
SET IDENTITY_INSERT [dbo].[dimproveedor] ON 
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (1, N'Exotic Liquids', N'Gerente de compras', N'Londres', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (2, N'New Orleans Cajun Delights', N'Administrador de pedidos', N'New Orleans', N'LA', N'Estados Unidos')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (3, N'Grandma Kelly''s Homestead', N'Representante de ventas', N'Ann Arbor', N'MI', N'Estados Unidos')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (4, N'Tokyo Traders', N'Gerente de marketing', N'Tokyo', NULL, N'Japón')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (5, N'Cooperativa de Quesos ''Las Cabras''', N'Administrador de exportaciones', N'Oviedo', N'Asturias', N'España')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (6, N'Mayumi''s', N'Representante de marketing', N'Osaka', NULL, N'Japón')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (7, N'Pavlova, Ltd.', N'Gerente de marketing', N'Melbourne', N'Victoria', N'Australia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (8, N'Specialty Biscuits, Ltd.', N'Representante de ventas', N'Manchester', NULL, N'Reino Unido')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (9, N'PB Knäckebröd AB', N'Agente de ventas', N'Göteborg', NULL, N'Suecia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (10, N'Refrescos Americanas LTDA', N'Gerente de marketing', N'São Paulo', NULL, N'Brasil')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (11, N'Heli Süßwaren GmbH & Co. KG', N'Gerente de ventas', N'Berlín', NULL, N'Alemania')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (12, N'Plutzer Lebensmittelgroßmärkte AG', N'Ger. marketing internacional', N'Frankfurt', NULL, N'Alemania')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (13, N'Nord-Ost-Fisch Handelsgesellschaft mbH', N'Coordinador de mercados', N'Cuxhaven', NULL, N'Alemania')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (14, N'Formaggi Fortini s.r.l.', N'Representante de ventas', N'Ravenna', NULL, N'Italia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (15, N'Norske Meierier', N'Gerente de marketing', N'Sandvika', NULL, N'Noruega')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (16, N'Bigfoot Breweries', N'Repr. de cuentas regional', N'Bend', N'OR', N'Estados Unidos')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (17, N'Svensk Sjöföda AB', N'Representante de ventas', N'Stockholm', NULL, N'Suecia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (18, N'Aux joyeux ecclésiastiques', N'Gerente de ventas', N'París', NULL, N'Francia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (19, N'New England Seafood Cannery', N'Agente de cuentas al por mayor', N'Boston', N'MA', N'Estados Unidos')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (20, N'Leka Trading', N'Propietario', N'Singapore', NULL, N'Singapur')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (21, N'Lyngbysild', N'Gerente de ventas', N'Lyngby', NULL, N'Dinamarca')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (22, N'Zaanse Snoepfabriek', N'Gerente de contabilidad', N'Zaandam', NULL, N'Holanda')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (23, N'Karkki Oy', N'Gerente de producción', N'Lappeenranta', NULL, N'Finlandia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (24, N'G''day, Mate', N'Representante de ventas', N'Sydney', N'NSW', N'Australia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (25, N'Ma Maison', N'Gerente de marketing', N'Montréal', N'Québec', N'Canadá')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (26, N'Pasta Buttini s.r.l.', N'Administrador de pedidos', N'Salerno', NULL, N'Italia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (27, N'Escargots Nouveaux', N'Gerente de ventas', N'Montceau', NULL, N'Francia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (28, N'Gai pâturage', N'Representante de ventas', N'Annecy', NULL, N'Francia')
GO
INSERT [dbo].[dimproveedor] ([idProveedor], [nombre_compañia], [cargo], [ciudad], [region], [pais]) VALUES (29, N'Forêts d''érables', N'Gerente de contabilidad', N'Ste-Hyacinthe', N'Québec', N'Canadá')
GO
SET IDENTITY_INSERT [dbo].[dimproveedor] OFF
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10248, CAST(N'1994-09-01' AS Date), CAST(N'1994-08-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10249, CAST(N'1994-09-16' AS Date), CAST(N'1994-08-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10250, CAST(N'1994-09-05' AS Date), CAST(N'1994-08-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10251, CAST(N'1994-09-05' AS Date), CAST(N'1994-08-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10252, CAST(N'1994-09-06' AS Date), CAST(N'1994-08-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10253, CAST(N'1994-08-24' AS Date), CAST(N'1994-08-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10254, CAST(N'1994-09-08' AS Date), CAST(N'1994-08-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10255, CAST(N'1994-09-09' AS Date), CAST(N'1994-08-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10256, CAST(N'1994-09-12' AS Date), CAST(N'1994-08-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10257, CAST(N'1994-09-13' AS Date), CAST(N'1994-08-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10258, CAST(N'1994-09-14' AS Date), CAST(N'1994-08-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10259, CAST(N'1994-09-15' AS Date), CAST(N'1994-08-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10260, CAST(N'1994-09-16' AS Date), CAST(N'1994-08-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10261, CAST(N'1994-09-16' AS Date), CAST(N'1994-08-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10262, CAST(N'1994-09-19' AS Date), CAST(N'1994-08-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10263, CAST(N'1994-09-20' AS Date), CAST(N'1994-08-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10264, CAST(N'1994-09-21' AS Date), CAST(N'1994-09-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10265, CAST(N'1994-09-22' AS Date), CAST(N'1994-09-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10266, CAST(N'1994-10-07' AS Date), CAST(N'1994-08-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10267, CAST(N'1994-09-26' AS Date), CAST(N'1994-09-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10268, CAST(N'1994-09-27' AS Date), CAST(N'1994-09-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10269, CAST(N'1994-09-14' AS Date), CAST(N'1994-09-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10270, CAST(N'1994-09-29' AS Date), CAST(N'1994-09-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10271, CAST(N'1994-09-29' AS Date), CAST(N'1994-09-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10272, CAST(N'1994-09-30' AS Date), CAST(N'1994-09-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10273, CAST(N'1994-10-03' AS Date), CAST(N'1994-09-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10274, CAST(N'1994-10-04' AS Date), CAST(N'1994-09-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10275, CAST(N'1994-10-05' AS Date), CAST(N'1994-09-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10276, CAST(N'1994-09-22' AS Date), CAST(N'1994-09-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10277, CAST(N'1994-10-07' AS Date), CAST(N'1994-09-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10278, CAST(N'1994-10-10' AS Date), CAST(N'1994-09-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10279, CAST(N'1994-10-11' AS Date), CAST(N'1994-09-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10280, CAST(N'1994-10-12' AS Date), CAST(N'1994-10-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10281, CAST(N'1994-09-28' AS Date), CAST(N'1994-09-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10282, CAST(N'1994-10-13' AS Date), CAST(N'1994-09-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10283, CAST(N'1994-10-14' AS Date), CAST(N'1994-09-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10284, CAST(N'1994-10-17' AS Date), CAST(N'1994-09-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10285, CAST(N'1994-10-18' AS Date), CAST(N'1994-09-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10286, CAST(N'1994-10-19' AS Date), CAST(N'1994-09-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10287, CAST(N'1994-10-20' AS Date), CAST(N'1994-09-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10288, CAST(N'1994-10-21' AS Date), CAST(N'1994-10-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10289, CAST(N'1994-10-24' AS Date), CAST(N'1994-09-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10290, CAST(N'1994-10-25' AS Date), CAST(N'1994-10-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10291, CAST(N'1994-10-25' AS Date), CAST(N'1994-10-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10292, CAST(N'1994-10-26' AS Date), CAST(N'1994-10-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10293, CAST(N'1994-10-27' AS Date), CAST(N'1994-10-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10294, CAST(N'1994-10-28' AS Date), CAST(N'1994-10-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10295, CAST(N'1994-10-31' AS Date), CAST(N'1994-10-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10296, CAST(N'1994-11-01' AS Date), CAST(N'1994-10-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10297, CAST(N'1994-11-16' AS Date), CAST(N'1994-10-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10298, CAST(N'1994-11-03' AS Date), CAST(N'1994-10-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10299, CAST(N'1994-11-04' AS Date), CAST(N'1994-10-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10300, CAST(N'1994-11-07' AS Date), CAST(N'1994-10-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10301, CAST(N'1994-11-07' AS Date), CAST(N'1994-10-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10302, CAST(N'1994-11-08' AS Date), CAST(N'1994-11-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10303, CAST(N'1994-11-09' AS Date), CAST(N'1994-10-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10304, CAST(N'1994-11-10' AS Date), CAST(N'1994-10-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10305, CAST(N'1994-11-11' AS Date), CAST(N'1994-11-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10306, CAST(N'1994-11-14' AS Date), CAST(N'1994-10-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10307, CAST(N'1994-11-15' AS Date), CAST(N'1994-10-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10308, CAST(N'1994-11-16' AS Date), CAST(N'1994-10-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10309, CAST(N'1994-11-17' AS Date), CAST(N'1994-11-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10310, CAST(N'1994-11-18' AS Date), CAST(N'1994-10-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10311, CAST(N'1994-11-04' AS Date), CAST(N'1994-10-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10312, CAST(N'1994-11-21' AS Date), CAST(N'1994-11-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10313, CAST(N'1994-11-22' AS Date), CAST(N'1994-11-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10314, CAST(N'1994-11-23' AS Date), CAST(N'1994-11-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10315, CAST(N'1994-11-24' AS Date), CAST(N'1994-11-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10316, CAST(N'1994-11-25' AS Date), CAST(N'1994-11-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10317, CAST(N'1994-11-28' AS Date), CAST(N'1994-11-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10318, CAST(N'1994-11-29' AS Date), CAST(N'1994-11-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10319, CAST(N'1994-11-30' AS Date), CAST(N'1994-11-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10320, CAST(N'1994-11-17' AS Date), CAST(N'1994-11-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10321, CAST(N'1994-12-01' AS Date), CAST(N'1994-11-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10322, CAST(N'1994-12-02' AS Date), CAST(N'1994-11-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10323, CAST(N'1994-12-05' AS Date), CAST(N'1994-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10324, CAST(N'1994-12-06' AS Date), CAST(N'1994-11-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10325, CAST(N'1994-11-23' AS Date), CAST(N'1994-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10326, CAST(N'1994-12-08' AS Date), CAST(N'1994-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10327, CAST(N'1994-12-09' AS Date), CAST(N'1994-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10328, CAST(N'1994-12-12' AS Date), CAST(N'1994-11-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10329, CAST(N'1994-12-27' AS Date), CAST(N'1994-11-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10330, CAST(N'1994-12-14' AS Date), CAST(N'1994-11-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10331, CAST(N'1994-12-28' AS Date), CAST(N'1994-11-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10332, CAST(N'1994-12-29' AS Date), CAST(N'1994-11-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10333, CAST(N'1994-12-16' AS Date), CAST(N'1994-11-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10334, CAST(N'1994-12-19' AS Date), CAST(N'1994-11-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10335, CAST(N'1994-12-20' AS Date), CAST(N'1994-11-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10336, CAST(N'1994-12-21' AS Date), CAST(N'1994-11-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10337, CAST(N'1994-12-22' AS Date), CAST(N'1994-11-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10338, CAST(N'1994-12-23' AS Date), CAST(N'1994-11-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10339, CAST(N'1994-12-26' AS Date), CAST(N'1994-12-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10340, CAST(N'1994-12-27' AS Date), CAST(N'1994-12-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10341, CAST(N'1994-12-27' AS Date), CAST(N'1994-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10342, CAST(N'1994-12-14' AS Date), CAST(N'1994-12-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10343, CAST(N'1994-12-29' AS Date), CAST(N'1994-12-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10344, CAST(N'1994-12-30' AS Date), CAST(N'1994-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10345, CAST(N'1995-01-02' AS Date), CAST(N'1994-12-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10346, CAST(N'1995-01-17' AS Date), CAST(N'1994-12-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10347, CAST(N'1995-01-04' AS Date), CAST(N'1994-12-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10348, CAST(N'1995-01-05' AS Date), CAST(N'1994-12-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10349, CAST(N'1995-01-06' AS Date), CAST(N'1994-12-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10350, CAST(N'1995-01-09' AS Date), CAST(N'1995-01-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10351, CAST(N'1995-01-09' AS Date), CAST(N'1994-12-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10352, CAST(N'1994-12-27' AS Date), CAST(N'1994-12-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10353, CAST(N'1995-01-11' AS Date), CAST(N'1994-12-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10354, CAST(N'1995-01-12' AS Date), CAST(N'1994-12-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10355, CAST(N'1995-01-13' AS Date), CAST(N'1994-12-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10356, CAST(N'1995-01-16' AS Date), CAST(N'1994-12-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10357, CAST(N'1995-01-17' AS Date), CAST(N'1995-01-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10358, CAST(N'1995-01-18' AS Date), CAST(N'1994-12-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10359, CAST(N'1995-01-19' AS Date), CAST(N'1994-12-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10360, CAST(N'1995-01-20' AS Date), CAST(N'1995-01-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10361, CAST(N'1995-01-20' AS Date), CAST(N'1995-01-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10362, CAST(N'1995-01-23' AS Date), CAST(N'1994-12-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10363, CAST(N'1995-01-24' AS Date), CAST(N'1995-01-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10364, CAST(N'1995-02-07' AS Date), CAST(N'1995-01-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10365, CAST(N'1995-01-25' AS Date), CAST(N'1995-01-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10366, CAST(N'1995-02-09' AS Date), CAST(N'1995-01-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10367, CAST(N'1995-01-26' AS Date), CAST(N'1995-01-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10368, CAST(N'1995-01-27' AS Date), CAST(N'1995-01-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10369, CAST(N'1995-01-30' AS Date), CAST(N'1995-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10370, CAST(N'1995-01-31' AS Date), CAST(N'1995-01-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10371, CAST(N'1995-01-31' AS Date), CAST(N'1995-01-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10372, CAST(N'1995-02-01' AS Date), CAST(N'1995-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10373, CAST(N'1995-02-02' AS Date), CAST(N'1995-01-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10374, CAST(N'1995-02-02' AS Date), CAST(N'1995-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10375, CAST(N'1995-02-03' AS Date), CAST(N'1995-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10376, CAST(N'1995-02-06' AS Date), CAST(N'1995-01-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10377, CAST(N'1995-02-06' AS Date), CAST(N'1995-01-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10378, CAST(N'1995-02-07' AS Date), CAST(N'1995-01-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10379, CAST(N'1995-02-08' AS Date), CAST(N'1995-01-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10380, CAST(N'1995-02-09' AS Date), CAST(N'1995-02-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10381, CAST(N'1995-02-09' AS Date), CAST(N'1995-01-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10382, CAST(N'1995-02-10' AS Date), CAST(N'1995-01-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10383, CAST(N'1995-02-13' AS Date), CAST(N'1995-01-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10384, CAST(N'1995-02-13' AS Date), CAST(N'1995-01-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10385, CAST(N'1995-02-14' AS Date), CAST(N'1995-01-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10386, CAST(N'1995-02-01' AS Date), CAST(N'1995-01-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10387, CAST(N'1995-02-15' AS Date), CAST(N'1995-01-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10388, CAST(N'1995-02-16' AS Date), CAST(N'1995-01-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10389, CAST(N'1995-02-17' AS Date), CAST(N'1995-01-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10390, CAST(N'1995-02-20' AS Date), CAST(N'1995-01-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10391, CAST(N'1995-02-20' AS Date), CAST(N'1995-01-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10392, CAST(N'1995-02-21' AS Date), CAST(N'1995-02-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10393, CAST(N'1995-02-22' AS Date), CAST(N'1995-02-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10394, CAST(N'1995-02-22' AS Date), CAST(N'1995-02-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10395, CAST(N'1995-02-23' AS Date), CAST(N'1995-02-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10396, CAST(N'1995-02-10' AS Date), CAST(N'1995-02-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10397, CAST(N'1995-02-24' AS Date), CAST(N'1995-02-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10398, CAST(N'1995-02-27' AS Date), CAST(N'1995-02-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10399, CAST(N'1995-02-14' AS Date), CAST(N'1995-02-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10400, CAST(N'1995-03-01' AS Date), CAST(N'1995-02-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10401, CAST(N'1995-03-01' AS Date), CAST(N'1995-02-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10402, CAST(N'1995-03-16' AS Date), CAST(N'1995-02-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10403, CAST(N'1995-03-03' AS Date), CAST(N'1995-02-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10404, CAST(N'1995-03-03' AS Date), CAST(N'1995-02-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10405, CAST(N'1995-03-06' AS Date), CAST(N'1995-02-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10406, CAST(N'1995-03-21' AS Date), CAST(N'1995-02-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10407, CAST(N'1995-03-07' AS Date), CAST(N'1995-03-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10408, CAST(N'1995-03-08' AS Date), CAST(N'1995-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10409, CAST(N'1995-03-09' AS Date), CAST(N'1995-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10410, CAST(N'1995-03-10' AS Date), CAST(N'1995-02-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10411, CAST(N'1995-03-10' AS Date), CAST(N'1995-02-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10412, CAST(N'1995-03-13' AS Date), CAST(N'1995-02-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10413, CAST(N'1995-03-14' AS Date), CAST(N'1995-02-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10414, CAST(N'1995-03-14' AS Date), CAST(N'1995-02-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10415, CAST(N'1995-03-15' AS Date), CAST(N'1995-02-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10416, CAST(N'1995-03-16' AS Date), CAST(N'1995-02-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10417, CAST(N'1995-03-16' AS Date), CAST(N'1995-02-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10418, CAST(N'1995-03-17' AS Date), CAST(N'1995-02-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10419, CAST(N'1995-03-20' AS Date), CAST(N'1995-03-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10420, CAST(N'1995-03-21' AS Date), CAST(N'1995-02-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10421, CAST(N'1995-04-04' AS Date), CAST(N'1995-02-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10422, CAST(N'1995-03-22' AS Date), CAST(N'1995-03-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10423, CAST(N'1995-03-09' AS Date), CAST(N'1995-03-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10424, CAST(N'1995-03-23' AS Date), CAST(N'1995-02-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10425, CAST(N'1995-03-24' AS Date), CAST(N'1995-03-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10426, CAST(N'1995-03-27' AS Date), CAST(N'1995-03-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10427, CAST(N'1995-03-27' AS Date), CAST(N'1995-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10428, CAST(N'1995-03-28' AS Date), CAST(N'1995-03-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10429, CAST(N'1995-04-12' AS Date), CAST(N'1995-03-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10430, CAST(N'1995-03-16' AS Date), CAST(N'1995-03-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10431, CAST(N'1995-03-16' AS Date), CAST(N'1995-03-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10432, CAST(N'1995-03-17' AS Date), CAST(N'1995-03-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10433, CAST(N'1995-04-03' AS Date), CAST(N'1995-04-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10434, CAST(N'1995-04-03' AS Date), CAST(N'1995-03-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10435, CAST(N'1995-04-18' AS Date), CAST(N'1995-03-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10436, CAST(N'1995-04-05' AS Date), CAST(N'1995-03-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10437, CAST(N'1995-04-05' AS Date), CAST(N'1995-03-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10438, CAST(N'1995-04-06' AS Date), CAST(N'1995-03-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10439, CAST(N'1995-04-07' AS Date), CAST(N'1995-03-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10440, CAST(N'1995-04-10' AS Date), CAST(N'1995-03-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10441, CAST(N'1995-04-24' AS Date), CAST(N'1995-04-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10442, CAST(N'1995-04-11' AS Date), CAST(N'1995-03-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10443, CAST(N'1995-04-12' AS Date), CAST(N'1995-03-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10444, CAST(N'1995-04-12' AS Date), CAST(N'1995-03-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10445, CAST(N'1995-04-13' AS Date), CAST(N'1995-03-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10446, CAST(N'1995-04-14' AS Date), CAST(N'1995-03-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10447, CAST(N'1995-04-14' AS Date), CAST(N'1995-04-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10448, CAST(N'1995-04-17' AS Date), CAST(N'1995-03-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10449, CAST(N'1995-04-18' AS Date), CAST(N'1995-03-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10450, CAST(N'1995-04-19' AS Date), CAST(N'1995-04-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10451, CAST(N'1995-04-05' AS Date), CAST(N'1995-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10452, CAST(N'1995-04-20' AS Date), CAST(N'1995-03-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10453, CAST(N'1995-04-21' AS Date), CAST(N'1995-03-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10454, CAST(N'1995-04-21' AS Date), CAST(N'1995-03-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10455, CAST(N'1995-05-08' AS Date), CAST(N'1995-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10456, CAST(N'1995-05-09' AS Date), CAST(N'1995-03-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10457, CAST(N'1995-04-25' AS Date), CAST(N'1995-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10458, CAST(N'1995-04-26' AS Date), CAST(N'1995-04-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10459, CAST(N'1995-04-27' AS Date), CAST(N'1995-03-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10460, CAST(N'1995-04-28' AS Date), CAST(N'1995-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10461, CAST(N'1995-04-28' AS Date), CAST(N'1995-04-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10462, CAST(N'1995-05-01' AS Date), CAST(N'1995-04-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10463, CAST(N'1995-05-02' AS Date), CAST(N'1995-04-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10464, CAST(N'1995-05-02' AS Date), CAST(N'1995-04-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10465, CAST(N'1995-05-03' AS Date), CAST(N'1995-04-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10466, CAST(N'1995-05-04' AS Date), CAST(N'1995-04-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10467, CAST(N'1995-05-04' AS Date), CAST(N'1995-04-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10468, CAST(N'1995-05-05' AS Date), CAST(N'1995-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10469, CAST(N'1995-05-08' AS Date), CAST(N'1995-04-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10470, CAST(N'1995-05-09' AS Date), CAST(N'1995-04-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10471, CAST(N'1995-05-09' AS Date), CAST(N'1995-04-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10472, CAST(N'1995-05-10' AS Date), CAST(N'1995-04-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10473, CAST(N'1995-04-27' AS Date), CAST(N'1995-04-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10474, CAST(N'1995-05-11' AS Date), CAST(N'1995-04-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10475, CAST(N'1995-05-12' AS Date), CAST(N'1995-05-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10476, CAST(N'1995-05-15' AS Date), CAST(N'1995-04-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10477, CAST(N'1995-05-15' AS Date), CAST(N'1995-04-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10478, CAST(N'1995-05-02' AS Date), CAST(N'1995-04-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10479, CAST(N'1995-05-17' AS Date), CAST(N'1995-04-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10480, CAST(N'1995-05-18' AS Date), CAST(N'1995-04-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10481, CAST(N'1995-05-18' AS Date), CAST(N'1995-04-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10482, CAST(N'1995-05-19' AS Date), CAST(N'1995-05-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10483, CAST(N'1995-05-22' AS Date), CAST(N'1995-05-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10484, CAST(N'1995-05-22' AS Date), CAST(N'1995-05-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10485, CAST(N'1995-05-09' AS Date), CAST(N'1995-05-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10486, CAST(N'1995-05-24' AS Date), CAST(N'1995-05-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10487, CAST(N'1995-05-24' AS Date), CAST(N'1995-04-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10488, CAST(N'1995-05-25' AS Date), CAST(N'1995-05-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10489, CAST(N'1995-05-26' AS Date), CAST(N'1995-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10490, CAST(N'1995-05-29' AS Date), CAST(N'1995-05-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10491, CAST(N'1995-05-29' AS Date), CAST(N'1995-05-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10492, CAST(N'1995-05-30' AS Date), CAST(N'1995-05-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10493, CAST(N'1995-05-31' AS Date), CAST(N'1995-05-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10494, CAST(N'1995-05-31' AS Date), CAST(N'1995-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10495, CAST(N'1995-06-01' AS Date), CAST(N'1995-05-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10496, CAST(N'1995-06-02' AS Date), CAST(N'1995-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10497, CAST(N'1995-06-02' AS Date), CAST(N'1995-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10498, CAST(N'1995-06-05' AS Date), CAST(N'1995-05-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10499, CAST(N'1995-06-06' AS Date), CAST(N'1995-05-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10500, CAST(N'1995-06-07' AS Date), CAST(N'1995-05-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10501, CAST(N'1995-06-07' AS Date), CAST(N'1995-05-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10502, CAST(N'1995-06-08' AS Date), CAST(N'1995-05-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10503, CAST(N'1995-06-09' AS Date), CAST(N'1995-05-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10504, CAST(N'1995-06-09' AS Date), CAST(N'1995-05-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10505, CAST(N'1995-06-12' AS Date), CAST(N'1995-05-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10506, CAST(N'1995-06-13' AS Date), CAST(N'1995-06-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10507, CAST(N'1995-06-13' AS Date), CAST(N'1995-05-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10508, CAST(N'1995-06-14' AS Date), CAST(N'1995-06-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10509, CAST(N'1995-06-15' AS Date), CAST(N'1995-05-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10510, CAST(N'1995-06-16' AS Date), CAST(N'1995-05-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10511, CAST(N'1995-06-16' AS Date), CAST(N'1995-05-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10512, CAST(N'1995-06-19' AS Date), CAST(N'1995-05-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10513, CAST(N'1995-07-04' AS Date), CAST(N'1995-05-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10514, CAST(N'1995-06-20' AS Date), CAST(N'1995-06-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10515, CAST(N'1995-06-07' AS Date), CAST(N'1995-06-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10516, CAST(N'1995-06-22' AS Date), CAST(N'1995-06-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10517, CAST(N'1995-06-22' AS Date), CAST(N'1995-05-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10518, CAST(N'1995-06-09' AS Date), CAST(N'1995-06-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10519, CAST(N'1995-06-26' AS Date), CAST(N'1995-06-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10520, CAST(N'1995-06-27' AS Date), CAST(N'1995-06-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10521, CAST(N'1995-06-27' AS Date), CAST(N'1995-06-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10522, CAST(N'1995-06-28' AS Date), CAST(N'1995-06-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10523, CAST(N'1995-06-29' AS Date), CAST(N'1995-06-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10524, CAST(N'1995-06-29' AS Date), CAST(N'1995-06-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10525, CAST(N'1995-06-30' AS Date), CAST(N'1995-06-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10526, CAST(N'1995-07-03' AS Date), CAST(N'1995-06-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10527, CAST(N'1995-07-03' AS Date), CAST(N'1995-06-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10528, CAST(N'1995-06-20' AS Date), CAST(N'1995-06-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10529, CAST(N'1995-07-05' AS Date), CAST(N'1995-06-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10530, CAST(N'1995-07-06' AS Date), CAST(N'1995-06-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10531, CAST(N'1995-07-06' AS Date), CAST(N'1995-06-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10532, CAST(N'1995-07-07' AS Date), CAST(N'1995-06-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10533, CAST(N'1995-07-10' AS Date), CAST(N'1995-06-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10534, CAST(N'1995-07-10' AS Date), CAST(N'1995-06-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10535, CAST(N'1995-07-11' AS Date), CAST(N'1995-06-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10536, CAST(N'1995-07-12' AS Date), CAST(N'1995-07-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10537, CAST(N'1995-06-28' AS Date), CAST(N'1995-06-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10538, CAST(N'1995-07-13' AS Date), CAST(N'1995-06-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10539, CAST(N'1995-07-14' AS Date), CAST(N'1995-06-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10540, CAST(N'1995-07-17' AS Date), CAST(N'1995-07-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10541, CAST(N'1995-07-17' AS Date), CAST(N'1995-06-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10542, CAST(N'1995-07-18' AS Date), CAST(N'1995-06-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10543, CAST(N'1995-07-19' AS Date), CAST(N'1995-06-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10544, CAST(N'1995-07-19' AS Date), CAST(N'1995-06-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10545, CAST(N'1995-07-20' AS Date), CAST(N'1995-07-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10546, CAST(N'1995-07-21' AS Date), CAST(N'1995-06-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10547, CAST(N'1995-07-21' AS Date), CAST(N'1995-07-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10548, CAST(N'1995-07-24' AS Date), CAST(N'1995-07-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10549, CAST(N'1995-07-11' AS Date), CAST(N'1995-06-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10550, CAST(N'1995-07-26' AS Date), CAST(N'1995-07-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10551, CAST(N'1995-08-09' AS Date), CAST(N'1995-07-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10552, CAST(N'1995-07-27' AS Date), CAST(N'1995-07-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10553, CAST(N'1995-07-28' AS Date), CAST(N'1995-07-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10554, CAST(N'1995-07-28' AS Date), CAST(N'1995-07-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10555, CAST(N'1995-07-31' AS Date), CAST(N'1995-07-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10556, CAST(N'1995-08-15' AS Date), CAST(N'1995-07-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10557, CAST(N'1995-07-18' AS Date), CAST(N'1995-07-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10558, CAST(N'1995-08-02' AS Date), CAST(N'1995-07-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10559, CAST(N'1995-08-03' AS Date), CAST(N'1995-07-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10560, CAST(N'1995-08-04' AS Date), CAST(N'1995-07-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10561, CAST(N'1995-08-04' AS Date), CAST(N'1995-07-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10562, CAST(N'1995-08-07' AS Date), CAST(N'1995-07-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10563, CAST(N'1995-08-22' AS Date), CAST(N'1995-07-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10564, CAST(N'1995-08-08' AS Date), CAST(N'1995-07-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10565, CAST(N'1995-08-09' AS Date), CAST(N'1995-07-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10566, CAST(N'1995-08-10' AS Date), CAST(N'1995-07-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10567, CAST(N'1995-08-10' AS Date), CAST(N'1995-07-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10568, CAST(N'1995-08-11' AS Date), CAST(N'1995-08-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10569, CAST(N'1995-08-14' AS Date), CAST(N'1995-08-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10570, CAST(N'1995-08-15' AS Date), CAST(N'1995-07-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10571, CAST(N'1995-08-29' AS Date), CAST(N'1995-08-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10572, CAST(N'1995-08-16' AS Date), CAST(N'1995-07-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10573, CAST(N'1995-08-17' AS Date), CAST(N'1995-07-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10574, CAST(N'1995-08-17' AS Date), CAST(N'1995-07-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10575, CAST(N'1995-08-04' AS Date), CAST(N'1995-07-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10576, CAST(N'1995-08-07' AS Date), CAST(N'1995-07-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10577, CAST(N'1995-09-04' AS Date), CAST(N'1995-07-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10578, CAST(N'1995-08-22' AS Date), CAST(N'1995-08-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10579, CAST(N'1995-08-23' AS Date), CAST(N'1995-08-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10580, CAST(N'1995-08-24' AS Date), CAST(N'1995-08-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10581, CAST(N'1995-08-24' AS Date), CAST(N'1995-08-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10582, CAST(N'1995-08-25' AS Date), CAST(N'1995-08-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10583, CAST(N'1995-08-28' AS Date), CAST(N'1995-08-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10584, CAST(N'1995-08-28' AS Date), CAST(N'1995-08-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10585, CAST(N'1995-08-29' AS Date), CAST(N'1995-08-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10586, CAST(N'1995-08-30' AS Date), CAST(N'1995-08-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10587, CAST(N'1995-08-30' AS Date), CAST(N'1995-08-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10588, CAST(N'1995-08-31' AS Date), CAST(N'1995-08-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10589, CAST(N'1995-09-01' AS Date), CAST(N'1995-08-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10590, CAST(N'1995-09-04' AS Date), CAST(N'1995-08-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10591, CAST(N'1995-08-21' AS Date), CAST(N'1995-08-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10592, CAST(N'1995-09-05' AS Date), CAST(N'1995-08-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10593, CAST(N'1995-09-06' AS Date), CAST(N'1995-09-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10594, CAST(N'1995-09-06' AS Date), CAST(N'1995-08-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10595, CAST(N'1995-09-07' AS Date), CAST(N'1995-08-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10596, CAST(N'1995-09-08' AS Date), CAST(N'1995-09-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10597, CAST(N'1995-09-08' AS Date), CAST(N'1995-08-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10598, CAST(N'1995-09-11' AS Date), CAST(N'1995-08-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10599, CAST(N'1995-09-26' AS Date), CAST(N'1995-08-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10600, CAST(N'1995-09-13' AS Date), CAST(N'1995-08-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10601, CAST(N'1995-09-27' AS Date), CAST(N'1995-08-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10602, CAST(N'1995-09-14' AS Date), CAST(N'1995-08-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10603, CAST(N'1995-09-15' AS Date), CAST(N'1995-09-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10604, CAST(N'1995-09-15' AS Date), CAST(N'1995-08-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10605, CAST(N'1995-09-18' AS Date), CAST(N'1995-08-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10606, CAST(N'1995-09-19' AS Date), CAST(N'1995-08-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10607, CAST(N'1995-09-19' AS Date), CAST(N'1995-08-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10608, CAST(N'1995-09-20' AS Date), CAST(N'1995-09-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10609, CAST(N'1995-09-21' AS Date), CAST(N'1995-08-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10610, CAST(N'1995-09-22' AS Date), CAST(N'1995-09-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10611, CAST(N'1995-09-22' AS Date), CAST(N'1995-09-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10612, CAST(N'1995-09-25' AS Date), CAST(N'1995-09-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10613, CAST(N'1995-09-26' AS Date), CAST(N'1995-09-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10614, CAST(N'1995-09-26' AS Date), CAST(N'1995-09-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10615, CAST(N'1995-09-27' AS Date), CAST(N'1995-09-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10616, CAST(N'1995-09-28' AS Date), CAST(N'1995-09-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10617, CAST(N'1995-09-28' AS Date), CAST(N'1995-09-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10618, CAST(N'1995-10-13' AS Date), CAST(N'1995-09-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10619, CAST(N'1995-10-02' AS Date), CAST(N'1995-09-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10620, CAST(N'1995-10-03' AS Date), CAST(N'1995-09-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10621, CAST(N'1995-10-03' AS Date), CAST(N'1995-09-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10622, CAST(N'1995-10-04' AS Date), CAST(N'1995-09-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10623, CAST(N'1995-10-05' AS Date), CAST(N'1995-09-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10624, CAST(N'1995-10-05' AS Date), CAST(N'1995-09-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10625, CAST(N'1995-10-06' AS Date), CAST(N'1995-09-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10626, CAST(N'1995-10-09' AS Date), CAST(N'1995-09-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10627, CAST(N'1995-10-23' AS Date), CAST(N'1995-09-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10628, CAST(N'1995-10-10' AS Date), CAST(N'1995-09-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10629, CAST(N'1995-10-10' AS Date), CAST(N'1995-09-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10630, CAST(N'1995-10-11' AS Date), CAST(N'1995-09-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10631, CAST(N'1995-10-12' AS Date), CAST(N'1995-09-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10632, CAST(N'1995-10-12' AS Date), CAST(N'1995-09-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10633, CAST(N'1995-10-13' AS Date), CAST(N'1995-09-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10634, CAST(N'1995-10-13' AS Date), CAST(N'1995-09-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10635, CAST(N'1995-10-16' AS Date), CAST(N'1995-09-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10636, CAST(N'1995-10-17' AS Date), CAST(N'1995-09-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10637, CAST(N'1995-10-17' AS Date), CAST(N'1995-09-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10638, CAST(N'1995-10-18' AS Date), CAST(N'1995-10-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10639, CAST(N'1995-10-18' AS Date), CAST(N'1995-09-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10640, CAST(N'1995-10-19' AS Date), CAST(N'1995-09-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10641, CAST(N'1995-10-20' AS Date), CAST(N'1995-09-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10642, CAST(N'1995-10-20' AS Date), CAST(N'1995-10-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10643, CAST(N'1995-10-23' AS Date), CAST(N'1995-10-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10644, CAST(N'1995-10-23' AS Date), CAST(N'1995-10-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10645, CAST(N'1995-10-24' AS Date), CAST(N'1995-10-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10646, CAST(N'1995-11-08' AS Date), CAST(N'1995-10-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10647, CAST(N'1995-10-11' AS Date), CAST(N'1995-10-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10648, CAST(N'1995-11-09' AS Date), CAST(N'1995-10-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10649, CAST(N'1995-10-26' AS Date), CAST(N'1995-09-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10650, CAST(N'1995-10-27' AS Date), CAST(N'1995-10-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10651, CAST(N'1995-10-30' AS Date), CAST(N'1995-10-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10652, CAST(N'1995-10-30' AS Date), CAST(N'1995-10-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10653, CAST(N'1995-10-31' AS Date), CAST(N'1995-10-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10654, CAST(N'1995-10-31' AS Date), CAST(N'1995-10-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10655, CAST(N'1995-11-01' AS Date), CAST(N'1995-10-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10656, CAST(N'1995-11-02' AS Date), CAST(N'1995-10-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10657, CAST(N'1995-11-02' AS Date), CAST(N'1995-10-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10658, CAST(N'1995-11-03' AS Date), CAST(N'1995-10-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10659, CAST(N'1995-11-03' AS Date), CAST(N'1995-10-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10660, CAST(N'1995-11-06' AS Date), CAST(N'1995-11-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10661, CAST(N'1995-11-07' AS Date), CAST(N'1995-10-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10662, CAST(N'1995-11-07' AS Date), CAST(N'1995-10-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10663, CAST(N'1995-10-25' AS Date), CAST(N'1995-11-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10664, CAST(N'1995-11-08' AS Date), CAST(N'1995-10-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10665, CAST(N'1995-11-09' AS Date), CAST(N'1995-10-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10666, CAST(N'1995-11-10' AS Date), CAST(N'1995-10-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10667, CAST(N'1995-11-10' AS Date), CAST(N'1995-10-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10668, CAST(N'1995-11-13' AS Date), CAST(N'1995-10-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10669, CAST(N'1995-11-13' AS Date), CAST(N'1995-10-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10670, CAST(N'1995-11-14' AS Date), CAST(N'1995-10-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10671, CAST(N'1995-11-15' AS Date), CAST(N'1995-10-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10672, CAST(N'1995-11-01' AS Date), CAST(N'1995-10-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10673, CAST(N'1995-11-16' AS Date), CAST(N'1995-10-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10674, CAST(N'1995-11-16' AS Date), CAST(N'1995-10-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10675, CAST(N'1995-11-17' AS Date), CAST(N'1995-10-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10676, CAST(N'1995-11-20' AS Date), CAST(N'1995-10-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10677, CAST(N'1995-11-20' AS Date), CAST(N'1995-10-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10678, CAST(N'1995-11-21' AS Date), CAST(N'1995-11-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10679, CAST(N'1995-11-21' AS Date), CAST(N'1995-10-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10680, CAST(N'1995-11-22' AS Date), CAST(N'1995-10-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10681, CAST(N'1995-11-23' AS Date), CAST(N'1995-10-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10682, CAST(N'1995-11-23' AS Date), CAST(N'1995-11-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10683, CAST(N'1995-11-24' AS Date), CAST(N'1995-11-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10684, CAST(N'1995-11-24' AS Date), CAST(N'1995-10-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10685, CAST(N'1995-11-13' AS Date), CAST(N'1995-11-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10686, CAST(N'1995-11-28' AS Date), CAST(N'1995-11-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10687, CAST(N'1995-11-28' AS Date), CAST(N'1995-11-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10688, CAST(N'1995-11-15' AS Date), CAST(N'1995-11-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10689, CAST(N'1995-11-29' AS Date), CAST(N'1995-11-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10690, CAST(N'1995-11-30' AS Date), CAST(N'1995-11-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10691, CAST(N'1995-12-15' AS Date), CAST(N'1995-11-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10692, CAST(N'1995-12-01' AS Date), CAST(N'1995-11-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10693, CAST(N'1995-11-20' AS Date), CAST(N'1995-11-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10694, CAST(N'1995-12-04' AS Date), CAST(N'1995-11-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10695, CAST(N'1995-12-19' AS Date), CAST(N'1995-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10696, CAST(N'1995-12-20' AS Date), CAST(N'1995-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10697, CAST(N'1995-12-06' AS Date), CAST(N'1995-11-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10698, CAST(N'1995-12-07' AS Date), CAST(N'1995-11-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10699, CAST(N'1995-12-07' AS Date), CAST(N'1995-11-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10700, CAST(N'1995-12-08' AS Date), CAST(N'1995-11-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10701, CAST(N'1995-11-27' AS Date), CAST(N'1995-11-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10702, CAST(N'1995-12-25' AS Date), CAST(N'1995-11-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10703, CAST(N'1995-12-12' AS Date), CAST(N'1995-11-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10704, CAST(N'1995-12-12' AS Date), CAST(N'1995-12-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10705, CAST(N'1995-12-13' AS Date), CAST(N'1995-12-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10706, CAST(N'1995-12-14' AS Date), CAST(N'1995-11-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10707, CAST(N'1995-11-30' AS Date), CAST(N'1995-11-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10708, CAST(N'1995-12-29' AS Date), CAST(N'1995-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10709, CAST(N'1995-12-15' AS Date), CAST(N'1995-12-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10710, CAST(N'1995-12-18' AS Date), CAST(N'1995-11-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10711, CAST(N'1996-01-02' AS Date), CAST(N'1995-11-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10712, CAST(N'1995-12-19' AS Date), CAST(N'1995-12-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10713, CAST(N'1995-12-20' AS Date), CAST(N'1995-11-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10714, CAST(N'1995-12-20' AS Date), CAST(N'1995-11-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10715, CAST(N'1995-12-07' AS Date), CAST(N'1995-11-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10716, CAST(N'1995-12-22' AS Date), CAST(N'1995-11-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10717, CAST(N'1995-12-22' AS Date), CAST(N'1995-11-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10718, CAST(N'1995-12-25' AS Date), CAST(N'1995-11-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10719, CAST(N'1995-12-25' AS Date), CAST(N'1995-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10720, CAST(N'1995-12-12' AS Date), CAST(N'1995-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10721, CAST(N'1995-12-27' AS Date), CAST(N'1995-12-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10722, CAST(N'1996-01-10' AS Date), CAST(N'1995-12-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10723, CAST(N'1995-12-28' AS Date), CAST(N'1995-12-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10724, CAST(N'1996-01-11' AS Date), CAST(N'1995-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10725, CAST(N'1995-12-29' AS Date), CAST(N'1995-12-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10726, CAST(N'1995-12-18' AS Date), CAST(N'1996-01-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10727, CAST(N'1996-01-01' AS Date), CAST(N'1996-01-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10728, CAST(N'1996-01-02' AS Date), CAST(N'1995-12-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10729, CAST(N'1996-01-16' AS Date), CAST(N'1995-12-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10730, CAST(N'1996-01-03' AS Date), CAST(N'1995-12-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10731, CAST(N'1996-01-04' AS Date), CAST(N'1995-12-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10732, CAST(N'1996-01-04' AS Date), CAST(N'1995-12-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10733, CAST(N'1996-01-05' AS Date), CAST(N'1995-12-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10734, CAST(N'1996-01-05' AS Date), CAST(N'1995-12-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10735, CAST(N'1996-01-08' AS Date), CAST(N'1995-12-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10736, CAST(N'1996-01-09' AS Date), CAST(N'1995-12-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10737, CAST(N'1996-01-09' AS Date), CAST(N'1995-12-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10738, CAST(N'1996-01-10' AS Date), CAST(N'1995-12-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10739, CAST(N'1996-01-10' AS Date), CAST(N'1995-12-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10740, CAST(N'1996-01-11' AS Date), CAST(N'1995-12-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10741, CAST(N'1995-12-29' AS Date), CAST(N'1995-12-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10742, CAST(N'1996-01-12' AS Date), CAST(N'1995-12-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10743, CAST(N'1996-01-15' AS Date), CAST(N'1995-12-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10744, CAST(N'1996-01-15' AS Date), CAST(N'1995-12-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10745, CAST(N'1996-01-16' AS Date), CAST(N'1995-12-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10746, CAST(N'1996-01-17' AS Date), CAST(N'1995-12-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10747, CAST(N'1996-01-17' AS Date), CAST(N'1995-12-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10748, CAST(N'1996-01-18' AS Date), CAST(N'1995-12-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10749, CAST(N'1996-01-18' AS Date), CAST(N'1996-01-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10750, CAST(N'1996-01-19' AS Date), CAST(N'1995-12-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10751, CAST(N'1996-01-22' AS Date), CAST(N'1996-01-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10752, CAST(N'1996-01-22' AS Date), CAST(N'1995-12-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10753, CAST(N'1996-01-23' AS Date), CAST(N'1995-12-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10754, CAST(N'1996-01-23' AS Date), CAST(N'1995-12-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10755, CAST(N'1996-01-24' AS Date), CAST(N'1995-12-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10756, CAST(N'1996-01-25' AS Date), CAST(N'1996-01-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10757, CAST(N'1996-01-25' AS Date), CAST(N'1996-01-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10758, CAST(N'1996-01-26' AS Date), CAST(N'1996-01-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10759, CAST(N'1996-01-26' AS Date), CAST(N'1996-01-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10760, CAST(N'1996-01-29' AS Date), CAST(N'1996-01-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10761, CAST(N'1996-01-30' AS Date), CAST(N'1996-01-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10762, CAST(N'1996-01-30' AS Date), CAST(N'1996-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10763, CAST(N'1996-01-31' AS Date), CAST(N'1996-01-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10764, CAST(N'1996-01-31' AS Date), CAST(N'1996-01-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10765, CAST(N'1996-02-01' AS Date), CAST(N'1996-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10766, CAST(N'1996-02-02' AS Date), CAST(N'1996-01-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10767, CAST(N'1996-02-02' AS Date), CAST(N'1996-01-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10768, CAST(N'1996-02-05' AS Date), CAST(N'1996-01-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10769, CAST(N'1996-02-05' AS Date), CAST(N'1996-01-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10770, CAST(N'1996-02-06' AS Date), CAST(N'1996-01-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10771, CAST(N'1996-02-07' AS Date), CAST(N'1996-02-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10772, CAST(N'1996-02-07' AS Date), CAST(N'1996-01-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10773, CAST(N'1996-02-08' AS Date), CAST(N'1996-01-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10774, CAST(N'1996-01-25' AS Date), CAST(N'1996-01-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10775, CAST(N'1996-02-09' AS Date), CAST(N'1996-01-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10776, CAST(N'1996-02-12' AS Date), CAST(N'1996-01-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10777, CAST(N'1996-01-29' AS Date), CAST(N'1996-02-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10778, CAST(N'1996-02-13' AS Date), CAST(N'1996-01-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10779, CAST(N'1996-02-13' AS Date), CAST(N'1996-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10780, CAST(N'1996-01-30' AS Date), CAST(N'1996-01-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10781, CAST(N'1996-02-14' AS Date), CAST(N'1996-01-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10782, CAST(N'1996-02-14' AS Date), CAST(N'1996-01-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10783, CAST(N'1996-02-15' AS Date), CAST(N'1996-01-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10784, CAST(N'1996-02-15' AS Date), CAST(N'1996-01-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10785, CAST(N'1996-02-15' AS Date), CAST(N'1996-01-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10786, CAST(N'1996-02-16' AS Date), CAST(N'1996-01-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10787, CAST(N'1996-02-02' AS Date), CAST(N'1996-01-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10788, CAST(N'1996-02-19' AS Date), CAST(N'1996-02-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10789, CAST(N'1996-02-19' AS Date), CAST(N'1996-01-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10790, CAST(N'1996-02-19' AS Date), CAST(N'1996-01-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10791, CAST(N'1996-02-20' AS Date), CAST(N'1996-02-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10792, CAST(N'1996-02-20' AS Date), CAST(N'1996-01-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10793, CAST(N'1996-02-21' AS Date), CAST(N'1996-02-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10794, CAST(N'1996-02-21' AS Date), CAST(N'1996-02-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10795, CAST(N'1996-02-21' AS Date), CAST(N'1996-02-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10796, CAST(N'1996-02-22' AS Date), CAST(N'1996-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10797, CAST(N'1996-02-22' AS Date), CAST(N'1996-02-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10798, CAST(N'1996-02-23' AS Date), CAST(N'1996-02-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10799, CAST(N'1996-03-08' AS Date), CAST(N'1996-02-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10800, CAST(N'1996-02-23' AS Date), CAST(N'1996-02-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10801, CAST(N'1996-02-26' AS Date), CAST(N'1996-01-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10802, CAST(N'1996-02-26' AS Date), CAST(N'1996-02-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10803, CAST(N'1996-02-27' AS Date), CAST(N'1996-02-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10804, CAST(N'1996-02-27' AS Date), CAST(N'1996-02-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10805, CAST(N'1996-02-27' AS Date), CAST(N'1996-02-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10806, CAST(N'1996-02-28' AS Date), CAST(N'1996-02-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10807, CAST(N'1996-02-28' AS Date), CAST(N'1996-03-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10808, CAST(N'1996-02-29' AS Date), CAST(N'1996-02-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10809, CAST(N'1996-02-29' AS Date), CAST(N'1996-02-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10810, CAST(N'1996-02-29' AS Date), CAST(N'1996-02-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10811, CAST(N'1996-03-01' AS Date), CAST(N'1996-02-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10812, CAST(N'1996-03-01' AS Date), CAST(N'1996-02-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10813, CAST(N'1996-03-04' AS Date), CAST(N'1996-02-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10814, CAST(N'1996-03-04' AS Date), CAST(N'1996-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10815, CAST(N'1996-03-04' AS Date), CAST(N'1996-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10816, CAST(N'1996-03-05' AS Date), CAST(N'1996-03-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10817, CAST(N'1996-02-20' AS Date), CAST(N'1996-02-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10818, CAST(N'1996-03-06' AS Date), CAST(N'1996-02-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10819, CAST(N'1996-03-06' AS Date), CAST(N'1996-02-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10820, CAST(N'1996-03-06' AS Date), CAST(N'1996-02-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10821, CAST(N'1996-03-07' AS Date), CAST(N'1996-02-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10822, CAST(N'1996-03-07' AS Date), CAST(N'1996-02-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10823, CAST(N'1996-03-08' AS Date), CAST(N'1996-02-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10824, CAST(N'1996-03-08' AS Date), CAST(N'1996-03-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10825, CAST(N'1996-03-08' AS Date), CAST(N'1996-02-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10826, CAST(N'1996-03-11' AS Date), CAST(N'1996-03-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10827, CAST(N'1996-02-26' AS Date), CAST(N'1996-03-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10828, CAST(N'1996-02-27' AS Date), CAST(N'1996-03-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10829, CAST(N'1996-03-12' AS Date), CAST(N'1996-02-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10830, CAST(N'1996-03-26' AS Date), CAST(N'1996-02-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10831, CAST(N'1996-03-13' AS Date), CAST(N'1996-02-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10832, CAST(N'1996-03-13' AS Date), CAST(N'1996-02-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10833, CAST(N'1996-03-14' AS Date), CAST(N'1996-02-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10834, CAST(N'1996-03-14' AS Date), CAST(N'1996-02-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10835, CAST(N'1996-03-14' AS Date), CAST(N'1996-02-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10836, CAST(N'1996-03-15' AS Date), CAST(N'1996-02-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10837, CAST(N'1996-03-15' AS Date), CAST(N'1996-02-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10838, CAST(N'1996-03-18' AS Date), CAST(N'1996-02-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10839, CAST(N'1996-03-18' AS Date), CAST(N'1996-02-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10840, CAST(N'1996-04-01' AS Date), CAST(N'1996-03-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10841, CAST(N'1996-03-19' AS Date), CAST(N'1996-02-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10842, CAST(N'1996-03-19' AS Date), CAST(N'1996-02-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10843, CAST(N'1996-03-20' AS Date), CAST(N'1996-02-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10844, CAST(N'1996-03-20' AS Date), CAST(N'1996-02-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10845, CAST(N'1996-03-06' AS Date), CAST(N'1996-03-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10846, CAST(N'1996-04-04' AS Date), CAST(N'1996-02-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10847, CAST(N'1996-03-07' AS Date), CAST(N'1996-03-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10848, CAST(N'1996-03-22' AS Date), CAST(N'1996-02-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10849, CAST(N'1996-03-22' AS Date), CAST(N'1996-03-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10850, CAST(N'1996-04-05' AS Date), CAST(N'1996-03-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10851, CAST(N'1996-03-25' AS Date), CAST(N'1996-03-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10852, CAST(N'1996-03-11' AS Date), CAST(N'1996-03-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10853, CAST(N'1996-03-26' AS Date), CAST(N'1996-03-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10854, CAST(N'1996-03-26' AS Date), CAST(N'1996-03-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10855, CAST(N'1996-03-26' AS Date), CAST(N'1996-03-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10856, CAST(N'1996-03-27' AS Date), CAST(N'1996-03-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10857, CAST(N'1996-03-27' AS Date), CAST(N'1996-03-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10858, CAST(N'1996-03-28' AS Date), CAST(N'1996-03-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10859, CAST(N'1996-03-28' AS Date), CAST(N'1996-03-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10860, CAST(N'1996-03-28' AS Date), CAST(N'1996-03-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10861, CAST(N'1996-03-29' AS Date), CAST(N'1996-03-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10862, CAST(N'1996-04-12' AS Date), CAST(N'1996-03-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10863, CAST(N'1996-04-01' AS Date), CAST(N'1996-03-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10864, CAST(N'1996-04-01' AS Date), CAST(N'1996-03-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10865, CAST(N'1996-03-18' AS Date), CAST(N'1996-03-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10866, CAST(N'1996-04-02' AS Date), CAST(N'1996-03-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10867, CAST(N'1996-04-16' AS Date), CAST(N'1996-03-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10868, CAST(N'1996-04-03' AS Date), CAST(N'1996-03-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10869, CAST(N'1996-04-03' AS Date), CAST(N'1996-03-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10870, CAST(N'1996-04-03' AS Date), CAST(N'1996-03-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10871, CAST(N'1996-04-04' AS Date), CAST(N'1996-03-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10872, CAST(N'1996-04-04' AS Date), CAST(N'1996-03-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10873, CAST(N'1996-04-05' AS Date), CAST(N'1996-03-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10874, CAST(N'1996-04-05' AS Date), CAST(N'1996-03-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10875, CAST(N'1996-04-05' AS Date), CAST(N'1996-04-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10876, CAST(N'1996-04-08' AS Date), CAST(N'1996-03-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10877, CAST(N'1996-04-08' AS Date), CAST(N'1996-03-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10878, CAST(N'1996-04-09' AS Date), CAST(N'1996-03-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10879, CAST(N'1996-04-09' AS Date), CAST(N'1996-03-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10880, CAST(N'1996-04-23' AS Date), CAST(N'1996-03-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10881, CAST(N'1996-04-10' AS Date), CAST(N'1996-03-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10882, CAST(N'1996-04-10' AS Date), CAST(N'1996-03-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10883, CAST(N'1996-04-11' AS Date), CAST(N'1996-03-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10884, CAST(N'1996-04-11' AS Date), CAST(N'1996-03-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10885, CAST(N'1996-04-11' AS Date), CAST(N'1996-03-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10886, CAST(N'1996-04-12' AS Date), CAST(N'1996-04-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10887, CAST(N'1996-04-12' AS Date), CAST(N'1996-03-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10888, CAST(N'1996-04-15' AS Date), CAST(N'1996-03-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10889, CAST(N'1996-04-15' AS Date), CAST(N'1996-03-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10890, CAST(N'1996-04-15' AS Date), CAST(N'1996-03-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10891, CAST(N'1996-04-16' AS Date), CAST(N'1996-03-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10892, CAST(N'1996-04-16' AS Date), CAST(N'1996-03-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10893, CAST(N'1996-04-17' AS Date), CAST(N'1996-03-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10894, CAST(N'1996-04-17' AS Date), CAST(N'1996-03-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10895, CAST(N'1996-04-17' AS Date), CAST(N'1996-03-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10896, CAST(N'1996-04-18' AS Date), CAST(N'1996-03-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10897, CAST(N'1996-04-18' AS Date), CAST(N'1996-03-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10898, CAST(N'1996-04-19' AS Date), CAST(N'1996-04-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10899, CAST(N'1996-04-19' AS Date), CAST(N'1996-03-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10900, CAST(N'1996-04-19' AS Date), CAST(N'1996-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10901, CAST(N'1996-04-22' AS Date), CAST(N'1996-03-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10902, CAST(N'1996-04-22' AS Date), CAST(N'1996-04-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10903, CAST(N'1996-04-23' AS Date), CAST(N'1996-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10904, CAST(N'1996-04-23' AS Date), CAST(N'1996-03-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10905, CAST(N'1996-04-23' AS Date), CAST(N'1996-04-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10906, CAST(N'1996-04-10' AS Date), CAST(N'1996-04-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10907, CAST(N'1996-04-24' AS Date), CAST(N'1996-03-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10908, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10909, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10910, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10911, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10912, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10913, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10914, CAST(N'1996-04-26' AS Date), CAST(N'1996-04-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10915, CAST(N'1996-04-26' AS Date), CAST(N'1996-04-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10916, CAST(N'1996-04-26' AS Date), CAST(N'1996-04-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10917, CAST(N'1996-04-29' AS Date), CAST(N'1996-04-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10918, CAST(N'1996-04-29' AS Date), CAST(N'1996-04-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10919, CAST(N'1996-04-29' AS Date), CAST(N'1996-04-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10920, CAST(N'1996-04-30' AS Date), CAST(N'1996-04-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10921, CAST(N'1996-05-14' AS Date), CAST(N'1996-04-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10922, CAST(N'1996-04-30' AS Date), CAST(N'1996-04-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10923, CAST(N'1996-05-14' AS Date), CAST(N'1996-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10924, CAST(N'1996-05-01' AS Date), CAST(N'1996-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10925, CAST(N'1996-05-01' AS Date), CAST(N'1996-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10926, CAST(N'1996-05-01' AS Date), CAST(N'1996-04-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10927, CAST(N'1996-05-02' AS Date), CAST(N'1996-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10928, CAST(N'1996-05-02' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10929, CAST(N'1996-05-02' AS Date), CAST(N'1996-04-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10930, CAST(N'1996-05-17' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10931, CAST(N'1996-04-19' AS Date), CAST(N'1996-04-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10932, CAST(N'1996-05-03' AS Date), CAST(N'1996-04-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10933, CAST(N'1996-05-03' AS Date), CAST(N'1996-04-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10934, CAST(N'1996-05-06' AS Date), CAST(N'1996-04-11' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10935, CAST(N'1996-05-06' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10936, CAST(N'1996-05-06' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10937, CAST(N'1996-04-23' AS Date), CAST(N'1996-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10938, CAST(N'1996-05-07' AS Date), CAST(N'1996-04-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10939, CAST(N'1996-05-07' AS Date), CAST(N'1996-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10940, CAST(N'1996-05-08' AS Date), CAST(N'1996-04-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10941, CAST(N'1996-05-08' AS Date), CAST(N'1996-04-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10942, CAST(N'1996-05-08' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10943, CAST(N'1996-05-08' AS Date), CAST(N'1996-04-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10944, CAST(N'1996-04-25' AS Date), CAST(N'1996-04-12' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10945, CAST(N'1996-05-09' AS Date), CAST(N'1996-04-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10946, CAST(N'1996-05-09' AS Date), CAST(N'1996-04-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10947, CAST(N'1996-05-10' AS Date), CAST(N'1996-04-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10948, CAST(N'1996-05-10' AS Date), CAST(N'1996-04-18' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10949, CAST(N'1996-05-10' AS Date), CAST(N'1996-04-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10950, CAST(N'1996-05-13' AS Date), CAST(N'1996-04-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10951, CAST(N'1996-05-27' AS Date), CAST(N'1996-05-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10952, CAST(N'1996-05-27' AS Date), CAST(N'1996-04-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10953, CAST(N'1996-04-29' AS Date), CAST(N'1996-04-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10954, CAST(N'1996-05-28' AS Date), CAST(N'1996-04-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10955, CAST(N'1996-05-14' AS Date), CAST(N'1996-04-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10956, CAST(N'1996-05-28' AS Date), CAST(N'1996-04-19' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10957, CAST(N'1996-05-15' AS Date), CAST(N'1996-04-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10958, CAST(N'1996-05-15' AS Date), CAST(N'1996-04-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10959, CAST(N'1996-05-29' AS Date), CAST(N'1996-04-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10960, CAST(N'1996-05-02' AS Date), CAST(N'1996-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10961, CAST(N'1996-05-16' AS Date), CAST(N'1996-04-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10962, CAST(N'1996-05-16' AS Date), CAST(N'1996-04-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10963, CAST(N'1996-05-16' AS Date), CAST(N'1996-04-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10964, CAST(N'1996-05-17' AS Date), CAST(N'1996-04-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10965, CAST(N'1996-05-17' AS Date), CAST(N'1996-04-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10966, CAST(N'1996-05-17' AS Date), CAST(N'1996-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10967, CAST(N'1996-05-20' AS Date), CAST(N'1996-05-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10968, CAST(N'1996-05-20' AS Date), CAST(N'1996-05-01' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10969, CAST(N'1996-05-20' AS Date), CAST(N'1996-04-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10970, CAST(N'1996-05-07' AS Date), CAST(N'1996-05-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10971, CAST(N'1996-05-21' AS Date), CAST(N'1996-05-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10972, CAST(N'1996-05-21' AS Date), CAST(N'1996-04-25' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10973, CAST(N'1996-05-21' AS Date), CAST(N'1996-04-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10974, CAST(N'1996-05-08' AS Date), CAST(N'1996-05-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10975, CAST(N'1996-05-22' AS Date), CAST(N'1996-04-26' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10976, CAST(N'1996-06-05' AS Date), CAST(N'1996-05-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10977, CAST(N'1996-05-23' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10978, CAST(N'1996-05-23' AS Date), CAST(N'1996-05-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10979, CAST(N'1996-05-23' AS Date), CAST(N'1996-04-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10980, CAST(N'1996-06-07' AS Date), CAST(N'1996-05-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10981, CAST(N'1996-05-24' AS Date), CAST(N'1996-05-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10982, CAST(N'1996-05-24' AS Date), CAST(N'1996-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10983, CAST(N'1996-05-24' AS Date), CAST(N'1996-05-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10984, CAST(N'1996-05-27' AS Date), CAST(N'1996-05-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10985, CAST(N'1996-05-27' AS Date), CAST(N'1996-05-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10986, CAST(N'1996-05-27' AS Date), CAST(N'1996-05-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10987, CAST(N'1996-05-28' AS Date), CAST(N'1996-05-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10988, CAST(N'1996-05-28' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10989, CAST(N'1996-05-28' AS Date), CAST(N'1996-05-02' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10990, CAST(N'1996-06-12' AS Date), CAST(N'1996-05-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10991, CAST(N'1996-05-29' AS Date), CAST(N'1996-05-07' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10992, CAST(N'1996-05-29' AS Date), CAST(N'1996-05-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10993, CAST(N'1996-05-29' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10994, CAST(N'1996-05-16' AS Date), CAST(N'1996-05-09' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10995, CAST(N'1996-05-30' AS Date), CAST(N'1996-05-06' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10996, CAST(N'1996-05-30' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10997, CAST(N'1996-06-14' AS Date), CAST(N'1996-05-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10998, CAST(N'1996-05-17' AS Date), CAST(N'1996-05-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (10999, CAST(N'1996-05-31' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11000, CAST(N'1996-06-03' AS Date), CAST(N'1996-05-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11001, CAST(N'1996-06-03' AS Date), CAST(N'1996-05-14' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11002, CAST(N'1996-06-03' AS Date), CAST(N'1996-05-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11003, CAST(N'1996-06-03' AS Date), CAST(N'1996-05-08' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11004, CAST(N'1996-06-04' AS Date), CAST(N'1996-05-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11005, CAST(N'1996-06-04' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11006, CAST(N'1996-06-04' AS Date), CAST(N'1996-05-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11007, CAST(N'1996-06-05' AS Date), CAST(N'1996-05-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11008, CAST(N'1996-06-05' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11009, CAST(N'1996-06-05' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11010, CAST(N'1996-06-06' AS Date), CAST(N'1996-05-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11011, CAST(N'1996-06-06' AS Date), CAST(N'1996-05-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11012, CAST(N'1996-05-23' AS Date), CAST(N'1996-05-17' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11013, CAST(N'1996-06-06' AS Date), CAST(N'1996-05-10' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11014, CAST(N'1996-06-07' AS Date), CAST(N'1996-05-15' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11015, CAST(N'1996-05-24' AS Date), CAST(N'1996-05-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11016, CAST(N'1996-06-07' AS Date), CAST(N'1996-05-13' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11017, CAST(N'1996-06-10' AS Date), CAST(N'1996-05-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11018, CAST(N'1996-06-10' AS Date), CAST(N'1996-05-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11019, CAST(N'1996-06-10' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11020, CAST(N'1996-06-11' AS Date), CAST(N'1996-05-16' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11021, CAST(N'1996-06-11' AS Date), CAST(N'1996-05-21' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11022, CAST(N'1996-06-11' AS Date), CAST(N'1996-06-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11023, CAST(N'1996-05-28' AS Date), CAST(N'1996-05-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11024, CAST(N'1996-06-12' AS Date), CAST(N'1996-05-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11025, CAST(N'1996-06-12' AS Date), CAST(N'1996-05-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11026, CAST(N'1996-06-12' AS Date), CAST(N'1996-05-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11027, CAST(N'1996-06-13' AS Date), CAST(N'1996-05-20' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11028, CAST(N'1996-06-13' AS Date), CAST(N'1996-05-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11029, CAST(N'1996-06-13' AS Date), CAST(N'1996-05-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11030, CAST(N'1996-06-14' AS Date), CAST(N'1996-05-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11031, CAST(N'1996-06-14' AS Date), CAST(N'1996-05-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11032, CAST(N'1996-06-14' AS Date), CAST(N'1996-05-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11033, CAST(N'1996-06-14' AS Date), CAST(N'1996-05-23' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11034, CAST(N'1996-07-01' AS Date), CAST(N'1996-05-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11035, CAST(N'1996-06-17' AS Date), CAST(N'1996-05-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11036, CAST(N'1996-06-17' AS Date), CAST(N'1996-05-22' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11037, CAST(N'1996-06-18' AS Date), CAST(N'1996-05-27' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11038, CAST(N'1996-06-18' AS Date), CAST(N'1996-05-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11039, CAST(N'1996-06-18' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11040, CAST(N'1996-06-19' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11041, CAST(N'1996-06-19' AS Date), CAST(N'1996-05-28' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11042, CAST(N'1996-06-05' AS Date), CAST(N'1996-05-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11043, CAST(N'1996-06-19' AS Date), CAST(N'1996-05-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11044, CAST(N'1996-06-20' AS Date), CAST(N'1996-05-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11045, CAST(N'1996-06-20' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11046, CAST(N'1996-06-20' AS Date), CAST(N'1996-05-24' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11047, CAST(N'1996-06-21' AS Date), CAST(N'1996-05-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11048, CAST(N'1996-06-21' AS Date), CAST(N'1996-05-30' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11049, CAST(N'1996-06-21' AS Date), CAST(N'1996-06-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11050, CAST(N'1996-06-24' AS Date), CAST(N'1996-06-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11051, CAST(N'1996-06-24' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11052, CAST(N'1996-06-24' AS Date), CAST(N'1996-05-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11053, CAST(N'1996-06-24' AS Date), CAST(N'1996-05-29' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11054, CAST(N'1996-06-25' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11055, CAST(N'1996-06-25' AS Date), CAST(N'1996-06-04' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11056, CAST(N'1996-06-11' AS Date), CAST(N'1996-05-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11057, CAST(N'1996-06-26' AS Date), CAST(N'1996-05-31' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11058, CAST(N'1996-06-26' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11059, CAST(N'1996-07-10' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11060, CAST(N'1996-06-27' AS Date), CAST(N'1996-06-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11061, CAST(N'1996-07-11' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11062, CAST(N'1996-06-27' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11063, CAST(N'1996-06-27' AS Date), CAST(N'1996-06-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11064, CAST(N'1996-06-28' AS Date), CAST(N'1996-06-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11065, CAST(N'1996-06-28' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11066, CAST(N'1996-06-28' AS Date), CAST(N'1996-06-03' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11067, CAST(N'1996-06-17' AS Date), CAST(N'1996-06-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11068, CAST(N'1996-07-01' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11069, CAST(N'1996-07-01' AS Date), CAST(N'1996-06-05' AS Date))
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11070, CAST(N'1996-07-02' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11071, CAST(N'1996-07-02' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11072, CAST(N'1996-07-02' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11073, CAST(N'1996-07-02' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11074, CAST(N'1996-07-03' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11075, CAST(N'1996-07-03' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11076, CAST(N'1996-07-03' AS Date), NULL)
GO
INSERT [dbo].[dimtiempo] ([idtiempo], [fecha_entrega], [fecha_envio]) VALUES (11077, CAST(N'1996-07-03' AS Date), NULL)
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 3, 4, 1, 1, 10702, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 6, 1, 3, 1, 10952, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 28, 1, 12, 1, 10952, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 28, 6, 12, 2, 10643, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 39, 6, 18, 2, 10643, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 46, 6, 21, 2, 10643, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 58, 3, 27, 1, 11011, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 59, 1, 28, 3, 10835, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 63, 4, 7, 2, 10692, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 71, 3, 15, 1, 11011, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 76, 4, 23, 1, 10702, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ALFKI', 77, 1, 12, 3, 10835, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 11, 4, 5, 3, 10926, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 13, 4, 6, 3, 10926, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 14, 3, 6, 1, 10625, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 19, 4, 8, 3, 10926, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 32, 3, 14, 3, 10759, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 42, 3, 20, 1, 10625, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 60, 3, 28, 1, 10625, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 69, 7, 15, 3, 10308, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 70, 7, 7, 3, 10308, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANATR', 72, 4, 14, 3, 10926, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 2, 3, 1, 2, 10856, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 11, 3, 5, 2, 10365, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 11, 4, 5, 1, 10535, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 17, 7, 7, 3, 10573, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 26, 1, 11, 3, 10677, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 33, 1, 15, 3, 10677, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 33, 3, 15, 2, 10682, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 34, 7, 16, 3, 10573, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 40, 4, 19, 1, 10535, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 42, 3, 20, 2, 10856, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 43, 7, 20, 1, 10507, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 48, 7, 22, 1, 10507, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 53, 7, 24, 3, 10573, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 57, 4, 26, 1, 10535, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 59, 4, 28, 1, 10535, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 66, 3, 2, 2, 10682, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ANTON', 75, 3, 12, 2, 10682, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 13, 8, 6, 3, 10383, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 20, 9, 8, 2, 10953, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 22, 3, 9, 2, 10768, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 24, 6, 10, 1, 10355, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 31, 3, 14, 2, 10768, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 31, 9, 14, 2, 10953, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 31, 9, 14, 2, 11016, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 35, 4, 16, 2, 10864, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 36, 9, 17, 2, 11016, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 41, 3, 19, 3, 10793, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 46, 1, 21, 2, 10743, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 47, 1, 22, 2, 10558, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 48, 1, 22, 2, 10453, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 50, 4, 23, 2, 10920, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 50, 8, 23, 3, 10383, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 51, 1, 24, 2, 10558, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 52, 1, 24, 2, 10558, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 52, 3, 24, 3, 10793, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 53, 1, 24, 2, 10558, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 55, 4, 25, 3, 10707, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 56, 8, 26, 3, 10383, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 57, 4, 26, 3, 10707, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 57, 6, 26, 1, 10355, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 60, 3, 28, 2, 10768, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 67, 4, 16, 2, 10864, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 70, 1, 7, 2, 10453, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 70, 4, 7, 3, 10707, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 71, 3, 15, 2, 10768, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'AROUT', 73, 1, 17, 2, 10558, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 1, 1, 1, 2, 10689, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 2, 4, 1, 3, 10741, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 2, 5, 1, 1, 10866, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 3, 8, 1, 2, 10857, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 4, 5, 2, 1, 10654, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 10, 1, 4, 2, 10524, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 10, 3, 4, 2, 10924, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 13, 9, 6, 3, 10837, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 14, 1, 6, 3, 10733, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 16, 3, 7, 2, 10572, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 17, 3, 7, 3, 10444, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 19, 4, 8, 2, 10875, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 20, 3, 8, 3, 10384, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 24, 2, 10, 1, 10280, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 24, 5, 10, 1, 10866, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 26, 3, 11, 3, 10444, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 26, 8, 11, 2, 10857, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 28, 1, 12, 3, 10733, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 28, 3, 12, 2, 10924, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 29, 8, 12, 2, 10857, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 30, 1, 13, 2, 10524, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 30, 5, 13, 1, 10866, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 32, 3, 14, 2, 10572, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 35, 3, 16, 3, 10444, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 38, 9, 18, 2, 10672, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 39, 3, 18, 1, 10445, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 39, 5, 18, 1, 10654, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 40, 3, 19, 2, 10572, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 40, 9, 19, 3, 10837, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 41, 3, 19, 1, 10778, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 41, 3, 19, 3, 10444, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 43, 1, 20, 2, 10524, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 44, 8, 20, 2, 10278, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 47, 4, 22, 2, 10875, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 47, 9, 22, 3, 10837, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 49, 4, 23, 2, 10875, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 52, 1, 24, 3, 10733, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 53, 1, 24, 2, 10626, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 54, 1, 25, 2, 10524, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 54, 3, 25, 1, 10445, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 54, 5, 25, 1, 10654, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 55, 2, 25, 1, 10280, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 59, 8, 28, 2, 10278, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 60, 1, 28, 2, 10626, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 60, 3, 28, 3, 10384, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 63, 8, 7, 2, 10278, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 71, 1, 15, 2, 10626, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 71, 9, 15, 2, 10672, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 73, 8, 17, 2, 10278, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 75, 2, 12, 1, 10280, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 75, 3, 12, 2, 10572, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 75, 3, 12, 2, 10924, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BERGS', 76, 9, 23, 3, 10837, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 11, 8, 5, 3, 10614, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 18, 9, 7, 2, 10853, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 21, 6, 8, 2, 10956, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 21, 8, 8, 3, 10614, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 21, 9, 8, 3, 11058, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 28, 4, 12, 1, 10509, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 39, 8, 18, 3, 10614, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 47, 6, 22, 2, 10956, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 51, 6, 24, 2, 10956, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 54, 9, 25, 3, 10501, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 57, 3, 26, 2, 10582, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 60, 9, 28, 3, 11058, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 61, 9, 29, 3, 11058, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLAUS', 76, 3, 23, 2, 10582, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 1, 4, 1, 3, 10628, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 10, 3, 4, 2, 10449, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 11, 9, 5, 1, 10566, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 17, 2, 7, 1, 10265, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 18, 9, 7, 1, 10566, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 28, 4, 12, 3, 10360, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 29, 4, 12, 3, 10360, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 31, 4, 14, 1, 10584, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 31, 6, 14, 1, 10826, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 38, 4, 18, 3, 10360, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 39, 5, 18, 2, 10297, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 41, 6, 19, 1, 10559, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 46, 3, 21, 2, 10436, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 49, 4, 23, 3, 10360, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 52, 3, 24, 2, 10449, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 54, 4, 25, 3, 10360, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 55, 6, 25, 1, 10559, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 56, 3, 26, 2, 10436, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 57, 6, 26, 1, 10826, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 59, 8, 28, 3, 10679, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 62, 3, 29, 2, 10449, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 64, 3, 12, 2, 10436, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 70, 2, 7, 1, 10265, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 72, 5, 14, 2, 10297, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 75, 3, 12, 2, 10436, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BLONP', 76, 9, 23, 1, 10566, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOLID', 4, 4, 2, 2, 10326, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOLID', 17, 4, 7, 2, 10801, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOLID', 29, 4, 12, 2, 10801, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOLID', 52, 9, 24, 1, 10970, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOLID', 57, 4, 26, 2, 10326, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOLID', 75, 4, 12, 2, 10326, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 4, 4, 2, 3, 10511, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 6, 4, 3, 2, 11076, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 6, 9, 3, 2, 10871, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 7, 4, 3, 3, 10511, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 7, 8, 3, 3, 10940, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 8, 4, 3, 3, 10511, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 10, 1, 4, 2, 10827, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 10, 3, 4, 1, 10715, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 13, 8, 6, 3, 10940, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 14, 4, 6, 2, 11076, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 16, 5, 7, 1, 10730, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 16, 8, 7, 1, 10932, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 16, 9, 7, 2, 10871, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 17, 9, 7, 2, 10871, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 18, 1, 7, 3, 10340, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 18, 4, 7, 2, 10470, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 19, 4, 8, 2, 11076, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 23, 4, 9, 2, 10470, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 25, 3, 11, 1, 10362, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 31, 5, 14, 1, 10730, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 36, 1, 17, 2, 10525, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 39, 1, 18, 2, 10827, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 40, 1, 19, 2, 10525, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 40, 2, 19, 2, 10663, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 41, 1, 19, 3, 10340, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 42, 2, 20, 2, 10663, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 43, 1, 20, 3, 10340, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 46, 7, 21, 3, 10876, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 47, 4, 22, 2, 10755, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 51, 2, 24, 2, 10663, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 51, 3, 24, 1, 10362, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 54, 3, 25, 1, 10362, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 54, 9, 25, 1, 10331, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 56, 4, 26, 2, 10755, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 57, 4, 26, 2, 10755, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 62, 8, 29, 1, 10932, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 64, 4, 12, 2, 10470, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 64, 7, 12, 3, 10876, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 65, 5, 2, 1, 10730, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 69, 4, 15, 2, 10755, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 71, 3, 15, 1, 10715, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 72, 8, 14, 1, 10932, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 75, 8, 12, 1, 10932, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BONAP', 76, 3, 23, 1, 10732, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 1, 3, 1, 3, 10918, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 3, 3, 1, 3, 10742, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 6, 2, 3, 3, 10949, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 7, 2, 3, 1, 10982, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 8, 1, 3, 3, 10975, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 10, 2, 4, 3, 10949, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 10, 4, 4, 2, 10389, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 11, 6, 5, 3, 10944, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 17, 2, 7, 3, 10949, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 17, 4, 7, 2, 10431, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 24, 1, 10, 1, 11027, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 25, 3, 11, 1, 10492, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 33, 3, 15, 3, 10410, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 33, 6, 15, 2, 11045, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 40, 4, 19, 2, 10431, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 41, 9, 19, 3, 10411, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 42, 3, 20, 1, 10492, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 43, 2, 20, 1, 10982, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 44, 6, 20, 3, 10944, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 44, 9, 20, 3, 10411, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 47, 4, 22, 2, 10431, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 51, 6, 24, 2, 11045, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 55, 4, 25, 2, 10389, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 56, 6, 26, 3, 10944, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 59, 3, 28, 3, 10410, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 59, 9, 28, 3, 10411, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 60, 3, 28, 3, 10742, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 60, 3, 28, 3, 10918, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 62, 1, 29, 1, 11027, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 62, 2, 29, 3, 10949, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 62, 4, 29, 2, 10389, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 68, 7, 8, 3, 11048, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 70, 4, 7, 2, 10389, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 72, 3, 14, 3, 10742, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BOTTM', 75, 1, 12, 3, 10975, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 3, 7, 1, 3, 10289, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 7, 1, 3, 2, 11023, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 7, 2, 3, 3, 10471, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 13, 4, 6, 2, 10943, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 13, 6, 6, 3, 10539, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 21, 3, 8, 3, 10484, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 21, 6, 8, 3, 10539, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 22, 4, 9, 2, 10943, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 33, 6, 15, 3, 10539, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 35, 4, 16, 3, 10578, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 40, 3, 19, 3, 10484, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 43, 1, 20, 2, 11023, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 46, 4, 21, 2, 10943, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 49, 6, 23, 3, 10539, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 51, 3, 24, 3, 10484, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 56, 2, 26, 3, 10471, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 57, 4, 26, 3, 10578, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 59, 3, 28, 2, 10947, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 62, 6, 29, 3, 10599, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 64, 7, 12, 3, 10289, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 70, 9, 7, 3, 10538, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'BSBEV', 72, 9, 14, 3, 10538, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 28, 7, 12, 3, 10937, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 31, 9, 14, 3, 10782, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 33, 8, 15, 1, 11054, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 34, 7, 16, 3, 10937, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 35, 8, 16, 2, 10521, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 41, 8, 19, 2, 10521, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 43, 2, 20, 3, 10819, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 67, 8, 16, 1, 11054, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 68, 8, 8, 2, 10521, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 73, 4, 17, 1, 10881, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CACTU', 75, 2, 12, 3, 10819, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CENTC', 21, 4, 8, 3, 10259, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CENTC', 37, 4, 17, 3, 10259, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 1, 6, 1, 2, 10370, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 2, 3, 1, 2, 11041, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 10, 6, 4, 3, 10519, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 13, 1, 6, 3, 10746, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 21, 7, 8, 1, 10731, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 24, 5, 10, 2, 10254, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 37, 4, 17, 1, 10966, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 42, 1, 20, 3, 10746, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 51, 7, 24, 1, 10731, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 55, 5, 25, 2, 10254, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 56, 4, 26, 1, 10966, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 56, 4, 26, 1, 11029, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 56, 6, 26, 3, 10519, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 60, 6, 28, 3, 10519, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 62, 1, 29, 3, 10746, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 62, 4, 29, 1, 10966, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 63, 3, 7, 2, 11041, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 63, 4, 7, 1, 11029, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 64, 6, 12, 2, 10370, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 69, 1, 15, 3, 10746, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 74, 5, 4, 2, 10254, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CHOPS', 74, 6, 4, 2, 10370, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 5, 8, 2, 1, 10290, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 11, 4, 5, 1, 10466, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 29, 8, 12, 1, 10290, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 44, 2, 20, 1, 11042, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 46, 1, 21, 2, 10969, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 46, 4, 21, 1, 10466, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 49, 8, 23, 1, 10290, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 56, 4, 26, 2, 10494, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 61, 2, 29, 1, 11042, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'COMMI', 77, 8, 12, 1, 10290, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 2, 8, 1, 2, 10435, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 5, 7, 2, 2, 10848, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 9, 7, 4, 2, 10848, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 13, 2, 6, 1, 10462, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 22, 8, 9, 2, 10435, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 23, 2, 9, 1, 10462, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'CONSH', 72, 8, 14, 2, 10435, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 11, 7, 5, 2, 10797, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 13, 3, 6, 3, 10391, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 13, 8, 6, 3, 11036, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 26, 1, 11, 1, 10825, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 31, 4, 14, 3, 10363, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 41, 1, 19, 2, 11067, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 53, 1, 24, 1, 10825, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 59, 8, 28, 3, 11036, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 75, 4, 12, 3, 10363, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DRACD', 76, 4, 23, 3, 10363, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 1, 7, 1, 2, 10609, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 10, 7, 4, 2, 10609, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 17, 7, 7, 1, 10890, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 21, 7, 8, 2, 10609, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 34, 7, 16, 1, 10890, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 41, 7, 19, 1, 10890, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 42, 1, 20, 3, 10311, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 52, 2, 24, 1, 10683, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'DUMON', 69, 1, 15, 3, 10311, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 1, 7, 1, 3, 11047, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 4, 4, 2, 1, 10726, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 5, 7, 2, 3, 11047, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 7, 8, 3, 1, 10987, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 7, 8, 3, 2, 11056, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 11, 4, 5, 1, 10726, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 26, 4, 11, 1, 11024, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 29, 1, 12, 3, 10400, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 30, 7, 13, 3, 10532, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 33, 4, 15, 1, 11024, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 35, 1, 16, 3, 10400, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 43, 8, 20, 1, 10987, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 49, 1, 23, 3, 10400, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 55, 8, 25, 2, 11056, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 60, 8, 28, 2, 11056, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 65, 4, 2, 1, 11024, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 66, 7, 2, 3, 10532, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 69, 1, 15, 1, 10364, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 71, 1, 15, 1, 10364, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 71, 4, 15, 1, 11024, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'EASTC', 72, 8, 14, 1, 10987, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 2, 1, 1, 1, 10258, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 2, 4, 1, 2, 11072, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 3, 6, 1, 3, 10764, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 3, 9, 1, 2, 11017, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 5, 1, 2, 1, 10258, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 5, 4, 2, 1, 10382, 32, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 7, 8, 3, 2, 10979, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 10, 3, 4, 2, 10854, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 11, 3, 5, 2, 10442, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 11, 4, 5, 1, 10698, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 12, 1, 5, 3, 10968, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 12, 7, 5, 3, 10633, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 12, 8, 5, 2, 10979, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 13, 3, 6, 2, 10854, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 13, 7, 6, 3, 10633, 13, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 14, 8, 6, 3, 10571, 11, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 16, 4, 7, 3, 10403, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 16, 8, 7, 2, 10795, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 16, 9, 7, 3, 10263, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 17, 1, 7, 3, 10773, 33, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 17, 4, 7, 1, 10430, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 17, 4, 7, 1, 10698, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 17, 8, 7, 2, 10795, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 18, 4, 7, 1, 10382, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 20, 3, 8, 2, 10514, 39, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 21, 2, 8, 2, 10368, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 21, 2, 8, 3, 10990, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 21, 4, 8, 1, 10430, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 22, 7, 9, 1, 10836, 52, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 23, 8, 9, 2, 10402, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 24, 1, 10, 3, 10968, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 24, 3, 10, 1, 10895, 110, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 24, 8, 10, 2, 10979, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 24, 9, 10, 3, 10263, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 26, 7, 11, 3, 10633, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 27, 8, 11, 2, 10979, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 28, 2, 12, 2, 10368, 13, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 28, 3, 12, 2, 10514, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 28, 7, 12, 3, 11008, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 29, 4, 12, 1, 10382, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 29, 4, 12, 1, 10698, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 30, 9, 13, 3, 10263, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 31, 1, 14, 3, 10773, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 31, 1, 14, 3, 10776, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 31, 6, 14, 1, 10390, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 31, 8, 14, 2, 10979, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 32, 1, 14, 1, 10258, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 33, 4, 15, 1, 10382, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 34, 2, 16, 3, 10990, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 34, 7, 16, 3, 11008, 90, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 35, 2, 16, 1, 10595, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 35, 6, 16, 1, 10390, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 35, 7, 16, 1, 10836, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 38, 1, 18, 1, 10351, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 39, 3, 18, 1, 10895, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 39, 6, 18, 3, 10764, 130, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 40, 3, 19, 1, 10895, 91, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 41, 1, 19, 1, 10351, 13, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 41, 4, 19, 2, 11072, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 42, 1, 20, 3, 10776, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 42, 8, 20, 3, 10571, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 44, 1, 20, 1, 10351, 77, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 45, 1, 21, 3, 10776, 27, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 46, 6, 21, 1, 10390, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 48, 4, 22, 3, 10403, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 50, 4, 23, 2, 11072, 22, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 51, 1, 24, 3, 10776, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 54, 3, 25, 2, 10442, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 55, 2, 25, 3, 10990, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 56, 3, 26, 2, 10514, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 56, 4, 26, 1, 10430, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 57, 2, 26, 2, 10368, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 57, 7, 26, 1, 10836, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 59, 4, 28, 1, 10430, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 59, 9, 28, 2, 11017, 110, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 60, 3, 28, 1, 10895, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 60, 7, 28, 1, 10836, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 61, 2, 29, 1, 10595, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 61, 2, 29, 3, 10990, 66, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 62, 7, 29, 3, 10633, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 63, 8, 7, 2, 10402, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 63, 8, 7, 2, 10979, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 64, 1, 12, 3, 10968, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 64, 2, 12, 2, 10368, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 64, 4, 12, 2, 11072, 130, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 64, 7, 12, 1, 10836, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 65, 1, 2, 1, 10351, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 65, 3, 2, 2, 10514, 39, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 65, 4, 2, 1, 10698, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 66, 3, 2, 2, 10442, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 69, 2, 15, 1, 10595, 65, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 69, 7, 15, 1, 10667, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 70, 4, 7, 1, 10698, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 70, 9, 7, 2, 11017, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 71, 7, 15, 1, 10667, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 71, 7, 15, 3, 11008, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 71, 9, 15, 2, 10771, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 72, 6, 14, 1, 10390, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 74, 4, 4, 1, 10382, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 74, 9, 4, 3, 10263, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 75, 1, 12, 3, 10773, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ERNSH', 75, 3, 12, 2, 10514, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 19, 2, 8, 3, 10414, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 24, 7, 10, 2, 10512, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 24, 9, 10, 3, 10386, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 25, 4, 11, 3, 10347, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 30, 5, 13, 3, 10650, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 33, 2, 15, 3, 10414, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 34, 9, 16, 3, 10386, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 39, 4, 18, 3, 10347, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 40, 4, 19, 3, 10347, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 41, 4, 19, 3, 10725, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 46, 7, 21, 2, 10512, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 47, 7, 22, 2, 10512, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 52, 4, 24, 3, 10725, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 53, 5, 24, 3, 10650, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 54, 5, 25, 3, 10650, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 55, 4, 25, 3, 10725, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 60, 7, 28, 2, 10512, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 75, 3, 12, 1, 10581, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FAMIA', 75, 4, 12, 3, 10347, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 7, 4, 3, 3, 10634, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 18, 1, 7, 2, 10789, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 18, 4, 7, 3, 10634, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 21, 3, 8, 3, 10763, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 22, 3, 9, 3, 10763, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 24, 3, 10, 3, 10763, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 35, 1, 16, 2, 10789, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 37, 8, 17, 1, 10408, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 47, 6, 22, 2, 10480, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 51, 4, 24, 3, 10634, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 54, 8, 25, 1, 10408, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 59, 6, 28, 2, 10480, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 62, 8, 29, 1, 10408, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 63, 1, 7, 2, 10789, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 68, 1, 8, 2, 10789, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLIG', 75, 4, 12, 3, 10634, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 2, 2, 1, 1, 10327, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 2, 6, 1, 2, 10703, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 2, 6, 1, 3, 10264, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 4, 8, 2, 1, 10533, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 7, 2, 3, 2, 11001, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 11, 2, 5, 1, 10327, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 11, 3, 5, 2, 10434, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 22, 2, 9, 2, 11001, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 23, 7, 9, 1, 10880, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 29, 7, 12, 3, 10993, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 30, 2, 13, 1, 10327, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 31, 4, 14, 1, 10774, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 39, 3, 18, 1, 10762, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 39, 8, 18, 3, 10977, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 41, 6, 19, 3, 10264, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 41, 7, 19, 3, 10993, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 41, 8, 19, 1, 10824, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 44, 2, 20, 2, 10561, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 46, 2, 21, 2, 11001, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 47, 3, 22, 1, 10762, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 47, 8, 22, 3, 10977, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 51, 2, 24, 2, 10561, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 51, 3, 24, 1, 10762, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 51, 8, 24, 3, 10977, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 55, 1, 25, 1, 10902, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 55, 2, 25, 2, 11001, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 56, 3, 26, 1, 10762, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 58, 2, 27, 1, 10327, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 59, 6, 28, 2, 10703, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 61, 7, 29, 1, 10880, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 62, 1, 29, 1, 10902, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 63, 8, 7, 3, 10977, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 66, 4, 2, 1, 10774, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 68, 8, 8, 1, 10460, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 70, 7, 7, 1, 10880, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 70, 8, 7, 1, 10824, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 71, 5, 15, 3, 10378, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 72, 8, 14, 1, 10533, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 73, 6, 17, 2, 10703, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 73, 8, 17, 1, 10533, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 75, 4, 12, 1, 10980, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 75, 8, 12, 1, 10460, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 75, 8, 12, 2, 10955, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 76, 3, 23, 2, 10434, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FOLKO', 76, 8, 23, 2, 11050, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 2, 4, 1, 2, 10342, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 14, 5, 6, 2, 10675, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 14, 8, 6, 2, 10623, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 16, 1, 7, 1, 10653, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 19, 1, 8, 3, 11012, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 19, 8, 8, 2, 10623, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 21, 1, 8, 2, 10717, 32, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 21, 6, 8, 1, 10929, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 21, 8, 8, 2, 10623, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 23, 1, 9, 3, 10396, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 23, 4, 9, 1, 10670, 32, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 23, 4, 9, 3, 10337, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 24, 1, 10, 2, 10859, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 24, 8, 10, 2, 10623, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 26, 4, 11, 3, 10337, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 29, 6, 12, 2, 10791, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 30, 8, 13, 1, 10560, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 31, 4, 14, 2, 10342, 56, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 35, 8, 16, 2, 10623, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 36, 4, 17, 2, 10342, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 36, 4, 17, 3, 10337, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 37, 4, 17, 3, 10337, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 40, 4, 19, 1, 10267, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 41, 6, 19, 2, 10791, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 46, 4, 21, 1, 10670, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 53, 5, 24, 2, 10675, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 54, 1, 25, 2, 10717, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 54, 1, 25, 2, 10859, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 55, 4, 25, 2, 10342, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 58, 5, 27, 2, 10675, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 59, 4, 28, 1, 10267, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 59, 8, 28, 2, 10488, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 60, 1, 28, 1, 10653, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 60, 1, 28, 3, 11012, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 62, 8, 29, 1, 10560, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 64, 1, 12, 2, 10859, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 67, 4, 16, 1, 10670, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 69, 1, 15, 2, 10717, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 71, 1, 15, 3, 10396, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 71, 1, 15, 3, 11012, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 72, 1, 14, 3, 10396, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 72, 4, 14, 3, 10337, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 73, 4, 17, 1, 10670, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 73, 8, 17, 2, 10488, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 75, 4, 12, 1, 10670, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 75, 6, 12, 1, 10929, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 76, 4, 23, 1, 10267, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANK', 77, 6, 12, 1, 10929, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANR', 16, 1, 7, 1, 10671, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANR', 29, 2, 12, 2, 10971, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANR', 51, 3, 24, 3, 10860, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANR', 62, 1, 29, 1, 10671, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANR', 65, 1, 2, 1, 10671, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANR', 76, 3, 23, 3, 10860, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 18, 4, 7, 1, 11026, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 19, 1, 8, 1, 10710, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 26, 2, 11, 1, 10422, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 40, 4, 19, 1, 10807, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 45, 3, 21, 1, 10753, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 47, 1, 22, 1, 10710, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 51, 4, 24, 1, 11026, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 60, 2, 28, 2, 11060, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 74, 3, 4, 1, 10753, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FRANS', 77, 2, 12, 2, 11060, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 4, 4, 2, 2, 10464, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 10, 1, 4, 3, 10664, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 16, 4, 7, 3, 10551, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 24, 3, 10, 3, 10352, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 35, 4, 16, 3, 10551, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 43, 4, 20, 2, 10464, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 44, 4, 20, 3, 10551, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 44, 8, 20, 3, 10491, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 48, 1, 22, 1, 10604, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 54, 3, 25, 3, 10352, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 56, 1, 26, 3, 10664, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 56, 4, 26, 2, 10464, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 59, 4, 28, 3, 10328, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 60, 4, 28, 2, 10464, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 60, 9, 28, 3, 10963, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 65, 1, 2, 3, 10664, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 65, 4, 2, 3, 10328, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 68, 4, 8, 3, 10328, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 76, 1, 23, 1, 10604, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'FURIB', 77, 8, 12, 3, 10491, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 10, 3, 4, 3, 10568, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 25, 8, 11, 3, 10887, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 47, 1, 22, 1, 10928, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 56, 4, 26, 1, 10426, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 64, 4, 12, 1, 10426, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 65, 8, 2, 2, 10366, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 76, 1, 23, 1, 10928, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GALED', 77, 8, 12, 2, 10366, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 1, 3, 1, 1, 10911, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 2, 1, 1, 2, 10888, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 10, 5, 4, 2, 10874, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 17, 3, 7, 1, 10911, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 17, 7, 7, 3, 10550, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 19, 7, 8, 3, 10550, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 21, 7, 8, 3, 10550, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 24, 2, 10, 1, 11009, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 29, 4, 12, 3, 10629, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 36, 2, 17, 1, 11009, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 40, 7, 19, 2, 10303, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 50, 3, 23, 3, 10948, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 51, 3, 24, 3, 10948, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 55, 3, 25, 3, 10948, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 55, 5, 25, 2, 10872, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 60, 2, 28, 1, 11009, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 61, 7, 29, 3, 10550, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 62, 5, 29, 2, 10872, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 64, 4, 12, 3, 10629, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 64, 5, 12, 2, 10872, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 65, 5, 2, 2, 10872, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 65, 7, 2, 2, 10303, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 67, 3, 16, 1, 10911, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 68, 1, 8, 2, 10888, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 68, 7, 8, 2, 10303, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GODOS', 70, 7, 7, 1, 11037, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 2, 3, 1, 1, 11049, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 6, 2, 3, 3, 10734, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 7, 6, 3, 1, 10790, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 8, 1, 3, 3, 10709, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 10, 4, 4, 2, 10685, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 12, 3, 5, 1, 11049, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 30, 2, 13, 3, 10734, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 30, 4, 13, 2, 10652, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 31, 6, 14, 3, 10423, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 41, 4, 19, 2, 10685, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 42, 4, 20, 2, 10652, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 42, 7, 20, 2, 10777, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 47, 4, 22, 2, 10685, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 51, 1, 24, 3, 10709, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 56, 6, 26, 1, 10790, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 59, 6, 28, 3, 10423, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 60, 1, 28, 3, 10709, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 75, 6, 12, 2, 10959, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GOURL', 76, 2, 23, 3, 10734, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 1, 3, 1, 2, 11006, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 11, 6, 5, 2, 10528, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 14, 6, 6, 1, 10656, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 19, 3, 8, 3, 10681, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 21, 3, 8, 3, 10681, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 21, 4, 8, 3, 11040, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 29, 3, 12, 2, 11006, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 33, 6, 15, 2, 10528, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 35, 8, 16, 2, 10589, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 36, 3, 17, 2, 10936, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 38, 1, 18, 2, 10616, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 38, 4, 18, 2, 10816, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 44, 6, 20, 1, 10656, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 47, 6, 22, 1, 10656, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 56, 1, 26, 2, 10616, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 59, 4, 28, 2, 10617, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 60, 4, 28, 3, 11061, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 62, 4, 29, 2, 10816, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 64, 3, 12, 3, 10681, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 70, 1, 7, 2, 10616, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 71, 1, 15, 2, 10616, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GREAL', 72, 6, 14, 2, 10528, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GROSR', 10, 1, 4, 3, 10785, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GROSR', 29, 8, 12, 3, 10268, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GROSR', 72, 8, 14, 3, 10268, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'GROSR', 75, 1, 12, 3, 10785, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 10, 1, 4, 1, 10886, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 11, 8, 5, 3, 10770, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 13, 3, 6, 3, 10903, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 17, 5, 7, 3, 10922, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 18, 4, 7, 1, 10645, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 19, 9, 8, 2, 11022, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 24, 2, 10, 1, 10541, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 24, 5, 10, 3, 10922, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 31, 1, 14, 1, 10886, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 31, 3, 14, 2, 10253, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 31, 4, 14, 2, 10783, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 36, 3, 17, 1, 10925, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 36, 4, 17, 1, 10645, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 38, 1, 18, 2, 10981, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 38, 2, 18, 1, 10541, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 38, 4, 18, 2, 10783, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 39, 3, 18, 2, 10253, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 41, 4, 19, 2, 10250, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 43, 3, 20, 1, 11052, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 49, 3, 23, 2, 10253, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 51, 4, 24, 2, 10250, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 52, 3, 24, 1, 10925, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 56, 1, 26, 1, 10690, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 61, 3, 29, 1, 11052, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 65, 2, 2, 1, 10541, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 65, 3, 2, 3, 10903, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 65, 4, 2, 2, 10250, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 68, 3, 8, 3, 10903, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 69, 9, 15, 2, 11022, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 71, 2, 15, 1, 10541, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 77, 1, 12, 1, 10690, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HANAR', 77, 1, 12, 1, 10886, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 1, 4, 1, 2, 10863, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 2, 4, 1, 2, 10641, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 11, 1, 5, 2, 10486, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 13, 4, 6, 2, 10613, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 13, 7, 6, 1, 10601, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 24, 3, 10, 1, 10960, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 24, 7, 10, 2, 11055, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 24, 8, 10, 2, 10498, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 25, 7, 11, 2, 11055, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 26, 3, 11, 1, 10796, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 27, 4, 11, 3, 10257, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 28, 1, 12, 1, 10976, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 30, 8, 13, 3, 10957, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 31, 9, 14, 2, 10705, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 32, 9, 14, 2, 10705, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 35, 8, 16, 3, 10957, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 39, 4, 18, 3, 10257, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 40, 4, 19, 2, 10641, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 40, 8, 19, 2, 10498, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 41, 3, 19, 1, 10960, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 41, 4, 19, 1, 10901, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 42, 8, 20, 2, 10498, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 44, 3, 20, 1, 10796, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 46, 6, 21, 1, 10395, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 51, 1, 24, 2, 10486, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 51, 7, 24, 2, 11055, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 53, 6, 24, 1, 10395, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 55, 8, 25, 3, 10476, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 57, 7, 26, 2, 11055, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 58, 4, 27, 2, 10863, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 59, 7, 28, 1, 10601, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 59, 7, 28, 2, 10490, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 64, 3, 12, 1, 10796, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 64, 8, 12, 3, 10957, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 68, 7, 8, 2, 10490, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 69, 2, 15, 1, 10552, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 69, 3, 15, 1, 10796, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 69, 6, 15, 1, 10395, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 70, 8, 7, 3, 10476, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 71, 4, 15, 1, 10901, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 74, 1, 4, 2, 10486, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 75, 2, 12, 1, 10552, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 75, 4, 12, 2, 10613, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 75, 7, 12, 2, 10490, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HILAA', 77, 4, 12, 3, 10257, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 13, 1, 6, 3, 10394, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 14, 3, 6, 2, 10375, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 17, 3, 7, 1, 10415, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 20, 8, 8, 1, 10660, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 33, 3, 15, 1, 10415, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 54, 3, 25, 2, 10375, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 54, 4, 25, 1, 10600, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 62, 1, 29, 3, 10394, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGC', 73, 4, 17, 1, 10600, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 1, 9, 1, 3, 10646, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 2, 6, 1, 2, 10298, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 2, 7, 1, 2, 10335, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 4, 3, 2, 1, 10309, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 6, 3, 3, 1, 10309, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 9, 9, 4, 2, 10687, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 10, 9, 4, 3, 10646, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 11, 2, 5, 2, 10912, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 14, 6, 6, 2, 10503, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 16, 2, 7, 1, 10985, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 18, 2, 7, 1, 10985, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 18, 2, 7, 3, 10516, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 29, 2, 12, 2, 10912, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 29, 3, 12, 2, 10897, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 29, 9, 12, 2, 10687, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 30, 3, 13, 2, 10897, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 30, 8, 13, 3, 10380, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 31, 1, 14, 1, 10567, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 31, 7, 14, 2, 10335, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 32, 2, 14, 1, 10985, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 32, 7, 14, 2, 10335, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 34, 3, 16, 2, 11063, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 36, 6, 17, 2, 10298, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 36, 9, 17, 2, 10687, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 39, 7, 18, 3, 10661, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 40, 3, 19, 2, 11063, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 41, 2, 19, 3, 10516, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 41, 3, 19, 2, 11063, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 42, 2, 20, 3, 10516, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 42, 3, 20, 1, 10309, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 43, 3, 20, 1, 10309, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 50, 3, 23, 2, 10429, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 51, 1, 24, 1, 10567, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 51, 7, 24, 2, 10335, 48, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 53, 3, 24, 1, 10712, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 53, 8, 24, 3, 10380, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 56, 3, 26, 1, 10712, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 58, 4, 27, 3, 10373, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 58, 7, 27, 3, 10661, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 59, 1, 28, 1, 10567, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 59, 6, 28, 2, 10298, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 59, 6, 28, 3, 10701, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 60, 8, 28, 3, 10380, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 62, 6, 29, 2, 10298, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 63, 3, 7, 2, 10429, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 65, 6, 2, 2, 10503, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 65, 9, 2, 2, 10736, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 70, 8, 7, 3, 10380, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 71, 3, 15, 1, 10309, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 71, 4, 15, 3, 10373, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 71, 6, 15, 3, 10701, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 71, 9, 15, 3, 10646, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 75, 9, 12, 2, 10736, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 76, 6, 23, 3, 10701, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'HUNGO', 77, 9, 12, 3, 10646, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 2, 9, 1, 1, 10829, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 8, 9, 3, 1, 10829, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 13, 9, 6, 1, 10829, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 19, 4, 8, 2, 10621, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 23, 4, 9, 2, 10621, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 23, 4, 9, 2, 10674, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 33, 1, 15, 3, 10473, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 34, 4, 16, 2, 10315, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 35, 3, 16, 2, 10321, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 41, 8, 19, 2, 10318, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 53, 6, 24, 3, 10933, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 56, 4, 26, 2, 10749, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 59, 4, 28, 2, 10749, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 60, 9, 28, 1, 10829, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 61, 6, 29, 3, 10933, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 62, 2, 29, 1, 10798, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 70, 4, 7, 2, 10315, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 70, 4, 7, 2, 10621, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 71, 1, 15, 3, 10473, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 71, 4, 15, 2, 10621, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 72, 2, 14, 1, 10798, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 76, 4, 23, 2, 10749, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ISLAT', 76, 8, 23, 2, 10318, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 3, 9, 1, 2, 10849, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 6, 1, 3, 3, 10325, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 8, 9, 3, 2, 10893, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 11, 1, 5, 3, 10542, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 12, 1, 5, 3, 10718, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 13, 1, 6, 3, 10325, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 13, 9, 6, 3, 10799, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 14, 1, 6, 3, 10325, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 15, 4, 6, 1, 10323, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 16, 1, 7, 3, 10718, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 21, 8, 8, 2, 10456, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 24, 9, 10, 2, 10893, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 24, 9, 10, 3, 10799, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 25, 4, 11, 1, 10323, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 25, 9, 11, 2, 10506, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 26, 3, 11, 2, 10817, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 26, 9, 11, 2, 10849, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 29, 9, 12, 2, 10893, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 30, 3, 13, 3, 10468, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 30, 9, 13, 2, 10893, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 31, 1, 14, 3, 10325, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 36, 1, 17, 3, 10718, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 36, 9, 17, 2, 10893, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 38, 3, 18, 2, 10817, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 39, 4, 18, 1, 10323, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 40, 3, 19, 2, 10817, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 43, 3, 20, 3, 10468, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 49, 8, 23, 2, 10456, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 54, 1, 25, 3, 10542, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 55, 1, 25, 2, 10630, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 55, 2, 25, 1, 11028, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 59, 2, 28, 1, 10457, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 59, 2, 28, 1, 11028, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 59, 9, 28, 3, 10799, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 62, 1, 29, 3, 10718, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 62, 3, 29, 2, 10817, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 70, 9, 7, 2, 10506, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 72, 1, 14, 3, 10325, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'KOENE', 76, 1, 23, 2, 10630, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 7, 2, 3, 1, 10858, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 17, 4, 7, 2, 10972, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 20, 4, 8, 1, 10927, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 26, 6, 11, 2, 10973, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 27, 2, 11, 1, 10858, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 33, 4, 15, 2, 10972, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 41, 6, 19, 2, 10973, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 52, 4, 24, 1, 10927, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 70, 2, 7, 1, 10858, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 75, 6, 12, 2, 10973, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LACOR', 76, 4, 23, 1, 10927, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 1, 3, 1, 2, 10413, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 2, 2, 1, 1, 10787, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 13, 2, 6, 2, 10832, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 15, 6, 6, 1, 10500, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 16, 4, 7, 3, 10454, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 24, 5, 10, 1, 10358, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 24, 7, 10, 3, 11051, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 25, 2, 11, 2, 10832, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 28, 6, 12, 1, 10500, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 29, 2, 12, 1, 10787, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 33, 4, 15, 3, 10454, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 34, 5, 16, 1, 10358, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 36, 1, 17, 1, 10371, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 36, 5, 17, 1, 10358, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 36, 8, 17, 1, 10610, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 42, 7, 20, 3, 10923, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 43, 7, 20, 3, 10923, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 44, 2, 20, 2, 10832, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 46, 4, 21, 3, 10454, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 50, 6, 23, 2, 10350, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 55, 6, 25, 2, 10425, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 62, 3, 29, 2, 10413, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 64, 2, 12, 2, 10832, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 65, 4, 2, 3, 10493, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 66, 4, 2, 3, 10493, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 67, 7, 16, 3, 10923, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 69, 4, 15, 3, 10493, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 69, 6, 15, 2, 10350, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 75, 8, 12, 1, 10631, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 76, 3, 23, 2, 10413, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAMAI', 76, 6, 23, 2, 10425, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 13, 2, 6, 3, 10810, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 23, 3, 9, 3, 10495, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 24, 2, 10, 3, 10620, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 25, 2, 11, 3, 10810, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 41, 3, 19, 3, 10495, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 52, 2, 24, 3, 10620, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 70, 2, 7, 3, 10810, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAUGB', 77, 3, 12, 3, 10495, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAZYK', 11, 8, 5, 2, 10545, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LAZYK', 40, 1, 19, 3, 10482, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 1, 2, 1, 1, 11070, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 1, 4, 1, 1, 10522, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 2, 2, 1, 1, 11070, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 6, 3, 3, 3, 10934, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 8, 4, 3, 1, 10522, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 11, 8, 5, 2, 10862, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 12, 3, 5, 2, 10536, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 15, 3, 6, 1, 10592, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 16, 2, 7, 1, 11070, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 17, 8, 7, 2, 10279, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 20, 7, 8, 2, 10593, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 26, 3, 11, 1, 10592, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 27, 4, 11, 1, 10284, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 29, 3, 12, 2, 10772, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 30, 4, 13, 1, 10522, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 30, 7, 13, 2, 10891, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 30, 8, 13, 2, 10534, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 31, 2, 14, 1, 11070, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 31, 3, 14, 2, 10536, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 33, 3, 15, 2, 10536, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 40, 4, 19, 1, 10522, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 40, 8, 19, 2, 10534, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 44, 4, 20, 1, 10284, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 52, 8, 24, 2, 10862, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 54, 8, 25, 2, 10534, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 56, 7, 26, 1, 10497, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 59, 3, 28, 2, 10772, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 60, 3, 28, 2, 10536, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 60, 4, 28, 1, 10284, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 64, 4, 12, 1, 10343, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 64, 9, 12, 2, 10557, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 67, 4, 16, 1, 10284, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 68, 4, 8, 1, 10343, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 69, 7, 15, 2, 10593, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 72, 7, 14, 1, 10497, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 75, 9, 12, 2, 10557, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 76, 4, 23, 1, 10343, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 76, 7, 23, 2, 10593, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LEHMS', 77, 7, 12, 1, 10497, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 15, 1, 6, 2, 10579, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 18, 8, 7, 2, 10719, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 21, 4, 8, 2, 10884, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 30, 8, 13, 2, 10719, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 54, 8, 25, 2, 10719, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 56, 4, 26, 2, 10884, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 61, 6, 29, 2, 10735, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 65, 4, 2, 2, 10884, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 75, 1, 12, 2, 10579, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LETSS', 77, 6, 12, 2, 10735, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 7, 1, 3, 1, 11071, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 10, 1, 4, 3, 10357, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 11, 5, 5, 2, 10823, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 11, 6, 5, 1, 10296, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 12, 8, 5, 2, 10543, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 13, 1, 6, 1, 11071, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 15, 3, 6, 3, 10283, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 16, 6, 7, 1, 10296, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 19, 3, 8, 3, 10283, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 21, 1, 8, 3, 10461, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 23, 8, 9, 2, 10543, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 26, 1, 11, 3, 10357, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 26, 3, 11, 1, 10330, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 28, 4, 12, 2, 10499, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 30, 1, 13, 3, 10461, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 30, 8, 13, 1, 11065, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 32, 8, 14, 2, 10997, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 39, 5, 18, 3, 10899, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 46, 8, 21, 2, 10997, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 49, 4, 23, 2, 10499, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 52, 8, 24, 2, 10997, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 54, 8, 25, 1, 11065, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 55, 1, 25, 3, 10461, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 57, 5, 26, 2, 10823, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 59, 5, 28, 2, 10823, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 60, 1, 28, 3, 10357, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 60, 3, 28, 3, 10283, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 69, 6, 15, 1, 10296, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 70, 2, 7, 1, 10780, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 72, 3, 14, 1, 10330, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 72, 3, 14, 3, 10283, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 74, 3, 4, 3, 10381, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 77, 2, 12, 1, 10780, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LILAS', 77, 5, 12, 2, 10823, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 1, 3, 1, 3, 10838, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 1, 8, 1, 3, 10729, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 2, 4, 1, 2, 10485, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 3, 1, 1, 1, 10405, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 3, 4, 1, 2, 10485, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 16, 2, 7, 2, 10919, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 16, 5, 7, 1, 10954, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 18, 3, 7, 3, 10838, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 19, 3, 8, 1, 10697, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 19, 8, 8, 1, 10811, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 21, 8, 8, 3, 10729, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 23, 8, 9, 1, 10811, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 25, 2, 11, 2, 10919, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 25, 4, 11, 2, 10840, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 28, 1, 12, 2, 11039, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 31, 5, 14, 1, 10954, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 35, 1, 16, 2, 11039, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 35, 3, 16, 1, 10697, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 36, 3, 17, 3, 10838, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 39, 4, 18, 2, 10840, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 40, 2, 19, 2, 10919, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 40, 8, 19, 1, 10811, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 41, 2, 19, 3, 11014, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 45, 3, 21, 1, 10638, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 45, 5, 21, 1, 10954, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 49, 1, 23, 2, 11039, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 50, 8, 23, 3, 10729, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 55, 4, 25, 2, 10485, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 57, 1, 26, 2, 11039, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 58, 3, 27, 1, 10697, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 60, 5, 28, 1, 10954, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 65, 3, 2, 1, 10638, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 70, 3, 7, 1, 10697, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 70, 4, 7, 2, 10485, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LINOD', 72, 3, 14, 1, 10638, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 1, 6, 1, 1, 10317, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 12, 4, 5, 2, 11018, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 18, 4, 7, 2, 11018, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 24, 8, 10, 3, 10883, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 28, 4, 12, 1, 10544, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 51, 1, 24, 2, 10665, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 53, 6, 24, 1, 10867, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 56, 4, 26, 2, 11018, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 59, 1, 28, 2, 10665, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 62, 2, 29, 2, 10307, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 67, 4, 16, 1, 10544, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 68, 2, 8, 2, 10307, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 68, 3, 8, 2, 10662, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'LONEP', 76, 1, 23, 2, 10665, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 2, 2, 1, 2, 10939, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 4, 1, 2, 2, 10950, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 4, 8, 2, 3, 10635, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 5, 8, 2, 3, 10635, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 22, 8, 9, 3, 10635, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 24, 1, 10, 1, 10275, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 24, 8, 10, 2, 10467, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 25, 8, 11, 2, 10467, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 26, 2, 11, 1, 10404, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 32, 7, 14, 3, 10818, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 36, 4, 17, 3, 10784, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 39, 4, 18, 3, 10784, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 40, 6, 19, 3, 10754, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 41, 7, 19, 3, 10818, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 42, 2, 20, 1, 10404, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 49, 2, 23, 1, 10404, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 59, 1, 28, 1, 10275, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 66, 2, 2, 2, 10300, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 67, 2, 16, 2, 10939, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 68, 2, 8, 2, 10300, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAGAA', 72, 4, 14, 3, 10784, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 8, 9, 3, 2, 10978, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 21, 9, 8, 2, 10978, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 25, 4, 11, 1, 10760, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 26, 3, 11, 1, 11004, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 27, 4, 11, 1, 10760, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 28, 5, 12, 3, 10649, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 40, 9, 19, 2, 10978, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 43, 4, 20, 1, 10760, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 44, 9, 20, 2, 10978, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 45, 7, 21, 3, 10896, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 55, 5, 25, 2, 10529, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 56, 7, 26, 3, 10896, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 59, 4, 28, 2, 10892, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 68, 5, 8, 2, 10529, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 69, 5, 15, 2, 10529, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 72, 5, 14, 3, 10649, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MAISD', 76, 3, 23, 1, 11004, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 1, 4, 1, 3, 10590, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 4, 2, 2, 2, 10339, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 6, 1, 3, 1, 10618, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 10, 8, 4, 2, 10724, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 11, 3, 5, 3, 10570, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 12, 6, 5, 3, 10439, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 16, 1, 7, 2, 10605, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 16, 6, 7, 3, 10439, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 17, 2, 7, 2, 10339, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 18, 3, 7, 2, 10332, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 21, 3, 8, 3, 10619, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 22, 3, 9, 3, 10619, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 24, 8, 10, 2, 10565, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 31, 1, 14, 2, 10376, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 35, 7, 16, 2, 10424, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 38, 7, 18, 2, 10424, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 42, 3, 20, 2, 10332, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 47, 3, 22, 2, 10332, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 56, 1, 26, 1, 10618, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 56, 3, 26, 3, 10570, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 59, 1, 28, 2, 10605, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 60, 1, 28, 2, 10605, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 61, 8, 29, 2, 10724, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 62, 2, 29, 2, 10339, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 62, 3, 29, 3, 10505, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 64, 6, 12, 3, 10439, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 64, 8, 12, 2, 10565, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 68, 1, 8, 1, 10618, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 68, 7, 8, 2, 10424, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 71, 1, 15, 2, 10605, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 74, 6, 4, 3, 10439, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MEREP', 77, 4, 12, 3, 10590, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 13, 4, 6, 1, 10945, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 16, 3, 7, 2, 10779, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 28, 2, 12, 3, 10277, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 31, 4, 14, 1, 10945, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 47, 3, 22, 3, 10699, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 59, 5, 28, 1, 10575, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 62, 2, 29, 3, 10277, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 62, 3, 29, 2, 10779, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 63, 5, 7, 1, 10575, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 72, 5, 14, 1, 10575, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'MORGK', 76, 5, 23, 1, 10575, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'NORTS', 1, 2, 1, 3, 10752, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'NORTS', 52, 3, 24, 3, 10517, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'NORTS', 59, 3, 28, 3, 10517, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'NORTS', 69, 2, 15, 3, 10752, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'NORTS', 70, 3, 7, 3, 10517, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'NORTS', 70, 3, 7, 3, 11057, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 5, 7, 2, 2, 10958, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 7, 7, 3, 2, 10958, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 11, 8, 5, 2, 10986, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 13, 4, 6, 2, 10898, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 14, 3, 6, 1, 10409, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 20, 8, 8, 2, 10986, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 21, 3, 8, 1, 10409, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 59, 7, 28, 1, 10531, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 72, 7, 14, 2, 10958, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 76, 8, 23, 2, 10986, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OCEAN', 77, 8, 12, 2, 10986, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 16, 1, 7, 1, 10680, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 16, 3, 7, 1, 10855, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 16, 8, 7, 3, 10706, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 17, 4, 7, 3, 10338, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 18, 8, 7, 3, 10305, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 21, 8, 8, 1, 11034, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 27, 3, 11, 2, 10441, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 29, 8, 12, 3, 10305, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 30, 4, 13, 3, 10338, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 31, 1, 14, 1, 10680, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 31, 3, 14, 1, 10855, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 39, 8, 18, 3, 10305, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 42, 1, 20, 1, 10680, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 43, 8, 20, 3, 10706, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 44, 8, 20, 1, 11034, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 51, 6, 24, 3, 10965, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 52, 3, 24, 2, 10594, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 56, 2, 26, 3, 10808, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 56, 3, 26, 1, 10855, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 58, 3, 27, 2, 10594, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 59, 8, 28, 3, 10706, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 61, 8, 29, 1, 11034, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 65, 3, 2, 1, 10855, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OLDWO', 76, 2, 23, 3, 10808, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 2, 4, 1, 1, 10766, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 7, 4, 3, 1, 10766, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 7, 6, 3, 2, 10833, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 10, 2, 4, 2, 11020, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 11, 2, 5, 2, 10407, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 13, 1, 6, 2, 10508, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 14, 4, 6, 3, 10580, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 16, 4, 7, 3, 10554, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 23, 4, 9, 3, 10554, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 31, 6, 14, 2, 10833, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 39, 1, 18, 2, 10508, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 40, 3, 19, 1, 10684, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 41, 4, 19, 1, 10260, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 41, 4, 19, 3, 10580, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 41, 6, 19, 2, 10999, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 47, 3, 22, 1, 10684, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 51, 6, 24, 2, 10999, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 53, 6, 24, 2, 10833, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 57, 4, 26, 1, 10260, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 60, 3, 28, 1, 10684, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 62, 4, 29, 1, 10260, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 62, 4, 29, 3, 10554, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 65, 4, 2, 3, 10580, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 68, 4, 8, 1, 10766, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 69, 2, 15, 2, 10407, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 70, 4, 7, 1, 10260, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 71, 2, 15, 2, 10407, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 77, 4, 12, 3, 10554, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'OTTIK', 77, 6, 12, 2, 10999, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 1, 8, 1, 3, 10354, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 11, 2, 5, 2, 11073, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 14, 5, 6, 2, 10474, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 24, 2, 10, 2, 11073, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 28, 5, 12, 2, 10474, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 29, 8, 12, 3, 10354, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 40, 5, 19, 2, 10474, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 45, 2, 21, 1, 10502, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 51, 1, 24, 3, 10995, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 52, 7, 24, 3, 10322, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 53, 2, 24, 1, 10502, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 60, 1, 28, 3, 10995, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 67, 2, 16, 1, 10502, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PERIC', 75, 5, 12, 2, 10474, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 11, 6, 5, 2, 10489, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 11, 7, 5, 3, 10353, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 14, 4, 6, 2, 10427, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 16, 6, 7, 2, 10489, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 17, 2, 7, 1, 10686, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 17, 3, 7, 2, 10530, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 18, 2, 7, 2, 11053, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 22, 8, 9, 2, 10844, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 24, 7, 10, 3, 10597, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 26, 2, 11, 1, 10686, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 31, 6, 14, 1, 10747, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 32, 2, 14, 2, 11053, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 38, 7, 18, 3, 10353, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 41, 6, 19, 1, 10747, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 43, 3, 20, 2, 10530, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 57, 7, 26, 3, 10597, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 61, 3, 29, 2, 10530, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 63, 6, 7, 1, 10747, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 64, 2, 12, 2, 11053, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 65, 7, 2, 3, 10597, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 69, 2, 15, 3, 10392, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 69, 6, 15, 1, 10747, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PICCO', 76, 3, 23, 2, 10530, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 1, 5, 1, 2, 10477, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 4, 7, 2, 2, 10336, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 8, 8, 3, 2, 11007, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 21, 5, 8, 1, 10397, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 21, 5, 8, 2, 10477, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 29, 8, 12, 2, 11007, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 39, 5, 18, 2, 10477, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 42, 8, 20, 2, 11007, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 51, 5, 24, 1, 10397, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'PRINI', 56, 3, 26, 3, 10433, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 6, 2, 3, 1, 10989, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 11, 2, 5, 1, 10989, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 13, 6, 6, 2, 10291, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 14, 6, 6, 1, 10794, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 19, 4, 8, 2, 10647, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 19, 8, 8, 1, 10421, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 21, 4, 8, 2, 10261, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 26, 1, 11, 1, 10587, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 26, 8, 11, 1, 10421, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 35, 1, 16, 1, 10587, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 35, 4, 16, 2, 10261, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 35, 8, 16, 2, 10720, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 39, 4, 18, 2, 10647, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 41, 2, 19, 1, 10379, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 41, 2, 19, 1, 10989, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 44, 6, 20, 2, 10291, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 51, 6, 24, 2, 10291, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 53, 8, 24, 1, 10421, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 54, 6, 25, 1, 10794, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 63, 2, 7, 1, 10379, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 65, 2, 2, 1, 10379, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 71, 8, 15, 2, 10720, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 77, 1, 12, 1, 10587, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEDE', 77, 8, 12, 1, 10421, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 1, 7, 1, 1, 10406, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 4, 4, 2, 1, 10913, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 4, 6, 2, 1, 10704, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 8, 8, 3, 1, 10786, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 11, 6, 5, 1, 10637, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 19, 2, 8, 2, 10487, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 20, 5, 8, 2, 10372, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 21, 7, 8, 1, 10406, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 24, 6, 10, 1, 10704, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 26, 2, 11, 2, 10487, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 26, 7, 11, 2, 10868, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 28, 7, 12, 1, 10406, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 28, 8, 12, 2, 11068, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 30, 4, 13, 2, 10728, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 30, 8, 13, 1, 10786, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 31, 7, 14, 2, 10659, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 33, 4, 15, 1, 10913, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 35, 7, 16, 2, 10868, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 36, 7, 17, 1, 10406, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 38, 5, 18, 2, 10372, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 40, 4, 19, 2, 10728, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 40, 7, 19, 1, 10406, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 40, 7, 19, 2, 10659, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 43, 8, 20, 2, 11068, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 48, 6, 22, 1, 10704, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 49, 7, 23, 2, 10868, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 50, 6, 23, 1, 10637, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 52, 8, 24, 1, 10961, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 54, 2, 25, 2, 10487, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 55, 4, 25, 2, 10728, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 56, 6, 26, 1, 10637, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 58, 4, 27, 1, 10913, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 60, 4, 28, 2, 10728, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 60, 5, 28, 2, 10372, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 70, 7, 7, 2, 10659, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 71, 6, 15, 1, 10914, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 72, 5, 14, 2, 10372, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 75, 8, 12, 1, 10786, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 76, 8, 23, 1, 10961, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUEEN', 77, 8, 12, 2, 11068, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 1, 1, 1, 2, 10285, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 1, 2, 1, 2, 10691, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 2, 1, 1, 1, 10991, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 2, 3, 1, 1, 11021, 11, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 2, 4, 1, 1, 10418, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 3, 3, 1, 3, 10540, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 4, 7, 2, 1, 10527, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 7, 8, 3, 2, 10962, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 7, 8, 3, 3, 10694, 90, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 8, 2, 3, 2, 10345, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 9, 2, 4, 1, 10515, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 10, 3, 4, 3, 10273, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 13, 3, 6, 2, 10938, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 13, 8, 6, 2, 10962, 77, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 16, 2, 7, 1, 10515, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 18, 2, 7, 3, 10588, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 18, 9, 7, 1, 10745, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 19, 1, 8, 2, 10788, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 19, 2, 8, 2, 10345, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 20, 3, 8, 1, 11021, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 20, 4, 8, 1, 10878, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 21, 4, 8, 1, 10658, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 23, 8, 9, 1, 10845, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 26, 3, 11, 1, 11021, 63, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 26, 3, 11, 3, 10540, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 27, 2, 11, 1, 10515, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 29, 2, 12, 2, 10691, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 31, 3, 14, 3, 10273, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 31, 5, 14, 1, 10549, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 33, 2, 15, 1, 10515, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 33, 3, 15, 3, 10273, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 35, 8, 16, 1, 10845, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 35, 8, 16, 3, 10286, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 36, 2, 17, 2, 10313, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 36, 7, 17, 1, 10527, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 38, 2, 18, 1, 10865, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 38, 3, 18, 3, 10540, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 39, 1, 18, 2, 10361, 54, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 39, 2, 18, 1, 10865, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 40, 1, 19, 2, 10285, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 40, 3, 19, 3, 10273, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 40, 4, 19, 1, 10658, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 42, 2, 20, 2, 10345, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 42, 2, 20, 3, 10588, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 42, 4, 20, 2, 10996, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 42, 8, 20, 1, 10845, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 43, 2, 20, 2, 10691, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 43, 3, 20, 2, 10938, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 44, 2, 20, 2, 10691, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 44, 5, 20, 3, 10721, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 44, 9, 20, 1, 10745, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 45, 5, 21, 1, 10549, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 47, 4, 22, 1, 10418, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 51, 3, 24, 1, 11021, 44, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 51, 5, 24, 1, 10549, 48, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 53, 1, 24, 2, 10285, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 53, 8, 24, 2, 10962, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 55, 4, 25, 3, 10451, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 58, 8, 27, 1, 10845, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 59, 8, 28, 3, 10694, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 59, 9, 28, 1, 10745, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 60, 1, 28, 2, 10361, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 60, 2, 28, 1, 10515, 84, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 60, 3, 28, 2, 10938, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 60, 4, 28, 1, 10658, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 61, 4, 29, 1, 10418, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 62, 2, 29, 2, 10691, 48, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 62, 8, 29, 3, 10286, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 64, 4, 12, 3, 10451, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 64, 8, 12, 1, 10845, 48, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 65, 3, 2, 3, 10765, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 65, 4, 2, 3, 10451, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 68, 3, 8, 3, 10540, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 69, 8, 15, 2, 10962, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 70, 1, 7, 1, 10991, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 70, 8, 7, 3, 10694, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 71, 3, 15, 2, 10938, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 72, 3, 14, 1, 11021, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 72, 9, 14, 1, 10745, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 74, 4, 4, 1, 10418, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 75, 1, 12, 2, 10788, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 76, 1, 23, 1, 10991, 90, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 76, 3, 23, 3, 10273, 33, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 76, 8, 23, 2, 10962, 44, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 77, 4, 12, 1, 10658, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'QUICK', 77, 4, 12, 3, 10451, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 16, 1, 7, 2, 10916, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 20, 9, 8, 1, 10828, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 21, 4, 8, 2, 10716, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 26, 4, 11, 2, 10448, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 32, 1, 14, 2, 10916, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 38, 9, 18, 1, 10828, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 40, 4, 19, 2, 10448, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 46, 6, 21, 3, 11019, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 49, 6, 23, 3, 11019, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 51, 4, 24, 2, 10716, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 57, 1, 26, 2, 10916, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RANCH', 61, 4, 29, 2, 10716, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 1, 4, 1, 2, 10294, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 2, 1, 1, 2, 11077, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 2, 8, 1, 1, 10852, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 3, 1, 1, 2, 11077, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 4, 1, 2, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 4, 2, 2, 3, 11000, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 5, 8, 2, 3, 10262, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 6, 1, 3, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 7, 1, 3, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 7, 3, 3, 2, 10988, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 7, 8, 3, 3, 10262, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 8, 1, 3, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 10, 1, 4, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 11, 9, 5, 3, 10889, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 12, 1, 5, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 13, 1, 6, 2, 11077, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 14, 1, 6, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 16, 1, 7, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 17, 3, 7, 3, 10346, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 17, 4, 7, 2, 10294, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 17, 4, 7, 3, 10564, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 17, 8, 7, 1, 10852, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 20, 1, 8, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 20, 6, 8, 2, 10272, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 23, 1, 9, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 24, 2, 10, 3, 11000, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 25, 5, 11, 2, 10761, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 27, 1, 11, 3, 10598, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 30, 1, 13, 1, 10401, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 31, 4, 14, 3, 10564, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 31, 5, 14, 1, 10569, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 31, 6, 14, 2, 10272, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 32, 1, 14, 2, 10314, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 32, 1, 14, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 38, 3, 18, 3, 10479, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 38, 9, 18, 3, 10889, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 39, 1, 18, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 41, 1, 19, 2, 11077, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 41, 1, 19, 3, 10316, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 43, 4, 20, 2, 10294, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 46, 1, 21, 2, 11077, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 52, 1, 24, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 53, 3, 24, 3, 10479, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 55, 1, 25, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 55, 4, 25, 3, 10564, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 56, 1, 26, 1, 10401, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 56, 3, 26, 2, 10820, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 56, 3, 26, 3, 10346, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 56, 8, 26, 3, 10262, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 58, 1, 27, 2, 10314, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 59, 3, 28, 3, 10479, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 60, 1, 28, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 60, 4, 28, 2, 10294, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 62, 1, 29, 2, 10314, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 62, 1, 29, 3, 10316, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 62, 3, 29, 2, 10988, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 62, 8, 29, 1, 10852, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 64, 1, 12, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 64, 3, 12, 3, 10479, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 65, 1, 2, 1, 10401, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 66, 1, 2, 2, 11077, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 71, 1, 15, 1, 10401, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 71, 1, 15, 3, 10598, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 72, 6, 14, 2, 10272, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 73, 1, 17, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 75, 1, 12, 2, 11077, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 75, 4, 12, 2, 10294, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 75, 5, 12, 2, 10761, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 76, 5, 23, 1, 10569, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 77, 1, 12, 2, 11077, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RATTC', 77, 2, 12, 3, 11000, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 7, 2, 3, 2, 11010, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 7, 4, 3, 2, 10908, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 11, 8, 5, 1, 10443, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 17, 2, 7, 1, 10727, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 24, 2, 10, 2, 11010, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 28, 8, 12, 1, 10443, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 31, 5, 14, 1, 10812, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 33, 1, 15, 1, 10562, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 41, 1, 19, 2, 10655, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 46, 7, 21, 1, 10428, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 49, 9, 23, 3, 10942, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 52, 4, 24, 2, 10908, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 52, 9, 24, 1, 10586, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 53, 4, 24, 2, 11062, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 54, 4, 25, 1, 10288, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 56, 2, 26, 1, 10727, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 59, 2, 28, 1, 10727, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 62, 1, 29, 1, 10562, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 68, 4, 8, 1, 10288, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 70, 4, 7, 2, 11062, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 72, 5, 14, 1, 10812, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'REGGC', 77, 5, 12, 1, 10812, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 2, 1, 1, 1, 10813, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 2, 4, 1, 3, 10622, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 2, 5, 1, 1, 10851, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 13, 2, 6, 2, 11059, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 16, 1, 7, 1, 10877, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 16, 8, 7, 3, 10287, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 17, 2, 7, 2, 11059, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 18, 1, 7, 1, 10877, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 19, 4, 8, 2, 10299, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 19, 4, 8, 2, 10447, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 22, 5, 9, 2, 10648, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 24, 5, 10, 2, 10648, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 25, 5, 11, 1, 10851, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 34, 8, 16, 3, 10287, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 36, 2, 17, 2, 10563, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 46, 1, 21, 1, 10813, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 46, 8, 21, 3, 10287, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 49, 8, 23, 2, 10481, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 52, 2, 24, 2, 10563, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 57, 5, 26, 1, 10851, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 59, 5, 28, 1, 10851, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 60, 2, 28, 2, 11059, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 60, 8, 28, 2, 10481, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 65, 4, 2, 2, 10447, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 68, 4, 8, 3, 10622, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 70, 4, 7, 2, 10299, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICAR', 71, 4, 15, 2, 10447, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 2, 8, 1, 2, 11075, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 2, 9, 1, 3, 10255, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 13, 4, 6, 2, 10931, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 16, 9, 7, 3, 10255, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 26, 3, 11, 3, 10751, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 26, 3, 11, 3, 10758, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 29, 7, 12, 2, 10666, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 30, 3, 13, 3, 10751, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 31, 1, 14, 1, 10537, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 33, 9, 15, 2, 10951, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 36, 9, 17, 3, 10255, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 41, 9, 19, 2, 10951, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 46, 8, 21, 2, 11075, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 50, 3, 23, 3, 10751, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 51, 1, 24, 1, 10537, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 52, 3, 24, 3, 10758, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 53, 7, 24, 3, 11033, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 57, 4, 26, 2, 10931, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 58, 1, 27, 1, 10537, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 59, 9, 28, 3, 10255, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 60, 4, 28, 2, 10419, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 65, 7, 2, 2, 10666, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 69, 4, 15, 2, 10419, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 69, 7, 15, 3, 11033, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 70, 3, 7, 3, 10758, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 72, 1, 14, 1, 10537, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 73, 1, 17, 1, 10537, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 73, 3, 17, 3, 10751, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 75, 9, 12, 2, 10951, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'RICSU', 76, 8, 23, 2, 11075, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 19, 4, 8, 1, 10281, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 23, 2, 9, 1, 11013, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 24, 4, 10, 1, 10281, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 30, 1, 13, 3, 10306, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 30, 4, 13, 1, 10282, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 30, 4, 13, 2, 10917, 1, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 35, 4, 16, 1, 10281, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 42, 2, 20, 1, 11013, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 45, 2, 21, 1, 11013, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 53, 1, 24, 3, 10306, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 54, 1, 25, 3, 10306, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 57, 4, 26, 1, 10282, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 60, 4, 28, 2, 10917, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'ROMEY', 68, 2, 8, 1, 11013, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 7, 1, 3, 2, 10909, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 16, 1, 7, 2, 10909, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 18, 7, 7, 3, 10639, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 19, 3, 8, 2, 10831, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 24, 1, 10, 2, 10387, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 24, 7, 10, 1, 10520, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 28, 1, 12, 2, 10387, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 30, 2, 13, 2, 11015, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 35, 3, 16, 2, 10831, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 38, 3, 18, 2, 10831, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 41, 1, 19, 2, 10909, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 43, 3, 20, 2, 10831, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 53, 7, 24, 1, 10520, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 59, 1, 28, 2, 10387, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 71, 1, 15, 2, 10387, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SANTG', 77, 2, 12, 2, 11015, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 1, 3, 1, 1, 10700, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 1, 4, 1, 3, 10847, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 1, 6, 1, 2, 11031, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 2, 1, 1, 3, 10393, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 2, 4, 1, 2, 10440, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 2, 5, 1, 3, 10714, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 2, 7, 1, 2, 11030, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 2, 8, 1, 1, 10722, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 5, 7, 2, 2, 11030, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 7, 5, 3, 1, 10607, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 10, 1, 4, 1, 10713, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 10, 1, 4, 2, 10612, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 12, 7, 5, 3, 10678, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 13, 1, 6, 1, 10894, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 13, 2, 6, 2, 10983, 84, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 13, 4, 6, 1, 11002, 56, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 13, 6, 6, 2, 11031, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 14, 1, 6, 3, 10393, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 14, 6, 6, 3, 10555, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 15, 2, 6, 2, 10657, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 16, 1, 7, 3, 10984, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 16, 4, 7, 2, 10440, 49, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 16, 9, 7, 1, 10324, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 17, 1, 7, 1, 11064, 77, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 17, 5, 7, 1, 10607, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 17, 5, 7, 3, 10714, 27, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 19, 4, 8, 3, 10847, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 19, 5, 8, 2, 10711, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 19, 6, 8, 3, 10555, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 22, 8, 9, 2, 10603, 48, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 23, 3, 9, 1, 10748, 44, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 24, 1, 10, 3, 10984, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 24, 6, 10, 2, 11031, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 24, 6, 10, 3, 10555, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 25, 1, 11, 3, 10393, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 26, 1, 11, 1, 10713, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 26, 1, 11, 3, 10393, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 28, 8, 12, 1, 10452, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 29, 4, 12, 2, 10440, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 29, 6, 12, 3, 10510, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 29, 7, 12, 2, 11030, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 31, 1, 14, 3, 10393, 32, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 31, 7, 14, 2, 10941, 44, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 31, 8, 14, 1, 10722, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 33, 2, 15, 3, 10815, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 33, 5, 15, 1, 10607, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 33, 7, 15, 3, 10678, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 34, 3, 16, 1, 10700, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 34, 6, 16, 1, 10757, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 35, 2, 16, 3, 10398, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 35, 4, 16, 1, 11002, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 35, 9, 16, 1, 10324, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 36, 1, 17, 2, 10612, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 36, 1, 17, 3, 10984, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 37, 4, 17, 3, 10847, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 40, 3, 19, 1, 10748, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 40, 5, 19, 1, 10607, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 41, 1, 19, 1, 11064, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 41, 2, 19, 2, 10657, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 41, 5, 19, 2, 10711, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 41, 7, 19, 3, 10678, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 42, 4, 20, 1, 11002, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 42, 4, 20, 3, 10882, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 44, 8, 20, 1, 10452, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 45, 1, 21, 1, 10713, 110, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 45, 4, 21, 3, 10847, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 46, 1, 21, 1, 10713, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 46, 2, 21, 2, 10657, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 46, 9, 21, 1, 10324, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 47, 2, 22, 2, 10657, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 47, 5, 22, 3, 10714, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 49, 1, 23, 2, 10612, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 49, 4, 23, 3, 10882, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 49, 8, 23, 2, 10603, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 51, 6, 24, 3, 10555, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 53, 1, 24, 1, 11064, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 53, 5, 24, 2, 10711, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 54, 4, 25, 3, 10882, 32, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 54, 7, 25, 3, 10678, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 55, 1, 25, 1, 11064, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 55, 2, 25, 3, 10398, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 55, 4, 25, 1, 11002, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 56, 2, 26, 2, 10657, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 56, 3, 26, 1, 10748, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 56, 5, 26, 3, 10714, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 56, 6, 26, 3, 10555, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 57, 2, 26, 2, 10983, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 58, 5, 27, 3, 10714, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 59, 6, 28, 1, 10757, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 59, 7, 28, 2, 11030, 100, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 59, 9, 28, 1, 10324, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 60, 1, 28, 2, 10612, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 60, 2, 28, 2, 10657, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 60, 4, 28, 3, 10847, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 61, 4, 29, 2, 10440, 90, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 62, 6, 29, 1, 10757, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 62, 7, 29, 2, 10941, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 62, 8, 29, 3, 10627, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 63, 9, 7, 1, 10324, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 64, 6, 12, 1, 10757, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 64, 6, 12, 2, 11031, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 68, 1, 8, 1, 11064, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 68, 3, 8, 1, 10700, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 68, 7, 8, 2, 10941, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 68, 8, 8, 1, 10722, 45, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 69, 1, 15, 1, 10894, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 71, 3, 15, 1, 10700, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 71, 4, 15, 3, 10847, 55, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 71, 6, 15, 2, 11031, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 72, 5, 14, 1, 10607, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 72, 7, 14, 2, 10941, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 73, 8, 17, 3, 10627, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 75, 1, 12, 1, 10894, 120, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 75, 6, 12, 3, 10510, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 75, 8, 12, 1, 10722, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SAVEA', 76, 1, 23, 2, 10612, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 1, 5, 1, 1, 10869, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 10, 6, 4, 2, 10804, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 11, 1, 5, 3, 10800, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 11, 5, 5, 1, 10869, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 16, 5, 7, 3, 10359, 56, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 17, 7, 7, 2, 10523, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 20, 7, 8, 2, 10523, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 23, 5, 9, 1, 10869, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 24, 8, 10, 1, 10472, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 28, 1, 12, 3, 10377, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 28, 6, 12, 2, 10804, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 31, 5, 14, 3, 10359, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 32, 3, 14, 2, 10547, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 36, 3, 17, 2, 10547, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 37, 7, 17, 2, 10523, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 39, 1, 18, 3, 10377, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 41, 7, 19, 2, 10523, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 45, 2, 21, 1, 10388, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 49, 6, 23, 2, 10804, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 51, 1, 24, 3, 10800, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 51, 8, 24, 1, 10472, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 52, 2, 24, 1, 10388, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 53, 2, 24, 1, 10388, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 54, 1, 25, 3, 10800, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 60, 5, 28, 3, 10359, 80, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SEVES', 68, 5, 8, 1, 10869, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 16, 7, 7, 2, 11074, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 21, 7, 8, 3, 10642, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 30, 4, 13, 2, 10802, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 33, 7, 15, 3, 10341, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 36, 2, 17, 1, 10669, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 38, 4, 18, 3, 10417, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 46, 4, 21, 3, 10417, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 51, 4, 24, 2, 10802, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 55, 4, 25, 2, 10802, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 59, 7, 28, 3, 10341, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 61, 7, 29, 3, 10642, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 62, 4, 29, 2, 10802, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 68, 4, 8, 3, 10417, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 72, 2, 14, 1, 10556, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SIMOB', 77, 4, 12, 3, 10417, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPECD', 11, 5, 5, 2, 11043, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPECD', 16, 2, 7, 1, 10738, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPECD', 18, 3, 7, 2, 10964, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPECD', 38, 3, 18, 2, 10964, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPECD', 69, 3, 15, 2, 10964, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPECD', 75, 6, 12, 3, 10907, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 7, 1, 3, 2, 10385, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 18, 8, 7, 2, 10756, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 19, 4, 8, 2, 10329, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 26, 3, 11, 2, 10432, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 29, 8, 12, 2, 10369, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 30, 4, 13, 2, 10329, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 33, 6, 15, 2, 10271, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 35, 1, 16, 1, 10821, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 36, 8, 17, 2, 10756, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 38, 4, 18, 2, 10329, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 51, 1, 24, 1, 10821, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 54, 3, 25, 2, 10432, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 54, 7, 25, 1, 10349, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 56, 4, 26, 2, 10329, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 56, 8, 26, 2, 10369, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 60, 1, 28, 2, 10385, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 63, 3, 7, 3, 10974, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 68, 1, 8, 2, 10385, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 68, 8, 8, 2, 10756, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SPLIR', 69, 8, 15, 2, 10756, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 1, 2, 1, 2, 11035, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 2, 6, 1, 3, 10885, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 4, 2, 2, 3, 10846, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 10, 5, 4, 2, 10841, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 17, 4, 7, 2, 10302, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 19, 5, 8, 3, 10463, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 20, 4, 8, 2, 10252, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 21, 4, 8, 3, 10930, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 24, 6, 10, 3, 10885, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 26, 7, 11, 3, 10458, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 27, 4, 11, 3, 10930, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 28, 4, 12, 2, 10302, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 28, 7, 12, 3, 10458, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 31, 9, 14, 1, 10475, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 33, 4, 15, 2, 10252, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 35, 2, 16, 2, 11035, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 40, 1, 19, 2, 11038, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 42, 2, 20, 2, 11035, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 42, 4, 20, 3, 10767, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 42, 5, 20, 3, 10463, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 43, 4, 20, 2, 10302, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 43, 7, 20, 3, 10458, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 52, 1, 24, 2, 11038, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 54, 2, 25, 2, 11035, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 55, 4, 25, 3, 10930, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 56, 5, 26, 2, 10841, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 56, 7, 26, 3, 10458, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 58, 4, 27, 3, 10930, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 59, 5, 28, 2, 10841, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 60, 4, 28, 2, 10252, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 66, 9, 2, 1, 10475, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 70, 2, 7, 3, 10846, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 70, 6, 7, 3, 10885, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 71, 1, 15, 2, 11038, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 71, 7, 15, 3, 10458, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 74, 2, 4, 3, 10846, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 76, 9, 23, 1, 10475, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 77, 5, 12, 2, 10841, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'SUPRD', 77, 6, 12, 3, 10885, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 5, 6, 2, 2, 10708, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 16, 8, 7, 2, 10310, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 34, 2, 16, 3, 10805, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 36, 6, 17, 2, 10708, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 38, 2, 18, 3, 10805, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 62, 8, 29, 2, 10310, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THEBI', 72, 1, 14, 3, 10992, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 1, 3, 1, 3, 11003, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 10, 7, 4, 1, 10775, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 28, 4, 12, 2, 10624, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 29, 4, 12, 2, 10624, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 40, 3, 19, 3, 11003, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 44, 4, 20, 2, 10624, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 52, 3, 24, 3, 11003, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'THECR', 67, 7, 16, 1, 10775, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 14, 6, 6, 1, 10249, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 19, 2, 8, 2, 10967, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 19, 3, 8, 2, 10438, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 19, 6, 8, 1, 10446, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 24, 6, 10, 1, 10446, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 31, 6, 14, 1, 10446, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 34, 3, 16, 2, 10438, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 34, 3, 16, 2, 10548, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 41, 3, 19, 2, 10548, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 49, 2, 23, 2, 10967, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 51, 6, 24, 1, 10249, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 52, 6, 24, 1, 10446, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 56, 4, 26, 2, 10608, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TOMSP', 57, 3, 26, 2, 10438, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 1, 3, 1, 3, 10576, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 10, 2, 4, 2, 10676, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 10, 8, 4, 3, 10276, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 11, 1, 5, 3, 10842, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 13, 8, 6, 3, 10276, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 17, 2, 7, 2, 10915, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 17, 7, 7, 3, 10319, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 18, 1, 7, 3, 10293, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 19, 2, 8, 2, 10676, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 24, 1, 10, 3, 10293, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 24, 4, 10, 2, 10518, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 28, 7, 12, 3, 10319, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 31, 3, 14, 3, 10576, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 33, 2, 15, 2, 10915, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 38, 4, 18, 2, 10518, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 39, 1, 18, 2, 11069, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 43, 1, 20, 3, 10842, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 44, 2, 20, 2, 10676, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 44, 3, 20, 3, 10576, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 44, 4, 20, 2, 10518, 9, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 49, 1, 23, 2, 10304, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 54, 2, 25, 2, 10915, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 59, 1, 28, 2, 10304, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 63, 1, 7, 3, 10293, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 68, 1, 8, 3, 10842, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 70, 1, 7, 3, 10842, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 71, 1, 15, 2, 10304, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 75, 1, 12, 3, 10293, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TORTU', 76, 7, 23, 3, 10319, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 4, 4, 2, 3, 10606, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 6, 4, 3, 2, 10830, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 20, 1, 8, 2, 10292, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 29, 1, 12, 3, 10834, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 30, 1, 13, 3, 10834, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 31, 7, 14, 2, 10496, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 39, 4, 18, 2, 10830, 28, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 55, 4, 25, 3, 10606, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 58, 3, 27, 3, 10839, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 60, 4, 28, 2, 10830, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 62, 4, 29, 3, 10606, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 68, 4, 8, 2, 10830, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRADH', 72, 3, 14, 3, 10839, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 33, 4, 15, 2, 10574, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 39, 9, 18, 2, 10577, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 40, 4, 19, 2, 10574, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 62, 4, 29, 2, 10574, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 62, 6, 29, 3, 10822, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 64, 4, 12, 2, 10574, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 70, 6, 7, 3, 10822, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 75, 9, 12, 2, 10577, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'TRAIH', 77, 9, 12, 2, 10577, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 3, 1, 1, 1, 10591, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 7, 1, 3, 1, 10591, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 10, 1, 4, 2, 10946, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 10, 4, 4, 2, 10688, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 24, 1, 10, 2, 10946, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 24, 1, 10, 3, 10465, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 28, 4, 12, 2, 10688, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 29, 1, 12, 3, 10465, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 34, 4, 16, 2, 10688, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 34, 7, 16, 3, 10367, 36, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 35, 1, 16, 1, 10921, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 40, 1, 19, 3, 10465, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 40, 6, 19, 1, 10744, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 41, 3, 19, 1, 10769, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 45, 1, 21, 3, 10465, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 50, 1, 23, 3, 10465, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 52, 3, 24, 1, 10769, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 54, 1, 25, 1, 10591, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 54, 7, 25, 3, 10367, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 59, 2, 28, 3, 10994, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 61, 3, 29, 1, 10769, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 62, 3, 29, 1, 10769, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 63, 1, 7, 1, 10921, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 65, 7, 2, 3, 10367, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 68, 8, 8, 3, 10399, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 71, 8, 15, 3, 10399, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 76, 8, 23, 3, 10399, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 77, 1, 12, 2, 10946, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 77, 7, 12, 3, 10367, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 77, 8, 12, 2, 10602, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VAFFE', 77, 8, 12, 3, 10399, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 2, 3, 1, 2, 10806, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 7, 1, 3, 3, 10546, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 7, 4, 3, 2, 10459, 16, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 10, 2, 4, 3, 10478, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 10, 8, 4, 2, 10450, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 22, 3, 9, 1, 10251, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 25, 1, 11, 1, 10850, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 33, 1, 15, 1, 10850, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 35, 1, 16, 3, 10546, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 41, 3, 19, 3, 10814, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 43, 3, 20, 3, 10814, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 46, 4, 21, 2, 10459, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 48, 3, 22, 3, 10814, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 51, 4, 24, 2, 10843, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 52, 8, 24, 2, 10334, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 54, 8, 25, 2, 10450, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 57, 3, 26, 1, 10251, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 61, 3, 29, 3, 10814, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 62, 1, 29, 3, 10546, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 65, 3, 2, 1, 10251, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 65, 3, 2, 2, 10806, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 68, 8, 8, 2, 10334, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 70, 1, 7, 1, 10850, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 72, 4, 14, 2, 10459, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VICTE', 74, 3, 4, 2, 10806, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 13, 2, 6, 2, 10737, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 36, 3, 17, 3, 10739, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 41, 2, 19, 2, 10737, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 52, 3, 24, 3, 10739, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 56, 2, 26, 2, 10295, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 71, 6, 15, 1, 10274, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'VINET', 72, 6, 14, 1, 10274, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 1, 4, 1, 2, 10348, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 2, 8, 1, 1, 10632, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 12, 8, 5, 2, 11046, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 19, 8, 8, 2, 10651, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 21, 7, 8, 1, 10513, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 22, 8, 9, 2, 10651, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 23, 4, 9, 2, 10348, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 28, 2, 12, 2, 10312, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 31, 1, 14, 2, 10668, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 31, 6, 14, 2, 10356, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 32, 7, 14, 1, 10513, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 32, 8, 14, 2, 11046, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 33, 8, 15, 1, 10632, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 35, 8, 16, 2, 11046, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 40, 8, 19, 2, 10301, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 43, 2, 20, 2, 10312, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 53, 2, 24, 2, 10312, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 55, 1, 25, 2, 10668, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 55, 6, 25, 2, 10356, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 56, 8, 26, 2, 10301, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 61, 7, 29, 1, 10513, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 64, 1, 12, 2, 10668, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 69, 4, 15, 1, 10640, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 69, 6, 15, 2, 10356, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 70, 4, 7, 1, 10640, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WANDK', 75, 2, 12, 2, 10312, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 1, 4, 1, 2, 10526, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 1, 6, 1, 3, 11025, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 4, 4, 2, 1, 10636, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 11, 2, 5, 2, 10553, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 12, 3, 5, 3, 10266, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 13, 4, 6, 2, 10526, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 13, 6, 6, 3, 11025, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 14, 5, 6, 3, 10333, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 14, 8, 6, 2, 10412, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 14, 9, 6, 1, 10750, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 16, 2, 7, 2, 10553, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 19, 8, 8, 3, 10416, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 21, 5, 8, 3, 10333, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 22, 2, 9, 2, 10553, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 29, 2, 12, 2, 10583, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 31, 2, 14, 2, 10553, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 35, 2, 16, 2, 10553, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 36, 1, 17, 1, 10270, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 39, 8, 18, 2, 10455, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 43, 1, 20, 1, 10270, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 45, 9, 21, 1, 10750, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 53, 8, 24, 1, 10437, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 53, 8, 24, 2, 10455, 50, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 53, 8, 24, 3, 10416, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 54, 2, 25, 3, 10781, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 56, 2, 26, 3, 10781, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 56, 4, 26, 2, 10526, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 57, 8, 26, 3, 10416, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 58, 4, 27, 1, 10636, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 59, 9, 28, 1, 10750, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 60, 2, 28, 2, 10583, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 61, 8, 29, 2, 10455, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 69, 2, 15, 2, 10583, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 71, 5, 15, 3, 10320, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 71, 5, 15, 3, 10333, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 71, 8, 15, 2, 10455, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WARTH', 74, 2, 4, 3, 10781, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 1, 4, 1, 3, 10935, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 1, 9, 1, 2, 10905, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 9, 3, 4, 1, 10420, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 13, 3, 6, 1, 10420, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 18, 3, 7, 2, 10644, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 18, 4, 7, 3, 10935, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 19, 4, 8, 1, 10803, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 23, 4, 9, 3, 10935, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 25, 4, 11, 1, 10803, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 43, 3, 20, 2, 10644, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 46, 3, 21, 2, 10644, 21, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 47, 7, 22, 1, 10585, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 52, 7, 24, 1, 10809, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 53, 3, 24, 2, 10256, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 59, 4, 28, 1, 10803, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 70, 1, 7, 2, 10900, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 70, 3, 7, 1, 10420, 8, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 73, 3, 17, 1, 10420, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WELLI', 77, 3, 12, 2, 10256, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 2, 1, 1, 1, 10469, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 2, 4, 1, 3, 10504, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 4, 4, 2, 2, 10344, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 8, 4, 3, 2, 10344, 70, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 9, 3, 4, 3, 10693, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 16, 1, 7, 1, 10469, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 16, 7, 7, 2, 11066, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 17, 4, 7, 2, 10861, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 17, 8, 7, 3, 10696, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 18, 4, 7, 2, 10861, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 19, 7, 8, 2, 11066, 42, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 21, 4, 8, 2, 10861, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 21, 4, 8, 3, 10504, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 26, 3, 11, 1, 10723, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 28, 4, 12, 2, 10740, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 33, 4, 15, 2, 10861, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 33, 5, 15, 1, 10269, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 34, 7, 16, 2, 10483, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 34, 7, 16, 2, 11066, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 35, 4, 16, 2, 10740, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 35, 5, 16, 3, 10870, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 36, 2, 17, 3, 11032, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 38, 2, 18, 3, 11032, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 44, 1, 20, 1, 10469, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 45, 4, 21, 2, 10740, 40, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 46, 8, 21, 3, 10696, 18, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 51, 5, 24, 3, 10870, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 53, 4, 24, 3, 10504, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 54, 3, 25, 3, 10693, 60, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 56, 4, 26, 2, 10740, 14, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 56, 8, 26, 1, 10596, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 58, 3, 27, 3, 10904, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 59, 2, 28, 3, 11032, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 61, 4, 29, 3, 10504, 25, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 62, 3, 29, 3, 10904, 35, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 62, 4, 29, 2, 10861, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 63, 8, 7, 1, 10596, 24, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 69, 3, 15, 3, 10693, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 72, 5, 14, 1, 10269, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 73, 3, 17, 3, 10693, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 75, 8, 12, 1, 10596, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WHITC', 77, 7, 12, 2, 10483, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 1, 2, 1, 1, 11005, 2, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 8, 7, 3, 1, 10695, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 11, 5, 5, 3, 10248, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 12, 7, 5, 1, 10695, 4, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 16, 2, 7, 1, 10673, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 19, 1, 8, 3, 10910, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 21, 4, 8, 1, 10873, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 24, 7, 10, 1, 10695, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 28, 4, 12, 1, 10873, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 40, 3, 19, 3, 10879, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 42, 2, 20, 1, 10673, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 42, 5, 20, 3, 10248, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 43, 2, 20, 1, 10673, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 49, 1, 23, 3, 10910, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 55, 2, 25, 3, 10615, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 59, 2, 28, 1, 11005, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 61, 1, 29, 3, 10910, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 65, 3, 2, 3, 10879, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 72, 5, 14, 3, 10248, 5, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WILMK', 76, 3, 23, 3, 10879, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 1, 6, 1, 2, 10611, 6, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 2, 1, 1, 3, 10792, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 2, 6, 1, 2, 10611, 10, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 24, 8, 10, 2, 10998, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 31, 1, 14, 3, 10374, 30, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 54, 1, 25, 3, 10792, 3, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 58, 1, 27, 3, 10374, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 60, 6, 28, 2, 10611, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 61, 4, 29, 3, 10906, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 61, 8, 29, 2, 10998, 7, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 62, 4, 29, 1, 11044, 12, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 68, 1, 8, 3, 10792, 15, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 74, 8, 4, 2, 10998, 20, CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Venta] ([idCliente], [idproducto], [IdEmpleado], [idProveedor], [idCompañiaEnvios], [idtiempo], [cant_vend], [descuento]) VALUES (N'WOLZA', 75, 8, 12, 2, 10998, 30, CAST(0.00 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkclientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[dimcliente] ([idCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkclientes]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkcompañia] FOREIGN KEY([idCompañiaEnvios])
REFERENCES [dbo].[dimcompañia] ([idCompañiaEnvios])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkcompañia]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkempleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[dimempleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkempleado]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkproductos] FOREIGN KEY([idproducto])
REFERENCES [dbo].[dimproducto] ([idproducto])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkproductos]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkproveedor] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[dimproveedor] ([idProveedor])
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
