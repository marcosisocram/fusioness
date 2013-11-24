USE [db0542e5f1e2ef4c29a2eaa22b00261fce]
GO
/****** Object:  Table [dbo].[Resposta]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QualidadeRota]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dificuldade]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPista]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoCoordenada]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rota]    Script Date: 11/24/2013 12:29:27 ******/
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
	[IdDificuldade] [int] NULL,
	[IdQualidadeRota] [int] NULL,
	[Descricao] [varchar](50) NULL,
	[IdRotaOrigem] [int] NULL,
 CONSTRAINT [PK_Rota] PRIMARY KEY CLUSTERED 
(
	[IdRota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsuarioTokenSenha]    Script Date: 11/24/2013 12:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioTokenSenha](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Token] [varchar](255) NOT NULL,
	[DataDeGeracao] [datetime] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[JaUsado] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioTokenSenha] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bicicleta]    Script Date: 11/24/2013 12:29:26 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contato]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConviteUsuarioEmail]    Script Date: 11/24/2013 12:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConviteUsuarioEmail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioConvidou] [int] NOT NULL,
	[EmailConvidado] [varchar](255) NOT NULL,
	[DataDoConvite] [datetime] NOT NULL,
 CONSTRAINT [PK_ConviteUsuarioEmail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Coordenada]    Script Date: 11/24/2013 12:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coordenada](
	[IdCoordenada] [int] IDENTITY(1,1) NOT NULL,
	[IdRota] [int] NOT NULL,
	[IdTipoCoordenada] [int] NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Data] [datetime] NULL,
	[NomePonto] [varchar](50) NULL,
	[DescricaoPonto] [varchar](200) NULL,
	[UrlImagemPonto] [varchar](2000) NULL,
 CONSTRAINT [PK_Coordenada] PRIMARY KEY CLUSTERED 
(
	[IdCoordenada] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventoUsuario]    Script Date: 11/24/2013 12:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoUsuario](
	[IdUsuario] [int] NOT NULL,
	[IdEvento] [int] NOT NULL,
	[DataInicial] [datetime] NULL,
	[DataFinal] [datetime] NULL,
 CONSTRAINT [PK_EventoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdEvento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConviteEvento]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComentarioEvento]    Script Date: 11/24/2013 12:29:27 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Bicicleta_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Bicicleta]  WITH CHECK ADD  CONSTRAINT [FK_Bicicleta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Bicicleta] CHECK CONSTRAINT [FK_Bicicleta_Usuario]
GO
/****** Object:  ForeignKey [FK_ComentarioEvento_Evento]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[ComentarioEvento]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioEvento_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComentarioEvento] CHECK CONSTRAINT [FK_ComentarioEvento_Evento]
GO
/****** Object:  ForeignKey [FK_ComentarioEvento_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[ComentarioEvento]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioEvento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ComentarioEvento] CHECK CONSTRAINT [FK_ComentarioEvento_Usuario]
GO
/****** Object:  ForeignKey [FK_Contato_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Contato]  WITH CHECK ADD  CONSTRAINT [FK_Contato_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Contato] CHECK CONSTRAINT [FK_Contato_Usuario]
GO
/****** Object:  ForeignKey [FK_Contato_Usuario_Contato]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Contato]  WITH CHECK ADD  CONSTRAINT [FK_Contato_Usuario_Contato] FOREIGN KEY([IdContato])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Contato] CHECK CONSTRAINT [FK_Contato_Usuario_Contato]
GO
/****** Object:  ForeignKey [FK_ConviteEvento_Contato]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[ConviteEvento]  WITH CHECK ADD  CONSTRAINT [FK_ConviteEvento_Contato] FOREIGN KEY([IdUsuario], [IdContato])
REFERENCES [dbo].[Contato] ([IdUsuario], [IdContato])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConviteEvento] CHECK CONSTRAINT [FK_ConviteEvento_Contato]
GO
/****** Object:  ForeignKey [FK_ConviteEvento_Evento]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[ConviteEvento]  WITH CHECK ADD  CONSTRAINT [FK_ConviteEvento_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
GO
ALTER TABLE [dbo].[ConviteEvento] CHECK CONSTRAINT [FK_ConviteEvento_Evento]
GO
/****** Object:  ForeignKey [FK_ConviteEvento_Resposta]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[ConviteEvento]  WITH CHECK ADD  CONSTRAINT [FK_ConviteEvento_Resposta] FOREIGN KEY([IdResposta])
REFERENCES [dbo].[Resposta] ([IdResposta])
GO
ALTER TABLE [dbo].[ConviteEvento] CHECK CONSTRAINT [FK_ConviteEvento_Resposta]
GO
/****** Object:  ForeignKey [FK_ConviteUsuarioEmail_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[ConviteUsuarioEmail]  WITH CHECK ADD  CONSTRAINT [FK_ConviteUsuarioEmail_Usuario] FOREIGN KEY([IdUsuarioConvidou])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[ConviteUsuarioEmail] CHECK CONSTRAINT [FK_ConviteUsuarioEmail_Usuario]
GO
/****** Object:  ForeignKey [FK_Coordenada_Rota]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Coordenada]  WITH CHECK ADD  CONSTRAINT [FK_Coordenada_Rota] FOREIGN KEY([IdRota])
REFERENCES [dbo].[Rota] ([IdRota])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coordenada] CHECK CONSTRAINT [FK_Coordenada_Rota]
GO
/****** Object:  ForeignKey [FK_Coordenada_TipoCoordenada]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Coordenada]  WITH CHECK ADD  CONSTRAINT [FK_Coordenada_TipoCoordenada] FOREIGN KEY([IdTipoCoordenada])
REFERENCES [dbo].[TipoCoordenada] ([IdTipoCoordenada])
GO
ALTER TABLE [dbo].[Coordenada] CHECK CONSTRAINT [FK_Coordenada_TipoCoordenada]
GO
/****** Object:  ForeignKey [FK_Evento_Rota]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Rota] FOREIGN KEY([IdRota])
REFERENCES [dbo].[Rota] ([IdRota])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Rota]
GO
/****** Object:  ForeignKey [FK_Evento_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Evento]  WITH CHECK ADD  CONSTRAINT [FK_Evento_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Evento] CHECK CONSTRAINT [FK_Evento_Usuario]
GO
/****** Object:  ForeignKey [FK_EventoUsuario_Evento]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Evento] FOREIGN KEY([IdEvento])
REFERENCES [dbo].[Evento] ([IdEvento])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Evento]
GO
/****** Object:  ForeignKey [FK_EventoUsuario_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[EventoUsuario]  WITH CHECK ADD  CONSTRAINT [FK_EventoUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventoUsuario] CHECK CONSTRAINT [FK_EventoUsuario_Usuario]
GO
/****** Object:  ForeignKey [FK_Rota_Dificuldade]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_Dificuldade] FOREIGN KEY([IdDificuldade])
REFERENCES [dbo].[Dificuldade] ([IdDificuldade])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_Dificuldade]
GO
/****** Object:  ForeignKey [FK_Rota_QualidadeRota]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_QualidadeRota] FOREIGN KEY([IdQualidadeRota])
REFERENCES [dbo].[QualidadeRota] ([IdQualidadeRota])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_QualidadeRota]
GO
/****** Object:  ForeignKey [FK_Rota_Rota]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_Rota] FOREIGN KEY([IdRotaOrigem])
REFERENCES [dbo].[Rota] ([IdRota])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_Rota]
GO
/****** Object:  ForeignKey [FK_Rota_TipoPista]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_TipoPista] FOREIGN KEY([IdTipoPista])
REFERENCES [dbo].[TipoPista] ([IdTipoPista])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_TipoPista]
GO
/****** Object:  ForeignKey [FK_Rota_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[Rota]  WITH CHECK ADD  CONSTRAINT [FK_Rota_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Rota] CHECK CONSTRAINT [FK_Rota_Usuario]
GO
/****** Object:  ForeignKey [FK_UsuarioTokenSenha_Usuario]    Script Date: 11/24/2013 12:29:27 ******/
ALTER TABLE [dbo].[UsuarioTokenSenha]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioTokenSenha_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[UsuarioTokenSenha] CHECK CONSTRAINT [FK_UsuarioTokenSenha_Usuario]
GO
