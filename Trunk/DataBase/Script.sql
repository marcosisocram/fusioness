USE [master]
GO
/****** Object:  Database [db0542e5f1e2ef4c29a2eaa22b00261fce]    Script Date: 29/10/2013 08:17:52 ******/
CREATE DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] ON  PRIMARY 
( NAME = N'db0542e5f1e2ef4c29a2eaa22b00261fce', FILENAME = N'D:\mssqldata\db0542e5f1e2ef4c29a2eaa22b00261fce.mdf' , SIZE = 2304KB , MAXSIZE = 20480KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db0542e5f1e2ef4c29a2eaa22b00261fce_log', FILENAME = N'E:\mssqllog\db0542e5f1e2ef4c29a2eaa22b00261fce_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db0542e5f1e2ef4c29a2eaa22b00261fce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET ARITHABORT OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET  MULTI_USER 
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET DB_CHAINING OFF 
GO
USE [db0542e5f1e2ef4c29a2eaa22b00261fce]
GO
/****** Object:  Table [dbo].[Bicicleta]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bicicleta](
	[IdBicicleta] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[UrlImagem] [varchar](2455) NULL,
 CONSTRAINT [PK_Bicicleta] PRIMARY KEY CLUSTERED 
(
	[IdBicicleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComentarioEvento]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ComentarioEvento](
	[IdComentarioEvento] [int] IDENTITY(1,1) NOT NULL,
	[IdEvento] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
	[Data] [datetime] NOT NULL,
 CONSTRAINT [PK_StatusEvento] PRIMARY KEY CLUSTERED 
(
	[IdComentarioEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contato]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contato](
	[IdUsuario] [int] NOT NULL,
	[IdContato] [int] NOT NULL,
 CONSTRAINT [PK_Contato] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdContato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConviteEvento]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConviteEvento](
	[IdUsuario] [int] NOT NULL,
	[IdContato] [int] NOT NULL,
	[IdEvento] [int] NOT NULL,
	[IdResposta] [int] NULL,
 CONSTRAINT [PK_ConviteEvento] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdContato] ASC,
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coordenada]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coordenada](
	[IdCoordenada] [int] IDENTITY(1,1) NOT NULL,
	[IdRota] [int] NOT NULL,
	[IdTipoCoordenada] [int] NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Data] [datetime] NULL,
 CONSTRAINT [PK_Coordenada] PRIMARY KEY CLUSTERED 
(
	[IdCoordenada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dificuldade]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dificuldade](
	[IdDificuldade] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificuldade] PRIMARY KEY CLUSTERED 
(
	[IdDificuldade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evento](
	[IdEvento] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdRota] [int] NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Descricao] [text] NOT NULL,
	[Data] [datetime] NOT NULL,
	[UrlImagem] [varchar](2000) NULL,
	[Publico] [bit] NOT NULL,
 CONSTRAINT [PK_Evento] PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventoUsuario]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoUsuario](
	[IdUsuario] [int] NOT NULL,
	[IdEvento] [int] NOT NULL,
 CONSTRAINT [PK_EventoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QualidadeRota]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QualidadeRota](
	[IdQualidadeRota] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QualidadeRota] PRIMARY KEY CLUSTERED 
(
	[IdQualidadeRota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Resposta]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resposta](
	[IdResposta] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Resposta] PRIMARY KEY CLUSTERED 
(
	[IdResposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rota]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rota](
	[IdRota] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdTipoPista] [int] NULL,
	[IdTipoRota] [int] NOT NULL,
	[IdDificuldade] [int] NULL,
	[IdQualidadeRota] [int] NULL,
	[Descricao] [varchar](50) NULL,
	[IdRotaOrigem] [int] NULL,
 CONSTRAINT [PK_Rota] PRIMARY KEY CLUSTERED 
(
	[IdRota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCoordenada]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCoordenada](
	[IdTipoCoordenada] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
 CONSTRAINT [PK_TipoCoordenada] PRIMARY KEY CLUSTERED 
(
	[IdTipoCoordenada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPista]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPista](
	[IdTipoPista] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoPista] PRIMARY KEY CLUSTERED 
(
	[IdTipoPista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoRota]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoRota](
	[IdTipoRota] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](200) NOT NULL,
 CONSTRAINT [PK_TipoRota] PRIMARY KEY CLUSTERED 
(
	[IdTipoRota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/10/2013 08:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](250) NOT NULL,
	[Login] [varchar](100) NOT NULL,
	[Senha] [varchar](16) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Sexo] [char](1) NULL,
	[UrlImagem] [varchar](2455) NULL,
	[DataDeNascimento] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bicicleta] ON 

GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (1, 3, N'Sprint 10', N'Caloi', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (3, 3, N'Caloi', N'Sprint 20', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (6, 3, N'teste', N'teste 01', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (13, 21, N'caloy', N'zzzz', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (14, 21, N'linux', N'debian', N'tmp9B84.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (15, 21, N'linux', N'slackware', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (16, 21, N'windows8', N'microsoft', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (18, 21, N'4.1', N'openbsd', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (19, 21, N'4.2', N'openbsd', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (20, 21, N'9.2', N'freebsd', N'bike.jpg')
GO
INSERT [dbo].[Bicicleta] ([IdBicicleta], [IdUsuario], [Modelo], [Marca], [UrlImagem]) VALUES (32, 37, N'que voa muito', N'caloi', N'bike.jpg')
GO
SET IDENTITY_INSERT [dbo].[Bicicleta] OFF
GO
SET IDENTITY_INSERT [dbo].[ComentarioEvento] ON 

GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (4, 1, 4, N'Comentário do Usuário 2', CAST(0x0000A260004FA6A0 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (7, 5, 26, N'Comentário para teste', CAST(0x0000A26000AE2220 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (13, 5, 31, N'Novo Comentário para testar a quebra de linha', CAST(0x0000A26000AE2220 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (16, 5, 3, N'Comentário para teste', CAST(0x0000A26000AE2220 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (17, 5, 21, N'Novo Comentário para testar a quebra de linha', CAST(0x0000A26000AE2220 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (18, 1, 3, N'Um comentário qualquer.', CAST(0x0000A261014D2096 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (20, 5, 26, N'teste de comentário, pelo Windows Phone.', CAST(0x0000A262015FE312 AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (21, 5, 26, N'novo comentário', CAST(0x0000A262016DABEA AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (22, 5, 26, N'massa', CAST(0x0000A263013519AF AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (23, 6, 26, N'comentarios de teste', CAST(0x0000A2640023369C AS DateTime))
GO
INSERT [dbo].[ComentarioEvento] ([IdComentarioEvento], [IdEvento], [IdUsuario], [Descricao], [Data]) VALUES (24, 1, 3, N'teste', CAST(0x0000A265015E15B2 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ComentarioEvento] OFF
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (3, 4)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (3, 26)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (4, 3)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (21, 26)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (21, 37)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (26, 3)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (26, 4)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (26, 21)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (26, 22)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (26, 27)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (26, 31)
GO
INSERT [dbo].[Contato] ([IdUsuario], [IdContato]) VALUES (37, 21)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (3, 4, 1, 1)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (3, 4, 6, NULL)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (26, 3, 5, NULL)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (26, 4, 5, 2)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (26, 21, 5, NULL)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (26, 31, 5, NULL)
GO
INSERT [dbo].[ConviteEvento] ([IdUsuario], [IdContato], [IdEvento], [IdResposta]) VALUES (37, 21, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Coordenada] ON 

GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1, 3, 1, 51.4791, 0, CAST(0x0000A25200000000 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (11, 11, NULL, -8.12499713897705, -34.915031433105469, CAST(0x0000A259000FFD9D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (12, 11, NULL, -8.1284217834472656, -34.915683746337891, CAST(0x0000A259001006F9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (13, 11, NULL, -8.1320476531982422, -34.916378021240234, CAST(0x0000A25900100A74 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (14, 12, NULL, -8.14025075, -34.93452652, CAST(0x0000A25900C1E2B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (15, 12, NULL, -8.14022072, -34.93457593, CAST(0x0000A25900C1E5F4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (16, 12, NULL, -8.1403568, -34.93440498, CAST(0x0000A25900C1EECA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (17, 12, NULL, -8.14050031, -34.93427426, CAST(0x0000A25900C1F24D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (18, 12, NULL, -8.14068995, -34.93411378, CAST(0x0000A25900C1F5D2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (19, 12, NULL, -8.14089536, -34.93393781, CAST(0x0000A25900C1F954 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (20, 12, NULL, -8.14103205, -34.93381345, CAST(0x0000A25900C1FBAE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (21, 12, NULL, -8.14121565, -34.93363261, CAST(0x0000A25900C1FF30 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (22, 12, NULL, -8.14131064, -34.93341271, CAST(0x0000A25900C202BB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (23, 12, NULL, -8.14130554, -34.93316914, CAST(0x0000A25900C20639 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (24, 12, NULL, -8.14128584, -34.93298123, CAST(0x0000A25900C209BE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (25, 12, NULL, -8.14124312, -34.93277497, CAST(0x0000A25900C21C7D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (26, 12, NULL, -8.14119242, -34.93254527, CAST(0x0000A25900C2212D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (27, 12, NULL, -8.14115841, -34.93232958, CAST(0x0000A25900C224AD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (28, 12, NULL, -8.14113627, -34.93206293, CAST(0x0000A25900C22835 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (29, 12, NULL, -8.14109763, -34.93187852, CAST(0x0000A25900C22A98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (30, 12, NULL, -8.14105805, -34.9316835, CAST(0x0000A25900C22CF5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (31, 12, NULL, -8.14103656, -34.93147509, CAST(0x0000A25900C22F48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (32, 12, NULL, -8.14101921, -34.93126002, CAST(0x0000A25900C23194 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (33, 12, NULL, -8.14098966, -34.93105629, CAST(0x0000A25900C233EE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (34, 12, NULL, -8.1409635, -34.93086174, CAST(0x0000A25900C2364A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (35, 12, NULL, -8.14093452, -34.93060018, CAST(0x0000A25900C239CA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (36, 12, NULL, -8.14090086, -34.93034806, CAST(0x0000A25900C23D4A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (37, 12, NULL, -8.14087282, -34.93011949, CAST(0x0000A25900C240CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (38, 12, NULL, -8.14084659, -34.9299109, CAST(0x0000A25900C24EE4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (39, 12, NULL, -8.14081396, -34.92968459, CAST(0x0000A25900C25390 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (40, 12, NULL, -8.14078175, -34.9294632, CAST(0x0000A25900C25715 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (41, 12, NULL, -8.14074677, -34.92919592, CAST(0x0000A25900C25A98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (42, 12, NULL, -8.14071499, -34.92900132, CAST(0x0000A25900C25CF0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (43, 12, NULL, -8.14068756, -34.92879065, CAST(0x0000A25900C25F4E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (44, 12, NULL, -8.14065674, -34.92856776, CAST(0x0000A25900C261B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (45, 12, NULL, -8.14062707, -34.92835501, CAST(0x0000A25900C263FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (46, 12, NULL, -8.14059561, -34.92813963, CAST(0x0000A25900C2677A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (47, 12, NULL, -8.14056739, -34.92794448, CAST(0x0000A25900C276BC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (48, 12, NULL, -8.14052904, -34.92770187, CAST(0x0000A25900C27B6A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (49, 12, NULL, -8.14050548, -34.92746187, CAST(0x0000A25900C27EEE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (50, 12, NULL, -8.14050488, -34.92726892, CAST(0x0000A25900C28145 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (51, 12, NULL, -8.14051347, -34.92707094, CAST(0x0000A25900C283A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (52, 12, NULL, -8.14052204, -34.92685658, CAST(0x0000A25900C285F4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (53, 12, NULL, -8.14052812, -34.92663793, CAST(0x0000A25900C2884F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (54, 12, NULL, -8.1405371, -34.92640991, CAST(0x0000A25900C28AA9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (55, 12, NULL, -8.14054986, -34.92616648, CAST(0x0000A25900C28CFD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (56, 12, NULL, -8.14058085, -34.92589951, CAST(0x0000A25900C28F53 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (57, 12, NULL, -8.14058985, -34.92564438, CAST(0x0000A25900C291B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (58, 12, NULL, -8.14060162, -34.92544505, CAST(0x0000A25900C29407 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (59, 12, NULL, -8.14060743, -34.92524643, CAST(0x0000A25900C29FC4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (60, 12, NULL, -8.1406297, -34.92502586, CAST(0x0000A25900C2A5A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (61, 12, NULL, -8.14062423, -34.92480203, CAST(0x0000A25900C2A93A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (62, 12, NULL, -8.14062491, -34.92462025, CAST(0x0000A25900C2AB87 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (63, 12, NULL, -8.14062992, -34.92442158, CAST(0x0000A25900C2ADDA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (64, 12, NULL, -8.14063986, -34.92421139, CAST(0x0000A25900C2B035 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (65, 12, NULL, -8.14064149, -34.92398611, CAST(0x0000A25900C2B286 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (66, 12, NULL, -8.14065652, -34.92375705, CAST(0x0000A25900C2B4E4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (67, 12, NULL, -8.14056835, -34.92352033, CAST(0x0000A25900C2B73F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (68, 12, NULL, -8.14048262, -34.92329886, CAST(0x0000A25900C2B992 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (69, 12, NULL, -8.14039636, -34.92307233, CAST(0x0000A25900C2BBEB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (70, 12, NULL, -8.14029931, -34.9228451, CAST(0x0000A25900C2BE48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (71, 12, NULL, -8.14020324, -34.92262853, CAST(0x0000A25900C2C099 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (72, 12, NULL, -8.1401131, -34.92243089, CAST(0x0000A25900C2C2F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (73, 12, NULL, -8.14002554, -34.92225854, CAST(0x0000A25900C2C549 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (74, 12, NULL, -8.1399278, -34.92205753, CAST(0x0000A25900C2C8CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (75, 12, NULL, -8.1398469, -34.92185637, CAST(0x0000A25900C2CC58 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (76, 12, NULL, -8.13987142, -34.92161016, CAST(0x0000A25900C2CFFC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (77, 12, NULL, -8.14000304, -34.92147234, CAST(0x0000A25900C2D230 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (78, 12, NULL, -8.14015285, -34.92133213, CAST(0x0000A25900C2D499 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (79, 12, NULL, -8.14030783, -34.92118325, CAST(0x0000A25900C2D6DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (80, 12, NULL, -8.1405648, -34.92094247, CAST(0x0000A25900C2DA69 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (81, 12, NULL, -8.14072344, -34.92078557, CAST(0x0000A25900C2DCB8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (82, 12, NULL, -8.14087865, -34.92062973, CAST(0x0000A25900C2DF10 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (83, 12, NULL, -8.14102486, -34.9204593, CAST(0x0000A25900C2E16E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (84, 12, NULL, -8.14114814, -34.92029647, CAST(0x0000A25900C2E3C2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (85, 12, NULL, -8.14126334, -34.92013584, CAST(0x0000A25900C2E626 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (86, 12, NULL, -8.14139171, -34.91996731, CAST(0x0000A25900C2E86E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (87, 12, NULL, -8.14152921, -34.91979704, CAST(0x0000A25900C2EAC9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (88, 12, NULL, -8.14166121, -34.91960108, CAST(0x0000A25900C2ED24 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (89, 12, NULL, -8.14176119, -34.919377419999996, CAST(0x0000A25900C2EF7E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (90, 12, NULL, -8.14184111, -34.91915967, CAST(0x0000A25900C2F1DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (91, 12, NULL, -8.14190464, -34.91893244, CAST(0x0000A25900C2F427 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (92, 12, NULL, -8.14196429, -34.91871679, CAST(0x0000A25900C2F680 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (93, 12, NULL, -8.14201445, -34.91852263, CAST(0x0000A25900C2F8D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (94, 12, NULL, -8.14206655, -34.91833017, CAST(0x0000A25900C2FB32 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (95, 12, NULL, -8.14208797, -34.91814409, CAST(0x0000A25900C2FD8B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (96, 12, NULL, -8.14214562, -34.91795458, CAST(0x0000A25900C2FFE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (97, 12, NULL, -8.14223853, -34.91756185, CAST(0x0000A25900C30491 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (98, 12, NULL, -8.14231205, -34.91734927, CAST(0x0000A25900C306E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (99, 12, NULL, -8.14241544, -34.91716083, CAST(0x0000A25900C30954 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (100, 12, NULL, -8.14256888, -34.9170644, CAST(0x0000A25900C30B99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (101, 12, NULL, -8.1428191, -34.91704352, CAST(0x0000A25900C30F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (102, 12, NULL, -8.1430138, -34.91710518, CAST(0x0000A25900C312AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (103, 12, NULL, -8.14309807, -34.91727514, CAST(0x0000A25900C31628 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (104, 12, NULL, -8.14312416, -34.91748352, CAST(0x0000A25900C319AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (105, 12, NULL, -8.14314065, -34.91770057, CAST(0x0000A25900C31E5A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (106, 12, NULL, -8.14301599, -34.91788544, CAST(0x0000A25900C32308 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (107, 12, NULL, -8.14281148, -34.91788927, CAST(0x0000A25900C3268D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (108, 12, NULL, -8.14255493, -34.91784638, CAST(0x0000A25900C32A12 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (109, 12, NULL, -8.14235602, -34.91781023, CAST(0x0000A25900C32C6B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (110, 12, NULL, -8.14214176, -34.91777204, CAST(0x0000A25900C32EBF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (111, 12, NULL, -8.141918, -34.91773468, CAST(0x0000A25900C3311E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (112, 12, NULL, -8.14168425, -34.91769611, CAST(0x0000A25900C33370 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (113, 12, NULL, -8.14144615, -34.91765597, CAST(0x0000A25900C335CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (114, 12, NULL, -8.14119865, -34.91761702, CAST(0x0000A25900C3381C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (115, 12, NULL, -8.14095169, -34.91757505, CAST(0x0000A25900C33A78 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (116, 12, NULL, -8.14069323, -34.91753355, CAST(0x0000A25900C33CCB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (117, 12, NULL, -8.14042617, -34.91749085, CAST(0x0000A25900C33F31 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (118, 12, NULL, -8.14014652, -34.91743712, CAST(0x0000A25900C3417B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (119, 12, NULL, -8.1398668, -34.91738042, CAST(0x0000A25900C343DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (120, 12, NULL, -8.13958988, -34.91732747, CAST(0x0000A25900C34629 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (121, 12, NULL, -8.13931255, -34.91728126, CAST(0x0000A25900C34883 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (122, 12, NULL, -8.13903621, -34.91723786, CAST(0x0000A25900C34AE4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (123, 12, NULL, -8.1387544, -34.91719917, CAST(0x0000A25900C34D33 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (124, 12, NULL, -8.13848304, -34.91715907, CAST(0x0000A25900C34F8D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (125, 12, NULL, -8.13821137, -34.91711739, CAST(0x0000A25900C351E7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (126, 12, NULL, -8.13794199, -34.91706843, CAST(0x0000A25900C3543B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (127, 12, NULL, -8.13767548, -34.91701218, CAST(0x0000A25900C35694 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (128, 12, NULL, -8.13741939, -34.91695582, CAST(0x0000A25900C358F7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (129, 12, NULL, -8.13718517, -34.91689605, CAST(0x0000A25900C35B42 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (130, 12, NULL, -8.13698813, -34.91682503, CAST(0x0000A25900C35DA8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (131, 12, NULL, -8.13684467, -34.91670176, CAST(0x0000A25900C35FF3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (132, 12, NULL, -8.13675842, -34.916519, CAST(0x0000A25900C36254 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (133, 12, NULL, -8.13667243, -34.91633365, CAST(0x0000A25900C364A4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (134, 12, NULL, -8.13652607, -34.91618366, CAST(0x0000A25900C36706 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (135, 12, NULL, -8.13635388, -34.91608227, CAST(0x0000A25900C36953 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (136, 12, NULL, -8.13611805, -34.91601067, CAST(0x0000A25900C36BC7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (137, 12, NULL, -8.13590464, -34.91612618, CAST(0x0000A25900C36E0B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (138, 12, NULL, -8.13571329, -34.91625299, CAST(0x0000A25900C3706A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (139, 12, NULL, -8.13552743, -34.91635938, CAST(0x0000A25900C372C3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (140, 12, NULL, -8.13531898, -34.91644876, CAST(0x0000A25900C3750E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (141, 12, NULL, -8.1351152, -34.91648761, CAST(0x0000A25900C3776C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (142, 12, NULL, -8.13491571, -34.91648534, CAST(0x0000A25900C379BA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (143, 12, NULL, -8.13472975, -34.91646097, CAST(0x0000A25900C37C22 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (144, 12, NULL, -8.13449295, -34.91642564, CAST(0x0000A25900C37F99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (145, 12, NULL, -8.13431969, -34.91633886, CAST(0x0000A25900C38321 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (146, 12, NULL, -8.13428733, -34.9161308, CAST(0x0000A25900C386A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (147, 12, NULL, -8.13434032, -34.9158568, CAST(0x0000A25900C38A33 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (148, 12, NULL, -8.13437279, -34.91566794, CAST(0x0000A25900C38C82 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (149, 12, NULL, -8.13440845, -34.91542782, CAST(0x0000A25900C38FFE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (150, 13, NULL, -8.06108803, -34.87055831, CAST(0x0000A25900FFAF7B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (151, 13, NULL, -8.06064733, -34.87047251, CAST(0x0000A25900FFB5E1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (152, 13, NULL, -8.06042622, -34.87038764, CAST(0x0000A25900FFB833 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (153, 13, NULL, -8.06019902, -34.8703131, CAST(0x0000A25900FFBA88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (154, 13, NULL, -8.05996723, -34.87023972, CAST(0x0000A25900FFBCE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (155, 13, NULL, -8.05969602, -34.87014839, CAST(0x0000A25900FFBF35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (156, 13, NULL, -8.05947581, -34.87006425, CAST(0x0000A25900FFC18D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (157, 13, NULL, -8.05880646, -34.86983521, CAST(0x0000A25900FFC890 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (158, 13, NULL, -8.05859928, -34.8697586, CAST(0x0000A25900FFCAF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (159, 13, NULL, -8.05838015, -34.86970705, CAST(0x0000A25900FFCD4F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (160, 13, NULL, -8.05815059, -34.86968005, CAST(0x0000A25900FFCFBF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (161, 13, NULL, -8.05793343, -34.86970112, CAST(0x0000A25900FFD1FD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (162, 13, NULL, -8.0577193, -34.86970335, CAST(0x0000A25900FFD456 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (163, 13, NULL, -8.05749519, -34.86969949, CAST(0x0000A25900FFD6A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (164, 13, NULL, -8.05731005, -34.86968023, CAST(0x0000A25900FFD907 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (165, 13, NULL, -8.0571135, -34.86967213, CAST(0x0000A25900FFDB6B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (166, 13, NULL, -8.05690431, -34.86967115, CAST(0x0000A25900FFDDA7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (167, 13, NULL, -8.05668501, -34.86966688, CAST(0x0000A25900FFE011 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (168, 13, NULL, -8.05646624, -34.86966438, CAST(0x0000A25900FFE269 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (169, 13, NULL, -8.05623956, -34.86966886, CAST(0x0000A25900FFE4B6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (170, 13, NULL, -8.05601872, -34.86967254, CAST(0x0000A25900FFE716 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (171, 13, NULL, -8.0557933, -34.86967126, CAST(0x0000A25900FFE963 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (172, 13, NULL, -8.05556766, -34.86967292, CAST(0x0000A25900FFEBC6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (173, 13, NULL, -8.05535694, -34.86970657, CAST(0x0000A25900FFEE23 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (174, 13, NULL, -8.05518224, -34.86978726, CAST(0x0000A25900FFF074 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (175, 13, NULL, -8.0550234, -34.86995397, CAST(0x0000A25900FFF2D0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (176, 13, NULL, -8.05486986, -34.87010814, CAST(0x0000A25900FFF52A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (177, 13, NULL, -8.05471598, -34.87027227, CAST(0x0000A25900FFF789 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (178, 13, NULL, -8.05456721, -34.87043766, CAST(0x0000A25900FFF9DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (179, 13, NULL, -8.05441447, -34.87060684, CAST(0x0000A25900FFFC36 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (180, 13, NULL, -8.05427378, -34.87077354, CAST(0x0000A25900FFFE89 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (181, 13, NULL, -8.05413264, -34.8709368, CAST(0x0000A259010000E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (182, 13, NULL, -8.05398767, -34.87110312, CAST(0x0000A2590100033A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (183, 13, NULL, -8.05384812, -34.87125701, CAST(0x0000A25901000591 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (184, 13, NULL, -8.05369144, -34.87139226, CAST(0x0000A259010007F2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (185, 13, NULL, -8.05352124, -34.87150733, CAST(0x0000A25901000A48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (186, 13, NULL, -8.0533239, -34.87160039, CAST(0x0000A25901000CA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (187, 13, NULL, -8.05311572, -34.87166103, CAST(0x0000A25901000EF6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (188, 13, NULL, -8.05289746, -34.87168241, CAST(0x0000A2590100114D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (189, 13, NULL, -8.05268757, -34.87168313, CAST(0x0000A259010013A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (190, 13, NULL, -8.05245907, -34.87165648, CAST(0x0000A25901001600 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (191, 13, NULL, -8.05224376, -34.87160315, CAST(0x0000A25901001857 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (192, 13, NULL, -8.05204135, -34.87155535, CAST(0x0000A25901001AB1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (193, 13, NULL, -8.05177904, -34.87159695, CAST(0x0000A25901001E35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (194, 13, NULL, -8.05162502, -34.87172436, CAST(0x0000A25901002077 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (195, 13, NULL, -8.05148913, -34.87188243, CAST(0x0000A259010022D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (196, 13, NULL, -8.05135092, -34.8720509, CAST(0x0000A25901002525 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (197, 13, NULL, -8.05121485, -34.87222938, CAST(0x0000A25901002788 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (198, 13, NULL, -8.0510776, -34.87241066, CAST(0x0000A259010029E0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (199, 13, NULL, -8.05093653, -34.87259484, CAST(0x0000A25901002C39 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (200, 13, NULL, -8.05080365, -34.87277404, CAST(0x0000A25901002E97 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (201, 13, NULL, -8.05067341, -34.87294507, CAST(0x0000A259010030ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (202, 13, NULL, -8.05055825, -34.87310019, CAST(0x0000A2590100333C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (203, 13, NULL, -8.05044137, -34.87324259, CAST(0x0000A25901003595 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (204, 13, NULL, -8.0502898, -34.87342033, CAST(0x0000A2590100391D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (205, 13, NULL, -8.05016689, -34.87355979, CAST(0x0000A25901003CA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (206, 13, NULL, -8.05003731, -34.87370396, CAST(0x0000A2590100647B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (207, 13, NULL, -8.04992568, -34.87385794, CAST(0x0000A2590100691B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (208, 13, NULL, -8.04978468, -34.87404195, CAST(0x0000A25901006CAF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (209, 13, NULL, -8.04967214, -34.87419132, CAST(0x0000A25901006F08 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (210, 13, NULL, -8.04956238, -34.87433685, CAST(0x0000A25901007162 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (211, 13, NULL, -8.04944031, -34.87449655, CAST(0x0000A259010073BA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (212, 13, NULL, -8.04932692, -34.87464906, CAST(0x0000A25901007615 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (213, 13, NULL, -8.0492088, -34.87481339, CAST(0x0000A25901007873 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (214, 13, NULL, -8.04908543, -34.87497343, CAST(0x0000A25901007AC7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (215, 13, NULL, -8.04895969, -34.87514132, CAST(0x0000A25901007D19 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (216, 13, NULL, -8.04883242, -34.87531408, CAST(0x0000A25901007F73 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (217, 13, NULL, -8.04870303, -34.87548195, CAST(0x0000A259010081CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (218, 13, NULL, -8.04858071, -34.87564203, CAST(0x0000A25901008423 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (219, 13, NULL, -8.04846987, -34.87579657, CAST(0x0000A2590100867A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (220, 13, NULL, -8.04830449, -34.87597532, CAST(0x0000A259010089FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (221, 13, NULL, -8.04808793, -34.87604239, CAST(0x0000A25901008D81 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (222, 13, NULL, -8.04784655, -34.87605347, CAST(0x0000A25901009106 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (223, 13, NULL, -8.04761396, -34.87604994, CAST(0x0000A2590100948F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (224, 13, NULL, -8.04738083, -34.87602534, CAST(0x0000A25901009813 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (225, 13, NULL, -8.04723291, -34.87590388, CAST(0x0000A25901009B99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (226, 13, NULL, -8.04708942, -34.87577179, CAST(0x0000A25901009F1E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (227, 13, NULL, -8.04691394, -34.87564484, CAST(0x0000A2590100A2A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (228, 13, NULL, -8.04669628, -34.87571266, CAST(0x0000A2590100A74A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (229, 13, NULL, -8.04656655, -34.87589479, CAST(0x0000A2590100AC00 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (230, 13, NULL, -8.04651355, -34.87607791, CAST(0x0000A2590100E0B8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (231, 13, NULL, -8.04654898, -34.87625892, CAST(0x0000A2590100E56C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (232, 13, NULL, -8.04663497, -34.8764365, CAST(0x0000A2590100EB45 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (233, 13, NULL, -8.04677013, -34.87659755, CAST(0x0000A2590100F124 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (234, 13, NULL, -8.04694326, -34.87669174, CAST(0x0000A2590100F5D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (235, 13, NULL, -8.04709059, -34.87678496, CAST(0x0000A2590100FA83 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (236, 13, NULL, -8.04728756, -34.87682101, CAST(0x0000A259010125DB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (237, 13, NULL, -8.0474728, -34.87696663, CAST(0x0000A25901012A8D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (238, 13, NULL, -8.04761997, -34.87708608, CAST(0x0000A25901012E10 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (239, 13, NULL, -8.04779269, -34.87723079, CAST(0x0000A25901013195 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (240, 13, NULL, -8.04797378, -34.87736636, CAST(0x0000A25901013519 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (241, 13, NULL, -8.04816288, -34.87751007, CAST(0x0000A2590101389C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (242, 13, NULL, -8.04836281, -34.87765036, CAST(0x0000A25901013C1E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (243, 13, NULL, -8.04856424, -34.87779315, CAST(0x0000A25901013FA3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (244, 13, NULL, -8.04878403, -34.87794603, CAST(0x0000A25901014328 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (245, 13, NULL, -8.0489364899999991, -34.87805441, CAST(0x0000A2590101457D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (246, 13, NULL, -8.04908958, -34.87815926, CAST(0x0000A259010147DD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (247, 13, NULL, -8.04924703, -34.87826399, CAST(0x0000A25901014A34 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (248, 13, NULL, -8.04940126, -34.87838377, CAST(0x0000A25901014C8D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (249, 13, NULL, -8.04955923, -34.87849909, CAST(0x0000A25901014ED6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (250, 13, NULL, -8.04972582, -34.87861254, CAST(0x0000A25901015139 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (251, 13, NULL, -8.04988849, -34.87873216, CAST(0x0000A25901015393 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (252, 13, NULL, -8.05005772, -34.87885672, CAST(0x0000A259010155EC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (253, 13, NULL, -8.05023202, -34.878982, CAST(0x0000A25901015844 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (254, 13, NULL, -8.05040385, -34.87910046, CAST(0x0000A25901015A98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (255, 13, NULL, -8.05056965, -34.87922315, CAST(0x0000A25901015CED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (256, 13, NULL, -8.05072364, -34.8793393, CAST(0x0000A25901015F46 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (257, 13, NULL, -8.05089996, -34.87947024, CAST(0x0000A259010162C7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (258, 13, NULL, -8.0508821, -34.8796685, CAST(0x0000A25901016777 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (259, 13, NULL, -8.05076226, -34.87983403, CAST(0x0000A25901016B00 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (260, 13, NULL, -8.05063836, -34.88000627, CAST(0x0000A25901016E84 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (261, 13, NULL, -8.05051359, -34.88018014, CAST(0x0000A25901017207 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (262, 13, NULL, -8.05039547, -34.88035212, CAST(0x0000A2590101758D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (263, 13, NULL, -8.05027534, -34.88050349, CAST(0x0000A25901017912 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (264, 13, NULL, -8.05016319, -34.88065768, CAST(0x0000A25901017C95 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (265, 13, NULL, -8.05002172, -34.88083785, CAST(0x0000A25901018157 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (276, 19, NULL, -8.12499713897705, -34.915031433105469, CAST(0x0000A259000FFD9D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (277, 19, NULL, -8.1284217834472656, -34.915683746337891, CAST(0x0000A259001006F9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (278, 19, NULL, -8.1320476531982422, -34.916378021240234, CAST(0x0000A25900100A74 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (279, 20, NULL, -8.14025075, -34.93452652, CAST(0x0000A25900C1E2B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (280, 20, NULL, -8.14022072, -34.93457593, CAST(0x0000A25900C1E5F4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (281, 20, NULL, -8.1403568, -34.93440498, CAST(0x0000A25900C1EECA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (282, 20, NULL, -8.14050031, -34.93427426, CAST(0x0000A25900C1F24D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (283, 20, NULL, -8.14068995, -34.93411378, CAST(0x0000A25900C1F5D2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (284, 20, NULL, -8.14089536, -34.93393781, CAST(0x0000A25900C1F954 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (285, 20, NULL, -8.14103205, -34.93381345, CAST(0x0000A25900C1FBAE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (286, 20, NULL, -8.14121565, -34.93363261, CAST(0x0000A25900C1FF30 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (287, 20, NULL, -8.14131064, -34.93341271, CAST(0x0000A25900C202BB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (288, 20, NULL, -8.14130554, -34.93316914, CAST(0x0000A25900C20639 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (289, 20, NULL, -8.14128584, -34.93298123, CAST(0x0000A25900C209BE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (290, 20, NULL, -8.14124312, -34.93277497, CAST(0x0000A25900C21C7D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (291, 20, NULL, -8.14119242, -34.93254527, CAST(0x0000A25900C2212D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (292, 20, NULL, -8.14115841, -34.93232958, CAST(0x0000A25900C224AD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (293, 20, NULL, -8.14113627, -34.93206293, CAST(0x0000A25900C22835 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (294, 20, NULL, -8.14109763, -34.93187852, CAST(0x0000A25900C22A98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (295, 20, NULL, -8.14105805, -34.9316835, CAST(0x0000A25900C22CF5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (296, 20, NULL, -8.14103656, -34.93147509, CAST(0x0000A25900C22F48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (297, 20, NULL, -8.14101921, -34.93126002, CAST(0x0000A25900C23194 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (298, 20, NULL, -8.14098966, -34.93105629, CAST(0x0000A25900C233EE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (299, 20, NULL, -8.1409635, -34.93086174, CAST(0x0000A25900C2364A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (300, 20, NULL, -8.14093452, -34.93060018, CAST(0x0000A25900C239CA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (301, 20, NULL, -8.14090086, -34.93034806, CAST(0x0000A25900C23D4A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (302, 20, NULL, -8.14087282, -34.93011949, CAST(0x0000A25900C240CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (303, 20, NULL, -8.14084659, -34.9299109, CAST(0x0000A25900C24EE4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (304, 20, NULL, -8.14081396, -34.92968459, CAST(0x0000A25900C25390 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (305, 20, NULL, -8.14078175, -34.9294632, CAST(0x0000A25900C25715 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (306, 20, NULL, -8.14074677, -34.92919592, CAST(0x0000A25900C25A98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (307, 20, NULL, -8.14071499, -34.92900132, CAST(0x0000A25900C25CF0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (308, 20, NULL, -8.14068756, -34.92879065, CAST(0x0000A25900C25F4E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (309, 20, NULL, -8.14065674, -34.92856776, CAST(0x0000A25900C261B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (310, 20, NULL, -8.14062707, -34.92835501, CAST(0x0000A25900C263FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (311, 20, NULL, -8.14059561, -34.92813963, CAST(0x0000A25900C2677A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (312, 20, NULL, -8.14056739, -34.92794448, CAST(0x0000A25900C276BC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (313, 20, NULL, -8.14052904, -34.92770187, CAST(0x0000A25900C27B6A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (314, 20, NULL, -8.14050548, -34.92746187, CAST(0x0000A25900C27EEE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (315, 20, NULL, -8.14050488, -34.92726892, CAST(0x0000A25900C28145 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (316, 20, NULL, -8.14051347, -34.92707094, CAST(0x0000A25900C283A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (317, 20, NULL, -8.14052204, -34.92685658, CAST(0x0000A25900C285F4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (318, 20, NULL, -8.14052812, -34.92663793, CAST(0x0000A25900C2884F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (319, 20, NULL, -8.1405371, -34.92640991, CAST(0x0000A25900C28AA9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (320, 20, NULL, -8.14054986, -34.92616648, CAST(0x0000A25900C28CFD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (321, 20, NULL, -8.14058085, -34.92589951, CAST(0x0000A25900C28F53 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (322, 20, NULL, -8.14058985, -34.92564438, CAST(0x0000A25900C291B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (323, 20, NULL, -8.14060162, -34.92544505, CAST(0x0000A25900C29407 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (324, 20, NULL, -8.14060743, -34.92524643, CAST(0x0000A25900C29FC4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (325, 20, NULL, -8.1406297, -34.92502586, CAST(0x0000A25900C2A5A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (326, 20, NULL, -8.14062423, -34.92480203, CAST(0x0000A25900C2A93A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (327, 20, NULL, -8.14062491, -34.92462025, CAST(0x0000A25900C2AB87 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (328, 20, NULL, -8.14062992, -34.92442158, CAST(0x0000A25900C2ADDA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (329, 20, NULL, -8.14063986, -34.92421139, CAST(0x0000A25900C2B035 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (330, 20, NULL, -8.14064149, -34.92398611, CAST(0x0000A25900C2B286 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (331, 20, NULL, -8.14065652, -34.92375705, CAST(0x0000A25900C2B4E4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (332, 20, NULL, -8.14056835, -34.92352033, CAST(0x0000A25900C2B73F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (333, 20, NULL, -8.14048262, -34.92329886, CAST(0x0000A25900C2B992 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (334, 20, NULL, -8.14039636, -34.92307233, CAST(0x0000A25900C2BBEB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (335, 20, NULL, -8.14029931, -34.9228451, CAST(0x0000A25900C2BE48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (336, 20, NULL, -8.14020324, -34.92262853, CAST(0x0000A25900C2C099 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (337, 20, NULL, -8.1401131, -34.92243089, CAST(0x0000A25900C2C2F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (338, 20, NULL, -8.14002554, -34.92225854, CAST(0x0000A25900C2C549 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (339, 20, NULL, -8.1399278, -34.92205753, CAST(0x0000A25900C2C8CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (340, 20, NULL, -8.1398469, -34.92185637, CAST(0x0000A25900C2CC58 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (341, 20, NULL, -8.13987142, -34.92161016, CAST(0x0000A25900C2CFFC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (342, 20, NULL, -8.14000304, -34.92147234, CAST(0x0000A25900C2D230 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (343, 20, NULL, -8.14015285, -34.92133213, CAST(0x0000A25900C2D499 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (344, 20, NULL, -8.14030783, -34.92118325, CAST(0x0000A25900C2D6DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (345, 20, NULL, -8.1405648, -34.92094247, CAST(0x0000A25900C2DA69 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (346, 20, NULL, -8.14072344, -34.92078557, CAST(0x0000A25900C2DCB8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (347, 20, NULL, -8.14087865, -34.92062973, CAST(0x0000A25900C2DF10 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (348, 20, NULL, -8.14102486, -34.9204593, CAST(0x0000A25900C2E16E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (349, 20, NULL, -8.14114814, -34.92029647, CAST(0x0000A25900C2E3C2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (350, 20, NULL, -8.14126334, -34.92013584, CAST(0x0000A25900C2E626 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (351, 20, NULL, -8.14139171, -34.91996731, CAST(0x0000A25900C2E86E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (352, 20, NULL, -8.14152921, -34.91979704, CAST(0x0000A25900C2EAC9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (353, 20, NULL, -8.14166121, -34.91960108, CAST(0x0000A25900C2ED24 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (354, 20, NULL, -8.14176119, -34.919377419999996, CAST(0x0000A25900C2EF7E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (355, 20, NULL, -8.14184111, -34.91915967, CAST(0x0000A25900C2F1DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (356, 20, NULL, -8.14190464, -34.91893244, CAST(0x0000A25900C2F427 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (357, 20, NULL, -8.14196429, -34.91871679, CAST(0x0000A25900C2F680 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (358, 20, NULL, -8.14201445, -34.91852263, CAST(0x0000A25900C2F8D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (359, 20, NULL, -8.14206655, -34.91833017, CAST(0x0000A25900C2FB32 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (360, 20, NULL, -8.14208797, -34.91814409, CAST(0x0000A25900C2FD8B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (361, 20, NULL, -8.14214562, -34.91795458, CAST(0x0000A25900C2FFE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (362, 20, NULL, -8.14223853, -34.91756185, CAST(0x0000A25900C30491 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (363, 20, NULL, -8.14231205, -34.91734927, CAST(0x0000A25900C306E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (364, 20, NULL, -8.14241544, -34.91716083, CAST(0x0000A25900C30954 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (365, 20, NULL, -8.14256888, -34.9170644, CAST(0x0000A25900C30B99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (366, 20, NULL, -8.1428191, -34.91704352, CAST(0x0000A25900C30F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (367, 20, NULL, -8.1430138, -34.91710518, CAST(0x0000A25900C312AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (368, 20, NULL, -8.14309807, -34.91727514, CAST(0x0000A25900C31628 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (369, 20, NULL, -8.14312416, -34.91748352, CAST(0x0000A25900C319AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (370, 20, NULL, -8.14314065, -34.91770057, CAST(0x0000A25900C31E5A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (371, 20, NULL, -8.14301599, -34.91788544, CAST(0x0000A25900C32308 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (372, 20, NULL, -8.14281148, -34.91788927, CAST(0x0000A25900C3268D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (373, 20, NULL, -8.14255493, -34.91784638, CAST(0x0000A25900C32A12 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (374, 20, NULL, -8.14235602, -34.91781023, CAST(0x0000A25900C32C6B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (375, 20, NULL, -8.14214176, -34.91777204, CAST(0x0000A25900C32EBF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (376, 20, NULL, -8.141918, -34.91773468, CAST(0x0000A25900C3311E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (377, 20, NULL, -8.14168425, -34.91769611, CAST(0x0000A25900C33370 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (378, 20, NULL, -8.14144615, -34.91765597, CAST(0x0000A25900C335CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (379, 20, NULL, -8.14119865, -34.91761702, CAST(0x0000A25900C3381C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (380, 20, NULL, -8.14095169, -34.91757505, CAST(0x0000A25900C33A78 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (381, 20, NULL, -8.14069323, -34.91753355, CAST(0x0000A25900C33CCB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (382, 20, NULL, -8.14042617, -34.91749085, CAST(0x0000A25900C33F31 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (383, 20, NULL, -8.14014652, -34.91743712, CAST(0x0000A25900C3417B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (384, 20, NULL, -8.1398668, -34.91738042, CAST(0x0000A25900C343DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (385, 20, NULL, -8.13958988, -34.91732747, CAST(0x0000A25900C34629 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (386, 20, NULL, -8.13931255, -34.91728126, CAST(0x0000A25900C34883 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (387, 20, NULL, -8.13903621, -34.91723786, CAST(0x0000A25900C34AE4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (388, 20, NULL, -8.1387544, -34.91719917, CAST(0x0000A25900C34D33 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (389, 20, NULL, -8.13848304, -34.91715907, CAST(0x0000A25900C34F8D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (390, 20, NULL, -8.13821137, -34.91711739, CAST(0x0000A25900C351E7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (391, 20, NULL, -8.13794199, -34.91706843, CAST(0x0000A25900C3543B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (392, 20, NULL, -8.13767548, -34.91701218, CAST(0x0000A25900C35694 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (393, 20, NULL, -8.13741939, -34.91695582, CAST(0x0000A25900C358F7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (394, 20, NULL, -8.13718517, -34.91689605, CAST(0x0000A25900C35B42 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (395, 20, NULL, -8.13698813, -34.91682503, CAST(0x0000A25900C35DA8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (396, 20, NULL, -8.13684467, -34.91670176, CAST(0x0000A25900C35FF3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (397, 20, NULL, -8.13675842, -34.916519, CAST(0x0000A25900C36254 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (398, 20, NULL, -8.13667243, -34.91633365, CAST(0x0000A25900C364A4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (399, 20, NULL, -8.13652607, -34.91618366, CAST(0x0000A25900C36706 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (400, 20, NULL, -8.13635388, -34.91608227, CAST(0x0000A25900C36953 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (401, 20, NULL, -8.13611805, -34.91601067, CAST(0x0000A25900C36BC7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (402, 20, NULL, -8.13590464, -34.91612618, CAST(0x0000A25900C36E0B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (403, 20, NULL, -8.13571329, -34.91625299, CAST(0x0000A25900C3706A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (404, 20, NULL, -8.13552743, -34.91635938, CAST(0x0000A25900C372C3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (405, 20, NULL, -8.13531898, -34.91644876, CAST(0x0000A25900C3750E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (406, 20, NULL, -8.1351152, -34.91648761, CAST(0x0000A25900C3776C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (407, 20, NULL, -8.13491571, -34.91648534, CAST(0x0000A25900C379BA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (408, 20, NULL, -8.13472975, -34.91646097, CAST(0x0000A25900C37C22 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (409, 20, NULL, -8.13449295, -34.91642564, CAST(0x0000A25900C37F99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (410, 20, NULL, -8.13431969, -34.91633886, CAST(0x0000A25900C38321 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (411, 20, NULL, -8.13428733, -34.9161308, CAST(0x0000A25900C386A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (412, 20, NULL, -8.13434032, -34.9158568, CAST(0x0000A25900C38A33 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (413, 20, NULL, -8.13437279, -34.91566794, CAST(0x0000A25900C38C82 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (414, 20, NULL, -8.13440845, -34.91542782, CAST(0x0000A25900C38FFE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (415, 21, NULL, -8.06108803, -34.87055831, CAST(0x0000A25900FFAF7B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (416, 21, NULL, -8.06064733, -34.87047251, CAST(0x0000A25900FFB5E1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (417, 21, NULL, -8.06042622, -34.87038764, CAST(0x0000A25900FFB833 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (418, 21, NULL, -8.06019902, -34.8703131, CAST(0x0000A25900FFBA88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (419, 21, NULL, -8.05996723, -34.87023972, CAST(0x0000A25900FFBCE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (420, 21, NULL, -8.05969602, -34.87014839, CAST(0x0000A25900FFBF35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (421, 21, NULL, -8.05947581, -34.87006425, CAST(0x0000A25900FFC18D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (422, 21, NULL, -8.05880646, -34.86983521, CAST(0x0000A25900FFC890 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (423, 21, NULL, -8.05859928, -34.8697586, CAST(0x0000A25900FFCAF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (424, 21, NULL, -8.05838015, -34.86970705, CAST(0x0000A25900FFCD4F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (425, 21, NULL, -8.05815059, -34.86968005, CAST(0x0000A25900FFCFBF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (426, 21, NULL, -8.05793343, -34.86970112, CAST(0x0000A25900FFD1FD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (427, 21, NULL, -8.0577193, -34.86970335, CAST(0x0000A25900FFD456 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (428, 21, NULL, -8.05749519, -34.86969949, CAST(0x0000A25900FFD6A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (429, 21, NULL, -8.05731005, -34.86968023, CAST(0x0000A25900FFD907 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (430, 21, NULL, -8.0571135, -34.86967213, CAST(0x0000A25900FFDB6B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (431, 21, NULL, -8.05690431, -34.86967115, CAST(0x0000A25900FFDDA7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (432, 21, NULL, -8.05668501, -34.86966688, CAST(0x0000A25900FFE011 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (433, 21, NULL, -8.05646624, -34.86966438, CAST(0x0000A25900FFE269 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (434, 21, NULL, -8.05623956, -34.86966886, CAST(0x0000A25900FFE4B6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (435, 21, NULL, -8.05601872, -34.86967254, CAST(0x0000A25900FFE716 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (436, 21, NULL, -8.0557933, -34.86967126, CAST(0x0000A25900FFE963 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (437, 21, NULL, -8.05556766, -34.86967292, CAST(0x0000A25900FFEBC6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (438, 21, NULL, -8.05535694, -34.86970657, CAST(0x0000A25900FFEE23 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (439, 21, NULL, -8.05518224, -34.86978726, CAST(0x0000A25900FFF074 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (440, 21, NULL, -8.0550234, -34.86995397, CAST(0x0000A25900FFF2D0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (441, 21, NULL, -8.05486986, -34.87010814, CAST(0x0000A25900FFF52A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (442, 21, NULL, -8.05471598, -34.87027227, CAST(0x0000A25900FFF789 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (443, 21, NULL, -8.05456721, -34.87043766, CAST(0x0000A25900FFF9DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (444, 21, NULL, -8.05441447, -34.87060684, CAST(0x0000A25900FFFC36 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (445, 21, NULL, -8.05427378, -34.87077354, CAST(0x0000A25900FFFE89 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (446, 21, NULL, -8.05413264, -34.8709368, CAST(0x0000A259010000E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (447, 21, NULL, -8.05398767, -34.87110312, CAST(0x0000A2590100033A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (448, 21, NULL, -8.05384812, -34.87125701, CAST(0x0000A25901000591 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (449, 21, NULL, -8.05369144, -34.87139226, CAST(0x0000A259010007F2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (450, 21, NULL, -8.05352124, -34.87150733, CAST(0x0000A25901000A48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (451, 21, NULL, -8.0533239, -34.87160039, CAST(0x0000A25901000CA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (452, 21, NULL, -8.05311572, -34.87166103, CAST(0x0000A25901000EF6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (453, 21, NULL, -8.05289746, -34.87168241, CAST(0x0000A2590100114D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (454, 21, NULL, -8.05268757, -34.87168313, CAST(0x0000A259010013A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (455, 21, NULL, -8.05245907, -34.87165648, CAST(0x0000A25901001600 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (456, 21, NULL, -8.05224376, -34.87160315, CAST(0x0000A25901001857 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (457, 21, NULL, -8.05204135, -34.87155535, CAST(0x0000A25901001AB1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (458, 21, NULL, -8.05177904, -34.87159695, CAST(0x0000A25901001E35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (459, 21, NULL, -8.05162502, -34.87172436, CAST(0x0000A25901002077 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (460, 21, NULL, -8.05148913, -34.87188243, CAST(0x0000A259010022D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (461, 21, NULL, -8.05135092, -34.8720509, CAST(0x0000A25901002525 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (462, 21, NULL, -8.05121485, -34.87222938, CAST(0x0000A25901002788 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (463, 21, NULL, -8.0510776, -34.87241066, CAST(0x0000A259010029E0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (464, 21, NULL, -8.05093653, -34.87259484, CAST(0x0000A25901002C39 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (465, 21, NULL, -8.05080365, -34.87277404, CAST(0x0000A25901002E97 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (466, 21, NULL, -8.05067341, -34.87294507, CAST(0x0000A259010030ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (467, 21, NULL, -8.05055825, -34.87310019, CAST(0x0000A2590100333C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (468, 21, NULL, -8.05044137, -34.87324259, CAST(0x0000A25901003595 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (469, 21, NULL, -8.0502898, -34.87342033, CAST(0x0000A2590100391D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (470, 21, NULL, -8.05016689, -34.87355979, CAST(0x0000A25901003CA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (471, 21, NULL, -8.05003731, -34.87370396, CAST(0x0000A2590100647B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (472, 21, NULL, -8.04992568, -34.87385794, CAST(0x0000A2590100691B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (473, 21, NULL, -8.04978468, -34.87404195, CAST(0x0000A25901006CAF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (474, 21, NULL, -8.04967214, -34.87419132, CAST(0x0000A25901006F08 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (475, 21, NULL, -8.04956238, -34.87433685, CAST(0x0000A25901007162 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (476, 21, NULL, -8.04944031, -34.87449655, CAST(0x0000A259010073BA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (477, 21, NULL, -8.04932692, -34.87464906, CAST(0x0000A25901007615 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (478, 21, NULL, -8.0492088, -34.87481339, CAST(0x0000A25901007873 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (479, 21, NULL, -8.04908543, -34.87497343, CAST(0x0000A25901007AC7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (480, 21, NULL, -8.04895969, -34.87514132, CAST(0x0000A25901007D19 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (481, 21, NULL, -8.04883242, -34.87531408, CAST(0x0000A25901007F73 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (482, 21, NULL, -8.04870303, -34.87548195, CAST(0x0000A259010081CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (483, 21, NULL, -8.04858071, -34.87564203, CAST(0x0000A25901008423 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (484, 21, NULL, -8.04846987, -34.87579657, CAST(0x0000A2590100867A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (485, 21, NULL, -8.04830449, -34.87597532, CAST(0x0000A259010089FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (486, 21, NULL, -8.04808793, -34.87604239, CAST(0x0000A25901008D81 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (487, 21, NULL, -8.04784655, -34.87605347, CAST(0x0000A25901009106 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (488, 21, NULL, -8.04761396, -34.87604994, CAST(0x0000A2590100948F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (489, 21, NULL, -8.04738083, -34.87602534, CAST(0x0000A25901009813 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (490, 21, NULL, -8.04723291, -34.87590388, CAST(0x0000A25901009B99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (491, 21, NULL, -8.04708942, -34.87577179, CAST(0x0000A25901009F1E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (492, 21, NULL, -8.04691394, -34.87564484, CAST(0x0000A2590100A2A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (493, 21, NULL, -8.04669628, -34.87571266, CAST(0x0000A2590100A74A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (494, 21, NULL, -8.04656655, -34.87589479, CAST(0x0000A2590100AC00 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (495, 21, NULL, -8.04651355, -34.87607791, CAST(0x0000A2590100E0B8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (496, 21, NULL, -8.04654898, -34.87625892, CAST(0x0000A2590100E56C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (497, 21, NULL, -8.04663497, -34.8764365, CAST(0x0000A2590100EB45 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (498, 21, NULL, -8.04677013, -34.87659755, CAST(0x0000A2590100F124 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (499, 21, NULL, -8.04694326, -34.87669174, CAST(0x0000A2590100F5D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (500, 21, NULL, -8.04709059, -34.87678496, CAST(0x0000A2590100FA83 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (501, 21, NULL, -8.04728756, -34.87682101, CAST(0x0000A259010125DB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (502, 21, NULL, -8.0474728, -34.87696663, CAST(0x0000A25901012A8D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (503, 21, NULL, -8.04761997, -34.87708608, CAST(0x0000A25901012E10 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (504, 21, NULL, -8.04779269, -34.87723079, CAST(0x0000A25901013195 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (505, 21, NULL, -8.04797378, -34.87736636, CAST(0x0000A25901013519 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (506, 21, NULL, -8.04816288, -34.87751007, CAST(0x0000A2590101389C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (507, 21, NULL, -8.04836281, -34.87765036, CAST(0x0000A25901013C1E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (508, 21, NULL, -8.04856424, -34.87779315, CAST(0x0000A25901013FA3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (509, 21, NULL, -8.04878403, -34.87794603, CAST(0x0000A25901014328 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (510, 21, NULL, -8.0489364899999991, -34.87805441, CAST(0x0000A2590101457D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (511, 21, NULL, -8.04908958, -34.87815926, CAST(0x0000A259010147DD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (512, 21, NULL, -8.04924703, -34.87826399, CAST(0x0000A25901014A34 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (513, 21, NULL, -8.04940126, -34.87838377, CAST(0x0000A25901014C8D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (514, 21, NULL, -8.04955923, -34.87849909, CAST(0x0000A25901014ED6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (515, 21, NULL, -8.04972582, -34.87861254, CAST(0x0000A25901015139 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (516, 21, NULL, -8.04988849, -34.87873216, CAST(0x0000A25901015393 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (517, 21, NULL, -8.05005772, -34.87885672, CAST(0x0000A259010155EC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (518, 21, NULL, -8.05023202, -34.878982, CAST(0x0000A25901015844 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (519, 21, NULL, -8.05040385, -34.87910046, CAST(0x0000A25901015A98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (520, 21, NULL, -8.05056965, -34.87922315, CAST(0x0000A25901015CED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (521, 21, NULL, -8.05072364, -34.8793393, CAST(0x0000A25901015F46 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (522, 21, NULL, -8.05089996, -34.87947024, CAST(0x0000A259010162C7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (523, 21, NULL, -8.0508821, -34.8796685, CAST(0x0000A25901016777 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (524, 21, NULL, -8.05076226, -34.87983403, CAST(0x0000A25901016B00 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (525, 21, NULL, -8.05063836, -34.88000627, CAST(0x0000A25901016E84 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (526, 21, NULL, -8.05051359, -34.88018014, CAST(0x0000A25901017207 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (527, 21, NULL, -8.05039547, -34.88035212, CAST(0x0000A2590101758D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (528, 21, NULL, -8.05027534, -34.88050349, CAST(0x0000A25901017912 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (529, 21, NULL, -8.05016319, -34.88065768, CAST(0x0000A25901017C95 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (530, 21, NULL, -8.05002172, -34.88083785, CAST(0x0000A25901018157 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (531, 22, NULL, -8.1320371627807617, -34.916236877441406, CAST(0x0000A259018B7072 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (532, 22, NULL, -8.1341056823730469, -34.914958953857422, CAST(0x0000A259018B73F5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (533, 22, NULL, -8.1347017288208, -34.912834167480469, CAST(0x0000A259018B7777 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (534, 22, NULL, -8.13386058807373, -34.910037994384766, CAST(0x0000A259018B7B05 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (535, 22, NULL, -8.1310205459594727, -34.908584594726562, CAST(0x0000A259018B7E7F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (536, 22, NULL, -8.1277952194213867, -34.91046142578125, CAST(0x0000A25A0000002B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (537, 22, NULL, -8.1262874603271484, -34.913825988769531, CAST(0x0000A25A00000399 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (538, 22, NULL, -8.129338264465332, -34.915843963623047, CAST(0x0000A25A00000AB6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (539, 23, NULL, -8.06414416, -34.87716494, CAST(0x0000A25A016E8E9F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (540, 23, NULL, -8.06414009, -34.87734942, CAST(0x0000A25A016EA03A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (541, 23, NULL, -8.06424701, -34.87750295, CAST(0x0000A25A016EAE51 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (542, 23, NULL, -8.06430908, -34.87768324, CAST(0x0000A25A016EC109 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (543, 23, NULL, -8.06437208, -34.87786848, CAST(0x0000A25A016ED16B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (544, 23, NULL, -8.06439474, -34.87805408, CAST(0x0000A25A016EE43F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (545, 23, NULL, -8.06442888, -34.87824406, CAST(0x0000A25A016EF370 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (546, 23, NULL, -8.06447496, -34.8784254, CAST(0x0000A25A016F0503 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (547, 23, NULL, -8.06442711, -34.8786039, CAST(0x0000A25A016F1699 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (548, 23, NULL, -8.06439786, -34.87913775, CAST(0x0000A25A016F76CF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (549, 23, NULL, -8.06435098, -34.87903694, CAST(0x0000A25A016F77FE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (550, 23, NULL, -8.06432184, -34.87905613, CAST(0x0000A25A016F792C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (551, 23, NULL, -8.06433967, -34.87924035, CAST(0x0000A25A016F883F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (552, 23, NULL, -8.06432357, -34.87942935, CAST(0x0000A25A016F98A9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (553, 23, NULL, -8.0642629, -34.87960532, CAST(0x0000A25A016FA90D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (554, 23, NULL, -8.06420682, -34.87978055, CAST(0x0000A25A016FBAA6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (555, 23, NULL, -8.06416064, -34.87996841, CAST(0x0000A25A016FCC3C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (556, 23, NULL, -8.06440473, -34.88124605, CAST(0x0000A25A01706A8E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (571, 37, NULL, -8.05076226, -34.87983403, NULL)
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (572, 37, NULL, -8.03076226, -35.87983403, NULL)
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (573, 38, NULL, -8.06536253, -34.87390394, CAST(0x0000A25B016AE989 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (574, 38, NULL, -8.0654912, -34.87419044, CAST(0x0000A25B016AED0D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (575, 38, NULL, -8.06548325, -34.8739284, CAST(0x0000A25B016AEE47 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (576, 38, NULL, -8.06548369, -34.87392998, CAST(0x0000A25B016AEF84 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (577, 38, NULL, -8.06547811, -34.873946, CAST(0x0000A25B016AF0B2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (578, 38, NULL, -8.06546947, -34.87399984, CAST(0x0000A25B016AF1DE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (579, 38, NULL, -8.06546964, -34.87401644, CAST(0x0000A25B016AF307 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (580, 38, NULL, -8.06546102, -34.87403242, CAST(0x0000A25B016AF7C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (581, 38, NULL, -8.06564689, -34.87400571, CAST(0x0000A25B016B150E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (582, 38, NULL, -8.06569448, -34.87399429, CAST(0x0000A25B016B162C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (583, 38, NULL, -8.06584165, -34.87390384, CAST(0x0000A25B016B19B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (584, 38, NULL, -8.06589454, -34.8738521, CAST(0x0000A25B016B1AD9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (585, 38, NULL, -8.06599374, -34.87373584, CAST(0x0000A25B016B1D45 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (586, 38, NULL, -8.06604646, -34.87367924, CAST(0x0000A25B016B1E63 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (587, 38, NULL, -8.06615731, -34.87357194, CAST(0x0000A25B016B20C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (588, 38, NULL, -8.06621517, -34.87352502, CAST(0x0000A25B016B21E9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (589, 38, NULL, -8.06634104, -34.87349433, CAST(0x0000A25B016B244A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (590, 38, NULL, -8.06640953, -34.8735025, CAST(0x0000A25B016B256C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (591, 38, NULL, -8.06654046, -34.87356281, CAST(0x0000A25B016B27CB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (592, 38, NULL, -8.06660795, -34.87361064, CAST(0x0000A25B016B28EF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (593, 38, NULL, -8.06673883, -34.8737032, CAST(0x0000A25B016B2B52 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (594, 38, NULL, -8.06680714, -34.87375601, CAST(0x0000A25B016B2C6F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (595, 38, NULL, -8.06695036, -34.87386465, CAST(0x0000A25B016B2EC8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (596, 38, NULL, -8.06702071, -34.87391595, CAST(0x0000A25B016B2FF2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (597, 38, NULL, -8.06714231, -34.87401388, CAST(0x0000A25B016B3251 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (598, 38, NULL, -8.06719113, -34.87405511, CAST(0x0000A25B016B3379 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (599, 38, NULL, -8.06731945, -34.87415632, CAST(0x0000A25B016B3707 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (600, 38, NULL, -8.06735611, -34.87418781, CAST(0x0000A25B016B382E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (601, 38, NULL, -8.06749171, -34.87429322, CAST(0x0000A25B016B3BBC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (602, 38, NULL, -8.06754582, -34.87433842, CAST(0x0000A25B016B3CDC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (603, 38, NULL, -8.06766152, -34.87442693, CAST(0x0000A25B016B3F3F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (604, 38, NULL, -8.06772732, -34.87447505, CAST(0x0000A25B016B405F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (605, 38, NULL, -8.06786562, -34.87457824, CAST(0x0000A25B016B42BC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (606, 38, NULL, -8.06793483, -34.87463253, CAST(0x0000A25B016B43E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (607, 38, NULL, -8.06801109, -34.87469284, CAST(0x0000A25B016B4515 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (608, 38, NULL, -8.0680904, -34.87475465, CAST(0x0000A25B016B463B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (609, 38, NULL, -8.0681706, -34.87481085, CAST(0x0000A25B016B476F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (610, 38, NULL, -8.06825059, -34.87486658, CAST(0x0000A25B016B4892 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (611, 38, NULL, -8.06841308, -34.87495174, CAST(0x0000A25B016B4AEA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (612, 38, NULL, -8.06857922, -34.87503535, CAST(0x0000A25B016B4D44 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (613, 38, NULL, -8.06875618, -34.87511567, CAST(0x0000A25B016B4F96 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (614, 38, NULL, -8.06893623, -34.87520302, CAST(0x0000A25B016B51F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (615, 38, NULL, -8.06913087, -34.87528838, CAST(0x0000A25B016B544A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (616, 38, NULL, -8.06933148, -34.87537043, CAST(0x0000A25B016B56A4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (617, 38, NULL, -8.06952788, -34.87546421, CAST(0x0000A25B016B58F8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (618, 38, NULL, -8.069745, -34.87556351, CAST(0x0000A25B016B5B53 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (619, 38, NULL, -8.06996651, -34.87566614, CAST(0x0000A25B016B5DAB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (620, 38, NULL, -8.07018171, -34.87576726, CAST(0x0000A25B016B5FFE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (621, 38, NULL, -8.07040221, -34.8758705, CAST(0x0000A25B016B625A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (622, 38, NULL, -8.07061355, -34.87596781, CAST(0x0000A25B016B64B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (623, 38, NULL, -8.07071744, -34.87602007, CAST(0x0000A25B016B65EC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (624, 38, NULL, -8.07081176, -34.87607781, CAST(0x0000A25B016B670B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (625, 38, NULL, -8.07088888, -34.8761476, CAST(0x0000A25B016B6846 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (626, 38, NULL, -8.07094837, -34.87623336, CAST(0x0000A25B016B6961 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (627, 38, NULL, -8.07100191, -34.87632957, CAST(0x0000A25B016B6A9F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (628, 38, NULL, -8.07104203, -34.8764328, CAST(0x0000A25B016B6BBC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (629, 38, NULL, -8.07108548, -34.87653847, CAST(0x0000A25B016B6CF4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (630, 38, NULL, -8.07112677, -34.87664937, CAST(0x0000A25B016B6E19 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (631, 38, NULL, -8.07117129, -34.87675958, CAST(0x0000A25B016B6F47 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (632, 38, NULL, -8.07121461, -34.8768762, CAST(0x0000A25B016B706A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (633, 38, NULL, -8.07126677, -34.87699676, CAST(0x0000A25B016B71A4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (634, 38, NULL, -8.07131576, -34.8771171, CAST(0x0000A25B016B72C5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (635, 38, NULL, -8.0713654, -34.8772373, CAST(0x0000A25B016B73EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (636, 38, NULL, -8.07141135, -34.87735951, CAST(0x0000A25B016B751C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (637, 38, NULL, -8.0714578, -34.87748146, CAST(0x0000A25B016B7652 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (638, 38, NULL, -8.07150596, -34.87759722, CAST(0x0000A25B016B7773 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (639, 38, NULL, -8.07155432, -34.8777205, CAST(0x0000A25B016B78AC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (640, 38, NULL, -8.07159707, -34.87783056, CAST(0x0000A25B016B79CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (641, 38, NULL, -8.07163937, -34.87793715, CAST(0x0000A25B016B7B02 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (642, 38, NULL, -8.0716749, -34.87804383, CAST(0x0000A25B016B7C23 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (643, 38, NULL, -8.07171435, -34.87814093, CAST(0x0000A25B016B7D57 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (644, 38, NULL, -8.07174946, -34.87823705, CAST(0x0000A25B016B7E7C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (645, 38, NULL, -8.07178327, -34.87832904, CAST(0x0000A25B016B7FB7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (646, 38, NULL, -8.07181309, -34.87841927, CAST(0x0000A25B016B80D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (647, 38, NULL, -8.07184871, -34.87850125, CAST(0x0000A25B016B820F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (648, 38, NULL, -8.07191201, -34.87866345, CAST(0x0000A25B016B8459 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (649, 38, NULL, -8.07194153, -34.87875087, CAST(0x0000A25B016B8590 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (650, 38, NULL, -8.0719671, -34.87884621, CAST(0x0000A25B016B86B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (651, 38, NULL, -8.07195443, -34.87893452, CAST(0x0000A25B016B87EC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (652, 38, NULL, -8.07194235, -34.87902932, CAST(0x0000A25B016B890C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (653, 38, NULL, -8.07192743, -34.87911776, CAST(0x0000A25B016B8A41 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (654, 38, NULL, -8.07186569, -34.87920213, CAST(0x0000A25B016B8B61 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (655, 38, NULL, -8.07180928, -34.87929439, CAST(0x0000A25B016B8C9B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (656, 38, NULL, -8.07175262, -34.87938337, CAST(0x0000A25B016B8DBB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (657, 38, NULL, -8.07168878, -34.87947874, CAST(0x0000A25B016B8EFA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (658, 38, NULL, -8.07162815, -34.87957081, CAST(0x0000A25B016B9010 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (659, 38, NULL, -8.07156412, -34.87966581, CAST(0x0000A25B016B914C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (660, 38, NULL, -8.07149707, -34.87976648, CAST(0x0000A25B016B9267 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (661, 38, NULL, -8.07143326, -34.87986345, CAST(0x0000A25B016B93A1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (662, 38, NULL, -8.07137062, -34.87995734, CAST(0x0000A25B016B94C0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (663, 38, NULL, -8.07130909, -34.8800486, CAST(0x0000A25B016B95FB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (664, 38, NULL, -8.07125017, -34.8801357, CAST(0x0000A25B016B9718 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (665, 38, NULL, -8.07120156, -34.88022236, CAST(0x0000A25B016B9852 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (666, 38, NULL, -8.07116528, -34.88031838, CAST(0x0000A25B016B9971 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (667, 38, NULL, -8.07113821, -34.88042242, CAST(0x0000A25B016B9AAB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (668, 38, NULL, -8.07110736, -34.88052506, CAST(0x0000A25B016B9BC5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (669, 38, NULL, -8.07108391, -34.8806381, CAST(0x0000A25B016B9D0D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (670, 38, NULL, -8.07104963, -34.88075698, CAST(0x0000A25B016B9E1D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (671, 38, NULL, -8.07102739, -34.8808729, CAST(0x0000A25B016B9F61 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (672, 38, NULL, -8.07103619, -34.88098248, CAST(0x0000A25B016BA078 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (673, 38, NULL, -8.07102757, -34.88108365, CAST(0x0000A25B016BA1B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (674, 38, NULL, -8.07108818, -34.88120966, CAST(0x0000A25B016BA2D0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (675, 38, NULL, -8.07109528, -34.88132551, CAST(0x0000A25B016BA40A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (676, 38, NULL, -8.07111498, -34.88142677, CAST(0x0000A25B016BA525 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (677, 38, NULL, -8.07114461, -34.88151496, CAST(0x0000A25B016BA663 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (678, 38, NULL, -8.07118189, -34.88159957, CAST(0x0000A25B016BA781 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (679, 38, NULL, -8.07122069, -34.88169506, CAST(0x0000A25B016BA8B6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (680, 38, NULL, -8.07126482, -34.8817704, CAST(0x0000A25B016BA9D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (681, 38, NULL, -8.07135593, -34.88191363, CAST(0x0000A25B016BAC3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (682, 38, NULL, -8.07142282, -34.88195131, CAST(0x0000A25B016BAD5B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (683, 38, NULL, -8.07155368, -34.88205601, CAST(0x0000A25B016BAFC4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (684, 38, NULL, -8.07162872, -34.8821061, CAST(0x0000A25B016BB0E1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (685, 38, NULL, -8.07170952, -34.88215297, CAST(0x0000A25B016BB21A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (686, 38, NULL, -8.07178641, -34.88219943, CAST(0x0000A25B016BB338 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (687, 38, NULL, -8.07191709, -34.88229913, CAST(0x0000A25B016BB59E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (688, 38, NULL, -8.07198316, -34.88235258, CAST(0x0000A25B016BB6BB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (689, 38, NULL, -8.07203393, -34.88246056, CAST(0x0000A25B016BB7FA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (690, 38, NULL, -8.07205889, -34.88254387, CAST(0x0000A25B016BB914 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (691, 38, NULL, -8.07211683, -34.88270104, CAST(0x0000A25B016BBB7E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (692, 38, NULL, -8.07214296, -34.88277377, CAST(0x0000A25B016BBC98 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (693, 38, NULL, -8.0721805, -34.88293265, CAST(0x0000A25B016BBF01 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (694, 38, NULL, -8.07220098, -34.8830081, CAST(0x0000A25B016BC01C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (695, 38, NULL, -8.07223514, -34.88314439, CAST(0x0000A25B016BC284 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (696, 38, NULL, -8.07225534, -34.8832161, CAST(0x0000A25B016BC3A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (697, 38, NULL, -8.07229823, -34.88333492, CAST(0x0000A25B016BC5FD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (698, 38, NULL, -8.07232209, -34.88338737, CAST(0x0000A25B016BC723 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (699, 38, NULL, -8.07237146, -34.88350357, CAST(0x0000A25B016BCBE9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (700, 38, NULL, -8.0724216, -34.88358655, CAST(0x0000A25B016BD085 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (701, 38, NULL, -8.0724238, -34.88370121, CAST(0x0000A25B016BD420 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (702, 38, NULL, -8.07244301, -34.88383544, CAST(0x0000A25B016BD661 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (703, 38, NULL, -8.07244406, -34.88388787, CAST(0x0000A25B016BD7A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (704, 38, NULL, -8.07233557, -34.88404206, CAST(0x0000A25B016BDB13 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (705, 38, NULL, -8.07233557, -34.88404206, CAST(0x0000A25B016BDB2E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (706, 38, NULL, -8.07218057, -34.88421262, CAST(0x0000A25B016BDFC2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (707, 38, NULL, -8.07218057, -34.88421262, CAST(0x0000A25B016BDFD5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (708, 38, NULL, -8.07205577, -34.88436609, CAST(0x0000A25B016BE59B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (709, 38, NULL, -8.07205577, -34.88436609, CAST(0x0000A25B016BE5B6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (710, 38, NULL, -8.07196685, -34.88453767, CAST(0x0000A25B016BF027 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (711, 38, NULL, -8.07196685, -34.88453767, CAST(0x0000A25B016BF03C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (712, 38, NULL, -8.07195623, -34.88472223, CAST(0x0000A25B016BF732 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (713, 38, NULL, -8.07195623, -34.88472223, CAST(0x0000A25B016BF744 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (714, 38, NULL, -8.0721585, -34.88487933, CAST(0x0000A25B016BFBDE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (715, 38, NULL, -8.0721585, -34.88487933, CAST(0x0000A25B016BFBF7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (716, 38, NULL, -8.07230629, -34.88498804, CAST(0x0000A25B016BFE38 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (717, 38, NULL, -8.07230629, -34.88498804, CAST(0x0000A25B016BFE58 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (718, 38, NULL, -8.07251468, -34.88514565, CAST(0x0000A25B016C01C0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (719, 38, NULL, -8.07251468, -34.88514565, CAST(0x0000A25B016C01D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (720, 38, NULL, -8.07265687, -34.88525721, CAST(0x0000A25B016C0412 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (721, 38, NULL, -8.07265687, -34.88525721, CAST(0x0000A25B016C0419 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (722, 38, NULL, -8.0728813, -34.88542786, CAST(0x0000A25B016C079C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (723, 38, NULL, -8.0728813, -34.88542786, CAST(0x0000A25B016C07AC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (724, 38, NULL, -8.07301871, -34.88564592, CAST(0x0000A25B016C0B1E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (725, 38, NULL, -8.07301871, -34.88564592, CAST(0x0000A25B016C0B29 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (726, 38, NULL, -8.07309319, -34.88584817, CAST(0x0000A25B016C0D72 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (727, 38, NULL, -8.07309319, -34.88584817, CAST(0x0000A25B016C0D85 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (728, 38, NULL, -8.0731651, -34.88604261, CAST(0x0000A25B016C0FCC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (729, 38, NULL, -8.0731651, -34.88604261, CAST(0x0000A25B016C0FDB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (730, 38, NULL, -8.07325607, -34.88628198, CAST(0x0000A25B016C1355 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (731, 38, NULL, -8.07325607, -34.88628198, CAST(0x0000A25B016C1363 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (732, 38, NULL, -8.07334504, -34.88653171, CAST(0x0000A25B016C16D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (733, 38, NULL, -8.07334504, -34.88653171, CAST(0x0000A25B016C16E9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (734, 38, NULL, -8.07341082, -34.88671322, CAST(0x0000A25B016C1930 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (735, 38, NULL, -8.07341082, -34.88671322, CAST(0x0000A25B016C1940 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (736, 38, NULL, -8.07348046, -34.8869148, CAST(0x0000A25B016C1B90 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (737, 38, NULL, -8.07348046, -34.8869148, CAST(0x0000A25B016C1B91 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (738, 38, NULL, -8.07355196, -34.88709418, CAST(0x0000A25B016C1DE0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (739, 38, NULL, -8.07355196, -34.88709418, CAST(0x0000A25B016C1DF0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (740, 38, NULL, -8.07360798, -34.88726878, CAST(0x0000A25B016C2038 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (741, 38, NULL, -8.07360798, -34.88726878, CAST(0x0000A25B016C2047 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (742, 38, NULL, -8.07367253, -34.8874539, CAST(0x0000A25B016C2291 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (743, 38, NULL, -8.07367253, -34.8874539, CAST(0x0000A25B016C22A1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (744, 38, NULL, -8.0737197, -34.88763525, CAST(0x0000A25B016C24E8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (745, 38, NULL, -8.0737197, -34.88763525, CAST(0x0000A25B016C24F9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (746, 38, NULL, -8.07377906, -34.88781466, CAST(0x0000A25B016C2741 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (747, 38, NULL, -8.07377906, -34.88781466, CAST(0x0000A25B016C2750 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (748, 38, NULL, -8.07384159, -34.8879964, CAST(0x0000A25B016C2999 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (749, 38, NULL, -8.07384159, -34.8879964, CAST(0x0000A25B016C29AB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (750, 38, NULL, -8.07389088, -34.88817701, CAST(0x0000A25B016C2BF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (751, 38, NULL, -8.07389088, -34.88817701, CAST(0x0000A25B016C2C02 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (752, 38, NULL, -8.07396809, -34.88843862, CAST(0x0000A25B016C2F70 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (753, 38, NULL, -8.07396809, -34.88843862, CAST(0x0000A25B016C2F82 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (754, 38, NULL, -8.07405087, -34.88866523, CAST(0x0000A25B016C32F7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (755, 38, NULL, -8.07405087, -34.88866523, CAST(0x0000A25B016C3308 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (756, 38, NULL, -8.0741304, -34.88889744, CAST(0x0000A25B016C3679 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (757, 38, NULL, -8.0741304, -34.88889744, CAST(0x0000A25B016C3686 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (758, 38, NULL, -8.07421673, -34.8891796, CAST(0x0000A25B016C3B2B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (759, 38, NULL, -8.07421673, -34.8891796, CAST(0x0000A25B016C3B37 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (760, 38, NULL, -8.07427297, -34.88937135, CAST(0x0000A25B016C3FD9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (761, 38, NULL, -8.07427297, -34.88937135, CAST(0x0000A25B016C3FE7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (762, 38, NULL, -8.07434467, -34.88960152, CAST(0x0000A25B016C45B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (763, 38, NULL, -8.07434467, -34.88960152, CAST(0x0000A25B016C45C6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (764, 38, NULL, -8.07442457, -34.88981111, CAST(0x0000A25B016C493D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (765, 38, NULL, -8.07442457, -34.88981111, CAST(0x0000A25B016C494F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (766, 38, NULL, -8.07447717, -34.89000131, CAST(0x0000A25B016C4CBA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (767, 38, NULL, -8.07447717, -34.89000131, CAST(0x0000A25B016C4CCB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (768, 38, NULL, -8.07453675, -34.89020667, CAST(0x0000A25B016C7495 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (769, 38, NULL, -8.07453675, -34.89020667, CAST(0x0000A25B016C74A2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (770, 38, NULL, -8.07462056, -34.8904529, CAST(0x0000A25B016C7945 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (771, 38, NULL, -8.07462056, -34.8904529, CAST(0x0000A25B016C7948 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (772, 38, NULL, -8.0747086, -34.89071251, CAST(0x0000A25B016C7CCC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (773, 38, NULL, -8.0747086, -34.89071251, CAST(0x0000A25B016C7CDA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (774, 38, NULL, -8.07476577, -34.89089225, CAST(0x0000A25B016C7F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (775, 38, NULL, -8.07476577, -34.89089225, CAST(0x0000A25B016C7F34 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (776, 38, NULL, -8.07483235, -34.89107559, CAST(0x0000A25B016C8175 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (777, 38, NULL, -8.07483235, -34.89107559, CAST(0x0000A25B016C8185 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (778, 38, NULL, -8.07490635, -34.89128758, CAST(0x0000A25B016C83D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (779, 38, NULL, -8.07490635, -34.89128758, CAST(0x0000A25B016C83E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (780, 38, NULL, -8.07497862, -34.89151837, CAST(0x0000A25B016C8628 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (781, 38, NULL, -8.07497862, -34.89151837, CAST(0x0000A25B016C863A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (782, 38, NULL, -8.07505648, -34.89175833, CAST(0x0000A25B016C8882 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (783, 38, NULL, -8.07505648, -34.89175833, CAST(0x0000A25B016C8893 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (784, 38, NULL, -8.07512885, -34.89201099, CAST(0x0000A25B016C8AD6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (785, 38, NULL, -8.07512885, -34.89201099, CAST(0x0000A25B016C8AE2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (786, 38, NULL, -8.07522381, -34.89227075, CAST(0x0000A25B016C8D31 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (787, 38, NULL, -8.07522381, -34.89227075, CAST(0x0000A25B016C8D40 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (788, 38, NULL, -8.07535578, -34.89268226, CAST(0x0000A25B016C90B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (789, 38, NULL, -8.07535578, -34.89268226, CAST(0x0000A25B016C90C3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (790, 38, NULL, -8.07543046, -34.8929525, CAST(0x0000A25B016C930B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (791, 38, NULL, -8.07543046, -34.8929525, CAST(0x0000A25B016C931D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (792, 38, NULL, -8.07550699, -34.89320033, CAST(0x0000A25B016C9563 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (793, 38, NULL, -8.07550699, -34.89320033, CAST(0x0000A25B016C9572 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (794, 38, NULL, -8.07559563, -34.89348147, CAST(0x0000A25B016C97C0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (795, 38, NULL, -8.07559563, -34.89348147, CAST(0x0000A25B016C97C2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (796, 38, NULL, -8.07567145, -34.89372274, CAST(0x0000A25B016C9A21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (797, 38, NULL, -8.07567145, -34.89372274, CAST(0x0000A25B016C9A2A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (798, 38, NULL, -8.07576768, -34.89399295, CAST(0x0000A25B016C9C6C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (799, 38, NULL, -8.07576768, -34.89399295, CAST(0x0000A25B016C9C7D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (800, 38, NULL, -8.07585533, -34.89425125, CAST(0x0000A25B016C9EBE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (801, 38, NULL, -8.07585533, -34.89425125, CAST(0x0000A25B016C9ECC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (802, 38, NULL, -8.07593896, -34.89451964, CAST(0x0000A25B016CA11D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (803, 38, NULL, -8.07593896, -34.89451964, CAST(0x0000A25B016CA12B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (804, 38, NULL, -8.07601956, -34.89476272, CAST(0x0000A25B016CA376 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (805, 38, NULL, -8.07601956, -34.89476272, CAST(0x0000A25B016CA38B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (806, 38, NULL, -8.07608873, -34.89495537, CAST(0x0000A25B016CA5CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (807, 38, NULL, -8.07608873, -34.89495537, CAST(0x0000A25B016CA5DF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (808, 38, NULL, -8.07615581, -34.89514989, CAST(0x0000A25B016CA827 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (809, 38, NULL, -8.07615581, -34.89514989, CAST(0x0000A25B016CA833 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (810, 38, NULL, -8.0762245, -34.89536274, CAST(0x0000A25B016CAA7F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (811, 38, NULL, -8.0762245, -34.89536274, CAST(0x0000A25B016CAA90 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (812, 38, NULL, -8.07630592, -34.89559554, CAST(0x0000A25B016CACD7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (813, 38, NULL, -8.07630592, -34.89559554, CAST(0x0000A25B016CACEB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (814, 38, NULL, -8.0763973, -34.89584312, CAST(0x0000A25B016CAF3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (815, 38, NULL, -8.0763973, -34.89584312, CAST(0x0000A25B016CAF49 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (816, 38, NULL, -8.07648959, -34.89608455, CAST(0x0000A25B016CB183 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (817, 38, NULL, -8.07648959, -34.89608455, CAST(0x0000A25B016CB198 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (818, 38, NULL, -8.07657127, -34.89634898, CAST(0x0000A25B016CB3DC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (819, 38, NULL, -8.07657127, -34.89634898, CAST(0x0000A25B016CB3F5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (820, 38, NULL, -8.07664785, -34.89658224, CAST(0x0000A25B016CB633 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (821, 38, NULL, -8.07664785, -34.89658224, CAST(0x0000A25B016CB648 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (822, 38, NULL, -8.07672437, -34.89681295, CAST(0x0000A25B016CB898 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (823, 38, NULL, -8.07672437, -34.89681295, CAST(0x0000A25B016CB89A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (824, 38, NULL, -8.07679368, -34.89704315, CAST(0x0000A25B016CBAE5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (825, 38, NULL, -8.07679368, -34.89704315, CAST(0x0000A25B016CBAF4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (826, 38, NULL, -8.07686195, -34.89726693, CAST(0x0000A25B016CBD39 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (827, 38, NULL, -8.07686195, -34.89726693, CAST(0x0000A25B016CBD3D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (828, 38, NULL, -8.07693775, -34.89748364, CAST(0x0000A25B016CBF94 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (829, 38, NULL, -8.07693775, -34.89748364, CAST(0x0000A25B016CBFA9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (830, 38, NULL, -8.07700701, -34.8977034, CAST(0x0000A25B016CC1EC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (831, 38, NULL, -8.07700701, -34.8977034, CAST(0x0000A25B016CC208 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (832, 38, NULL, -8.07708102, -34.89793262, CAST(0x0000A25B016CC446 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (833, 38, NULL, -8.07708102, -34.89793262, CAST(0x0000A25B016CC45A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (834, 38, NULL, -8.07715492, -34.89817346, CAST(0x0000A25B016CC69D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (835, 38, NULL, -8.07715492, -34.89817346, CAST(0x0000A25B016CC6AE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (836, 38, NULL, -8.07723029, -34.89840911, CAST(0x0000A25B016CC8FF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (837, 38, NULL, -8.07723029, -34.89840911, CAST(0x0000A25B016CC900 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (838, 38, NULL, -8.07732327, -34.89861465, CAST(0x0000A25B016CCB51 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (839, 38, NULL, -8.07732327, -34.89861465, CAST(0x0000A25B016CCB53 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (840, 38, NULL, -8.07738426, -34.89881918, CAST(0x0000A25B016CCDA3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (841, 38, NULL, -8.07738426, -34.89881918, CAST(0x0000A25B016CCDA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (842, 38, NULL, -8.07744738, -34.8990143, CAST(0x0000A25B016CCFFF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (843, 38, NULL, -8.07744738, -34.8990143, CAST(0x0000A25B016CD013 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (844, 38, NULL, -8.07751974, -34.89922059, CAST(0x0000A25B016CD255 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (845, 38, NULL, -8.07751974, -34.89922059, CAST(0x0000A25B016CD26B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (846, 38, NULL, -8.07758789, -34.89944538, CAST(0x0000A25B016CD4AE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (847, 38, NULL, -8.07758789, -34.89944538, CAST(0x0000A25B016CD4C2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (848, 38, NULL, -8.07767027, -34.89967204, CAST(0x0000A25B016CD700 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (849, 38, NULL, -8.07767027, -34.89967204, CAST(0x0000A25B016CD701 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (850, 38, NULL, -8.07774525, -34.89989407, CAST(0x0000A25B016CD969 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (851, 38, NULL, -8.07774525, -34.89989407, CAST(0x0000A25B016CD96A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (852, 38, NULL, -8.07780901, -34.90011216, CAST(0x0000A25B016CDBB4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (853, 38, NULL, -8.07780901, -34.90011216, CAST(0x0000A25B016CDBCC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (854, 38, NULL, -8.07790546, -34.90034628, CAST(0x0000A25B016CDF3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (855, 38, NULL, -8.07790546, -34.90034628, CAST(0x0000A25B016CDF57 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (856, 38, NULL, -8.07795591, -34.9005434, CAST(0x0000A25B016CE18F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (857, 38, NULL, -8.07795591, -34.9005434, CAST(0x0000A25B016CE1A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (858, 38, NULL, -8.07800808, -34.90075193, CAST(0x0000A25B016CE3E6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (859, 38, NULL, -8.07800808, -34.90075193, CAST(0x0000A25B016CE402 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (860, 38, NULL, -8.07807027, -34.90097121, CAST(0x0000A25B016CE645 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (861, 38, NULL, -8.07807027, -34.90097121, CAST(0x0000A25B016CE65F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (862, 38, NULL, -8.07813697, -34.90118868, CAST(0x0000A25B016CE899 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (863, 38, NULL, -8.07813697, -34.90118868, CAST(0x0000A25B016CE8B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (864, 38, NULL, -8.07819897, -34.90140052, CAST(0x0000A25B016CEAF0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (865, 38, NULL, -8.07819897, -34.90140052, CAST(0x0000A25B016CEB0C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (866, 38, NULL, -8.07826594, -34.90161194, CAST(0x0000A25B016CED4A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (867, 38, NULL, -8.07826594, -34.90161194, CAST(0x0000A25B016CED65 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (868, 38, NULL, -8.07833549, -34.90182219, CAST(0x0000A25B016CEFA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (869, 38, NULL, -8.07833549, -34.90182219, CAST(0x0000A25B016CEFBC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (870, 38, NULL, -8.07842666, -34.90205581, CAST(0x0000A25B016CF324 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (871, 38, NULL, -8.07842666, -34.90205581, CAST(0x0000A25B016CF33E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (872, 38, NULL, -8.07850504, -34.90223929, CAST(0x0000A25B016CF7DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (873, 38, NULL, -8.07850504, -34.90223929, CAST(0x0000A25B016CF7F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (874, 38, NULL, -8.07858333, -34.90242772, CAST(0x0000A25B016D178E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (875, 38, NULL, -8.07858333, -34.90242772, CAST(0x0000A25B016D1790 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (876, 38, NULL, -8.0786596, -34.90262778, CAST(0x0000A25B016D1D58 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (877, 38, NULL, -8.0786596, -34.90262778, CAST(0x0000A25B016D1D71 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (878, 38, NULL, -8.07872926, -34.90281262, CAST(0x0000A25B016D2331 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (879, 38, NULL, -8.07872926, -34.90281262, CAST(0x0000A25B016D234F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (880, 38, NULL, -8.0788006, -34.90298851, CAST(0x0000A25B016D2911 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (881, 38, NULL, -8.0788006, -34.90298851, CAST(0x0000A25B016D292B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (882, 38, NULL, -8.07887799, -34.90318363, CAST(0x0000A25B016D2EEC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (883, 38, NULL, -8.07887799, -34.90318363, CAST(0x0000A25B016D2F07 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (884, 38, NULL, -8.07895128, -34.90335611, CAST(0x0000A25B016D3722 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (885, 38, NULL, -8.07895128, -34.90335611, CAST(0x0000A25B016D373C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (886, 38, NULL, -8.07901904, -34.90353258, CAST(0x0000A25B016D7792 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (887, 38, NULL, -8.07901904, -34.90353258, CAST(0x0000A25B016D77B9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (888, 38, NULL, -8.07909751, -34.9037053, CAST(0x0000A25B016D7D6C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (889, 38, NULL, -8.07909751, -34.9037053, CAST(0x0000A25B016D7D7F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (890, 38, NULL, -8.07919199, -34.90387841, CAST(0x0000A25B016D834C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (891, 38, NULL, -8.07919199, -34.90387841, CAST(0x0000A25B016D8366 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (892, 38, NULL, -8.07928536, -34.90403722, CAST(0x0000A25B016D8928 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (893, 38, NULL, -8.07928536, -34.90403722, CAST(0x0000A25B016D8941 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (894, 38, NULL, -8.07939672, -34.90420364, CAST(0x0000A25B016D8F04 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (895, 38, NULL, -8.07939672, -34.90420364, CAST(0x0000A25B016D8F23 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (896, 38, NULL, -8.07951971, -34.90439289, CAST(0x0000A25B016D93AE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (897, 38, NULL, -8.07951971, -34.90439289, CAST(0x0000A25B016D93C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (898, 38, NULL, -8.07963006, -34.90455672, CAST(0x0000A25B016D9988 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (899, 38, NULL, -8.07963006, -34.90455672, CAST(0x0000A25B016D9993 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (900, 38, NULL, -8.07974769, -34.90474257, CAST(0x0000A25B016D9F6A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (901, 38, NULL, -8.07974769, -34.90474257, CAST(0x0000A25B016D9F82 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (902, 38, NULL, -8.07985406, -34.90494092, CAST(0x0000A25B016DA670 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (903, 38, NULL, -8.07985406, -34.90494092, CAST(0x0000A25B016DA68C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (904, 38, NULL, -8.07996591, -34.90512875, CAST(0x0000A25B016DAD79 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (905, 38, NULL, -8.07996591, -34.90512875, CAST(0x0000A25B016DAD8F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (906, 38, NULL, -8.08007222, -34.905334, CAST(0x0000A25B016DB22A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (907, 38, NULL, -8.08007222, -34.905334, CAST(0x0000A25B016DB243 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (908, 38, NULL, -8.08017468, -34.9055162, CAST(0x0000A25B016DB5AE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (909, 38, NULL, -8.08017468, -34.9055162, CAST(0x0000A25B016DB5C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (910, 38, NULL, -8.0802872, -34.90570604, CAST(0x0000A25B016DB930 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (911, 38, NULL, -8.0802872, -34.90570604, CAST(0x0000A25B016DB94C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (912, 38, NULL, -8.08043408, -34.90584153, CAST(0x0000A25B016DBCB9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (913, 38, NULL, -8.08043408, -34.90584153, CAST(0x0000A25B016DBCD2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (914, 38, NULL, -8.08059975, -34.90591595, CAST(0x0000A25B016DC03A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (915, 38, NULL, -8.08059975, -34.90591595, CAST(0x0000A25B016DC04E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (916, 38, NULL, -8.08078815, -34.90597965, CAST(0x0000A25B016DC4EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (917, 38, NULL, -8.08078815, -34.90597965, CAST(0x0000A25B016DC506 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (918, 38, NULL, -8.08098859, -34.90605075, CAST(0x0000A25B016DC99E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (919, 38, NULL, -8.08098859, -34.90605075, CAST(0x0000A25B016DC9B9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (920, 38, NULL, -8.08118899, -34.90612641, CAST(0x0000A25B016DCD1B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (921, 38, NULL, -8.08118899, -34.90612641, CAST(0x0000A25B016DCD31 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (922, 38, NULL, -8.08141813, -34.90619787, CAST(0x0000A25B016DD0A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (923, 38, NULL, -8.08141813, -34.90619787, CAST(0x0000A25B016DD0C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (924, 38, NULL, -8.08159191, -34.90626148, CAST(0x0000A25B016DD2FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (925, 38, NULL, -8.08159191, -34.90626148, CAST(0x0000A25B016DD314 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (926, 38, NULL, -8.08184158, -34.90634916, CAST(0x0000A25B016DD67D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (927, 38, NULL, -8.08184158, -34.90634916, CAST(0x0000A25B016DD691 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (928, 38, NULL, -8.08202813, -34.90640428, CAST(0x0000A25B016DDA02 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (929, 38, NULL, -8.08202813, -34.90640428, CAST(0x0000A25B016DDA17 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (930, 38, NULL, -8.08223859, -34.90648019, CAST(0x0000A25B016DDEB2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (931, 38, NULL, -8.08223859, -34.90648019, CAST(0x0000A25B016DDECC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (932, 38, NULL, -8.08240657, -34.9065467, CAST(0x0000A25B016E0C68 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (933, 38, NULL, -8.08240657, -34.9065467, CAST(0x0000A25B016E0C7D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (934, 38, NULL, -8.08263803, -34.90663523, CAST(0x0000A25B016E149F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (935, 38, NULL, -8.08263803, -34.90663523, CAST(0x0000A25B016E14B9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (936, 38, NULL, -8.08282406, -34.90670814, CAST(0x0000A25B016E1834 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (937, 38, NULL, -8.08282406, -34.90670814, CAST(0x0000A25B016E1843 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (938, 38, NULL, -8.0830518, -34.90677354, CAST(0x0000A25B016E1BA5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (939, 38, NULL, -8.0830518, -34.90677354, CAST(0x0000A25B016E1BC0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (940, 38, NULL, -8.08330468, -34.90684087, CAST(0x0000A25B016E1F28 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (941, 38, NULL, -8.08330468, -34.90684087, CAST(0x0000A25B016E1F44 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (942, 38, NULL, -8.08355684, -34.90690569, CAST(0x0000A25B016E22AE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (943, 38, NULL, -8.08355684, -34.90690569, CAST(0x0000A25B016E22C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (944, 38, NULL, -8.08374997, -34.90695632, CAST(0x0000A25B016E2504 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (945, 38, NULL, -8.08374997, -34.90695632, CAST(0x0000A25B016E2522 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (946, 38, NULL, -8.08395752, -34.90700964, CAST(0x0000A25B016E2759 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (947, 38, NULL, -8.08395752, -34.90700964, CAST(0x0000A25B016E2775 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (948, 38, NULL, -8.08418361, -34.90705938, CAST(0x0000A25B016E29B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (949, 38, NULL, -8.08418361, -34.90705938, CAST(0x0000A25B016E29CF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (950, 38, NULL, -8.08443129, -34.90712447, CAST(0x0000A25B016E2C0C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (951, 38, NULL, -8.08443129, -34.90712447, CAST(0x0000A25B016E2C2D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (952, 38, NULL, -8.08469518, -34.90719272, CAST(0x0000A25B016E2E64 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (953, 38, NULL, -8.08469518, -34.90719272, CAST(0x0000A25B016E2E7F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (954, 38, NULL, -8.08497146, -34.90726123, CAST(0x0000A25B016E30BC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (955, 38, NULL, -8.08497146, -34.90726123, CAST(0x0000A25B016E30D7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (956, 38, NULL, -8.0852302, -34.90732022, CAST(0x0000A25B016E3315 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (957, 38, NULL, -8.0852302, -34.90732022, CAST(0x0000A25B016E332F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (958, 38, NULL, -8.08547152, -34.90737549, CAST(0x0000A25B016E356C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (959, 38, NULL, -8.08547152, -34.90737549, CAST(0x0000A25B016E3589 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (960, 38, NULL, -8.08572263, -34.90743013, CAST(0x0000A25B016E37D8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (961, 38, NULL, -8.08572263, -34.90743013, CAST(0x0000A25B016E37F2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (962, 38, NULL, -8.0859682, -34.90749414, CAST(0x0000A25B016E3A1C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (963, 38, NULL, -8.0859682, -34.90749414, CAST(0x0000A25B016E3A38 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (964, 38, NULL, -8.08619265, -34.90754312, CAST(0x0000A25B016E3C75 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (965, 38, NULL, -8.08619265, -34.90754312, CAST(0x0000A25B016E3C94 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (966, 38, NULL, -8.08641841, -34.90760423, CAST(0x0000A25B016E3ECD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (967, 38, NULL, -8.08641841, -34.90760423, CAST(0x0000A25B016E3EE7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (968, 38, NULL, -8.08664478, -34.90766348, CAST(0x0000A25B016E4125 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (969, 38, NULL, -8.08664478, -34.90766348, CAST(0x0000A25B016E413F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (970, 38, NULL, -8.08686697, -34.90770954, CAST(0x0000A25B016E4379 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (971, 38, NULL, -8.08686697, -34.90770954, CAST(0x0000A25B016E4393 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (972, 38, NULL, -8.08708623, -34.90775872, CAST(0x0000A25B016E45D5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (973, 38, NULL, -8.08708623, -34.90775872, CAST(0x0000A25B016E45EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (974, 38, NULL, -8.08730771, -34.90780605, CAST(0x0000A25B016E4828 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (975, 38, NULL, -8.08730771, -34.90780605, CAST(0x0000A25B016E483F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (976, 38, NULL, -8.08752153, -34.90785741, CAST(0x0000A25B016E4A85 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (977, 38, NULL, -8.08752153, -34.90785741, CAST(0x0000A25B016E4A9F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (978, 38, NULL, -8.08770073, -34.90790932, CAST(0x0000A25B016E4CD7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (979, 38, NULL, -8.08770073, -34.90790932, CAST(0x0000A25B016E4CF7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (980, 38, NULL, -8.08792282, -34.90797143, CAST(0x0000A25B016E505F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (981, 38, NULL, -8.08792282, -34.90797143, CAST(0x0000A25B016E507A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (982, 38, NULL, -8.08813664, -34.90801506, CAST(0x0000A25B016E5529 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (983, 38, NULL, -8.08813664, -34.90801506, CAST(0x0000A25B016E5534 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (984, 38, NULL, -8.08831522, -34.9080503, CAST(0x0000A25B016E68FD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (985, 38, NULL, -8.08831522, -34.9080503, CAST(0x0000A25B016E6917 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (986, 38, NULL, -8.08850709, -34.90809324, CAST(0x0000A25B016E725C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (987, 38, NULL, -8.08850709, -34.90809324, CAST(0x0000A25B016E7279 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (988, 38, NULL, -8.08869995, -34.90814052, CAST(0x0000A25B016E7BC5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (989, 38, NULL, -8.08869995, -34.90814052, CAST(0x0000A25B016E7BC6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (990, 38, NULL, -8.08890304, -34.90816784, CAST(0x0000A25B016E8AF8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (991, 38, NULL, -8.08890304, -34.90816784, CAST(0x0000A25B016E8B10 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (992, 38, NULL, -8.08908542, -34.9082045, CAST(0x0000A25B016E9580 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (993, 38, NULL, -8.08908542, -34.9082045, CAST(0x0000A25B016E9595 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (994, 38, NULL, -8.08929131, -34.9082509, CAST(0x0000A25B016E9DB7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (995, 38, NULL, -8.08929131, -34.9082509, CAST(0x0000A25B016E9DCB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (996, 38, NULL, -8.08947033, -34.90829424, CAST(0x0000A25B016EA5EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (997, 38, NULL, -8.08947033, -34.90829424, CAST(0x0000A25B016EA5FF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (998, 38, NULL, -8.08966274, -34.90828219, CAST(0x0000A25B016F04D7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (999, 38, NULL, -8.08966274, -34.90828219, CAST(0x0000A25B016F04EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1000, 38, NULL, -8.08991348, -34.90832102, CAST(0x0000A25B016F0BE0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1001, 38, NULL, -8.08991348, -34.90832102, CAST(0x0000A25B016F0BF7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1002, 38, NULL, -8.09011524, -34.90837178, CAST(0x0000A25B016F0F64 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1003, 38, NULL, -8.09011524, -34.90837178, CAST(0x0000A25B016F0F7A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1004, 38, NULL, -8.09033919, -34.9084307, CAST(0x0000A25B016F12E5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1005, 38, NULL, -8.09033919, -34.9084307, CAST(0x0000A25B016F12FA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1006, 38, NULL, -8.09054926, -34.90847381, CAST(0x0000A25B016F167E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1007, 38, NULL, -8.09054926, -34.90847381, CAST(0x0000A25B016F1692 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1008, 38, NULL, -8.09072589, -34.90851975, CAST(0x0000A25B016F19F1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1009, 38, NULL, -8.09072589, -34.90851975, CAST(0x0000A25B016F1A07 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1010, 38, NULL, -8.09089406, -34.90860208, CAST(0x0000A25B016F1E9D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1011, 38, NULL, -8.09089406, -34.90860208, CAST(0x0000A25B016F1EAE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1012, 38, NULL, -8.09108489, -34.90866182, CAST(0x0000A25B016F5BAC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1013, 38, NULL, -8.09108489, -34.90866182, CAST(0x0000A25B016F5BBC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1014, 38, NULL, -8.09124008, -34.90880017, CAST(0x0000A25B016F604A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1015, 38, NULL, -8.09124008, -34.90880017, CAST(0x0000A25B016F6058 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1016, 38, NULL, -8.09128057, -34.90905175, CAST(0x0000A25B016F6547 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1017, 38, NULL, -8.09128057, -34.90905175, CAST(0x0000A25B016F6549 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1018, 38, NULL, -8.09125716, -34.90931885, CAST(0x0000A25B016F69E5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1019, 38, NULL, -8.09125716, -34.90931885, CAST(0x0000A25B016F6A04 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1020, 38, NULL, -8.09120449, -34.90950399, CAST(0x0000A25B016F6D71 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1021, 38, NULL, -8.09120449, -34.90950399, CAST(0x0000A25B016F6D84 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1022, 38, NULL, -8.09114363, -34.90970292, CAST(0x0000A25B016F7463 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1023, 38, NULL, -8.09114363, -34.90970292, CAST(0x0000A25B016F7476 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1024, 38, NULL, -8.09112058, -34.90989191, CAST(0x0000A25B016F93C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1025, 38, NULL, -8.09112058, -34.90989191, CAST(0x0000A25B016F93CD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1026, 38, NULL, -8.09109187, -34.9100726, CAST(0x0000A25B016F9D32 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1027, 38, NULL, -8.09109187, -34.9100726, CAST(0x0000A25B016F9D45 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1028, 38, NULL, -8.09106867, -34.91025904, CAST(0x0000A25B016FE959 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1029, 38, NULL, -8.09106867, -34.91025904, CAST(0x0000A25B016FE970 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1030, 38, NULL, -8.09102758, -34.91044799, CAST(0x0000A25B016FF3EA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1031, 38, NULL, -8.09102758, -34.91044799, CAST(0x0000A25B016FF402 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1032, 38, NULL, -8.09098822, -34.91063582, CAST(0x0000A25B016FFAF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1033, 38, NULL, -8.09098822, -34.91063582, CAST(0x0000A25B016FFB0A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1034, 38, NULL, -8.09106922, -34.9108131, CAST(0x0000A25B016FFFA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1035, 38, NULL, -8.09106922, -34.9108131, CAST(0x0000A25B016FFFBB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1036, 38, NULL, -8.09127023, -34.9108584, CAST(0x0000A25B01700321 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1037, 38, NULL, -8.09127023, -34.9108584, CAST(0x0000A25B01700330 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1038, 38, NULL, -8.09144728, -34.91089531, CAST(0x0000A25B017005A4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1039, 38, NULL, -8.09144728, -34.91089531, CAST(0x0000A25B017005A6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1040, 38, NULL, -8.09164412, -34.91093532, CAST(0x0000A25B017007CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1041, 38, NULL, -8.09164412, -34.91093532, CAST(0x0000A25B017007E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1042, 38, NULL, -8.09184676, -34.91097851, CAST(0x0000A25B01700A2E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1043, 38, NULL, -8.09184676, -34.91097851, CAST(0x0000A25B01700A46 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1044, 38, NULL, -8.09205446, -34.91102559, CAST(0x0000A25B01700C82 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1045, 38, NULL, -8.09205446, -34.91102559, CAST(0x0000A25B01700C9C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1046, 38, NULL, -8.0922569, -34.91106395, CAST(0x0000A25B01700EDC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1047, 38, NULL, -8.0922569, -34.91106395, CAST(0x0000A25B01700EF5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1048, 38, NULL, -8.09244469, -34.91111292, CAST(0x0000A25B01701131 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1049, 38, NULL, -8.09244469, -34.91111292, CAST(0x0000A25B01701141 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1050, 38, NULL, -8.09264252, -34.9111553, CAST(0x0000A25B0170138D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1051, 38, NULL, -8.09264252, -34.9111553, CAST(0x0000A25B017013AB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1052, 38, NULL, -8.0928591, -34.9112037, CAST(0x0000A25B017015E4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1053, 38, NULL, -8.0928591, -34.9112037, CAST(0x0000A25B017015F9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1054, 38, NULL, -8.09308826, -34.91124722, CAST(0x0000A25B0170183C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1055, 38, NULL, -8.09308826, -34.91124722, CAST(0x0000A25B01701855 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1056, 38, NULL, -8.09331816, -34.91130469, CAST(0x0000A25B01701A93 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1057, 38, NULL, -8.09331816, -34.91130469, CAST(0x0000A25B01701AA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1058, 38, NULL, -8.093549, -34.91135608, CAST(0x0000A25B01701CE9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1059, 38, NULL, -8.093549, -34.91135608, CAST(0x0000A25B01701D01 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1060, 38, NULL, -8.09378148, -34.91140924, CAST(0x0000A25B01701F3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1061, 38, NULL, -8.09378148, -34.91140924, CAST(0x0000A25B01701F56 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1062, 38, NULL, -8.0940046, -34.91146071, CAST(0x0000A25B0170219D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1063, 38, NULL, -8.0940046, -34.91146071, CAST(0x0000A25B017021B4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1064, 38, NULL, -8.09421753, -34.91150915, CAST(0x0000A25B017023FB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1065, 38, NULL, -8.09421753, -34.91150915, CAST(0x0000A25B0170240F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1066, 38, NULL, -8.09442835, -34.91155673, CAST(0x0000A25B01702659 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1067, 38, NULL, -8.09442835, -34.91155673, CAST(0x0000A25B01702670 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1068, 38, NULL, -8.09464106, -34.91160494, CAST(0x0000A25B017028E1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1069, 38, NULL, -8.09464106, -34.91160494, CAST(0x0000A25B017028F5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1070, 38, NULL, -8.09482874, -34.91165638, CAST(0x0000A25B01702B1D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1071, 38, NULL, -8.09482874, -34.91165638, CAST(0x0000A25B01702B37 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1072, 38, NULL, -8.09503838, -34.9117135, CAST(0x0000A25B01702E8A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1073, 38, NULL, -8.09503838, -34.9117135, CAST(0x0000A25B01702E9D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1074, 38, NULL, -8.09521746, -34.91176105, CAST(0x0000A25B01703229 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1075, 38, NULL, -8.09521746, -34.91176105, CAST(0x0000A25B01703242 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1076, 38, NULL, -8.09544061, -34.91180976, CAST(0x0000A25B017036B8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1077, 38, NULL, -8.09544061, -34.91180976, CAST(0x0000A25B017036D1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1078, 38, NULL, -8.09562113, -34.91184959, CAST(0x0000A25B01703CA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1079, 38, NULL, -8.09562113, -34.91184959, CAST(0x0000A25B01703CBC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1080, 38, NULL, -8.09580786, -34.91186945, CAST(0x0000A25B017053FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1081, 38, NULL, -8.09580786, -34.91186945, CAST(0x0000A25B0170540F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1082, 38, NULL, -8.09598729, -34.91189987, CAST(0x0000A25B017058AD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1083, 38, NULL, -8.09598729, -34.91189987, CAST(0x0000A25B017058C5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1084, 38, NULL, -8.09619562, -34.91195104, CAST(0x0000A25B01705E88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1085, 38, NULL, -8.09619562, -34.91195104, CAST(0x0000A25B01705EA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1086, 38, NULL, -8.09638292, -34.91199427, CAST(0x0000A25B017075F4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1087, 38, NULL, -8.09638292, -34.91199427, CAST(0x0000A25B01707603 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1088, 38, NULL, -8.0965934999999991, -34.91204469, CAST(0x0000A25B01707ABA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1089, 38, NULL, -8.0965934999999991, -34.91204469, CAST(0x0000A25B01707AC7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1090, 38, NULL, -8.09678138, -34.91207959, CAST(0x0000A25B01707E99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1091, 38, NULL, -8.09678138, -34.91207959, CAST(0x0000A25B01707EA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1092, 38, NULL, -8.09698466, -34.91212787, CAST(0x0000A25B017081B2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1093, 38, NULL, -8.09698466, -34.91212787, CAST(0x0000A25B017081C4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1094, 38, NULL, -8.09720402, -34.91217749, CAST(0x0000A25B017086BE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1095, 38, NULL, -8.09720402, -34.91217749, CAST(0x0000A25B017086D4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1096, 38, NULL, -8.09740203, -34.91220378, CAST(0x0000A25B0170BD9C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1097, 38, NULL, -8.09740203, -34.91220378, CAST(0x0000A25B0170BDB0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1098, 38, NULL, -8.09759724, -34.9122479, CAST(0x0000A25B0170C382 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1099, 38, NULL, -8.09759724, -34.9122479, CAST(0x0000A25B0170C396 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1100, 38, NULL, -8.09780876, -34.91228656, CAST(0x0000A25B0170C810 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1101, 38, NULL, -8.09780876, -34.91228656, CAST(0x0000A25B0170C824 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1102, 38, NULL, -8.09797253, -34.91220692, CAST(0x0000A25B0170CF42 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1103, 38, NULL, -8.09797253, -34.91220692, CAST(0x0000A25B0170CF55 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1104, 38, NULL, -8.09804129, -34.91199797, CAST(0x0000A25B0170D615 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1105, 38, NULL, -8.09804129, -34.91199797, CAST(0x0000A25B0170D62A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1106, 38, NULL, -8.09808908, -34.91179146, CAST(0x0000A25B0170DAC2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1107, 38, NULL, -8.09808908, -34.91179146, CAST(0x0000A25B0170DAD6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1108, 38, NULL, -8.0981346, -34.91161329, CAST(0x0000A25B0170DF7A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1109, 38, NULL, -8.0981346, -34.91161329, CAST(0x0000A25B0170DF88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1110, 38, NULL, -8.0981968, -34.911415, CAST(0x0000A25B0170E55F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1111, 38, NULL, -8.0981968, -34.911415, CAST(0x0000A25B0170E573 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1112, 38, NULL, -8.09824588, -34.91118123, CAST(0x0000A25B0170EA19 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1113, 38, NULL, -8.09824588, -34.91118123, CAST(0x0000A25B0170EA2C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1114, 38, NULL, -8.09829148, -34.91098528, CAST(0x0000A25B0170ED9F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1115, 38, NULL, -8.09829148, -34.91098528, CAST(0x0000A25B0170EDB4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1116, 38, NULL, -8.09831783, -34.91078374, CAST(0x0000A25B0170F23E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1117, 38, NULL, -8.09831783, -34.91078374, CAST(0x0000A25B0170F24E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1118, 38, NULL, -8.09834409, -34.91056986, CAST(0x0000A25B0170F820 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1119, 38, NULL, -8.09834409, -34.91056986, CAST(0x0000A25B0170F832 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1120, 38, NULL, -8.09838584, -34.91037089, CAST(0x0000A25B0170FF64 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1121, 38, NULL, -8.09838584, -34.91037089, CAST(0x0000A25B0170FF77 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1122, 38, NULL, -8.09853539, -34.9102022, CAST(0x0000A25B01710500 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1123, 38, NULL, -8.09853539, -34.9102022, CAST(0x0000A25B01710512 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1124, 38, NULL, -8.09873295, -34.91020476, CAST(0x0000A25B01710882 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1125, 38, NULL, -8.09873295, -34.91020476, CAST(0x0000A25B017108F1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1126, 38, NULL, -8.09901563, -34.91021336, CAST(0x0000A25B01710BFC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1127, 38, NULL, -8.09901563, -34.91021336, CAST(0x0000A25B01710C0E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1128, 38, NULL, -8.09922524, -34.91022082, CAST(0x0000A25B01710E60 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1129, 38, NULL, -8.09922524, -34.91022082, CAST(0x0000A25B01710E72 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1130, 38, NULL, -8.09943766, -34.91023107, CAST(0x0000A25B017110B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1131, 38, NULL, -8.09943766, -34.91023107, CAST(0x0000A25B017110C4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1132, 38, NULL, -8.09967123, -34.91024884, CAST(0x0000A25B0171132E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1133, 38, NULL, -8.09967123, -34.91024884, CAST(0x0000A25B0171133F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1134, 38, NULL, -8.09993439, -34.91028336, CAST(0x0000A25B01711562 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1135, 38, NULL, -8.09993439, -34.91028336, CAST(0x0000A25B01711575 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1136, 38, NULL, -8.1002078, -34.91031347, CAST(0x0000A25B017117BA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1137, 38, NULL, -8.1002078, -34.91031347, CAST(0x0000A25B017117CD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1138, 38, NULL, -8.10047593, -34.91034626, CAST(0x0000A25B01711A3F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1139, 38, NULL, -8.10047593, -34.91034626, CAST(0x0000A25B01711A51 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1140, 38, NULL, -8.10074116, -34.91038969, CAST(0x0000A25B01711CBC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1141, 38, NULL, -8.10074116, -34.91038969, CAST(0x0000A25B01711CCF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1142, 38, NULL, -8.10100709, -34.91044243, CAST(0x0000A25B01711F0F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1143, 38, NULL, -8.10100709, -34.91044243, CAST(0x0000A25B01711F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1144, 38, NULL, -8.10127808, -34.9104981, CAST(0x0000A25B01712110 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1145, 38, NULL, -8.10127808, -34.9104981, CAST(0x0000A25B0171211D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1146, 38, NULL, -8.10155887, -34.9105567, CAST(0x0000A25B01712369 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1147, 38, NULL, -8.10155887, -34.9105567, CAST(0x0000A25B0171237E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1148, 38, NULL, -8.10185483, -34.91062472, CAST(0x0000A25B017125C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1149, 38, NULL, -8.10185483, -34.91062472, CAST(0x0000A25B017125D4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1150, 38, NULL, -8.10214067, -34.91068332, CAST(0x0000A25B0171281D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1151, 38, NULL, -8.10214067, -34.91068332, CAST(0x0000A25B0171282F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1152, 38, NULL, -8.10241111, -34.91073609, CAST(0x0000A25B01712A75 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1153, 38, NULL, -8.10241111, -34.91073609, CAST(0x0000A25B01712A88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1154, 38, NULL, -8.10267137, -34.91078669, CAST(0x0000A25B01712CC9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1155, 38, NULL, -8.10267137, -34.91078669, CAST(0x0000A25B01712CE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1156, 38, NULL, -8.10292782, -34.91083721, CAST(0x0000A25B01712F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1157, 38, NULL, -8.10292782, -34.91083721, CAST(0x0000A25B01712F33 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1158, 38, NULL, -8.10317178, -34.91088291, CAST(0x0000A25B0171317C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1159, 38, NULL, -8.10317178, -34.91088291, CAST(0x0000A25B0171318C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1160, 38, NULL, -8.10340281, -34.91092963, CAST(0x0000A25B017133D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1161, 38, NULL, -8.10340281, -34.91092963, CAST(0x0000A25B017133E8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1162, 38, NULL, -8.10362182, -34.91097143, CAST(0x0000A25B0171362C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1163, 38, NULL, -8.10362182, -34.91097143, CAST(0x0000A25B0171363A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1164, 38, NULL, -8.10382807, -34.91101303, CAST(0x0000A25B01713882 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1165, 38, NULL, -8.10382807, -34.91101303, CAST(0x0000A25B01713892 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1166, 38, NULL, -8.10400617, -34.91104803, CAST(0x0000A25B01713ADF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1167, 38, NULL, -8.10400617, -34.91104803, CAST(0x0000A25B01713AF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1168, 38, NULL, -8.10424432, -34.91109557, CAST(0x0000A25B01713E60 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1169, 38, NULL, -8.10424432, -34.91109557, CAST(0x0000A25B01713E71 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1170, 38, NULL, -8.10444287, -34.9111326, CAST(0x0000A25B0171430D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1171, 38, NULL, -8.10444287, -34.9111326, CAST(0x0000A25B01714320 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1172, 38, NULL, -8.10463048, -34.91117847, CAST(0x0000A25B01715E03 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1173, 38, NULL, -8.10463048, -34.91117847, CAST(0x0000A25B01715E13 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1174, 38, NULL, -8.10486399, -34.91121777, CAST(0x0000A25B017162B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1175, 38, NULL, -8.10486399, -34.91121777, CAST(0x0000A25B017162C9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1176, 38, NULL, -8.10509262, -34.91126045, CAST(0x0000A25B01716637 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1177, 38, NULL, -8.10509262, -34.91126045, CAST(0x0000A25B01716646 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1178, 38, NULL, -8.10527335, -34.91129673, CAST(0x0000A25B0171688D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1179, 38, NULL, -8.10527335, -34.91129673, CAST(0x0000A25B017168A3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1180, 38, NULL, -8.10547164, -34.9113373, CAST(0x0000A25B01716AE7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1181, 38, NULL, -8.10547164, -34.9113373, CAST(0x0000A25B01716AFA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1182, 38, NULL, -8.10568568, -34.91138016, CAST(0x0000A25B01716D3F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1183, 38, NULL, -8.10568568, -34.91138016, CAST(0x0000A25B01716D52 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1184, 38, NULL, -8.10590976, -34.91142144, CAST(0x0000A25B01716F95 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1185, 38, NULL, -8.10590976, -34.91142144, CAST(0x0000A25B01716FA9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1186, 38, NULL, -8.10613254, -34.91146781, CAST(0x0000A25B017171EF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1187, 38, NULL, -8.10613254, -34.91146781, CAST(0x0000A25B01717203 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1188, 38, NULL, -8.10634305, -34.91151283, CAST(0x0000A25B01717447 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1189, 38, NULL, -8.10634305, -34.91151283, CAST(0x0000A25B0171745B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1190, 38, NULL, -8.10653762, -34.91154921, CAST(0x0000A25B017176A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1191, 38, NULL, -8.10653762, -34.91154921, CAST(0x0000A25B017176EE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1192, 38, NULL, -8.10678182, -34.91160059, CAST(0x0000A25B01717A24 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1193, 38, NULL, -8.10678182, -34.91160059, CAST(0x0000A25B01717A34 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1194, 38, NULL, -8.10698161, -34.91164468, CAST(0x0000A25B01717DA8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1195, 38, NULL, -8.10698161, -34.91164468, CAST(0x0000A25B01717DC3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1196, 38, NULL, -8.10715977, -34.91167543, CAST(0x0000A25B01718708 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1197, 38, NULL, -8.10715977, -34.91167543, CAST(0x0000A25B01718722 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1198, 38, NULL, -8.10735572, -34.91172064, CAST(0x0000A25B0171977E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1199, 38, NULL, -8.10735572, -34.91172064, CAST(0x0000A25B0171979D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1200, 38, NULL, -8.10758351, -34.91177086, CAST(0x0000A25B01719C1B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1201, 38, NULL, -8.10758351, -34.91177086, CAST(0x0000A25B01719C2B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1202, 38, NULL, -8.10779155, -34.91181313, CAST(0x0000A25B01719F9F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1203, 38, NULL, -8.10779155, -34.91181313, CAST(0x0000A25B01719FB1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1204, 38, NULL, -8.10797031, -34.91184321, CAST(0x0000A25B0171A324 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1205, 38, NULL, -8.10797031, -34.91184321, CAST(0x0000A25B0171A339 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1206, 38, NULL, -8.10818199, -34.91188279, CAST(0x0000A25B0171A7D5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1207, 38, NULL, -8.10818199, -34.91188279, CAST(0x0000A25B0171A7FE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1208, 38, NULL, -8.10839969, -34.91192522, CAST(0x0000A25B0171AB6B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1209, 38, NULL, -8.10839969, -34.91192522, CAST(0x0000A25B0171AB83 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1210, 38, NULL, -8.10857945, -34.91195991, CAST(0x0000A25B0171ADB2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1211, 38, NULL, -8.10857945, -34.91195991, CAST(0x0000A25B0171ADC6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1212, 38, NULL, -8.10877928, -34.912001, CAST(0x0000A25B0171B00A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1213, 38, NULL, -8.10877928, -34.912001, CAST(0x0000A25B0171B019 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1214, 38, NULL, -8.1089818, -34.91203778, CAST(0x0000A25B0171B265 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1215, 38, NULL, -8.1089818, -34.91203778, CAST(0x0000A25B0171B273 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1216, 38, NULL, -8.10919351, -34.91207884, CAST(0x0000A25B0171B4B7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1217, 38, NULL, -8.10919351, -34.91207884, CAST(0x0000A25B0171B4C3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1218, 38, NULL, -8.10940271, -34.91212334, CAST(0x0000A25B0171B714 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1219, 38, NULL, -8.10940271, -34.91212334, CAST(0x0000A25B0171B733 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1220, 38, NULL, -8.10962837, -34.91216831, CAST(0x0000A25B0171B96E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1221, 38, NULL, -8.10962837, -34.91216831, CAST(0x0000A25B0171B985 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1222, 38, NULL, -8.10983511, -34.91221239, CAST(0x0000A25B0171BBC5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1223, 38, NULL, -8.10983511, -34.91221239, CAST(0x0000A25B0171BBE5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1224, 38, NULL, -8.1100353, -34.9122438, CAST(0x0000A25B0171BE1F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1225, 38, NULL, -8.1100353, -34.9122438, CAST(0x0000A25B0171BE35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1226, 38, NULL, -8.11025566, -34.91228046, CAST(0x0000A25B0171C075 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1227, 38, NULL, -8.11025566, -34.91228046, CAST(0x0000A25B0171C09A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1228, 38, NULL, -8.11048328, -34.91231747, CAST(0x0000A25B0171C2CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1229, 38, NULL, -8.11048328, -34.91231747, CAST(0x0000A25B0171C2ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1230, 38, NULL, -8.11071879, -34.91235672, CAST(0x0000A25B0171C524 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1231, 38, NULL, -8.11071879, -34.91235672, CAST(0x0000A25B0171C53F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1232, 38, NULL, -8.11094534, -34.91241024, CAST(0x0000A25B0171C77D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1233, 38, NULL, -8.11094534, -34.91241024, CAST(0x0000A25B0171C798 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1234, 38, NULL, -8.11116733, -34.91245564, CAST(0x0000A25B0171C9D5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1235, 38, NULL, -8.11116733, -34.91245564, CAST(0x0000A25B0171C9F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1236, 38, NULL, -8.11140662, -34.91250721, CAST(0x0000A25B0171CC2C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1237, 38, NULL, -8.11140662, -34.91250721, CAST(0x0000A25B0171CC46 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1238, 38, NULL, -8.11167006, -34.91255542, CAST(0x0000A25B0171CE86 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1239, 38, NULL, -8.11167006, -34.91255542, CAST(0x0000A25B0171CEA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1240, 38, NULL, -8.11192547, -34.91260922, CAST(0x0000A25B0171D0DC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1241, 38, NULL, -8.11192547, -34.91260922, CAST(0x0000A25B0171D0F8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1242, 38, NULL, -8.11218321, -34.91266059, CAST(0x0000A25B0171D334 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1243, 38, NULL, -8.11218321, -34.91266059, CAST(0x0000A25B0171D352 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1244, 38, NULL, -8.11243738, -34.91271213, CAST(0x0000A25B0171D58D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1245, 38, NULL, -8.11243738, -34.91271213, CAST(0x0000A25B0171D5AC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1246, 38, NULL, -8.11271994, -34.91277262, CAST(0x0000A25B0171D7E5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1247, 38, NULL, -8.11271994, -34.91277262, CAST(0x0000A25B0171D804 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1248, 38, NULL, -8.1129914, -34.9128248, CAST(0x0000A25B0171DA3D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1249, 38, NULL, -8.1129914, -34.9128248, CAST(0x0000A25B0171DA5B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1250, 38, NULL, -8.1132394, -34.912872899999996, CAST(0x0000A25B0171DC94 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1251, 38, NULL, -8.1132394, -34.912872899999996, CAST(0x0000A25B0171DCB0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1252, 38, NULL, -8.11349788, -34.91291872, CAST(0x0000A25B0171DEED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1253, 38, NULL, -8.11349788, -34.91291872, CAST(0x0000A25B0171DF0D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1254, 38, NULL, -8.11375262, -34.9129589, CAST(0x0000A25B0171E145 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1255, 38, NULL, -8.11375262, -34.9129589, CAST(0x0000A25B0171E165 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1256, 38, NULL, -8.11400101, -34.91301228, CAST(0x0000A25B0171E3A1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1257, 38, NULL, -8.11400101, -34.91301228, CAST(0x0000A25B0171E3BA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1258, 38, NULL, -8.11425416, -34.91307281, CAST(0x0000A25B0171E5F7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1259, 38, NULL, -8.11425416, -34.91307281, CAST(0x0000A25B0171E610 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1260, 38, NULL, -8.11450066, -34.91311695, CAST(0x0000A25B0171E866 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1261, 38, NULL, -8.11450066, -34.91311695, CAST(0x0000A25B0171E876 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1262, 38, NULL, -8.11474175, -34.91316549, CAST(0x0000A25B0171EAA8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1263, 38, NULL, -8.11474175, -34.91316549, CAST(0x0000A25B0171EAC1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1264, 38, NULL, -8.1149788, -34.91321497, CAST(0x0000A25B0171ED3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1265, 38, NULL, -8.1149788, -34.91321497, CAST(0x0000A25B0171ED52 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1266, 38, NULL, -8.11521953, -34.91325473, CAST(0x0000A25B0171EF57 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1267, 38, NULL, -8.11521953, -34.91325473, CAST(0x0000A25B0171EF72 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1268, 38, NULL, -8.11545333, -34.91329454, CAST(0x0000A25B0171F1CF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1269, 38, NULL, -8.11545333, -34.91329454, CAST(0x0000A25B0171F1F0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1270, 38, NULL, -8.11567264, -34.91333903, CAST(0x0000A25B0171F405 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1271, 38, NULL, -8.11567264, -34.91333903, CAST(0x0000A25B0171F420 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1272, 38, NULL, -8.11588907, -34.91338642, CAST(0x0000A25B0171F672 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1273, 38, NULL, -8.11588907, -34.91338642, CAST(0x0000A25B0171F68C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1274, 38, NULL, -8.11610079, -34.91341426, CAST(0x0000A25B0171F8BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1275, 38, NULL, -8.11610079, -34.91341426, CAST(0x0000A25B0171F8D7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1276, 38, NULL, -8.11632647, -34.91344886, CAST(0x0000A25B0171FB15 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1277, 38, NULL, -8.11632647, -34.91344886, CAST(0x0000A25B0171FB2F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1278, 38, NULL, -8.11655735, -34.91348742, CAST(0x0000A25B0171FD93 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1279, 38, NULL, -8.11655735, -34.91348742, CAST(0x0000A25B0171FD9A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1280, 38, NULL, -8.11679408, -34.91352964, CAST(0x0000A25B0171FFFA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1281, 38, NULL, -8.11679408, -34.91352964, CAST(0x0000A25B017200A9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1282, 38, NULL, -8.1170339, -34.91357316, CAST(0x0000A25B01720215 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1283, 38, NULL, -8.1170339, -34.91357316, CAST(0x0000A25B01720235 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1284, 38, NULL, -8.11726689, -34.91362386, CAST(0x0000A25B0172046C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1285, 38, NULL, -8.11726689, -34.91362386, CAST(0x0000A25B0172047F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1286, 38, NULL, -8.11749193, -34.91366452, CAST(0x0000A25B017206E4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1287, 38, NULL, -8.11749193, -34.91366452, CAST(0x0000A25B017206F7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1288, 38, NULL, -8.11772409, -34.91370692, CAST(0x0000A25B0172092D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1289, 38, NULL, -8.11772409, -34.91370692, CAST(0x0000A25B01720947 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1290, 38, NULL, -8.11796416, -34.9137519, CAST(0x0000A25B01720B77 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1291, 38, NULL, -8.11796416, -34.9137519, CAST(0x0000A25B01720B8C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1292, 38, NULL, -8.11819759, -34.91379533, CAST(0x0000A25B01720DD1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1293, 38, NULL, -8.11819759, -34.91379533, CAST(0x0000A25B01720DEA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1294, 38, NULL, -8.11843227, -34.91384205, CAST(0x0000A25B0172106A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1295, 38, NULL, -8.11843227, -34.91384205, CAST(0x0000A25B01721084 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1296, 38, NULL, -8.11865925, -34.91388882, CAST(0x0000A25B01721288 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1297, 38, NULL, -8.11865925, -34.91388882, CAST(0x0000A25B0172129B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1298, 38, NULL, -8.11888359, -34.91393106, CAST(0x0000A25B0172151E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1299, 38, NULL, -8.11888359, -34.91393106, CAST(0x0000A25B01721538 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1300, 38, NULL, -8.11910224, -34.91397006, CAST(0x0000A25B0172172F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1301, 38, NULL, -8.11910224, -34.91397006, CAST(0x0000A25B01721746 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1302, 38, NULL, -8.11931105, -34.91401175, CAST(0x0000A25B017219A9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1303, 38, NULL, -8.11931105, -34.91401175, CAST(0x0000A25B017219C5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1304, 38, NULL, -8.11952915, -34.91405224, CAST(0x0000A25B01721BE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1305, 38, NULL, -8.11952915, -34.91405224, CAST(0x0000A25B01721BFA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1306, 38, NULL, -8.11974339, -34.91408975, CAST(0x0000A25B01721E3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1307, 38, NULL, -8.11974339, -34.91408975, CAST(0x0000A25B01721E57 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1308, 38, NULL, -8.11995392, -34.91413069, CAST(0x0000A25B0172208D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1309, 38, NULL, -8.11995392, -34.91413069, CAST(0x0000A25B017220AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1310, 38, NULL, -8.12016873, -34.91417299, CAST(0x0000A25B017222F8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1311, 38, NULL, -8.12016873, -34.91417299, CAST(0x0000A25B01722311 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1312, 38, NULL, -8.12034955, -34.91420659, CAST(0x0000A25B01722541 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1313, 38, NULL, -8.12034955, -34.91420659, CAST(0x0000A25B0172255A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1314, 38, NULL, -8.12057461, -34.9142424, CAST(0x0000A25B017228C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1315, 38, NULL, -8.12057461, -34.9142424, CAST(0x0000A25B017228DD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1316, 38, NULL, -8.1208318, -34.91428989, CAST(0x0000A25B01722C45 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1317, 38, NULL, -8.1208318, -34.91428989, CAST(0x0000A25B01722C5E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1318, 38, NULL, -8.12102118, -34.91432192, CAST(0x0000A25B01722EAF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1319, 38, NULL, -8.12102118, -34.91432192, CAST(0x0000A25B01722EC9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1320, 38, NULL, -8.12122593, -34.91435661, CAST(0x0000A25B017230F1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1321, 38, NULL, -8.12122593, -34.91435661, CAST(0x0000A25B01723113 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1322, 38, NULL, -8.12143359, -34.9143955, CAST(0x0000A25B0172335B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1323, 38, NULL, -8.12143359, -34.9143955, CAST(0x0000A25B01723372 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1324, 38, NULL, -8.12166705, -34.91444053, CAST(0x0000A25B017235EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1325, 38, NULL, -8.12166705, -34.91444053, CAST(0x0000A25B01723603 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1326, 38, NULL, -8.12190455, -34.91449293, CAST(0x0000A25B01723841 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1327, 38, NULL, -8.12190455, -34.91449293, CAST(0x0000A25B01723859 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1328, 38, NULL, -8.12214725, -34.91454296, CAST(0x0000A25B01723A54 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1329, 38, NULL, -8.12214725, -34.91454296, CAST(0x0000A25B01723A6B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1330, 38, NULL, -8.12239893, -34.91459565, CAST(0x0000A25B01723CE4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1331, 38, NULL, -8.12239893, -34.91459565, CAST(0x0000A25B01723CFD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1332, 38, NULL, -8.12266693, -34.91465706, CAST(0x0000A25B01723F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1333, 38, NULL, -8.12266693, -34.91465706, CAST(0x0000A25B01723F30 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1334, 38, NULL, -8.12292778, -34.91470452, CAST(0x0000A25B0172416B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1335, 38, NULL, -8.12292778, -34.91470452, CAST(0x0000A25B01724183 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1336, 38, NULL, -8.12318377, -34.91475392, CAST(0x0000A25B017243BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1337, 38, NULL, -8.12318377, -34.91475392, CAST(0x0000A25B017243D5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1338, 38, NULL, -8.12344988, -34.91481975, CAST(0x0000A25B01724624 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1339, 38, NULL, -8.12344988, -34.91481975, CAST(0x0000A25B01724625 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1340, 38, NULL, -8.12371023, -34.91487614, CAST(0x0000A25B01724864 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1341, 38, NULL, -8.12371023, -34.91487614, CAST(0x0000A25B0172487F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1342, 38, NULL, -8.12393104, -34.91492862, CAST(0x0000A25B01724ABC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1343, 38, NULL, -8.12393104, -34.91492862, CAST(0x0000A25B01724AD9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1344, 38, NULL, -8.12415887, -34.91496869, CAST(0x0000A25B01724D1B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1345, 38, NULL, -8.12415887, -34.91496869, CAST(0x0000A25B01724D2C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1346, 38, NULL, -8.12438922, -34.91501537, CAST(0x0000A25B01724F74 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1347, 38, NULL, -8.12438922, -34.91501537, CAST(0x0000A25B01724F8C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1348, 38, NULL, -8.12462938, -34.91505841, CAST(0x0000A25B017251C7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1349, 38, NULL, -8.12462938, -34.91505841, CAST(0x0000A25B017251E2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1350, 38, NULL, -8.12487595, -34.91510844, CAST(0x0000A25B01725446 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1351, 38, NULL, -8.12487595, -34.91510844, CAST(0x0000A25B01725461 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1352, 38, NULL, -8.12510295, -34.91515085, CAST(0x0000A25B01725672 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1353, 38, NULL, -8.12510295, -34.91515085, CAST(0x0000A25B0172568B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1354, 38, NULL, -8.12532854, -34.91519446, CAST(0x0000A25B017258CD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1355, 38, NULL, -8.12532854, -34.91519446, CAST(0x0000A25B017258ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1356, 38, NULL, -8.12554738, -34.9152287, CAST(0x0000A25B01725B25 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1357, 38, NULL, -8.12554738, -34.9152287, CAST(0x0000A25B01725B3A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1358, 38, NULL, -8.1257421, -34.9152604, CAST(0x0000A25B01725DC0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1359, 38, NULL, -8.1257421, -34.9152604, CAST(0x0000A25B01725DD7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1360, 38, NULL, -8.12592441, -34.91529631, CAST(0x0000A25B01725FE0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1361, 38, NULL, -8.12592441, -34.91529631, CAST(0x0000A25B01725FF5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1362, 38, NULL, -8.12615606, -34.91533377, CAST(0x0000A25B0172635B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1363, 38, NULL, -8.12615606, -34.91533377, CAST(0x0000A25B01726375 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1364, 38, NULL, -8.12635927, -34.91537114, CAST(0x0000A25B01726708 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1365, 38, NULL, -8.12635927, -34.91537114, CAST(0x0000A25B01726724 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1366, 38, NULL, -8.12657957, -34.91541167, CAST(0x0000A25B01726B94 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1367, 38, NULL, -8.12657957, -34.91541167, CAST(0x0000A25B01726BB3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1368, 38, NULL, -8.12676875, -34.91544382, CAST(0x0000A25B01727169 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1369, 38, NULL, -8.12676875, -34.91544382, CAST(0x0000A25B01727185 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1370, 38, NULL, -8.12697168, -34.91546685, CAST(0x0000A25B017281DF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1371, 38, NULL, -8.12697168, -34.91546685, CAST(0x0000A25B017281FA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1372, 38, NULL, -8.12716568, -34.91550186, CAST(0x0000A25B0172859A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1373, 38, NULL, -8.12716568, -34.91550186, CAST(0x0000A25B017285B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1374, 38, NULL, -8.12740437, -34.91553697, CAST(0x0000A25B017288DA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1375, 38, NULL, -8.12740437, -34.91553697, CAST(0x0000A25B017288F6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1376, 38, NULL, -8.12765128, -34.91557669, CAST(0x0000A25B01728C5E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1377, 38, NULL, -8.12765128, -34.91557669, CAST(0x0000A25B01728C7A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1378, 38, NULL, -8.12783262, -34.91560644, CAST(0x0000A25B01728ECC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1379, 38, NULL, -8.12783262, -34.91560644, CAST(0x0000A25B01728EEE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1380, 38, NULL, -8.12801877, -34.91563367, CAST(0x0000A25B01729111 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1381, 38, NULL, -8.12801877, -34.91563367, CAST(0x0000A25B0172912D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1382, 38, NULL, -8.12819985, -34.91566689, CAST(0x0000A25B01729372 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1383, 38, NULL, -8.12819985, -34.91566689, CAST(0x0000A25B0172938C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1384, 38, NULL, -8.12840613, -34.91570061, CAST(0x0000A25B017295CD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1385, 38, NULL, -8.12840613, -34.91570061, CAST(0x0000A25B017295E8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1386, 38, NULL, -8.12862723, -34.91573965, CAST(0x0000A25B01729869 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1387, 38, NULL, -8.12862723, -34.91573965, CAST(0x0000A25B0172988F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1388, 38, NULL, -8.12884748, -34.91577776, CAST(0x0000A25B01729A88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1389, 38, NULL, -8.12884748, -34.91577776, CAST(0x0000A25B01729AA7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1390, 38, NULL, -8.1290685, -34.91581204, CAST(0x0000A25B01729CD0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1391, 38, NULL, -8.1290685, -34.91581204, CAST(0x0000A25B01729CEC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1392, 38, NULL, -8.1292816, -34.91584809, CAST(0x0000A25B01729F43 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1393, 38, NULL, -8.1292816, -34.91584809, CAST(0x0000A25B01729F5A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1394, 38, NULL, -8.1294884, -34.91587949, CAST(0x0000A25B0172A18E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1395, 38, NULL, -8.1294884, -34.91587949, CAST(0x0000A25B0172A1A5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1396, 38, NULL, -8.12968772, -34.91591808, CAST(0x0000A25B0172A3EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1397, 38, NULL, -8.12968772, -34.91591808, CAST(0x0000A25B0172A3ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1398, 38, NULL, -8.12988182, -34.91595382, CAST(0x0000A25B0172A62A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1399, 38, NULL, -8.12988182, -34.91595382, CAST(0x0000A25B0172A645 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1400, 38, NULL, -8.13007313, -34.91598315, CAST(0x0000A25B0172A8A5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1401, 38, NULL, -8.13007313, -34.91598315, CAST(0x0000A25B0172A8BE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1402, 38, NULL, -8.13026843, -34.91601513, CAST(0x0000A25B0172AB19 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1403, 38, NULL, -8.13026843, -34.91601513, CAST(0x0000A25B0172AB37 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1404, 38, NULL, -8.13045507, -34.91604732, CAST(0x0000A25B0172AD73 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1405, 38, NULL, -8.13045507, -34.91604732, CAST(0x0000A25B0172AD90 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1406, 38, NULL, -8.13064169, -34.91608612, CAST(0x0000A25B0172AFBF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1407, 38, NULL, -8.13064169, -34.91608612, CAST(0x0000A25B0172AFD5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1408, 38, NULL, -8.13083348, -34.91612573, CAST(0x0000A25B0172B1FB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1409, 38, NULL, -8.13083348, -34.91612573, CAST(0x0000A25B0172B216 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1410, 38, NULL, -8.13104794, -34.9161707, CAST(0x0000A25B0172B450 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1411, 38, NULL, -8.13104794, -34.9161707, CAST(0x0000A25B0172B46A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1412, 38, NULL, -8.13124812, -34.91620336, CAST(0x0000A25B0172B694 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1413, 38, NULL, -8.13124812, -34.91620336, CAST(0x0000A25B0172B6B0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1414, 38, NULL, -8.13143993, -34.916236, CAST(0x0000A25B0172B8E9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1415, 38, NULL, -8.13143993, -34.916236, CAST(0x0000A25B0172B904 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1416, 38, NULL, -8.13162523, -34.91626546, CAST(0x0000A25B0172BB43 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1417, 38, NULL, -8.13162523, -34.91626546, CAST(0x0000A25B0172BB60 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1418, 38, NULL, -8.13189019, -34.9163101, CAST(0x0000A25B0172BEC0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1419, 38, NULL, -8.13189019, -34.9163101, CAST(0x0000A25B0172BEDE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1420, 38, NULL, -8.13207049, -34.9163407, CAST(0x0000A25B0172C123 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1421, 38, NULL, -8.13207049, -34.9163407, CAST(0x0000A25B0172C13F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1422, 38, NULL, -8.13232544, -34.91638294, CAST(0x0000A25B0172C4A6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1423, 38, NULL, -8.13232544, -34.91638294, CAST(0x0000A25B0172C4C2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1424, 38, NULL, -8.13250281, -34.91641575, CAST(0x0000A25B0172C710 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1425, 38, NULL, -8.13250281, -34.91641575, CAST(0x0000A25B0172C72D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1426, 38, NULL, -8.13270665, -34.91644594, CAST(0x0000A25B0172C954 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1427, 38, NULL, -8.13270665, -34.91644594, CAST(0x0000A25B0172C970 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1428, 38, NULL, -8.13289812, -34.91647822, CAST(0x0000A25B0172CBA7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1429, 38, NULL, -8.13289812, -34.91647822, CAST(0x0000A25B0172CBB8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1430, 38, NULL, -8.1331087, -34.91650782, CAST(0x0000A25B0172CDFD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1431, 38, NULL, -8.1331087, -34.91650782, CAST(0x0000A25B0172CE08 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1432, 38, NULL, -8.13333442, -34.91657154, CAST(0x0000A25B0172D054 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1433, 38, NULL, -8.13333442, -34.91657154, CAST(0x0000A25B0172D06C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1434, 38, NULL, -8.13357921, -34.91662847, CAST(0x0000A25B0172D2AB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1435, 38, NULL, -8.13357921, -34.91662847, CAST(0x0000A25B0172D2C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1436, 38, NULL, -8.13382452, -34.91667887, CAST(0x0000A25B0172D506 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1437, 38, NULL, -8.13382452, -34.91667887, CAST(0x0000A25B0172D52B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1438, 38, NULL, -8.13406701, -34.91672454, CAST(0x0000A25B0172D75D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1439, 38, NULL, -8.13406701, -34.91672454, CAST(0x0000A25B0172D77C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1440, 38, NULL, -8.13429587, -34.91676973, CAST(0x0000A25B0172D9AF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1441, 38, NULL, -8.13429587, -34.91676973, CAST(0x0000A25B0172D9C9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1442, 38, NULL, -8.13451723, -34.91681763, CAST(0x0000A25B0172DC04 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1443, 38, NULL, -8.13451723, -34.91681763, CAST(0x0000A25B0172DC16 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1444, 38, NULL, -8.13473678, -34.91686779, CAST(0x0000A25B0172DE60 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1445, 38, NULL, -8.13473678, -34.91686779, CAST(0x0000A25B0172DE7E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1446, 38, NULL, -8.13496136, -34.91691194, CAST(0x0000A25B0172E0BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1447, 38, NULL, -8.13496136, -34.91691194, CAST(0x0000A25B0172E0DD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1448, 38, NULL, -8.13517304, -34.91695207, CAST(0x0000A25B0172E315 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1449, 38, NULL, -8.13517304, -34.91695207, CAST(0x0000A25B0172E339 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1450, 38, NULL, -8.135378, -34.9169837, CAST(0x0000A25B0172E56E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1451, 38, NULL, -8.135378, -34.9169837, CAST(0x0000A25B0172E602 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1452, 38, NULL, -8.1355781, -34.91701317, CAST(0x0000A25B0172E7C4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1453, 38, NULL, -8.1355781, -34.91701317, CAST(0x0000A25B0172E88E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1454, 38, NULL, -8.13575691, -34.91703927, CAST(0x0000A25B0172EA1D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1455, 38, NULL, -8.13575691, -34.91703927, CAST(0x0000A25B0172EA3D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1456, 38, NULL, -8.13598597, -34.91707837, CAST(0x0000A25B0172EDA2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1457, 38, NULL, -8.13598597, -34.91707837, CAST(0x0000A25B0172EDBE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1458, 38, NULL, -8.13620931, -34.91708515, CAST(0x0000A25B0172F125 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1459, 38, NULL, -8.13620931, -34.91708515, CAST(0x0000A25B0172F149 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1460, 38, NULL, -8.13640432, -34.91699322, CAST(0x0000A25B0172F4A6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1461, 38, NULL, -8.13640432, -34.91699322, CAST(0x0000A25B0172F4C5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1462, 38, NULL, -8.13651862, -34.91683533, CAST(0x0000A25B0172F829 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1463, 38, NULL, -8.13651862, -34.91683533, CAST(0x0000A25B0172F84A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1464, 38, NULL, -8.13655745, -34.91662753, CAST(0x0000A25B0172FBDA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1465, 38, NULL, -8.13655745, -34.91662753, CAST(0x0000A25B0172FBF9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1466, 38, NULL, -8.13648815, -34.91641225, CAST(0x0000A25B0172FF3F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1467, 38, NULL, -8.13648815, -34.91641225, CAST(0x0000A25B0172FF5E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1468, 38, NULL, -8.13625282, -34.91627326, CAST(0x0000A25B017302B4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1469, 38, NULL, -8.13625282, -34.91627326, CAST(0x0000A25B017302D4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1470, 38, NULL, -8.13606357, -34.91623318, CAST(0x0000A25B0173051D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1471, 38, NULL, -8.13606357, -34.91623318, CAST(0x0000A25B01730539 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1472, 38, NULL, -8.135856, -34.91633504, CAST(0x0000A25B01730769 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1473, 38, NULL, -8.135856, -34.91633504, CAST(0x0000A25B01730789 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1474, 38, NULL, -8.13565059, -34.91642605, CAST(0x0000A25B017309D4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1475, 38, NULL, -8.13565059, -34.91642605, CAST(0x0000A25B017309F6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1476, 38, NULL, -8.1354468, -34.91651412, CAST(0x0000A25B01730C1B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1477, 38, NULL, -8.1354468, -34.91651412, CAST(0x0000A25B01730C48 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1478, 38, NULL, -8.13524803, -34.91656749, CAST(0x0000A25B01730EA9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1479, 38, NULL, -8.13524803, -34.91656749, CAST(0x0000A25B01730EC8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1480, 38, NULL, -8.13505686, -34.91659062, CAST(0x0000A25B017310C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1481, 38, NULL, -8.13505686, -34.91659062, CAST(0x0000A25B017310E8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1482, 38, NULL, -8.13478508, -34.91657658, CAST(0x0000A25B0173144D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1483, 38, NULL, -8.13478508, -34.91657658, CAST(0x0000A25B0173146D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1484, 38, NULL, -8.13459308, -34.91655338, CAST(0x0000A25B017316AE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1485, 38, NULL, -8.13459308, -34.91655338, CAST(0x0000A25B017316CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1486, 38, NULL, -8.13440859, -34.91652625, CAST(0x0000A25B01731902 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1487, 38, NULL, -8.13440859, -34.91652625, CAST(0x0000A25B0173191E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1488, 38, NULL, -8.1342116, -34.91649676, CAST(0x0000A25B01731BA1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1489, 38, NULL, -8.1342116, -34.91649676, CAST(0x0000A25B01731BF8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1490, 38, NULL, -8.13399387, -34.91647357, CAST(0x0000A25B01731DAF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1491, 38, NULL, -8.13399387, -34.91647357, CAST(0x0000A25B01731DCE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1492, 38, NULL, -8.13375814, -34.91644773, CAST(0x0000A25B01732040 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1493, 38, NULL, -8.13375814, -34.91644773, CAST(0x0000A25B0173205F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1494, 38, NULL, -8.13350885, -34.91641753, CAST(0x0000A25B01732257 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1495, 38, NULL, -8.13350885, -34.91641753, CAST(0x0000A25B0173226E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1496, 38, NULL, -8.13327294, -34.91638132, CAST(0x0000A25B017324CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1497, 38, NULL, -8.13327294, -34.91638132, CAST(0x0000A25B017324EA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1498, 38, NULL, -8.13304603, -34.91634665, CAST(0x0000A25B0173270F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1499, 38, NULL, -8.13304603, -34.91634665, CAST(0x0000A25B0173272F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1500, 38, NULL, -8.13285873, -34.91632013, CAST(0x0000A25B0173296C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1501, 38, NULL, -8.13285873, -34.91632013, CAST(0x0000A25B0173298A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1502, 38, NULL, -8.13265369, -34.91628749, CAST(0x0000A25B01732E67 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1503, 38, NULL, -8.13265369, -34.91628749, CAST(0x0000A25B01732E86 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1504, 38, NULL, -8.132478, -34.91624597, CAST(0x0000A25B01734465 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1505, 38, NULL, -8.132478, -34.91624597, CAST(0x0000A25B01734482 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1506, 38, NULL, -8.13229882, -34.91620396, CAST(0x0000A25B017347E3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1507, 38, NULL, -8.13229882, -34.91620396, CAST(0x0000A25B017347FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1508, 38, NULL, -8.13209019, -34.91617385, CAST(0x0000A25B01734B68 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1509, 38, NULL, -8.13209019, -34.91617385, CAST(0x0000A25B01734B8B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1510, 38, NULL, -8.13190589, -34.91616409, CAST(0x0000A25B01734DEC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1511, 38, NULL, -8.13190589, -34.91616409, CAST(0x0000A25B01734E0C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1512, 38, NULL, -8.13172535, -34.91614095, CAST(0x0000A25B0173501A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1513, 38, NULL, -8.13172535, -34.91614095, CAST(0x0000A25B0173503B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1514, 38, NULL, -8.13151321, -34.91610257, CAST(0x0000A25B01735274 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1515, 38, NULL, -8.13151321, -34.91610257, CAST(0x0000A25B0173528C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1516, 38, NULL, -8.13129099, -34.91604796, CAST(0x0000A25B017354D4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1517, 38, NULL, -8.13129099, -34.91604796, CAST(0x0000A25B017354F9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1518, 38, NULL, -8.13106884, -34.91601446, CAST(0x0000A25B0173571E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1519, 38, NULL, -8.13106884, -34.91601446, CAST(0x0000A25B01735740 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1520, 38, NULL, -8.13084279, -34.91596769, CAST(0x0000A25B01735985 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1521, 38, NULL, -8.13084279, -34.91596769, CAST(0x0000A25B0173599E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1522, 38, NULL, -8.13061532, -34.91593041, CAST(0x0000A25B01735C19 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1523, 38, NULL, -8.13061532, -34.91593041, CAST(0x0000A25B01735C39 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1524, 38, NULL, -8.13038607, -34.91589183, CAST(0x0000A25B01735E2C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1525, 38, NULL, -8.13038607, -34.91589183, CAST(0x0000A25B01735E4B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1526, 38, NULL, -8.13014516, -34.91585327, CAST(0x0000A25B01736084 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1527, 38, NULL, -8.13014516, -34.91585327, CAST(0x0000A25B017360A7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1528, 38, NULL, -8.1299036, -34.9158145, CAST(0x0000A25B017362DC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1529, 38, NULL, -8.1299036, -34.9158145, CAST(0x0000A25B017362F8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1530, 38, NULL, -8.12966174, -34.91577678, CAST(0x0000A25B01736544 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1531, 38, NULL, -8.12966174, -34.91577678, CAST(0x0000A25B01736561 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1532, 38, NULL, -8.12941377, -34.91573337, CAST(0x0000A25B0173678F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1533, 38, NULL, -8.12941377, -34.91573337, CAST(0x0000A25B017367AF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1534, 38, NULL, -8.1291646, -34.91569264, CAST(0x0000A25B017369ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1535, 38, NULL, -8.1291646, -34.91569264, CAST(0x0000A25B01736A0A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1536, 38, NULL, -8.12893541, -34.91565248, CAST(0x0000A25B01736C3B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1537, 38, NULL, -8.12893541, -34.91565248, CAST(0x0000A25B01736C57 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1538, 38, NULL, -8.12873687, -34.91560816, CAST(0x0000A25B01736EC9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1539, 38, NULL, -8.12873687, -34.91560816, CAST(0x0000A25B01736EE6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1540, 38, NULL, -8.12853499, -34.91556493, CAST(0x0000A25B01737209 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1541, 38, NULL, -8.12853499, -34.91556493, CAST(0x0000A25B0173722B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1542, 38, NULL, -8.12835458, -34.91552847, CAST(0x0000A25B017376DC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1543, 38, NULL, -8.12835458, -34.91552847, CAST(0x0000A25B017376FB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1544, 38, NULL, -8.12817401, -34.91550169, CAST(0x0000A25B01737CE2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1545, 38, NULL, -8.12817401, -34.91550169, CAST(0x0000A25B01737CE3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1546, 38, NULL, -8.12831128, -34.91538312, CAST(0x0000A25B0173A344 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1547, 38, NULL, -8.12831128, -34.91538312, CAST(0x0000A25B0173A359 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1548, 38, NULL, -8.12849688, -34.91539308, CAST(0x0000A25B0173AE18 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1549, 38, NULL, -8.12849688, -34.91539308, CAST(0x0000A25B0173AE23 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1550, 38, NULL, -8.12855003, -34.91517634, CAST(0x0000A25B0173B4DB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1551, 38, NULL, -8.12855003, -34.91517634, CAST(0x0000A25B0173B4F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1552, 38, NULL, -8.12859182, -34.91499555, CAST(0x0000A25B0173BD12 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1553, 38, NULL, -8.12859182, -34.91499555, CAST(0x0000A25B0173BD2A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1584, 52, NULL, -8.1339149475097656, -34.941982269287109, CAST(0x0000A25D01055743 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1585, 52, NULL, -8.1314601898193359, -34.942546844482422, CAST(0x0000A25D01055D1C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1596, 55, NULL, -8.13277652, -34.93748789, CAST(0x0000A25D0149D0F4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1597, 55, NULL, -8.13297275, -34.93745084, CAST(0x0000A25D0149D279 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1598, 55, NULL, -8.13322457, -34.93734165, CAST(0x0000A25D0149D4E7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1599, 55, NULL, -8.13340257, -34.93730349, CAST(0x0000A25D0149D824 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1600, 55, NULL, -8.1336126, -34.93722925, CAST(0x0000A25D0149DA7D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1601, 55, NULL, -8.13380218, -34.93716422, CAST(0x0000A25D0149DCD2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1602, 55, NULL, -8.13399048, -34.93709064, CAST(0x0000A25D0149DF2F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1603, 55, NULL, -8.13420514, -34.93701409, CAST(0x0000A25D0149E184 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1604, 55, NULL, -8.13440826, -34.93693604, CAST(0x0000A25D0149E3DE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1605, 55, NULL, -8.1346331, -34.93685996, CAST(0x0000A25D0149E633 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1606, 55, NULL, -8.13484339, -34.93678672, CAST(0x0000A25D0149E882 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1607, 55, NULL, -8.13505095, -34.93671752, CAST(0x0000A25D0149EAE1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1608, 55, NULL, -8.1352558, -34.93663878, CAST(0x0000A25D0149ED42 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1609, 55, NULL, -8.13545244, -34.93656355, CAST(0x0000A25D0149EF91 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1610, 55, NULL, -8.13565849, -34.93649575, CAST(0x0000A25D0149F201 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1611, 55, NULL, -8.13586835, -34.9364194, CAST(0x0000A25D0149F43B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1612, 55, NULL, -8.13607085, -34.93634707, CAST(0x0000A25D0149F69E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1613, 55, NULL, -8.1362955, -34.93625358, CAST(0x0000A25D0149FA20 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1614, 55, NULL, -8.13649555, -34.93628585, CAST(0x0000A25D014A0959 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1615, 55, NULL, -8.13665258, -34.93644552, CAST(0x0000A25D014A0F3F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1616, 55, NULL, -8.13677691, -34.93658001, CAST(0x0000A25D014A7EA9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1617, 55, NULL, -8.13692482, -34.93675731, CAST(0x0000A25D014A85C7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1618, 55, NULL, -8.13705884, -34.93690275, CAST(0x0000A25D014A8B83 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1619, 55, NULL, -8.13726005, -34.93690535, CAST(0x0000A25D014A902D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1620, 55, NULL, -8.13745075, -34.93679455, CAST(0x0000A25D014A93D1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1621, 55, NULL, -8.13768187, -34.9366735, CAST(0x0000A25D014A9737 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1622, 55, NULL, -8.13793794, -34.9365282, CAST(0x0000A25D014A9B03 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1623, 55, NULL, -8.13809577, -34.93639275, CAST(0x0000A25D014A9D18 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1624, 55, NULL, -8.13826271, -34.93623865, CAST(0x0000A25D014A9FA7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1625, 55, NULL, -8.13842878, -34.93608478, CAST(0x0000A25D014AA1FE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1626, 55, NULL, -8.13859954, -34.93595532, CAST(0x0000A25D014AA413 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1627, 55, NULL, -8.13876625, -34.9358252, CAST(0x0000A25D014AA7B6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1628, 55, NULL, -8.13891627, -34.93570236, CAST(0x0000A25D014ABA56 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1629, 55, NULL, -8.13905317, -34.93557683, CAST(0x0000A25D014ABF06 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1630, 55, NULL, -8.13922431, -34.93540971, CAST(0x0000A25D014AC3B2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1631, 55, NULL, -8.13938051, -34.93527041, CAST(0x0000A25D014AC72E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1632, 55, NULL, -8.13956408, -34.93512045, CAST(0x0000A25D014ACAB8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1633, 55, NULL, -8.13974865, -34.93495901, CAST(0x0000A25D014ACE38 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1634, 55, NULL, -8.13995146, -34.93477677, CAST(0x0000A25D014AD1C3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1635, 55, NULL, -8.14014101, -34.93461054, CAST(0x0000A25D014AD548 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1636, 55, NULL, -8.14029311, -34.9344826, CAST(0x0000A25D014AF176 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1637, 55, NULL, -8.14046909, -34.93432801, CAST(0x0000A25D014AF755 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1638, 55, NULL, -8.14062173, -34.93418964, CAST(0x0000A25D014AFAD7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1639, 55, NULL, -8.14079718, -34.93402791, CAST(0x0000A25D014AFE60 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1640, 55, NULL, -8.14093417, -34.93390666, CAST(0x0000A25D014B00AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1641, 55, NULL, -8.14107913, -34.93377286, CAST(0x0000A25D014B0312 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1642, 55, NULL, -8.14122069, -34.93363895, CAST(0x0000A25D014B0558 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1643, 55, NULL, -8.14131879, -34.93348349, CAST(0x0000A25D014B07A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1644, 55, NULL, -8.14133318, -34.93328666, CAST(0x0000A25D014B0A09 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1645, 55, NULL, -8.14132104, -34.93310187, CAST(0x0000A25D014B0C59 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1646, 55, NULL, -8.14127929, -34.93291425, CAST(0x0000A25D014B123C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1647, 55, NULL, -8.14125335, -34.93273275, CAST(0x0000A25D014B3C80 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1648, 55, NULL, -8.1411975, -34.93253223, CAST(0x0000A25D014B425C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1649, 55, NULL, -8.14116069, -34.93231491, CAST(0x0000A25D014B4705 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1650, 55, NULL, -8.1411378, -34.93210421, CAST(0x0000A25D014B4A9C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1651, 55, NULL, -8.14111642, -34.93187337, CAST(0x0000A25D014B4E07 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1652, 55, NULL, -8.14108561, -34.931616, CAST(0x0000A25D014B5190 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1653, 55, NULL, -8.1410579, -34.93142855, CAST(0x0000A25D014B53ED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1654, 55, NULL, -8.14103029, -34.93123267, CAST(0x0000A25D014B568C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1655, 55, NULL, -8.14100328, -34.93105031, CAST(0x0000A25D014B589E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1656, 55, NULL, -8.1409776, -34.93082266, CAST(0x0000A25D014B5C22 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1657, 55, NULL, -8.14094738, -34.93062114, CAST(0x0000A25D014B6324 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1658, 55, NULL, -8.14090926, -34.93044046, CAST(0x0000A25D014B8078 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1659, 55, NULL, -8.14087513, -34.93021448, CAST(0x0000A25D014B8650 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1660, 55, NULL, -8.14085505, -34.93003015, CAST(0x0000A25D014B9DB7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1661, 55, NULL, -8.14082767, -34.92981271, CAST(0x0000A25D014BA5E0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1662, 55, NULL, -8.14079706, -34.92958731, CAST(0x0000A25D014BAA9B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1663, 55, NULL, -8.14077104, -34.92939456, CAST(0x0000A25D014BAE13 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1664, 55, NULL, -8.14074398, -34.92920781, CAST(0x0000A25D014BB19D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1665, 55, NULL, -8.14071589, -34.92901129, CAST(0x0000A25D014BB52E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1666, 55, NULL, -8.14068294, -34.92879265, CAST(0x0000A25D014BB8A7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1667, 55, NULL, -8.14065016, -34.92854883, CAST(0x0000A25D014BBC3E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1668, 55, NULL, -8.14061652, -34.92828837, CAST(0x0000A25D014BBFB3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1669, 55, NULL, -8.14059443, -34.92810549, CAST(0x0000A25D014BC354 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1670, 55, NULL, -8.14056525, -34.9279067, CAST(0x0000A25D014BD9BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1671, 55, NULL, -8.14053221, -34.92770468, CAST(0x0000A25D014BDE47 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1672, 55, NULL, -8.14051778, -34.92750281, CAST(0x0000A25D014BE1BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1673, 55, NULL, -8.14051836, -34.92726561, CAST(0x0000A25D014BE54E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1674, 55, NULL, -8.14053633, -34.92699598, CAST(0x0000A25D014BE8A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1675, 55, NULL, -8.14055109, -34.92680529, CAST(0x0000A25D014BEB21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1676, 55, NULL, -8.1405637, -34.92660502, CAST(0x0000A25D014BED7F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1677, 55, NULL, -8.14057164, -34.9263845, CAST(0x0000A25D014BEFD5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1678, 55, NULL, -8.1405802, -34.92615735, CAST(0x0000A25D014BF219 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1679, 55, NULL, -8.14059075, -34.92593019, CAST(0x0000A25D014BF481 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1680, 55, NULL, -8.14060285, -34.92568505, CAST(0x0000A25D014BF6D6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1681, 55, NULL, -8.14061026, -34.92541861, CAST(0x0000A25D014BF923 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1682, 55, NULL, -8.14061953, -34.92515739, CAST(0x0000A25D014BFB88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1683, 55, NULL, -8.14062544, -34.92488765, CAST(0x0000A25D014BFDD8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1684, 55, NULL, -8.14062885, -34.9246069, CAST(0x0000A25D014C004C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1685, 55, NULL, -8.14063858, -34.92432358, CAST(0x0000A25D014C02C0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1686, 55, NULL, -8.14064786, -34.92406437, CAST(0x0000A25D014C04DF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1687, 55, NULL, -8.14064943, -34.92381675, CAST(0x0000A25D014C0777 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1688, 55, NULL, -8.14059449, -34.92361313, CAST(0x0000A25D014C09A5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1689, 55, NULL, -8.14054176, -34.92342683, CAST(0x0000A25D014C0C08 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1690, 55, NULL, -8.14045609, -34.92317606, CAST(0x0000A25D014C0F7D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1691, 55, NULL, -8.14039318, -34.92299226, CAST(0x0000A25D014C11DF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1692, 55, NULL, -8.14030599, -34.92283262, CAST(0x0000A25D014C142B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1693, 55, NULL, -8.14023341, -34.92266465, CAST(0x0000A25D014C167D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1694, 55, NULL, -8.14014235, -34.92243577, CAST(0x0000A25D014C1A02 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1695, 55, NULL, -8.14005143, -34.92227705, CAST(0x0000A25D014C3296 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1696, 55, NULL, -8.13996761, -34.922111, CAST(0x0000A25D014C42F8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1697, 55, NULL, -8.1398677, -34.9219109, CAST(0x0000A25D014C47B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1698, 55, NULL, -8.13985427, -34.92168421, CAST(0x0000A25D014C4C5A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1699, 55, NULL, -8.13996732, -34.9215314, CAST(0x0000A25D014C4FD6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1700, 55, NULL, -8.14013348, -34.92135552, CAST(0x0000A25D014C546B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1701, 55, NULL, -8.14026972, -34.92122534, CAST(0x0000A25D014C5809 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1702, 55, NULL, -8.14041488, -34.9210838, CAST(0x0000A25D014C5B8A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1703, 55, NULL, -8.14058391, -34.92093795, CAST(0x0000A25D014C5F39 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1704, 55, NULL, -8.14077014, -34.92075506, CAST(0x0000A25D014C6297 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1705, 55, NULL, -8.14089993, -34.92061197, CAST(0x0000A25D014C6501 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1706, 55, NULL, -8.14101687, -34.92046484, CAST(0x0000A25D014C675C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1707, 55, NULL, -8.14112684, -34.92031309, CAST(0x0000A25D014C6991 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1708, 55, NULL, -8.14127657, -34.92009225, CAST(0x0000A25D014C6D59 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1709, 55, NULL, -8.14143958, -34.91989461, CAST(0x0000A25D014C70E7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1710, 55, NULL, -8.14155168, -34.91974547, CAST(0x0000A25D014C7325 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1711, 55, NULL, -8.14166187, -34.91957575, CAST(0x0000A25D014C7594 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1712, 55, NULL, -8.14174909, -34.91938715, CAST(0x0000A25D014C77A8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1713, 55, NULL, -8.14181628, -34.91919014, CAST(0x0000A25D014C7A2B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1714, 55, NULL, -8.1418795, -34.91898249, CAST(0x0000A25D014C7C78 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1715, 55, NULL, -8.14195021, -34.9187369, CAST(0x0000A25D014C7EAF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1716, 55, NULL, -8.14202322, -34.91846856, CAST(0x0000A25D014C8108 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1717, 55, NULL, -8.14210172, -34.91819739, CAST(0x0000A25D014C835D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1718, 55, NULL, -8.14218434, -34.91793547, CAST(0x0000A25D014C85B9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1719, 55, NULL, -8.14223743, -34.91765519, CAST(0x0000A25D014C87FB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1720, 55, NULL, -8.14229623, -34.91746233, CAST(0x0000A25D014C8A51 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1721, 55, NULL, -8.14238384, -34.91720613, CAST(0x0000A25D014C8DE4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1722, 55, NULL, -8.14256123, -34.91705411, CAST(0x0000A25D014C916B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1723, 55, NULL, -8.14278421, -34.91701621, CAST(0x0000A25D014C953B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1724, 55, NULL, -8.14298695, -34.91705655, CAST(0x0000A25D014C9871 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1725, 55, NULL, -8.14312525, -34.91719149, CAST(0x0000A25D014C9C1E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1726, 55, NULL, -8.14314868, -34.91738226, CAST(0x0000A25D014C9F77 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1727, 55, NULL, -8.14318611, -34.9175663, CAST(0x0000A25D014CA31A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1728, 55, NULL, -8.14315781, -34.91777058, CAST(0x0000A25D014CA680 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1729, 55, NULL, -8.14300642, -34.91791083, CAST(0x0000A25D014CAA06 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1730, 55, NULL, -8.14282065, -34.91789352, CAST(0x0000A25D014CADB7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1731, 55, NULL, -8.14257144, -34.91784153, CAST(0x0000A25D014CB12B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1732, 55, NULL, -8.1423784, -34.9178037, CAST(0x0000A25D014CB36A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1733, 55, NULL, -8.14219677, -34.91777138, CAST(0x0000A25D014CB5C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1734, 55, NULL, -8.14198441, -34.91772823, CAST(0x0000A25D014CB81C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1735, 55, NULL, -8.1417768, -34.91768867, CAST(0x0000A25D014CBAC1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1736, 55, NULL, -8.1415686, -34.91765601, CAST(0x0000A25D014CBCD0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1737, 55, NULL, -8.14135388, -34.91761993, CAST(0x0000A25D014CBF2D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1738, 55, NULL, -8.14110415, -34.91757723, CAST(0x0000A25D014CC17A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1739, 55, NULL, -8.14087169, -34.91753648, CAST(0x0000A25D014CC3DF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1740, 55, NULL, -8.1406273, -34.917493, CAST(0x0000A25D014CC62C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1741, 55, NULL, -8.14038295, -34.91745449, CAST(0x0000A25D014CC8AA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1742, 55, NULL, -8.14014249, -34.91741315, CAST(0x0000A25D014CCAE3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1743, 55, NULL, -8.1398909, -34.9173678, CAST(0x0000A25D014CCD2F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1744, 55, NULL, -8.13964532, -34.91732888, CAST(0x0000A25D014CCF81 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1745, 55, NULL, -8.13939519, -34.91728869, CAST(0x0000A25D014CD1E4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1746, 55, NULL, -8.13914377, -34.91725416, CAST(0x0000A25D014CD43C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1747, 55, NULL, -8.1388894, -34.91721325, CAST(0x0000A25D014CD694 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1748, 55, NULL, -8.13862656, -34.91716905, CAST(0x0000A25D014CD8EB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1749, 55, NULL, -8.13835728, -34.91712088, CAST(0x0000A25D014CDB4B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1750, 55, NULL, -8.13808185, -34.91708233, CAST(0x0000A25D014CDDA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1751, 55, NULL, -8.13781501, -34.91703231, CAST(0x0000A25D014CE001 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1752, 55, NULL, -8.13756046, -34.91698522, CAST(0x0000A25D014CE276 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1753, 55, NULL, -8.13732834, -34.9169238, CAST(0x0000A25D014CE4BB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1754, 55, NULL, -8.13710873, -34.91685729, CAST(0x0000A25D014CE70D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1755, 55, NULL, -8.13693038, -34.91676758, CAST(0x0000A25D014CE95E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1756, 55, NULL, -8.13677571, -34.9165407, CAST(0x0000A25D014CECD8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1757, 55, NULL, -8.13669538, -34.91637103, CAST(0x0000A25D014CEF37 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1758, 55, NULL, -8.13657077, -34.91622961, CAST(0x0000A25D014CF1A6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1759, 55, NULL, -8.13634791, -34.91609226, CAST(0x0000A25D014CF50D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1760, 55, NULL, -8.13616495, -34.91607005, CAST(0x0000A25D014CF768 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1761, 55, NULL, -8.13588763, -34.91620296, CAST(0x0000A25D014CFAEA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1762, 55, NULL, -8.13570165, -34.91629526, CAST(0x0000A25D014CFD60 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1763, 55, NULL, -8.13552918, -34.91639236, CAST(0x0000A25D014CFFAF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1764, 55, NULL, -8.13534543, -34.91647119, CAST(0x0000A25D014D01FD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1765, 55, NULL, -8.13516814, -34.91651157, CAST(0x0000A25D014D046D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1766, 55, NULL, -8.13497863, -34.9165079, CAST(0x0000A25D014D06A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1767, 55, NULL, -8.13473294, -34.91648226, CAST(0x0000A25D014D0A2E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1768, 55, NULL, -8.13453858, -34.91644994, CAST(0x0000A25D014D0DB9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1769, 55, NULL, -8.13439439, -34.91633303, CAST(0x0000A25D014D1265 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1770, 55, NULL, -8.13439913, -34.91613714, CAST(0x0000A25D014D172D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1771, 55, NULL, -8.13441804, -34.91593405, CAST(0x0000A25D014D1C02 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1772, 55, NULL, -8.13444781, -34.91572722, CAST(0x0000A25D014D3F21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1773, 55, NULL, -8.13443199, -34.9155106, CAST(0x0000A25D014D44C0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1774, 55, NULL, -8.13445165, -34.91531949, CAST(0x0000A25D014D4857 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1775, 55, NULL, -8.13445739, -34.91512577, CAST(0x0000A25D014D4BC5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1776, 55, NULL, -8.13448802, -34.91490078, CAST(0x0000A25D014D4F51 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1777, 55, NULL, -8.1345185, -34.91468775, CAST(0x0000A25D014D52D6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1778, 55, NULL, -8.13459609, -34.91445752, CAST(0x0000A25D014D566A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1779, 55, NULL, -8.1346317, -34.91427741, CAST(0x0000A25D014D5A12 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1780, 55, NULL, -8.13467345, -34.91409531, CAST(0x0000A25D014D635D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1781, 55, NULL, -8.13472337, -34.91390782, CAST(0x0000A25D014D6F35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1782, 55, NULL, -8.13476978, -34.91370802, CAST(0x0000A25D014D760F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1783, 55, NULL, -8.13481964, -34.91347099, CAST(0x0000A25D014D7AA2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1784, 55, NULL, -8.13486064, -34.9132671, CAST(0x0000A25D014D7E5A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1785, 55, NULL, -8.13491992, -34.91304392, CAST(0x0000A25D014D81CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1786, 55, NULL, -8.13497749, -34.91279839, CAST(0x0000A25D014D852B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1787, 55, NULL, -8.1350537, -34.91244439, CAST(0x0000A25D014D89E0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1788, 55, NULL, -8.13509233, -34.91226018, CAST(0x0000A25D014D8C37 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1789, 55, NULL, -8.13514878, -34.91200124, CAST(0x0000A25D014D8FC8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1790, 55, NULL, -8.13519924, -34.91182214, CAST(0x0000A25D014D9359 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1791, 55, NULL, -8.1352341, -34.91161722, CAST(0x0000A25D014DA75C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1792, 55, NULL, -8.13529375, -34.91138042, CAST(0x0000A25D014DAD21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1793, 55, NULL, -8.13534426, -34.91118583, CAST(0x0000A25D014DB0A9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1794, 55, NULL, -8.13540191, -34.91096449, CAST(0x0000A25D014DB454 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1795, 55, NULL, -8.13544662, -34.91069879, CAST(0x0000A25D014DB790 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1796, 55, NULL, -8.13548552, -34.91051857, CAST(0x0000A25D014DBA35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1797, 55, NULL, -8.13552937, -34.91033384, CAST(0x0000A25D014DBC4A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1798, 55, NULL, -8.13556489, -34.9101344, CAST(0x0000A25D014DBE9E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1799, 55, NULL, -8.13560035, -34.90993328, CAST(0x0000A25D014DC10D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1800, 55, NULL, -8.13569415, -34.90971225, CAST(0x0000A25D014DC47B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1801, 55, NULL, -8.13574687, -34.90947439, CAST(0x0000A25D014DC800 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1802, 55, NULL, -8.13577519, -34.90928142, CAST(0x0000A25D014DCCB4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1803, 55, NULL, -8.13582066, -34.90907365, CAST(0x0000A25D014DE326 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1804, 55, NULL, -8.1358353, -34.90888152, CAST(0x0000A25D014E0AC4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1805, 55, NULL, -8.13584592, -34.90867139, CAST(0x0000A25D014E11F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1806, 55, NULL, -8.1358055, -34.9084602, CAST(0x0000A25D014E16CA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1807, 55, NULL, -8.13575025, -34.90825449, CAST(0x0000A25D014E1A0E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1808, 55, NULL, -8.13563153, -34.90800911, CAST(0x0000A25D014E1DA8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1809, 55, NULL, -8.13553783, -34.90782684, CAST(0x0000A25D014E1FF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1810, 55, NULL, -8.13546495, -34.90763626, CAST(0x0000A25D014E223F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1811, 55, NULL, -8.13539838, -34.90744359, CAST(0x0000A25D014E24BC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1812, 55, NULL, -8.13533764, -34.90726142, CAST(0x0000A25D014E271A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1813, 55, NULL, -8.13526716, -34.90708118, CAST(0x0000A25D014E2A73 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1814, 55, NULL, -8.13515981, -34.90692044, CAST(0x0000A25D014E432E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1815, 55, NULL, -8.13508596, -34.90674902, CAST(0x0000A25D014E4D9C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1816, 55, NULL, -8.13500571, -34.90657946, CAST(0x0000A25D014E55EF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1817, 55, NULL, -8.13488477, -34.90637299, CAST(0x0000A25D014E5A66 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1818, 55, NULL, -8.13477632, -34.90617922, CAST(0x0000A25D014E5DF6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1819, 55, NULL, -8.13466424, -34.9059822, CAST(0x0000A25D014E6198 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1820, 55, NULL, -8.13453944, -34.90576373, CAST(0x0000A25D014E650D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1821, 55, NULL, -8.13442577, -34.90557048, CAST(0x0000A25D014E6887 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1822, 55, NULL, -8.1343151, -34.90539579, CAST(0x0000A25D014E6D39 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1823, 55, NULL, -8.13420844, -34.90522648, CAST(0x0000A25D014E7ED1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1824, 55, NULL, -8.13410593, -34.90507307, CAST(0x0000A25D014E839F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1825, 55, NULL, -8.13400645, -34.90491118, CAST(0x0000A25D014E8700 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1826, 55, NULL, -8.13389626, -34.90471955, CAST(0x0000A25D014E8A74 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1827, 55, NULL, -8.13378841, -34.90452837, CAST(0x0000A25D014E8DF8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1828, 55, NULL, -8.13370368, -34.90435342, CAST(0x0000A25D014E9F9B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1829, 55, NULL, -8.13361376, -34.90415355, CAST(0x0000A25D014EA7CB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1830, 55, NULL, -8.1335058, -34.90395159, CAST(0x0000A25D014EAC72 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1831, 55, NULL, -8.13342842, -34.90374698, CAST(0x0000A25D014EB262 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1832, 55, NULL, -8.1333557, -34.9035702, CAST(0x0000A25D014EB83F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1833, 55, NULL, -8.13333989, -34.90354191, CAST(0x0000A25D014EBD1C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1834, 55, NULL, -8.13321555, -34.90336338, CAST(0x0000A25D014F05A1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1835, 55, NULL, -8.13312457, -34.90310453, CAST(0x0000A25D014F0B72 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1836, 55, NULL, -8.13305417, -34.90291051, CAST(0x0000A25D014F1146 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1837, 55, NULL, -8.13299271, -34.90273273, CAST(0x0000A25D014F15F6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1838, 55, NULL, -8.1329401, -34.90253311, CAST(0x0000A25D014F1AA4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1839, 55, NULL, -8.13294954, -34.90234563, CAST(0x0000A25D014F1F52 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1840, 55, NULL, -8.13298523, -34.90214864, CAST(0x0000A25D014F2534 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1841, 55, NULL, -8.13303591, -34.90197138, CAST(0x0000A25D014F2C34 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1842, 55, NULL, -8.13290881, -34.90180356, CAST(0x0000A25D014F6349 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1843, 55, NULL, -8.13272104, -34.90175928, CAST(0x0000A25D014F66CD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1844, 55, NULL, -8.13254456, -34.9017122, CAST(0x0000A25D014F6A56 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1845, 56, NULL, -8.13455616, -34.91442266, CAST(0x0000A25D0179D8D0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1846, 56, NULL, -8.13460391, -34.9142194, CAST(0x0000A25D0179DC54 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1847, 56, NULL, -8.13464401, -34.91401589, CAST(0x0000A25D0179EE88 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1848, 56, NULL, -8.13470173, -34.91379037, CAST(0x0000A25D0179F337 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1849, 56, NULL, -8.13474214, -34.91360199, CAST(0x0000A25D0179F912 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1850, 56, NULL, -8.1345564, -34.91346998, CAST(0x0000A25D017A0149 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1851, 56, NULL, -8.13430466, -34.91341509, CAST(0x0000A25D017A05FA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1852, 56, NULL, -8.13406679, -34.9133623, CAST(0x0000A25D017A097B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1853, 56, NULL, -8.13382115, -34.91331511, CAST(0x0000A25D017A0D01 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1854, 56, NULL, -8.13363409, -34.9132637, CAST(0x0000A25D017A0F56 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1855, 56, NULL, -8.13343757, -34.91322284, CAST(0x0000A25D017A11B4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1856, 56, NULL, -8.13326277, -34.91317047, CAST(0x0000A25D017A1404 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1857, 56, NULL, -8.13305958, -34.91319362, CAST(0x0000A25D017A18AF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1858, 56, NULL, -8.13301611, -34.9133915, CAST(0x0000A25D017A1C3A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1859, 56, NULL, -8.13295776, -34.91365258, CAST(0x0000A25D017A1FBE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1860, 56, NULL, -8.13290649, -34.91383451, CAST(0x0000A25D017A2218 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1861, 56, NULL, -8.13284324, -34.91404541, CAST(0x0000A25D017A246E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1862, 56, NULL, -8.13278056, -34.9142698, CAST(0x0000A25D017A26C8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1863, 56, NULL, -8.13271604, -34.91450101, CAST(0x0000A25D017A2920 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1864, 56, NULL, -8.13266444, -34.91475216, CAST(0x0000A25D017A2B78 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1865, 56, NULL, -8.13259636, -34.9149687, CAST(0x0000A25D017A2DCD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1866, 56, NULL, -8.13252801, -34.91517975, CAST(0x0000A25D017A3025 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1867, 56, NULL, -8.13245975, -34.91539646, CAST(0x0000A25D017A327F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1868, 56, NULL, -8.13238447, -34.915602, CAST(0x0000A25D017A34D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1869, 56, NULL, -8.13219595, -34.91577894, CAST(0x0000A25D017A372E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1870, 56, NULL, -8.13200126, -34.91592698, CAST(0x0000A25D017A3989 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1871, 56, NULL, -8.13178983, -34.9159498, CAST(0x0000A25D017A3BDD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1872, 56, NULL, -8.13156152, -34.91591968, CAST(0x0000A25D017A3E36 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1873, 56, NULL, -8.13132602, -34.91585723, CAST(0x0000A25D017A408B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1874, 56, NULL, -8.13107372, -34.91575224, CAST(0x0000A25D017A42E7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1875, 56, NULL, -8.13085374, -34.91560995, CAST(0x0000A25D017A453C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1876, 56, NULL, -8.13065034, -34.915472, CAST(0x0000A25D017A4795 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1877, 56, NULL, -8.13044085, -34.91537921, CAST(0x0000A25D017A49EE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1878, 56, NULL, -8.13022777, -34.91538563, CAST(0x0000A25D017A4C46 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1879, 56, NULL, -8.13004468, -34.91548624, CAST(0x0000A25D017A4E9C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1880, 56, NULL, -8.12993638, -34.91564679, CAST(0x0000A25D017A50F3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1881, 56, NULL, -8.1298952, -34.91584464, CAST(0x0000A25D017A534F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1882, 56, NULL, -8.12996086, -34.91606658, CAST(0x0000A25D017A55A4 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1883, 56, NULL, -8.13010559, -34.91623873, CAST(0x0000A25D017A5800 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1884, 56, NULL, -8.13032842, -34.91630754, CAST(0x0000A25D017A5A54 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1885, 56, NULL, -8.13057487, -34.91628874, CAST(0x0000A25D017A5CAD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1886, 56, NULL, -8.13085555, -34.91626889, CAST(0x0000A25D017A5F09 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1887, 56, NULL, -8.13116322, -34.91627289, CAST(0x0000A25D017A615B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1888, 56, NULL, -8.13147158, -34.91630487, CAST(0x0000A25D017A63B9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1889, 56, NULL, -8.13177575, -34.91636093, CAST(0x0000A25D017A660D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1890, 56, NULL, -8.13207183, -34.91641839, CAST(0x0000A25D017A6869 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1891, 56, NULL, -8.13233071, -34.9165415, CAST(0x0000A25D017A6ABC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1892, 56, NULL, -8.13255468, -34.91672066, CAST(0x0000A25D017A6D17 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1893, 56, NULL, -8.13274653, -34.91693215, CAST(0x0000A25D017A6F6E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1894, 56, NULL, -8.13288637, -34.91716336, CAST(0x0000A25D017A71C9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1895, 56, NULL, -8.13299666, -34.91738589, CAST(0x0000A25D017A7420 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1896, 56, NULL, -8.13314184, -34.91750885, CAST(0x0000A25D017A7677 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1897, 56, NULL, -8.13334827, -34.91757095, CAST(0x0000A25D017A78D0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1898, 56, NULL, -8.13354127, -34.9174816, CAST(0x0000A25D017A7B27 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1899, 56, NULL, -8.13372466, -34.91743975, CAST(0x0000A25D017A7D7F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1900, 56, NULL, -8.13390221, -34.91741128, CAST(0x0000A25D017A8DEA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1901, 56, NULL, -8.13408612, -34.91733962, CAST(0x0000A25D017A9E4F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1902, 56, NULL, -8.13426065, -34.91727565, CAST(0x0000A25D017AA1D2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1903, 56, NULL, -8.13448324, -34.91719549, CAST(0x0000A25D017AA557 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1904, 56, NULL, -8.13465744, -34.91714222, CAST(0x0000A25D017AA7AD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1905, 56, NULL, -8.13485017, -34.91708756, CAST(0x0000A25D017AAA06 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1906, 56, NULL, -8.1350655, -34.91704757, CAST(0x0000A25D017AAC5B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1907, 56, NULL, -8.1354105, -34.91704028, CAST(0x0000A25D017AAFE5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1908, 56, NULL, -8.13564788, -34.91707319, CAST(0x0000A25D017AB23D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1909, 56, NULL, -8.13588646, -34.91711233, CAST(0x0000A25D017AB495 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1910, 56, NULL, -8.13613249, -34.91714109, CAST(0x0000A25D017AB6EA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1911, 56, NULL, -8.13639358, -34.91711989, CAST(0x0000A25D017AB942 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1912, 56, NULL, -8.13707967, -34.91713759, CAST(0x0000A25D017ABF1C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1913, 56, NULL, -8.13738062, -34.91717165, CAST(0x0000A25D017AC173 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1914, 56, NULL, -8.13768449, -34.91721758, CAST(0x0000A25D017AC3CE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1915, 56, NULL, -8.138008, -34.91726896, CAST(0x0000A25D017AC626 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1916, 56, NULL, -8.13833572, -34.91732389, CAST(0x0000A25D017AC881 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1917, 56, NULL, -8.13865944, -34.9173737, CAST(0x0000A25D017ACAD5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1918, 56, NULL, -8.13897204, -34.91742715, CAST(0x0000A25D017ACD2E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1919, 56, NULL, -8.1392881, -34.91748449, CAST(0x0000A25D017ACF81 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1920, 56, NULL, -8.1396046, -34.9175353, CAST(0x0000A25D017AD1DE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1921, 56, NULL, -8.13990817, -34.91758287, CAST(0x0000A25D017AD438 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1922, 56, NULL, -8.14020254, -34.91762766, CAST(0x0000A25D017AD68F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1923, 56, NULL, -8.14051458, -34.91768294, CAST(0x0000A25D017AD8E9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1924, 56, NULL, -8.14083247, -34.91773408, CAST(0x0000A25D017ADB41 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1925, 56, NULL, -8.14115005, -34.91778379, CAST(0x0000A25D017ADD96 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1926, 56, NULL, -8.14145408, -34.91783888, CAST(0x0000A25D017ADFF1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1927, 56, NULL, -8.1416743, -34.91787714, CAST(0x0000A25D017AE24A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1928, 56, NULL, -8.14185979, -34.91802504, CAST(0x0000A25D017AE5CA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1929, 56, NULL, -8.14185987, -34.91828982, CAST(0x0000A25D017AE94E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1930, 56, NULL, -8.14181321, -34.91849319, CAST(0x0000A25D017AEBA8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1931, 56, NULL, -8.14176005, -34.91871872, CAST(0x0000A25D017AEDFD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1932, 56, NULL, -8.1416962, -34.91895984, CAST(0x0000A25D017AF057 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1933, 56, NULL, -8.14162155, -34.91920952, CAST(0x0000A25D017AF2B1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1934, 56, NULL, -8.14154087, -34.91945754, CAST(0x0000A25D017AF507 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1935, 56, NULL, -8.1414414999999991, -34.91970579, CAST(0x0000A25D017AF761 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1936, 56, NULL, -8.14131149, -34.91994293, CAST(0x0000A25D017AF9B5 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1937, 56, NULL, -8.14116088, -34.92018042, CAST(0x0000A25D017AFC0D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1938, 56, NULL, -8.14099492, -34.92039993, CAST(0x0000A25D017AFE62 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1939, 56, NULL, -8.14081514, -34.92061132, CAST(0x0000A25D017B00BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1940, 56, NULL, -8.14065087, -34.92078209, CAST(0x0000A25D017B0316 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1941, 56, NULL, -8.14049986, -34.92092361, CAST(0x0000A25D017B069B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1942, 56, NULL, -8.14031335, -34.92107966, CAST(0x0000A25D017B2190 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1943, 56, NULL, -8.14013335, -34.92124326, CAST(0x0000A25D017B2512 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1944, 56, NULL, -8.13993864, -34.92141582, CAST(0x0000A25D017B2896 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1945, 56, NULL, -8.13982338, -34.92157887, CAST(0x0000A25D017B2AEE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1946, 56, NULL, -8.1398051, -34.92176183, CAST(0x0000A25D017B2D4A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1947, 56, NULL, -8.13986608, -34.92195155, CAST(0x0000A25D017B2FA0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1948, 56, NULL, -8.13995342, -34.92213403, CAST(0x0000A25D017B31F6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1949, 56, NULL, -8.14004433, -34.92233747, CAST(0x0000A25D017B3450 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1950, 56, NULL, -8.14014426, -34.92254899, CAST(0x0000A25D017B36A7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1951, 56, NULL, -8.14024527, -34.92277239, CAST(0x0000A25D017B38FE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1952, 56, NULL, -8.14034609, -34.92299607, CAST(0x0000A25D017B3B56 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1953, 56, NULL, -8.14042286, -34.92322793, CAST(0x0000A25D017B3DAD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1954, 56, NULL, -8.14050023, -34.92346622, CAST(0x0000A25D017B4007 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1955, 56, NULL, -8.14054693, -34.92368814, CAST(0x0000A25D017B425F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1956, 56, NULL, -8.14058712, -34.92394384, CAST(0x0000A25D017B44B3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1957, 56, NULL, -8.14056897, -34.92420315, CAST(0x0000A25D017B470D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1958, 56, NULL, -8.14055063, -34.92445346, CAST(0x0000A25D017B4966 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1959, 56, NULL, -8.14053761, -34.92472408, CAST(0x0000A25D017B4BBE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1960, 56, NULL, -8.14052566, -34.9249815, CAST(0x0000A25D017B4E17 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1961, 56, NULL, -8.14052907, -34.92526525, CAST(0x0000A25D017B506E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1962, 56, NULL, -8.14051812, -34.92555184, CAST(0x0000A25D017B52C6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1963, 56, NULL, -8.14049978, -34.92583693, CAST(0x0000A25D017B551F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1964, 56, NULL, -8.14048771, -34.92610474, CAST(0x0000A25D017B5777 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1965, 56, NULL, -8.14047346, -34.9263713, CAST(0x0000A25D017B59CC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1966, 56, NULL, -8.14046987, -34.92664443, CAST(0x0000A25D017B5C2A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1967, 56, NULL, -8.14046894, -34.92693275, CAST(0x0000A25D017B5E7E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1968, 56, NULL, -8.14045721, -34.92720762, CAST(0x0000A25D017B60D9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1969, 56, NULL, -8.14046237, -34.92747499, CAST(0x0000A25D017B6330 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1970, 56, NULL, -8.14047828, -34.9277392, CAST(0x0000A25D017B6587 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1971, 56, NULL, -8.14050808, -34.92796606, CAST(0x0000A25D017B67DB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1972, 56, NULL, -8.14053779, -34.92815934, CAST(0x0000A25D017B6C8E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1973, 56, NULL, -8.14055496, -34.92835877, CAST(0x0000A25D017B82D0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1974, 56, NULL, -8.14059341, -34.92860842, CAST(0x0000A25D017B878E AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1975, 56, NULL, -8.14062134, -34.92883956, CAST(0x0000A25D017B8B07 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1976, 56, NULL, -8.14065741, -34.92907601, CAST(0x0000A25D017B8E8A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1977, 56, NULL, -8.14069111, -34.92933699, CAST(0x0000A25D017B920F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1978, 56, NULL, -8.1407159, -34.92953336, CAST(0x0000A25D017B9460 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1979, 56, NULL, -8.14075427, -34.92976081, CAST(0x0000A25D017B96C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1980, 56, NULL, -8.14079464, -34.92999652, CAST(0x0000A25D017B9916 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1981, 56, NULL, -8.14082209, -34.9301995, CAST(0x0000A25D017B9B6D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1982, 56, NULL, -8.14084437, -34.93039929, CAST(0x0000A25D017B9DC7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1983, 56, NULL, -8.14088197, -34.93060128, CAST(0x0000A25D017BA14B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1984, 56, NULL, -8.14090989, -34.93078789, CAST(0x0000A25D017BB8BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1985, 56, NULL, -8.1409252, -34.93098761, CAST(0x0000A25D017BBD6D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1986, 56, NULL, -8.14095965, -34.93119774, CAST(0x0000A25D017BC0F0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1987, 56, NULL, -8.14099139, -34.93144284, CAST(0x0000A25D017BC473 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1988, 56, NULL, -8.14101955, -34.93162342, CAST(0x0000A25D017BC6CB AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1989, 56, NULL, -8.14104506, -34.93181791, CAST(0x0000A25D017BC925 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1990, 56, NULL, -8.14106906, -34.93200887, CAST(0x0000A25D017BCB7B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1991, 56, NULL, -8.14109055, -34.93222097, CAST(0x0000A25D017BCEFF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1992, 56, NULL, -8.14112132, -34.93243167, CAST(0x0000A25D017BE8C9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1993, 56, NULL, -8.14116219, -34.93261741, CAST(0x0000A25D017BEC4B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1994, 56, NULL, -8.14119154, -34.93283668, CAST(0x0000A25D017BEFD1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1995, 56, NULL, -8.141239, -34.93309685, CAST(0x0000A25D017BF352 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1996, 56, NULL, -8.14125917, -34.93327954, CAST(0x0000A25D017BF5AD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1997, 56, NULL, -8.14123606, -34.93346041, CAST(0x0000A25D017BF802 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1998, 56, NULL, -8.14113916, -34.93361651, CAST(0x0000A25D017BFA5D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (1999, 56, NULL, -8.14099262, -34.9337504, CAST(0x0000A25D017BFCB2 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2000, 56, NULL, -8.14083721, -34.93387537, CAST(0x0000A25D017BFF0A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2001, 56, NULL, -8.14068111, -34.93401222, CAST(0x0000A25D017C0162 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2002, 56, NULL, -8.1405041, -34.93416265, CAST(0x0000A25D017C04E7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2003, 56, NULL, -8.14032695, -34.93430318, CAST(0x0000A25D017C1C57 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2004, 56, NULL, -8.14016225, -34.9344613, CAST(0x0000A25D017C2104 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2005, 56, NULL, -8.13999418, -34.93462193, CAST(0x0000A25D017C248A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2006, 56, NULL, -8.13980622, -34.93479403, CAST(0x0000A25D017C2810 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2007, 56, NULL, -8.13966708, -34.93492546, CAST(0x0000A25D017C2A64 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2008, 56, NULL, -8.13946038, -34.9350859, CAST(0x0000A25D017C2DED AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2009, 56, NULL, -8.1393117, -34.93521798, CAST(0x0000A25D017C3F7C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2010, 56, NULL, -8.1391693, -34.93535975, CAST(0x0000A25D017C455A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2011, 56, NULL, -8.13902184, -34.93548373, CAST(0x0000A25D017C48DF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2012, 56, NULL, -8.13883108, -34.93564613, CAST(0x0000A25D017C4C62 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2013, 56, NULL, -8.13869027, -34.93577191, CAST(0x0000A25D017C4EBA AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2014, 56, NULL, -8.13853762, -34.93591038, CAST(0x0000A25D017C5112 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2015, 56, NULL, -8.13837016, -34.93605903, CAST(0x0000A25D017C536A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2016, 56, NULL, -8.13820042, -34.93621023, CAST(0x0000A25D017C55C1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2017, 56, NULL, -8.13794372, -34.93643442, CAST(0x0000A25D017C5948 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2018, 56, NULL, -8.13777608, -34.93656407, CAST(0x0000A25D017C5BA1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2019, 56, NULL, -8.13759991, -34.93666391, CAST(0x0000A25D017C5DF9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2020, 56, NULL, -8.13741897, -34.93675398, CAST(0x0000A25D017C6051 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2021, 56, NULL, -8.13725193, -34.93684352, CAST(0x0000A25D017C62A6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2022, 56, NULL, -8.13709513, -34.93693631, CAST(0x0000A25D017C64FE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2023, 56, NULL, -8.13689253, -34.93706669, CAST(0x0000A25D017C6885 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2024, 56, NULL, -8.13667637, -34.93714833, CAST(0x0000A25D017C6D35 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2025, 56, NULL, -8.13648315, -34.93718165, CAST(0x0000A25D017C86FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2026, 56, NULL, -8.13629117, -34.93720757, CAST(0x0000A25D017C8CD8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2027, 56, NULL, -8.13606771, -34.93721901, CAST(0x0000A25D017C9185 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2028, 56, NULL, -8.13586555, -34.93724001, CAST(0x0000A25D017C950A AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2029, 56, NULL, -8.13564911, -34.93724637, CAST(0x0000A25D017C988F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2030, 56, NULL, -8.13544103, -34.93727435, CAST(0x0000A25D017C9C14 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2031, 56, NULL, -8.1352557, -34.93733763, CAST(0x0000A25D017C9F99 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2032, 56, NULL, -8.13512546, -34.93748716, CAST(0x0000A25D017CA31D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2033, 56, NULL, -8.13508614, -34.93768097, CAST(0x0000A25D017CA6A0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2034, 56, NULL, -8.13508193, -34.93788716, CAST(0x0000A25D017CAA25 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2035, 56, NULL, -8.1350843, -34.9381023, CAST(0x0000A25D017CAECF AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2036, 56, NULL, -8.13510583, -34.93830202, CAST(0x0000A25D017CCC21 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2037, 56, NULL, -8.13512148, -34.93851673, CAST(0x0000A25D017CD0D1 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2038, 56, NULL, -8.13516246, -34.93870377, CAST(0x0000A25D017CD453 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2039, 56, NULL, -8.13525217, -34.93887871, CAST(0x0000A25D017CD7D7 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2040, 56, NULL, -8.13538821, -34.93902113, CAST(0x0000A25D017CDB5D AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2041, 56, NULL, -8.13553251, -34.93914877, CAST(0x0000A25D017CDEDE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2042, 56, NULL, -8.13570232, -34.93924679, CAST(0x0000A25D017CE262 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2043, 56, NULL, -8.13586388, -34.93933454, CAST(0x0000A25D017CE5E8 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2044, 56, NULL, -8.13599874, -34.93945753, CAST(0x0000A25D017CE96B AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2045, 56, NULL, -8.13607398, -34.93963634, CAST(0x0000A25D017CECF0 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2046, 56, NULL, -8.13610953, -34.93982319, CAST(0x0000A25D017CF074 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2047, 56, NULL, -8.13604693, -34.94005334, CAST(0x0000A25D017CF522 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2048, 56, NULL, -8.13590823, -34.94023273, CAST(0x0000A25D017CF8A6 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2049, 56, NULL, -8.13573696, -34.94034287, CAST(0x0000A25D017CFC27 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2050, 56, NULL, -8.13555581, -34.94043919, CAST(0x0000A25D017CFFAE AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2051, 56, NULL, -8.13539237, -34.94052544, CAST(0x0000A25D017D0335 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2052, 56, NULL, -8.13522067, -34.94062689, CAST(0x0000A25D017D3596 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2053, 56, NULL, -8.13504423, -34.94074054, CAST(0x0000A25D017D3C9F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2054, 56, NULL, -8.13483771, -34.94084017, CAST(0x0000A25D017D414F AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2055, 56, NULL, -8.13466061, -34.94093585, CAST(0x0000A25D017D44D3 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2056, 56, NULL, -8.13447271, -34.94103285, CAST(0x0000A25D017D4856 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2057, 56, NULL, -8.13430909, -34.9411154, CAST(0x0000A25D017D4BD9 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2058, 56, NULL, -8.13415766, -34.94130534, CAST(0x0000A25D017D5089 AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2059, 56, NULL, -8.13408911, -34.94148235, CAST(0x0000A25D017D540C AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2060, 56, NULL, -8.13403065, -34.94168803, CAST(0x0000A25D017D58BD AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2061, 56, NULL, -8.13397289, -34.9418628, CAST(0x0000A25D017D67FC AS DateTime))
GO
INSERT [dbo].[Coordenada] ([IdCoordenada], [IdRota], [IdTipoCoordenada], [Latitude], [Longitude], [Data]) VALUES (2062, 56, NULL, -8.13379493, -34.94192086, CAST(0x0000A25D017D7ABD AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Coordenada] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificuldade] ON 

GO
INSERT [dbo].[Dificuldade] ([IdDificuldade], [Descricao]) VALUES (1, N'Fácil')
GO
INSERT [dbo].[Dificuldade] ([IdDificuldade], [Descricao]) VALUES (2, N'Média')
GO
INSERT [dbo].[Dificuldade] ([IdDificuldade], [Descricao]) VALUES (3, N'Difícil')
GO
SET IDENTITY_INSERT [dbo].[Dificuldade] OFF
GO
SET IDENTITY_INSERT [dbo].[Evento] ON 

GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (1, 3, 12, N'Evento Mock 1', N'Este evento foi criado como mock para dar continuidade a implementação do backlog.', CAST(0x0000A23800000000 AS DateTime), N'http://logon.prozis.com/images/ciclismo-01.jpg', 1)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (5, 26, 12, N'Evento Mock 1', N'Este evento foi criado como mock para dar continuidade a implementação do backlog.', CAST(0x0000A238001BA88F AS DateTime), NULL, 0)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (6, 26, 12, N'Evento 6', N'Este evento foi criado como mock para dar continuidade a implementação do backlog.', CAST(0x0000A238001BA88F AS DateTime), NULL, 0)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (7, 26, 12, N'Evento Mock 3', N'Este evento foi criado como mock para dar continuidade a implementação do backlog.', CAST(0x0000A238001BA88F AS DateTime), NULL, 0)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (8, 26, 12, N'Evento Mock 4', N'Este evento foi criado como mock para dar continuidade a implementação do backlog.', CAST(0x0000A238001BA88F AS DateTime), NULL, 0)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (11, 26, 55, N'Passeio por Boa Viagem', N'A certificação de metodologias que nos auxiliam a lidar com o aumento do diálogo entre os diferentes setores produtivos é uma das consequências dos procedimentos normalmente adotados.', CAST(0x0000A28700000000 AS DateTime), N'http://jconlineimagem.ne10.uol.com.br/imagem/noticia/2012/12/29/normal/de656356f8d7c74e21726c03df5ae467.jpg', 1)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (12, 26, 38, N'Recife Antigo à Imbiribeira', N'Podemos já vislumbrar o modo pelo qual a competitividade nas transações comerciais apresenta tendências no sentido de aprovar a manutenção de alternativas às soluções ortodoxas.', CAST(0x0000A26C00000000 AS DateTime), N'http://img2.ne10.uol.com.br/repositorio/noticia/96e90b98c38946b56126b8765a9b13c7.jpg', 1)
GO
INSERT [dbo].[Evento] ([IdEvento], [IdUsuario], [IdRota], [Titulo], [Descricao], [Data], [UrlImagem], [Publico]) VALUES (13, 26, 21, N'Arrumadinho de Santo Amaro', N'Desta maneira, a hegemonia do ambiente político prepara-nos para enfrentar situações atípicas decorrentes dos conhecimentos estratégicos para atingir a excelência.', CAST(0x0000A26500000000 AS DateTime), N'http://cacimba.files.wordpress.com/2012/10/img_2595.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[Evento] OFF
GO
INSERT [dbo].[EventoUsuario] ([IdUsuario], [IdEvento]) VALUES (3, 12)
GO
SET IDENTITY_INSERT [dbo].[QualidadeRota] ON 

GO
INSERT [dbo].[QualidadeRota] ([IdQualidadeRota], [Descricao]) VALUES (1, N'Baixa')
GO
INSERT [dbo].[QualidadeRota] ([IdQualidadeRota], [Descricao]) VALUES (2, N'Média')
GO
INSERT [dbo].[QualidadeRota] ([IdQualidadeRota], [Descricao]) VALUES (3, N'Alta')
GO
SET IDENTITY_INSERT [dbo].[QualidadeRota] OFF
GO
SET IDENTITY_INSERT [dbo].[Resposta] ON 

GO
INSERT [dbo].[Resposta] ([IdResposta], [Descricao]) VALUES (1, N'Não vou')
GO
INSERT [dbo].[Resposta] ([IdResposta], [Descricao]) VALUES (2, N'Vou')
GO
INSERT [dbo].[Resposta] ([IdResposta], [Descricao]) VALUES (3, N'Talvez')
GO
SET IDENTITY_INSERT [dbo].[Resposta] OFF
GO
SET IDENTITY_INSERT [dbo].[Rota] ON 

GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (3, 3, 2, 2, 1, 1, N'Rota Windows Phone 1', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (11, 3, 3, 1, 1, 3, N'Rota Windows Phone 2', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (12, 3, 3, 1, 1, 2, N'Rota Windows Phone 3', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (13, 3, 1, 1, 1, 1, N'Rota Windows Phone 4', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (19, 26, 1, 1, 1, 1, N'Retão da Imbiribeira', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (20, 26, 3, 1, 3, 1, N'Faculdade - Cafofo', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (21, 26, 1, 1, 1, 1, N'Trabalho - Arrumadinho de Santo Amaro', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (22, 26, 1, 1, 1, 1, N'C ao contrário', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (23, 26, 1, 1, 1, 1, N'Nagem - Joaquim Nabuco (Centro do Recife)', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (37, 3, 1, 2, 1, 1, N'Rota Windows Phone 5', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (38, 26, 1, 1, 1, 1, N'Trabalho - Faculdade', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (41, 4, 2, 2, 1, 1, N'Rota do usuario contato', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (52, 26, 1, 1, 1, 1, N'Rua da Erva', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (55, 26, 1, 1, 1, 1, N'Jordao - Pracinha de Boa Viagem', NULL)
GO
INSERT [dbo].[Rota] ([IdRota], [IdUsuario], [IdTipoPista], [IdTipoRota], [IdDificuldade], [IdQualidadeRota], [Descricao], [IdRotaOrigem]) VALUES (56, 26, 1, 2, 1, 1, N'Jordao - Pracinha de Boa Viagem', NULL)
GO
SET IDENTITY_INSERT [dbo].[Rota] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoCoordenada] ON 

GO
INSERT [dbo].[TipoCoordenada] ([IdTipoCoordenada], [Descricao]) VALUES (1, N'TipoCoordenada#1')
GO
INSERT [dbo].[TipoCoordenada] ([IdTipoCoordenada], [Descricao]) VALUES (2, N'TipoCoordenada#2')
GO
SET IDENTITY_INSERT [dbo].[TipoCoordenada] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoPista] ON 

GO
INSERT [dbo].[TipoPista] ([IdTipoPista], [Descricao]) VALUES (1, N'Asfalto')
GO
INSERT [dbo].[TipoPista] ([IdTipoPista], [Descricao]) VALUES (2, N'Barro')
GO
INSERT [dbo].[TipoPista] ([IdTipoPista], [Descricao]) VALUES (3, N'Areia')
GO
INSERT [dbo].[TipoPista] ([IdTipoPista], [Descricao]) VALUES (4, N'Montanhosa')
GO
SET IDENTITY_INSERT [dbo].[TipoPista] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoRota] ON 

GO
INSERT [dbo].[TipoRota] ([IdTipoRota], [Descricao]) VALUES (1, N'Pública')
GO
INSERT [dbo].[TipoRota] ([IdTipoRota], [Descricao]) VALUES (2, N'Privada')
GO
SET IDENTITY_INSERT [dbo].[TipoRota] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (3, N'Usuario Mock', N'usuario', N'123456', N'usuario@email.com', N'M', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (4, N'Contato Mock', N'contato', N'123456', N'contato@email.com', N'M', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (18, N'Marcus Gay', N'mgay', N'2424', N'soumuito@gay.cu', N'F', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (21, N'Paulo E. Santos', N'psantos', N'123', N'cyberpsi@gmail.com', N'M', N'tmp4984.jpg', CAST(0x00004E9200000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (22, N'Teste', N'ddinarte', N'123456', N'ddinarte@gmail.com', N'M', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (26, N'Marcus', N'marcus', N'123456', N'marcus@teste.com', N'M', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (27, N'mpaulo', N'mpaulo', N'mpaulo', N'mpaulo@gmail.com', N'M', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (29, N'Eduardo', N'cyberpsi', N'123', N'cyberpsi@hotmail.com', N'F', N'avatar.png', CAST(0x00004E7800000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (31, N'Tarcísio S. Luna', N'tarluna', N'123', N'tarluna@gmail.com', N'M', N'avatar.png', CAST(0x00007F7500000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (37, N'Penaforte', N'pena', N'123', N'tarluna@outlookc.om', N'M', N'avatar.png', CAST(0x00007EFB00000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (38, N'Gabriel', N'gabriel', N'123', N'gabriel@dominio.com', N'F', N'avatar.png', CAST(0x0000240500000000 AS DateTime))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nome], [Login], [Senha], [Email], [Sexo], [UrlImagem], [DataDeNascimento]) VALUES (39, N'Everto', N'everton', N'123', N'evertonrenne@gmail.com', N'M', N'avatar.png', CAST(0x0000813C00000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Email]    Script Date: 29/10/2013 08:17:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Email] ON [dbo].[Usuario]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Login]    Script Date: 29/10/2013 08:17:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Login] ON [dbo].[Usuario]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bicicleta]  WITH CHECK ADD  CONSTRAINT [FK_Bicicleta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Bicicleta] CHECK CONSTRAINT [FK_Bicicleta_Usuario]
GO
ALTER TABLE [dbo].[ComentarioEvento]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioEvento_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[ComentarioEvento] CHECK CONSTRAINT [FK_ComentarioEvento_Evento]
GO
ALTER TABLE [dbo].[ComentarioEvento]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioEvento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ComentarioEvento] CHECK CONSTRAINT [FK_ComentarioEvento_Usuario]
GO
ALTER TABLE [dbo].[Contato]  WITH CHECK ADD  CONSTRAINT [FK_Contato_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Contato] CHECK CONSTRAINT [FK_Contato_Usuario]
GO
ALTER TABLE [dbo].[Contato]  WITH CHECK ADD  CONSTRAINT [FK_Contato_Usuario_Contato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Contato] CHECK CONSTRAINT [FK_Contato_Usuario_Contato]
GO
ALTER TABLE [dbo].[ConviteEvento]  WITH CHECK ADD  CONSTRAINT [FK_ConviteEvento_Contato] FOREIGN KEY([IdUsuario], [IdContato])
REFERENCES [dbo].[Contato] ([IdUsuario], [IdContato])
GO
ALTER TABLE [dbo].[ConviteEvento] CHECK CONSTRAINT [FK_ConviteEvento_Contato]
GO
ALTER TABLE [dbo].[ConviteEvento]  WITH CHECK ADD  CONSTRAINT [FK_ConviteEvento_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[ConviteEvento] CHECK CONSTRAINT [FK_ConviteEvento_Evento]
GO
ALTER TABLE [dbo].[ConviteEvento]  WITH CHECK ADD  CONSTRAINT [FK_ConviteEvento_Resposta] FOREIGN KEY([IdResposta])
REFERENCES [dbo].[Resposta] ([IdResposta])
GO
ALTER TABLE [dbo].[ConviteEvento] CHECK CONSTRAINT [FK_ConviteEvento_Resposta]
GO
ALTER TABLE [dbo].[Coordenada]  WITH CHECK ADD  CONSTRAINT [FK_Coordenada_Rota] FOREIGN KEY([IdRota])
REFERENCES [dbo].[Rota] ([IdRota])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coordenada] CHECK CONSTRAINT [FK_Coordenada_Rota]
GO
ALTER TABLE [dbo].[Coordenada]  WITH CHECK ADD  CONSTRAINT [FK_Coordenada_TipoCoordenada] FOREIGN KEY([IdTipoCoordenada])
REFERENCES [dbo].[TipoCoordenada] ([IdTipoCoordenada])
GO
ALTER TABLE [dbo].[Coordenada] CHECK CONSTRAINT [FK_Coordenada_TipoCoordenada]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Rota] FOREIGN KEY([IdRota])
REFERENCES [dbo].[Rota] ([IdRota])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Rota]
GO
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Usuario]
GO
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Evento]
GO
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Usuario]
GO
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_Dificuldade] FOREIGN KEY([IdDificuldade])
REFERENCES [dbo].[Dificuldade] ([IdDificuldade])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_Dificuldade]
GO
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_QualidadeRota] FOREIGN KEY([IdQualidadeRota])
REFERENCES [dbo].[QualidadeRota] ([IdQualidadeRota])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_QualidadeRota]
GO
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_Rota] FOREIGN KEY([IdRotaOrigem])
REFERENCES [dbo].[Rota] ([IdRota])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_Rota]
GO
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_TipoPista] FOREIGN KEY([IdTipoPista])
REFERENCES [dbo].[TipoPista] ([IdTipoPista])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_TipoPista]
GO
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_TipoRota] FOREIGN KEY([IdTipoRota])
REFERENCES [dbo].[TipoRota] ([IdTipoRota])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_TipoRota]
GO
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_Usuario]
GO
USE [master]
GO
ALTER DATABASE [db0542e5f1e2ef4c29a2eaa22b00261fce] SET  READ_WRITE 
GO
