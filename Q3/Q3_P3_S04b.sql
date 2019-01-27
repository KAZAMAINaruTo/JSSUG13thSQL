SELECT
	Sku
	, SkuWeightDesc
	, E
	, n1 * 10 + n2 AS idx
	, M.CN
FROM
	(
		SELECT
			Sku
			, SkuWeightDesc
			, CASE
					WHEN X like '%��%'
						THEN X
					ELSE I
				END
				+ CASE
						WHEN X NOT like '%��%'
							AND X like '�~[�O-�X]%'
							THEN X
						ELSE ''
					END AS E
			--, I, X
		FROM
			(
				SELECT
						Sku
						, SkuWeightDesc
						, CASE
							WHEN CHARINDEX('�i', SkuWeightDesc) > 0
								THEN SUBSTRING(SkuWeightDesc
										, CHARINDEX('�i', SkuWeightDesc)
										, CHARINDEX('�j', SkuWeightDesc)
												- CHARINDEX('�i', SkuWeightDesc) + 1)
							END AS I
						, CASE
								WHEN CHARINDEX('�i', SkuWeightDesc) > 1
									THEN SUBSTRING(
											SkuWeightDesc
											, 1
											, CHARINDEX('�i', SkuWeightDesc) - 1)
									ELSE ''
								END
							+ CASE
								WHEN CHARINDEX('�j', SkuWeightDesc) < LEN(SkuWeightDesc)
									THEN SUBSTRING(
											SkuWeightDesc
											, CHARINDEX('�j', SkuWeightDesc) + 1
													, LEN(SkuWeightDesc))
									ELSE ''
								END X
					FROM
						SKU
			) SKUEX
	) SKUEXEX
	, (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) AS I1(n1)
	, (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) AS I2(n2)
	, (VALUES
			('�O','0')
			, ('�P','1')
			, ('�Q','2')
			, ('�R','3')
			, ('�S','4')
			, ('�T','5')
			, ('�U','6')
			, ('�V','7')
			, ('�W','8')
			, ('�X','9')
			, ('�i','(')
			, ('�j',')')
			, ('�E','+')
			, ('�~','*')
			, ('�{','+')
			, ('�D','.')
			, ('��','*1000')
			) AS M(CW,CN)
WHERE
	n1 * 10 + n2 BETWEEN 1 AND LEN(E)
	AND SUBSTRING(E,n1 * 10 + n2,1) = M.CW
ORDER BY
	Sku, idx