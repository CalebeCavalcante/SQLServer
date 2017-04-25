USE [DATA_BASE_NAME]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Declarar uma vari�vel TABLE para guardar os dados atuais ******/
/****** Manter os mesmos formatos - Dica: Ir na Tabela -> Bot�o Direito > Scripts -> Create Table :  Gera o script de cria��o que o Management Studio disponibiliza ******/
/****** Copiar os campos e formatos e colocar aqui ******/
DECLARE @TABLE_TEMP TABLE  (
	[MATRICULA] [int] NOT NULL,
	[NOME_COMPLETO] [nvarchar](255) NOT NULL
) 

/****** Inserindo dados na tabela tempor�ria ******/
INSERT @TABLE_TEMP SELECT * FROM [dbo].[TB_USUARIOS]

/****** Deletando Objeto Table ******/
DROP TABLE  [dbo].[TB_USUARIOS]

/****** Criando a Tabela Novamente Com os Novos campos necess�rios ******/
CREATE TABLE [dbo].[TB_USUARIOS](
	[MATRICULA] [int] NOT NULL,
	[NOME_COMPLETO] [nvarchar](255) NOT NULL
	,
	[NOME_SUPERVISOR] [nvarchar](255) NULL,
	[STATUS_CODE] [int] NOT NULL
) ON [PRIMARY]

/****** Inserindo dados da Table Tempor�rio para manter o hist�rico ******/
/****** Observa��es:

� obrigat�rio listar os campos que ser�o inseridos, pois colocar um insert into table select * from n�o vai funcionar pois novos campos foram inseridos na cria��o da tabela.
O comando "GO" n�o pode ser executado antes de inserir, pois se for feito, os dados tempor�rios ser�o apagados
 ******/
INSERT [dbo].[TB_USUARIOS] (
	[MATRICULA],
	[NOME_COMPLETO] 
) SELECT * FROM @TABLE_TEMP

GO
