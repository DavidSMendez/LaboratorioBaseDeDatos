﻿USE [master]
GO
/****** Object:  Database [mitienditadeabarrotes]    Script Date: 13/12/2017 19:20:38 ******/
CREATE DATABASE [mitienditadeabarrotes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mitienditadeabarrotes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mitienditadeabarrotes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mitienditadeabarrotes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mitienditadeabarrotes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mitienditadeabarrotes] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mitienditadeabarrotes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mitienditadeabarrotes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET ARITHABORT OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mitienditadeabarrotes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mitienditadeabarrotes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mitienditadeabarrotes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mitienditadeabarrotes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mitienditadeabarrotes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET RECOVERY FULL 
GO
ALTER DATABASE [mitienditadeabarrotes] SET  MULTI_USER 
GO
ALTER DATABASE [mitienditadeabarrotes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mitienditadeabarrotes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mitienditadeabarrotes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mitienditadeabarrotes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mitienditadeabarrotes', N'ON'
GO
USE [mitienditadeabarrotes]
GO
/****** Object:  StoredProcedure [dbo].[compraporfecha]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[compraporfecha] @fecha date
 as
 begin
 select * from comprainventario where fechaentrada = @fecha
 end
GO
/****** Object:  StoredProcedure [dbo].[comprapormarca]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[comprapormarca] @proveedor varchar(25), @fecha date 
as 
begin
 select * from comprainventario where proveedor = @proveedor and fechaentrada = @fecha
 end
GO
/****** Object:  StoredProcedure [dbo].[precios]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[precios] @dinero money
as
begin
select * from producto where precio = @dinero 
end
GO
/****** Object:  StoredProcedure [dbo].[procesoventa]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[procesoventa] @tipo varchar(25)
 as
 begin
 select * from tipodeventa where tipo = @tipo
 end

GO
/****** Object:  StoredProcedure [dbo].[tipoproducto]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[tipoproducto] @tipo varchar(50)
 as
 begin
 select * from producto where tipo = @tipo
 end
GO
/****** Object:  UserDefinedFunction [dbo].[promediotipoprod]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[promediotipoprod] (@bebidas int , @limpieza int, @alimento int, @carnes int)
returns int
as begin

return (@bebidas + @limpieza + @alimento + @carnes)/4
end
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido_p] [varchar](30) NOT NULL,
	[apellido_m] [varchar](30) NOT NULL,
	[direccion] [varchar](60) NOT NULL,
	[fecha_naci] [date] NOT NULL,
	[sexo] [char](10) NOT NULL,
	[tel] [char](8) NULL,
	[cel] [char](10) NULL,
	[clientedesde] [date] NOT NULL,
	[nombrecomp]  AS (([nombre]+[apellido_p])+[apellido_m]),
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comprainventario]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comprainventario](
	[idpro] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fechaentrada] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[proveedor] [varchar](50) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_comprainventario] PRIMARY KEY CLUSTERED 
(
	[idpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleado](
	[idempleado] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido_p] [varchar](30) NOT NULL,
	[apellido_m] [varchar](30) NOT NULL,
	[direccion] [varchar](60) NOT NULL,
	[fecha_naci] [date] NOT NULL,
	[sexo] [char](10) NOT NULL,
	[tel] [varchar](8) NULL,
	[cel] [varchar](10) NULL,
	[inicioen] [date] NOT NULL,
	[puesto] [varchar](25) NOT NULL,
	[sueldo] [money] NOT NULL,
	[nombrecomp]  AS (([nombre]+[apellido_p])+[apellido_m]),
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inventario](
	[idpro] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fechaentrada] [date] NOT NULL,
	[horaentrada] [time](7) NOT NULL,
	[nombre] [varchar](25) NULL,
	[proveedor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_inventario] PRIMARY KEY CLUSTERED 
(
	[idpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[idpro] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[precio] [money] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[proveedor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[repor_inventario]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[repor_inventario](
	[idpro] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha] [date] NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[hora] [time](7) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[repor_ventas]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repor_ventas](
	[idempleado] [uniqueidentifier] NOT NULL,
	[numdeventas] [int] NOT NULL,
	[productostotales] [int] NOT NULL,
	[moneygenerado] [float] NOT NULL,
	[dia] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[horastrabaj] [int] NOT NULL,
	[promventas]  AS ([productostotales]/[horastrabaj])
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipodeventa]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipodeventa](
	[idventa] [uniqueidentifier] NULL,
	[tipo] [varchar](20) NOT NULL,
	[fechadeventa] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[cantidad] [int] NOT NULL,
	[idpro] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tipodeventa_1] PRIMARY KEY CLUSTERED 
(
	[idpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [uniqueidentifier] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[cantidad] [int] NOT NULL,
	[total] [money] NOT NULL,
	[idcliente] [uniqueidentifier] NOT NULL,
	[idempleado] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[clieven]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[clieven] as
select c.nombre as Nombre, c.apellido_p as Apellido_Paterno, c.apellido_m as Apellido_Materno, v.idventa as IDVenta
from cliente c
join venta as v on v.idcliente = c.idcliente
GO
/****** Object:  View [dbo].[compracliente]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[compracliente] as 
select idcliente , idempleado , fecha, total
from venta 

GO
/****** Object:  View [dbo].[protip]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[protip] as 
select p.nombre as Nombre, p.tipo as Categoría
from producto p 
GO
/****** Object:  View [dbo].[salidadeproducto]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[salidadeproducto] as
select idempleado, cantidad, hora
from venta
GO
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [clientedesde]) VALUES (N'947ce3ab-3832-4b0c-ac90-0d31ff19a93d', N'Jorge', N'Sanchez', N'Gonzalez', N'Villas de alcala', CAST(0x83160B00 AS Date), N'masculino ', N'65841298', N'8521367852', CAST(0xA63A0B00 AS Date))
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [clientedesde]) VALUES (N'1959a055-0883-41e3-b5d9-1d6d3affb34d', N'Barry', N'Allen', N'Allen', N'Central city', CAST(0x52E60A00 AS Date), N'masculino ', N'88965436', N'8163489205', CAST(0x8F340B00 AS Date))
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [clientedesde]) VALUES (N'3ca8c527-d468-4526-a4b4-a6a09e0b7cfc', N'Jose', N'Torres', N'Mezzell', N'Longview, Texas', CAST(0xA8120B00 AS Date), N'masculino ', N'84654132', N'8952468725', CAST(0x6C380B00 AS Date))
INSERT [dbo].[cliente] ([idcliente], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [clientedesde]) VALUES (N'c17580e1-4871-4edb-86f0-b2fe28a37eef', N'Bruce', N'Wayne', N'Wayne', N'Ciudad gotica', CAST(0x77CD0A00 AS Date), N'masculino ', N'81152436', N'8115459789', CAST(0x2D2B0B00 AS Date))
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'4b672dba-637f-4bde-a459-0a89d8a8abb3', 1, CAST(0x973D0B00 AS Date), CAST(0x0700011F414E0000 AS Time), N'Santa Clara', N'Leche')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'09a233f0-d1e1-4e6e-b1d2-11dc411f93eb', 40, CAST(0x983D0B00 AS Date), CAST(0x0700DBAC96590000 AS Time), N'FUD', N'Salchichas')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'332c2a83-d815-4e9b-a991-158ff8a5481f', 50, CAST(0x973D0B00 AS Date), CAST(0x0700DB8D8C5F0000 AS Time), N'Quala', N'vive_100')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'09d6db89-d98c-49bc-9e92-1b3041721fd0', 30, CAST(0x983D0B00 AS Date), CAST(0x07808FA088440000 AS Time), N'Tyson', N'Alitas')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'f5ec25f1-7599-4bcb-bec7-230a8bf9e5f4', 80, CAST(0x993D0B00 AS Date), CAST(0x07807EDC9F3E0000 AS Time), N'Jumex Group', N'Jumex')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'c4b27360-94fc-48df-9b39-44836b2e289d', 45, CAST(0x973D0B00 AS Date), CAST(0x078093CD68650000 AS Time), N'Oreo', N'Galletas')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'b20f4e9f-daac-49a7-8719-575e2af37afe', 35, CAST(0x973D0B00 AS Date), CAST(0x07802134624F0000 AS Time), N'Ariel', N'Detergente')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'11b457bd-0c48-40c2-94f9-6856a0fcc780', 25, CAST(0x9A3D0B00 AS Date), CAST(0x07009D2D5D640000 AS Time), N'Choko krisp', N'Cereal')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'3ecf557f-3b4b-4f6d-941a-84ae7e78cfd1', 20, CAST(0x973D0B00 AS Date), CAST(0x0700E82C44740000 AS Time), N'Cloralex', N'Cloro')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'67a46b9d-4de8-444f-959d-89fe10d64683', 40, CAST(0x983D0B00 AS Date), CAST(0x0700DBAC96590000 AS Time), N'FUD', N'Jamon')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'2d5b4a96-9ca2-46d0-8b27-94e9553a2d31', 15, CAST(0x983D0B00 AS Date), CAST(0x07808FA088440000 AS Time), N'Tyson', N'Nuggets')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'b50b1a17-016e-4dde-94d6-980cda210e43', 20, CAST(0x993D0B00 AS Date), CAST(0x078054E0F63A0000 AS Time), N'Tortillera Mtz', N'Tortillas')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'b4d621f6-47f3-44ab-847c-9a493a2a5d93', 25, CAST(0x973D0B00 AS Date), CAST(0x0780FE2341580000 AS Time), N'ARCA', N'Powerade')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'7ccb16d1-f837-434c-8a7a-a1677138824f', 30, CAST(0x983D0B00 AS Date), CAST(0x0700DE46BC730000 AS Time), N'Arro', N'Arroz')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'2309cad2-b826-4be3-9475-aa65fa25e5da', 18, CAST(0x983D0B00 AS Date), CAST(0x07808FA088440000 AS Time), N'Tyson', N'Pollo')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'0bc184cc-0ef8-45d3-a9fd-b3a46efdaa22', 50, CAST(0x973D0B00 AS Date), CAST(0x0780FE2341580000 AS Time), N'ARCA', N'coca-cola')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'bcd410f0-f2d6-450d-aabc-c9b9e1bf33d8', 30, CAST(0x993D0B00 AS Date), CAST(0x07000D2B3E5C0000 AS Time), N'Nutrioli', N'aceite')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'94ee709e-c4b1-435d-87bb-d1667783b4d9', 50, CAST(0x983D0B00 AS Date), CAST(0x0780009335750000 AS Time), N'Pepsico', N'pepsi')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'e4e49534-3436-43f4-a7b2-d85a202a26bd', 23, CAST(0x993D0B00 AS Date), CAST(0x07000DD497450000 AS Time), N'Sierra', N'Frijol')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'fa20a9d4-1007-434e-9acf-e0ed6a1c9fce', 20, CAST(0x973D0B00 AS Date), CAST(0x07003F871F790000 AS Time), N'Delmar', N'Atun')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'35db5fd7-7df2-495d-9dba-e365206cc531', 20, CAST(0x993D0B00 AS Date), CAST(0x07006D5902870000 AS Time), N'Heineken', N'cervecilla')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'e3a42dbe-ebdf-496a-8627-e45e5b921814', 30, CAST(0x983D0B00 AS Date), CAST(0x0780FE2341580000 AS Time), N'ARCA', N'ciel')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'390d2cc4-bff6-42e1-9425-edaff43ea240', 15, CAST(0x993D0B00 AS Date), CAST(0x0700DAC2353C0000 AS Time), N'Suavel', N'Suavel')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'83599274-3ec3-4871-8abc-f33a7890d3a8', 20, CAST(0x983D0B00 AS Date), CAST(0x0780B6CCA6690000 AS Time), N'PYG', N'Mr.Limpio')
INSERT [dbo].[comprainventario] ([idpro], [cantidad], [fechaentrada], [hora], [proveedor], [nombre]) VALUES (N'fddbb4b5-5e01-489b-84f4-f9c1eaa3ab40', 25, CAST(0x983D0B00 AS Date), CAST(0x0780B6CCA6690000 AS Time), N'PYG', N'123')
INSERT [dbo].[empleado] ([idempleado], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [inicioen], [puesto], [sueldo]) VALUES (N'491ae775-5abf-4d5b-8a89-7ded7d495d5e', N'Luis', N'Rodriguez', N'Alanis', N'Avenida Universidad 413, La Joroba Fomerrey 91', CAST(0x44170B00 AS Date), N'masculino ', N'56484621', N'8745425615', CAST(0x44360B00 AS Date), N'cajero', 2500.0000)
INSERT [dbo].[empleado] ([idempleado], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [inicioen], [puesto], [sueldo]) VALUES (N'49ddabf1-d75e-4988-a1ce-a7b900f9bfb3', N'Rodolfo', N'Guzman', N'Huerta', N'Tulancingo, Hidalgo', CAST(0x2ECB0A00 AS Date), N'masculino ', N'89584696', N'8645205661', CAST(0x95380B00 AS Date), N'cajero', 2500.0000)
INSERT [dbo].[empleado] ([idempleado], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [inicioen], [puesto], [sueldo]) VALUES (N'06a2bdc4-b931-4f67-801f-be4c95217dfc', N'Francisco', N'Torres', N'Hernandez', N'California Raul salinas', CAST(0x68200B00 AS Date), N'masculino ', N'84531619', N'5236597951', CAST(0xE73B0B00 AS Date), N'cajero', 2500.0000)
INSERT [dbo].[empleado] ([idempleado], [nombre], [apellido_p], [apellido_m], [direccion], [fecha_naci], [sexo], [tel], [cel], [inicioen], [puesto], [sueldo]) VALUES (N'0f4510ec-a32c-4424-8f03-c7af44d4160d', N'Angela', N'Leos', N'Rodriguez', N'Mirador del valle quetzalcoatl#12', CAST(0x67200B00 AS Date), N'femenino  ', N'58538945', N'7854189765', CAST(0xF3340B00 AS Date), N'cajero', 2500.0000)
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'4b672dba-637f-4bde-a459-0a89d8a8abb3', 124, CAST(0x973D0B00 AS Date), CAST(0x0700011F414E0000 AS Time), N'Leche', N'Santa Clara')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'09a233f0-d1e1-4e6e-b1d2-11dc411f93eb', 60, CAST(0x983D0B00 AS Date), CAST(0x0700DBAC96590000 AS Time), N'Salchichas', N'FUD')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'332c2a83-d815-4e9b-a991-158ff8a5481f', 60, CAST(0x973D0B00 AS Date), CAST(0x0700DB8D8C5F0000 AS Time), N'vive_100', N'Quala')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'09d6db89-d98c-49bc-9e92-1b3041721fd0', 40, CAST(0x983D0B00 AS Date), CAST(0x07808FA088440000 AS Time), N'Alitas', N'Tyson')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'f5ec25f1-7599-4bcb-bec7-230a8bf9e5f4', 130, CAST(0x993D0B00 AS Date), CAST(0x07807EDC9F3E0000 AS Time), N'Jumex', N'Jumex Group')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'c4b27360-94fc-48df-9b39-44836b2e289d', 80, CAST(0x973D0B00 AS Date), CAST(0x078093CD68650000 AS Time), N'Galletas', N'Oreo')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'b20f4e9f-daac-49a7-8719-575e2af37afe', 60, CAST(0x973D0B00 AS Date), CAST(0x07802134624F0000 AS Time), N'Detergente', N'Ariel')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'11b457bd-0c48-40c2-94f9-6856a0fcc780', 35, CAST(0x9A3D0B00 AS Date), CAST(0x07009D2D5D640000 AS Time), N'Cereal', N'Choko krisp')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'3ecf557f-3b4b-4f6d-941a-84ae7e78cfd1', 30, CAST(0x973D0B00 AS Date), CAST(0x0700E82C44740000 AS Time), N'Cloro', N'Cloralex')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'67a46b9d-4de8-444f-959d-89fe10d64683', 50, CAST(0x983D0B00 AS Date), CAST(0x0700DBAC96590000 AS Time), N'Jamon', N'FUD')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'2d5b4a96-9ca2-46d0-8b27-94e9553a2d31', 35, CAST(0x983D0B00 AS Date), CAST(0x07808FA088440000 AS Time), N'Nuggets', N'Tyson')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'b50b1a17-016e-4dde-94d6-980cda210e43', 40, CAST(0x993D0B00 AS Date), CAST(0x078054E0F63A0000 AS Time), N'Tortillas', N'Tortillera Mtz')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'b4d621f6-47f3-44ab-847c-9a493a2a5d93', 45, CAST(0x973D0B00 AS Date), CAST(0x0780FE2341580000 AS Time), N'Powerade', N'ARCA')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'7ccb16d1-f837-434c-8a7a-a1677138824f', 40, CAST(0x983D0B00 AS Date), CAST(0x0700DE46BC730000 AS Time), N'Arroz', N'Arro')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'2309cad2-b826-4be3-9475-aa65fa25e5da', 38, CAST(0x983D0B00 AS Date), CAST(0x07808FA088440000 AS Time), N'Pollo', N'Tyson')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'0bc184cc-0ef8-45d3-a9fd-b3a46efdaa22', 95, CAST(0x973D0B00 AS Date), CAST(0x0780FE2341580000 AS Time), N'coca-cola', N'ARCA')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'bcd410f0-f2d6-450d-aabc-c9b9e1bf33d8', 40, CAST(0x993D0B00 AS Date), CAST(0x07000D2B3E5C0000 AS Time), N'aceite', N'Nutrioli')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'94ee709e-c4b1-435d-87bb-d1667783b4d9', 60, CAST(0x983D0B00 AS Date), CAST(0x0780009335750000 AS Time), N'pepsi', N'Pepsico')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'e4e49534-3436-43f4-a7b2-d85a202a26bd', 33, CAST(0x993D0B00 AS Date), CAST(0x07000DD497450000 AS Time), N'Frijol', N'Sierra')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'fa20a9d4-1007-434e-9acf-e0ed6a1c9fce', 42, CAST(0x973D0B00 AS Date), CAST(0x07003F871F790000 AS Time), N'Atun', N'Delmar')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'35db5fd7-7df2-495d-9dba-e365206cc531', 43, CAST(0x993D0B00 AS Date), CAST(0x07006D5902870000 AS Time), N'cervecilla', N'Heineken')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'e3a42dbe-ebdf-496a-8627-e45e5b921814', 60, CAST(0x983D0B00 AS Date), CAST(0x0780FE2341580000 AS Time), N'ciel', N'ARCA')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'390d2cc4-bff6-42e1-9425-edaff43ea240', 25, CAST(0x993D0B00 AS Date), CAST(0x0700DAC2353C0000 AS Time), N'Suavel', N'Suavel')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'83599274-3ec3-4871-8abc-f33a7890d3a8', 50, CAST(0x983D0B00 AS Date), CAST(0x0780B6CCA6690000 AS Time), N'Mr.Limpio', N'PYG')
INSERT [dbo].[inventario] ([idpro], [cantidad], [fechaentrada], [horaentrada], [nombre], [proveedor]) VALUES (N'fddbb4b5-5e01-489b-84f4-f9c1eaa3ab40', 35, CAST(0x983D0B00 AS Date), CAST(0x0780B6CCA6690000 AS Time), N'123', N'PYG')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'4b672dba-637f-4bde-a459-0a89d8a8abb3', N'Leche', 18.0000, N'De los campos a tu mesa 1L', N'bebidas', N'Santa Clara')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'09a233f0-d1e1-4e6e-b1d2-11dc411f93eb', N'Salchicas', 39.0000, N'550g de salchichas', N'carnes', N'FUD')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'332c2a83-d815-4e9b-a991-158ff8a5481f', N'vive_100', 10.0000, N'vive al 100 400ml', N'bebidas', N'Quala')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'09d6db89-d98c-49bc-9e92-1b3041721fd0', N'Alitas', 119.0000, N'1KG de alitas', N'carnes', N'Tyson')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'f5ec25f1-7599-4bcb-bec7-230a8bf9e5f4', N'Jumex', 16.0000, N'Variedad de sabores 1L', N'bebidas', N'Jumex Group')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'c4b27360-94fc-48df-9b39-44836b2e289d', N'Galletas', 9.0000, N'100g de oreo', N'alimento', N'Oreo')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'b20f4e9f-daac-49a7-8719-575e2af37afe', N'Detergente', 25.0000, N'800g de detergete en polvo', N'limpieza', N'Ariel')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'11b457bd-0c48-40c2-94f9-6856a0fcc780', N'Cereal', 35.0000, N'680g de cereal', N'alimento', N'Choko krisp')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'3ecf557f-3b4b-4f6d-941a-84ae7e78cfd1', N'Cloro', 20.0000, N'1L de cloro', N'limpieza', N'Cloralex')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'67a46b9d-4de8-444f-959d-89fe10d64683', N'Jamon', 29.0000, N'300g de jamon', N'carnes', N'FUD')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'2d5b4a96-9ca2-46d0-8b27-94e9553a2d31', N'Nuggets', 49.0000, N'500 g', N'carnes', N'Tyson')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'b50b1a17-016e-4dde-94d6-980cda210e43', N'Tortillas', 15.0000, N'1KG de tortillas', N'alimento', N'Tortilleria Mtz')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'b4d621f6-47f3-44ab-847c-9a493a2a5d93', N'Powerade', 22.0000, N'Bebida energizante 1L', N'bebidas', N'ARCA')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'7ccb16d1-f837-434c-8a7a-a1677138824f', N'Arroz', 12.0000, N'1KG de arroz', N'alimento', N'Arro')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'2309cad2-b826-4be3-9475-aa65fa25e5da', N'Pollo', 89.0000, N'1KG de pollo', N'carnes', N'Tyson')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'0bc184cc-0ef8-45d3-a9fd-b3a46efdaa22', N'coca-cola', 12.0000, N'Felicidad pura en 500 ml', N'bebidas', N'ARCA')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'bcd410f0-f2d6-450d-aabc-c9b9e1bf33d8', N'aceite', 14.0000, N'1L de aceite', N'alimento', N'Nutrioli')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'94ee709e-c4b1-435d-87bb-d1667783b4d9', N'pepsi', 12.0000, N'Latita de 500 ml', N'bebidas', N'Pepsico')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'e4e49534-3436-43f4-a7b2-d85a202a26bd', N'Frijol', 12.0000, N'1KG de frijol', N'alimento', N'Sierra')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'fa20a9d4-1007-434e-9acf-e0ed6a1c9fce', N'Atun', 13.0000, N'220g de atun', N'alimento', N'Delmar')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'35db5fd7-7df2-495d-9dba-e365206cc531', N'cervecilla', 119.0000, N'Six', N'bebidas', N'Heineken')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'e3a42dbe-ebdf-496a-8627-e45e5b921814', N'ciel', 10.0000, N'Agua purificada 1L', N'bebidas', N'ARCA')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'390d2cc4-bff6-42e1-9425-edaff43ea240', N'Suavel', 42.0000, N'6 rollos', N'limpieza', N'Suavel')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'83599274-3ec3-4871-8abc-f33a7890d3a8', N'Mr.Limpio', 29.0000, N'1L de limpieza', N'limpieza', N'PYG')
INSERT [dbo].[producto] ([idpro], [nombre], [precio], [descripcion], [tipo], [proveedor]) VALUES (N'fddbb4b5-5e01-489b-84f4-f9c1eaa3ab40', N'123', 31.0000, N'1L de 123', N'limpieza', N'PYG')
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'4b672dba-637f-4bde-a459-0a89d8a8abb3', N'Leche', CAST(0x9F3D0B00 AS Date), N'bebidas', 100, 18.0000, CAST(0x0780FA4C82BA0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'09a233f0-d1e1-4e6e-b1d2-11dc411f93eb', N'Salchichas', CAST(0x9E3D0B00 AS Date), N'carnes', 50, 39.0000, CAST(0x0780FCB00BBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'332c2a83-d815-4e9b-a991-158ff8a5481f', N'vive_100', CAST(0x9F3D0B00 AS Date), N'bebidas', 50, 10.0000, CAST(0x07809C7CCFB90000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'09d6db89-d98c-49bc-9e92-1b3041721fd0', N'Alitas', CAST(0x9E3D0B00 AS Date), N'carnes', 30, 119.0000, CAST(0x0780581D35BB0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'f5ec25f1-7599-4bcb-bec7-230a8bf9e5f4', N'Jumex', CAST(0x9F3D0B00 AS Date), N'bebidas', 120, 16.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'c4b27360-94fc-48df-9b39-44836b2e289d', N'Galletas', CAST(0x9E3D0B00 AS Date), N'alimento', 70, 9.0000, CAST(0x0780162224BE0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'b20f4e9f-daac-49a7-8719-575e2af37afe', N'Detergente', CAST(0x9F3D0B00 AS Date), N'limpieza', 50, 25.0000, CAST(0x07808CFF65BF0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'11b457bd-0c48-40c2-94f9-6856a0fcc780', N'Cereal', CAST(0x9E3D0B00 AS Date), N'alimento', 25, 35.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'3ecf557f-3b4b-4f6d-941a-84ae7e78cfd1', N'Cloro', CAST(0x9F3D0B00 AS Date), N'limpieza', 20, 20.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'67a46b9d-4de8-444f-959d-89fe10d64683', N'Jamon', CAST(0x9E3D0B00 AS Date), N'carnes', 40, 29.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'b50b1a17-016e-4dde-94d6-980cda210e43', N'Tortillas', CAST(0x9F3D0B00 AS Date), N'alimento', 30, 15.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'b4d621f6-47f3-44ab-847c-9a493a2a5d93', N'Powerade', CAST(0x9E3D0B00 AS Date), N'bebidas', 35, 22.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'7ccb16d1-f837-434c-8a7a-a1677138824f', N'Arroz', CAST(0x9F3D0B00 AS Date), N'alimento', 30, 12.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'2309cad2-b826-4be3-9475-aa65fa25e5da', N'Pollo', CAST(0x9E3D0B00 AS Date), N'carnes', 28, 89.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'0bc184cc-0ef8-45d3-a9fd-b3a46efdaa22', N'coca-cola', CAST(0x9F3D0B00 AS Date), N'bebidas', 85, 12.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'bcd410f0-f2d6-450d-aabc-c9b9e1bf33d8', N'aceite', CAST(0x9E3D0B00 AS Date), N'alimento', 30, 14.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'94ee709e-c4b1-435d-87bb-d1667783b4d9', N'pepsi', CAST(0x9F3D0B00 AS Date), N'bebidas', 50, 12.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'e4e49534-3436-43f4-a7b2-d85a202a26bd', N'frijol', CAST(0x9F3D0B00 AS Date), N'alimento', 23, 12.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'fa20a9d4-1007-434e-9acf-e0ed6a1c9fce', N'Atun', CAST(0x9E3D0B00 AS Date), N'alimento', 32, 13.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'35db5fd7-7df2-495d-9dba-e365206cc531', N'cervecilla', CAST(0x9F3D0B00 AS Date), N'bebidas', 33, 119.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'e3a42dbe-ebdf-496a-8627-e45e5b921814', N'ciel', CAST(0x9F3D0B00 AS Date), N'bebidas', 50, 10.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'390d2cc4-bff6-42e1-9425-edaff43ea240', N'Suavel', CAST(0x9F3D0B00 AS Date), N'limpieza', 15, 42.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'83599274-3ec3-4871-8abc-f33a7890d3a8', N'Mr.Limpio', CAST(0x9F3D0B00 AS Date), N'limpieza', 40, 29.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_inventario] ([idpro], [nombre], [fecha], [tipo], [cantidad], [precio], [hora]) VALUES (N'fddbb4b5-5e01-489b-84f4-f9c1eaa3ab40', N'123', CAST(0x9F3D0B00 AS Date), N'limpieza', 25, 31.0000, CAST(0x07805A81BEBC0000 AS Time))
INSERT [dbo].[repor_ventas] ([idempleado], [numdeventas], [productostotales], [moneygenerado], [dia], [hora], [horastrabaj]) VALUES (N'49ddabf1-d75e-4988-a1ce-a7b900f9bfb3', 3, 12, 209, CAST(0xA03D0B00 AS Date), CAST(0x0700E03495640000 AS Time), 3)
INSERT [dbo].[repor_ventas] ([idempleado], [numdeventas], [productostotales], [moneygenerado], [dia], [hora], [horastrabaj]) VALUES (N'491ae775-5abf-4d5b-8a89-7ded7d495d5e', 1, 4, 50, CAST(0xA03D0B00 AS Date), CAST(0x078076CD95640000 AS Time), 2)
INSERT [dbo].[tipodeventa] ([idventa], [tipo], [fechadeventa], [hora], [cantidad], [idpro]) VALUES (N'f6e75fc4-679a-415d-8380-52fa4727985a', N'Realizada', CAST(0x9F3D0B00 AS Date), CAST(0x07804307EAC20000 AS Time), 4, N'4b672dba-637f-4bde-a459-0a89d8a8abb3')
INSERT [dbo].[tipodeventa] ([idventa], [tipo], [fechadeventa], [hora], [cantidad], [idpro]) VALUES (N'd6cb8dc3-4d96-46fb-89d5-2fa98911a393', N'Realizada', CAST(0x9F3D0B00 AS Date), CAST(0x0700573F3FBB0000 AS Time), 5, N'332c2a83-d815-4e9b-a991-158ff8a5481f')
INSERT [dbo].[tipodeventa] ([idventa], [tipo], [fechadeventa], [hora], [cantidad], [idpro]) VALUES (NULL, N'Realizada', CAST(0x9B3D0B00 AS Date), CAST(0x07006F9BC5A20000 AS Time), 2, N'f5ec25f1-7599-4bcb-bec7-230a8bf9e5f4')
INSERT [dbo].[tipodeventa] ([idventa], [tipo], [fechadeventa], [hora], [cantidad], [idpro]) VALUES (NULL, N'Realizada', CAST(0x9B3D0B00 AS Date), CAST(0x07006F9BC5A20000 AS Time), 2, N'c4b27360-94fc-48df-9b39-44836b2e289d')
INSERT [dbo].[tipodeventa] ([idventa], [tipo], [fechadeventa], [hora], [cantidad], [idpro]) VALUES (N'c7d36fcf-5690-4d2c-aeb7-59c450b3ad32', N'Realizada', CAST(0x9F3D0B00 AS Date), CAST(0x0700CF800ABE0000 AS Time), 3, N'67a46b9d-4de8-444f-959d-89fe10d64683')
INSERT [dbo].[venta] ([idventa], [fecha], [hora], [cantidad], [total], [idcliente], [idempleado]) VALUES (N'd6cb8dc3-4d96-46fb-89d5-2fa98911a393', CAST(0x9F3D0B00 AS Date), CAST(0x0700573F3FBB0000 AS Time), 5, 50.0000, N'1959a055-0883-41e3-b5d9-1d6d3affb34d', N'49ddabf1-d75e-4988-a1ce-a7b900f9bfb3')
INSERT [dbo].[venta] ([idventa], [fecha], [hora], [cantidad], [total], [idcliente], [idempleado]) VALUES (N'f6e75fc4-679a-415d-8380-52fa4727985a', CAST(0x9F3D0B00 AS Date), CAST(0x07804307EAC20000 AS Time), 4, 72.0000, N'c17580e1-4871-4edb-86f0-b2fe28a37eef', N'49ddabf1-d75e-4988-a1ce-a7b900f9bfb3')
INSERT [dbo].[venta] ([idventa], [fecha], [hora], [cantidad], [total], [idcliente], [idempleado]) VALUES (N'c7d36fcf-5690-4d2c-aeb7-59c450b3ad32', CAST(0x9F3D0B00 AS Date), CAST(0x0700CF800ABE0000 AS Time), 3, 87.0000, N'3ca8c527-d468-4526-a4b4-a6a09e0b7cfc', N'49ddabf1-d75e-4988-a1ce-a7b900f9bfb3')
INSERT [dbo].[venta] ([idventa], [fecha], [hora], [cantidad], [total], [idcliente], [idempleado]) VALUES (N'c3feb041-36d9-4854-815d-8562304cb1c1', CAST(0x9B3D0B00 AS Date), CAST(0x07006F9BC5A20000 AS Time), 2, 18.0000, N'1959a055-0883-41e3-b5d9-1d6d3affb34d', N'491ae775-5abf-4d5b-8a89-7ded7d495d5e')
INSERT [dbo].[venta] ([idventa], [fecha], [hora], [cantidad], [total], [idcliente], [idempleado]) VALUES (N'6a09c6f2-8f01-4cdd-98bb-b0d7fa0b91a0', CAST(0x9B3D0B00 AS Date), CAST(0x07006F9BC5A20000 AS Time), 2, 32.0000, N'1959a055-0883-41e3-b5d9-1d6d3affb34d', N'491ae775-5abf-4d5b-8a89-7ded7d495d5e')
ALTER TABLE [dbo].[comprainventario]  WITH CHECK ADD  CONSTRAINT [FK_comprainventario_producto] FOREIGN KEY([idpro])
REFERENCES [dbo].[producto] ([idpro])
GO
ALTER TABLE [dbo].[comprainventario] CHECK CONSTRAINT [FK_comprainventario_producto]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_comprainventario1] FOREIGN KEY([idpro])
REFERENCES [dbo].[comprainventario] ([idpro])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [FK_inventario_comprainventario1]
GO
ALTER TABLE [dbo].[repor_inventario]  WITH CHECK ADD  CONSTRAINT [FK_repor_inventario_inventario1] FOREIGN KEY([idpro])
REFERENCES [dbo].[inventario] ([idpro])
GO
ALTER TABLE [dbo].[repor_inventario] CHECK CONSTRAINT [FK_repor_inventario_inventario1]
GO
ALTER TABLE [dbo].[repor_ventas]  WITH CHECK ADD  CONSTRAINT [FK_repor_ventas_empleado] FOREIGN KEY([idempleado])
REFERENCES [dbo].[empleado] ([idempleado])
GO
ALTER TABLE [dbo].[repor_ventas] CHECK CONSTRAINT [FK_repor_ventas_empleado]
GO
ALTER TABLE [dbo].[tipodeventa]  WITH CHECK ADD  CONSTRAINT [FK_tipodeventa_inventario] FOREIGN KEY([idpro])
REFERENCES [dbo].[inventario] ([idpro])
GO
ALTER TABLE [dbo].[tipodeventa] CHECK CONSTRAINT [FK_tipodeventa_inventario]
GO
ALTER TABLE [dbo].[tipodeventa]  WITH CHECK ADD  CONSTRAINT [FK_tipodeventa_venta] FOREIGN KEY([idventa])
REFERENCES [dbo].[venta] ([idventa])
GO
ALTER TABLE [dbo].[tipodeventa] CHECK CONSTRAINT [FK_tipodeventa_venta]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[cliente] ([idcliente])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_empleado1] FOREIGN KEY([idempleado])
REFERENCES [dbo].[empleado] ([idempleado])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_empleado1]
GO
/****** Object:  Trigger [dbo].[actualizacion]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[actualizacion]
on [dbo].[comprainventario] 
after update
as
begin
update inventario
set cantidad = inventario.cantidad + inserted.cantidad from inserted
---/
where inventario.idpro = inserted.idpro
end
GO
/****** Object:  Trigger [dbo].[adiosproducto]    Script Date: 13/12/2017 19:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[adiosproducto]
on [dbo].[tipodeventa]
after update
as
begin
update inventario
set cantidad = inventario.cantidad - inserted.cantidad from inserted
---/
where inventario.idpro = inserted.idpro
end

GO
USE [master]
GO
ALTER DATABASE [mitienditadeabarrotes] SET  READ_WRITE 
GO
 
