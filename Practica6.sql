USE [master]
GO
/****** Object:  Database [minisuper]    Script Date: 04/11/2017 12:14:22 a.m. ******/
CREATE DATABASE [minisuper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'minisuper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\minisuper.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'minisuper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\minisuper_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [minisuper] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [minisuper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [minisuper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [minisuper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [minisuper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [minisuper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [minisuper] SET ARITHABORT OFF 
GO
ALTER DATABASE [minisuper] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [minisuper] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [minisuper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [minisuper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [minisuper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [minisuper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [minisuper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [minisuper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [minisuper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [minisuper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [minisuper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [minisuper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [minisuper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [minisuper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [minisuper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [minisuper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [minisuper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [minisuper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [minisuper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [minisuper] SET  MULTI_USER 
GO
ALTER DATABASE [minisuper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [minisuper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [minisuper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [minisuper] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [minisuper]
GO
/****** Object:  Table [dbo].[cajero]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cajero](
	[idCajero] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NULL,
	[celular] [varchar](20) NOT NULL,
	[sexo] [char](10) NOT NULL,
	[fechaNac] [date] NOT NULL,
 CONSTRAINT [PK_cajero] PRIMARY KEY CLUSTERED 
(
	[idCajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[d_orden_c]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[d_orden_c](
	[idProducto] [uniqueidentifier] NOT NULL,
	[orden_c] [varchar](100) NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[total] [money] NOT NULL,
	[idProveedor] [uniqueidentifier] NOT NULL,
	[Folio] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_d_orden_c] PRIMARY KEY CLUSTERED 
(
	[Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_of]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_of](
	[idOferta] [uniqueidentifier] NOT NULL,
	[idProducto] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_detalle_of] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_v]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_v](
	[idProducto] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[total] [money] NOT NULL,
	[cambio] [money] NOT NULL,
	[folio] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_detalle_v] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inventario]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario](
	[idProducto] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_inventario] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_e]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_e](
	[idProducto] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_s]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_s](
	[idProducto] [uniqueidentifier] NOT NULL,
	[cantidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oferta]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oferta](
	[idOferta] [uniqueidentifier] NOT NULL,
	[fecha_in] [date] NOT NULL,
	[fecha_fi] [date] NOT NULL,
 CONSTRAINT [PK_oferta] PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden_c]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_c](
	[idProveedor] [uniqueidentifier] NOT NULL,
	[fecha_c] [date] NOT NULL,
 CONSTRAINT [PK_orden_c] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pagos]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pagos](
	[idPagos] [uniqueidentifier] NOT NULL,
	[folio] [uniqueidentifier] NOT NULL,
	[monto_de_P] [money] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[tipo_de_P] [varchar](20) NULL,
 CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED 
(
	[idPagos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[producto]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[producto](
	[idProducto] [uniqueidentifier] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[nombre] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
	[idProveedor] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proveedor](
	[idProveedor] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NULL,
	[celular] [varchar](20) NOT NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[folio] [uniqueidentifier] NOT NULL,
	[monto] [money] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[producto_cant] [int] NOT NULL,
	[idCajero] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ventas] PRIMARY KEY CLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[DetalleDeV]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [dbo].[DetalleDeV] as
select v.*, c.nombre as nombre , c.apellidos as apellidos
from Ventas v
join Cajero as c on c.idCajero = v.idCajero

GO
/****** Object:  View [dbo].[InvenTo]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[InvenTo] as
select i.*, p.nombre as NombreProducto, p.precio as PrecioProducto
from inventario i
join producto as p on p.idProducto = i.idProducto

GO
/****** Object:  View [dbo].[PagoVen]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PagoVen] as
select v.*, p.tipo_de_P as Tipo_de_Pago
from ventas v
join pagos as p on v.folio = p.folio
GO
/****** Object:  View [dbo].[ProdPro]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProdPro] as 
select p.*,pr.nombre as Nombre_Proveedor
from producto p
join proveedor as pr on pr.idProveedor = p.idProveedor
GO
/****** Object:  View [dbo].[SumInvent]    Script Date: 04/11/2017 12:14:22 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[SumInvent] as 
select p.idProducto, p.nombre as NombreProducto, i.cantidad , sum(p.precio*cantidad) as Total_Por_Producto
from inventario i 
join producto as p on p.idProducto = i.idProducto
group by p.idProducto, p.nombre, i.cantidad


GO
INSERT [dbo].[cajero] ([idCajero], [nombre], [apellidos], [telefono], [celular], [sexo], [fechaNac]) VALUES (N'27a70b55-c2ac-44cd-a07b-4fd855fabae8', N'Carolina', N'Castillo', N'81264785', N'8123908252', N'F         ', CAST(0xE0240B00 AS Date))
GO
INSERT [dbo].[cajero] ([idCajero], [nombre], [apellidos], [telefono], [celular], [sexo], [fechaNac]) VALUES (N'2fecc078-84da-4d26-98d9-93d44e1fa0e6', N'Aracely', N'Valadez', N'81828236', N'8120212067', N'F         ', CAST(0xB0210B00 AS Date))
GO
INSERT [dbo].[cajero] ([idCajero], [nombre], [apellidos], [telefono], [celular], [sexo], [fechaNac]) VALUES (N'f709ed62-cecd-4229-948f-acc54b677685', N'Sergio', N'Palma', N'87878787', N'811031548', N'M         ', CAST(0x03220B00 AS Date))
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'd6079e46-16a2-453f-9850-161f734bd98a', 600)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'bd55981e-04e6-4401-9bf2-467c1f0f961e', 20)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'ac5db049-7d8c-4424-9ce6-4aa71155b526', 1000)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'506842f5-aebb-4d1d-999f-58b32aed692e', 1000)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'e9ce2172-5985-4ed6-bdc4-5af9ae2b8e9f', 1)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'356ebdae-0df8-477d-b920-62813a2cda41', 2000)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'677ab60d-66fa-4952-bd85-7fee770d3999', 1500)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'45fc65cb-8b98-4f9b-96d7-bed4f1752b63', 2000)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'c5977e50-01db-4d75-af2f-c8127b5e6e6e', 100)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'3eed0473-39d3-4060-9fcb-c93a9aecc433', 500)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'6b9d1164-d6bd-47d0-870a-e3ba07942c83', 40000)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'f1e97120-e52e-4ba5-942a-ea8178f5a40b', 100)
GO
INSERT [dbo].[inventario] ([idProducto], [cantidad]) VALUES (N'4c97f9a6-ee41-4765-85e3-fcb79ae05666', 20)
GO
INSERT [dbo].[oferta] ([idOferta], [fecha_in], [fecha_fi]) VALUES (N'fdd41c61-d732-4d38-9ca3-041e60afd481', CAST(0x3C3D0B00 AS Date), CAST(0x4F3D0B00 AS Date))
GO
INSERT [dbo].[oferta] ([idOferta], [fecha_in], [fecha_fi]) VALUES (N'7531483c-fde7-4a3f-a89e-667c79d45749', CAST(0x783D0B00 AS Date), CAST(0x7B3D0B00 AS Date))
GO
INSERT [dbo].[oferta] ([idOferta], [fecha_in], [fecha_fi]) VALUES (N'6347c4fc-540f-4e9c-9818-d1717db4b49c', CAST(0x5A3D0B00 AS Date), CAST(0x6D3D0B00 AS Date))
GO
INSERT [dbo].[pagos] ([idPagos], [folio], [monto_de_P], [fecha], [hora], [tipo_de_P]) VALUES (N'58406af0-bf0f-439e-bc75-a5a1dc8e642c', N'21e7e035-236f-4be4-96af-66e35b541e2c', 154.0000, CAST(0x673D0B00 AS Date), CAST(0x0700FBFA53790000 AS Time), N'Efectivo')
GO
INSERT [dbo].[pagos] ([idPagos], [folio], [monto_de_P], [fecha], [hora], [tipo_de_P]) VALUES (N'514a3690-c11b-446a-a647-b2beee091e2e', N'17592d02-ab3b-4727-bb9b-077f02428264', 49.0000, CAST(0x673D0B00 AS Date), CAST(0x07800F9932770000 AS Time), N'Efectivo')
GO
INSERT [dbo].[pagos] ([idPagos], [folio], [monto_de_P], [fecha], [hora], [tipo_de_P]) VALUES (N'08acde90-ff82-4b7d-821d-ed867921a930', N'0c7ea0c9-67bc-42fc-846b-35d112530d11', 74.0000, CAST(0x673D0B00 AS Date), CAST(0x070018CEF5780000 AS Time), N'Efectivo')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'd6079e46-16a2-453f-9850-161f734bd98a', N'Cereal', N'Zucaritas', 49.0000, N'd6079e46-16a2-453f-9850-161f734bd98a')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'bd55981e-04e6-4401-9bf2-467c1f0f961e', N'Play4Ueeee', N'PS4', 6999.0000, N'1877c7ba-8733-4079-9f1a-7394b6db6fef')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'ac5db049-7d8c-4424-9ce6-4aa71155b526', N'Carne de res', N'Tyson', 80.0000, N'08b2c51b-547f-4890-a279-38504f416d4a')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'506842f5-aebb-4d1d-999f-58b32aed692e', N'Pollito', N'Tyson', 119.0000, N'08b2c51b-547f-4890-a279-38504f416d4a')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'e9ce2172-5985-4ed6-bdc4-5af9ae2b8e9f', N'Antimateria', N'Anti-materia', 10999.0000, N'c2fa47c7-f427-453a-8b43-20e0b3f48930')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'356ebdae-0df8-477d-b920-62813a2cda41', N'Galletas ricas', N'Chokis', 80.0000, N'3ded6593-ee04-4cac-86fa-eb8c9b5bfc12')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'677ab60d-66fa-4952-bd85-7fee770d3999', N'yYodeNintendo', N'PoselWII', 2999.0000, N'496ee33b-846e-4304-9d2e-14a591c5efb9')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'45fc65cb-8b98-4f9b-96d7-bed4f1752b63', N'Agua embotellada', N'Ciel', 10.0000, N'1fc0e252-fd0c-4bc7-8bd7-15cb7ff1fbc9')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'c5977e50-01db-4d75-af2f-c8127b5e6e6e', N'Fud', N'Jamon', 39.0000, N'01d6f861-0b2d-472f-a4c3-ca6df996c740')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'3eed0473-39d3-4060-9fcb-c93a9aecc433', N'Fud', N'Pizza', 59.0000, N'01d6f861-0b2d-472f-a4c3-ca6df996c740')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'6b9d1164-d6bd-47d0-870a-e3ba07942c83', N'Jugo de naranja', N'Valle', 19.0000, N'558993dd-3d17-4603-8016-14410b758340')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'f1e97120-e52e-4ba5-942a-ea8178f5a40b', N'Almendras', N'Campo', 229.0000, N'41fce739-1cf7-4ee8-823e-f927642e06a3')
GO
INSERT [dbo].[producto] ([idProducto], [descripcion], [nombre], [precio], [idProveedor]) VALUES (N'4c97f9a6-ee41-4765-85e3-fcb79ae05666', N'SoyDeMicrosoftUEEE', N'XBOXONE', 5999.0000, N'92ee5654-9bd4-48af-b9fe-1768d734e7dd')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'558993dd-3d17-4603-8016-14410b758340', N'DelValle', N'Col:JuguitosNarajas #8169', N'811243', N'8115171928')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'496ee33b-846e-4304-9d2e-14a591c5efb9', N'Nintendo', N'Syllicon Valley #423', N'871147860', N'8115472915')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'1fc0e252-fd0c-4bc7-8bd7-15cb7ff1fbc9', N'Agua purificada Ciel', N'Col: Almaguer Beltrán #332', N'81250468', N'810541920612')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'92ee5654-9bd4-48af-b9fe-1768d734e7dd', N'Microsoft', N'SylliconValey #444', N'8117165', N'81151472035')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'c2fa47c7-f427-453a-8b43-20e0b3f48930', N'Antimat', N'Col: ningunlugar #4234', N'8115452', N'8115181813')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'08b2c51b-547f-4890-a279-38504f416d4a', N'Carnes Tyson', N'Col: Pedro del alba #928', N'81687459', N'811526482106')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'9539ad9e-296e-4faa-be14-6cffb67c0d00', N'Cerealera Mexicana', N'Col: Pedro Livas, #4343', N'8138134', N'846843183173')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'1877c7ba-8733-4079-9f1a-7394b6db6fef', N'SONY', N'sonydelalbra #4342', N'81381384', N'811251806')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'01d6f861-0b2d-472f-a4c3-ca6df996c740', N'FUD', N'Col: la alegriacarnes #425', N'81147526', N'8115472896')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'3ded6593-ee04-4cac-86fa-eb8c9b5bfc12', N'Gamesa', N'Col: GalleteraGalatea #384', N'8115084', N'8115472915')
GO
INSERT [dbo].[proveedor] ([idProveedor], [nombre], [direccion], [telefono], [celular]) VALUES (N'41fce739-1cf7-4ee8-823e-f927642e06a3', N'CampodelAncho', N'Col:AirePuro #120', N'81156952', N'8115472589')
GO
INSERT [dbo].[ventas] ([folio], [monto], [fecha], [hora], [producto_cant], [idCajero]) VALUES (N'17592d02-ab3b-4727-bb9b-077f02428264', 49.0000, CAST(0x673D0B00 AS Date), CAST(0x07800F9932770000 AS Time), 1, N'2fecc078-84da-4d26-98d9-93d44e1fa0e6')
GO
INSERT [dbo].[ventas] ([folio], [monto], [fecha], [hora], [producto_cant], [idCajero]) VALUES (N'0c7ea0c9-67bc-42fc-846b-35d112530d11', 74.0000, CAST(0x673D0B00 AS Date), CAST(0x070018CEF5780000 AS Time), 3, N'2fecc078-84da-4d26-98d9-93d44e1fa0e6')
GO
INSERT [dbo].[ventas] ([folio], [monto], [fecha], [hora], [producto_cant], [idCajero]) VALUES (N'21e7e035-236f-4be4-96af-66e35b541e2c', 154.0000, CAST(0x673D0B00 AS Date), CAST(0x0700FBFA53790000 AS Time), 4, N'27a70b55-c2ac-44cd-a07b-4fd855fabae8')
GO
ALTER TABLE [dbo].[d_orden_c]  WITH CHECK ADD  CONSTRAINT [FK_d_orden_c_orden_c] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[orden_c] ([idProveedor])
GO
ALTER TABLE [dbo].[d_orden_c] CHECK CONSTRAINT [FK_d_orden_c_orden_c]
GO
ALTER TABLE [dbo].[d_orden_c]  WITH CHECK ADD  CONSTRAINT [FK_d_orden_c_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[d_orden_c] CHECK CONSTRAINT [FK_d_orden_c_producto]
GO
ALTER TABLE [dbo].[d_orden_c]  WITH CHECK ADD  CONSTRAINT [FK_d_orden_c_proveedor] FOREIGN KEY([idProducto])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[d_orden_c] CHECK CONSTRAINT [FK_d_orden_c_proveedor]
GO
ALTER TABLE [dbo].[detalle_of]  WITH CHECK ADD  CONSTRAINT [FK_detalle_of_oferta] FOREIGN KEY([idOferta])
REFERENCES [dbo].[oferta] ([idOferta])
GO
ALTER TABLE [dbo].[detalle_of] CHECK CONSTRAINT [FK_detalle_of_oferta]
GO
ALTER TABLE [dbo].[detalle_of]  WITH CHECK ADD  CONSTRAINT [FK_detalle_of_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalle_of] CHECK CONSTRAINT [FK_detalle_of_producto]
GO
ALTER TABLE [dbo].[detalle_v]  WITH CHECK ADD  CONSTRAINT [FK_detalle_v_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[detalle_v] CHECK CONSTRAINT [FK_detalle_v_producto]
GO
ALTER TABLE [dbo].[detalle_v]  WITH CHECK ADD  CONSTRAINT [FK_detalle_v_ventas] FOREIGN KEY([folio])
REFERENCES [dbo].[ventas] ([folio])
GO
ALTER TABLE [dbo].[detalle_v] CHECK CONSTRAINT [FK_detalle_v_ventas]
GO
ALTER TABLE [dbo].[inventario]  WITH CHECK ADD  CONSTRAINT [FK_inventario_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[producto] ([idProducto])
GO
ALTER TABLE [dbo].[inventario] CHECK CONSTRAINT [FK_inventario_producto]
GO
ALTER TABLE [dbo].[movimiento_e]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_e_inventario] FOREIGN KEY([idProducto])
REFERENCES [dbo].[inventario] ([idProducto])
GO
ALTER TABLE [dbo].[movimiento_e] CHECK CONSTRAINT [FK_movimiento_e_inventario]
GO
ALTER TABLE [dbo].[movimiento_s]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_s_detalle_v] FOREIGN KEY([idProducto])
REFERENCES [dbo].[detalle_v] ([idProducto])
GO
ALTER TABLE [dbo].[movimiento_s] CHECK CONSTRAINT [FK_movimiento_s_detalle_v]
GO
ALTER TABLE [dbo].[movimiento_s]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_s_inventario] FOREIGN KEY([idProducto])
REFERENCES [dbo].[inventario] ([idProducto])
GO
ALTER TABLE [dbo].[movimiento_s] CHECK CONSTRAINT [FK_movimiento_s_inventario]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_ventas] FOREIGN KEY([folio])
REFERENCES [dbo].[ventas] ([folio])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [FK_pagos_ventas]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [FK_ventas_cajero] FOREIGN KEY([idCajero])
REFERENCES [dbo].[cajero] ([idCajero])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [FK_ventas_cajero]
GO
USE [master]
GO
ALTER DATABASE [minisuper] SET  READ_WRITE 
GO
