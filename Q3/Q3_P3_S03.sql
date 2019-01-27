SELECT
	Sku
	, SkuWeightDesc
	, CASE
			WHEN X like '%ｇ%'
				THEN X
			ELSE I
		END
		+ CASE
				WHEN X NOT like '%ｇ%'
					AND X like '×[０-９]%'
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
					WHEN CHARINDEX('（', SkuWeightDesc) > 0
						THEN SUBSTRING(SkuWeightDesc
								, CHARINDEX('（', SkuWeightDesc)
								, CHARINDEX('）', SkuWeightDesc)
										- CHARINDEX('（', SkuWeightDesc) + 1)
					END AS I
				, CASE
						WHEN CHARINDEX('（', SkuWeightDesc) > 1
							THEN SUBSTRING(
									SkuWeightDesc
									, 1
									, CHARINDEX('（', SkuWeightDesc) - 1)
							ELSE ''
						END
					+ CASE
						WHEN CHARINDEX('）', SkuWeightDesc) < LEN(SkuWeightDesc)
							THEN SUBSTRING(
									SkuWeightDesc
									, CHARINDEX('）', SkuWeightDesc) + 1
											, LEN(SkuWeightDesc))
							ELSE ''
						END X
			FROM
				SKU
	) SKUEX
