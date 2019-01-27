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
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�~'', ''*'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''/'')
	
	--The order in accordance with ASCII(20-126)
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�@'', '' '')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�I'', ''!'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�h'', ''"'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''#'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''$'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''%'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''&'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�f'', '''''''')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�i'', ''('')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�j'', '')'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''*'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�{'', ''+'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�C'', '','')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�|'', ''-'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�D'', ''.'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�^'', ''/'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�O'', ''0'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�P'', ''1'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�Q'', ''2'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�R'', ''3'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�S'', ''4'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�T'', ''5'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�U'', ''6'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�V'', ''7'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�W'', ''8'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�X'', ''9'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�F'', '':'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�G'', '';'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''<'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''='')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''>'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''?'', ''?'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''@'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�`'', ''A'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�a'', ''B'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�b'', ''C'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�c'', ''D'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�d'', ''E'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�e'', ''F'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�f'', ''G'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�g'', ''H'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�h'', ''I'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�i'', ''J'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�j'', ''K'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�k'', ''L'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�l'', ''M'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�m'', ''N'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�n'', ''O'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�o'', ''P'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�p'', ''Q'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�q'', ''R'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�r'', ''S'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�s'', ''T'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�t'', ''U'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�u'', ''V'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�v'', ''W'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�w'', ''X'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�x'', ''Y'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�y'', ''Z'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�M'', ''`'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''a'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''b'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''c'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''d'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''e'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''f'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''g'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''h'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''i'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''j'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''k'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''l'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''m'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''n'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''o'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''p'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''q'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''r'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''s'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''t'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''u'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''v'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''w'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''x'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''y'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''��'', ''z'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�o'', ''{'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�b'', ''|'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�p'', ''}'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�P'', ''~'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�E'', ''+'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''�`'', ''+'')
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
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000001', N'���i00', N'�S�O�O���i�R�`�S�l�O�j�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000002', N'���i01', N'�P�܁i�R�O�O���j�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000003', N'���i02', N'�P�S�O���i�V�O���~�Q�܁j�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000004', N'���i03', N'�W�O���~�Q�@�@�@�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000005', N'���i04', N'�S�T���~�R�i����E���炵�t�j�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000006', N'���i05', N'�Q�Q�O���@�@�@�@�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000007', N'���i06', N'�W�O���i�W���T�����j�~�Q�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000008', N'���i07', N'�P�U�R�i�Q�S�O���j�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000009', N'���i08', N'�P�Q�U���i�V���j�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000010', N'���i09', N'�W�{���i�P�V�Q���j�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000011', N'���i0A', N'�V�O���i�W���T�����j�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000012', N'���i0B', N'�W�W�O���{�T�O���@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000013', N'���i0C', N'�R��P�O�R�i�Q�P�O���j�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000014', N'���i0D', N'�S�O���~�Q�i����E���炵�t���j', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000015', N'���i0E', N'�P�O�O���~�R�@�@�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000016', N'���i0F', N'�P�R�O���{�P�R���@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000017', N'���i10', N'�R�U�O���i�߂�P�T�O���~�Q�j�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000018', N'���i11', N'�i�P�T�O���~�Q�j�~�Q�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000019', N'���i12', N'�P�T�O���~�T�~�Q��@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000020', N'���i13', N'�Q�O�O���i�Ō`�ʂP�Q�O���j�~�Q', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000021', N'���i14', N'�Q�U�O���i�Q�U���~�P�O�R�j�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000022', N'���i15', N'�P�V�O���i�Q�`�R�l�O�j�~�Q�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000023', N'���i16', N'�Ɩ��p�@�W�T�O���i�T�O�R�j�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000024', N'���i17', N'�ؓ�����g���P�Q�O���E����W�O', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000025', N'���i18', N'�Q�P�O���i�W���P�T�`�P�W�R���j', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000026', N'���i19', N'�R�O�O���i��P�T�O���~�Q�j�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000027', N'���i1A', N'�T�O�O���i��P�P�`�P�S�{�j�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000028', N'���i1B', N'�i�O�t�|�j�W�O���~�R�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000029', N'���i1C', N'�P�O�O���i�P�X�`�Q�Q���j�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000030', N'���i1D', N'�W���i�P�U�W���j�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000031', N'���i1E', N'�P���i�V�O���j�@�@�@�@�@�@�@�@', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000032', N'���i1F', N'�O�D�T�����i��P�P�`�P�S�{�j�@', 0)
GO