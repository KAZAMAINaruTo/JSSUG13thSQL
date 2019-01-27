USE [JSSUG_DEV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fn_ChangeFullWidthToHalfWidth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[Fn_ChangeFullWidthToHalfWidth](@str varchar(512))
	RETURNS varchar(512)
AS
BEGIN
	--Arithmetic operator conversion
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Å~'', ''*'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅÄ'', ''/'')
	
	--The order in accordance with ASCII(20-126)
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Å@'', '' '')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅI'', ''!'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åh'', ''"'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åî'', ''#'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åê'', ''$'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åì'', ''%'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åï'', ''&'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åf'', '''''''')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åi'', ''('')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åj'', '')'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åñ'', ''*'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Å{'', ''+'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅC'', '','')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Å|'', ''-'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅD'', ''.'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Å^'', ''/'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇO'', ''0'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇP'', ''1'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇQ'', ''2'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇR'', ''3'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇS'', ''4'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇT'', ''5'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇU'', ''6'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇV'', ''7'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇW'', ''8'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇX'', ''9'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅF'', '':'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅG'', '';'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅÉ'', ''<'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅÅ'', ''='')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅÑ'', ''>'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''?'', ''?'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åó'', ''@'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ç`'', ''A'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ça'', ''B'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çb'', ''C'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çc'', ''D'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çd'', ''E'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çe'', ''F'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çf'', ''G'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çg'', ''H'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çh'', ''I'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çi'', ''J'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çj'', ''K'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çk'', ''L'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çl'', ''M'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çm'', ''N'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çn'', ''O'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ço'', ''P'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çp'', ''Q'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çq'', ''R'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çr'', ''S'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çs'', ''T'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çt'', ''U'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çu'', ''V'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çv'', ''W'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çw'', ''X'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çx'', ''Y'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çy'', ''Z'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅM'', ''`'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇÅ'', ''a'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇÇ'', ''b'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇÉ'', ''c'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇÑ'', ''d'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇÖ'', ''e'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÇÜ'', ''f'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çá'', ''g'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çà'', ''h'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çâ'', ''i'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çä'', ''j'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çã'', ''k'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çå'', ''l'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çç'', ''m'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çé'', ''n'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çè'', ''o'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çê'', ''p'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çë'', ''q'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çí'', ''r'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çì'', ''s'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çî'', ''t'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çï'', ''u'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çñ'', ''v'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çó'', ''w'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çò'', ''x'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çô'', ''y'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Çö'', ''z'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åo'', ''{'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åb'', ''|'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Åp'', ''}'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅP'', ''~'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ÅE'', ''+'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Å`'', ''+'')
	--Trim the result
	SET @str = REPLACE(@str COLLATE Japanese_BIN, '' '', '''')
	
	--Return the result
	RETURN @str
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SKU]') AND type in (N'U'))
	DROP TABLE dbo.SKU
	
CREATE TABLE [dbo].[SKU](
	[Sku] [varchar](7) NOT NULL,
	[SkuDesc] [varchar](60) NOT NULL,
	[SkuWeightDesc] [varchar](60) NOT NULL,
	[SkuWeight] [float] NOT NULL,
 CONSTRAINT [PK_SKU] PRIMARY KEY CLUSTERED 
(
	[Sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000001', N'è§ïi00', N'ÇSÇOÇOÇáÅiÇRÅ`ÇSêlëOÅjÅ@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000002', N'è§ïi01', N'ÇPë‹ÅiÇRÇOÇOÇáÅjÅ@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000003', N'è§ïi02', N'ÇPÇSÇOÇáÅiÇVÇOÇáÅ~ÇQë‹ÅjÅ@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000004', N'è§ïi03', N'ÇWÇOÇáÅ~ÇQÅ@Å@Å@Å@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000005', N'è§ïi04', N'ÇSÇTÇáÅ~ÇRÅiÇΩÇÍÅEÇ©ÇÁÇµïtÅjÅ@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000006', N'è§ïi05', N'ÇQÇQÇOÇáÅ@Å@Å@Å@Å@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000007', N'è§ïi06', N'ÇWÇOÇáÅiïWèÄÇTñáì¸ÅjÅ~ÇQÅ@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000008', N'è§ïi07', N'ÇPÇUÉRÅiÇQÇSÇOÇáÅjÅ@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000009', N'è§ïi08', N'ÇPÇQÇUÇáÅiÇVñáÅjÅ@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000010', N'è§ïi09', N'ÇWñ{ì¸ÅiÇPÇVÇQÇáÅjÅ@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000011', N'è§ïi0A', N'ÇVÇOÇáÅiïWèÄÇTñáì¸ÅjÅ@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000012', N'è§ïi0B', N'ÇWÇWÇOÇáÅ{ÇTÇOÇáÅ@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000013', N'è§ïi0C', N'ÇRéÌÇPÇOÉRÅiÇQÇPÇOÇáÅjÅ@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000014', N'è§ïi0D', N'ÇSÇOÇáÅ~ÇQÅiÇΩÇÍÅEÇ©ÇÁÇµïtÇ´Åj', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000015', N'è§ïi0E', N'ÇPÇOÇOÇáÅ~ÇRÅ@Å@Å@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000016', N'è§ïi0F', N'ÇPÇRÇOÇáÅ{ÇPÇRÇáÅ@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000017', N'è§ïi10', N'ÇRÇUÇOÇáÅiÇﬂÇÒÇPÇTÇOÇáÅ~ÇQÅjÅ@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000018', N'è§ïi11', N'ÅiÇPÇTÇOÇáÅ~ÇQÅjÅ~ÇQÅ@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000019', N'è§ïi12', N'ÇPÇTÇOÇáÅ~ÇTÅ~ÇQéÌÅ@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000020', N'è§ïi13', N'ÇQÇOÇOÇáÅiå≈å`ó ÇPÇQÇOÇáÅjÅ~ÇQ', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000021', N'è§ïi14', N'ÇQÇUÇOÇáÅiÇQÇUÇáÅ~ÇPÇOÉRÅjÅ@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000022', N'è§ïi15', N'ÇPÇVÇOÇáÅiÇQÅ`ÇRêlëOÅjÅ~ÇQÅ@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000023', N'è§ïi16', N'ã∆ñ±ópÅ@ÇWÇTÇOÇáÅiÇTÇOÉRÅjÅ@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000024', N'è§ïi17', N'ìÿì˜Ç©ÇÁógÇ∞ÇPÇQÇOÇáÅEÇΩÇÍÇWÇO', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000025', N'è§ïi18', N'ÇQÇPÇOÇáÅiïWèÄÇPÇTÅ`ÇPÇWÉRì¸Åj', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000026', N'è§ïi19', N'ÇRÇOÇOÇáÅiñÒÇPÇTÇOÇáÅ~ÇQÅjÅ@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000027', N'è§ïi1A', N'ÇTÇOÇOÇáÅiñÒÇPÇPÅ`ÇPÇSñ{ÅjÅ@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000028', N'è§ïi1B', N'ÅiéOîtê|ÅjÇWÇOÇáÅ~ÇRÅ@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000029', N'è§ïi1C', N'ÇPÇOÇOÇáÅiÇPÇXÅ`ÇQÇQîˆÅjÅ@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000030', N'è§ïi1D', N'ÇWîˆÅiÇPÇUÇWÇáÅjÅ@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000031', N'è§ïi1E', N'ÇPñáÅiÇVÇOÇáÅjÅ@Å@Å@Å@Å@Å@Å@Å@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000032', N'è§ïi1F', N'ÇOÅDÇTÇãÇáÅiñÒÇPÇPÅ`ÇPÇSñ{ÅjÅ@', 0)
GO