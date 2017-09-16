USE [master]
GO
/****** Object:  Database [Practica 2]    Script Date: 16/09/2017 9:11:58 ******/
CREATE DATABASE [Practica 2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica 2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Practica 2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Practica 2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Practica 2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Practica 2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica 2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica 2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica 2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica 2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica 2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica 2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica 2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica 2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Practica 2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica 2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica 2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica 2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica 2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica 2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica 2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica 2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica 2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Practica 2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica 2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica 2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica 2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica 2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica 2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica 2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica 2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica 2] SET  MULTI_USER 
GO
ALTER DATABASE [Practica 2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica 2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica 2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica 2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Practica 2]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[idcliente] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellidos] [varchar](20) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY NONCLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[idcompra] [uniqueidentifier] NOT NULL,
	[hora] [time](7) NOT NULL,
	[valordelacompra] [float] NOT NULL,
	[moneda] [money] NOT NULL,
	[productos] [int] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[idcompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[idempleado] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellidos] [varchar](20) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idproducto] [uniqueidentifier] NOT NULL,
	[precio] [float] NOT NULL,
	[cantidad] [bit] NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provedores]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedores](
	[idprovedor] [uniqueidentifier] NOT NULL,
	[cantidad] [tinyint] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_Provedores] PRIMARY KEY CLUSTERED 
(
	[idprovedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [uniqueidentifier] NOT NULL,
	[activo] [bit] NOT NULL,
	[ubicacion] [text] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sueldo]    Script Date: 16/09/2017 9:11:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sueldo](
	[idsueldo] [uniqueidentifier] NOT NULL,
	[sueldo] [float] NOT NULL,
	[FechaDePago] [date] NOT NULL,
	[moneda] [money] NOT NULL,
 CONSTRAINT [PK_Sueldo] PRIMARY KEY CLUSTERED 
(
	[idsueldo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_Cliente]    Script Date: 16/09/2017 9:11:58 ******/
CREATE NONCLUSTERED INDEX [IX_Cliente] ON [dbo].[Cliente]
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Empleado]    Script Date: 16/09/2017 9:11:58 ******/
CREATE NONCLUSTERED INDEX [IX_Empleado] ON [dbo].[Empleado]
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provedores]    Script Date: 16/09/2017 9:11:58 ******/
CREATE NONCLUSTERED INDEX [IX_Provedores] ON [dbo].[Provedores]
(
	[idprovedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Cliente] FOREIGN KEY([idcompra])
REFERENCES [dbo].[Cliente] ([idcliente])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Cliente]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Compra] FOREIGN KEY([idproducto])
REFERENCES [dbo].[Compra] ([idcompra])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Compra]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Provedores] FOREIGN KEY([idproducto])
REFERENCES [dbo].[Provedores] ([idprovedor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Provedores]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Sucursal] FOREIGN KEY([idproducto])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Sucursal]
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD  CONSTRAINT [FK_Sucursal_Sueldo] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sueldo] ([idsueldo])
GO
ALTER TABLE [dbo].[Sucursal] CHECK CONSTRAINT [FK_Sucursal_Sueldo]
GO
ALTER TABLE [dbo].[Sueldo]  WITH CHECK ADD  CONSTRAINT [FK_Sueldo_Empleado] FOREIGN KEY([idsueldo])
REFERENCES [dbo].[Empleado] ([idempleado])
GO
ALTER TABLE [dbo].[Sueldo] CHECK CONSTRAINT [FK_Sueldo_Empleado]
GO
USE [master]
GO
ALTER DATABASE [Practica 2] SET  READ_WRITE 
GO
