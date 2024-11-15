
USE [PROJETO INTEGRADO]


--Hist�rico de compras de um cliente especifico:
SELECT
    C.NOME AS CLIENTE,
    P.NOME AS PRODUTO,
    V.DATA_VENDA,
    V.QUANTIDADE,
    P.PRECO,
    (V.QUANTIDADE * P.PRECO) AS TOTAL
FROM
    VENDAS V
JOIN 
    CLIENTES C ON V.CLIENTE_ID = C.CLIENTE_ID
JOIN
    PRODUTOS P ON V.PRODUTO_ID = P.PRODUTO_ID
WHERE
    C.CLIENTE_ID = 1; -- SUBSTITUIR 1 PELO ID DO CLIENTE DESEJADO



	----AN�LISE DE PADR�ES DE COMPRA

	SELECT
		P.CATEGORIA,
		SUM(V.QUANTIDADE) AS TOTAL_VENDIDO,
		COUNT(DISTINCT V.CLIENTE_ID) AS NUMERO_DE_CLIENTES
	FROM
		VENDAS V
	JOIN 
		PRODUTOS P ON V.PRODUTO_ID = P.PRODUTO_ID
	GROUP BY
		P.CATEGORIA
	ORDER BY
		TOTAL_VENDIDO DESC;

---IDENTIFICAR CLIENTES QUE COMPRAM PRODUTOS SEMELHANTES

SELECT 
	C.NOME AS CLIENTE,
	P.NOME AS PRODUTO,
	COUNT(*) AS VEZES_COMPRADO
FROM
	VENDAS V
JOIN
	CLIENTES C ON V.CLIENTE_ID = C.CLIENTE_ID
JOIN
	PRODUTOS P ON V.PRODUTO_ID = P.PRODUTO_ID
GROUP BY
	C.CLIENTE_ID, P.PRODUTO_ID
HAVING
	COUNT(*) > 1
ORDER BY
	VEZES_COMPRADO DESC;