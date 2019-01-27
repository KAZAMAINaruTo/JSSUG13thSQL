SELECT
	Sku
	, SkuWeightDesc
	, E
	, n1 * 10 + n2 AS idx
	, SUBSTRING(E,n1 * 10 + n2,1)
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
WHERE
	n1 * 10 + n2 BETWEEN 1 AND LEN(E)
ORDER BY
	Sku, idx
