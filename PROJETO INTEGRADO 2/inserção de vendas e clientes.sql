USE [PROJETO INTEGRADO]



INSERT INTO dbo.CLIENTES (CLIENTE_ID, NOME,EMAIL, TELEFONE)
VALUES	
	(1, 'João da Silva', 'joaosilva99@gmail.com', '92345-7890'),
	(2, 'Maria Oliveira', 'm.oliveira@gmail.com', '99783-3234'),
	(3, 'Carlos Souza', 'carlossouza11@gmail.com', '94242-7854'),
	(4, 'Ana Costa', 'anacosta@@outlook.com', '93245-5734');

INSERT INTO dbo.VENDAS(VENDA_ID, CLIENTE_ID, PRODUTO_ID, DATA_VENDA, QUANTIDADE)
VALUES 
    (1, 1, 1, '2024-11-01', 2), 
    (2, 2, 2, '2024-11-02', 1), 
    (3, 1, 3, '2024-11-03', 1), 
    (4, 3, 4, '2024-11-04', 3), 
    (5, 4, 5, '2024-11-05', 1);



	SELECT * FROM dbo.VENDAS

	SELECT * FROM dbo.CLIENTES

