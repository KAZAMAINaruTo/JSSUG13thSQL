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
					WHEN X like '%Çá%'
						THEN X
					ELSE I
				END
				+ CASE
						WHEN X NOT like '%Çá%'
							AND X like 'Å~[ÇO-ÇX]%'
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
							WHEN CHARINDEX('Åi', SkuWeightDesc) > 0
								THEN SUBSTRING(SkuWeightDesc
										, CHARINDEX('Åi', SkuWeightDesc)
										, CHARINDEX('Åj', SkuWeightDesc)
												- CHARINDEX('Åi', SkuWeightDesc) + 1)
							END AS I
						, CASE
								WHEN CHARINDEX('Åi', SkuWeightDesc) > 1
									THEN SUBSTRING(
											SkuWeightDesc
											, 1
											, CHARINDEX('Åi', SkuWeightDesc) - 1)
									ELSE ''
								END
							+ CASE
								WHEN CHARINDEX('Åj', SkuWeightDesc) < LEN(SkuWeightDesc)
									THEN SUBSTRING(
											SkuWeightDesc
											, CHARINDEX('Åj', SkuWeightDesc) + 1
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
			('ÇO','0')
			, ('ÇP','1')
			, ('ÇQ','2')
			, ('ÇR','3')
			, ('ÇS','4')
			, ('ÇT','5')
			, ('ÇU','6')
			, ('ÇV','7')
			, ('ÇW','8')
			, ('ÇX','9')
			, ('Åi','(')
			, ('Åj',')')
			, ('ÅE','+')
			, ('Å~','*')
			, ('Å{','+')
			, ('ÅD','.')
			, ('Çã','*1000')
			) AS M(CW,CN)
WHERE
	n1 * 10 + n2 BETWEEN 1 AND LEN(E)
	AND SUBSTRING(E,n1 * 10 + n2,1) = M.CW
ORDER BY
	Sku, idx