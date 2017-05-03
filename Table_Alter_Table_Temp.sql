USE [DATA_BASE_NAME]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Declarar uma variável TABLE para guardar os dados atuais ******/
/****** Manter os mesmos formatos - Dica: Ir na Tabela -> Botão Direito > Scripts -> Create Table :  Gera o script de criação que o Management Studio disponibiliza ******/
/****** Copiar os campos e formatos e colocar aqui ******/
DECLARE @TABLE_TEMP TABLE  (
	[MATRICULA] [int] NOT NULL,
	[NOME_COMPLETO] [nvarchar](255) NOT NULL
) 

/****** Inserindo dados na tabela temporária ******/
INSERT @TABLE_TEMP SELECT * FROM [dbo].[TB_USUARIOS]

/****** Deletando Objeto Table ******/
DROP TABLE  [dbo].[TB_USUARIOS]

/****** Criando a Tabela Novamente Com os Novos campos necessários ******/
CREATE TABLE [dbo].[TB_USUARIOS](
	[MATRICULA] [int] NOT NULL,
	[NOME_COMPLETO] [nvarchar](255) NOT NULL
	,
	[NOME_SUPERVISOR] [nvarchar](255) NULL,
	[STATUS_CODE] [int] NOT NULL
) ON [PRIMARY]

/****** Inserindo dados da Table Temporário para manter o histórico ******/
/****** Observações:

É obrigatório listar os campos que serão inseridos, pois colocar um insert into table select * from não vai funcionar pois novos campos foram inseridos na criação da tabela.
O comando "GO" não pode ser executado antes de inserir, pois se for feito, os dados temporários serão apagados
 ******/
INSERT [dbo].[TB_USUARIOS] (
	[MATRICULA],
	[NOME_COMPLETO] 
) SELECT 
	[MATRICULA],
	[NOME_COMPLETO]
FROM @TABLE_TEMP

GO
