USE master
GO

CREATE DATABASE Pasaporte
go 

use  pasaporte 
go

CREATE TABLE Servicios (
	[IdServicio] [int] NOT NULL,
	[NombreServicio] [nvarchar](60) NOT NULL,
	[IdEmpleado] [int] NULL,
	[IdCliente] [char](5) NULL,
	[IdTipoServicio] [int] NULL,
	[IdCotizacion] [int] NOT NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Clientes
(
	[IdCliente] [char](5) NOT NULL,
	[RUC] [char] (11) not NULL,
	[NombreEmpresa] [nvarchar](50) NOT NULL,
	[NombreContacto] [nvarchar](30) NULL,
	[CargoContacto] [nvarchar](30) NULL,
	[Dirección] [nvarchar](60) NULL,
	[Distrito] [nvarchar](15) NULL,
	[Provincia] [nvarchar](15) NULL,
	[Departamento] [nvarchar](15) NULL,
	[País] [nvarchar](15) NULL,

 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Contratos 
(
	[IdContrato] [int] NOT NULL,
	[IdCotizacion] [int] NOT NULL,
	[IdOrdenServicio] [int] NOT NULL,
	[IdCliente] [char](5) NOT NULL,
	[IdServicio] [int] NULL,
	[NombreServicio] [int] NULL,
	[Plazo] [varchar] NOT NULL,
	[FechaContrato] [datetime] NULL,
	[FechaEntrega] [datetime] NULL,
	[Monto] [money] NULL,
	[PoliticaPagos] [varchar] (20) NULL,
 CONSTRAINT [PK_Contratos] PRIMARY KEY CLUSTERED 
(
	[IdContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Cotizaciones
(
	[IdCotizacion] [int] NOT NULL,
	[IdContrato] [int] NOT NULL,
	[IdCliente] [char](5) NOT NULL,
	[IdServicio] [int] not NULL,
	[NombreServicio] [int] NULL,
	[Monto] [money] NOT NULL,
 CONSTRAINT [PK_Cotizaciones] PRIMARY KEY CLUSTERED 
(

	[IdCotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE TipoServicio
(
	[IdTipoServicio] [int] NOT NULL,
	[NombreTipoServicio] [nvarchar](50) NOT NULL,
	[Monto] [money] NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[IdTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE Empleados
(
	[IdEmpleado] [int] NOT NULL,
	[Apellidos] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](10) NOT NULL,
	[DNI] [char](8) NULL,
	[IdAreaEmpleado][int] NOT NULL,
	[IdNombreArea] [nvarchar](30) NULL,
	[TipoEmpleado] [nvarchar](25) NULL,
	[FechaNacimiento] [datetime] NULL,
	[FechaContratación] [datetime] NULL,
	[Dirección] [nvarchar](60) NULL,
	[Distrito] [nvarchar](15) NULL,
	[Provincia] [nvarchar](15) NULL,
	[Departamento] [nvarchar](15) NULL,
	[País] [nvarchar](15) NULL,
	[Jefe] [int] NULL,
	[Sueldo] [money] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

CREATE TABLE OrdenServicios
(
	[IdOrdenServicio] [int] NOT NULL,
	[IdCliente] [char](5) NOT NULL,
	[NombreEmpresa] [nvarchar](50) NOT NULL,
	[IdContrato] [int] NOT NULL,
	[IdServicio] [int] NOT NULL,
	[NombreServicio] [nvarchar](60) NOT NULL,
	[Monto] [money] NULL,
 CONSTRAINT [PK_OrdenServicios] PRIMARY KEY CLUSTERED 
(

	[IdOrdenServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE AreaEmpleado
(
	[IdAreaempleado] [int] NOT NULL,
	[NombreArea] [nvarchar](50) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Apellidos] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](10) NOT NULL,
	[DNI] [char](8) NULL,

 CONSTRAINT [PK_Areaempleado] PRIMARY KEY CLUSTERED 
(
	[IdAreaEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Drop table Contratos
--drop table Clientes
--drop table Servicios
--drop table TipoServicio
--drop table Empleados
--drop table Cotizaciones
--drop table OrdenServicios
--drop table AreaEmpleado


ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Clientes]
GO
ALTER TABLE [dbo].[OrdenServicios]  WITH CHECK ADD  CONSTRAINT [FK_OrdenServicios_Contratos] FOREIGN KEY([IdOrdenServicio])
REFERENCES [dbo].[Contratos] ([IdContrato])
GO
ALTER TABLE [dbo].[OrdenServicios] CHECK CONSTRAINT [FK_OrdenServicios_Contratos]
GO
ALTER TABLE [dbo].[Contratos]  WITH CHECK ADD  CONSTRAINT [FK_Contratos_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[Contratos] CHECK CONSTRAINT [FK_Contratos_Servicios]
GO
ALTER TABLE [dbo].[Cotizaciones]  WITH CHECK ADD  CONSTRAINT [FK_Cotizaciones_Contratos] FOREIGN KEY([IdCotizacion])
REFERENCES [dbo].[Contratos] ([IdContrato])
GO
ALTER TABLE [dbo].[Cotizaciones] CHECK CONSTRAINT [FK_Cotizaciones_Contratos]
GO
ALTER TABLE [dbo].[Cotizaciones]  WITH CHECK ADD  CONSTRAINT [FK_Cotizaciones_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[Cotizaciones] CHECK CONSTRAINT [FK_Cotizaciones_Servicios]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_AreaEmpleado] FOREIGN KEY([IdAreaEmpleado])
REFERENCES [dbo].[AreaEmpleado] ([IdAreaempleado])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_AreaEmpleado]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Empleados]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_TipoServicio] FOREIGN KEY([IdTipoServicio])
REFERENCES [dbo].[TipoServicio] ([IdTipoServicio])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_TipoServicio]
GO
USE [master]
GO
ALTER DATABASE [Pasaporte] SET  READ_WRITE 
GO
