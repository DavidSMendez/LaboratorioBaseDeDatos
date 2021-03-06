USE [Practica 2]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/09/2017 0:05:37 ******/
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
	[nombrecompleto]  AS ([nombre]+[apellidos])
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 17/09/2017 0:05:37 ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/09/2017 0:05:37 ******/
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
	[sexo] [bit] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/09/2017 0:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idproducto] [uniqueidentifier] NOT NULL,
	[precio] [float] NOT NULL,
	[cantidad] [bit] NOT NULL,
	[descripcion] [text] NOT NULL,
	[dinerogenerado]  AS ([precio]*[cantidad]),
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idproducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provedores]    Script Date: 17/09/2017 0:05:37 ******/
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
/****** Object:  Table [dbo].[Sucursal]    Script Date: 17/09/2017 0:05:37 ******/
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
/****** Object:  Table [dbo].[Sueldo]    Script Date: 17/09/2017 0:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sueldo](
	[idsueldo] [uniqueidentifier] NOT NULL,
	[FechaDePago] [date] NOT NULL,
	[moneda] [money] NOT NULL,
	[horastrabajadas] [float] NOT NULL,
	[pagapordia] [float] NOT NULL,
	[sueldo]  AS ([pagapordia]*[horastrabajadas]),
 CONSTRAINT [PK_Sueldo] PRIMARY KEY CLUSTERED 
(
	[idsueldo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [PK_Cliente]    Script Date: 17/09/2017 0:05:37 ******/
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [PK_Cliente] PRIMARY KEY NONCLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
