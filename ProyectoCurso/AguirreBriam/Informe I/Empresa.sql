USE [master]
GO
/****** Object:  Database [Empresa]    Script Date: 16/12/2020 18:53:50 ******/
CREATE DATABASE [Empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Empresa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Empresa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Empresa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Empresa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Empresa] SET RECOVERY FULL 
GO
ALTER DATABASE [Empresa] SET  MULTI_USER 
GO
ALTER DATABASE [Empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Empresa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Empresa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Empresa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Empresa', N'ON'
GO
ALTER DATABASE [Empresa] SET QUERY_STORE = OFF
GO
USE [Empresa]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[idcategoria] [int] NOT NULL,
	[nombrecategoria] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [varchar](5) NOT NULL,
	[NombreCompañia] [varchar](100) NOT NULL,
	[NombreContacto] [varchar](100) NULL,
	[CargoContacto] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Ciudad] [varchar](100) NULL,
	[Region] [varchar](100) NULL,
	[CodPostal] [varchar](100) NULL,
	[Pais] [varchar](100) NULL,
	[Telefono] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compañiasdeenvios]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compañiasdeenvios](
	[idCompañiaEnvios] [int] NOT NULL,
	[nombreCompañia] [varchar](40) NOT NULL,
	[telefono] [varchar](24) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompañiaEnvios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallesdepedidos]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallesdepedidos](
	[idpedido] [int] NULL,
	[idproducto] [int] NULL,
	[preciounidad] [decimal](18, 0) NOT NULL,
	[cantidad] [int] NOT NULL,
	[descuento] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] NOT NULL,
	[Apellidos] [varchar](20) NULL,
	[Nombre] [varchar](20) NULL,
	[cargo] [varchar](40) NULL,
	[Tratamiento] [varchar](40) NULL,
	[FechaNacimiento] [date] NULL,
	[FechaContratacion] [date] NULL,
	[direccion] [varchar](60) NULL,
	[ciudad] [varchar](15) NULL,
	[region] [varchar](15) NULL,
	[codPostal] [varchar](10) NULL,
	[pais] [varchar](15) NULL,
	[TelDomicilio] [varchar](24) NULL,
	[Extension] [varchar](4) NULL,
	[notas] [text] NULL,
	[Jefe] [int] NULL,
	[sueldoBasico] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[IdPedido] [int] NOT NULL,
	[IdCliente] [varchar](5) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaPedido] [date] NULL,
	[FechaEntrega] [date] NULL,
	[FechaEnvio] [date] NULL,
	[FormaEnvio] [int] NULL,
	[Cargo] [decimal](18, 0) NULL,
	[Destinatario] [varchar](60) NULL,
	[DireccionDestinatario] [varchar](60) NULL,
	[CiudadDestinatario] [varchar](60) NULL,
	[RegionDestinatario] [varchar](60) NULL,
	[CodPostalDestinatario] [varchar](60) NULL,
	[PaisDestinatario] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[idproducto] [int] NOT NULL,
	[nombreProducto] [varchar](40) NULL,
	[idProveedor] [int] NULL,
	[idCategoria] [int] NULL,
	[cantidadPorUnidad] [varchar](20) NULL,
	[precioUnidad] [decimal](18, 0) NULL,
	[unidadesEnExistencia] [smallint] NULL,
	[unidadesEnPedido] [smallint] NULL,
	[nivelNuevoPedido] [smallint] NULL,
	[suspendido] [smallint] NULL,
	[categoriaProducto] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 16/12/2020 18:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[idProveedor] [int] NOT NULL,
	[nombreCompañia] [varchar](40) NOT NULL,
	[nombrecontacto] [varchar](30) NULL,
	[cargocontacto] [varchar](30) NULL,
	[direccion] [varchar](60) NULL,
	[ciudad] [varchar](15) NULL,
	[region] [varchar](15) NULL,
	[codPostal] [varchar](10) NULL,
	[pais] [varchar](15) NULL,
	[telefono] [varchar](24) NULL,
	[fax] [varchar](24) NULL,
	[paginaprincipal] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (1, N'Bebidas', N'Gaseosas, café, té, cervezas y maltas')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (2, N'Condimentos', N'Salsas dulces y picantes, delicias, comida para untar y aderezos')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (3, N'Repostería', N'Postres, dulces y pan dulce')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (4, N'Lácteos', N'Quesos')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (5, N'Granos/Cereales', N'Pan, galletas, pasta y cereales')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (6, N'Carnes', N'Carnes preparadas')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (7, N'Frutas/Verduras', N'Frutas secas y queso de soja')
GO
INSERT [dbo].[categorias] ([idcategoria], [nombrecategoria], [descripcion]) VALUES (8, N'Pescado/Marisco', N'Pescados, mariscos y algas')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'ALFKI', N'Alfreds Futterkiste', N'Maria Anders', N'Representante de ventas', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania', N'030-0074321', N'030-0076545')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'ANATR', N'Ana Trujillo Emparedados y helados', N'Ana Trujillo', N'Propietario', N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'México', N'(5) 555-4729', N'(5) 555-3745')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'ANTON', N'Antonio Moreno Taquería', N'Antonio Moreno', N'Propietario', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México', N'(5) 555-3932', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'AROUT', N'Around the Horn', N'Thomas Hardy', N'Representante de ventas', N'120 Hanover Sq.', N'Londres', NULL, N'WA1 1DP', N'Reino Unido', N'(71) 555-7788', N'(71) 555-6750')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BERGS', N'Berglunds snabbköp', N'Christina Berglund', N'Administrador de pedidos', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia', N'0921-12 34 65', N'0921-12 34 67')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BLAUS', N'Blauer See Delikatessen', N'Hanna Moos', N'Representante de ventas', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania', N'0621-08460', N'0621-08924')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BLONP', N'Blondel père et fils', N'Frédérique Citeaux', N'Gerente de marketing', N'24, place Kléber', N'Estrasburgo', NULL, N'67000', N'Francia', N'88.60.15.31', N'88.60.15.32')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BOLID', N'Bólido Comidas preparadas', N'Martín Sommer', N'Propietario', N'C/ Araquil, 67', N'Madrid', NULL, N'28023', N'España', N'(91) 555 22 82', N'(91) 555 91 99')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BONAP', N'Bon app''', N'Laurence Lebihan', N'Propietario', N'12, rue des Bouchers', N'Marsella', NULL, N'13008', N'Francia', N'91.24.45.40', N'91.24.45.41')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BOTTM', N'Bottom-Dollar Markets', N'Elizabeth Lincoln', N'Gerente de contabilidad', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá', N'(604) 555-4729', N'(604) 555-3745')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'BSBEV', N'B''s Beverages', N'Victoria Ashworth', N'Representante de ventas', N'Fauntleroy Circus', N'Londres', NULL, N'EC2 5NT', N'Reino Unido', N'(71) 555-1212', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'CACTU', N'Cactus Comidas para llevar', N'Patricio Simpson', N'Agente de ventas', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina', N'(1) 135-5555', N'(1) 135-4892')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'CENTC', N'Centro comercial Moctezuma', N'Francisco Chang', N'Gerente de marketing', N'Sierras de Granada 9993', N'México D.F.', NULL, N'05022', N'México', N'(5) 555-3392', N'(5) 555-7293')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'CHOPS', N'Chop-suey Chinese', N'Yang Wang', N'Propietario', N'Hauptstr. 29', N'Berna', NULL, N'3012', N'Suiza', N'0452-076545', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'COMMI', N'Comércio Mineiro', N'Pedro Afonso', N'Asistente de ventas', N'Av. dos Lusíadas, 23', N'São Paulo', N'SP', N'05432-043', N'Brasil', N'(11) 555-7647', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'CONSH', N'Consolidated Holdings', N'Elizabeth Brown', N'Representante de ventas', N'Berkeley Gardens12  Brewery ', N'Londres', NULL, N'WX1 6LT', N'Reino Unido', N'(71) 555-2282', N'(71) 555-9199')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'DRACD', N'Drachenblut Delikatessen', N'Sven Ottlieb', N'Administrador de pedidos', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania', N'0241-039123', N'0241-059428')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'DUMON', N'Du monde entier', N'Janine Labrune', N'Propietario', N'67, rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'Francia', N'40.67.88.88', N'40.67.89.89')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'EASTC', N'Eastern Connection', N'Ann Devon', N'Agente de ventas', N'35 King George', N'Londres', NULL, N'WX3 6FW', N'Reino Unido', N'(71) 555-0297', N'(71) 555-3373')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'ERNSH', N'Ernst Handel', N'Roland Mendel', N'Gerente de ventas', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria', N'7675-3425', N'7675-3426')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FAMIA', N'Familia Arquibaldo', N'Aria Cruz', N'Asistente de marketing', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brasil', N'(11) 555-9857', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FISSA', N'FISSA Fabrica Inter. Salchichas S.A.', N'Diego Roel', N'Gerente de contabilidad', N'C/ Moralzarzal, 86', N'Madrid', NULL, N'28034', N'España', N'(91) 555 94 44', N'(91) 555 55 93')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FOLIG', N'Folies gourmandes', N'Martine Rancé', N'Asistente de agente de ventas', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'Francia', N'20.16.10.16', N'20.16.10.17')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FOLKO', N'Folk och fä HB', N'Maria Larsson', N'Propietario', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia', N'0695-34 67 21', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FRANK', N'Frankenversand', N'Peter Franken', N'Gerente de marketing', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania', N'089-0877310', N'089-0877451')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FRANR', N'France restauration', N'Carine Schmitt', N'Gerente de marketing', N'54, rue Royale', N'Nantes', NULL, N'44000', N'Francia', N'40.32.21.21', N'40.32.21.20')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FRANS', N'Franchi S.p.A.', N'Paolo Accorti', N'Representante de ventas', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia', N'011-4988260', N'011-4988261')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'FURIB', N'Furia Bacalhau e Frutos do Mar', N'Lino Rodriguez ', N'Gerente de ventas', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal', N'(1) 354-2534', N'(1) 354-2535')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'GALED', N'Galería del gastrónomo', N'Eduardo Saavedra', N'Gerente de marketing', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'08022', N'España', N'(93) 203 4560', N'(93) 203 4561')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'GODOS', N'Godos Cocina Típica', N'José Pedro Freyre', N'Gerente de ventas', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'España', N'(95) 555 82 82', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'GOURL', N'Gourmet Lanchonetes', N'André Fonseca', N'Asistente de ventas', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brasil', N'(11) 555-9482', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'GREAL', N'Great Lakes Food Market', N'Howard Snyder', N'Gerente de marketing', N'2732 Baker Blvd.', N'Eugenia', N'OR', N'97403', N'Estados Unidos', N'(503) 555-7555', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'GROSR', N'GROSELLA-Restaurante', N'Manuel Pereira', N'Propietario', N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela', N'(2) 283-2951', N'(2) 283-3397')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'HANAR', N'Hanari Carnes', N'Mario Pontes', N'Gerente de contabilidad', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brasil', N'(21) 555-0091', N'(21) 555-8765')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'HILAA', N'HILARIÓN-Abastos', N'Carlos Hernández', N'Representante de ventas', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela', N'(5) 555-1340', N'(5) 555-1948')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'HUNGC', N'Hungry Coyote Import Store', N'Yoshi Latimer', N'Representante de ventas', N'City Center Plaza516 Main St.', N'Elgin', N'OR', N'97827', N'Estados Unidos', N'(503) 555-6874', N'(503) 555-2376')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'HUNGO', N'Hungry Owl All-Night Grocers', N'Patricia McKenna', N'Asistente de ventas', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda', N'2967 542', N'2967 3333')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'ISLAT', N'Island Trading', N'Helen Bennett', N'Gerente de marketing', N'Garden HouseCrowther Way', N'Cowes', N'Isla de Wight', N'PO31 7PJ', N'Reino Unido', N'(198) 555-8888', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'KOENE', N'Königlich Essen', N'Philip Cramer', N'Asistente de ventas', N'Maubelstr. 90', N'Brandenburgo', NULL, N'14776', N'Alemania', N'0555-09876', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LACOR', N'La corne d''abondance', N'Daniel Tonini', N'Representante de ventas', N'67, avenue de l''Europe', N'Versalles', NULL, N'78000', N'Francia', N'30.59.84.10', N'30.59.85.11')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LAMAI', N'La maison d''Asie', N'Annette Roulet', N'Gerente de ventas', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia', N'61.77.61.10', N'61.77.61.11')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LAUGB', N'Laughing Bacchus Wine Cellars', N'Yoshi Tannamuri', N'Asistente de marketing', N'1900 Oak St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canadá', N'(604) 555-3392', N'(604) 555-7293')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LAZYK', N'Lazy K Kountry Store', N'John Steel', N'Gerente de marketing', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'Estados Unidos', N'(509) 555-7969', N'(509) 555-6221')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LEHMS', N'Lehmanns Marktstand', N'Renate Messner', N'Representante de ventas', N'Magazinweg 7', N'Francfurt', NULL, N'60528', N'Alemania', N'069-0245984', N'069-0245874')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LETSS', N'Let''s Stop N Shop', N'Jaime Yorres', N'Propietario', N'87 Polk St.Suite 5', N'San Francisco', N'CA', N'94117', N'Estados Unidos', N'(415) 555-5938', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LILAS', N'LILA-Supermercado', N'Carlos González', N'Gerente de contabilidad', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela', N'(9) 331-6954', N'(9) 331-7256')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LINOD', N'LINO-Delicateses', N'Felipe Izquierdo', N'Propietario', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela', N'(8) 34-56-12', N'(8) 34-93-93')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'LONEP', N'Lonesome Pine Restaurant', N'Fran Wilson', N'Gerente de ventas', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos', N'(503) 555-9573', N'(503) 555-9646')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'MAGAA', N'Magazzini Alimentari Riuniti', N'Giovanni Rovelli', N'Gerente de marketing', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia', N'035-640230', N'035-640231')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'MAISD', N'Maison Dewey', N'Catherine Dewey', N'Agente de ventas', N'Rue Joseph-Bens 532', N'Bruselas', NULL, N'B-1180', N'Bélgica', N'(02) 201 24 67', N'(02) 201 24 68')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'MEREP', N'Mère Paillarde', N'Jean Fresnière', N'Asistente de marketing', N'43 rue St. Laurent', N'Montreal', N'Québec', N'H1J 1C3', N'Canadá', N'(514) 555-8054', N'(514) 555-8055')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'MORGK', N'Morgenstern Gesundkost', N'Alexander Feuer', N'Asistente de marketing', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Alemania', N'0342-023176', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'NORTS', N'North/South', N'Simon Crowther', N'Asistente de ventas', N'South House300 Queensbridge', N'Londres', NULL, N'SW7 1RZ', N'Reino Unido', N'(71) 555-7733', N'(71) 555-2530')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'OCEAN', N'Océano Atlántico Ltda.', N'Yvonne Moncada', N'Agente de ventas', N'Ing. Gustavo Moncada 8585Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina', N'(1) 135-5333', N'(1) 135-5535')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'OLDWO', N'Old World Delicatessen', N'Rene Phillips', N'Representante de ventas', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos', N'(907) 555-7584', N'(907) 555-2880')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'OTTIK', N'Ottilies Käseladen', N'Henriette Pfalzheim', N'Propietario', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania', N'0221-0644327', N'0221-0765721')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'PARIS', N'Paris spécialités', N'Marie Bertrand', N'Propietario', N'265, boulevard Charonne', N'París', NULL, N'75012', N'Francia', N'(1) 42.34.22.66', N'(1) 42.34.22.77')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'PERIC', N'Pericles Comidas clásicas', N'Guillermo Fernández', N'Representante de ventas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México', N'(5) 552-3745', N'(5) 545-3745')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'PICCO', N'Piccolo und mehr', N'Georg Pipps', N'Gerente de ventas', N'Geislweg 14', N'Salzburgo', NULL, N'5020', N'Austria', N'6562-9722', N'6562-9723')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'PRINI', N'Princesa Isabel Vinhos', N'Isabel de Castro', N'Representante de ventas', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal', N'(1) 356-5634', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'QUEDE', N'Que Delícia', N'Bernardo Batista', N'Gerente de contabilidad', N'Rua da Panificadora, 12', N'Rio de Janeiro', N'RJ', N'02389-673', N'Brasil', N'(21) 555-4252', N'(21) 555-4545')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'QUEEN', N'Queen Cozinha', N'Lúcia Carvalho', N'Asistente de marketing', N'Alameda dos Canàrios, 891', N'Sao Paulo', N'SP', N'05487-020', N'Brasil', N'(11) 555-1189', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'QUICK', N'QUICK-Stop', N'Horst Kloss', N'Gerente de contabilidad', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania', N'0372-035188', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'RANCH', N'Rancho grande', N'Sergio Gutiérrez', N'Representante de ventas', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina', N'(1) 123-5555', N'(1) 123-5556')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'RATTC', N'Rattlesnake Canyon Grocery', N'Paula Wilson', N'Representante agente ventas', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos', N'(505) 555-5939', N'(505) 555-3620')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'REGGC', N'Reggiani Caseifici', N'Maurizio Moroni', N'Asistente de ventas', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia', N'0522-556721', N'0522-556722')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'RICAR', N'Ricardo Adocicados', N'Janete Limeira', N'Asistente de agente de ventas', N'Av. Copacabana, 267', N'Rio de Janeiro', N'RJ', N'02389-890', N'Brasil', N'(21) 555-3412', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'RICSU', N'Richter Supermarkt', N'Michael Holz', N'Gerente de ventas', N'Grenzacherweg 237', N'Génova', NULL, N'1203', N'Suiza', N'0897-034214', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'ROMEY', N'Romero y tomillo', N'Alejandra Camino', N'Gerente de contabilidad', N'Gran Vía, 1', N'Madrid', NULL, N'28001', N'España', N'(91) 745 6200', N'(91) 745 6210')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SANTG', N'Santé Gourmet', N'Jonas Bergulfsen', N'Propietario', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega', N'07-98 92 35', N'07-98 92 47')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SAVEA', N'Save-a-lot Markets', N'Jose Pavarotti', N'Representante de ventas', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos', N'(208) 555-8097', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SEVES', N'Seven Seas Imports', N'Hari Kumar', N'Gerente de ventas', N'90 Wadhurst Rd.', N'Londres', NULL, N'OX15 4NB', N'Reino Unido', N'(71) 555-1717', N'(71) 555-5646')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SIMOB', N'Simons bistro', N'Jytte Petersen', N'Propietario', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca', N'31 12 34 56', N'31 13 35 57')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SPECD', N'Spécialités du monde', N'Dominique Perrier', N'Gerente de marketing', N'25, rue Lauriston', N'París', NULL, N'75016', N'Francia', N'(1) 47.55.60.10', N'(1) 47.55.60.20')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SPLIR', N'Split Rail Beer & Ale', N'Art Braunschweiger', N'Gerente de ventas', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos', N'(307) 555-4680', N'(307) 555-6525')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'SUPRD', N'Suprêmes délices', N'Pascale Cartrain', N'Gerente de contabilidad', N'Boulevard Tirou, 255', N'Charleroi', NULL, N'B-6000', N'Bélgica', N'(071) 23 67 22 20', N'(071) 23 67 22 21')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'THEBI', N'The Big Cheese', N'Liz Nixon', N'Gerente de marketing', N'89 Jefferson WaySuite 2', N'Portland', N'OR', N'97201', N'Estados Unidos', N'(503) 555-3612', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'THECR', N'The Cracker Box', N'Liu Wong', N'Asistente de marketing', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'Estados Unidos', N'(406) 555-5834', N'(406) 555-8083')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'TOMSP', N'Toms Spezialitäten', N'Karin Josephs', N'Gerente de marketing', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania', N'0251-031259', N'0251-035695')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'TORTU', N'Tortuga Restaurante', N'Miguel Angel Paolino', N'Propietario', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México', N'(5) 555-2933', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'TRADH', N'Tradição Hipermercados', N'Anabela Domingues', N'Representante de ventas', N'Av. Inês de Castro, 414', N'Sao Paulo', N'SP', N'05634-030', N'Brasil', N'(11) 555-2167', N'(11) 555-2168')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'TRAIH', N'Trail''s Head Gourmet Provisioners', N'Helvetius Nagy', N'Asistente de ventas', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'Estados Unidos', N'(206) 555-8257', N'(206) 555-2174')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'VAFFE', N'Vaffeljernet', N'Palle Ibsen', N'Gerente de ventas', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca', N'86 21 32 43', N'86 22 33 44')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'VICTE', N'Victuailles en stock', N'Mary Saveley', N'Agente de ventas', N'2, rue du Commerce', N'Lion', NULL, N'69004', N'Francia', N'78.32.54.86', N'78.32.54.87')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'VINET', N'Vins et alcools Chevalier', N'Paul Henriot', N'Gerente de contabilidad', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'Francia', N'26.47.15.10', N'26.47.15.11')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'WANDK', N'Die Wandernde Kuh', N'Rita Müller', N'Representante de ventas', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania', N'0711-020361', N'0711-035428')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'WARTH', N'Wartian Herkku', N'Pirkko Koskitalo', N'Gerente de contabilidad', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia', N'981-443655', N'981-443655')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'WELLI', N'Wellington Importadora', N'Paula Parente', N'Gerente de ventas', N'Rua do Mercado, 12', N'Resende', N'SP', N'08737-363', N'Brasil', N'(14) 555-8122', NULL)
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'WHITC', N'White Clover Markets', N'Karl Jablonski', N'Propietario', N'305 - 14th Ave. S.Suite 3B', N'Seattle', N'WA', N'98128', N'Estados Unidos', N'(206) 555-4112', N'(206) 555-4115')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'WILMK', N'Wilman Kala', N'Matti Karttunen', N'Prop./Asistente marketing', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia', N'90-224 8858', N'90-224 8858')
GO
INSERT [dbo].[clientes] ([idCliente], [NombreCompañia], [NombreContacto], [CargoContacto], [Direccion], [Ciudad], [Region], [CodPostal], [Pais], [Telefono], [Fax]) VALUES (N'WOLZA', N'Wolski  Zajazd', N'Zbyszek Piestrzeniewicz', N'Propietario', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia', N'(26) 642-7012', N'(26) 642-7012')
GO
INSERT [dbo].[compañiasdeenvios] ([idCompañiaEnvios], [nombreCompañia], [telefono]) VALUES (1, N'Speedy Express', N'(503) 555-9831')
GO
INSERT [dbo].[compañiasdeenvios] ([idCompañiaEnvios], [nombreCompañia], [telefono]) VALUES (2, N'United Package', N'(503) 555-3199')
GO
INSERT [dbo].[compañiasdeenvios] ([idCompañiaEnvios], [nombreCompañia], [telefono]) VALUES (3, N'Federal Shipping', N'(503) 555-9931')
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10248, 11, CAST(14 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10248, 42, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10248, 72, CAST(35 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10249, 14, CAST(19 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10249, 51, CAST(42 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10250, 41, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10250, 51, CAST(42 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10250, 65, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10251, 22, CAST(17 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10251, 57, CAST(16 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10251, 65, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10252, 20, CAST(65 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10252, 33, CAST(2 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10252, 60, CAST(27 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10253, 31, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10253, 39, CAST(14 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10253, 49, CAST(16 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10254, 24, CAST(4 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10254, 55, CAST(19 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10254, 74, CAST(8 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10255, 2, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10255, 16, CAST(14 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10255, 36, CAST(15 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10255, 59, CAST(44 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10256, 53, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10256, 77, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10257, 27, CAST(35 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10257, 39, CAST(14 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10257, 77, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10258, 2, CAST(15 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10258, 5, CAST(17 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10258, 32, CAST(26 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10259, 21, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10259, 37, CAST(21 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10260, 41, CAST(8 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10260, 57, CAST(16 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10260, 62, CAST(39 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10260, 70, CAST(12 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10261, 21, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10261, 35, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10262, 5, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10262, 7, CAST(24 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10262, 56, CAST(30 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10263, 16, CAST(14 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10263, 24, CAST(4 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10263, 30, CAST(21 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10263, 74, CAST(8 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10264, 2, CAST(15 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10264, 41, CAST(8 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10265, 17, CAST(31 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10265, 70, CAST(12 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10266, 12, CAST(30 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10267, 40, CAST(15 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10267, 59, CAST(44 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10267, 76, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10268, 29, CAST(99 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10268, 72, CAST(28 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10269, 33, CAST(2 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10269, 72, CAST(28 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10270, 36, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10270, 43, CAST(37 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10271, 33, CAST(2 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10272, 20, CAST(65 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10272, 31, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10272, 72, CAST(28 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10273, 10, CAST(25 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10273, 31, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10273, 33, CAST(2 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10273, 40, CAST(15 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10273, 76, CAST(14 AS Decimal(18, 0)), 33, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10274, 71, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10274, 72, CAST(28 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10275, 24, CAST(4 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10275, 59, CAST(44 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10276, 10, CAST(25 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10276, 13, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10277, 28, CAST(36 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10277, 62, CAST(39 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10278, 44, CAST(16 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10278, 59, CAST(44 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10278, 63, CAST(35 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10278, 73, CAST(12 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10279, 17, CAST(31 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10280, 24, CAST(4 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10280, 55, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10280, 75, CAST(6 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10281, 19, CAST(7 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10281, 24, CAST(4 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10281, 35, CAST(14 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10282, 30, CAST(21 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10282, 57, CAST(16 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10283, 15, CAST(12 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10283, 19, CAST(7 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10283, 60, CAST(27 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10283, 72, CAST(28 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10284, 27, CAST(35 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10284, 44, CAST(16 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10284, 60, CAST(27 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10284, 67, CAST(11 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10285, 1, CAST(14 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10285, 40, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10285, 53, CAST(26 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10286, 35, CAST(14 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10286, 62, CAST(39 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10287, 16, CAST(14 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10287, 34, CAST(11 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10287, 46, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10288, 54, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10288, 68, CAST(10 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10289, 3, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10289, 64, CAST(27 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10290, 5, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10290, 29, CAST(99 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10290, 49, CAST(16 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10290, 77, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10291, 13, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10291, 44, CAST(16 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10291, 51, CAST(42 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10292, 20, CAST(65 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10293, 18, CAST(50 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10293, 24, CAST(4 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10293, 63, CAST(35 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10293, 75, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10294, 1, CAST(14 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10294, 17, CAST(31 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10294, 43, CAST(37 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10294, 60, CAST(27 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10294, 75, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10295, 56, CAST(30 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10296, 11, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10296, 16, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10296, 69, CAST(29 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10297, 39, CAST(14 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10297, 72, CAST(28 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10298, 2, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10298, 36, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10298, 59, CAST(44 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10298, 62, CAST(39 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10299, 19, CAST(7 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10299, 70, CAST(12 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10300, 66, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10300, 68, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10301, 40, CAST(15 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10301, 56, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10302, 17, CAST(31 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10302, 28, CAST(36 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10302, 43, CAST(37 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10303, 40, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10303, 65, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10303, 68, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10304, 49, CAST(16 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10304, 59, CAST(44 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10304, 71, CAST(17 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10305, 18, CAST(50 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10305, 29, CAST(99 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10305, 39, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10306, 30, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10306, 53, CAST(26 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10306, 54, CAST(6 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10307, 62, CAST(39 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10307, 68, CAST(10 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10308, 69, CAST(29 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10308, 70, CAST(12 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10309, 4, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10309, 6, CAST(20 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10309, 42, CAST(11 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10309, 43, CAST(37 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10309, 71, CAST(17 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10310, 16, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10310, 62, CAST(39 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10311, 42, CAST(11 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10311, 69, CAST(29 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10312, 28, CAST(36 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10312, 43, CAST(37 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10312, 53, CAST(26 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10312, 75, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10313, 36, CAST(15 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10314, 32, CAST(26 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10314, 58, CAST(11 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10314, 62, CAST(39 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10315, 34, CAST(11 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10315, 70, CAST(12 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10316, 41, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10316, 62, CAST(39 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10317, 1, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10318, 41, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10318, 76, CAST(14 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10319, 17, CAST(31 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10319, 28, CAST(36 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10319, 76, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10320, 71, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10321, 35, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10322, 52, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10323, 15, CAST(12 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10323, 25, CAST(11 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10323, 39, CAST(14 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10324, 16, CAST(14 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10324, 35, CAST(14 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10324, 46, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10324, 59, CAST(44 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10324, 63, CAST(35 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10325, 6, CAST(20 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10325, 13, CAST(5 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10325, 14, CAST(19 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10325, 31, CAST(10 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10325, 72, CAST(28 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10326, 4, CAST(18 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10326, 57, CAST(16 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10326, 75, CAST(6 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10327, 2, CAST(15 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10327, 11, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10327, 30, CAST(21 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10327, 58, CAST(11 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10328, 59, CAST(44 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10328, 65, CAST(17 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10328, 68, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10329, 19, CAST(7 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10329, 30, CAST(21 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10329, 38, CAST(211 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10329, 56, CAST(30 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10330, 26, CAST(25 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10330, 72, CAST(28 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10331, 54, CAST(6 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10332, 18, CAST(50 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10332, 42, CAST(11 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10332, 47, CAST(8 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10333, 14, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10333, 21, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10333, 71, CAST(17 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10334, 52, CAST(6 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10334, 68, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10335, 2, CAST(15 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10335, 31, CAST(10 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10335, 32, CAST(26 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10335, 51, CAST(42 AS Decimal(18, 0)), 48, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10336, 4, CAST(18 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10337, 23, CAST(7 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10337, 26, CAST(25 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10337, 36, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10337, 37, CAST(21 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10337, 72, CAST(28 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10338, 17, CAST(31 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10338, 30, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10339, 4, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10339, 17, CAST(31 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10339, 62, CAST(39 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10340, 18, CAST(50 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10340, 41, CAST(8 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10340, 43, CAST(37 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10341, 33, CAST(2 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10341, 59, CAST(44 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10342, 2, CAST(15 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10342, 31, CAST(10 AS Decimal(18, 0)), 56, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10342, 36, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10342, 55, CAST(19 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10343, 64, CAST(27 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10343, 68, CAST(10 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10343, 76, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10344, 4, CAST(18 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10344, 8, CAST(32 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10345, 8, CAST(32 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10345, 19, CAST(7 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10345, 42, CAST(11 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10346, 17, CAST(31 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10346, 56, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10347, 25, CAST(11 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10347, 39, CAST(14 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10347, 40, CAST(15 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10347, 75, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10348, 1, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10348, 23, CAST(7 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10349, 54, CAST(6 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10350, 50, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10350, 69, CAST(29 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10351, 38, CAST(211 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10351, 41, CAST(8 AS Decimal(18, 0)), 13, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10351, 44, CAST(16 AS Decimal(18, 0)), 77, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10351, 65, CAST(17 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10352, 24, CAST(4 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10352, 54, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10353, 11, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10353, 38, CAST(211 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10354, 1, CAST(14 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10354, 29, CAST(99 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10355, 24, CAST(4 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10355, 57, CAST(16 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10356, 31, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10356, 55, CAST(19 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10356, 69, CAST(29 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10357, 10, CAST(25 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10357, 26, CAST(25 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10357, 60, CAST(27 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10358, 24, CAST(4 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10358, 34, CAST(11 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10358, 36, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10359, 16, CAST(14 AS Decimal(18, 0)), 56, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10359, 31, CAST(10 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10359, 60, CAST(27 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10360, 28, CAST(36 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10360, 29, CAST(99 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10360, 38, CAST(211 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10360, 49, CAST(16 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10360, 54, CAST(6 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10361, 39, CAST(14 AS Decimal(18, 0)), 54, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10361, 60, CAST(27 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10362, 25, CAST(11 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10362, 51, CAST(42 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10362, 54, CAST(6 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10363, 31, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10363, 75, CAST(6 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10363, 76, CAST(14 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10364, 69, CAST(29 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10364, 71, CAST(17 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10365, 11, CAST(17 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10366, 65, CAST(17 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10366, 77, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10367, 34, CAST(11 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10367, 54, CAST(6 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10367, 65, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10367, 77, CAST(10 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10368, 21, CAST(8 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10368, 28, CAST(36 AS Decimal(18, 0)), 13, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10368, 57, CAST(16 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10368, 64, CAST(27 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10369, 29, CAST(99 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10369, 56, CAST(30 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10370, 1, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10370, 64, CAST(27 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10370, 74, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10371, 36, CAST(15 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10372, 20, CAST(65 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10372, 38, CAST(211 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10372, 60, CAST(27 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10372, 72, CAST(28 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10373, 58, CAST(11 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10373, 71, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10374, 31, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10374, 58, CAST(11 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10375, 14, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10375, 54, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10376, 31, CAST(10 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10377, 28, CAST(36 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10377, 39, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10378, 71, CAST(17 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10379, 41, CAST(8 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10379, 63, CAST(35 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10379, 65, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10380, 30, CAST(21 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10380, 53, CAST(26 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10380, 60, CAST(27 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10380, 70, CAST(12 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10381, 74, CAST(8 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10382, 5, CAST(17 AS Decimal(18, 0)), 32, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10382, 18, CAST(50 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10382, 29, CAST(99 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10382, 33, CAST(2 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10382, 74, CAST(8 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10383, 13, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10383, 50, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10383, 56, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10384, 20, CAST(65 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10384, 60, CAST(27 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10385, 7, CAST(24 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10385, 60, CAST(27 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10385, 68, CAST(10 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10386, 24, CAST(4 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10386, 34, CAST(11 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10387, 24, CAST(4 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10387, 28, CAST(36 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10387, 59, CAST(44 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10387, 71, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10388, 45, CAST(8 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10388, 52, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10388, 53, CAST(26 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10389, 10, CAST(25 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10389, 55, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10389, 62, CAST(39 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10389, 70, CAST(12 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10390, 31, CAST(10 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10390, 35, CAST(14 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10390, 46, CAST(10 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10390, 72, CAST(28 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10391, 13, CAST(5 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10392, 69, CAST(29 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10393, 2, CAST(15 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10393, 14, CAST(19 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10393, 25, CAST(11 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10393, 26, CAST(25 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10393, 31, CAST(10 AS Decimal(18, 0)), 32, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10394, 13, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10394, 62, CAST(39 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10395, 46, CAST(10 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10395, 53, CAST(26 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10395, 69, CAST(29 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10396, 23, CAST(7 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10396, 71, CAST(17 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10396, 72, CAST(28 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10397, 21, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10397, 51, CAST(42 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10398, 35, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10398, 55, CAST(19 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10399, 68, CAST(10 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10399, 71, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10399, 76, CAST(14 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10399, 77, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10400, 29, CAST(99 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10400, 35, CAST(14 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10400, 49, CAST(16 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10401, 30, CAST(21 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10401, 56, CAST(30 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10401, 65, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10401, 71, CAST(17 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10402, 23, CAST(7 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10402, 63, CAST(35 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10403, 16, CAST(14 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10403, 48, CAST(10 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10404, 26, CAST(25 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10404, 42, CAST(11 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10404, 49, CAST(16 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10405, 3, CAST(8 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10406, 1, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10406, 21, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10406, 28, CAST(36 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10406, 36, CAST(15 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10406, 40, CAST(15 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10407, 11, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10407, 69, CAST(29 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10407, 71, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10408, 37, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10408, 54, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10408, 62, CAST(39 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10409, 14, CAST(19 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10409, 21, CAST(8 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10410, 33, CAST(2 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10410, 59, CAST(44 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10411, 41, CAST(8 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10411, 44, CAST(16 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10411, 59, CAST(44 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10412, 14, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10413, 1, CAST(14 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10413, 62, CAST(39 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10413, 76, CAST(14 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10414, 19, CAST(7 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10414, 33, CAST(2 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10415, 17, CAST(31 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10415, 33, CAST(2 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10416, 19, CAST(7 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10416, 53, CAST(26 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10416, 57, CAST(16 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10417, 38, CAST(211 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10417, 46, CAST(10 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10417, 68, CAST(10 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10417, 77, CAST(10 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10418, 2, CAST(15 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10418, 47, CAST(8 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10418, 61, CAST(23 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10418, 74, CAST(8 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10419, 60, CAST(27 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10419, 69, CAST(29 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10420, 9, CAST(78 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10420, 13, CAST(5 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10420, 70, CAST(12 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10420, 73, CAST(12 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10421, 19, CAST(7 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10421, 26, CAST(25 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10421, 53, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10421, 77, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10422, 26, CAST(25 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10423, 31, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10423, 59, CAST(44 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10424, 35, CAST(14 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10424, 38, CAST(211 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10424, 68, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10425, 55, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10425, 76, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10426, 56, CAST(30 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10426, 64, CAST(27 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10427, 14, CAST(19 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10428, 46, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10429, 50, CAST(13 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10429, 63, CAST(35 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10430, 17, CAST(31 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10430, 21, CAST(8 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10430, 56, CAST(30 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10430, 59, CAST(44 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10431, 17, CAST(31 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10431, 40, CAST(15 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10431, 47, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10432, 26, CAST(25 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10432, 54, CAST(6 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10433, 56, CAST(30 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10434, 11, CAST(17 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10434, 76, CAST(14 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10435, 2, CAST(15 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10435, 22, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10435, 72, CAST(28 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10436, 46, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10436, 56, CAST(30 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10436, 64, CAST(27 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10436, 75, CAST(6 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10437, 53, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10438, 19, CAST(7 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10438, 34, CAST(11 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10438, 57, CAST(16 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10439, 12, CAST(30 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10439, 16, CAST(14 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10439, 64, CAST(27 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10439, 74, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10440, 2, CAST(15 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10440, 16, CAST(14 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10440, 29, CAST(99 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10440, 61, CAST(23 AS Decimal(18, 0)), 90, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10441, 27, CAST(35 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10442, 11, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10442, 54, CAST(6 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10442, 66, CAST(14 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10443, 11, CAST(17 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10443, 28, CAST(36 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10444, 17, CAST(31 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10444, 26, CAST(25 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10444, 35, CAST(14 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10444, 41, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10445, 39, CAST(14 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10445, 54, CAST(6 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10446, 19, CAST(7 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10446, 24, CAST(4 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10446, 31, CAST(10 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10446, 52, CAST(6 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10447, 19, CAST(7 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10447, 65, CAST(17 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10447, 71, CAST(17 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10448, 26, CAST(25 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10448, 40, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10449, 10, CAST(25 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10449, 52, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10449, 62, CAST(39 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10450, 10, CAST(25 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10450, 54, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10451, 55, CAST(19 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10451, 64, CAST(27 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10451, 65, CAST(17 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10451, 77, CAST(10 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10452, 28, CAST(36 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10452, 44, CAST(16 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10453, 48, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10453, 70, CAST(12 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10454, 16, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10454, 33, CAST(2 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10454, 46, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10455, 39, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10455, 53, CAST(26 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10455, 61, CAST(23 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10455, 71, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10456, 21, CAST(8 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10456, 49, CAST(16 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10457, 59, CAST(44 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10458, 26, CAST(25 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10458, 28, CAST(36 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10458, 43, CAST(37 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10458, 56, CAST(30 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10458, 71, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10459, 7, CAST(24 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10459, 46, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10459, 72, CAST(28 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10460, 68, CAST(10 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10460, 75, CAST(6 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10461, 21, CAST(8 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10461, 30, CAST(21 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10461, 55, CAST(19 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10462, 13, CAST(5 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10462, 23, CAST(7 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10463, 19, CAST(7 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10463, 42, CAST(11 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10464, 4, CAST(18 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10464, 43, CAST(37 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10464, 56, CAST(30 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10464, 60, CAST(27 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10465, 24, CAST(4 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10465, 29, CAST(99 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10465, 40, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10465, 45, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10465, 50, CAST(13 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10466, 11, CAST(17 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10466, 46, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10467, 24, CAST(4 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10467, 25, CAST(11 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10468, 30, CAST(21 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10468, 43, CAST(37 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10469, 2, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10469, 16, CAST(14 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10469, 44, CAST(16 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10470, 18, CAST(50 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10470, 23, CAST(7 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10470, 64, CAST(27 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10471, 7, CAST(24 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10471, 56, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10472, 24, CAST(4 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10472, 51, CAST(42 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10473, 33, CAST(2 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10473, 71, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10474, 14, CAST(19 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10474, 28, CAST(36 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10474, 40, CAST(15 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10474, 75, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10475, 31, CAST(10 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10475, 66, CAST(14 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10475, 76, CAST(14 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10476, 55, CAST(19 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10476, 70, CAST(12 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10477, 1, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10477, 21, CAST(8 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10477, 39, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10478, 10, CAST(25 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10479, 38, CAST(211 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10479, 53, CAST(26 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10479, 59, CAST(44 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10479, 64, CAST(27 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10480, 47, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10480, 59, CAST(44 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10481, 49, CAST(16 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10481, 60, CAST(27 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10482, 40, CAST(15 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10483, 34, CAST(11 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10483, 77, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10484, 21, CAST(8 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10484, 40, CAST(15 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10484, 51, CAST(42 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10485, 2, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10485, 3, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10485, 55, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10485, 70, CAST(12 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10486, 11, CAST(17 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10486, 51, CAST(42 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10486, 74, CAST(8 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10487, 19, CAST(7 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10487, 26, CAST(25 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10487, 54, CAST(6 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10488, 59, CAST(44 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10488, 73, CAST(12 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10489, 11, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10489, 16, CAST(14 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10490, 59, CAST(44 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10490, 68, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10490, 75, CAST(6 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10491, 44, CAST(16 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10491, 77, CAST(10 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10492, 25, CAST(11 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10492, 42, CAST(11 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10493, 65, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10493, 66, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10493, 69, CAST(29 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10494, 56, CAST(30 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10495, 23, CAST(7 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10495, 41, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10495, 77, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10496, 31, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10497, 56, CAST(30 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10497, 72, CAST(28 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10497, 77, CAST(10 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10498, 24, CAST(5 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10498, 40, CAST(18 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10498, 42, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10499, 28, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10499, 49, CAST(20 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10500, 15, CAST(16 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10500, 28, CAST(46 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10501, 54, CAST(7 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10502, 45, CAST(10 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10502, 53, CAST(33 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10502, 67, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10503, 14, CAST(23 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10503, 65, CAST(21 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10504, 2, CAST(19 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10504, 21, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10504, 53, CAST(33 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10504, 61, CAST(29 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10505, 62, CAST(49 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10506, 25, CAST(14 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10506, 70, CAST(15 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10507, 43, CAST(46 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10507, 48, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10508, 13, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10508, 39, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10509, 28, CAST(46 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10510, 29, CAST(124 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10510, 75, CAST(8 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10511, 4, CAST(22 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10511, 7, CAST(30 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10511, 8, CAST(40 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10512, 24, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10512, 46, CAST(12 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10512, 47, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10512, 60, CAST(34 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10513, 21, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10513, 32, CAST(32 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10513, 61, CAST(29 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10514, 20, CAST(81 AS Decimal(18, 0)), 39, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10514, 28, CAST(46 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10514, 56, CAST(38 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10514, 65, CAST(21 AS Decimal(18, 0)), 39, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10514, 75, CAST(8 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10515, 9, CAST(97 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10515, 16, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10515, 27, CAST(44 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10515, 33, CAST(3 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10515, 60, CAST(34 AS Decimal(18, 0)), 84, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10516, 18, CAST(63 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10516, 41, CAST(10 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10516, 42, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10517, 52, CAST(7 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10517, 59, CAST(55 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10517, 70, CAST(15 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10518, 24, CAST(5 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10518, 38, CAST(264 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10518, 44, CAST(19 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10519, 10, CAST(31 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10519, 56, CAST(38 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10519, 60, CAST(34 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10520, 24, CAST(5 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10520, 53, CAST(33 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10521, 35, CAST(18 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10521, 41, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10521, 68, CAST(13 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10522, 1, CAST(18 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10522, 8, CAST(40 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10522, 30, CAST(26 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10522, 40, CAST(18 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10523, 17, CAST(39 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10523, 20, CAST(81 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10523, 37, CAST(26 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10523, 41, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10524, 10, CAST(31 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10524, 30, CAST(26 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10524, 43, CAST(46 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10524, 54, CAST(7 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10525, 36, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10525, 40, CAST(18 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10526, 1, CAST(18 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10526, 13, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10526, 56, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10527, 4, CAST(22 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10527, 36, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10528, 11, CAST(21 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10528, 33, CAST(3 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10528, 72, CAST(35 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10529, 55, CAST(24 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10529, 68, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10529, 69, CAST(36 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10530, 17, CAST(39 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10530, 43, CAST(46 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10530, 61, CAST(29 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10530, 76, CAST(18 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10531, 59, CAST(55 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10532, 30, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10532, 66, CAST(17 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10533, 4, CAST(22 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10533, 72, CAST(35 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10533, 73, CAST(15 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10534, 30, CAST(26 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10534, 40, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10534, 54, CAST(7 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10535, 11, CAST(21 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10535, 40, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10535, 57, CAST(20 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10535, 59, CAST(55 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10536, 12, CAST(38 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10536, 31, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10536, 33, CAST(3 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10536, 60, CAST(34 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10537, 31, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10537, 51, CAST(53 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10537, 58, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10537, 72, CAST(35 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10537, 73, CAST(15 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10538, 70, CAST(15 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10538, 72, CAST(35 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10539, 13, CAST(6 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10539, 21, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10539, 33, CAST(3 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10539, 49, CAST(20 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10540, 3, CAST(10 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10540, 26, CAST(31 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10540, 38, CAST(264 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10540, 68, CAST(13 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10541, 24, CAST(5 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10541, 38, CAST(264 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10541, 65, CAST(21 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10541, 71, CAST(22 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10542, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10542, 54, CAST(7 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10543, 12, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10543, 23, CAST(9 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10544, 28, CAST(46 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10544, 67, CAST(14 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10545, 11, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10546, 7, CAST(30 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10546, 35, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10546, 62, CAST(49 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10547, 32, CAST(32 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10547, 36, CAST(19 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10548, 34, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10548, 41, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10549, 31, CAST(13 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10549, 45, CAST(10 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10549, 51, CAST(53 AS Decimal(18, 0)), 48, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10550, 17, CAST(39 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10550, 19, CAST(9 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10550, 21, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10550, 61, CAST(29 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10551, 16, CAST(17 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10551, 35, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10551, 44, CAST(19 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10552, 69, CAST(36 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10552, 75, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10553, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10553, 16, CAST(17 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10553, 22, CAST(21 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10553, 31, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10553, 35, CAST(18 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10554, 16, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10554, 23, CAST(9 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10554, 62, CAST(49 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10554, 77, CAST(13 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10555, 14, CAST(23 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10555, 19, CAST(9 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10555, 24, CAST(5 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10555, 51, CAST(53 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10555, 56, CAST(38 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10556, 72, CAST(35 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10557, 64, CAST(33 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10557, 75, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10558, 47, CAST(10 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10558, 51, CAST(53 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10558, 52, CAST(7 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10558, 53, CAST(33 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10558, 73, CAST(15 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10559, 41, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10559, 55, CAST(24 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10560, 30, CAST(26 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10560, 62, CAST(49 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10561, 44, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10561, 51, CAST(53 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10562, 33, CAST(3 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10562, 62, CAST(49 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10563, 36, CAST(19 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10563, 52, CAST(7 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10564, 17, CAST(39 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10564, 31, CAST(13 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10564, 55, CAST(24 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10565, 24, CAST(5 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10565, 64, CAST(33 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10566, 11, CAST(21 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10566, 18, CAST(63 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10566, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10567, 31, CAST(13 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10567, 51, CAST(53 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10567, 59, CAST(55 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10568, 10, CAST(31 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10569, 31, CAST(13 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10569, 76, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10570, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10570, 56, CAST(38 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10571, 14, CAST(23 AS Decimal(18, 0)), 11, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10571, 42, CAST(14 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10572, 16, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10572, 32, CAST(32 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10572, 40, CAST(18 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10572, 75, CAST(8 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10573, 17, CAST(39 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10573, 34, CAST(14 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10573, 53, CAST(33 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10574, 33, CAST(3 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10574, 40, CAST(18 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10574, 62, CAST(49 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10574, 64, CAST(33 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10575, 59, CAST(55 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10575, 63, CAST(44 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10575, 72, CAST(35 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10575, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10576, 1, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10576, 31, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10576, 44, CAST(19 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10577, 39, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10577, 75, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10577, 77, CAST(13 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10578, 35, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10578, 57, CAST(20 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10579, 15, CAST(16 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10579, 75, CAST(8 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10580, 14, CAST(23 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10580, 41, CAST(10 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10580, 65, CAST(21 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10581, 75, CAST(8 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10582, 57, CAST(20 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10582, 76, CAST(18 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10583, 29, CAST(124 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10583, 60, CAST(34 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10583, 69, CAST(36 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10584, 31, CAST(13 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10585, 47, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10586, 52, CAST(7 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10587, 26, CAST(31 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10587, 35, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10587, 77, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10588, 18, CAST(63 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10588, 42, CAST(14 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10589, 35, CAST(18 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10590, 1, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10590, 77, CAST(13 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10591, 3, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10591, 7, CAST(30 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10591, 54, CAST(7 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10592, 15, CAST(16 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10592, 26, CAST(31 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10593, 20, CAST(81 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10593, 69, CAST(36 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10593, 76, CAST(18 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10594, 52, CAST(7 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10594, 58, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10595, 35, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10595, 61, CAST(29 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10595, 69, CAST(36 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10596, 56, CAST(38 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10596, 63, CAST(44 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10596, 75, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10597, 24, CAST(5 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10597, 57, CAST(20 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10597, 65, CAST(21 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10598, 27, CAST(44 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10598, 71, CAST(22 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10599, 62, CAST(49 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10600, 54, CAST(7 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10600, 73, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10601, 13, CAST(6 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10601, 59, CAST(55 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10602, 77, CAST(13 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10603, 22, CAST(21 AS Decimal(18, 0)), 48, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10603, 49, CAST(20 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10604, 48, CAST(13 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10604, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10605, 16, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10605, 59, CAST(55 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10605, 60, CAST(34 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10605, 71, CAST(22 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10606, 4, CAST(22 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10606, 55, CAST(24 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10606, 62, CAST(49 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10607, 7, CAST(30 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10607, 17, CAST(39 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10607, 33, CAST(3 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10607, 40, CAST(18 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10607, 72, CAST(35 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10608, 56, CAST(38 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10609, 1, CAST(18 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10609, 10, CAST(31 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10609, 21, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10610, 36, CAST(19 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10611, 1, CAST(18 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10611, 2, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10611, 60, CAST(34 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10612, 10, CAST(31 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10612, 36, CAST(19 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10612, 49, CAST(20 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10612, 60, CAST(34 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10612, 76, CAST(18 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10613, 13, CAST(6 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10613, 75, CAST(8 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10614, 11, CAST(21 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10614, 21, CAST(10 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10614, 39, CAST(18 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10615, 55, CAST(24 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10616, 38, CAST(264 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10616, 56, CAST(38 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10616, 70, CAST(15 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10616, 71, CAST(22 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10617, 59, CAST(55 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10618, 6, CAST(25 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10618, 56, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10618, 68, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10619, 21, CAST(10 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10619, 22, CAST(21 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10620, 24, CAST(5 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10620, 52, CAST(7 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10621, 19, CAST(9 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10621, 23, CAST(9 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10621, 70, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10621, 71, CAST(22 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10622, 2, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10622, 68, CAST(13 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10623, 14, CAST(23 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10623, 19, CAST(9 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10623, 21, CAST(10 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10623, 24, CAST(5 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10623, 35, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10624, 28, CAST(46 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10624, 29, CAST(124 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10624, 44, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10625, 14, CAST(23 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10625, 42, CAST(14 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10625, 60, CAST(34 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10626, 53, CAST(33 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10626, 60, CAST(34 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10626, 71, CAST(22 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10627, 62, CAST(49 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10627, 73, CAST(15 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10628, 1, CAST(18 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10629, 29, CAST(124 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10629, 64, CAST(33 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10630, 55, CAST(24 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10630, 76, CAST(18 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10631, 75, CAST(8 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10632, 2, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10632, 33, CAST(3 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10633, 12, CAST(38 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10633, 13, CAST(6 AS Decimal(18, 0)), 13, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10633, 26, CAST(31 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10633, 62, CAST(49 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10634, 7, CAST(30 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10634, 18, CAST(63 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10634, 51, CAST(53 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10634, 75, CAST(8 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10635, 4, CAST(22 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10635, 5, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10635, 22, CAST(21 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10636, 4, CAST(22 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10636, 58, CAST(13 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10637, 11, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10637, 50, CAST(16 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10637, 56, CAST(38 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10638, 45, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10638, 65, CAST(21 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10638, 72, CAST(35 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10639, 18, CAST(63 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10640, 69, CAST(36 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10640, 70, CAST(15 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10641, 2, CAST(19 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10641, 40, CAST(18 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10642, 21, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10642, 61, CAST(29 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10643, 28, CAST(46 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10643, 39, CAST(18 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10643, 46, CAST(12 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10644, 18, CAST(63 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10644, 43, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10644, 46, CAST(12 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10645, 18, CAST(63 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10645, 36, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10646, 1, CAST(18 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10646, 10, CAST(31 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10646, 71, CAST(22 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10646, 77, CAST(13 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10647, 19, CAST(9 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10647, 39, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10648, 22, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10648, 24, CAST(5 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10649, 28, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10649, 72, CAST(35 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10650, 30, CAST(26 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10650, 53, CAST(33 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10650, 54, CAST(7 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10651, 19, CAST(9 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10651, 22, CAST(21 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10652, 30, CAST(26 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10652, 42, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10653, 16, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10653, 60, CAST(34 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10654, 4, CAST(22 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10654, 39, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10654, 54, CAST(7 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10655, 41, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10656, 14, CAST(23 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10656, 44, CAST(19 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10656, 47, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10657, 15, CAST(16 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10657, 41, CAST(10 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10657, 46, CAST(12 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10657, 47, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10657, 56, CAST(38 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10657, 60, CAST(34 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10658, 21, CAST(10 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10658, 40, CAST(18 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10658, 60, CAST(34 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10658, 77, CAST(13 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10659, 31, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10659, 40, CAST(18 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10659, 70, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10660, 20, CAST(81 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10661, 39, CAST(18 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10661, 58, CAST(13 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10662, 68, CAST(13 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10663, 40, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10663, 42, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10663, 51, CAST(53 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10664, 10, CAST(31 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10664, 56, CAST(38 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10664, 65, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10665, 51, CAST(53 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10665, 59, CAST(55 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10665, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10666, 29, CAST(124 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10666, 65, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10667, 69, CAST(36 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10667, 71, CAST(22 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10668, 31, CAST(13 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10668, 55, CAST(24 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10668, 64, CAST(33 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10669, 36, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10670, 23, CAST(9 AS Decimal(18, 0)), 32, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10670, 46, CAST(12 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10670, 67, CAST(14 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10670, 73, CAST(15 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10670, 75, CAST(8 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10671, 16, CAST(17 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10671, 62, CAST(49 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10671, 65, CAST(21 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10672, 38, CAST(264 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10672, 71, CAST(22 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10673, 16, CAST(17 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10673, 42, CAST(14 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10673, 43, CAST(46 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10674, 23, CAST(9 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10675, 14, CAST(23 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10675, 53, CAST(33 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10675, 58, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10676, 10, CAST(31 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10676, 19, CAST(9 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10676, 44, CAST(19 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10677, 26, CAST(31 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10677, 33, CAST(3 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10678, 12, CAST(38 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10678, 33, CAST(3 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10678, 41, CAST(10 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10678, 54, CAST(7 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10679, 59, CAST(55 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10680, 16, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10680, 31, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10680, 42, CAST(14 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10681, 19, CAST(9 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10681, 21, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10681, 64, CAST(33 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10682, 33, CAST(3 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10682, 66, CAST(17 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10682, 75, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10683, 52, CAST(7 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10684, 40, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10684, 47, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10684, 60, CAST(34 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10685, 10, CAST(31 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10685, 41, CAST(10 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10685, 47, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10686, 17, CAST(39 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10686, 26, CAST(31 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10687, 9, CAST(97 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10687, 29, CAST(124 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10687, 36, CAST(19 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10688, 10, CAST(31 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10688, 28, CAST(46 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10688, 34, CAST(14 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10689, 1, CAST(18 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10690, 56, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10690, 77, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10691, 1, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10691, 29, CAST(124 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10691, 43, CAST(46 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10691, 44, CAST(19 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10691, 62, CAST(49 AS Decimal(18, 0)), 48, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10692, 63, CAST(44 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10693, 9, CAST(97 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10693, 54, CAST(7 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10693, 69, CAST(36 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10693, 73, CAST(15 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10694, 7, CAST(30 AS Decimal(18, 0)), 90, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10694, 59, CAST(55 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10694, 70, CAST(15 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10695, 8, CAST(40 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10695, 12, CAST(38 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10695, 24, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10696, 17, CAST(39 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10696, 46, CAST(12 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10697, 19, CAST(9 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10697, 35, CAST(18 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10697, 58, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10697, 70, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10698, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10698, 17, CAST(39 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10698, 29, CAST(124 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10698, 65, CAST(21 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10698, 70, CAST(15 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10699, 47, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10700, 1, CAST(18 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10700, 34, CAST(14 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10700, 68, CAST(13 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10700, 71, CAST(22 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10701, 59, CAST(55 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10701, 71, CAST(22 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10701, 76, CAST(18 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10702, 3, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10702, 76, CAST(18 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10703, 2, CAST(19 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10703, 59, CAST(55 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10703, 73, CAST(15 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10704, 4, CAST(22 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10704, 24, CAST(5 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10704, 48, CAST(13 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10705, 31, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10705, 32, CAST(32 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10706, 16, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10706, 43, CAST(46 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10706, 59, CAST(55 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10707, 55, CAST(24 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10707, 57, CAST(20 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10707, 70, CAST(15 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10708, 5, CAST(21 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10708, 36, CAST(19 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10709, 8, CAST(40 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10709, 51, CAST(53 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10709, 60, CAST(34 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10710, 19, CAST(9 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10710, 47, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10711, 19, CAST(9 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10711, 41, CAST(10 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10711, 53, CAST(33 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10712, 53, CAST(33 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10712, 56, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10713, 10, CAST(31 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10713, 26, CAST(31 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10713, 45, CAST(10 AS Decimal(18, 0)), 110, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10713, 46, CAST(12 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10714, 2, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10714, 17, CAST(39 AS Decimal(18, 0)), 27, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10714, 47, CAST(10 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10714, 56, CAST(38 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10714, 58, CAST(13 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10715, 10, CAST(31 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10715, 71, CAST(22 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10716, 21, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10716, 51, CAST(53 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10716, 61, CAST(29 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10717, 21, CAST(10 AS Decimal(18, 0)), 32, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10717, 54, CAST(7 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10717, 69, CAST(36 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10718, 12, CAST(38 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10718, 16, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10718, 36, CAST(19 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10718, 62, CAST(49 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10719, 18, CAST(63 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10719, 30, CAST(26 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10719, 54, CAST(7 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10720, 35, CAST(18 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10720, 71, CAST(22 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10721, 44, CAST(19 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10722, 2, CAST(19 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10722, 31, CAST(13 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10722, 68, CAST(13 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10722, 75, CAST(8 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10723, 26, CAST(31 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10724, 10, CAST(31 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10724, 61, CAST(29 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10725, 41, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10725, 52, CAST(7 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10725, 55, CAST(24 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10726, 4, CAST(22 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10726, 11, CAST(21 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10727, 17, CAST(39 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10727, 56, CAST(38 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10727, 59, CAST(55 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10728, 30, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10728, 40, CAST(18 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10728, 55, CAST(24 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10728, 60, CAST(34 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10729, 1, CAST(18 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10729, 21, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10729, 50, CAST(16 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10730, 16, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10730, 31, CAST(13 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10730, 65, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10731, 21, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10731, 51, CAST(53 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10732, 76, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10733, 14, CAST(23 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10733, 28, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10733, 52, CAST(7 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10734, 6, CAST(25 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10734, 30, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10734, 76, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10735, 61, CAST(29 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10735, 77, CAST(13 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10736, 65, CAST(21 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10736, 75, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10737, 13, CAST(6 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10737, 41, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10738, 16, CAST(17 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10739, 36, CAST(19 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10739, 52, CAST(7 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10740, 28, CAST(46 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10740, 35, CAST(18 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10740, 45, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10740, 56, CAST(38 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10741, 2, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10742, 3, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10742, 60, CAST(34 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10742, 72, CAST(35 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10743, 46, CAST(12 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10744, 40, CAST(18 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10745, 18, CAST(63 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10745, 44, CAST(19 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10745, 59, CAST(55 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10745, 72, CAST(35 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10746, 13, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10746, 42, CAST(14 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10746, 62, CAST(49 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10746, 69, CAST(36 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10747, 31, CAST(13 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10747, 41, CAST(10 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10747, 63, CAST(44 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10747, 69, CAST(36 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10748, 23, CAST(9 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10748, 40, CAST(18 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10748, 56, CAST(38 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10749, 56, CAST(38 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10749, 59, CAST(55 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10749, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10750, 14, CAST(23 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10750, 45, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10750, 59, CAST(55 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10751, 26, CAST(31 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10751, 30, CAST(26 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10751, 50, CAST(16 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10751, 73, CAST(15 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10752, 1, CAST(18 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10752, 69, CAST(36 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10753, 45, CAST(10 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10753, 74, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10754, 40, CAST(18 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10755, 47, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10755, 56, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10755, 57, CAST(20 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10755, 69, CAST(36 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10756, 18, CAST(63 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10756, 36, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10756, 68, CAST(13 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10756, 69, CAST(36 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10757, 34, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10757, 59, CAST(55 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10757, 62, CAST(49 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10757, 64, CAST(33 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10758, 26, CAST(31 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10758, 52, CAST(7 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10758, 70, CAST(15 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10759, 32, CAST(32 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10760, 25, CAST(14 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10760, 27, CAST(44 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10760, 43, CAST(46 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10761, 25, CAST(14 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10761, 75, CAST(8 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10762, 39, CAST(18 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10762, 47, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10762, 51, CAST(53 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10762, 56, CAST(38 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10763, 21, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10763, 22, CAST(21 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10763, 24, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10764, 3, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10764, 39, CAST(18 AS Decimal(18, 0)), 130, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10765, 65, CAST(21 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10766, 2, CAST(19 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10766, 7, CAST(30 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10766, 68, CAST(13 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10767, 42, CAST(14 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10768, 22, CAST(21 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10768, 31, CAST(13 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10768, 60, CAST(34 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10768, 71, CAST(22 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10769, 41, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10769, 52, CAST(7 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10769, 61, CAST(29 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10769, 62, CAST(49 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10770, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10771, 71, CAST(22 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10772, 29, CAST(124 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10772, 59, CAST(55 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10773, 17, CAST(39 AS Decimal(18, 0)), 33, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10773, 31, CAST(13 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10773, 75, CAST(8 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10774, 31, CAST(13 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10774, 66, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10775, 10, CAST(31 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10775, 67, CAST(14 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10776, 31, CAST(13 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10776, 42, CAST(14 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10776, 45, CAST(10 AS Decimal(18, 0)), 27, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10776, 51, CAST(53 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10777, 42, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10778, 41, CAST(10 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10779, 16, CAST(17 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10779, 62, CAST(49 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10780, 70, CAST(15 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10780, 77, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10781, 54, CAST(7 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10781, 56, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10781, 74, CAST(10 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10782, 31, CAST(13 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10783, 31, CAST(13 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10783, 38, CAST(264 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10784, 36, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10784, 39, CAST(18 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10784, 72, CAST(35 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10785, 10, CAST(31 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10785, 75, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10786, 8, CAST(40 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10786, 30, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10786, 75, CAST(8 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10787, 2, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10787, 29, CAST(124 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10788, 19, CAST(9 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10788, 75, CAST(8 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10789, 18, CAST(63 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10789, 35, CAST(18 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10789, 63, CAST(44 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10789, 68, CAST(13 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10790, 7, CAST(30 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10790, 56, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10791, 29, CAST(124 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10791, 41, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10792, 2, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10792, 54, CAST(7 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10792, 68, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10793, 41, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10793, 52, CAST(7 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10794, 14, CAST(23 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10794, 54, CAST(7 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10795, 16, CAST(17 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10795, 17, CAST(39 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10796, 26, CAST(31 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10796, 44, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10796, 64, CAST(33 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10796, 69, CAST(36 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10797, 11, CAST(21 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10798, 62, CAST(49 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10798, 72, CAST(35 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10799, 13, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10799, 24, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10799, 59, CAST(55 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10800, 11, CAST(21 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10800, 51, CAST(53 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10800, 54, CAST(7 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10801, 17, CAST(39 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10801, 29, CAST(124 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10802, 30, CAST(26 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10802, 51, CAST(53 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10802, 55, CAST(24 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10802, 62, CAST(49 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10803, 19, CAST(9 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10803, 25, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10803, 59, CAST(55 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10804, 10, CAST(31 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10804, 28, CAST(46 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10804, 49, CAST(20 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10805, 34, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10805, 38, CAST(264 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10806, 2, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10806, 65, CAST(21 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10806, 74, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10807, 40, CAST(18 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10808, 56, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10808, 76, CAST(18 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10809, 52, CAST(7 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10810, 13, CAST(6 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10810, 25, CAST(14 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10810, 70, CAST(15 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10811, 19, CAST(9 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10811, 23, CAST(9 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10811, 40, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10812, 31, CAST(13 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10812, 72, CAST(35 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10812, 77, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10813, 2, CAST(19 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10813, 46, CAST(12 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10814, 41, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10814, 43, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10814, 48, CAST(13 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10814, 61, CAST(29 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10815, 33, CAST(3 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10816, 38, CAST(264 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10816, 62, CAST(49 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10817, 26, CAST(31 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10817, 38, CAST(264 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10817, 40, CAST(18 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10817, 62, CAST(49 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10818, 32, CAST(32 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10818, 41, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10819, 43, CAST(46 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10819, 75, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10820, 56, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10821, 35, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10821, 51, CAST(53 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10822, 62, CAST(49 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10822, 70, CAST(15 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10823, 11, CAST(21 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10823, 57, CAST(20 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10823, 59, CAST(55 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10823, 77, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10824, 41, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10824, 70, CAST(15 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10825, 26, CAST(31 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10825, 53, CAST(33 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10826, 31, CAST(13 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10826, 57, CAST(20 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10827, 10, CAST(31 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10827, 39, CAST(18 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10828, 20, CAST(81 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10828, 38, CAST(264 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10829, 2, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10829, 8, CAST(40 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10829, 13, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10829, 60, CAST(34 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10830, 6, CAST(25 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10830, 39, CAST(18 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10830, 60, CAST(34 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10830, 68, CAST(13 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10831, 19, CAST(9 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10831, 35, CAST(18 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10831, 38, CAST(264 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10831, 43, CAST(46 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10832, 13, CAST(6 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10832, 25, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10832, 44, CAST(19 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10832, 64, CAST(33 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10833, 7, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10833, 31, CAST(13 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10833, 53, CAST(33 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10834, 29, CAST(124 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10834, 30, CAST(26 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10835, 59, CAST(55 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10835, 77, CAST(13 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10836, 22, CAST(21 AS Decimal(18, 0)), 52, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10836, 35, CAST(18 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10836, 57, CAST(20 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10836, 60, CAST(34 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10836, 64, CAST(33 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10837, 13, CAST(6 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10837, 40, CAST(18 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10837, 47, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10837, 76, CAST(18 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10838, 1, CAST(18 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10838, 18, CAST(63 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10838, 36, CAST(19 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10839, 58, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10839, 72, CAST(35 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10840, 25, CAST(14 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10840, 39, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10841, 10, CAST(31 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10841, 56, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10841, 59, CAST(55 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10841, 77, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10842, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10842, 43, CAST(46 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10842, 68, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10842, 70, CAST(15 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10843, 51, CAST(53 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10844, 22, CAST(21 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10845, 23, CAST(9 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10845, 35, CAST(18 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10845, 42, CAST(14 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10845, 58, CAST(13 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10845, 64, CAST(33 AS Decimal(18, 0)), 48, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10846, 4, CAST(22 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10846, 70, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10846, 74, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10847, 1, CAST(18 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10847, 19, CAST(9 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10847, 37, CAST(26 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10847, 45, CAST(10 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10847, 60, CAST(34 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10847, 71, CAST(22 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10848, 5, CAST(21 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10848, 9, CAST(97 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10849, 3, CAST(10 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10849, 26, CAST(31 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10850, 25, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10850, 33, CAST(3 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10850, 70, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10851, 2, CAST(19 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10851, 25, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10851, 57, CAST(20 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10851, 59, CAST(55 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10852, 2, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10852, 17, CAST(39 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10852, 62, CAST(49 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10853, 18, CAST(63 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10854, 10, CAST(31 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10854, 13, CAST(6 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10855, 16, CAST(17 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10855, 31, CAST(13 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10855, 56, CAST(38 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10855, 65, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10856, 2, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10856, 42, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10857, 3, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10857, 26, CAST(31 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10857, 29, CAST(124 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10858, 7, CAST(30 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10858, 27, CAST(44 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10858, 70, CAST(15 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10859, 24, CAST(5 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10859, 54, CAST(7 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10859, 64, CAST(33 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10860, 51, CAST(53 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10860, 76, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10861, 17, CAST(39 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10861, 18, CAST(63 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10861, 21, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10861, 33, CAST(3 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10861, 62, CAST(49 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10862, 11, CAST(21 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10862, 52, CAST(7 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10863, 1, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10863, 58, CAST(13 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10864, 35, CAST(18 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10864, 67, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10865, 38, CAST(264 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10865, 39, CAST(18 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10866, 2, CAST(19 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10866, 24, CAST(5 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10866, 30, CAST(26 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10867, 53, CAST(33 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10868, 26, CAST(31 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10868, 35, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10868, 49, CAST(20 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10869, 1, CAST(18 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10869, 11, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10869, 23, CAST(9 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10869, 68, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10870, 35, CAST(18 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10870, 51, CAST(53 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10871, 6, CAST(25 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10871, 16, CAST(17 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10871, 17, CAST(39 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10872, 55, CAST(24 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10872, 62, CAST(49 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10872, 64, CAST(33 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10872, 65, CAST(21 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10873, 21, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10873, 28, CAST(46 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10874, 10, CAST(31 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10875, 19, CAST(9 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10875, 47, CAST(10 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10875, 49, CAST(20 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10876, 46, CAST(12 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10876, 64, CAST(33 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10877, 16, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10877, 18, CAST(63 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10878, 20, CAST(81 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10879, 40, CAST(18 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10879, 65, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10879, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10880, 23, CAST(9 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10880, 61, CAST(29 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10880, 70, CAST(15 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10881, 73, CAST(15 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10882, 42, CAST(14 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10882, 49, CAST(20 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10882, 54, CAST(7 AS Decimal(18, 0)), 32, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10883, 24, CAST(5 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10884, 21, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10884, 56, CAST(38 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10884, 65, CAST(21 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10885, 2, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10885, 24, CAST(5 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10885, 70, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10885, 77, CAST(13 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10886, 10, CAST(31 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10886, 31, CAST(13 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10886, 77, CAST(13 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10887, 25, CAST(14 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10888, 2, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10888, 68, CAST(13 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10889, 11, CAST(21 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10889, 38, CAST(264 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10890, 17, CAST(39 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10890, 34, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10890, 41, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10891, 30, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10892, 59, CAST(55 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10893, 8, CAST(40 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10893, 24, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10893, 29, CAST(124 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10893, 30, CAST(26 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10893, 36, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10894, 13, CAST(6 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10894, 69, CAST(36 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10894, 75, CAST(8 AS Decimal(18, 0)), 120, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10895, 24, CAST(5 AS Decimal(18, 0)), 110, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10895, 39, CAST(18 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10895, 40, CAST(18 AS Decimal(18, 0)), 91, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10895, 60, CAST(34 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10896, 45, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10896, 56, CAST(38 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10897, 29, CAST(124 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10897, 30, CAST(26 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10898, 13, CAST(6 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10899, 39, CAST(18 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10900, 70, CAST(15 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10901, 41, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10901, 71, CAST(22 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10902, 55, CAST(24 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10902, 62, CAST(49 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10903, 13, CAST(6 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10903, 65, CAST(21 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10903, 68, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10904, 58, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10904, 62, CAST(49 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10905, 1, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10906, 61, CAST(29 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10907, 75, CAST(8 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10908, 7, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10908, 52, CAST(7 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10909, 7, CAST(30 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10909, 16, CAST(17 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10909, 41, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10910, 19, CAST(9 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10910, 49, CAST(20 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10910, 61, CAST(29 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10911, 1, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10911, 17, CAST(39 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10911, 67, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10912, 11, CAST(21 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10912, 29, CAST(124 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10913, 4, CAST(22 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10913, 33, CAST(3 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10913, 58, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10914, 71, CAST(22 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10915, 17, CAST(39 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10915, 33, CAST(3 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10915, 54, CAST(7 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10916, 16, CAST(17 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10916, 32, CAST(32 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10916, 57, CAST(20 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10917, 30, CAST(26 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10917, 60, CAST(34 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10918, 1, CAST(18 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10918, 60, CAST(34 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10919, 16, CAST(17 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10919, 25, CAST(14 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10919, 40, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10920, 50, CAST(16 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10921, 35, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10921, 63, CAST(44 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10922, 17, CAST(39 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10922, 24, CAST(5 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10923, 42, CAST(14 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10923, 43, CAST(46 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10923, 67, CAST(14 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10924, 10, CAST(31 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10924, 28, CAST(46 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10924, 75, CAST(8 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10925, 36, CAST(19 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10925, 52, CAST(7 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10926, 11, CAST(21 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10926, 13, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10926, 19, CAST(9 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10926, 72, CAST(35 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10927, 20, CAST(81 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10927, 52, CAST(7 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10927, 76, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10928, 47, CAST(10 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10928, 76, CAST(18 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10929, 21, CAST(10 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10929, 75, CAST(8 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10929, 77, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10930, 21, CAST(10 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10930, 27, CAST(44 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10930, 55, CAST(24 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10930, 58, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10931, 13, CAST(6 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10931, 57, CAST(20 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10932, 16, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10932, 62, CAST(49 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10932, 72, CAST(35 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10932, 75, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10933, 53, CAST(33 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10933, 61, CAST(29 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10934, 6, CAST(25 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10935, 1, CAST(18 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10935, 18, CAST(63 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10935, 23, CAST(9 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10936, 36, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10937, 28, CAST(46 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10937, 34, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10938, 13, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10938, 43, CAST(46 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10938, 60, CAST(34 AS Decimal(18, 0)), 49, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10938, 71, CAST(22 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10939, 2, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10939, 67, CAST(14 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10940, 7, CAST(30 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10940, 13, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10941, 31, CAST(13 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10941, 62, CAST(49 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10941, 68, CAST(13 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10941, 72, CAST(35 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10942, 49, CAST(20 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10943, 13, CAST(6 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10943, 22, CAST(21 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10943, 46, CAST(12 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10944, 11, CAST(21 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10944, 44, CAST(19 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10944, 56, CAST(38 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10945, 13, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10945, 31, CAST(13 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10946, 10, CAST(31 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10946, 24, CAST(5 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10946, 77, CAST(13 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10947, 59, CAST(55 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10948, 50, CAST(16 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10948, 51, CAST(53 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10948, 55, CAST(24 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10949, 6, CAST(25 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10949, 10, CAST(31 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10949, 17, CAST(39 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10949, 62, CAST(49 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10950, 4, CAST(22 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10951, 33, CAST(3 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10951, 41, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10951, 75, CAST(8 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10952, 6, CAST(25 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10952, 28, CAST(46 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10953, 20, CAST(81 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10953, 31, CAST(13 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10954, 16, CAST(17 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10954, 31, CAST(13 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10954, 45, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10954, 60, CAST(34 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10955, 75, CAST(8 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10956, 21, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10956, 47, CAST(10 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10956, 51, CAST(53 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10957, 30, CAST(26 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10957, 35, CAST(18 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10957, 64, CAST(33 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10958, 5, CAST(21 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10958, 7, CAST(30 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10958, 72, CAST(35 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10959, 75, CAST(8 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10960, 24, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10960, 41, CAST(10 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10961, 52, CAST(7 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10961, 76, CAST(18 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10962, 7, CAST(30 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10962, 13, CAST(6 AS Decimal(18, 0)), 77, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10962, 53, CAST(33 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10962, 69, CAST(36 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10962, 76, CAST(18 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10963, 60, CAST(34 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10964, 18, CAST(63 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10964, 38, CAST(264 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10964, 69, CAST(36 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10965, 51, CAST(53 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10966, 37, CAST(26 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10966, 56, CAST(38 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10966, 62, CAST(49 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10967, 19, CAST(9 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10967, 49, CAST(20 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10968, 12, CAST(38 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10968, 24, CAST(5 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10968, 64, CAST(33 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10969, 46, CAST(12 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10970, 52, CAST(7 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10971, 29, CAST(124 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10972, 17, CAST(39 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10972, 33, CAST(3 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10973, 26, CAST(31 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10973, 41, CAST(10 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10973, 75, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10974, 63, CAST(44 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10975, 8, CAST(40 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10975, 75, CAST(8 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10976, 28, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10977, 39, CAST(18 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10977, 47, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10977, 51, CAST(53 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10977, 63, CAST(44 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10978, 8, CAST(40 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10978, 21, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10978, 40, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10978, 44, CAST(19 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10979, 7, CAST(30 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10979, 12, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10979, 24, CAST(5 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10979, 27, CAST(44 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10979, 31, CAST(13 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10979, 63, CAST(44 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10980, 75, CAST(8 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10981, 38, CAST(264 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10982, 7, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10982, 43, CAST(46 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10983, 13, CAST(6 AS Decimal(18, 0)), 84, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10983, 57, CAST(20 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10984, 16, CAST(17 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10984, 24, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10984, 36, CAST(19 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10985, 16, CAST(17 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10985, 18, CAST(63 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10985, 32, CAST(32 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10986, 11, CAST(21 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10986, 20, CAST(81 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10986, 76, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10986, 77, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10987, 7, CAST(30 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10987, 43, CAST(46 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10987, 72, CAST(35 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10988, 7, CAST(30 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10988, 62, CAST(49 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10989, 6, CAST(25 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10989, 11, CAST(21 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10989, 41, CAST(10 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10990, 21, CAST(10 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10990, 34, CAST(14 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10990, 55, CAST(24 AS Decimal(18, 0)), 65, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10990, 61, CAST(29 AS Decimal(18, 0)), 66, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10991, 2, CAST(19 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10991, 70, CAST(15 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10991, 76, CAST(18 AS Decimal(18, 0)), 90, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10992, 72, CAST(35 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10993, 29, CAST(124 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10993, 41, CAST(10 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10994, 59, CAST(55 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10995, 51, CAST(53 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10995, 60, CAST(34 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10996, 42, CAST(14 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10997, 32, CAST(32 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10997, 46, CAST(12 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10997, 52, CAST(7 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10998, 24, CAST(5 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10998, 61, CAST(29 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10998, 74, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10998, 75, CAST(8 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10999, 41, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10999, 51, CAST(53 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (10999, 77, CAST(13 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11000, 4, CAST(22 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11000, 24, CAST(5 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11000, 77, CAST(13 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11001, 7, CAST(30 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11001, 22, CAST(21 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11001, 46, CAST(12 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11001, 55, CAST(24 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11002, 13, CAST(6 AS Decimal(18, 0)), 56, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11002, 35, CAST(18 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11002, 42, CAST(14 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11002, 55, CAST(24 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11003, 1, CAST(18 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11003, 40, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11003, 52, CAST(7 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11004, 26, CAST(31 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11004, 76, CAST(18 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11005, 1, CAST(18 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11005, 59, CAST(55 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11006, 1, CAST(18 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11006, 29, CAST(124 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11007, 8, CAST(40 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11007, 29, CAST(124 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11007, 42, CAST(14 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11008, 28, CAST(46 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11008, 34, CAST(14 AS Decimal(18, 0)), 90, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11008, 71, CAST(22 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11009, 24, CAST(5 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11009, 36, CAST(19 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11009, 60, CAST(34 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11010, 7, CAST(30 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11010, 24, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11011, 58, CAST(13 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11011, 71, CAST(22 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11012, 19, CAST(9 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11012, 60, CAST(34 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11012, 71, CAST(22 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11013, 23, CAST(9 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11013, 42, CAST(14 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11013, 45, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11013, 68, CAST(13 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11014, 41, CAST(10 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11015, 30, CAST(26 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11015, 77, CAST(13 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11016, 31, CAST(13 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11016, 36, CAST(19 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11017, 3, CAST(10 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11017, 59, CAST(55 AS Decimal(18, 0)), 110, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11017, 70, CAST(15 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11018, 12, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11018, 18, CAST(63 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11018, 56, CAST(38 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11019, 46, CAST(12 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11019, 49, CAST(20 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11020, 10, CAST(31 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11021, 2, CAST(19 AS Decimal(18, 0)), 11, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11021, 20, CAST(81 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11021, 26, CAST(31 AS Decimal(18, 0)), 63, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11021, 51, CAST(53 AS Decimal(18, 0)), 44, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11021, 72, CAST(35 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11022, 19, CAST(9 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11022, 69, CAST(36 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11023, 7, CAST(30 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11023, 43, CAST(46 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11024, 26, CAST(31 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11024, 33, CAST(3 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11024, 65, CAST(21 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11024, 71, CAST(22 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11025, 1, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11025, 13, CAST(6 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11026, 18, CAST(63 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11026, 51, CAST(53 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11027, 24, CAST(5 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11027, 62, CAST(49 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11028, 55, CAST(24 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11028, 59, CAST(55 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11029, 56, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11029, 63, CAST(44 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11030, 2, CAST(19 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11030, 5, CAST(21 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11030, 29, CAST(124 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11030, 59, CAST(55 AS Decimal(18, 0)), 100, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11031, 1, CAST(18 AS Decimal(18, 0)), 45, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11031, 13, CAST(6 AS Decimal(18, 0)), 80, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11031, 24, CAST(5 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11031, 64, CAST(33 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11031, 71, CAST(22 AS Decimal(18, 0)), 16, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11032, 36, CAST(19 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11032, 38, CAST(264 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11032, 59, CAST(55 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11033, 53, CAST(33 AS Decimal(18, 0)), 70, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11033, 69, CAST(36 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11034, 21, CAST(10 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11034, 44, CAST(19 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11034, 61, CAST(29 AS Decimal(18, 0)), 6, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11035, 1, CAST(18 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11035, 35, CAST(18 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11035, 42, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11035, 54, CAST(7 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11036, 13, CAST(6 AS Decimal(18, 0)), 7, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11036, 59, CAST(55 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11037, 70, CAST(15 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11038, 40, CAST(18 AS Decimal(18, 0)), 5, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11038, 52, CAST(7 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11038, 71, CAST(22 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11039, 28, CAST(46 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11039, 35, CAST(18 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11039, 49, CAST(20 AS Decimal(18, 0)), 60, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11039, 57, CAST(20 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11040, 21, CAST(10 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11041, 2, CAST(19 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11041, 63, CAST(44 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11042, 44, CAST(19 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11042, 61, CAST(29 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11043, 11, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11044, 62, CAST(49 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11045, 33, CAST(3 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11045, 51, CAST(53 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11046, 12, CAST(38 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11046, 32, CAST(32 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11046, 35, CAST(18 AS Decimal(18, 0)), 18, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11047, 1, CAST(18 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11047, 5, CAST(21 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11048, 68, CAST(13 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11049, 2, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11049, 12, CAST(38 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11050, 76, CAST(18 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11051, 24, CAST(5 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11052, 43, CAST(46 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11052, 61, CAST(29 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11053, 18, CAST(63 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11053, 32, CAST(32 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11053, 64, CAST(33 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11054, 33, CAST(3 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11054, 67, CAST(14 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11055, 24, CAST(5 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11055, 25, CAST(14 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11055, 51, CAST(53 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11055, 57, CAST(20 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11056, 7, CAST(30 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11056, 55, CAST(24 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11056, 60, CAST(34 AS Decimal(18, 0)), 50, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11057, 70, CAST(15 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11058, 21, CAST(10 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11058, 60, CAST(34 AS Decimal(18, 0)), 21, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11058, 61, CAST(29 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11059, 13, CAST(6 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11059, 17, CAST(39 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11059, 60, CAST(34 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11060, 60, CAST(34 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11060, 77, CAST(13 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11061, 60, CAST(34 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11062, 53, CAST(33 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11062, 70, CAST(15 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11063, 34, CAST(14 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11063, 40, CAST(18 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11063, 41, CAST(10 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11064, 17, CAST(39 AS Decimal(18, 0)), 77, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11064, 41, CAST(10 AS Decimal(18, 0)), 12, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11064, 53, CAST(33 AS Decimal(18, 0)), 25, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11064, 55, CAST(24 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11064, 68, CAST(13 AS Decimal(18, 0)), 55, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11065, 30, CAST(26 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11065, 54, CAST(7 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11066, 16, CAST(17 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11066, 19, CAST(9 AS Decimal(18, 0)), 42, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11066, 34, CAST(14 AS Decimal(18, 0)), 35, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11067, 41, CAST(10 AS Decimal(18, 0)), 9, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11068, 28, CAST(46 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11068, 43, CAST(46 AS Decimal(18, 0)), 36, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11068, 77, CAST(13 AS Decimal(18, 0)), 28, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11069, 39, CAST(18 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11070, 1, CAST(18 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11070, 2, CAST(19 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11070, 16, CAST(17 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11070, 31, CAST(13 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11071, 7, CAST(30 AS Decimal(18, 0)), 15, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11071, 13, CAST(6 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11072, 2, CAST(19 AS Decimal(18, 0)), 8, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11072, 41, CAST(10 AS Decimal(18, 0)), 40, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11072, 50, CAST(16 AS Decimal(18, 0)), 22, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11072, 64, CAST(33 AS Decimal(18, 0)), 130, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11073, 11, CAST(21 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11073, 24, CAST(5 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11074, 16, CAST(17 AS Decimal(18, 0)), 14, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11075, 2, CAST(19 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11075, 46, CAST(12 AS Decimal(18, 0)), 30, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11075, 76, CAST(18 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11076, 6, CAST(25 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11076, 14, CAST(23 AS Decimal(18, 0)), 20, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11076, 19, CAST(9 AS Decimal(18, 0)), 10, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 2, CAST(19 AS Decimal(18, 0)), 24, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 3, CAST(10 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 4, CAST(22 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 6, CAST(25 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 7, CAST(30 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 8, CAST(40 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 10, CAST(31 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 12, CAST(38 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 13, CAST(6 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 14, CAST(23 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 16, CAST(17 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 20, CAST(81 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 23, CAST(9 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 32, CAST(32 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 39, CAST(18 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 41, CAST(10 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 46, CAST(12 AS Decimal(18, 0)), 3, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 52, CAST(7 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 55, CAST(24 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 60, CAST(34 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 64, CAST(33 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 66, CAST(17 AS Decimal(18, 0)), 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 73, CAST(15 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 75, CAST(8 AS Decimal(18, 0)), 4, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[detallesdepedidos] ([idpedido], [idproducto], [preciounidad], [cantidad], [descuento]) VALUES (11077, 77, CAST(13 AS Decimal(18, 0)), 2, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (1, N'Davolio', N'Nancy', N'Representante de ventas', N'Srta.', CAST(N'1948-12-08' AS Date), CAST(N'1992-05-01' AS Date), N'507 - 20th Ave. E.Apt. 2A', N'Seattle', N'WA', N'98122', N'EE.UU.', N'(206) 555-9857', N'5467', N'Su formación incluye una licenciatura en Psicología por la Universidad del Estado de Colorado. en 1970. También completó "El arte de la llamada fría". Nancy es miembro de Toastmasters Internacional.', 2, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (2, N'Fuller', N'Andrew', N'Vicepresidente comercial', N'Dr.', CAST(N'1952-02-19' AS Date), CAST(N'1992-08-14' AS Date), N'908 W. Capital Way', N'Tacoma', N'WA', N'98401', N'EE.UU.', N'(206) 555-9482', N'3457', N'Andrew completó su licenciatura en Comercio en 1974 y un doctorado en Marketing Internacional de la Universidad de Dallas en 1981. Habla con fluidez en francés e italiano y lee el alemán. Ingresó en la empresa como representante de ventas. fue ascendidoen Enero de 1992 y a vicepresidente comercial en Marzo de 1993.Andrew es miembro de la Mesa redonda de administración de Ventas. la Cámara de comercio de Seattle y de la Asociación de importadores Rim del Pacífico.', NULL, NULL)
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (3, N'Leverling', N'Janet', N'Representante de ventas', N'Srta.', CAST(N'1963-08-30' AS Date), CAST(N'1992-04-01' AS Date), N'722 Moss Bay Blvd.', N'Kirkland', N'WA', N'98033', N'EE.UU.', N'(206) 555-3412', N'3355', N'Janet es licenciada en Química por la Universidad de Boston (1984). También ha completado un programa de formación en Gestión de minoristas de alimentación. Janet fue contratada como vendedora asociada en 1991 y fue ascendida a representante de ventas en Febrero de 1992', 2, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (4, N'Peacock', N'Margaret', N'Representante de ventas', N'Sra.', CAST(N'1937-09-19' AS Date), CAST(N'1993-05-03' AS Date), N'4110 Old Redmond Rd.', N'Redmond', N'WA', N'98052', N'EE.UU.', N'(206) 555-8122', N'5176', N'Margaret es licenciada en Literatura inglesa por el Colegio Universitario Concordia (1958). y tiene un master del Instituto Americano de Artes Culinarias (1966). Estuvo asignada temporalmente a la oficina de Londres desde julio hasta Noviembre de 1992.', 2, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (5, N'Buchanan', N'Steven', N'Gerente de ventas', N'Sr.', CAST(N'1955-03-04' AS Date), CAST(N'1993-10-17' AS Date), N'14 Garrett Hill', N'Londres', NULL, N'SW1 8JR', N'Reino Unido', N'(71) 555-4848', N'3453', N'Steven Buchanan se graduó en la Universidad de St. Andrews. Escocia. en 1976. Tras su ingreso en la empresa. en 1992. dedicó 6 meses a un programa de orientación en la oficina de Seattle y luego volvió a su puesto permanente en Londres.Fue ascendido a gestor de ventas en Marzo de 1993. Ha completado con éxito los cursos de Telemarketing y Gestión de ventas internacional. Habla francés.', 2, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (6, N'Suyama', N'Michael', N'Representante de ventas', N'Sr.', CAST(N'1963-07-02' AS Date), CAST(N'1993-10-17' AS Date), N'Coventry HouseMiner Rd.', N'Londres', NULL, N'EC2 7JR', N'Reino Unido', N'(71) 555-7773', N'428', N'Michael se graduó en la Universidad de Sussex (MA. economía. 1983) y la Universidad de California en Los Angeles (MBA. marketing. 1986). También ha asistido a cursos de Ventas multiculturales y Administración del tiempo para profesionales de ventas. Hablajaponés y lee y escribe en francés. portugués y español.', 5, NULL)
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (7, N'King', N'Robert', N'Representante de ventas', N'Sr.', CAST(N'1960-05-29' AS Date), CAST(N'1994-01-02' AS Date), N'Edgeham HollowWinchester Way', N'Londres', NULL, N'RG1 9SP', N'Reino Unido', N'(71) 555-5598', N'465', N'Robert King sirvió en la organización Peace Corps y viajó mucho. antes de completar su licenciatura en inglés en la Universidad de Michigan en 1992. el año en que ingresó en la empresa. Después de completar un curso denominado "Ventas en Europa". fuetransferido a la oficina de Londres en Marzo de 1993.', 5, NULL)
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (8, N'Callahan', N'Laura', N'Coordinador ventas interno', N'Srta.', CAST(N'1958-01-09' AS Date), CAST(N'1994-03-05' AS Date), N'4726 - 11th Ave. N.E.', N'Seattle', N'WA', N'98105', N'EE.UU.', N'(206) 555-1189', N'2344', N'Laura se graduó en Psicología por la Universidad de Washington. También completó un curso de francés de negocios. Lee y escribe en francés.', 2, CAST(1000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Empleados] ([IdEmpleado], [Apellidos], [Nombre], [cargo], [Tratamiento], [FechaNacimiento], [FechaContratacion], [direccion], [ciudad], [region], [codPostal], [pais], [TelDomicilio], [Extension], [notas], [Jefe], [sueldoBasico]) VALUES (9, N'Dodsworth', N'Anne', N'Representante de ventas', N'Srta.', CAST(N'1966-01-27' AS Date), CAST(N'1994-11-15' AS Date), N'7 Houndstooth Rd.', N'Londres', NULL, N'WG2 7LT', N'Reino Unido', N'(71) 555-4444', N'452', N'Anne tiene una licenciatura en inglés por el  St. Lawrence College.  Habla con fluidez el francés y el alemán.', 5, NULL)
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10248, N'WILMK', 5, CAST(N'1994-08-04' AS Date), CAST(N'1994-09-01' AS Date), CAST(N'1994-08-16' AS Date), 3, CAST(32 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10249, N'TOMSP', 6, CAST(N'1994-08-05' AS Date), CAST(N'1994-09-16' AS Date), CAST(N'1994-08-10' AS Date), 1, CAST(12 AS Decimal(18, 0)), N'Toms Spezialitäten', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10250, N'HANAR', 4, CAST(N'1994-08-08' AS Date), CAST(N'1994-09-05' AS Date), CAST(N'1994-08-12' AS Date), 2, CAST(66 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10251, N'VICTE', 3, CAST(N'1994-08-08' AS Date), CAST(N'1994-09-05' AS Date), CAST(N'1994-08-15' AS Date), 1, CAST(41 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10252, N'SUPRD', 4, CAST(N'1994-08-09' AS Date), CAST(N'1994-09-06' AS Date), CAST(N'1994-08-11' AS Date), 2, CAST(51 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10253, N'HANAR', 3, CAST(N'1994-08-10' AS Date), CAST(N'1994-08-24' AS Date), CAST(N'1994-08-16' AS Date), 2, CAST(58 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10254, N'CHOPS', 5, CAST(N'1994-08-11' AS Date), CAST(N'1994-09-08' AS Date), CAST(N'1994-08-23' AS Date), 2, CAST(23 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10255, N'RICSU', 9, CAST(N'1994-08-12' AS Date), CAST(N'1994-09-09' AS Date), CAST(N'1994-08-15' AS Date), 3, CAST(148 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10256, N'WELLI', 3, CAST(N'1994-08-15' AS Date), CAST(N'1994-09-12' AS Date), CAST(N'1994-08-17' AS Date), 2, CAST(14 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10257, N'HILAA', 4, CAST(N'1994-08-16' AS Date), CAST(N'1994-09-13' AS Date), CAST(N'1994-08-22' AS Date), 3, CAST(82 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10258, N'ERNSH', 1, CAST(N'1994-08-17' AS Date), CAST(N'1994-09-14' AS Date), CAST(N'1994-08-23' AS Date), 1, CAST(141 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10259, N'CENTC', 4, CAST(N'1994-08-18' AS Date), CAST(N'1994-09-15' AS Date), CAST(N'1994-08-25' AS Date), 3, CAST(3 AS Decimal(18, 0)), N'Centro comercial Moctezuma', N'Sierras de Granada 9993', N'México D.F.', NULL, N'05022', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10260, N'OTTIK', 4, CAST(N'1994-08-19' AS Date), CAST(N'1994-09-16' AS Date), CAST(N'1994-08-29' AS Date), 1, CAST(55 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10261, N'QUEDE', 4, CAST(N'1994-08-19' AS Date), CAST(N'1994-09-16' AS Date), CAST(N'1994-08-30' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10262, N'RATTC', 8, CAST(N'1994-08-22' AS Date), CAST(N'1994-09-19' AS Date), CAST(N'1994-08-25' AS Date), 3, CAST(48 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10263, N'ERNSH', 9, CAST(N'1994-08-23' AS Date), CAST(N'1994-09-20' AS Date), CAST(N'1994-08-31' AS Date), 3, CAST(146 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10264, N'FOLKO', 6, CAST(N'1994-08-24' AS Date), CAST(N'1994-09-21' AS Date), CAST(N'1994-09-23' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10265, N'BLONP', 2, CAST(N'1994-08-25' AS Date), CAST(N'1994-09-22' AS Date), CAST(N'1994-09-12' AS Date), 1, CAST(55 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10266, N'WARTH', 3, CAST(N'1994-08-26' AS Date), CAST(N'1994-10-07' AS Date), CAST(N'1994-08-31' AS Date), 3, CAST(26 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10267, N'FRANK', 4, CAST(N'1994-08-29' AS Date), CAST(N'1994-09-26' AS Date), CAST(N'1994-09-06' AS Date), 1, CAST(209 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10268, N'GROSR', 8, CAST(N'1994-08-30' AS Date), CAST(N'1994-09-27' AS Date), CAST(N'1994-09-02' AS Date), 3, CAST(66 AS Decimal(18, 0)), N'GROSELLA-Restaurante', N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10269, N'WHITC', 5, CAST(N'1994-08-31' AS Date), CAST(N'1994-09-14' AS Date), CAST(N'1994-09-09' AS Date), 1, CAST(5 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10270, N'WARTH', 1, CAST(N'1994-09-01' AS Date), CAST(N'1994-09-29' AS Date), CAST(N'1994-09-02' AS Date), 1, CAST(137 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10271, N'SPLIR', 6, CAST(N'1994-09-01' AS Date), CAST(N'1994-09-29' AS Date), CAST(N'1994-09-30' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10272, N'RATTC', 6, CAST(N'1994-09-02' AS Date), CAST(N'1994-09-30' AS Date), CAST(N'1994-09-06' AS Date), 2, CAST(98 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10273, N'QUICK', 3, CAST(N'1994-09-05' AS Date), CAST(N'1994-10-03' AS Date), CAST(N'1994-09-12' AS Date), 3, CAST(76 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10274, N'VINET', 6, CAST(N'1994-09-06' AS Date), CAST(N'1994-10-04' AS Date), CAST(N'1994-09-16' AS Date), 1, CAST(6 AS Decimal(18, 0)), N'Vins et alcools Chevalier', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10275, N'MAGAA', 1, CAST(N'1994-09-07' AS Date), CAST(N'1994-10-05' AS Date), CAST(N'1994-09-09' AS Date), 1, CAST(27 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10276, N'TORTU', 8, CAST(N'1994-09-08' AS Date), CAST(N'1994-09-22' AS Date), CAST(N'1994-09-14' AS Date), 3, CAST(14 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10277, N'MORGK', 2, CAST(N'1994-09-09' AS Date), CAST(N'1994-10-07' AS Date), CAST(N'1994-09-13' AS Date), 3, CAST(126 AS Decimal(18, 0)), N'Morgenstern Gesundkost', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10278, N'BERGS', 8, CAST(N'1994-09-12' AS Date), CAST(N'1994-10-10' AS Date), CAST(N'1994-09-16' AS Date), 2, CAST(93 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10279, N'LEHMS', 8, CAST(N'1994-09-13' AS Date), CAST(N'1994-10-11' AS Date), CAST(N'1994-09-16' AS Date), 2, CAST(26 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10280, N'BERGS', 2, CAST(N'1994-09-14' AS Date), CAST(N'1994-10-12' AS Date), CAST(N'1994-10-13' AS Date), 1, CAST(9 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10281, N'ROMEY', 4, CAST(N'1994-09-14' AS Date), CAST(N'1994-09-28' AS Date), CAST(N'1994-09-21' AS Date), 1, CAST(3 AS Decimal(18, 0)), N'Romero y tomillo', N'Gran Vía. 1', N'Madrid', NULL, N'28001', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10282, N'ROMEY', 4, CAST(N'1994-09-15' AS Date), CAST(N'1994-10-13' AS Date), CAST(N'1994-09-21' AS Date), 1, CAST(13 AS Decimal(18, 0)), N'Romero y tomillo', N'Gran Vía. 1', N'Madrid', NULL, N'28001', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10283, N'LILAS', 3, CAST(N'1994-09-16' AS Date), CAST(N'1994-10-14' AS Date), CAST(N'1994-09-23' AS Date), 3, CAST(85 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10284, N'LEHMS', 4, CAST(N'1994-09-19' AS Date), CAST(N'1994-10-17' AS Date), CAST(N'1994-09-27' AS Date), 1, CAST(77 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10285, N'QUICK', 1, CAST(N'1994-09-20' AS Date), CAST(N'1994-10-18' AS Date), CAST(N'1994-09-26' AS Date), 2, CAST(77 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10286, N'QUICK', 8, CAST(N'1994-09-21' AS Date), CAST(N'1994-10-19' AS Date), CAST(N'1994-09-30' AS Date), 3, CAST(229 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10287, N'RICAR', 8, CAST(N'1994-09-22' AS Date), CAST(N'1994-10-20' AS Date), CAST(N'1994-09-28' AS Date), 3, CAST(13 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10288, N'REGGC', 4, CAST(N'1994-09-23' AS Date), CAST(N'1994-10-21' AS Date), CAST(N'1994-10-04' AS Date), 1, CAST(7 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10289, N'BSBEV', 7, CAST(N'1994-09-26' AS Date), CAST(N'1994-10-24' AS Date), CAST(N'1994-09-28' AS Date), 3, CAST(23 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10290, N'COMMI', 8, CAST(N'1994-09-27' AS Date), CAST(N'1994-10-25' AS Date), CAST(N'1994-10-04' AS Date), 1, CAST(80 AS Decimal(18, 0)), N'Comércio Mineiro', N'Av. dos Lusíadas. 23', N'São Paulo', N'SP', N'05432-043', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10291, N'QUEDE', 6, CAST(N'1994-09-27' AS Date), CAST(N'1994-10-25' AS Date), CAST(N'1994-10-05' AS Date), 2, CAST(6 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10292, N'TRADH', 1, CAST(N'1994-09-28' AS Date), CAST(N'1994-10-26' AS Date), CAST(N'1994-10-03' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Tradição Hipermercados', N'Av. Inês de Castro. 414', N'São Paulo', N'SP', N'05634-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10293, N'TORTU', 1, CAST(N'1994-09-29' AS Date), CAST(N'1994-10-27' AS Date), CAST(N'1994-10-12' AS Date), 3, CAST(21 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10294, N'RATTC', 4, CAST(N'1994-09-30' AS Date), CAST(N'1994-10-28' AS Date), CAST(N'1994-10-06' AS Date), 2, CAST(147 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10295, N'VINET', 2, CAST(N'1994-10-03' AS Date), CAST(N'1994-10-31' AS Date), CAST(N'1994-10-11' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Vins et alcools Chevalier', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10296, N'LILAS', 6, CAST(N'1994-10-04' AS Date), CAST(N'1994-11-01' AS Date), CAST(N'1994-10-12' AS Date), 1, CAST(0 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10297, N'BLONP', 5, CAST(N'1994-10-05' AS Date), CAST(N'1994-11-16' AS Date), CAST(N'1994-10-11' AS Date), 2, CAST(6 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10298, N'HUNGO', 6, CAST(N'1994-10-06' AS Date), CAST(N'1994-11-03' AS Date), CAST(N'1994-10-12' AS Date), 2, CAST(168 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10299, N'RICAR', 4, CAST(N'1994-10-07' AS Date), CAST(N'1994-11-04' AS Date), CAST(N'1994-10-14' AS Date), 2, CAST(30 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10300, N'MAGAA', 2, CAST(N'1994-10-10' AS Date), CAST(N'1994-11-07' AS Date), CAST(N'1994-10-19' AS Date), 2, CAST(18 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10301, N'WANDK', 8, CAST(N'1994-10-10' AS Date), CAST(N'1994-11-07' AS Date), CAST(N'1994-10-18' AS Date), 2, CAST(45 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10302, N'SUPRD', 4, CAST(N'1994-10-11' AS Date), CAST(N'1994-11-08' AS Date), CAST(N'1994-11-09' AS Date), 2, CAST(6 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10303, N'GODOS', 7, CAST(N'1994-10-12' AS Date), CAST(N'1994-11-09' AS Date), CAST(N'1994-10-19' AS Date), 2, CAST(108 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10304, N'TORTU', 1, CAST(N'1994-10-13' AS Date), CAST(N'1994-11-10' AS Date), CAST(N'1994-10-18' AS Date), 2, CAST(64 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10305, N'OLDWO', 8, CAST(N'1994-10-14' AS Date), CAST(N'1994-11-11' AS Date), CAST(N'1994-11-09' AS Date), 3, CAST(258 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10306, N'ROMEY', 1, CAST(N'1994-10-17' AS Date), CAST(N'1994-11-14' AS Date), CAST(N'1994-10-24' AS Date), 3, CAST(8 AS Decimal(18, 0)), N'Romero y tomillo', N'Gran Vía. 1', N'Madrid', NULL, N'28001', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10307, N'LONEP', 2, CAST(N'1994-10-18' AS Date), CAST(N'1994-11-15' AS Date), CAST(N'1994-10-26' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10308, N'ANATR', 7, CAST(N'1994-10-19' AS Date), CAST(N'1994-11-16' AS Date), CAST(N'1994-10-25' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10309, N'HUNGO', 3, CAST(N'1994-10-20' AS Date), CAST(N'1994-11-17' AS Date), CAST(N'1994-11-23' AS Date), 1, CAST(47 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10310, N'THEBI', 8, CAST(N'1994-10-21' AS Date), CAST(N'1994-11-18' AS Date), CAST(N'1994-10-28' AS Date), 2, CAST(18 AS Decimal(18, 0)), N'The Big Cheese', N'89 Jefferson WaySuite 2', N'Portland', N'OR', N'97201', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10311, N'DUMON', 1, CAST(N'1994-10-21' AS Date), CAST(N'1994-11-04' AS Date), CAST(N'1994-10-27' AS Date), 3, CAST(25 AS Decimal(18, 0)), N'Du monde entier', N'67. rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10312, N'WANDK', 2, CAST(N'1994-10-24' AS Date), CAST(N'1994-11-21' AS Date), CAST(N'1994-11-03' AS Date), 2, CAST(40 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10313, N'QUICK', 2, CAST(N'1994-10-25' AS Date), CAST(N'1994-11-22' AS Date), CAST(N'1994-11-04' AS Date), 2, CAST(2 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10314, N'RATTC', 1, CAST(N'1994-10-26' AS Date), CAST(N'1994-11-23' AS Date), CAST(N'1994-11-04' AS Date), 2, CAST(74 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10315, N'ISLAT', 4, CAST(N'1994-10-27' AS Date), CAST(N'1994-11-24' AS Date), CAST(N'1994-11-03' AS Date), 2, CAST(42 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10316, N'RATTC', 1, CAST(N'1994-10-28' AS Date), CAST(N'1994-11-25' AS Date), CAST(N'1994-11-08' AS Date), 3, CAST(150 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10317, N'LONEP', 6, CAST(N'1994-10-31' AS Date), CAST(N'1994-11-28' AS Date), CAST(N'1994-11-10' AS Date), 1, CAST(13 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10318, N'ISLAT', 8, CAST(N'1994-11-01' AS Date), CAST(N'1994-11-29' AS Date), CAST(N'1994-11-04' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10319, N'TORTU', 7, CAST(N'1994-11-02' AS Date), CAST(N'1994-11-30' AS Date), CAST(N'1994-11-11' AS Date), 3, CAST(65 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10320, N'WARTH', 5, CAST(N'1994-11-03' AS Date), CAST(N'1994-11-17' AS Date), CAST(N'1994-11-18' AS Date), 3, CAST(35 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10321, N'ISLAT', 3, CAST(N'1994-11-03' AS Date), CAST(N'1994-12-01' AS Date), CAST(N'1994-11-11' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10322, N'PERIC', 7, CAST(N'1994-11-04' AS Date), CAST(N'1994-12-02' AS Date), CAST(N'1994-11-23' AS Date), 3, CAST(0 AS Decimal(18, 0)), N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10323, N'KOENE', 4, CAST(N'1994-11-07' AS Date), CAST(N'1994-12-05' AS Date), CAST(N'1994-11-14' AS Date), 1, CAST(5 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10324, N'SAVEA', 9, CAST(N'1994-11-08' AS Date), CAST(N'1994-12-06' AS Date), CAST(N'1994-11-10' AS Date), 1, CAST(214 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10325, N'KOENE', 1, CAST(N'1994-11-09' AS Date), CAST(N'1994-11-23' AS Date), CAST(N'1994-11-14' AS Date), 3, CAST(65 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10326, N'BOLID', 4, CAST(N'1994-11-10' AS Date), CAST(N'1994-12-08' AS Date), CAST(N'1994-11-14' AS Date), 2, CAST(78 AS Decimal(18, 0)), N'Bólido Comidas preparadas', N'C/ Araquil. 67', N'Madrid', NULL, N'28023', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10327, N'FOLKO', 2, CAST(N'1994-11-11' AS Date), CAST(N'1994-12-09' AS Date), CAST(N'1994-11-14' AS Date), 1, CAST(63 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10328, N'FURIB', 4, CAST(N'1994-11-14' AS Date), CAST(N'1994-12-12' AS Date), CAST(N'1994-11-17' AS Date), 3, CAST(87 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10329, N'SPLIR', 4, CAST(N'1994-11-15' AS Date), CAST(N'1994-12-27' AS Date), CAST(N'1994-11-23' AS Date), 2, CAST(192 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10330, N'LILAS', 3, CAST(N'1994-11-16' AS Date), CAST(N'1994-12-14' AS Date), CAST(N'1994-11-28' AS Date), 1, CAST(13 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10331, N'BONAP', 9, CAST(N'1994-11-16' AS Date), CAST(N'1994-12-28' AS Date), CAST(N'1994-11-21' AS Date), 1, CAST(10 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10332, N'MEREP', 3, CAST(N'1994-11-17' AS Date), CAST(N'1994-12-29' AS Date), CAST(N'1994-11-21' AS Date), 2, CAST(53 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10333, N'WARTH', 5, CAST(N'1994-11-18' AS Date), CAST(N'1994-12-16' AS Date), CAST(N'1994-11-25' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10334, N'VICTE', 8, CAST(N'1994-11-21' AS Date), CAST(N'1994-12-19' AS Date), CAST(N'1994-11-28' AS Date), 2, CAST(9 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10335, N'HUNGO', 7, CAST(N'1994-11-22' AS Date), CAST(N'1994-12-20' AS Date), CAST(N'1994-11-24' AS Date), 2, CAST(42 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10336, N'PRINI', 7, CAST(N'1994-11-23' AS Date), CAST(N'1994-12-21' AS Date), CAST(N'1994-11-25' AS Date), 2, CAST(16 AS Decimal(18, 0)), N'Princesa Isabel Vinhos', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10337, N'FRANK', 4, CAST(N'1994-11-24' AS Date), CAST(N'1994-12-22' AS Date), CAST(N'1994-11-29' AS Date), 3, CAST(108 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10338, N'OLDWO', 4, CAST(N'1994-11-25' AS Date), CAST(N'1994-12-23' AS Date), CAST(N'1994-11-29' AS Date), 3, CAST(84 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10339, N'MEREP', 2, CAST(N'1994-11-28' AS Date), CAST(N'1994-12-26' AS Date), CAST(N'1994-12-05' AS Date), 2, CAST(16 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10340, N'BONAP', 1, CAST(N'1994-11-29' AS Date), CAST(N'1994-12-27' AS Date), CAST(N'1994-12-09' AS Date), 3, CAST(166 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10341, N'SIMOB', 7, CAST(N'1994-11-29' AS Date), CAST(N'1994-12-27' AS Date), CAST(N'1994-12-06' AS Date), 3, CAST(27 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10342, N'FRANK', 4, CAST(N'1994-11-30' AS Date), CAST(N'1994-12-14' AS Date), CAST(N'1994-12-05' AS Date), 2, CAST(55 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10343, N'LEHMS', 4, CAST(N'1994-12-01' AS Date), CAST(N'1994-12-29' AS Date), CAST(N'1994-12-07' AS Date), 1, CAST(110 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10344, N'WHITC', 4, CAST(N'1994-12-02' AS Date), CAST(N'1994-12-30' AS Date), CAST(N'1994-12-06' AS Date), 2, CAST(23 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10345, N'QUICK', 2, CAST(N'1994-12-05' AS Date), CAST(N'1995-01-02' AS Date), CAST(N'1994-12-12' AS Date), 2, CAST(249 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10346, N'RATTC', 3, CAST(N'1994-12-06' AS Date), CAST(N'1995-01-17' AS Date), CAST(N'1994-12-09' AS Date), 3, CAST(142 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10347, N'FAMIA', 4, CAST(N'1994-12-07' AS Date), CAST(N'1995-01-04' AS Date), CAST(N'1994-12-09' AS Date), 3, CAST(3 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10348, N'WANDK', 4, CAST(N'1994-12-08' AS Date), CAST(N'1995-01-05' AS Date), CAST(N'1994-12-16' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10349, N'SPLIR', 7, CAST(N'1994-12-09' AS Date), CAST(N'1995-01-06' AS Date), CAST(N'1994-12-16' AS Date), 1, CAST(9 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10350, N'LAMAI', 6, CAST(N'1994-12-12' AS Date), CAST(N'1995-01-09' AS Date), CAST(N'1995-01-03' AS Date), 2, CAST(64 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10351, N'ERNSH', 1, CAST(N'1994-12-12' AS Date), CAST(N'1995-01-09' AS Date), CAST(N'1994-12-21' AS Date), 1, CAST(162 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10352, N'FURIB', 3, CAST(N'1994-12-13' AS Date), CAST(N'1994-12-27' AS Date), CAST(N'1994-12-19' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10353, N'PICCO', 7, CAST(N'1994-12-14' AS Date), CAST(N'1995-01-11' AS Date), CAST(N'1994-12-26' AS Date), 3, CAST(361 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10354, N'PERIC', 8, CAST(N'1994-12-15' AS Date), CAST(N'1995-01-12' AS Date), CAST(N'1994-12-21' AS Date), 3, CAST(54 AS Decimal(18, 0)), N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10355, N'AROUT', 6, CAST(N'1994-12-16' AS Date), CAST(N'1995-01-13' AS Date), CAST(N'1994-12-21' AS Date), 1, CAST(42 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10356, N'WANDK', 6, CAST(N'1994-12-19' AS Date), CAST(N'1995-01-16' AS Date), CAST(N'1994-12-28' AS Date), 2, CAST(37 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10357, N'LILAS', 1, CAST(N'1994-12-20' AS Date), CAST(N'1995-01-17' AS Date), CAST(N'1995-01-02' AS Date), 3, CAST(35 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10358, N'LAMAI', 5, CAST(N'1994-12-21' AS Date), CAST(N'1995-01-18' AS Date), CAST(N'1994-12-28' AS Date), 1, CAST(20 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10359, N'SEVES', 5, CAST(N'1994-12-22' AS Date), CAST(N'1995-01-19' AS Date), CAST(N'1994-12-27' AS Date), 3, CAST(288 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10360, N'BLONP', 4, CAST(N'1994-12-23' AS Date), CAST(N'1995-01-20' AS Date), CAST(N'1995-01-02' AS Date), 3, CAST(132 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10361, N'QUICK', 1, CAST(N'1994-12-23' AS Date), CAST(N'1995-01-20' AS Date), CAST(N'1995-01-03' AS Date), 2, CAST(183 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10362, N'BONAP', 3, CAST(N'1994-12-26' AS Date), CAST(N'1995-01-23' AS Date), CAST(N'1994-12-29' AS Date), 1, CAST(96 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10363, N'DRACD', 4, CAST(N'1994-12-27' AS Date), CAST(N'1995-01-24' AS Date), CAST(N'1995-01-04' AS Date), 3, CAST(31 AS Decimal(18, 0)), N'Drachenblut Delikatessen', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10364, N'EASTC', 1, CAST(N'1994-12-27' AS Date), CAST(N'1995-02-07' AS Date), CAST(N'1995-01-04' AS Date), 1, CAST(72 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10365, N'ANTON', 3, CAST(N'1994-12-28' AS Date), CAST(N'1995-01-25' AS Date), CAST(N'1995-01-02' AS Date), 2, CAST(22 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10366, N'GALED', 8, CAST(N'1994-12-29' AS Date), CAST(N'1995-02-09' AS Date), CAST(N'1995-01-30' AS Date), 2, CAST(10 AS Decimal(18, 0)), N'Galería del gastronómo', N'Rambla de Cataluña. 23', N'Barcelona', NULL, N'8022', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10367, N'VAFFE', 7, CAST(N'1994-12-29' AS Date), CAST(N'1995-01-26' AS Date), CAST(N'1995-01-02' AS Date), 3, CAST(14 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10368, N'ERNSH', 2, CAST(N'1994-12-30' AS Date), CAST(N'1995-01-27' AS Date), CAST(N'1995-01-02' AS Date), 2, CAST(102 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10369, N'SPLIR', 8, CAST(N'1995-01-02' AS Date), CAST(N'1995-01-30' AS Date), CAST(N'1995-01-09' AS Date), 2, CAST(196 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10370, N'CHOPS', 6, CAST(N'1995-01-03' AS Date), CAST(N'1995-01-31' AS Date), CAST(N'1995-01-27' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10371, N'LAMAI', 1, CAST(N'1995-01-03' AS Date), CAST(N'1995-01-31' AS Date), CAST(N'1995-01-24' AS Date), 1, CAST(0 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10372, N'QUEEN', 5, CAST(N'1995-01-04' AS Date), CAST(N'1995-02-01' AS Date), CAST(N'1995-01-09' AS Date), 2, CAST(891 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10373, N'HUNGO', 4, CAST(N'1995-01-05' AS Date), CAST(N'1995-02-02' AS Date), CAST(N'1995-01-11' AS Date), 3, CAST(124 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10374, N'WOLZA', 1, CAST(N'1995-01-05' AS Date), CAST(N'1995-02-02' AS Date), CAST(N'1995-01-09' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10375, N'HUNGC', 3, CAST(N'1995-01-06' AS Date), CAST(N'1995-02-03' AS Date), CAST(N'1995-01-09' AS Date), 2, CAST(20 AS Decimal(18, 0)), N'Hungry Coyote Import Store', N'City Center Plaza516 Main St.', N'Elgin', N'OR', N'97827', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10376, N'MEREP', 1, CAST(N'1995-01-09' AS Date), CAST(N'1995-02-06' AS Date), CAST(N'1995-01-13' AS Date), 2, CAST(20 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10377, N'SEVES', 1, CAST(N'1995-01-09' AS Date), CAST(N'1995-02-06' AS Date), CAST(N'1995-01-13' AS Date), 3, CAST(22 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10378, N'FOLKO', 5, CAST(N'1995-01-10' AS Date), CAST(N'1995-02-07' AS Date), CAST(N'1995-01-19' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10379, N'QUEDE', 2, CAST(N'1995-01-11' AS Date), CAST(N'1995-02-08' AS Date), CAST(N'1995-01-13' AS Date), 1, CAST(45 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10380, N'HUNGO', 8, CAST(N'1995-01-12' AS Date), CAST(N'1995-02-09' AS Date), CAST(N'1995-02-16' AS Date), 3, CAST(35 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10381, N'LILAS', 3, CAST(N'1995-01-12' AS Date), CAST(N'1995-02-09' AS Date), CAST(N'1995-01-13' AS Date), 3, CAST(8 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10382, N'ERNSH', 4, CAST(N'1995-01-13' AS Date), CAST(N'1995-02-10' AS Date), CAST(N'1995-01-16' AS Date), 1, CAST(95 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10383, N'AROUT', 8, CAST(N'1995-01-16' AS Date), CAST(N'1995-02-13' AS Date), CAST(N'1995-01-18' AS Date), 3, CAST(34 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10384, N'BERGS', 3, CAST(N'1995-01-16' AS Date), CAST(N'1995-02-13' AS Date), CAST(N'1995-01-20' AS Date), 3, CAST(169 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10385, N'SPLIR', 1, CAST(N'1995-01-17' AS Date), CAST(N'1995-02-14' AS Date), CAST(N'1995-01-23' AS Date), 2, CAST(31 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10386, N'FAMIA', 9, CAST(N'1995-01-18' AS Date), CAST(N'1995-02-01' AS Date), CAST(N'1995-01-25' AS Date), 3, CAST(14 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10387, N'SANTG', 1, CAST(N'1995-01-18' AS Date), CAST(N'1995-02-15' AS Date), CAST(N'1995-01-20' AS Date), 2, CAST(94 AS Decimal(18, 0)), N'Santé Gourmet', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10388, N'SEVES', 2, CAST(N'1995-01-19' AS Date), CAST(N'1995-02-16' AS Date), CAST(N'1995-01-20' AS Date), 1, CAST(35 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10389, N'BOTTM', 4, CAST(N'1995-01-20' AS Date), CAST(N'1995-02-17' AS Date), CAST(N'1995-01-24' AS Date), 2, CAST(47 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10390, N'ERNSH', 6, CAST(N'1995-01-23' AS Date), CAST(N'1995-02-20' AS Date), CAST(N'1995-01-26' AS Date), 1, CAST(126 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10391, N'DRACD', 3, CAST(N'1995-01-23' AS Date), CAST(N'1995-02-20' AS Date), CAST(N'1995-01-31' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'Drachenblut Delikatessen', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10392, N'PICCO', 2, CAST(N'1995-01-24' AS Date), CAST(N'1995-02-21' AS Date), CAST(N'1995-02-01' AS Date), 3, CAST(122 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10393, N'SAVEA', 1, CAST(N'1995-01-25' AS Date), CAST(N'1995-02-22' AS Date), CAST(N'1995-02-03' AS Date), 3, CAST(127 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10394, N'HUNGC', 1, CAST(N'1995-01-25' AS Date), CAST(N'1995-02-22' AS Date), CAST(N'1995-02-03' AS Date), 3, CAST(30 AS Decimal(18, 0)), N'Hungry Coyote Import Store', N'City Center Plaza516 Main St.', N'Elgin', N'OR', N'97827', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10395, N'HILAA', 6, CAST(N'1995-01-26' AS Date), CAST(N'1995-02-23' AS Date), CAST(N'1995-02-03' AS Date), 1, CAST(184 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10396, N'FRANK', 1, CAST(N'1995-01-27' AS Date), CAST(N'1995-02-10' AS Date), CAST(N'1995-02-06' AS Date), 3, CAST(135 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10397, N'PRINI', 5, CAST(N'1995-01-27' AS Date), CAST(N'1995-02-24' AS Date), CAST(N'1995-02-02' AS Date), 1, CAST(60 AS Decimal(18, 0)), N'Princesa Isabel Vinhos', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10398, N'SAVEA', 2, CAST(N'1995-01-30' AS Date), CAST(N'1995-02-27' AS Date), CAST(N'1995-02-09' AS Date), 3, CAST(89 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10399, N'VAFFE', 8, CAST(N'1995-01-31' AS Date), CAST(N'1995-02-14' AS Date), CAST(N'1995-02-08' AS Date), 3, CAST(27 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10400, N'EASTC', 1, CAST(N'1995-02-01' AS Date), CAST(N'1995-03-01' AS Date), CAST(N'1995-02-16' AS Date), 3, CAST(84 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10401, N'RATTC', 1, CAST(N'1995-02-01' AS Date), CAST(N'1995-03-01' AS Date), CAST(N'1995-02-10' AS Date), 1, CAST(13 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10402, N'ERNSH', 8, CAST(N'1995-02-02' AS Date), CAST(N'1995-03-16' AS Date), CAST(N'1995-02-10' AS Date), 2, CAST(68 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10403, N'ERNSH', 4, CAST(N'1995-02-03' AS Date), CAST(N'1995-03-03' AS Date), CAST(N'1995-02-09' AS Date), 3, CAST(74 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10404, N'MAGAA', 2, CAST(N'1995-02-03' AS Date), CAST(N'1995-03-03' AS Date), CAST(N'1995-02-08' AS Date), 1, CAST(156 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10405, N'LINOD', 1, CAST(N'1995-02-06' AS Date), CAST(N'1995-03-06' AS Date), CAST(N'1995-02-22' AS Date), 1, CAST(35 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10406, N'QUEEN', 7, CAST(N'1995-02-07' AS Date), CAST(N'1995-03-21' AS Date), CAST(N'1995-02-13' AS Date), 1, CAST(108 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10407, N'OTTIK', 2, CAST(N'1995-02-07' AS Date), CAST(N'1995-03-07' AS Date), CAST(N'1995-03-02' AS Date), 2, CAST(91 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10408, N'FOLIG', 8, CAST(N'1995-02-08' AS Date), CAST(N'1995-03-08' AS Date), CAST(N'1995-02-14' AS Date), 1, CAST(11 AS Decimal(18, 0)), N'Folies gourmandes', N'184. chaussée de Tournai', N'Lille', NULL, N'59000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10409, N'OCEAN', 3, CAST(N'1995-02-09' AS Date), CAST(N'1995-03-09' AS Date), CAST(N'1995-02-14' AS Date), 1, CAST(30 AS Decimal(18, 0)), N'Océano Atlántico Ltda.', N'Ing. Gustavo Moncada 8585Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10410, N'BOTTM', 3, CAST(N'1995-02-10' AS Date), CAST(N'1995-03-10' AS Date), CAST(N'1995-02-15' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10411, N'BOTTM', 9, CAST(N'1995-02-10' AS Date), CAST(N'1995-03-10' AS Date), CAST(N'1995-02-21' AS Date), 3, CAST(24 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10412, N'WARTH', 8, CAST(N'1995-02-13' AS Date), CAST(N'1995-03-13' AS Date), CAST(N'1995-02-15' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10413, N'LAMAI', 3, CAST(N'1995-02-14' AS Date), CAST(N'1995-03-14' AS Date), CAST(N'1995-02-16' AS Date), 2, CAST(96 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10414, N'FAMIA', 2, CAST(N'1995-02-14' AS Date), CAST(N'1995-03-14' AS Date), CAST(N'1995-02-17' AS Date), 3, CAST(21 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10415, N'HUNGC', 3, CAST(N'1995-02-15' AS Date), CAST(N'1995-03-15' AS Date), CAST(N'1995-02-24' AS Date), 1, CAST(0 AS Decimal(18, 0)), N'Hungry Coyote Import Store', N'City Center Plaza516 Main St.', N'Elgin', N'OR', N'97827', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10416, N'WARTH', 8, CAST(N'1995-02-16' AS Date), CAST(N'1995-03-16' AS Date), CAST(N'1995-02-27' AS Date), 3, CAST(23 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10417, N'SIMOB', 4, CAST(N'1995-02-16' AS Date), CAST(N'1995-03-16' AS Date), CAST(N'1995-02-28' AS Date), 3, CAST(70 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10418, N'QUICK', 4, CAST(N'1995-02-17' AS Date), CAST(N'1995-03-17' AS Date), CAST(N'1995-02-24' AS Date), 1, CAST(18 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10419, N'RICSU', 4, CAST(N'1995-02-20' AS Date), CAST(N'1995-03-20' AS Date), CAST(N'1995-03-02' AS Date), 2, CAST(137 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10420, N'WELLI', 3, CAST(N'1995-02-21' AS Date), CAST(N'1995-03-21' AS Date), CAST(N'1995-02-27' AS Date), 1, CAST(44 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10421, N'QUEDE', 8, CAST(N'1995-02-21' AS Date), CAST(N'1995-04-04' AS Date), CAST(N'1995-02-27' AS Date), 1, CAST(99 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10422, N'FRANS', 2, CAST(N'1995-02-22' AS Date), CAST(N'1995-03-22' AS Date), CAST(N'1995-03-03' AS Date), 1, CAST(3 AS Decimal(18, 0)), N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10423, N'GOURL', 6, CAST(N'1995-02-23' AS Date), CAST(N'1995-03-09' AS Date), CAST(N'1995-03-27' AS Date), 3, CAST(25 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10424, N'MEREP', 7, CAST(N'1995-02-23' AS Date), CAST(N'1995-03-23' AS Date), CAST(N'1995-02-27' AS Date), 2, CAST(371 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10425, N'LAMAI', 6, CAST(N'1995-02-24' AS Date), CAST(N'1995-03-24' AS Date), CAST(N'1995-03-17' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10426, N'GALED', 4, CAST(N'1995-02-27' AS Date), CAST(N'1995-03-27' AS Date), CAST(N'1995-03-09' AS Date), 1, CAST(19 AS Decimal(18, 0)), N'Galería del gastronómo', N'Rambla de Cataluña. 23', N'Barcelona', NULL, N'8022', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10427, N'PICCO', 4, CAST(N'1995-02-27' AS Date), CAST(N'1995-03-27' AS Date), CAST(N'1995-04-03' AS Date), 2, CAST(31 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10428, N'REGGC', 7, CAST(N'1995-02-28' AS Date), CAST(N'1995-03-28' AS Date), CAST(N'1995-03-07' AS Date), 1, CAST(11 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10429, N'HUNGO', 3, CAST(N'1995-03-01' AS Date), CAST(N'1995-04-12' AS Date), CAST(N'1995-03-10' AS Date), 2, CAST(57 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10430, N'ERNSH', 4, CAST(N'1995-03-02' AS Date), CAST(N'1995-03-16' AS Date), CAST(N'1995-03-06' AS Date), 1, CAST(459 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10431, N'BOTTM', 4, CAST(N'1995-03-02' AS Date), CAST(N'1995-03-16' AS Date), CAST(N'1995-03-10' AS Date), 2, CAST(44 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10432, N'SPLIR', 3, CAST(N'1995-03-03' AS Date), CAST(N'1995-03-17' AS Date), CAST(N'1995-03-10' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10433, N'PRINI', 3, CAST(N'1995-03-06' AS Date), CAST(N'1995-04-03' AS Date), CAST(N'1995-04-04' AS Date), 3, CAST(74 AS Decimal(18, 0)), N'Princesa Isabel Vinhos', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10434, N'FOLKO', 3, CAST(N'1995-03-06' AS Date), CAST(N'1995-04-03' AS Date), CAST(N'1995-03-16' AS Date), 2, CAST(18 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10435, N'CONSH', 8, CAST(N'1995-03-07' AS Date), CAST(N'1995-04-18' AS Date), CAST(N'1995-03-10' AS Date), 2, CAST(9 AS Decimal(18, 0)), N'Consolidated Holdings', N'Berkeley Gardens12  Brewery ', N'London', NULL, N'WX1 6LT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10436, N'BLONP', 3, CAST(N'1995-03-08' AS Date), CAST(N'1995-04-05' AS Date), CAST(N'1995-03-14' AS Date), 2, CAST(157 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10437, N'WARTH', 8, CAST(N'1995-03-08' AS Date), CAST(N'1995-04-05' AS Date), CAST(N'1995-03-15' AS Date), 1, CAST(20 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10438, N'TOMSP', 3, CAST(N'1995-03-09' AS Date), CAST(N'1995-04-06' AS Date), CAST(N'1995-03-17' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'Toms Spezialitäten', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10439, N'MEREP', 6, CAST(N'1995-03-10' AS Date), CAST(N'1995-04-07' AS Date), CAST(N'1995-03-13' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10440, N'SAVEA', 4, CAST(N'1995-03-13' AS Date), CAST(N'1995-04-10' AS Date), CAST(N'1995-03-31' AS Date), 2, CAST(87 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10441, N'OLDWO', 3, CAST(N'1995-03-13' AS Date), CAST(N'1995-04-24' AS Date), CAST(N'1995-04-14' AS Date), 2, CAST(73 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10442, N'ERNSH', 3, CAST(N'1995-03-14' AS Date), CAST(N'1995-04-11' AS Date), CAST(N'1995-03-21' AS Date), 2, CAST(48 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10443, N'REGGC', 8, CAST(N'1995-03-15' AS Date), CAST(N'1995-04-12' AS Date), CAST(N'1995-03-17' AS Date), 1, CAST(14 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10444, N'BERGS', 3, CAST(N'1995-03-15' AS Date), CAST(N'1995-04-12' AS Date), CAST(N'1995-03-24' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10445, N'BERGS', 3, CAST(N'1995-03-16' AS Date), CAST(N'1995-04-13' AS Date), CAST(N'1995-03-23' AS Date), 1, CAST(9 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10446, N'TOMSP', 6, CAST(N'1995-03-17' AS Date), CAST(N'1995-04-14' AS Date), CAST(N'1995-03-22' AS Date), 1, CAST(15 AS Decimal(18, 0)), N'Toms Spezialitäten', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10447, N'RICAR', 4, CAST(N'1995-03-17' AS Date), CAST(N'1995-04-14' AS Date), CAST(N'1995-04-07' AS Date), 2, CAST(69 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10448, N'RANCH', 4, CAST(N'1995-03-20' AS Date), CAST(N'1995-04-17' AS Date), CAST(N'1995-03-27' AS Date), 2, CAST(39 AS Decimal(18, 0)), N'Rancho grande', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10449, N'BLONP', 3, CAST(N'1995-03-21' AS Date), CAST(N'1995-04-18' AS Date), CAST(N'1995-03-30' AS Date), 2, CAST(53 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10450, N'VICTE', 8, CAST(N'1995-03-22' AS Date), CAST(N'1995-04-19' AS Date), CAST(N'1995-04-11' AS Date), 2, CAST(7 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10451, N'QUICK', 4, CAST(N'1995-03-22' AS Date), CAST(N'1995-04-05' AS Date), CAST(N'1995-04-12' AS Date), 3, CAST(189 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10452, N'SAVEA', 8, CAST(N'1995-03-23' AS Date), CAST(N'1995-04-20' AS Date), CAST(N'1995-03-29' AS Date), 1, CAST(140 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10453, N'AROUT', 1, CAST(N'1995-03-24' AS Date), CAST(N'1995-04-21' AS Date), CAST(N'1995-03-29' AS Date), 2, CAST(25 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10454, N'LAMAI', 4, CAST(N'1995-03-24' AS Date), CAST(N'1995-04-21' AS Date), CAST(N'1995-03-28' AS Date), 3, CAST(3 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10455, N'WARTH', 8, CAST(N'1995-03-27' AS Date), CAST(N'1995-05-08' AS Date), CAST(N'1995-04-03' AS Date), 2, CAST(180 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10456, N'KOENE', 8, CAST(N'1995-03-28' AS Date), CAST(N'1995-05-09' AS Date), CAST(N'1995-03-31' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10457, N'KOENE', 2, CAST(N'1995-03-28' AS Date), CAST(N'1995-04-25' AS Date), CAST(N'1995-04-03' AS Date), 1, CAST(12 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10458, N'SUPRD', 7, CAST(N'1995-03-29' AS Date), CAST(N'1995-04-26' AS Date), CAST(N'1995-04-04' AS Date), 3, CAST(147 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10459, N'VICTE', 4, CAST(N'1995-03-30' AS Date), CAST(N'1995-04-27' AS Date), CAST(N'1995-03-31' AS Date), 2, CAST(25 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10460, N'FOLKO', 8, CAST(N'1995-03-31' AS Date), CAST(N'1995-04-28' AS Date), CAST(N'1995-04-03' AS Date), 1, CAST(16 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10461, N'LILAS', 1, CAST(N'1995-03-31' AS Date), CAST(N'1995-04-28' AS Date), CAST(N'1995-04-05' AS Date), 3, CAST(149 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10462, N'CONSH', 2, CAST(N'1995-04-03' AS Date), CAST(N'1995-05-01' AS Date), CAST(N'1995-04-18' AS Date), 1, CAST(6 AS Decimal(18, 0)), N'Consolidated Holdings', N'Berkeley Gardens12  Brewery ', N'London', NULL, N'WX1 6LT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10463, N'SUPRD', 5, CAST(N'1995-04-04' AS Date), CAST(N'1995-05-02' AS Date), CAST(N'1995-04-06' AS Date), 3, CAST(15 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10464, N'FURIB', 4, CAST(N'1995-04-04' AS Date), CAST(N'1995-05-02' AS Date), CAST(N'1995-04-14' AS Date), 2, CAST(89 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10465, N'VAFFE', 1, CAST(N'1995-04-05' AS Date), CAST(N'1995-05-03' AS Date), CAST(N'1995-04-14' AS Date), 3, CAST(145 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10466, N'COMMI', 4, CAST(N'1995-04-06' AS Date), CAST(N'1995-05-04' AS Date), CAST(N'1995-04-13' AS Date), 1, CAST(12 AS Decimal(18, 0)), N'Comércio Mineiro', N'Av. dos Lusíadas. 23', N'São Paulo', N'SP', N'05432-043', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10467, N'MAGAA', 8, CAST(N'1995-04-06' AS Date), CAST(N'1995-05-04' AS Date), CAST(N'1995-04-11' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10468, N'KOENE', 3, CAST(N'1995-04-07' AS Date), CAST(N'1995-05-05' AS Date), CAST(N'1995-04-12' AS Date), 3, CAST(44 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10469, N'WHITC', 1, CAST(N'1995-04-10' AS Date), CAST(N'1995-05-08' AS Date), CAST(N'1995-04-14' AS Date), 1, CAST(60 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10470, N'BONAP', 4, CAST(N'1995-04-11' AS Date), CAST(N'1995-05-09' AS Date), CAST(N'1995-04-14' AS Date), 2, CAST(65 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10471, N'BSBEV', 2, CAST(N'1995-04-11' AS Date), CAST(N'1995-05-09' AS Date), CAST(N'1995-04-18' AS Date), 3, CAST(46 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10472, N'SEVES', 8, CAST(N'1995-04-12' AS Date), CAST(N'1995-05-10' AS Date), CAST(N'1995-04-19' AS Date), 1, CAST(4 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10473, N'ISLAT', 1, CAST(N'1995-04-13' AS Date), CAST(N'1995-04-27' AS Date), CAST(N'1995-04-21' AS Date), 3, CAST(16 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10474, N'PERIC', 5, CAST(N'1995-04-13' AS Date), CAST(N'1995-05-11' AS Date), CAST(N'1995-04-21' AS Date), 2, CAST(83 AS Decimal(18, 0)), N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10475, N'SUPRD', 9, CAST(N'1995-04-14' AS Date), CAST(N'1995-05-12' AS Date), CAST(N'1995-05-05' AS Date), 1, CAST(69 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10476, N'HILAA', 8, CAST(N'1995-04-17' AS Date), CAST(N'1995-05-15' AS Date), CAST(N'1995-04-24' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10477, N'PRINI', 5, CAST(N'1995-04-17' AS Date), CAST(N'1995-05-15' AS Date), CAST(N'1995-04-25' AS Date), 2, CAST(13 AS Decimal(18, 0)), N'Princesa Isabel Vinhos', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10478, N'VICTE', 2, CAST(N'1995-04-18' AS Date), CAST(N'1995-05-02' AS Date), CAST(N'1995-04-26' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10479, N'RATTC', 3, CAST(N'1995-04-19' AS Date), CAST(N'1995-05-17' AS Date), CAST(N'1995-04-21' AS Date), 3, CAST(709 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10480, N'FOLIG', 6, CAST(N'1995-04-20' AS Date), CAST(N'1995-05-18' AS Date), CAST(N'1995-04-24' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Folies gourmandes', N'184. chaussée de Tournai', N'Lille', NULL, N'59000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10481, N'RICAR', 8, CAST(N'1995-04-20' AS Date), CAST(N'1995-05-18' AS Date), CAST(N'1995-04-25' AS Date), 2, CAST(64 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10482, N'LAZYK', 1, CAST(N'1995-04-21' AS Date), CAST(N'1995-05-19' AS Date), CAST(N'1995-05-11' AS Date), 3, CAST(7 AS Decimal(18, 0)), N'Lazy K Kountry Store', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10483, N'WHITC', 7, CAST(N'1995-04-24' AS Date), CAST(N'1995-05-22' AS Date), CAST(N'1995-05-26' AS Date), 2, CAST(15 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10484, N'BSBEV', 3, CAST(N'1995-04-24' AS Date), CAST(N'1995-05-22' AS Date), CAST(N'1995-05-02' AS Date), 3, CAST(7 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10485, N'LINOD', 4, CAST(N'1995-04-25' AS Date), CAST(N'1995-05-09' AS Date), CAST(N'1995-05-01' AS Date), 2, CAST(64 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10486, N'HILAA', 1, CAST(N'1995-04-26' AS Date), CAST(N'1995-05-24' AS Date), CAST(N'1995-05-03' AS Date), 2, CAST(31 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10487, N'QUEEN', 2, CAST(N'1995-04-26' AS Date), CAST(N'1995-05-24' AS Date), CAST(N'1995-04-28' AS Date), 2, CAST(71 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10488, N'FRANK', 8, CAST(N'1995-04-27' AS Date), CAST(N'1995-05-25' AS Date), CAST(N'1995-05-03' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10489, N'PICCO', 6, CAST(N'1995-04-28' AS Date), CAST(N'1995-05-26' AS Date), CAST(N'1995-05-10' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10490, N'HILAA', 7, CAST(N'1995-05-01' AS Date), CAST(N'1995-05-29' AS Date), CAST(N'1995-05-04' AS Date), 2, CAST(210 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10491, N'FURIB', 8, CAST(N'1995-05-01' AS Date), CAST(N'1995-05-29' AS Date), CAST(N'1995-05-09' AS Date), 3, CAST(17 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10492, N'BOTTM', 3, CAST(N'1995-05-02' AS Date), CAST(N'1995-05-30' AS Date), CAST(N'1995-05-12' AS Date), 1, CAST(63 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10493, N'LAMAI', 4, CAST(N'1995-05-03' AS Date), CAST(N'1995-05-31' AS Date), CAST(N'1995-05-11' AS Date), 3, CAST(11 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10494, N'COMMI', 4, CAST(N'1995-05-03' AS Date), CAST(N'1995-05-31' AS Date), CAST(N'1995-05-10' AS Date), 2, CAST(66 AS Decimal(18, 0)), N'Comércio Mineiro', N'Av. dos Lusíadas. 23', N'São Paulo', N'SP', N'05432-043', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10495, N'LAUGB', 3, CAST(N'1995-05-04' AS Date), CAST(N'1995-06-01' AS Date), CAST(N'1995-05-12' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'Laughing Bacchus Wine Cellars', N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10496, N'TRADH', 7, CAST(N'1995-05-05' AS Date), CAST(N'1995-06-02' AS Date), CAST(N'1995-05-08' AS Date), 2, CAST(47 AS Decimal(18, 0)), N'Tradição Hipermercados', N'Av. Inês de Castro. 414', N'São Paulo', N'SP', N'05634-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10497, N'LEHMS', 7, CAST(N'1995-05-05' AS Date), CAST(N'1995-06-02' AS Date), CAST(N'1995-05-08' AS Date), 1, CAST(36 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10498, N'HILAA', 8, CAST(N'1995-05-08' AS Date), CAST(N'1995-06-05' AS Date), CAST(N'1995-05-12' AS Date), 2, CAST(30 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10499, N'LILAS', 4, CAST(N'1995-05-09' AS Date), CAST(N'1995-06-06' AS Date), CAST(N'1995-05-17' AS Date), 2, CAST(102 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10500, N'LAMAI', 6, CAST(N'1995-05-10' AS Date), CAST(N'1995-06-07' AS Date), CAST(N'1995-05-18' AS Date), 1, CAST(43 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10501, N'BLAUS', 9, CAST(N'1995-05-10' AS Date), CAST(N'1995-06-07' AS Date), CAST(N'1995-05-17' AS Date), 3, CAST(9 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10502, N'PERIC', 2, CAST(N'1995-05-11' AS Date), CAST(N'1995-06-08' AS Date), CAST(N'1995-05-30' AS Date), 1, CAST(69 AS Decimal(18, 0)), N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10503, N'HUNGO', 6, CAST(N'1995-05-12' AS Date), CAST(N'1995-06-09' AS Date), CAST(N'1995-05-17' AS Date), 2, CAST(17 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10504, N'WHITC', 4, CAST(N'1995-05-12' AS Date), CAST(N'1995-06-09' AS Date), CAST(N'1995-05-19' AS Date), 3, CAST(59 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10505, N'MEREP', 3, CAST(N'1995-05-15' AS Date), CAST(N'1995-06-12' AS Date), CAST(N'1995-05-22' AS Date), 3, CAST(7 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10506, N'KOENE', 9, CAST(N'1995-05-16' AS Date), CAST(N'1995-06-13' AS Date), CAST(N'1995-06-02' AS Date), 2, CAST(21 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10507, N'ANTON', 7, CAST(N'1995-05-16' AS Date), CAST(N'1995-06-13' AS Date), CAST(N'1995-05-23' AS Date), 1, CAST(47 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10508, N'OTTIK', 1, CAST(N'1995-05-17' AS Date), CAST(N'1995-06-14' AS Date), CAST(N'1995-06-13' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10509, N'BLAUS', 4, CAST(N'1995-05-18' AS Date), CAST(N'1995-06-15' AS Date), CAST(N'1995-05-30' AS Date), 1, CAST(0 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10510, N'SAVEA', 6, CAST(N'1995-05-19' AS Date), CAST(N'1995-06-16' AS Date), CAST(N'1995-05-29' AS Date), 3, CAST(368 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10511, N'BONAP', 4, CAST(N'1995-05-19' AS Date), CAST(N'1995-06-16' AS Date), CAST(N'1995-05-22' AS Date), 3, CAST(351 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10512, N'FAMIA', 7, CAST(N'1995-05-22' AS Date), CAST(N'1995-06-19' AS Date), CAST(N'1995-05-25' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10513, N'WANDK', 7, CAST(N'1995-05-23' AS Date), CAST(N'1995-07-04' AS Date), CAST(N'1995-05-29' AS Date), 1, CAST(106 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10514, N'ERNSH', 3, CAST(N'1995-05-23' AS Date), CAST(N'1995-06-20' AS Date), CAST(N'1995-06-16' AS Date), 2, CAST(790 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10515, N'QUICK', 2, CAST(N'1995-05-24' AS Date), CAST(N'1995-06-07' AS Date), CAST(N'1995-06-23' AS Date), 1, CAST(204 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10516, N'HUNGO', 2, CAST(N'1995-05-25' AS Date), CAST(N'1995-06-22' AS Date), CAST(N'1995-06-01' AS Date), 3, CAST(63 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10517, N'NORTS', 3, CAST(N'1995-05-25' AS Date), CAST(N'1995-06-22' AS Date), CAST(N'1995-05-30' AS Date), 3, CAST(32 AS Decimal(18, 0)), N'North/South', N'South House300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10518, N'TORTU', 4, CAST(N'1995-05-26' AS Date), CAST(N'1995-06-09' AS Date), CAST(N'1995-06-05' AS Date), 2, CAST(218 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10519, N'CHOPS', 6, CAST(N'1995-05-29' AS Date), CAST(N'1995-06-26' AS Date), CAST(N'1995-06-01' AS Date), 3, CAST(92 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10520, N'SANTG', 7, CAST(N'1995-05-30' AS Date), CAST(N'1995-06-27' AS Date), CAST(N'1995-06-01' AS Date), 1, CAST(13 AS Decimal(18, 0)), N'Santé Gourmet', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10521, N'CACTU', 8, CAST(N'1995-05-30' AS Date), CAST(N'1995-06-27' AS Date), CAST(N'1995-06-02' AS Date), 2, CAST(17 AS Decimal(18, 0)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10522, N'LEHMS', 4, CAST(N'1995-05-31' AS Date), CAST(N'1995-06-28' AS Date), CAST(N'1995-06-06' AS Date), 1, CAST(45 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10523, N'SEVES', 7, CAST(N'1995-06-01' AS Date), CAST(N'1995-06-29' AS Date), CAST(N'1995-06-30' AS Date), 2, CAST(78 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10524, N'BERGS', 1, CAST(N'1995-06-01' AS Date), CAST(N'1995-06-29' AS Date), CAST(N'1995-06-07' AS Date), 2, CAST(245 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10525, N'BONAP', 1, CAST(N'1995-06-02' AS Date), CAST(N'1995-06-30' AS Date), CAST(N'1995-06-23' AS Date), 2, CAST(11 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10526, N'WARTH', 4, CAST(N'1995-06-05' AS Date), CAST(N'1995-07-03' AS Date), CAST(N'1995-06-15' AS Date), 2, CAST(59 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10527, N'QUICK', 7, CAST(N'1995-06-05' AS Date), CAST(N'1995-07-03' AS Date), CAST(N'1995-06-07' AS Date), 1, CAST(42 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10528, N'GREAL', 6, CAST(N'1995-06-06' AS Date), CAST(N'1995-06-20' AS Date), CAST(N'1995-06-09' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10529, N'MAISD', 5, CAST(N'1995-06-07' AS Date), CAST(N'1995-07-05' AS Date), CAST(N'1995-06-09' AS Date), 2, CAST(67 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10530, N'PICCO', 3, CAST(N'1995-06-08' AS Date), CAST(N'1995-07-06' AS Date), CAST(N'1995-06-12' AS Date), 2, CAST(339 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10531, N'OCEAN', 7, CAST(N'1995-06-08' AS Date), CAST(N'1995-07-06' AS Date), CAST(N'1995-06-19' AS Date), 1, CAST(8 AS Decimal(18, 0)), N'Océano Atlántico Ltda.', N'Ing. Gustavo Moncada 8585Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10532, N'EASTC', 7, CAST(N'1995-06-09' AS Date), CAST(N'1995-07-07' AS Date), CAST(N'1995-06-12' AS Date), 3, CAST(74 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10533, N'FOLKO', 8, CAST(N'1995-06-12' AS Date), CAST(N'1995-07-10' AS Date), CAST(N'1995-06-22' AS Date), 1, CAST(188 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10534, N'LEHMS', 8, CAST(N'1995-06-12' AS Date), CAST(N'1995-07-10' AS Date), CAST(N'1995-06-14' AS Date), 2, CAST(28 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10535, N'ANTON', 4, CAST(N'1995-06-13' AS Date), CAST(N'1995-07-11' AS Date), CAST(N'1995-06-21' AS Date), 1, CAST(16 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10536, N'LEHMS', 3, CAST(N'1995-06-14' AS Date), CAST(N'1995-07-12' AS Date), CAST(N'1995-07-07' AS Date), 2, CAST(59 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10537, N'RICSU', 1, CAST(N'1995-06-14' AS Date), CAST(N'1995-06-28' AS Date), CAST(N'1995-06-19' AS Date), 1, CAST(79 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10538, N'BSBEV', 9, CAST(N'1995-06-15' AS Date), CAST(N'1995-07-13' AS Date), CAST(N'1995-06-16' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10539, N'BSBEV', 6, CAST(N'1995-06-16' AS Date), CAST(N'1995-07-14' AS Date), CAST(N'1995-06-23' AS Date), 3, CAST(12 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10540, N'QUICK', 3, CAST(N'1995-06-19' AS Date), CAST(N'1995-07-17' AS Date), CAST(N'1995-07-14' AS Date), 3, CAST(1008 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10541, N'HANAR', 2, CAST(N'1995-06-19' AS Date), CAST(N'1995-07-17' AS Date), CAST(N'1995-06-29' AS Date), 1, CAST(69 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10542, N'KOENE', 1, CAST(N'1995-06-20' AS Date), CAST(N'1995-07-18' AS Date), CAST(N'1995-06-26' AS Date), 3, CAST(11 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10543, N'LILAS', 8, CAST(N'1995-06-21' AS Date), CAST(N'1995-07-19' AS Date), CAST(N'1995-06-23' AS Date), 2, CAST(48 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10544, N'LONEP', 4, CAST(N'1995-06-21' AS Date), CAST(N'1995-07-19' AS Date), CAST(N'1995-06-30' AS Date), 1, CAST(25 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10545, N'LAZYK', 8, CAST(N'1995-06-22' AS Date), CAST(N'1995-07-20' AS Date), CAST(N'1995-07-27' AS Date), 2, CAST(12 AS Decimal(18, 0)), N'Lazy K Kountry Store', N'12 Orchestra Terrace', N'Walla Walla', N'WA', N'99362', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10546, N'VICTE', 1, CAST(N'1995-06-23' AS Date), CAST(N'1995-07-21' AS Date), CAST(N'1995-06-27' AS Date), 3, CAST(195 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10547, N'SEVES', 3, CAST(N'1995-06-23' AS Date), CAST(N'1995-07-21' AS Date), CAST(N'1995-07-03' AS Date), 2, CAST(178 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10548, N'TOMSP', 3, CAST(N'1995-06-26' AS Date), CAST(N'1995-07-24' AS Date), CAST(N'1995-07-03' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Toms Spezialitäten', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10549, N'QUICK', 5, CAST(N'1995-06-27' AS Date), CAST(N'1995-07-11' AS Date), CAST(N'1995-06-30' AS Date), 1, CAST(171 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10550, N'GODOS', 7, CAST(N'1995-06-28' AS Date), CAST(N'1995-07-26' AS Date), CAST(N'1995-07-07' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10551, N'FURIB', 4, CAST(N'1995-06-28' AS Date), CAST(N'1995-08-09' AS Date), CAST(N'1995-07-07' AS Date), 3, CAST(73 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10552, N'HILAA', 2, CAST(N'1995-06-29' AS Date), CAST(N'1995-07-27' AS Date), CAST(N'1995-07-06' AS Date), 1, CAST(83 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10553, N'WARTH', 2, CAST(N'1995-06-30' AS Date), CAST(N'1995-07-28' AS Date), CAST(N'1995-07-04' AS Date), 2, CAST(149 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10554, N'OTTIK', 4, CAST(N'1995-06-30' AS Date), CAST(N'1995-07-28' AS Date), CAST(N'1995-07-06' AS Date), 3, CAST(121 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10555, N'SAVEA', 6, CAST(N'1995-07-03' AS Date), CAST(N'1995-07-31' AS Date), CAST(N'1995-07-05' AS Date), 3, CAST(252 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10556, N'SIMOB', 2, CAST(N'1995-07-04' AS Date), CAST(N'1995-08-15' AS Date), CAST(N'1995-07-14' AS Date), 1, CAST(10 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10557, N'LEHMS', 9, CAST(N'1995-07-04' AS Date), CAST(N'1995-07-18' AS Date), CAST(N'1995-07-07' AS Date), 2, CAST(97 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10558, N'AROUT', 1, CAST(N'1995-07-05' AS Date), CAST(N'1995-08-02' AS Date), CAST(N'1995-07-11' AS Date), 2, CAST(73 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10559, N'BLONP', 6, CAST(N'1995-07-06' AS Date), CAST(N'1995-08-03' AS Date), CAST(N'1995-07-14' AS Date), 1, CAST(8 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10560, N'FRANK', 8, CAST(N'1995-07-07' AS Date), CAST(N'1995-08-04' AS Date), CAST(N'1995-07-10' AS Date), 1, CAST(37 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10561, N'FOLKO', 2, CAST(N'1995-07-07' AS Date), CAST(N'1995-08-04' AS Date), CAST(N'1995-07-10' AS Date), 2, CAST(242 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10562, N'REGGC', 1, CAST(N'1995-07-10' AS Date), CAST(N'1995-08-07' AS Date), CAST(N'1995-07-13' AS Date), 1, CAST(23 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10563, N'RICAR', 2, CAST(N'1995-07-11' AS Date), CAST(N'1995-08-22' AS Date), CAST(N'1995-07-25' AS Date), 2, CAST(60 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10564, N'RATTC', 4, CAST(N'1995-07-11' AS Date), CAST(N'1995-08-08' AS Date), CAST(N'1995-07-17' AS Date), 3, CAST(14 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10565, N'MEREP', 8, CAST(N'1995-07-12' AS Date), CAST(N'1995-08-09' AS Date), CAST(N'1995-07-19' AS Date), 2, CAST(7 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10566, N'BLONP', 9, CAST(N'1995-07-13' AS Date), CAST(N'1995-08-10' AS Date), CAST(N'1995-07-19' AS Date), 1, CAST(88 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10567, N'HUNGO', 1, CAST(N'1995-07-13' AS Date), CAST(N'1995-08-10' AS Date), CAST(N'1995-07-18' AS Date), 1, CAST(34 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10568, N'GALED', 3, CAST(N'1995-07-14' AS Date), CAST(N'1995-08-11' AS Date), CAST(N'1995-08-09' AS Date), 3, CAST(7 AS Decimal(18, 0)), N'Galería del gastronómo', N'Rambla de Cataluña. 23', N'Barcelona', NULL, N'8022', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10569, N'RATTC', 5, CAST(N'1995-07-17' AS Date), CAST(N'1995-08-14' AS Date), CAST(N'1995-08-11' AS Date), 1, CAST(59 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10570, N'MEREP', 3, CAST(N'1995-07-18' AS Date), CAST(N'1995-08-15' AS Date), CAST(N'1995-07-20' AS Date), 3, CAST(189 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10571, N'ERNSH', 8, CAST(N'1995-07-18' AS Date), CAST(N'1995-08-29' AS Date), CAST(N'1995-08-04' AS Date), 3, CAST(26 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10572, N'BERGS', 3, CAST(N'1995-07-19' AS Date), CAST(N'1995-08-16' AS Date), CAST(N'1995-07-26' AS Date), 2, CAST(116 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10573, N'ANTON', 7, CAST(N'1995-07-20' AS Date), CAST(N'1995-08-17' AS Date), CAST(N'1995-07-21' AS Date), 3, CAST(85 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10574, N'TRAIH', 4, CAST(N'1995-07-20' AS Date), CAST(N'1995-08-17' AS Date), CAST(N'1995-07-31' AS Date), 2, CAST(38 AS Decimal(18, 0)), N'Trail''s Head Gourmet Provisioners', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10575, N'MORGK', 5, CAST(N'1995-07-21' AS Date), CAST(N'1995-08-04' AS Date), CAST(N'1995-07-31' AS Date), 1, CAST(127 AS Decimal(18, 0)), N'Morgenstern Gesundkost', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10576, N'TORTU', 3, CAST(N'1995-07-24' AS Date), CAST(N'1995-08-07' AS Date), CAST(N'1995-07-31' AS Date), 3, CAST(19 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10577, N'TRAIH', 9, CAST(N'1995-07-24' AS Date), CAST(N'1995-09-04' AS Date), CAST(N'1995-07-31' AS Date), 2, CAST(25 AS Decimal(18, 0)), N'Trail''s Head Gourmet Provisioners', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10578, N'BSBEV', 4, CAST(N'1995-07-25' AS Date), CAST(N'1995-08-22' AS Date), CAST(N'1995-08-25' AS Date), 3, CAST(30 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10579, N'LETSS', 1, CAST(N'1995-07-26' AS Date), CAST(N'1995-08-23' AS Date), CAST(N'1995-08-04' AS Date), 2, CAST(14 AS Decimal(18, 0)), N'Let''s Stop N Shop', N'87 Polk St.Suite 5', N'San Francisco', N'CA', N'94117', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10580, N'OTTIK', 4, CAST(N'1995-07-27' AS Date), CAST(N'1995-08-24' AS Date), CAST(N'1995-08-01' AS Date), 3, CAST(76 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10581, N'FAMIA', 3, CAST(N'1995-07-27' AS Date), CAST(N'1995-08-24' AS Date), CAST(N'1995-08-02' AS Date), 1, CAST(3 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10582, N'BLAUS', 3, CAST(N'1995-07-28' AS Date), CAST(N'1995-08-25' AS Date), CAST(N'1995-08-14' AS Date), 2, CAST(28 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10583, N'WARTH', 2, CAST(N'1995-07-31' AS Date), CAST(N'1995-08-28' AS Date), CAST(N'1995-08-04' AS Date), 2, CAST(7 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10584, N'BLONP', 4, CAST(N'1995-07-31' AS Date), CAST(N'1995-08-28' AS Date), CAST(N'1995-08-04' AS Date), 1, CAST(59 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10585, N'WELLI', 7, CAST(N'1995-08-01' AS Date), CAST(N'1995-08-29' AS Date), CAST(N'1995-08-10' AS Date), 1, CAST(13 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10586, N'REGGC', 9, CAST(N'1995-08-02' AS Date), CAST(N'1995-08-30' AS Date), CAST(N'1995-08-09' AS Date), 1, CAST(0 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10587, N'QUEDE', 1, CAST(N'1995-08-02' AS Date), CAST(N'1995-08-30' AS Date), CAST(N'1995-08-09' AS Date), 1, CAST(63 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10588, N'QUICK', 2, CAST(N'1995-08-03' AS Date), CAST(N'1995-08-31' AS Date), CAST(N'1995-08-10' AS Date), 3, CAST(195 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10589, N'GREAL', 8, CAST(N'1995-08-04' AS Date), CAST(N'1995-09-01' AS Date), CAST(N'1995-08-14' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10590, N'MEREP', 4, CAST(N'1995-08-07' AS Date), CAST(N'1995-09-04' AS Date), CAST(N'1995-08-14' AS Date), 3, CAST(45 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10591, N'VAFFE', 1, CAST(N'1995-08-07' AS Date), CAST(N'1995-08-21' AS Date), CAST(N'1995-08-16' AS Date), 1, CAST(56 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10592, N'LEHMS', 3, CAST(N'1995-08-08' AS Date), CAST(N'1995-09-05' AS Date), CAST(N'1995-08-16' AS Date), 1, CAST(32 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10593, N'LEHMS', 7, CAST(N'1995-08-09' AS Date), CAST(N'1995-09-06' AS Date), CAST(N'1995-09-13' AS Date), 2, CAST(174 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10594, N'OLDWO', 3, CAST(N'1995-08-09' AS Date), CAST(N'1995-09-06' AS Date), CAST(N'1995-08-16' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10595, N'ERNSH', 2, CAST(N'1995-08-10' AS Date), CAST(N'1995-09-07' AS Date), CAST(N'1995-08-14' AS Date), 1, CAST(97 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10596, N'WHITC', 8, CAST(N'1995-08-11' AS Date), CAST(N'1995-09-08' AS Date), CAST(N'1995-09-12' AS Date), 1, CAST(16 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10597, N'PICCO', 7, CAST(N'1995-08-11' AS Date), CAST(N'1995-09-08' AS Date), CAST(N'1995-08-18' AS Date), 3, CAST(35 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10598, N'RATTC', 1, CAST(N'1995-08-14' AS Date), CAST(N'1995-09-11' AS Date), CAST(N'1995-08-18' AS Date), 3, CAST(44 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10599, N'BSBEV', 6, CAST(N'1995-08-15' AS Date), CAST(N'1995-09-26' AS Date), CAST(N'1995-08-21' AS Date), 3, CAST(30 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10600, N'HUNGC', 4, CAST(N'1995-08-16' AS Date), CAST(N'1995-09-13' AS Date), CAST(N'1995-08-21' AS Date), 1, CAST(45 AS Decimal(18, 0)), N'Hungry Coyote Import Store', N'City Center Plaza516 Main St.', N'Elgin', N'OR', N'97827', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10601, N'HILAA', 7, CAST(N'1995-08-16' AS Date), CAST(N'1995-09-27' AS Date), CAST(N'1995-08-22' AS Date), 1, CAST(58 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10602, N'VAFFE', 8, CAST(N'1995-08-17' AS Date), CAST(N'1995-09-14' AS Date), CAST(N'1995-08-22' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10603, N'SAVEA', 8, CAST(N'1995-08-18' AS Date), CAST(N'1995-09-15' AS Date), CAST(N'1995-09-08' AS Date), 2, CAST(49 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10604, N'FURIB', 1, CAST(N'1995-08-18' AS Date), CAST(N'1995-09-15' AS Date), CAST(N'1995-08-29' AS Date), 1, CAST(7 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10605, N'MEREP', 1, CAST(N'1995-08-21' AS Date), CAST(N'1995-09-18' AS Date), CAST(N'1995-08-29' AS Date), 2, CAST(379 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10606, N'TRADH', 4, CAST(N'1995-08-22' AS Date), CAST(N'1995-09-19' AS Date), CAST(N'1995-08-31' AS Date), 3, CAST(79 AS Decimal(18, 0)), N'Tradição Hipermercados', N'Av. Inês de Castro. 414', N'São Paulo', N'SP', N'05634-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10607, N'SAVEA', 5, CAST(N'1995-08-22' AS Date), CAST(N'1995-09-19' AS Date), CAST(N'1995-08-25' AS Date), 1, CAST(200 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10608, N'TOMSP', 4, CAST(N'1995-08-23' AS Date), CAST(N'1995-09-20' AS Date), CAST(N'1995-09-01' AS Date), 2, CAST(28 AS Decimal(18, 0)), N'Toms Spezialitäten', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10609, N'DUMON', 7, CAST(N'1995-08-24' AS Date), CAST(N'1995-09-21' AS Date), CAST(N'1995-08-30' AS Date), 2, CAST(2 AS Decimal(18, 0)), N'Du monde entier', N'67. rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10610, N'LAMAI', 8, CAST(N'1995-08-25' AS Date), CAST(N'1995-09-22' AS Date), CAST(N'1995-09-06' AS Date), 1, CAST(27 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10611, N'WOLZA', 6, CAST(N'1995-08-25' AS Date), CAST(N'1995-09-22' AS Date), CAST(N'1995-09-01' AS Date), 2, CAST(81 AS Decimal(18, 0)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10612, N'SAVEA', 1, CAST(N'1995-08-28' AS Date), CAST(N'1995-09-25' AS Date), CAST(N'1995-09-01' AS Date), 2, CAST(544 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10613, N'HILAA', 4, CAST(N'1995-08-29' AS Date), CAST(N'1995-09-26' AS Date), CAST(N'1995-09-01' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10614, N'BLAUS', 8, CAST(N'1995-08-29' AS Date), CAST(N'1995-09-26' AS Date), CAST(N'1995-09-01' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10615, N'WILMK', 2, CAST(N'1995-08-30' AS Date), CAST(N'1995-09-27' AS Date), CAST(N'1995-09-06' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10616, N'GREAL', 1, CAST(N'1995-08-31' AS Date), CAST(N'1995-09-28' AS Date), CAST(N'1995-09-05' AS Date), 2, CAST(117 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10617, N'GREAL', 4, CAST(N'1995-08-31' AS Date), CAST(N'1995-09-28' AS Date), CAST(N'1995-09-04' AS Date), 2, CAST(19 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10618, N'MEREP', 1, CAST(N'1995-09-01' AS Date), CAST(N'1995-10-13' AS Date), CAST(N'1995-09-08' AS Date), 1, CAST(155 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10619, N'MEREP', 3, CAST(N'1995-09-04' AS Date), CAST(N'1995-10-02' AS Date), CAST(N'1995-09-07' AS Date), 3, CAST(91 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10620, N'LAUGB', 2, CAST(N'1995-09-05' AS Date), CAST(N'1995-10-03' AS Date), CAST(N'1995-09-14' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Laughing Bacchus Wine Cellars', N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10621, N'ISLAT', 4, CAST(N'1995-09-05' AS Date), CAST(N'1995-10-03' AS Date), CAST(N'1995-09-11' AS Date), 2, CAST(24 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10622, N'RICAR', 4, CAST(N'1995-09-06' AS Date), CAST(N'1995-10-04' AS Date), CAST(N'1995-09-11' AS Date), 3, CAST(51 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10623, N'FRANK', 8, CAST(N'1995-09-07' AS Date), CAST(N'1995-10-05' AS Date), CAST(N'1995-09-12' AS Date), 2, CAST(97 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10624, N'THECR', 4, CAST(N'1995-09-07' AS Date), CAST(N'1995-10-05' AS Date), CAST(N'1995-09-19' AS Date), 2, CAST(95 AS Decimal(18, 0)), N'The Cracker Box', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10625, N'ANATR', 3, CAST(N'1995-09-08' AS Date), CAST(N'1995-10-06' AS Date), CAST(N'1995-09-14' AS Date), 1, CAST(44 AS Decimal(18, 0)), N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10626, N'BERGS', 1, CAST(N'1995-09-11' AS Date), CAST(N'1995-10-09' AS Date), CAST(N'1995-09-20' AS Date), 2, CAST(139 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10627, N'SAVEA', 8, CAST(N'1995-09-11' AS Date), CAST(N'1995-10-23' AS Date), CAST(N'1995-09-21' AS Date), 3, CAST(107 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10628, N'BLONP', 4, CAST(N'1995-09-12' AS Date), CAST(N'1995-10-10' AS Date), CAST(N'1995-09-20' AS Date), 3, CAST(30 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10629, N'GODOS', 4, CAST(N'1995-09-12' AS Date), CAST(N'1995-10-10' AS Date), CAST(N'1995-09-20' AS Date), 3, CAST(85 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10630, N'KOENE', 1, CAST(N'1995-09-13' AS Date), CAST(N'1995-10-11' AS Date), CAST(N'1995-09-19' AS Date), 2, CAST(32 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10631, N'LAMAI', 8, CAST(N'1995-09-14' AS Date), CAST(N'1995-10-12' AS Date), CAST(N'1995-09-15' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10632, N'WANDK', 8, CAST(N'1995-09-14' AS Date), CAST(N'1995-10-12' AS Date), CAST(N'1995-09-19' AS Date), 1, CAST(41 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10633, N'ERNSH', 7, CAST(N'1995-09-15' AS Date), CAST(N'1995-10-13' AS Date), CAST(N'1995-09-18' AS Date), 3, CAST(478 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10634, N'FOLIG', 4, CAST(N'1995-09-15' AS Date), CAST(N'1995-10-13' AS Date), CAST(N'1995-09-21' AS Date), 3, CAST(487 AS Decimal(18, 0)), N'Folies gourmandes', N'184. chaussée de Tournai', N'Lille', NULL, N'59000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10635, N'MAGAA', 8, CAST(N'1995-09-18' AS Date), CAST(N'1995-10-16' AS Date), CAST(N'1995-09-21' AS Date), 3, CAST(47 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10636, N'WARTH', 4, CAST(N'1995-09-19' AS Date), CAST(N'1995-10-17' AS Date), CAST(N'1995-09-26' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10637, N'QUEEN', 6, CAST(N'1995-09-19' AS Date), CAST(N'1995-10-17' AS Date), CAST(N'1995-09-26' AS Date), 1, CAST(201 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10638, N'LINOD', 3, CAST(N'1995-09-20' AS Date), CAST(N'1995-10-18' AS Date), CAST(N'1995-10-02' AS Date), 1, CAST(158 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10639, N'SANTG', 7, CAST(N'1995-09-20' AS Date), CAST(N'1995-10-18' AS Date), CAST(N'1995-09-27' AS Date), 3, CAST(39 AS Decimal(18, 0)), N'Santé Gourmet', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10640, N'WANDK', 4, CAST(N'1995-09-21' AS Date), CAST(N'1995-10-19' AS Date), CAST(N'1995-09-28' AS Date), 1, CAST(24 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10641, N'HILAA', 4, CAST(N'1995-09-22' AS Date), CAST(N'1995-10-20' AS Date), CAST(N'1995-09-26' AS Date), 2, CAST(180 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10642, N'SIMOB', 7, CAST(N'1995-09-22' AS Date), CAST(N'1995-10-20' AS Date), CAST(N'1995-10-06' AS Date), 3, CAST(42 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10643, N'ALFKI', 6, CAST(N'1995-09-25' AS Date), CAST(N'1995-10-23' AS Date), CAST(N'1995-10-03' AS Date), 2, CAST(29 AS Decimal(18, 0)), N'Alfred''s Futterkiste', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10644, N'WELLI', 3, CAST(N'1995-09-25' AS Date), CAST(N'1995-10-23' AS Date), CAST(N'1995-10-02' AS Date), 2, CAST(0 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10645, N'HANAR', 4, CAST(N'1995-09-26' AS Date), CAST(N'1995-10-24' AS Date), CAST(N'1995-10-03' AS Date), 1, CAST(12 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10646, N'HUNGO', 9, CAST(N'1995-09-27' AS Date), CAST(N'1995-11-08' AS Date), CAST(N'1995-10-04' AS Date), 3, CAST(142 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10647, N'QUEDE', 4, CAST(N'1995-09-27' AS Date), CAST(N'1995-10-11' AS Date), CAST(N'1995-10-04' AS Date), 2, CAST(46 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10648, N'RICAR', 5, CAST(N'1995-09-28' AS Date), CAST(N'1995-11-09' AS Date), CAST(N'1995-10-10' AS Date), 2, CAST(14 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10649, N'MAISD', 5, CAST(N'1995-09-28' AS Date), CAST(N'1995-10-26' AS Date), CAST(N'1995-09-29' AS Date), 3, CAST(6 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10650, N'FAMIA', 5, CAST(N'1995-09-29' AS Date), CAST(N'1995-10-27' AS Date), CAST(N'1995-10-04' AS Date), 3, CAST(177 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10651, N'WANDK', 8, CAST(N'1995-10-02' AS Date), CAST(N'1995-10-30' AS Date), CAST(N'1995-10-12' AS Date), 2, CAST(21 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10652, N'GOURL', 4, CAST(N'1995-10-02' AS Date), CAST(N'1995-10-30' AS Date), CAST(N'1995-10-09' AS Date), 2, CAST(7 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10653, N'FRANK', 1, CAST(N'1995-10-03' AS Date), CAST(N'1995-10-31' AS Date), CAST(N'1995-10-20' AS Date), 1, CAST(93 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10654, N'BERGS', 5, CAST(N'1995-10-03' AS Date), CAST(N'1995-10-31' AS Date), CAST(N'1995-10-12' AS Date), 1, CAST(55 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10655, N'REGGC', 1, CAST(N'1995-10-04' AS Date), CAST(N'1995-11-01' AS Date), CAST(N'1995-10-12' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10656, N'GREAL', 6, CAST(N'1995-10-05' AS Date), CAST(N'1995-11-02' AS Date), CAST(N'1995-10-11' AS Date), 1, CAST(57 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10657, N'SAVEA', 2, CAST(N'1995-10-05' AS Date), CAST(N'1995-11-02' AS Date), CAST(N'1995-10-16' AS Date), 2, CAST(353 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10658, N'QUICK', 4, CAST(N'1995-10-06' AS Date), CAST(N'1995-11-03' AS Date), CAST(N'1995-10-09' AS Date), 1, CAST(364 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10659, N'QUEEN', 7, CAST(N'1995-10-06' AS Date), CAST(N'1995-11-03' AS Date), CAST(N'1995-10-11' AS Date), 2, CAST(106 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10660, N'HUNGC', 8, CAST(N'1995-10-09' AS Date), CAST(N'1995-11-06' AS Date), CAST(N'1995-11-15' AS Date), 1, CAST(111 AS Decimal(18, 0)), N'Hungry Coyote Import Store', N'City Center Plaza516 Main St.', N'Elgin', N'OR', N'97827', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10661, N'HUNGO', 7, CAST(N'1995-10-10' AS Date), CAST(N'1995-11-07' AS Date), CAST(N'1995-10-16' AS Date), 3, CAST(18 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10662, N'LONEP', 3, CAST(N'1995-10-10' AS Date), CAST(N'1995-11-07' AS Date), CAST(N'1995-10-19' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10663, N'BONAP', 2, CAST(N'1995-10-11' AS Date), CAST(N'1995-10-25' AS Date), CAST(N'1995-11-03' AS Date), 2, CAST(113 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10664, N'FURIB', 1, CAST(N'1995-10-11' AS Date), CAST(N'1995-11-08' AS Date), CAST(N'1995-10-20' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10665, N'LONEP', 1, CAST(N'1995-10-12' AS Date), CAST(N'1995-11-09' AS Date), CAST(N'1995-10-18' AS Date), 2, CAST(26 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10666, N'RICSU', 7, CAST(N'1995-10-13' AS Date), CAST(N'1995-11-10' AS Date), CAST(N'1995-10-23' AS Date), 2, CAST(232 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10667, N'ERNSH', 7, CAST(N'1995-10-13' AS Date), CAST(N'1995-11-10' AS Date), CAST(N'1995-10-20' AS Date), 1, CAST(78 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10668, N'WANDK', 1, CAST(N'1995-10-16' AS Date), CAST(N'1995-11-13' AS Date), CAST(N'1995-10-24' AS Date), 2, CAST(47 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10669, N'SIMOB', 2, CAST(N'1995-10-16' AS Date), CAST(N'1995-11-13' AS Date), CAST(N'1995-10-23' AS Date), 1, CAST(24 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10670, N'FRANK', 4, CAST(N'1995-10-17' AS Date), CAST(N'1995-11-14' AS Date), CAST(N'1995-10-19' AS Date), 1, CAST(203 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10671, N'FRANR', 1, CAST(N'1995-10-18' AS Date), CAST(N'1995-11-15' AS Date), CAST(N'1995-10-25' AS Date), 1, CAST(30 AS Decimal(18, 0)), N'France restauration', N'54. rue Royale', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10672, N'BERGS', 9, CAST(N'1995-10-18' AS Date), CAST(N'1995-11-01' AS Date), CAST(N'1995-10-27' AS Date), 2, CAST(96 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10673, N'WILMK', 2, CAST(N'1995-10-19' AS Date), CAST(N'1995-11-16' AS Date), CAST(N'1995-10-20' AS Date), 1, CAST(23 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10674, N'ISLAT', 4, CAST(N'1995-10-19' AS Date), CAST(N'1995-11-16' AS Date), CAST(N'1995-10-31' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10675, N'FRANK', 5, CAST(N'1995-10-20' AS Date), CAST(N'1995-11-17' AS Date), CAST(N'1995-10-24' AS Date), 2, CAST(32 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10676, N'TORTU', 2, CAST(N'1995-10-23' AS Date), CAST(N'1995-11-20' AS Date), CAST(N'1995-10-30' AS Date), 2, CAST(2 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10677, N'ANTON', 1, CAST(N'1995-10-23' AS Date), CAST(N'1995-11-20' AS Date), CAST(N'1995-10-27' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10678, N'SAVEA', 7, CAST(N'1995-10-24' AS Date), CAST(N'1995-11-21' AS Date), CAST(N'1995-11-16' AS Date), 3, CAST(389 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10679, N'BLONP', 8, CAST(N'1995-10-24' AS Date), CAST(N'1995-11-21' AS Date), CAST(N'1995-10-31' AS Date), 3, CAST(28 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10680, N'OLDWO', 1, CAST(N'1995-10-25' AS Date), CAST(N'1995-11-22' AS Date), CAST(N'1995-10-27' AS Date), 1, CAST(27 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10681, N'GREAL', 3, CAST(N'1995-10-26' AS Date), CAST(N'1995-11-23' AS Date), CAST(N'1995-10-31' AS Date), 3, CAST(76 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10682, N'ANTON', 3, CAST(N'1995-10-26' AS Date), CAST(N'1995-11-23' AS Date), CAST(N'1995-11-01' AS Date), 2, CAST(36 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10683, N'DUMON', 2, CAST(N'1995-10-27' AS Date), CAST(N'1995-11-24' AS Date), CAST(N'1995-11-01' AS Date), 1, CAST(4 AS Decimal(18, 0)), N'Du monde entier', N'67. rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10684, N'OTTIK', 3, CAST(N'1995-10-27' AS Date), CAST(N'1995-11-24' AS Date), CAST(N'1995-10-31' AS Date), 1, CAST(146 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10685, N'GOURL', 4, CAST(N'1995-10-30' AS Date), CAST(N'1995-11-13' AS Date), CAST(N'1995-11-03' AS Date), 2, CAST(34 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10686, N'PICCO', 2, CAST(N'1995-10-31' AS Date), CAST(N'1995-11-28' AS Date), CAST(N'1995-11-08' AS Date), 1, CAST(97 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10687, N'HUNGO', 9, CAST(N'1995-10-31' AS Date), CAST(N'1995-11-28' AS Date), CAST(N'1995-11-30' AS Date), 2, CAST(296 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10688, N'VAFFE', 4, CAST(N'1995-11-01' AS Date), CAST(N'1995-11-15' AS Date), CAST(N'1995-11-07' AS Date), 2, CAST(299 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10689, N'BERGS', 1, CAST(N'1995-11-01' AS Date), CAST(N'1995-11-29' AS Date), CAST(N'1995-11-07' AS Date), 2, CAST(13 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10690, N'HANAR', 1, CAST(N'1995-11-02' AS Date), CAST(N'1995-11-30' AS Date), CAST(N'1995-11-03' AS Date), 1, CAST(16 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10691, N'QUICK', 2, CAST(N'1995-11-03' AS Date), CAST(N'1995-12-15' AS Date), CAST(N'1995-11-22' AS Date), 2, CAST(810 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10692, N'ALFKI', 4, CAST(N'1995-11-03' AS Date), CAST(N'1995-12-01' AS Date), CAST(N'1995-11-13' AS Date), 2, CAST(61 AS Decimal(18, 0)), N'Alfred''s Futterkiste', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10693, N'WHITC', 3, CAST(N'1995-11-06' AS Date), CAST(N'1995-11-20' AS Date), CAST(N'1995-11-10' AS Date), 3, CAST(139 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10694, N'QUICK', 8, CAST(N'1995-11-06' AS Date), CAST(N'1995-12-04' AS Date), CAST(N'1995-11-09' AS Date), 3, CAST(398 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10695, N'WILMK', 7, CAST(N'1995-11-07' AS Date), CAST(N'1995-12-19' AS Date), CAST(N'1995-11-14' AS Date), 1, CAST(17 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10696, N'WHITC', 8, CAST(N'1995-11-08' AS Date), CAST(N'1995-12-20' AS Date), CAST(N'1995-11-14' AS Date), 3, CAST(103 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10697, N'LINOD', 3, CAST(N'1995-11-08' AS Date), CAST(N'1995-12-06' AS Date), CAST(N'1995-11-14' AS Date), 1, CAST(46 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10698, N'ERNSH', 4, CAST(N'1995-11-09' AS Date), CAST(N'1995-12-07' AS Date), CAST(N'1995-11-17' AS Date), 1, CAST(272 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10699, N'MORGK', 3, CAST(N'1995-11-09' AS Date), CAST(N'1995-12-07' AS Date), CAST(N'1995-11-13' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Morgenstern Gesundkost', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10700, N'SAVEA', 3, CAST(N'1995-11-10' AS Date), CAST(N'1995-12-08' AS Date), CAST(N'1995-11-16' AS Date), 1, CAST(65 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10701, N'HUNGO', 6, CAST(N'1995-11-13' AS Date), CAST(N'1995-11-27' AS Date), CAST(N'1995-11-15' AS Date), 3, CAST(220 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10702, N'ALFKI', 4, CAST(N'1995-11-13' AS Date), CAST(N'1995-12-25' AS Date), CAST(N'1995-11-21' AS Date), 1, CAST(24 AS Decimal(18, 0)), N'Alfred''s Futterkiste', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10703, N'FOLKO', 6, CAST(N'1995-11-14' AS Date), CAST(N'1995-12-12' AS Date), CAST(N'1995-11-20' AS Date), 2, CAST(152 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10704, N'QUEEN', 6, CAST(N'1995-11-14' AS Date), CAST(N'1995-12-12' AS Date), CAST(N'1995-12-08' AS Date), 1, CAST(5 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10705, N'HILAA', 9, CAST(N'1995-11-15' AS Date), CAST(N'1995-12-13' AS Date), CAST(N'1995-12-19' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10706, N'OLDWO', 8, CAST(N'1995-11-16' AS Date), CAST(N'1995-12-14' AS Date), CAST(N'1995-11-21' AS Date), 3, CAST(136 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10707, N'AROUT', 4, CAST(N'1995-11-16' AS Date), CAST(N'1995-11-30' AS Date), CAST(N'1995-11-23' AS Date), 3, CAST(22 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10708, N'THEBI', 6, CAST(N'1995-11-17' AS Date), CAST(N'1995-12-29' AS Date), CAST(N'1995-12-06' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'The Big Cheese', N'89 Jefferson WaySuite 2', N'Portland', N'OR', N'97201', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10709, N'GOURL', 1, CAST(N'1995-11-17' AS Date), CAST(N'1995-12-15' AS Date), CAST(N'1995-12-21' AS Date), 3, CAST(211 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10710, N'FRANS', 1, CAST(N'1995-11-20' AS Date), CAST(N'1995-12-18' AS Date), CAST(N'1995-11-23' AS Date), 1, CAST(5 AS Decimal(18, 0)), N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10711, N'SAVEA', 5, CAST(N'1995-11-21' AS Date), CAST(N'1996-01-02' AS Date), CAST(N'1995-11-29' AS Date), 2, CAST(52 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10712, N'HUNGO', 3, CAST(N'1995-11-21' AS Date), CAST(N'1995-12-19' AS Date), CAST(N'1995-12-01' AS Date), 1, CAST(90 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10713, N'SAVEA', 1, CAST(N'1995-11-22' AS Date), CAST(N'1995-12-20' AS Date), CAST(N'1995-11-24' AS Date), 1, CAST(167 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10714, N'SAVEA', 5, CAST(N'1995-11-22' AS Date), CAST(N'1995-12-20' AS Date), CAST(N'1995-11-27' AS Date), 3, CAST(24 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10715, N'BONAP', 3, CAST(N'1995-11-23' AS Date), CAST(N'1995-12-07' AS Date), CAST(N'1995-11-29' AS Date), 1, CAST(63 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10716, N'RANCH', 4, CAST(N'1995-11-24' AS Date), CAST(N'1995-12-22' AS Date), CAST(N'1995-11-27' AS Date), 2, CAST(23 AS Decimal(18, 0)), N'Rancho grande', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10717, N'FRANK', 1, CAST(N'1995-11-24' AS Date), CAST(N'1995-12-22' AS Date), CAST(N'1995-11-29' AS Date), 2, CAST(59 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10718, N'KOENE', 1, CAST(N'1995-11-27' AS Date), CAST(N'1995-12-25' AS Date), CAST(N'1995-11-29' AS Date), 3, CAST(171 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10719, N'LETSS', 8, CAST(N'1995-11-27' AS Date), CAST(N'1995-12-25' AS Date), CAST(N'1995-12-06' AS Date), 2, CAST(51 AS Decimal(18, 0)), N'Let''s Stop N Shop', N'87 Polk St.Suite 5', N'San Francisco', N'CA', N'94117', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10720, N'QUEDE', 8, CAST(N'1995-11-28' AS Date), CAST(N'1995-12-12' AS Date), CAST(N'1995-12-06' AS Date), 2, CAST(10 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10721, N'QUICK', 5, CAST(N'1995-11-29' AS Date), CAST(N'1995-12-27' AS Date), CAST(N'1995-12-01' AS Date), 3, CAST(49 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10722, N'SAVEA', 8, CAST(N'1995-11-29' AS Date), CAST(N'1996-01-10' AS Date), CAST(N'1995-12-05' AS Date), 1, CAST(75 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10723, N'WHITC', 3, CAST(N'1995-11-30' AS Date), CAST(N'1995-12-28' AS Date), CAST(N'1995-12-26' AS Date), 1, CAST(22 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10724, N'MEREP', 8, CAST(N'1995-11-30' AS Date), CAST(N'1996-01-11' AS Date), CAST(N'1995-12-06' AS Date), 2, CAST(58 AS Decimal(18, 0)), N'Mère Paillarde', N'43 rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10725, N'FAMIA', 4, CAST(N'1995-12-01' AS Date), CAST(N'1995-12-29' AS Date), CAST(N'1995-12-06' AS Date), 3, CAST(11 AS Decimal(18, 0)), N'Familia Arquibaldo', N'Rua Orós. 92', N'São Paulo', N'SP', N'05442-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10726, N'EASTC', 4, CAST(N'1995-12-04' AS Date), CAST(N'1995-12-18' AS Date), CAST(N'1996-01-05' AS Date), 1, CAST(17 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10727, N'REGGC', 2, CAST(N'1995-12-04' AS Date), CAST(N'1996-01-01' AS Date), CAST(N'1996-01-05' AS Date), 1, CAST(90 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10728, N'QUEEN', 4, CAST(N'1995-12-05' AS Date), CAST(N'1996-01-02' AS Date), CAST(N'1995-12-12' AS Date), 2, CAST(58 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10729, N'LINOD', 8, CAST(N'1995-12-05' AS Date), CAST(N'1996-01-16' AS Date), CAST(N'1995-12-15' AS Date), 3, CAST(141 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10730, N'BONAP', 5, CAST(N'1995-12-06' AS Date), CAST(N'1996-01-03' AS Date), CAST(N'1995-12-15' AS Date), 1, CAST(20 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10731, N'CHOPS', 7, CAST(N'1995-12-07' AS Date), CAST(N'1996-01-04' AS Date), CAST(N'1995-12-15' AS Date), 1, CAST(97 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10732, N'BONAP', 3, CAST(N'1995-12-07' AS Date), CAST(N'1996-01-04' AS Date), CAST(N'1995-12-08' AS Date), 1, CAST(17 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10733, N'BERGS', 1, CAST(N'1995-12-08' AS Date), CAST(N'1996-01-05' AS Date), CAST(N'1995-12-11' AS Date), 3, CAST(110 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10734, N'GOURL', 2, CAST(N'1995-12-08' AS Date), CAST(N'1996-01-05' AS Date), CAST(N'1995-12-13' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10735, N'LETSS', 6, CAST(N'1995-12-11' AS Date), CAST(N'1996-01-08' AS Date), CAST(N'1995-12-22' AS Date), 2, CAST(46 AS Decimal(18, 0)), N'Let''s Stop N Shop', N'87 Polk St.Suite 5', N'San Francisco', N'CA', N'94117', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10736, N'HUNGO', 9, CAST(N'1995-12-12' AS Date), CAST(N'1996-01-09' AS Date), CAST(N'1995-12-22' AS Date), 2, CAST(44 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10737, N'VINET', 2, CAST(N'1995-12-12' AS Date), CAST(N'1996-01-09' AS Date), CAST(N'1995-12-19' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'Vins et alcools Chevalier', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10738, N'SPECD', 2, CAST(N'1995-12-13' AS Date), CAST(N'1996-01-10' AS Date), CAST(N'1995-12-19' AS Date), 1, CAST(3 AS Decimal(18, 0)), N'Spécialités du monde', N'25. rue Lauriston', N'Paris', NULL, N'75016', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10739, N'VINET', 3, CAST(N'1995-12-13' AS Date), CAST(N'1996-01-10' AS Date), CAST(N'1995-12-18' AS Date), 3, CAST(11 AS Decimal(18, 0)), N'Vins et alcools Chevalier', N'59 rue de l''Abbaye', N'Reims', NULL, N'51100', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10740, N'WHITC', 4, CAST(N'1995-12-14' AS Date), CAST(N'1996-01-11' AS Date), CAST(N'1995-12-26' AS Date), 2, CAST(82 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10741, N'BERGS', 4, CAST(N'1995-12-15' AS Date), CAST(N'1995-12-29' AS Date), CAST(N'1995-12-19' AS Date), 3, CAST(11 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10742, N'BOTTM', 3, CAST(N'1995-12-15' AS Date), CAST(N'1996-01-12' AS Date), CAST(N'1995-12-19' AS Date), 3, CAST(244 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10743, N'AROUT', 1, CAST(N'1995-12-18' AS Date), CAST(N'1996-01-15' AS Date), CAST(N'1995-12-22' AS Date), 2, CAST(24 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10744, N'VAFFE', 6, CAST(N'1995-12-18' AS Date), CAST(N'1996-01-15' AS Date), CAST(N'1995-12-25' AS Date), 1, CAST(69 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10745, N'QUICK', 9, CAST(N'1995-12-19' AS Date), CAST(N'1996-01-16' AS Date), CAST(N'1995-12-28' AS Date), 1, CAST(4 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10746, N'CHOPS', 1, CAST(N'1995-12-20' AS Date), CAST(N'1996-01-17' AS Date), CAST(N'1995-12-22' AS Date), 3, CAST(31 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10747, N'PICCO', 6, CAST(N'1995-12-20' AS Date), CAST(N'1996-01-17' AS Date), CAST(N'1995-12-27' AS Date), 1, CAST(117 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10748, N'SAVEA', 3, CAST(N'1995-12-21' AS Date), CAST(N'1996-01-18' AS Date), CAST(N'1995-12-29' AS Date), 1, CAST(233 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10749, N'ISLAT', 4, CAST(N'1995-12-21' AS Date), CAST(N'1996-01-18' AS Date), CAST(N'1996-01-19' AS Date), 2, CAST(62 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10750, N'WARTH', 9, CAST(N'1995-12-22' AS Date), CAST(N'1996-01-19' AS Date), CAST(N'1995-12-25' AS Date), 1, CAST(79 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10751, N'RICSU', 3, CAST(N'1995-12-25' AS Date), CAST(N'1996-01-22' AS Date), CAST(N'1996-01-03' AS Date), 3, CAST(131 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10752, N'NORTS', 2, CAST(N'1995-12-25' AS Date), CAST(N'1996-01-22' AS Date), CAST(N'1995-12-29' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'North/South', N'South House300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10753, N'FRANS', 3, CAST(N'1995-12-26' AS Date), CAST(N'1996-01-23' AS Date), CAST(N'1995-12-28' AS Date), 1, CAST(8 AS Decimal(18, 0)), N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10754, N'MAGAA', 6, CAST(N'1995-12-26' AS Date), CAST(N'1996-01-23' AS Date), CAST(N'1995-12-28' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10755, N'BONAP', 4, CAST(N'1995-12-27' AS Date), CAST(N'1996-01-24' AS Date), CAST(N'1995-12-29' AS Date), 2, CAST(17 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10756, N'SPLIR', 8, CAST(N'1995-12-28' AS Date), CAST(N'1996-01-25' AS Date), CAST(N'1996-01-02' AS Date), 2, CAST(73 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10757, N'SAVEA', 6, CAST(N'1995-12-28' AS Date), CAST(N'1996-01-25' AS Date), CAST(N'1996-01-15' AS Date), 1, CAST(8 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10758, N'RICSU', 3, CAST(N'1995-12-29' AS Date), CAST(N'1996-01-26' AS Date), CAST(N'1996-01-04' AS Date), 3, CAST(138 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10759, N'ANATR', 3, CAST(N'1995-12-29' AS Date), CAST(N'1996-01-26' AS Date), CAST(N'1996-01-12' AS Date), 3, CAST(12 AS Decimal(18, 0)), N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10760, N'MAISD', 4, CAST(N'1996-01-01' AS Date), CAST(N'1996-01-29' AS Date), CAST(N'1996-01-10' AS Date), 1, CAST(156 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10761, N'RATTC', 5, CAST(N'1996-01-02' AS Date), CAST(N'1996-01-30' AS Date), CAST(N'1996-01-08' AS Date), 2, CAST(19 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10762, N'FOLKO', 3, CAST(N'1996-01-02' AS Date), CAST(N'1996-01-30' AS Date), CAST(N'1996-01-09' AS Date), 1, CAST(329 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10763, N'FOLIG', 3, CAST(N'1996-01-03' AS Date), CAST(N'1996-01-31' AS Date), CAST(N'1996-01-08' AS Date), 3, CAST(37 AS Decimal(18, 0)), N'Folies gourmandes', N'184. chaussée de Tournai', N'Lille', NULL, N'59000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10764, N'ERNSH', 6, CAST(N'1996-01-03' AS Date), CAST(N'1996-01-31' AS Date), CAST(N'1996-01-08' AS Date), 3, CAST(145 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10765, N'QUICK', 3, CAST(N'1996-01-04' AS Date), CAST(N'1996-02-01' AS Date), CAST(N'1996-01-09' AS Date), 3, CAST(43 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10766, N'OTTIK', 4, CAST(N'1996-01-05' AS Date), CAST(N'1996-02-02' AS Date), CAST(N'1996-01-09' AS Date), 1, CAST(158 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10767, N'SUPRD', 4, CAST(N'1996-01-05' AS Date), CAST(N'1996-02-02' AS Date), CAST(N'1996-01-15' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10768, N'AROUT', 3, CAST(N'1996-01-08' AS Date), CAST(N'1996-02-05' AS Date), CAST(N'1996-01-15' AS Date), 2, CAST(146 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10769, N'VAFFE', 3, CAST(N'1996-01-08' AS Date), CAST(N'1996-02-05' AS Date), CAST(N'1996-01-12' AS Date), 1, CAST(65 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10770, N'HANAR', 8, CAST(N'1996-01-09' AS Date), CAST(N'1996-02-06' AS Date), CAST(N'1996-01-17' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10771, N'ERNSH', 9, CAST(N'1996-01-10' AS Date), CAST(N'1996-02-07' AS Date), CAST(N'1996-02-02' AS Date), 2, CAST(11 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10772, N'LEHMS', 3, CAST(N'1996-01-10' AS Date), CAST(N'1996-02-07' AS Date), CAST(N'1996-01-19' AS Date), 2, CAST(91 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10773, N'ERNSH', 1, CAST(N'1996-01-11' AS Date), CAST(N'1996-02-08' AS Date), CAST(N'1996-01-16' AS Date), 3, CAST(96 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10774, N'FOLKO', 4, CAST(N'1996-01-11' AS Date), CAST(N'1996-01-25' AS Date), CAST(N'1996-01-12' AS Date), 1, CAST(48 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10775, N'THECR', 7, CAST(N'1996-01-12' AS Date), CAST(N'1996-02-09' AS Date), CAST(N'1996-01-26' AS Date), 1, CAST(20 AS Decimal(18, 0)), N'The Cracker Box', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10776, N'ERNSH', 1, CAST(N'1996-01-15' AS Date), CAST(N'1996-02-12' AS Date), CAST(N'1996-01-18' AS Date), 3, CAST(352 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10777, N'GOURL', 7, CAST(N'1996-01-15' AS Date), CAST(N'1996-01-29' AS Date), CAST(N'1996-02-21' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10778, N'BERGS', 3, CAST(N'1996-01-16' AS Date), CAST(N'1996-02-13' AS Date), CAST(N'1996-01-24' AS Date), 1, CAST(7 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10779, N'MORGK', 3, CAST(N'1996-01-16' AS Date), CAST(N'1996-02-13' AS Date), CAST(N'1996-02-14' AS Date), 2, CAST(58 AS Decimal(18, 0)), N'Morgenstern Gesundkost', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10780, N'LILAS', 2, CAST(N'1996-01-16' AS Date), CAST(N'1996-01-30' AS Date), CAST(N'1996-01-25' AS Date), 1, CAST(42 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10781, N'WARTH', 2, CAST(N'1996-01-17' AS Date), CAST(N'1996-02-14' AS Date), CAST(N'1996-01-19' AS Date), 3, CAST(73 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10782, N'CACTU', 9, CAST(N'1996-01-17' AS Date), CAST(N'1996-02-14' AS Date), CAST(N'1996-01-22' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10783, N'HANAR', 4, CAST(N'1996-01-18' AS Date), CAST(N'1996-02-15' AS Date), CAST(N'1996-01-19' AS Date), 2, CAST(125 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10784, N'MAGAA', 4, CAST(N'1996-01-18' AS Date), CAST(N'1996-02-15' AS Date), CAST(N'1996-01-22' AS Date), 3, CAST(70 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10785, N'GROSR', 1, CAST(N'1996-01-18' AS Date), CAST(N'1996-02-15' AS Date), CAST(N'1996-01-24' AS Date), 3, CAST(2 AS Decimal(18, 0)), N'GROSELLA-Restaurante', N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10786, N'QUEEN', 8, CAST(N'1996-01-19' AS Date), CAST(N'1996-02-16' AS Date), CAST(N'1996-01-23' AS Date), 1, CAST(111 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10787, N'LAMAI', 2, CAST(N'1996-01-19' AS Date), CAST(N'1996-02-02' AS Date), CAST(N'1996-01-26' AS Date), 1, CAST(250 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10788, N'QUICK', 1, CAST(N'1996-01-22' AS Date), CAST(N'1996-02-19' AS Date), CAST(N'1996-02-19' AS Date), 2, CAST(43 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10789, N'FOLIG', 1, CAST(N'1996-01-22' AS Date), CAST(N'1996-02-19' AS Date), CAST(N'1996-01-31' AS Date), 2, CAST(101 AS Decimal(18, 0)), N'Folies gourmandes', N'184. chaussée de Tournai', N'Lille', NULL, N'59000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10790, N'GOURL', 6, CAST(N'1996-01-22' AS Date), CAST(N'1996-02-19' AS Date), CAST(N'1996-01-26' AS Date), 1, CAST(28 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10791, N'FRANK', 6, CAST(N'1996-01-23' AS Date), CAST(N'1996-02-20' AS Date), CAST(N'1996-02-01' AS Date), 2, CAST(17 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10792, N'WOLZA', 1, CAST(N'1996-01-23' AS Date), CAST(N'1996-02-20' AS Date), CAST(N'1996-01-31' AS Date), 3, CAST(24 AS Decimal(18, 0)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10793, N'AROUT', 3, CAST(N'1996-01-24' AS Date), CAST(N'1996-02-21' AS Date), CAST(N'1996-02-08' AS Date), 3, CAST(5 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10794, N'QUEDE', 6, CAST(N'1996-01-24' AS Date), CAST(N'1996-02-21' AS Date), CAST(N'1996-02-02' AS Date), 1, CAST(21 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10795, N'ERNSH', 8, CAST(N'1996-01-24' AS Date), CAST(N'1996-02-21' AS Date), CAST(N'1996-02-20' AS Date), 2, CAST(127 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10796, N'HILAA', 3, CAST(N'1996-01-25' AS Date), CAST(N'1996-02-22' AS Date), CAST(N'1996-02-14' AS Date), 1, CAST(27 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10797, N'DRACD', 7, CAST(N'1996-01-25' AS Date), CAST(N'1996-02-22' AS Date), CAST(N'1996-02-05' AS Date), 2, CAST(33 AS Decimal(18, 0)), N'Drachenblut Delikatessen', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10798, N'ISLAT', 2, CAST(N'1996-01-26' AS Date), CAST(N'1996-02-23' AS Date), CAST(N'1996-02-05' AS Date), 1, CAST(2 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10799, N'KOENE', 9, CAST(N'1996-01-26' AS Date), CAST(N'1996-03-08' AS Date), CAST(N'1996-02-05' AS Date), 3, CAST(31 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10800, N'SEVES', 1, CAST(N'1996-01-26' AS Date), CAST(N'1996-02-23' AS Date), CAST(N'1996-02-05' AS Date), 3, CAST(137 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10801, N'BOLID', 4, CAST(N'1996-01-29' AS Date), CAST(N'1996-02-26' AS Date), CAST(N'1996-01-31' AS Date), 2, CAST(97 AS Decimal(18, 0)), N'Bólido Comidas preparadas', N'C/ Araquil. 67', N'Madrid', NULL, N'28023', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10802, N'SIMOB', 4, CAST(N'1996-01-29' AS Date), CAST(N'1996-02-26' AS Date), CAST(N'1996-02-02' AS Date), 2, CAST(257 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10803, N'WELLI', 4, CAST(N'1996-01-30' AS Date), CAST(N'1996-02-27' AS Date), CAST(N'1996-02-06' AS Date), 1, CAST(55 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10804, N'SEVES', 6, CAST(N'1996-01-30' AS Date), CAST(N'1996-02-27' AS Date), CAST(N'1996-02-07' AS Date), 2, CAST(27 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10805, N'THEBI', 2, CAST(N'1996-01-30' AS Date), CAST(N'1996-02-27' AS Date), CAST(N'1996-02-09' AS Date), 3, CAST(237 AS Decimal(18, 0)), N'The Big Cheese', N'89 Jefferson WaySuite 2', N'Portland', N'OR', N'97201', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10806, N'VICTE', 3, CAST(N'1996-01-31' AS Date), CAST(N'1996-02-28' AS Date), CAST(N'1996-02-05' AS Date), 2, CAST(22 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10807, N'FRANS', 4, CAST(N'1996-01-31' AS Date), CAST(N'1996-02-28' AS Date), CAST(N'1996-03-01' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10808, N'OLDWO', 2, CAST(N'1996-02-01' AS Date), CAST(N'1996-02-29' AS Date), CAST(N'1996-02-09' AS Date), 3, CAST(46 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10809, N'WELLI', 7, CAST(N'1996-02-01' AS Date), CAST(N'1996-02-29' AS Date), CAST(N'1996-02-07' AS Date), 1, CAST(5 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10810, N'LAUGB', 2, CAST(N'1996-02-01' AS Date), CAST(N'1996-02-29' AS Date), CAST(N'1996-02-07' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'Laughing Bacchus Wine Cellars', N'2319 Elm St.', N'Vancouver', N'BC', N'V3F 2K1', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10811, N'LINOD', 8, CAST(N'1996-02-02' AS Date), CAST(N'1996-03-01' AS Date), CAST(N'1996-02-08' AS Date), 1, CAST(31 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10812, N'REGGC', 5, CAST(N'1996-02-02' AS Date), CAST(N'1996-03-01' AS Date), CAST(N'1996-02-12' AS Date), 1, CAST(60 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10813, N'RICAR', 1, CAST(N'1996-02-05' AS Date), CAST(N'1996-03-04' AS Date), CAST(N'1996-02-09' AS Date), 1, CAST(47 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10814, N'VICTE', 3, CAST(N'1996-02-05' AS Date), CAST(N'1996-03-04' AS Date), CAST(N'1996-02-14' AS Date), 3, CAST(131 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10815, N'SAVEA', 2, CAST(N'1996-02-05' AS Date), CAST(N'1996-03-04' AS Date), CAST(N'1996-02-14' AS Date), 3, CAST(15 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10816, N'GREAL', 4, CAST(N'1996-02-06' AS Date), CAST(N'1996-03-05' AS Date), CAST(N'1996-03-06' AS Date), 2, CAST(720 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10817, N'KOENE', 3, CAST(N'1996-02-06' AS Date), CAST(N'1996-02-20' AS Date), CAST(N'1996-02-13' AS Date), 2, CAST(306 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10818, N'MAGAA', 7, CAST(N'1996-02-07' AS Date), CAST(N'1996-03-06' AS Date), CAST(N'1996-02-12' AS Date), 3, CAST(65 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10819, N'CACTU', 2, CAST(N'1996-02-07' AS Date), CAST(N'1996-03-06' AS Date), CAST(N'1996-02-16' AS Date), 3, CAST(20 AS Decimal(18, 0)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10820, N'RATTC', 3, CAST(N'1996-02-07' AS Date), CAST(N'1996-03-06' AS Date), CAST(N'1996-02-13' AS Date), 2, CAST(38 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10821, N'SPLIR', 1, CAST(N'1996-02-08' AS Date), CAST(N'1996-03-07' AS Date), CAST(N'1996-02-15' AS Date), 1, CAST(37 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10822, N'TRAIH', 6, CAST(N'1996-02-08' AS Date), CAST(N'1996-03-07' AS Date), CAST(N'1996-02-16' AS Date), 3, CAST(7 AS Decimal(18, 0)), N'Trail''s Head Gourmet Provisioners', N'722 DaVinci Blvd.', N'Kirkland', N'WA', N'98034', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10823, N'LILAS', 5, CAST(N'1996-02-09' AS Date), CAST(N'1996-03-08' AS Date), CAST(N'1996-02-13' AS Date), 2, CAST(164 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10824, N'FOLKO', 8, CAST(N'1996-02-09' AS Date), CAST(N'1996-03-08' AS Date), CAST(N'1996-03-01' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10825, N'DRACD', 1, CAST(N'1996-02-09' AS Date), CAST(N'1996-03-08' AS Date), CAST(N'1996-02-14' AS Date), 1, CAST(79 AS Decimal(18, 0)), N'Drachenblut Delikatessen', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10826, N'BLONP', 6, CAST(N'1996-02-12' AS Date), CAST(N'1996-03-11' AS Date), CAST(N'1996-03-08' AS Date), 1, CAST(7 AS Decimal(18, 0)), N'Blondel père et fils', N'24. place Kléber', N'Strasbourg', NULL, N'67000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10827, N'BONAP', 1, CAST(N'1996-02-12' AS Date), CAST(N'1996-02-26' AS Date), CAST(N'1996-03-08' AS Date), 2, CAST(64 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10828, N'RANCH', 9, CAST(N'1996-02-13' AS Date), CAST(N'1996-02-27' AS Date), CAST(N'1996-03-06' AS Date), 1, CAST(91 AS Decimal(18, 0)), N'Rancho grande', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10829, N'ISLAT', 9, CAST(N'1996-02-13' AS Date), CAST(N'1996-03-12' AS Date), CAST(N'1996-02-23' AS Date), 1, CAST(155 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10830, N'TRADH', 4, CAST(N'1996-02-13' AS Date), CAST(N'1996-03-26' AS Date), CAST(N'1996-02-21' AS Date), 2, CAST(82 AS Decimal(18, 0)), N'Tradição Hipermercados', N'Av. Inês de Castro. 414', N'São Paulo', N'SP', N'05634-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10831, N'SANTG', 3, CAST(N'1996-02-14' AS Date), CAST(N'1996-03-13' AS Date), CAST(N'1996-02-23' AS Date), 2, CAST(72 AS Decimal(18, 0)), N'Santé Gourmet', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10832, N'LAMAI', 2, CAST(N'1996-02-14' AS Date), CAST(N'1996-03-13' AS Date), CAST(N'1996-02-19' AS Date), 2, CAST(43 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10833, N'OTTIK', 6, CAST(N'1996-02-15' AS Date), CAST(N'1996-03-14' AS Date), CAST(N'1996-02-23' AS Date), 2, CAST(71 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10834, N'TRADH', 1, CAST(N'1996-02-15' AS Date), CAST(N'1996-03-14' AS Date), CAST(N'1996-02-19' AS Date), 3, CAST(30 AS Decimal(18, 0)), N'Tradição Hipermercados', N'Av. Inês de Castro. 414', N'São Paulo', N'SP', N'05634-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10835, N'ALFKI', 1, CAST(N'1996-02-15' AS Date), CAST(N'1996-03-14' AS Date), CAST(N'1996-02-21' AS Date), 3, CAST(70 AS Decimal(18, 0)), N'Alfred''s Futterkiste', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10836, N'ERNSH', 7, CAST(N'1996-02-16' AS Date), CAST(N'1996-03-15' AS Date), CAST(N'1996-02-21' AS Date), 1, CAST(412 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10837, N'BERGS', 9, CAST(N'1996-02-16' AS Date), CAST(N'1996-03-15' AS Date), CAST(N'1996-02-23' AS Date), 3, CAST(13 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10838, N'LINOD', 3, CAST(N'1996-02-19' AS Date), CAST(N'1996-03-18' AS Date), CAST(N'1996-02-23' AS Date), 3, CAST(59 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10839, N'TRADH', 3, CAST(N'1996-02-19' AS Date), CAST(N'1996-03-18' AS Date), CAST(N'1996-02-22' AS Date), 3, CAST(35 AS Decimal(18, 0)), N'Tradição Hipermercados', N'Av. Inês de Castro. 414', N'São Paulo', N'SP', N'05634-030', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10840, N'LINOD', 4, CAST(N'1996-02-19' AS Date), CAST(N'1996-04-01' AS Date), CAST(N'1996-03-18' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10841, N'SUPRD', 5, CAST(N'1996-02-20' AS Date), CAST(N'1996-03-19' AS Date), CAST(N'1996-02-29' AS Date), 2, CAST(424 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10842, N'TORTU', 1, CAST(N'1996-02-20' AS Date), CAST(N'1996-03-19' AS Date), CAST(N'1996-02-29' AS Date), 3, CAST(54 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10843, N'VICTE', 4, CAST(N'1996-02-21' AS Date), CAST(N'1996-03-20' AS Date), CAST(N'1996-02-26' AS Date), 2, CAST(9 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10844, N'PICCO', 8, CAST(N'1996-02-21' AS Date), CAST(N'1996-03-20' AS Date), CAST(N'1996-02-26' AS Date), 2, CAST(25 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10845, N'QUICK', 8, CAST(N'1996-02-21' AS Date), CAST(N'1996-03-06' AS Date), CAST(N'1996-03-01' AS Date), 1, CAST(213 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10846, N'SUPRD', 2, CAST(N'1996-02-22' AS Date), CAST(N'1996-04-04' AS Date), CAST(N'1996-02-23' AS Date), 3, CAST(56 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10847, N'SAVEA', 4, CAST(N'1996-02-22' AS Date), CAST(N'1996-03-07' AS Date), CAST(N'1996-03-12' AS Date), 3, CAST(488 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10848, N'CONSH', 7, CAST(N'1996-02-23' AS Date), CAST(N'1996-03-22' AS Date), CAST(N'1996-02-29' AS Date), 2, CAST(38 AS Decimal(18, 0)), N'Consolidated Holdings', N'Berkeley Gardens12  Brewery ', N'London', NULL, N'WX1 6LT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10849, N'KOENE', 9, CAST(N'1996-02-23' AS Date), CAST(N'1996-03-22' AS Date), CAST(N'1996-03-01' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10850, N'VICTE', 1, CAST(N'1996-02-23' AS Date), CAST(N'1996-04-05' AS Date), CAST(N'1996-03-01' AS Date), 1, CAST(49 AS Decimal(18, 0)), N'Victuailles en stock', N'2. rue du Commerce', N'Lyon', NULL, N'69004', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10851, N'RICAR', 5, CAST(N'1996-02-26' AS Date), CAST(N'1996-03-25' AS Date), CAST(N'1996-03-04' AS Date), 1, CAST(161 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10852, N'RATTC', 8, CAST(N'1996-02-26' AS Date), CAST(N'1996-03-11' AS Date), CAST(N'1996-03-01' AS Date), 1, CAST(174 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10853, N'BLAUS', 9, CAST(N'1996-02-27' AS Date), CAST(N'1996-03-26' AS Date), CAST(N'1996-03-05' AS Date), 2, CAST(54 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10854, N'ERNSH', 3, CAST(N'1996-02-27' AS Date), CAST(N'1996-03-26' AS Date), CAST(N'1996-03-07' AS Date), 2, CAST(100 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10855, N'OLDWO', 3, CAST(N'1996-02-27' AS Date), CAST(N'1996-03-26' AS Date), CAST(N'1996-03-06' AS Date), 1, CAST(171 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10856, N'ANTON', 3, CAST(N'1996-02-28' AS Date), CAST(N'1996-03-27' AS Date), CAST(N'1996-03-12' AS Date), 2, CAST(58 AS Decimal(18, 0)), N'Antonio Moreno Taquería', N'Mataderos  2312', N'México D.F.', NULL, N'05023', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10857, N'BERGS', 8, CAST(N'1996-02-28' AS Date), CAST(N'1996-03-27' AS Date), CAST(N'1996-03-08' AS Date), 2, CAST(189 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10858, N'LACOR', 2, CAST(N'1996-02-29' AS Date), CAST(N'1996-03-28' AS Date), CAST(N'1996-03-05' AS Date), 1, CAST(53 AS Decimal(18, 0)), N'La corne d''abondance', N'67. avenue de l''Europe', N'Versailles', NULL, N'78000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10859, N'FRANK', 1, CAST(N'1996-02-29' AS Date), CAST(N'1996-03-28' AS Date), CAST(N'1996-03-04' AS Date), 2, CAST(76 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10860, N'FRANR', 3, CAST(N'1996-02-29' AS Date), CAST(N'1996-03-28' AS Date), CAST(N'1996-03-06' AS Date), 3, CAST(19 AS Decimal(18, 0)), N'France restauration', N'54. rue Royale', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10861, N'WHITC', 4, CAST(N'1996-03-01' AS Date), CAST(N'1996-03-29' AS Date), CAST(N'1996-03-19' AS Date), 2, CAST(15 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10862, N'LEHMS', 8, CAST(N'1996-03-01' AS Date), CAST(N'1996-04-12' AS Date), CAST(N'1996-03-04' AS Date), 2, CAST(53 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10863, N'HILAA', 4, CAST(N'1996-03-04' AS Date), CAST(N'1996-04-01' AS Date), CAST(N'1996-03-19' AS Date), 2, CAST(30 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10864, N'AROUT', 4, CAST(N'1996-03-04' AS Date), CAST(N'1996-04-01' AS Date), CAST(N'1996-03-11' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10865, N'QUICK', 2, CAST(N'1996-03-04' AS Date), CAST(N'1996-03-18' AS Date), CAST(N'1996-03-14' AS Date), 1, CAST(348 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10866, N'BERGS', 5, CAST(N'1996-03-05' AS Date), CAST(N'1996-04-02' AS Date), CAST(N'1996-03-14' AS Date), 1, CAST(109 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10867, N'LONEP', 6, CAST(N'1996-03-05' AS Date), CAST(N'1996-04-16' AS Date), CAST(N'1996-03-13' AS Date), 1, CAST(2 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10868, N'QUEEN', 7, CAST(N'1996-03-06' AS Date), CAST(N'1996-04-03' AS Date), CAST(N'1996-03-25' AS Date), 2, CAST(191 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10869, N'SEVES', 5, CAST(N'1996-03-06' AS Date), CAST(N'1996-04-03' AS Date), CAST(N'1996-03-11' AS Date), 1, CAST(143 AS Decimal(18, 0)), N'Seven Seas Imports', N'90 Wadhurst Rd.', N'London', NULL, N'OX15 4NB', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10870, N'WHITC', 5, CAST(N'1996-03-06' AS Date), CAST(N'1996-04-03' AS Date), CAST(N'1996-03-15' AS Date), 3, CAST(12 AS Decimal(18, 0)), N'White Clover Markets', N'305 - 14th Ave. S.Suite 3B', N'Seattle', N'WA', N'98128', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10871, N'BONAP', 9, CAST(N'1996-03-07' AS Date), CAST(N'1996-04-04' AS Date), CAST(N'1996-03-12' AS Date), 2, CAST(112 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10872, N'GODOS', 5, CAST(N'1996-03-07' AS Date), CAST(N'1996-04-04' AS Date), CAST(N'1996-03-11' AS Date), 2, CAST(175 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10873, N'WILMK', 4, CAST(N'1996-03-08' AS Date), CAST(N'1996-04-05' AS Date), CAST(N'1996-03-11' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10874, N'GODOS', 5, CAST(N'1996-03-08' AS Date), CAST(N'1996-04-05' AS Date), CAST(N'1996-03-13' AS Date), 2, CAST(20 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10875, N'BERGS', 4, CAST(N'1996-03-08' AS Date), CAST(N'1996-04-05' AS Date), CAST(N'1996-04-02' AS Date), 2, CAST(32 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10876, N'BONAP', 7, CAST(N'1996-03-11' AS Date), CAST(N'1996-04-08' AS Date), CAST(N'1996-03-14' AS Date), 3, CAST(60 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10877, N'RICAR', 1, CAST(N'1996-03-11' AS Date), CAST(N'1996-04-08' AS Date), CAST(N'1996-03-21' AS Date), 1, CAST(38 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10878, N'QUICK', 4, CAST(N'1996-03-12' AS Date), CAST(N'1996-04-09' AS Date), CAST(N'1996-03-14' AS Date), 1, CAST(47 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10879, N'WILMK', 3, CAST(N'1996-03-12' AS Date), CAST(N'1996-04-09' AS Date), CAST(N'1996-03-14' AS Date), 3, CAST(9 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10880, N'FOLKO', 7, CAST(N'1996-03-12' AS Date), CAST(N'1996-04-23' AS Date), CAST(N'1996-03-20' AS Date), 1, CAST(88 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10881, N'CACTU', 4, CAST(N'1996-03-13' AS Date), CAST(N'1996-04-10' AS Date), CAST(N'1996-03-20' AS Date), 1, CAST(3 AS Decimal(18, 0)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10882, N'SAVEA', 4, CAST(N'1996-03-13' AS Date), CAST(N'1996-04-10' AS Date), CAST(N'1996-03-22' AS Date), 3, CAST(23 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10883, N'LONEP', 8, CAST(N'1996-03-14' AS Date), CAST(N'1996-04-11' AS Date), CAST(N'1996-03-22' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10884, N'LETSS', 4, CAST(N'1996-03-14' AS Date), CAST(N'1996-04-11' AS Date), CAST(N'1996-03-15' AS Date), 2, CAST(91 AS Decimal(18, 0)), N'Let''s Stop N Shop', N'87 Polk St.Suite 5', N'San Francisco', N'CA', N'94117', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10885, N'SUPRD', 6, CAST(N'1996-03-14' AS Date), CAST(N'1996-04-11' AS Date), CAST(N'1996-03-20' AS Date), 3, CAST(6 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10886, N'HANAR', 1, CAST(N'1996-03-15' AS Date), CAST(N'1996-04-12' AS Date), CAST(N'1996-04-01' AS Date), 1, CAST(5 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10887, N'GALED', 8, CAST(N'1996-03-15' AS Date), CAST(N'1996-04-12' AS Date), CAST(N'1996-03-18' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'Galería del gastronómo', N'Rambla de Cataluña. 23', N'Barcelona', NULL, N'8022', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10888, N'GODOS', 1, CAST(N'1996-03-18' AS Date), CAST(N'1996-04-15' AS Date), CAST(N'1996-03-25' AS Date), 2, CAST(52 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10889, N'RATTC', 9, CAST(N'1996-03-18' AS Date), CAST(N'1996-04-15' AS Date), CAST(N'1996-03-25' AS Date), 3, CAST(281 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10890, N'DUMON', 7, CAST(N'1996-03-18' AS Date), CAST(N'1996-04-15' AS Date), CAST(N'1996-03-20' AS Date), 1, CAST(33 AS Decimal(18, 0)), N'Du monde entier', N'67. rue des Cinquante Otages', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10891, N'LEHMS', 7, CAST(N'1996-03-19' AS Date), CAST(N'1996-04-16' AS Date), CAST(N'1996-03-21' AS Date), 2, CAST(20 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10892, N'MAISD', 4, CAST(N'1996-03-19' AS Date), CAST(N'1996-04-16' AS Date), CAST(N'1996-03-21' AS Date), 2, CAST(120 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10893, N'KOENE', 9, CAST(N'1996-03-20' AS Date), CAST(N'1996-04-17' AS Date), CAST(N'1996-03-22' AS Date), 2, CAST(78 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10894, N'SAVEA', 1, CAST(N'1996-03-20' AS Date), CAST(N'1996-04-17' AS Date), CAST(N'1996-03-22' AS Date), 1, CAST(116 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10895, N'ERNSH', 3, CAST(N'1996-03-20' AS Date), CAST(N'1996-04-17' AS Date), CAST(N'1996-03-25' AS Date), 1, CAST(163 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10896, N'MAISD', 7, CAST(N'1996-03-21' AS Date), CAST(N'1996-04-18' AS Date), CAST(N'1996-03-29' AS Date), 3, CAST(32 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10897, N'HUNGO', 3, CAST(N'1996-03-21' AS Date), CAST(N'1996-04-18' AS Date), CAST(N'1996-03-27' AS Date), 2, CAST(604 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10898, N'OCEAN', 4, CAST(N'1996-03-22' AS Date), CAST(N'1996-04-19' AS Date), CAST(N'1996-04-05' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'Océano Atlántico Ltda.', N'Ing. Gustavo Moncada 8585Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10899, N'LILAS', 5, CAST(N'1996-03-22' AS Date), CAST(N'1996-04-19' AS Date), CAST(N'1996-03-28' AS Date), 3, CAST(1 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10900, N'WELLI', 1, CAST(N'1996-03-22' AS Date), CAST(N'1996-04-19' AS Date), CAST(N'1996-04-03' AS Date), 2, CAST(2 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10901, N'HILAA', 4, CAST(N'1996-03-25' AS Date), CAST(N'1996-04-22' AS Date), CAST(N'1996-03-28' AS Date), 1, CAST(62 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10902, N'FOLKO', 1, CAST(N'1996-03-25' AS Date), CAST(N'1996-04-22' AS Date), CAST(N'1996-04-02' AS Date), 1, CAST(44 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10903, N'HANAR', 3, CAST(N'1996-03-26' AS Date), CAST(N'1996-04-23' AS Date), CAST(N'1996-04-03' AS Date), 3, CAST(37 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10904, N'WHITC', 3, CAST(N'1996-03-26' AS Date), CAST(N'1996-04-23' AS Date), CAST(N'1996-03-29' AS Date), 3, CAST(163 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10905, N'WELLI', 9, CAST(N'1996-03-26' AS Date), CAST(N'1996-04-23' AS Date), CAST(N'1996-04-05' AS Date), 2, CAST(14 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10906, N'WOLZA', 4, CAST(N'1996-03-27' AS Date), CAST(N'1996-04-10' AS Date), CAST(N'1996-04-02' AS Date), 3, CAST(26 AS Decimal(18, 0)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10907, N'SPECD', 6, CAST(N'1996-03-27' AS Date), CAST(N'1996-04-24' AS Date), CAST(N'1996-03-29' AS Date), 3, CAST(9 AS Decimal(18, 0)), N'Spécialités du monde', N'25. rue Lauriston', N'Paris', NULL, N'75016', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10908, N'REGGC', 4, CAST(N'1996-03-28' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-05' AS Date), 2, CAST(33 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10909, N'SANTG', 1, CAST(N'1996-03-28' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-09' AS Date), 2, CAST(53 AS Decimal(18, 0)), N'Santé Gourmet', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10910, N'WILMK', 1, CAST(N'1996-03-28' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-03' AS Date), 3, CAST(38 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10911, N'GODOS', 3, CAST(N'1996-03-28' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-04' AS Date), 1, CAST(38 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10912, N'HUNGO', 2, CAST(N'1996-03-28' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-17' AS Date), 2, CAST(581 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10913, N'QUEEN', 4, CAST(N'1996-03-28' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-03' AS Date), 1, CAST(33 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10914, N'QUEEN', 6, CAST(N'1996-03-29' AS Date), CAST(N'1996-04-26' AS Date), CAST(N'1996-04-01' AS Date), 1, CAST(21 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10915, N'TORTU', 2, CAST(N'1996-03-29' AS Date), CAST(N'1996-04-26' AS Date), CAST(N'1996-04-01' AS Date), 2, CAST(4 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10916, N'RANCH', 1, CAST(N'1996-03-29' AS Date), CAST(N'1996-04-26' AS Date), CAST(N'1996-04-08' AS Date), 2, CAST(64 AS Decimal(18, 0)), N'Rancho grande', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10917, N'ROMEY', 4, CAST(N'1996-04-01' AS Date), CAST(N'1996-04-29' AS Date), CAST(N'1996-04-10' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'Romero y tomillo', N'Gran Vía. 1', N'Madrid', NULL, N'28001', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10918, N'BOTTM', 3, CAST(N'1996-04-01' AS Date), CAST(N'1996-04-29' AS Date), CAST(N'1996-04-10' AS Date), 3, CAST(49 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10919, N'LINOD', 2, CAST(N'1996-04-01' AS Date), CAST(N'1996-04-29' AS Date), CAST(N'1996-04-03' AS Date), 2, CAST(20 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10920, N'AROUT', 4, CAST(N'1996-04-02' AS Date), CAST(N'1996-04-30' AS Date), CAST(N'1996-04-08' AS Date), 2, CAST(30 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10921, N'VAFFE', 1, CAST(N'1996-04-02' AS Date), CAST(N'1996-05-14' AS Date), CAST(N'1996-04-08' AS Date), 1, CAST(176 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10922, N'HANAR', 5, CAST(N'1996-04-02' AS Date), CAST(N'1996-04-30' AS Date), CAST(N'1996-04-04' AS Date), 3, CAST(63 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10923, N'LAMAI', 7, CAST(N'1996-04-02' AS Date), CAST(N'1996-05-14' AS Date), CAST(N'1996-04-12' AS Date), 3, CAST(68 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10924, N'BERGS', 3, CAST(N'1996-04-03' AS Date), CAST(N'1996-05-01' AS Date), CAST(N'1996-05-08' AS Date), 2, CAST(152 AS Decimal(18, 0)), N'Berglunds snabbköp', N'Berguvsvägen  8', N'Luleå', NULL, N'S-958 22', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10925, N'HANAR', 3, CAST(N'1996-04-03' AS Date), CAST(N'1996-05-01' AS Date), CAST(N'1996-04-12' AS Date), 1, CAST(2 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10926, N'ANATR', 4, CAST(N'1996-04-03' AS Date), CAST(N'1996-05-01' AS Date), CAST(N'1996-04-10' AS Date), 3, CAST(40 AS Decimal(18, 0)), N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitución 2222', N'México D.F.', NULL, N'05021', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10927, N'LACOR', 4, CAST(N'1996-04-04' AS Date), CAST(N'1996-05-02' AS Date), CAST(N'1996-05-08' AS Date), 1, CAST(20 AS Decimal(18, 0)), N'La corne d''abondance', N'67. avenue de l''Europe', N'Versailles', NULL, N'78000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10928, N'GALED', 1, CAST(N'1996-04-04' AS Date), CAST(N'1996-05-02' AS Date), CAST(N'1996-04-17' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Galería del gastronómo', N'Rambla de Cataluña. 23', N'Barcelona', NULL, N'8022', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10929, N'FRANK', 6, CAST(N'1996-04-04' AS Date), CAST(N'1996-05-02' AS Date), CAST(N'1996-04-11' AS Date), 1, CAST(34 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10930, N'SUPRD', 4, CAST(N'1996-04-05' AS Date), CAST(N'1996-05-17' AS Date), CAST(N'1996-04-17' AS Date), 3, CAST(16 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10931, N'RICSU', 4, CAST(N'1996-04-05' AS Date), CAST(N'1996-04-19' AS Date), CAST(N'1996-04-18' AS Date), 2, CAST(14 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10932, N'BONAP', 8, CAST(N'1996-04-05' AS Date), CAST(N'1996-05-03' AS Date), CAST(N'1996-04-23' AS Date), 1, CAST(135 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10933, N'ISLAT', 6, CAST(N'1996-04-05' AS Date), CAST(N'1996-05-03' AS Date), CAST(N'1996-04-15' AS Date), 3, CAST(54 AS Decimal(18, 0)), N'Island Trading', N'Garden HouseCrowther Way', N'Cowes', N'Isle of Wight', N'PO31 7PJ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10934, N'LEHMS', 3, CAST(N'1996-04-08' AS Date), CAST(N'1996-05-06' AS Date), CAST(N'1996-04-11' AS Date), 3, CAST(32 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10935, N'WELLI', 4, CAST(N'1996-04-08' AS Date), CAST(N'1996-05-06' AS Date), CAST(N'1996-04-17' AS Date), 3, CAST(48 AS Decimal(18, 0)), N'Wellington Importadora', N'Rua do Mercado. 12', N'Resende', N'SP', N'08737-363', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10936, N'GREAL', 3, CAST(N'1996-04-08' AS Date), CAST(N'1996-05-06' AS Date), CAST(N'1996-04-17' AS Date), 2, CAST(34 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10937, N'CACTU', 7, CAST(N'1996-04-09' AS Date), CAST(N'1996-04-23' AS Date), CAST(N'1996-04-12' AS Date), 3, CAST(32 AS Decimal(18, 0)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10938, N'QUICK', 3, CAST(N'1996-04-09' AS Date), CAST(N'1996-05-07' AS Date), CAST(N'1996-04-15' AS Date), 2, CAST(32 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10939, N'MAGAA', 2, CAST(N'1996-04-09' AS Date), CAST(N'1996-05-07' AS Date), CAST(N'1996-04-12' AS Date), 2, CAST(76 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10940, N'BONAP', 8, CAST(N'1996-04-10' AS Date), CAST(N'1996-05-08' AS Date), CAST(N'1996-04-22' AS Date), 3, CAST(20 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10941, N'SAVEA', 7, CAST(N'1996-04-10' AS Date), CAST(N'1996-05-08' AS Date), CAST(N'1996-04-19' AS Date), 2, CAST(401 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10942, N'REGGC', 9, CAST(N'1996-04-10' AS Date), CAST(N'1996-05-08' AS Date), CAST(N'1996-04-17' AS Date), 3, CAST(18 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10943, N'BSBEV', 4, CAST(N'1996-04-10' AS Date), CAST(N'1996-05-08' AS Date), CAST(N'1996-04-18' AS Date), 2, CAST(2 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10944, N'BOTTM', 6, CAST(N'1996-04-11' AS Date), CAST(N'1996-04-25' AS Date), CAST(N'1996-04-12' AS Date), 3, CAST(53 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10945, N'MORGK', 4, CAST(N'1996-04-11' AS Date), CAST(N'1996-05-09' AS Date), CAST(N'1996-04-17' AS Date), 1, CAST(10 AS Decimal(18, 0)), N'Morgenstern Gesundkost', N'Heerstr. 22', N'Leipzig', NULL, N'04179', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10946, N'VAFFE', 1, CAST(N'1996-04-11' AS Date), CAST(N'1996-05-09' AS Date), CAST(N'1996-04-18' AS Date), 2, CAST(27 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10947, N'BSBEV', 3, CAST(N'1996-04-12' AS Date), CAST(N'1996-05-10' AS Date), CAST(N'1996-04-15' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10948, N'GODOS', 3, CAST(N'1996-04-12' AS Date), CAST(N'1996-05-10' AS Date), CAST(N'1996-04-18' AS Date), 3, CAST(23 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10949, N'BOTTM', 2, CAST(N'1996-04-12' AS Date), CAST(N'1996-05-10' AS Date), CAST(N'1996-04-16' AS Date), 3, CAST(74 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10950, N'MAGAA', 1, CAST(N'1996-04-15' AS Date), CAST(N'1996-05-13' AS Date), CAST(N'1996-04-22' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Magazzini Alimentari Riuniti', N'Via Ludovico il Moro 22', N'Bérgamo', NULL, N'24100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10951, N'RICSU', 9, CAST(N'1996-04-15' AS Date), CAST(N'1996-05-27' AS Date), CAST(N'1996-05-07' AS Date), 2, CAST(31 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10952, N'ALFKI', 1, CAST(N'1996-04-15' AS Date), CAST(N'1996-05-27' AS Date), CAST(N'1996-04-23' AS Date), 1, CAST(40 AS Decimal(18, 0)), N'Alfred''s Futterkiste', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10953, N'AROUT', 9, CAST(N'1996-04-15' AS Date), CAST(N'1996-04-29' AS Date), CAST(N'1996-04-24' AS Date), 2, CAST(24 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10954, N'LINOD', 5, CAST(N'1996-04-16' AS Date), CAST(N'1996-05-28' AS Date), CAST(N'1996-04-19' AS Date), 1, CAST(28 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10955, N'FOLKO', 8, CAST(N'1996-04-16' AS Date), CAST(N'1996-05-14' AS Date), CAST(N'1996-04-19' AS Date), 2, CAST(3 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10956, N'BLAUS', 6, CAST(N'1996-04-16' AS Date), CAST(N'1996-05-28' AS Date), CAST(N'1996-04-19' AS Date), 2, CAST(45 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10957, N'HILAA', 8, CAST(N'1996-04-17' AS Date), CAST(N'1996-05-15' AS Date), CAST(N'1996-04-26' AS Date), 3, CAST(105 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10958, N'OCEAN', 7, CAST(N'1996-04-17' AS Date), CAST(N'1996-05-15' AS Date), CAST(N'1996-04-26' AS Date), 2, CAST(50 AS Decimal(18, 0)), N'Océano Atlántico Ltda.', N'Ing. Gustavo Moncada 8585Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10959, N'GOURL', 6, CAST(N'1996-04-17' AS Date), CAST(N'1996-05-29' AS Date), CAST(N'1996-04-22' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10960, N'HILAA', 3, CAST(N'1996-04-18' AS Date), CAST(N'1996-05-02' AS Date), CAST(N'1996-05-08' AS Date), 1, CAST(2 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10961, N'QUEEN', 8, CAST(N'1996-04-18' AS Date), CAST(N'1996-05-16' AS Date), CAST(N'1996-04-29' AS Date), 1, CAST(104 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10962, N'QUICK', 8, CAST(N'1996-04-18' AS Date), CAST(N'1996-05-16' AS Date), CAST(N'1996-04-22' AS Date), 2, CAST(276 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10963, N'FURIB', 9, CAST(N'1996-04-18' AS Date), CAST(N'1996-05-16' AS Date), CAST(N'1996-04-25' AS Date), 3, CAST(3 AS Decimal(18, 0)), N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10964, N'SPECD', 3, CAST(N'1996-04-19' AS Date), CAST(N'1996-05-17' AS Date), CAST(N'1996-04-23' AS Date), 2, CAST(87 AS Decimal(18, 0)), N'Spécialités du monde', N'25. rue Lauriston', N'Paris', NULL, N'75016', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10965, N'OLDWO', 6, CAST(N'1996-04-19' AS Date), CAST(N'1996-05-17' AS Date), CAST(N'1996-04-29' AS Date), 3, CAST(144 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10966, N'CHOPS', 4, CAST(N'1996-04-19' AS Date), CAST(N'1996-05-17' AS Date), CAST(N'1996-05-08' AS Date), 1, CAST(27 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10967, N'TOMSP', 2, CAST(N'1996-04-22' AS Date), CAST(N'1996-05-20' AS Date), CAST(N'1996-05-02' AS Date), 2, CAST(62 AS Decimal(18, 0)), N'Toms Spezialitäten', N'Luisenstr. 48', N'Münster', NULL, N'44087', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10968, N'ERNSH', 1, CAST(N'1996-04-22' AS Date), CAST(N'1996-05-20' AS Date), CAST(N'1996-05-01' AS Date), 3, CAST(75 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10969, N'COMMI', 1, CAST(N'1996-04-22' AS Date), CAST(N'1996-05-20' AS Date), CAST(N'1996-04-29' AS Date), 2, CAST(0 AS Decimal(18, 0)), N'Comércio Mineiro', N'Av. dos Lusíadas. 23', N'São Paulo', N'SP', N'05432-043', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10970, N'BOLID', 9, CAST(N'1996-04-23' AS Date), CAST(N'1996-05-07' AS Date), CAST(N'1996-05-24' AS Date), 1, CAST(16 AS Decimal(18, 0)), N'Bólido Comidas preparadas', N'C/ Araquil. 67', N'Madrid', NULL, N'28023', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10971, N'FRANR', 2, CAST(N'1996-04-23' AS Date), CAST(N'1996-05-21' AS Date), CAST(N'1996-05-02' AS Date), 2, CAST(122 AS Decimal(18, 0)), N'France restauration', N'54. rue Royale', N'Nantes', NULL, N'44000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10972, N'LACOR', 4, CAST(N'1996-04-23' AS Date), CAST(N'1996-05-21' AS Date), CAST(N'1996-04-25' AS Date), 2, CAST(0 AS Decimal(18, 0)), N'La corne d''abondance', N'67. avenue de l''Europe', N'Versailles', NULL, N'78000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10973, N'LACOR', 6, CAST(N'1996-04-23' AS Date), CAST(N'1996-05-21' AS Date), CAST(N'1996-04-26' AS Date), 2, CAST(15 AS Decimal(18, 0)), N'La corne d''abondance', N'67. avenue de l''Europe', N'Versailles', NULL, N'78000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10974, N'SPLIR', 3, CAST(N'1996-04-24' AS Date), CAST(N'1996-05-08' AS Date), CAST(N'1996-05-03' AS Date), 3, CAST(13 AS Decimal(18, 0)), N'Split Rail Beer & Ale', N'P.O. Box 555', N'Lander', N'WY', N'82520', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10975, N'BOTTM', 1, CAST(N'1996-04-24' AS Date), CAST(N'1996-05-22' AS Date), CAST(N'1996-04-26' AS Date), 3, CAST(32 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10976, N'HILAA', 1, CAST(N'1996-04-24' AS Date), CAST(N'1996-06-05' AS Date), CAST(N'1996-05-03' AS Date), 1, CAST(38 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10977, N'FOLKO', 8, CAST(N'1996-04-25' AS Date), CAST(N'1996-05-23' AS Date), CAST(N'1996-05-10' AS Date), 3, CAST(209 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10978, N'MAISD', 9, CAST(N'1996-04-25' AS Date), CAST(N'1996-05-23' AS Date), CAST(N'1996-05-23' AS Date), 2, CAST(33 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10979, N'ERNSH', 8, CAST(N'1996-04-25' AS Date), CAST(N'1996-05-23' AS Date), CAST(N'1996-04-30' AS Date), 2, CAST(353 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10980, N'FOLKO', 4, CAST(N'1996-04-26' AS Date), CAST(N'1996-06-07' AS Date), CAST(N'1996-05-17' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10981, N'HANAR', 1, CAST(N'1996-04-26' AS Date), CAST(N'1996-05-24' AS Date), CAST(N'1996-05-02' AS Date), 2, CAST(193 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10982, N'BOTTM', 2, CAST(N'1996-04-26' AS Date), CAST(N'1996-05-24' AS Date), CAST(N'1996-05-08' AS Date), 1, CAST(14 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10983, N'SAVEA', 2, CAST(N'1996-04-26' AS Date), CAST(N'1996-05-24' AS Date), CAST(N'1996-05-06' AS Date), 2, CAST(658 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10984, N'SAVEA', 1, CAST(N'1996-04-29' AS Date), CAST(N'1996-05-27' AS Date), CAST(N'1996-05-03' AS Date), 3, CAST(211 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10985, N'HUNGO', 2, CAST(N'1996-04-29' AS Date), CAST(N'1996-05-27' AS Date), CAST(N'1996-05-02' AS Date), 1, CAST(92 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10986, N'OCEAN', 8, CAST(N'1996-04-29' AS Date), CAST(N'1996-05-27' AS Date), CAST(N'1996-05-21' AS Date), 2, CAST(218 AS Decimal(18, 0)), N'Océano Atlántico Ltda.', N'Ing. Gustavo Moncada 8585Piso 20-A', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10987, N'EASTC', 8, CAST(N'1996-04-30' AS Date), CAST(N'1996-05-28' AS Date), CAST(N'1996-05-06' AS Date), 1, CAST(185 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10988, N'RATTC', 3, CAST(N'1996-04-30' AS Date), CAST(N'1996-05-28' AS Date), CAST(N'1996-05-10' AS Date), 2, CAST(61 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10989, N'QUEDE', 2, CAST(N'1996-04-30' AS Date), CAST(N'1996-05-28' AS Date), CAST(N'1996-05-02' AS Date), 1, CAST(35 AS Decimal(18, 0)), N'Que Delícia', N'Rua da Panificadora. 12', N'Río de Janeiro', N'RJ', N'02389-673', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10990, N'ERNSH', 2, CAST(N'1996-05-01' AS Date), CAST(N'1996-06-12' AS Date), CAST(N'1996-05-07' AS Date), 3, CAST(118 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10991, N'QUICK', 1, CAST(N'1996-05-01' AS Date), CAST(N'1996-05-29' AS Date), CAST(N'1996-05-07' AS Date), 1, CAST(39 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10992, N'THEBI', 1, CAST(N'1996-05-01' AS Date), CAST(N'1996-05-29' AS Date), CAST(N'1996-05-03' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'The Big Cheese', N'89 Jefferson WaySuite 2', N'Portland', N'OR', N'97201', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10993, N'FOLKO', 7, CAST(N'1996-05-01' AS Date), CAST(N'1996-05-29' AS Date), CAST(N'1996-05-10' AS Date), 3, CAST(9 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10994, N'VAFFE', 2, CAST(N'1996-05-02' AS Date), CAST(N'1996-05-16' AS Date), CAST(N'1996-05-09' AS Date), 3, CAST(66 AS Decimal(18, 0)), N'Vaffeljernet', N'Smagsløget 45', N'Århus', NULL, N'8200', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10995, N'PERIC', 1, CAST(N'1996-05-02' AS Date), CAST(N'1996-05-30' AS Date), CAST(N'1996-05-06' AS Date), 3, CAST(46 AS Decimal(18, 0)), N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10996, N'QUICK', 4, CAST(N'1996-05-02' AS Date), CAST(N'1996-05-30' AS Date), CAST(N'1996-05-10' AS Date), 2, CAST(1 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10997, N'LILAS', 8, CAST(N'1996-05-03' AS Date), CAST(N'1996-06-14' AS Date), CAST(N'1996-05-13' AS Date), 2, CAST(74 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10998, N'WOLZA', 8, CAST(N'1996-05-03' AS Date), CAST(N'1996-05-17' AS Date), CAST(N'1996-05-17' AS Date), 2, CAST(20 AS Decimal(18, 0)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (10999, N'OTTIK', 6, CAST(N'1996-05-03' AS Date), CAST(N'1996-05-31' AS Date), CAST(N'1996-05-10' AS Date), 2, CAST(96 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11000, N'RATTC', 2, CAST(N'1996-05-06' AS Date), CAST(N'1996-06-03' AS Date), CAST(N'1996-05-14' AS Date), 3, CAST(55 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11001, N'FOLKO', 2, CAST(N'1996-05-06' AS Date), CAST(N'1996-06-03' AS Date), CAST(N'1996-05-14' AS Date), 2, CAST(197 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11002, N'SAVEA', 4, CAST(N'1996-05-06' AS Date), CAST(N'1996-06-03' AS Date), CAST(N'1996-05-16' AS Date), 1, CAST(141 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11003, N'THECR', 3, CAST(N'1996-05-06' AS Date), CAST(N'1996-06-03' AS Date), CAST(N'1996-05-08' AS Date), 3, CAST(15 AS Decimal(18, 0)), N'The Cracker Box', N'55 Grizzly Peak Rd.', N'Butte', N'MT', N'59801', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11004, N'MAISD', 3, CAST(N'1996-05-07' AS Date), CAST(N'1996-06-04' AS Date), CAST(N'1996-05-20' AS Date), 1, CAST(45 AS Decimal(18, 0)), N'Maison Dewey', N'Rue Joseph-Bens 532', N'Bruxelles', NULL, N'B-1180', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11005, N'WILMK', 2, CAST(N'1996-05-07' AS Date), CAST(N'1996-06-04' AS Date), CAST(N'1996-05-10' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Wilman Kala', N'Keskuskatu 45', N'Helsinki', NULL, N'21240', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11006, N'GREAL', 3, CAST(N'1996-05-07' AS Date), CAST(N'1996-06-04' AS Date), CAST(N'1996-05-15' AS Date), 2, CAST(25 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11007, N'PRINI', 8, CAST(N'1996-05-08' AS Date), CAST(N'1996-06-05' AS Date), CAST(N'1996-05-13' AS Date), 2, CAST(202 AS Decimal(18, 0)), N'Princesa Isabel Vinhos', N'Estrada da saúde n. 58', N'Lisboa', NULL, N'1756', N'Portugal')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11008, N'ERNSH', 7, CAST(N'1996-05-08' AS Date), CAST(N'1996-06-05' AS Date), NULL, 3, CAST(79 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11009, N'GODOS', 2, CAST(N'1996-05-08' AS Date), CAST(N'1996-06-05' AS Date), CAST(N'1996-05-10' AS Date), 1, CAST(59 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11010, N'REGGC', 2, CAST(N'1996-05-09' AS Date), CAST(N'1996-06-06' AS Date), CAST(N'1996-05-21' AS Date), 2, CAST(29 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11011, N'ALFKI', 3, CAST(N'1996-05-09' AS Date), CAST(N'1996-06-06' AS Date), CAST(N'1996-05-13' AS Date), 1, CAST(1 AS Decimal(18, 0)), N'Alfred''s Futterkiste', N'Obere Str. 57', N'Berlín', NULL, N'12209', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11012, N'FRANK', 1, CAST(N'1996-05-09' AS Date), CAST(N'1996-05-23' AS Date), CAST(N'1996-05-17' AS Date), 3, CAST(243 AS Decimal(18, 0)), N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11013, N'ROMEY', 2, CAST(N'1996-05-09' AS Date), CAST(N'1996-06-06' AS Date), CAST(N'1996-05-10' AS Date), 1, CAST(33 AS Decimal(18, 0)), N'Romero y tomillo', N'Gran Vía. 1', N'Madrid', NULL, N'28001', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11014, N'LINOD', 2, CAST(N'1996-05-10' AS Date), CAST(N'1996-06-07' AS Date), CAST(N'1996-05-15' AS Date), 3, CAST(24 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11015, N'SANTG', 2, CAST(N'1996-05-10' AS Date), CAST(N'1996-05-24' AS Date), CAST(N'1996-05-20' AS Date), 2, CAST(5 AS Decimal(18, 0)), N'Santé Gourmet', N'Erling Skakkes gate 78', N'Stavern', NULL, N'4110', N'Noruega')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11016, N'AROUT', 9, CAST(N'1996-05-10' AS Date), CAST(N'1996-06-07' AS Date), CAST(N'1996-05-13' AS Date), 2, CAST(34 AS Decimal(18, 0)), N'Around the Horn', N'Brook FarmStratford St. Mary', N'Colchester', N'Essex', N'CO7 6JX', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11017, N'ERNSH', 9, CAST(N'1996-05-13' AS Date), CAST(N'1996-06-10' AS Date), CAST(N'1996-05-20' AS Date), 2, CAST(754 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11018, N'LONEP', 4, CAST(N'1996-05-13' AS Date), CAST(N'1996-06-10' AS Date), CAST(N'1996-05-16' AS Date), 2, CAST(12 AS Decimal(18, 0)), N'Lonesome Pine Restaurant', N'89 Chiaroscuro Rd.', N'Portland', N'OR', N'97219', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11019, N'RANCH', 6, CAST(N'1996-05-13' AS Date), CAST(N'1996-06-10' AS Date), NULL, 3, CAST(3 AS Decimal(18, 0)), N'Rancho grande', N'Av. del Libertador 900', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11020, N'OTTIK', 2, CAST(N'1996-05-14' AS Date), CAST(N'1996-06-11' AS Date), CAST(N'1996-05-16' AS Date), 2, CAST(43 AS Decimal(18, 0)), N'Ottilies Käseladen', N'Mehrheimerstr. 369', N'Köln', NULL, N'50739', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11021, N'QUICK', 3, CAST(N'1996-05-14' AS Date), CAST(N'1996-06-11' AS Date), CAST(N'1996-05-21' AS Date), 1, CAST(297 AS Decimal(18, 0)), N'QUICK-Stop', N'Taucherstraße 10', N'Cunewalde', NULL, N'01307', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11022, N'HANAR', 9, CAST(N'1996-05-14' AS Date), CAST(N'1996-06-11' AS Date), CAST(N'1996-06-03' AS Date), 2, CAST(6 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11023, N'BSBEV', 1, CAST(N'1996-05-14' AS Date), CAST(N'1996-05-28' AS Date), CAST(N'1996-05-24' AS Date), 2, CAST(124 AS Decimal(18, 0)), N'B''s Beverages', N'Fauntleroy Circus', N'London', NULL, N'EC2 5NT', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11024, N'EASTC', 4, CAST(N'1996-05-15' AS Date), CAST(N'1996-06-12' AS Date), CAST(N'1996-05-20' AS Date), 1, CAST(74 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11025, N'WARTH', 6, CAST(N'1996-05-15' AS Date), CAST(N'1996-06-12' AS Date), CAST(N'1996-05-24' AS Date), 3, CAST(29 AS Decimal(18, 0)), N'Wartian Herkku', N'Torikatu 38', N'Oulu', NULL, N'90110', N'Finlandia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11026, N'FRANS', 4, CAST(N'1996-05-15' AS Date), CAST(N'1996-06-12' AS Date), CAST(N'1996-05-28' AS Date), 1, CAST(47 AS Decimal(18, 0)), N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11027, N'BOTTM', 1, CAST(N'1996-05-16' AS Date), CAST(N'1996-06-13' AS Date), CAST(N'1996-05-20' AS Date), 1, CAST(53 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11028, N'KOENE', 2, CAST(N'1996-05-16' AS Date), CAST(N'1996-06-13' AS Date), CAST(N'1996-05-22' AS Date), 1, CAST(30 AS Decimal(18, 0)), N'Königlich Essen', N'Maubelstr. 90', N'Brandenburg', NULL, N'14776', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11029, N'CHOPS', 4, CAST(N'1996-05-16' AS Date), CAST(N'1996-06-13' AS Date), CAST(N'1996-05-27' AS Date), 1, CAST(48 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11030, N'SAVEA', 7, CAST(N'1996-05-17' AS Date), CAST(N'1996-06-14' AS Date), CAST(N'1996-05-27' AS Date), 2, CAST(831 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11031, N'SAVEA', 6, CAST(N'1996-05-17' AS Date), CAST(N'1996-06-14' AS Date), CAST(N'1996-05-24' AS Date), 2, CAST(227 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11032, N'WHITC', 2, CAST(N'1996-05-17' AS Date), CAST(N'1996-06-14' AS Date), CAST(N'1996-05-23' AS Date), 3, CAST(606 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11033, N'RICSU', 7, CAST(N'1996-05-17' AS Date), CAST(N'1996-06-14' AS Date), CAST(N'1996-05-23' AS Date), 3, CAST(85 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11034, N'OLDWO', 8, CAST(N'1996-05-20' AS Date), CAST(N'1996-07-01' AS Date), CAST(N'1996-05-27' AS Date), 1, CAST(40 AS Decimal(18, 0)), N'Old World Delicatessen', N'2743 Bering St.', N'Anchorage', N'AK', N'99508', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11035, N'SUPRD', 2, CAST(N'1996-05-20' AS Date), CAST(N'1996-06-17' AS Date), CAST(N'1996-05-24' AS Date), 2, CAST(0 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11036, N'DRACD', 8, CAST(N'1996-05-20' AS Date), CAST(N'1996-06-17' AS Date), CAST(N'1996-05-22' AS Date), 3, CAST(149 AS Decimal(18, 0)), N'Drachenblut Delikatessen', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11037, N'GODOS', 7, CAST(N'1996-05-21' AS Date), CAST(N'1996-06-18' AS Date), CAST(N'1996-05-27' AS Date), 1, CAST(3 AS Decimal(18, 0)), N'Godos Cocina Típica', N'C/ Romero. 33', N'Sevilla', NULL, N'41101', N'España')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11038, N'SUPRD', 1, CAST(N'1996-05-21' AS Date), CAST(N'1996-06-18' AS Date), CAST(N'1996-05-30' AS Date), 2, CAST(30 AS Decimal(18, 0)), N'Suprêmes délices', N'Boulevard Tirou. 255', N'Charleroi', NULL, N'B-6000', N'Bélgica')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11039, N'LINOD', 1, CAST(N'1996-05-21' AS Date), CAST(N'1996-06-18' AS Date), NULL, 2, CAST(65 AS Decimal(18, 0)), N'LINO-Delicateses', N'Ave. 5 de Mayo Porlamar', N'I. de Margarita', N'Nueva Esparta', N'4980', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11040, N'GREAL', 4, CAST(N'1996-05-22' AS Date), CAST(N'1996-06-19' AS Date), NULL, 3, CAST(19 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11041, N'CHOPS', 3, CAST(N'1996-05-22' AS Date), CAST(N'1996-06-19' AS Date), CAST(N'1996-05-28' AS Date), 2, CAST(48 AS Decimal(18, 0)), N'Chop-suey Chinese', N'Hauptstr. 31', N'Bern', NULL, N'3012', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11042, N'COMMI', 2, CAST(N'1996-05-22' AS Date), CAST(N'1996-06-05' AS Date), CAST(N'1996-05-31' AS Date), 1, CAST(30 AS Decimal(18, 0)), N'Comércio Mineiro', N'Av. dos Lusíadas. 23', N'São Paulo', N'SP', N'05432-043', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11043, N'SPECD', 5, CAST(N'1996-05-22' AS Date), CAST(N'1996-06-19' AS Date), CAST(N'1996-05-29' AS Date), 2, CAST(9 AS Decimal(18, 0)), N'Spécialités du monde', N'25. rue Lauriston', N'Paris', NULL, N'75016', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11044, N'WOLZA', 4, CAST(N'1996-05-23' AS Date), CAST(N'1996-06-20' AS Date), CAST(N'1996-05-31' AS Date), 1, CAST(9 AS Decimal(18, 0)), N'Wolski Zajazd', N'ul. Filtrowa 68', N'Warszawa', NULL, N'01-012', N'Polonia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11045, N'BOTTM', 6, CAST(N'1996-05-23' AS Date), CAST(N'1996-06-20' AS Date), NULL, 2, CAST(71 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11046, N'WANDK', 8, CAST(N'1996-05-23' AS Date), CAST(N'1996-06-20' AS Date), CAST(N'1996-05-24' AS Date), 2, CAST(72 AS Decimal(18, 0)), N'Die Wandernde Kuh', N'Adenauerallee 900', N'Stuttgart', NULL, N'70563', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11047, N'EASTC', 7, CAST(N'1996-05-24' AS Date), CAST(N'1996-06-21' AS Date), CAST(N'1996-05-31' AS Date), 3, CAST(47 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11048, N'BOTTM', 7, CAST(N'1996-05-24' AS Date), CAST(N'1996-06-21' AS Date), CAST(N'1996-05-30' AS Date), 3, CAST(24 AS Decimal(18, 0)), N'Bottom-Dollar Markets', N'23 Tsawassen Blvd.', N'Tsawassen', N'BC', N'T2F 8M4', N'Canadá')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11049, N'GOURL', 3, CAST(N'1996-05-24' AS Date), CAST(N'1996-06-21' AS Date), CAST(N'1996-06-03' AS Date), 1, CAST(8 AS Decimal(18, 0)), N'Gourmet Lanchonetes', N'Av. Brasil. 442', N'Campinas', N'SP', N'04876-786', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11050, N'FOLKO', 8, CAST(N'1996-05-27' AS Date), CAST(N'1996-06-24' AS Date), CAST(N'1996-06-04' AS Date), 2, CAST(59 AS Decimal(18, 0)), N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Suecia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11051, N'LAMAI', 7, CAST(N'1996-05-27' AS Date), CAST(N'1996-06-24' AS Date), NULL, 3, CAST(3 AS Decimal(18, 0)), N'La maison d''Asie', N'1 rue Alsace-Lorraine', N'Toulouse', NULL, N'31000', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11052, N'HANAR', 3, CAST(N'1996-05-27' AS Date), CAST(N'1996-06-24' AS Date), CAST(N'1996-05-31' AS Date), 1, CAST(67 AS Decimal(18, 0)), N'Hanari Carnes', N'Rua do Paço. 67', N'Río de Janeiro', N'RJ', N'05454-876', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11053, N'PICCO', 2, CAST(N'1996-05-27' AS Date), CAST(N'1996-06-24' AS Date), CAST(N'1996-05-29' AS Date), 2, CAST(53 AS Decimal(18, 0)), N'Piccolo und mehr', N'Geislweg 14', N'Salzburg', NULL, N'5020', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11054, N'CACTU', 8, CAST(N'1996-05-28' AS Date), CAST(N'1996-06-25' AS Date), NULL, 1, CAST(0 AS Decimal(18, 0)), N'Cactus Comidas para llevar', N'Cerrito 333', N'Buenos Aires', NULL, N'1010', N'Argentina')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11055, N'HILAA', 7, CAST(N'1996-05-28' AS Date), CAST(N'1996-06-25' AS Date), CAST(N'1996-06-04' AS Date), 2, CAST(121 AS Decimal(18, 0)), N'HILARIÓN-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11056, N'EASTC', 8, CAST(N'1996-05-28' AS Date), CAST(N'1996-06-11' AS Date), CAST(N'1996-05-31' AS Date), 2, CAST(279 AS Decimal(18, 0)), N'Eastern Connection', N'35 King George', N'London', NULL, N'WX3 6FW', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11057, N'NORTS', 3, CAST(N'1996-05-29' AS Date), CAST(N'1996-06-26' AS Date), CAST(N'1996-05-31' AS Date), 3, CAST(4 AS Decimal(18, 0)), N'North/South', N'South House300 Queensbridge', N'London', NULL, N'SW7 1RZ', N'Reino Unido')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11058, N'BLAUS', 9, CAST(N'1996-05-29' AS Date), CAST(N'1996-06-26' AS Date), NULL, 3, CAST(31 AS Decimal(18, 0)), N'Blauer See Delikatessen', N'Forsterstr. 57', N'Mannheim', NULL, N'68306', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11059, N'RICAR', 2, CAST(N'1996-05-29' AS Date), CAST(N'1996-07-10' AS Date), NULL, 2, CAST(86 AS Decimal(18, 0)), N'Ricardo Adocicados', N'Av. Copacabana. 267', N'Río de Janeiro', N'RJ', N'02389-890', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11060, N'FRANS', 2, CAST(N'1996-05-30' AS Date), CAST(N'1996-06-27' AS Date), CAST(N'1996-06-03' AS Date), 2, CAST(11 AS Decimal(18, 0)), N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11061, N'GREAL', 4, CAST(N'1996-05-30' AS Date), CAST(N'1996-07-11' AS Date), NULL, 3, CAST(14 AS Decimal(18, 0)), N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11062, N'REGGC', 4, CAST(N'1996-05-30' AS Date), CAST(N'1996-06-27' AS Date), NULL, 2, CAST(30 AS Decimal(18, 0)), N'Reggiani Caseifici', N'Strada Provinciale 124', N'Reggio Emilia', NULL, N'42100', N'Italia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11063, N'HUNGO', 3, CAST(N'1996-05-30' AS Date), CAST(N'1996-06-27' AS Date), CAST(N'1996-06-05' AS Date), 2, CAST(82 AS Decimal(18, 0)), N'Hungry Owl All-Night Grocers', N'8 Johnstown Road', N'Cork', N'Co. Cork', NULL, N'Irlanda')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11064, N'SAVEA', 1, CAST(N'1996-05-31' AS Date), CAST(N'1996-06-28' AS Date), CAST(N'1996-06-03' AS Date), 1, CAST(30 AS Decimal(18, 0)), N'Save-a-lot Markets', N'187 Suffolk Ln.', N'Boise', N'ID', N'83720', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11065, N'LILAS', 8, CAST(N'1996-05-31' AS Date), CAST(N'1996-06-28' AS Date), NULL, 1, CAST(13 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11066, N'WHITC', 7, CAST(N'1996-05-31' AS Date), CAST(N'1996-06-28' AS Date), CAST(N'1996-06-03' AS Date), 2, CAST(45 AS Decimal(18, 0)), N'White Clover Markets', N'1029 - 12th Ave. S.', N'Seattle', N'WA', N'98124', N'Estados Unidos')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11067, N'DRACD', 1, CAST(N'1996-06-03' AS Date), CAST(N'1996-06-17' AS Date), CAST(N'1996-06-05' AS Date), 2, CAST(8 AS Decimal(18, 0)), N'Drachenblut Delikatessen', N'Walserweg 21', N'Aachen', NULL, N'52066', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11068, N'QUEEN', 8, CAST(N'1996-06-03' AS Date), CAST(N'1996-07-01' AS Date), NULL, 2, CAST(82 AS Decimal(18, 0)), N'Queen Cozinha', N'Alameda dos Canàrios. 891', N'São Paulo', N'SP', N'05487-020', N'Brasil')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11069, N'TORTU', 1, CAST(N'1996-06-03' AS Date), CAST(N'1996-07-01' AS Date), CAST(N'1996-06-05' AS Date), 2, CAST(16 AS Decimal(18, 0)), N'Tortuga Restaurante', N'Avda. Azteca 123', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11070, N'LEHMS', 2, CAST(N'1996-06-04' AS Date), CAST(N'1996-07-02' AS Date), NULL, 1, CAST(136 AS Decimal(18, 0)), N'Lehmanns Marktstand', N'Magazinweg 7', N'Frankfurt a.M. ', NULL, N'60528', N'Alemania')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11071, N'LILAS', 1, CAST(N'1996-06-04' AS Date), CAST(N'1996-07-02' AS Date), NULL, 1, CAST(1 AS Decimal(18, 0)), N'LILA-Supermercado', N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', N'Barquisimeto', N'Lara', N'3508', N'Venezuela')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11072, N'ERNSH', 4, CAST(N'1996-06-04' AS Date), CAST(N'1996-07-02' AS Date), NULL, 2, CAST(259 AS Decimal(18, 0)), N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11073, N'PERIC', 2, CAST(N'1996-06-04' AS Date), CAST(N'1996-07-02' AS Date), NULL, 2, CAST(25 AS Decimal(18, 0)), N'Pericles Comidas clásicas', N'Calle Dr. Jorge Cash 321', N'México D.F.', NULL, N'05033', N'México')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11074, N'SIMOB', 7, CAST(N'1996-06-05' AS Date), CAST(N'1996-07-03' AS Date), NULL, 2, CAST(18 AS Decimal(18, 0)), N'Simons bistro', N'Vinbæltet 34', N'København', NULL, N'1734', N'Dinamarca')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11075, N'RICSU', 8, CAST(N'1996-06-05' AS Date), CAST(N'1996-07-03' AS Date), NULL, 2, CAST(6 AS Decimal(18, 0)), N'Richter Supermarkt', N'Starenweg 5', N'Genève', NULL, N'1204', N'Suiza')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11076, N'BONAP', 4, CAST(N'1996-06-05' AS Date), CAST(N'1996-07-03' AS Date), NULL, 2, CAST(38 AS Decimal(18, 0)), N'Bon app''', N'12. rue des Bouchers', N'Marseille', NULL, N'13008', N'Francia')
GO
INSERT [dbo].[Pedidos] ([IdPedido], [IdCliente], [IdEmpleado], [FechaPedido], [FechaEntrega], [FechaEnvio], [FormaEnvio], [Cargo], [Destinatario], [DireccionDestinatario], [CiudadDestinatario], [RegionDestinatario], [CodPostalDestinatario], [PaisDestinatario]) VALUES (11077, N'RATTC', 1, CAST(N'1996-06-05' AS Date), CAST(N'1996-07-03' AS Date), NULL, 2, CAST(9 AS Decimal(18, 0)), N'Rattlesnake Canyon Grocery', N'2817 Milton Dr.', N'Albuquerque', N'NM', N'87110', N'Estados Unidos')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (1, N'Té Dharamsala', 1, 1, N'10 cajas x 20 bolsas', CAST(18 AS Decimal(18, 0)), 39, 0, 10, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (2, N'Cerveza tibetana Barley', 1, 1, N'24 - bot. 12 l', CAST(19 AS Decimal(18, 0)), 17, 40, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (3, N'Sirope de regaliz', 1, 2, N'12 - bot. 550 ml', CAST(10 AS Decimal(18, 0)), 13, 70, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (4, N'Especias Cajun del chef Anton', 2, 2, N'48 - frascos 6 l', CAST(22 AS Decimal(18, 0)), 53, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (5, N'Mezcla Gumbo del chef Anton', 2, 2, N'36 cajas', CAST(21 AS Decimal(18, 0)), 0, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (6, N'Mermelada de grosellas de la abuela', 3, 2, N'12 - frascos 8 l', CAST(25 AS Decimal(18, 0)), 120, 0, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (7, N'Peras secas orgánicas del tío Bob', 3, 7, N'12 - paq. 1 kg', CAST(30 AS Decimal(18, 0)), 15, 0, 10, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (8, N'Salsa de arándanos Northwoods', 3, 2, N'12 - frascos 12 l', CAST(40 AS Decimal(18, 0)), 6, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (9, N'Buey Mishi Kobe', 4, 6, N'18 - paq. 500 g', CAST(97 AS Decimal(18, 0)), 29, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (10, N'Pez espada', 4, 8, N'12 - frascos 200 ml', CAST(31 AS Decimal(18, 0)), 31, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (11, N'Queso Cabrales', 5, 4, N'paq. 1 kg', CAST(21 AS Decimal(18, 0)), 22, 30, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (12, N'Queso Manchego La Pastora', 5, 4, N'10 - paq. 500 g', CAST(38 AS Decimal(18, 0)), 86, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (13, N'Algas Konbu', 6, 8, N'caja 2 kg', CAST(6 AS Decimal(18, 0)), 24, 0, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (14, N'Cuajada de judías', 6, 7, N'40 - paq. 100 g', CAST(23 AS Decimal(18, 0)), 35, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (15, N'Salsa de soja baja en sodio', 6, 2, N'24 - bot. 250 ml', CAST(16 AS Decimal(18, 0)), 39, 0, 5, 0, NULL)
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (16, N'Postre de merengue Pavlova', 7, 3, N'32 - cajas 500 g', CAST(17 AS Decimal(18, 0)), 29, 0, 10, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (17, N'Cordero Alice Springs', 7, 6, N'20 - latas 1 kg', CAST(39 AS Decimal(18, 0)), 0, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (18, N'Langostinos tigre Carnarvon', 7, 8, N'paq. 16 kg', CAST(63 AS Decimal(18, 0)), 42, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (19, N'Pastas de té de chocolate', 8, 3, N'10 cajas x 12 piezas', CAST(9 AS Decimal(18, 0)), 25, 0, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (20, N'Mermelada de Sir Rodney''s', 8, 3, N'30 cajas regalo', CAST(81 AS Decimal(18, 0)), 40, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (21, N'Bollos de Sir Rodney''s', 8, 3, N'24 paq. x 4 piezas', CAST(10 AS Decimal(18, 0)), 3, 40, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (22, N'Pan de centeno crujiente estilo Gustaf''s', 9, 5, N'24 - paq. 500 g', CAST(21 AS Decimal(18, 0)), 104, 0, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (23, N'Pan fino', 9, 5, N'12 - paq. 250 g', CAST(9 AS Decimal(18, 0)), 61, 0, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (24, N'Refresco Guaraná Fantástica', 10, 1, N'12 - latas 355 ml', CAST(5 AS Decimal(18, 0)), 20, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (25, N'Crema de chocolate y nueces NuNuCa', 11, 3, N'20 - vasos  450 g', CAST(14 AS Decimal(18, 0)), 76, 0, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (26, N'Ositos de goma Gumbär', 11, 3, N'100 - bolsas 250 g', CAST(31 AS Decimal(18, 0)), 15, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (27, N'Chocolate Schoggi', 11, 3, N'100 - piezas 100 g', CAST(44 AS Decimal(18, 0)), 49, 0, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (28, N'Col fermentada Rössle', 12, 7, N'25 - latas 825 g', CAST(46 AS Decimal(18, 0)), 26, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (29, N'Salchicha Thüringer', 12, 6, N'50 bolsas x 30 salch', CAST(124 AS Decimal(18, 0)), 0, 0, 0, 1, N'Categoria B')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (30, N'Arenque blanco del noroeste', 13, 8, N'10 - vasos 200 g', CAST(26 AS Decimal(18, 0)), 10, 0, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (31, N'Queso gorgonzola Telino', 14, 4, N'12 - paq. 100 g', CAST(13 AS Decimal(18, 0)), 0, 70, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (32, N'Queso Mascarpone Fabioli', 14, 4, N'24 - paq. 200 g', CAST(32 AS Decimal(18, 0)), 9, 40, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (33, N'Queso de cabra', 15, 4, N'500 g', CAST(3 AS Decimal(18, 0)), 112, 0, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (34, N'Cerveza Sasquatch', 16, 1, N'24 - bot. 12 l', CAST(14 AS Decimal(18, 0)), 111, 0, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (35, N'Cerveza negra Steeleye', 16, 1, N'24 - bot. 12 l', CAST(18 AS Decimal(18, 0)), 20, 0, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (36, N'Escabeche de arenque', 17, 8, N'24 - frascos 250 g', CAST(19 AS Decimal(18, 0)), 112, 0, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (37, N'Salmón ahumado Gravad', 17, 8, N'12 - paq. 500 g', CAST(26 AS Decimal(18, 0)), 11, 50, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (38, N'Vino Côte de Blaye', 18, 1, N'12 - bot. 75 cl', CAST(264 AS Decimal(18, 0)), 17, 0, 15, 0, N'Categoria A')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (39, N'Licor verde Chartreuse', 18, 1, N'750 cc por bot.', CAST(18 AS Decimal(18, 0)), 69, 0, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (40, N'Carne de cangrejo de Boston', 19, 8, N'24 - latas 4 l', CAST(18 AS Decimal(18, 0)), 123, 0, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (41, N'Crema de almejas estilo Nueva Inglaterra', 19, 8, N'12 - latas 12 l', CAST(10 AS Decimal(18, 0)), 85, 0, 10, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (42, N'Tallarines de Singapur', 20, 5, N'32 - 1 kg paq.', CAST(14 AS Decimal(18, 0)), 26, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (43, N'Café de Malasia', 20, 1, N'16 - latas 500 g', CAST(46 AS Decimal(18, 0)), 17, 10, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (44, N'Azúcar negra Malacca', 20, 2, N'20 - bolsas 2 kg', CAST(19 AS Decimal(18, 0)), 27, 0, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (45, N'Arenque ahumado', 21, 8, N'paq. 1k', CAST(10 AS Decimal(18, 0)), 5, 70, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (46, N'Arenque salado', 21, 8, N'4 - vasos 450 g', CAST(12 AS Decimal(18, 0)), 95, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (47, N'Galletas Zaanse', 22, 3, N'10 - cajas 4 l', CAST(10 AS Decimal(18, 0)), 36, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (48, N'Chocolate holandés', 22, 3, N'10 paq.', CAST(13 AS Decimal(18, 0)), 15, 70, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (49, N'Regaliz', 23, 3, N'24 - paq. 50 g', CAST(20 AS Decimal(18, 0)), 10, 60, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (50, N'Chocolate blanco', 23, 3, N'12 - barras 100 g', CAST(16 AS Decimal(18, 0)), 65, 0, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (51, N'Manzanas secas Manjimup', 24, 7, N'50 - paq. 300 g', CAST(53 AS Decimal(18, 0)), 20, 0, 10, 0, N'Categoria C')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (52, N'Cereales para Filo', 24, 5, N'16 - cajas 2 kg', CAST(7 AS Decimal(18, 0)), 38, 0, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (53, N'Empanada de carne', 24, 6, N'48 porc.', CAST(33 AS Decimal(18, 0)), 0, 0, 0, 1, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (54, N'Empanada de cerdo', 25, 6, N'16 tartas', CAST(7 AS Decimal(18, 0)), 21, 0, 10, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (55, N'Paté chino', 25, 6, N'24 cajas x 2 tartas', CAST(24 AS Decimal(18, 0)), 115, 0, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (56, N'Gnocchi de la abuela Alicia', 26, 5, N'24 - paq. 250 g', CAST(38 AS Decimal(18, 0)), 21, 10, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (57, N'Raviolis Angelo', 26, 5, N'24 - paq. 250 g', CAST(20 AS Decimal(18, 0)), 36, 0, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (58, N'Caracoles de Borgoña', 27, 8, N'24 porc.', CAST(13 AS Decimal(18, 0)), 62, 0, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (59, N'Raclet de queso Courdavault', 28, 4, N'paq. 5 kg', CAST(55 AS Decimal(18, 0)), 79, 0, 0, 0, N'Categoria C')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (60, N'Camembert Pierrot', 28, 4, N'15 - paq. 300 g', CAST(34 AS Decimal(18, 0)), 19, 0, 0, 0, N'Categoria C')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (61, N'Sirope de arce', 29, 2, N'24 - bot. 500 ml', CAST(29 AS Decimal(18, 0)), 113, 0, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (62, N'Tarta de azúcar', 29, 3, N'48 tartas', CAST(49 AS Decimal(18, 0)), 17, 0, 0, 0, N'Categoria C')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (63, N'Sandwich de vegetales', 7, 2, N'15 - frascos 625 g', CAST(44 AS Decimal(18, 0)), 24, 0, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (64, N'Bollos de pan de Wimmer', 12, 5, N'20 bolsas x 4 porc.', CAST(33 AS Decimal(18, 0)), 22, 80, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (65, N'Salsa de pimiento picante de Luisiana', 2, 2, N'32 - bot. 8 l', CAST(21 AS Decimal(18, 0)), 76, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (66, N'Especias picantes de Luisiana', 2, 2, N'24 - frascos 8 l', CAST(17 AS Decimal(18, 0)), 4, 100, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (67, N'Cerveza Laughing Lumberjack', 16, 1, N'24 - bot. 12 l', CAST(14 AS Decimal(18, 0)), 52, 0, 10, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (68, N'Barras de pan de Escocia', 8, 3, N'10 cajas x 8 porc.', CAST(13 AS Decimal(18, 0)), 6, 10, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (69, N'Queso Gudbrandsdals', 15, 4, N'paq. 10 kg', CAST(36 AS Decimal(18, 0)), 26, 0, 15, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (70, N'Cerveza Outback', 7, 1, N'24 - bot. 355 ml', CAST(15 AS Decimal(18, 0)), 15, 10, 30, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (71, N'Crema de queso Fløtemys', 15, 4, N'10 - paq. 500 g', CAST(22 AS Decimal(18, 0)), 26, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (72, N'Queso Mozzarella Giovanni', 14, 4, N'24 - paq. 200 g', CAST(35 AS Decimal(18, 0)), 14, 0, 0, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (73, N'Caviar rojo', 17, 8, N'24 - frascos150 g', CAST(15 AS Decimal(18, 0)), 101, 0, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (74, N'Queso de soja Longlife', 4, 7, N'paq. 5 kg', CAST(10 AS Decimal(18, 0)), 4, 20, 5, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (75, N'Cerveza Klosterbier Rhönbräu', 12, 1, N'24 - bot. 0,5 l', CAST(8 AS Decimal(18, 0)), 125, 0, 25, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (76, N'Licor Cloudberry', 23, 1, N'500 ml', CAST(18 AS Decimal(18, 0)), 57, 0, 20, 0, N'Categoria D')
GO
INSERT [dbo].[productos] ([idproducto], [nombreProducto], [idProveedor], [idCategoria], [cantidadPorUnidad], [precioUnidad], [unidadesEnExistencia], [unidadesEnPedido], [nivelNuevoPedido], [suspendido], [categoriaProducto]) VALUES (77, N'Salsa verde original Frankfurter', 12, 2, N'12 cajas', CAST(13 AS Decimal(18, 0)), 32, 0, 15, 0, N'Categoria D')
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (1, N'Exotic Liquids', N'Charlotte Cooper', N'Gerente de compras', N'49 Gilbert St.', N'Londres', NULL, N'EC1 4SD', N'Reino Unido', N'(171) 555-2222', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (2, N'New Orleans Cajun Delights', N'Shelley Burke', N'Administrador de pedidos', N'P.O. Box 78934', N'New Orleans', N'LA', N'70117', N'Estados Unidos', N'(100) 555-4822', NULL, N'CAJUN.HTM#CAJUN.HTM#')
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (3, N'Grandma Kelly''s Homestead', N'Regina Murphy', N'Representante de ventas', N'707 Oxford Rd.', N'Ann Arbor', N'MI', N'48104', N'Estados Unidos', N'(313) 555-5735', N'(313) 555-3349', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (4, N'Tokyo Traders', N'Yoshi Nagase', N'Gerente de marketing', N'9-8 SekimaiMusashino-shi', N'Tokyo', NULL, N'100', N'Japón', N'(03) 3555-5011', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (5, N'Cooperativa de Quesos ''Las Cabras''', N'Antonio del Valle Saavedra ', N'Administrador de exportaciones', N'Calle del Rosal 4', N'Oviedo', N'Asturias', N'33007', N'España', N'(98) 598 76 54', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (6, N'Mayumi''s', N'Mayumi Ohno', N'Representante de marketing', N'92 SetsukoChuo-ku', N'Osaka', NULL, N'545', N'Japón', N'(06) 431-7877', NULL, N'Mayumi''s (en el World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#')
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (7, N'Pavlova, Ltd.', N'Ian Devling', N'Gerente de marketing', N'74 Rose St.Moonie Ponds', N'Melbourne', N'Victoria', N'3058', N'Australia', N'(03) 444-2343', N'(03) 444-6588', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (8, N'Specialty Biscuits, Ltd.', N'Peter Wilson', N'Representante de ventas', N'29 King''s Way', N'Manchester', NULL, N'M14 GSD', N'Reino Unido', N'(161) 555-4448', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (9, N'PB Knäckebröd AB', N'Lars Peterson', N'Agente de ventas', N'Kaloadagatan 13', N'Göteborg', NULL, N'S-345 67', N'Suecia', N'031-987 65 43', N'031-987 65 91', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (10, N'Refrescos Americanas LTDA', N'Carlos Diaz', N'Gerente de marketing', N'Av. das Americanas 12.890', N'São Paulo', NULL, N'5442', N'Brasil', N'(11) 555 4640', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (11, N'Heli Süßwaren GmbH & Co. KG', N'Petra Winkler', N'Gerente de ventas', N'Tiergartenstraße 5', N'Berlín', NULL, N'10785', N'Alemania', N'(010) 9984510', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (12, N'Plutzer Lebensmittelgroßmärkte AG', N'Martin Bein', N'Ger. marketing internacional', N'Bogenallee 51', N'Frankfurt', NULL, N'60439', N'Alemania', N'(069) 992755', NULL, N'Plutzer (en el World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#')
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (13, N'Nord-Ost-Fisch Handelsgesellschaft mbH', N'Sven Petersen', N'Coordinador de mercados', N'Frahmredder 112a', N'Cuxhaven', NULL, N'27478', N'Alemania', N'(04721) 8713', N'(04721) 8714', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (14, N'Formaggi Fortini s.r.l.', N'Elio Rossi', N'Representante de ventas', N'Viale Dante, 75', N'Ravenna', NULL, N'48100', N'Italia', N'(0544) 60323', N'(0544) 60603', N'FORMAGGI.HTM#FORMAGGI.HTM#')
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (15, N'Norske Meierier', N'Beate Vileid', N'Gerente de marketing', N'Hatlevegen 5', N'Sandvika', NULL, N'1320', N'Noruega', N'(0)2-953010', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (16, N'Bigfoot Breweries', N'Cheryl Saylor', N'Repr. de cuentas regional', N'3400 - 8th AvenueSuite 210', N'Bend', N'OR', N'97101', N'Estados Unidos', N'(503) 555-9931', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (17, N'Svensk Sjöföda AB', N'Michael Björn', N'Representante de ventas', N'Brovallavägen 231', N'Stockholm', NULL, N'S-123 45', N'Suecia', N'08-123 45 67', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (18, N'Aux joyeux ecclésiastiques', N'Guylène Nodier', N'Gerente de ventas', N'203, Rue des Francs-Bourgeois', N'París', NULL, N'75004', N'Francia', N'(1) 03.83.00.68', N'(1) 03.83.00.62', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (19, N'New England Seafood Cannery', N'Robb Merchant', N'Agente de cuentas al por mayor', N'Order Processing Dept.2100 Paul Revere Blvd.', N'Boston', N'MA', N'02134', N'Estados Unidos', N'(617) 555-3267', N'(617) 555-3389', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (20, N'Leka Trading', N'Chandra Leka', N'Propietario', N'471 Serangoon Loop, Suite #402', N'Singapore', NULL, N'0512', N'Singapur', N'555-8787', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (21, N'Lyngbysild', N'Niels Petersen', N'Gerente de ventas', N'LyngbysildFiskebakken 10', N'Lyngby', NULL, N'2800', N'Dinamarca', N'43844108', N'43844115', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (22, N'Zaanse Snoepfabriek', N'Dirk Luchte', N'Gerente de contabilidad', N'VerkoopRijnweg 22', N'Zaandam', NULL, N'9999 ZZ', N'Holanda', N'(12345) 1212', N'(12345) 1210', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (23, N'Karkki Oy', N'Anne Heikkonen', N'Gerente de producción', N'Valtakatu 12', N'Lappeenranta', NULL, N'53120', N'Finlandia', N'(953) 10956', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (24, N'G''day, Mate', N'Wendy Mackenzie', N'Representante de ventas', N'170 Prince Edward ParadeHunter''s Hill', N'Sydney', N'NSW', N'2042', N'Australia', N'(02) 555-5914', N'(02) 555-4873', N'G''day Mate (en el World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#')
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (25, N'Ma Maison', N'Jean-Guy Lauzon', N'Gerente de marketing', N'2960 Rue St. Laurent', N'Montréal', N'Québec', N'H1J 1C3', N'Canadá', N'(514) 555-9022', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (26, N'Pasta Buttini s.r.l.', N'Giovanni Giudici', N'Administrador de pedidos', N'Via dei Gelsomini, 153', N'Salerno', NULL, N'84100', N'Italia', N'(089) 6547665', N'(089) 6547667', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (27, N'Escargots Nouveaux', N'Marie Delamare', N'Gerente de ventas', N'22, rue H. Voiron', N'Montceau', NULL, N'71300', N'Francia', N'85.57.00.07', NULL, NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (28, N'Gai pâturage', N'Eliane Noz', N'Representante de ventas', N'Bat. B3, rue des Alpes', N'Annecy', NULL, N'74000', N'Francia', N'38.76.98.06', N'38.76.98.58', NULL)
GO
INSERT [dbo].[proveedores] ([idProveedor], [nombreCompañia], [nombrecontacto], [cargocontacto], [direccion], [ciudad], [region], [codPostal], [pais], [telefono], [fax], [paginaprincipal]) VALUES (29, N'Forêts d''érables', N'Chantal Goulet', N'Gerente de contabilidad', N'148 rue Chasseur', N'Ste-Hyacinthe', N'Québec', N'J2S 7S8', N'Canadá', N'(514) 555-2955', N'(514) 555-2921', NULL)
GO
ALTER TABLE [dbo].[detallesdepedidos]  WITH CHECK ADD  CONSTRAINT [fk_1] FOREIGN KEY([idpedido])
REFERENCES [dbo].[Pedidos] ([IdPedido])
GO
ALTER TABLE [dbo].[detallesdepedidos] CHECK CONSTRAINT [fk_1]
GO
ALTER TABLE [dbo].[detallesdepedidos]  WITH CHECK ADD  CONSTRAINT [fk_2] FOREIGN KEY([idproducto])
REFERENCES [dbo].[productos] ([idproducto])
GO
ALTER TABLE [dbo].[detallesdepedidos] CHECK CONSTRAINT [fk_2]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [fk_4] FOREIGN KEY([FormaEnvio])
REFERENCES [dbo].[compañiasdeenvios] ([idCompañiaEnvios])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [fk_4]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [fk_5] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [fk_5]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [fk_6] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [fk_6]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [fk_3] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedores] ([idProveedor])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [fk_3]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [fk_7] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[categorias] ([idcategoria])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [fk_7]
GO
USE [master]
GO
ALTER DATABASE [Empresa] SET  READ_WRITE 
GO
