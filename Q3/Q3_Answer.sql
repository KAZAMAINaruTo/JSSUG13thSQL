UPDATE Sku SET SkuWeight = 0;
SELECT * FROM SKU;

DECLARE @SQL NVARCHAR(4000)
SELECT 
	@SQL =
		'UPDATE SKU' + CHAR(13) + CHAR(10)
		+ 'SET' + CHAR(13) + CHAR(10)
		+ '    SkuWeight = NewSkuWeight' + CHAR(13) + CHAR(10)
		+ 'FROM' + CHAR(13) + CHAR(10)
		+ '    SKU' + CHAR(13) + CHAR(10)
		+ '    INNER JOIN (' + CHAR(13) + CHAR(10)
		+ '        VALUES'
		+ STRING_AGG(SQL, CHAR(13) + CHAR(10) + '            , ') + CHAR(13) + CHAR(10)
		+ '        ) AS SW(Sku, NewSkuWeight)' + CHAR(13) + CHAR(10)
		+ '    ON SKU.Sku = SW.Sku' + CHAR(13) + CHAR(10)
		+ ';' + CHAR(13) + CHAR(10)
FROM
	(
		SELECT
			 '(''' + Sku + ''','+ STRING_AGG(cn,'') WITHIN GROUP (ORDER BY idx) +  ')' AS SQL
		FROM
			(
				SELECT
					Sku
					--, SkuWeightDesc
					--, E
					, n1 * 10 + n2 AS idx
					, M.CN
				FROM
					(
						SELECT
							Sku
							--, SkuWeightDesc
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
											--, SkuWeightDesc
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
											SKU) SKUEX
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
			) AS SKUEXH
		GROUP BY
			Sku
			--, SkuWeightDesc
	) AS SKUEXP
	;

PRINT @SQL

 

SELECT * FROM SKU;
SELECT SUM(SkuWeight) FROM SKU;

