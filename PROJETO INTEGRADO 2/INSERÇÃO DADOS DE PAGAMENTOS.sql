USE [PROJETO INTEGRADO]

INSERT INTO PAGAMENTOS(PAGAMENTO_ID, VENDA_ID, DATA_PAGAMENTO, VALOR_PAGAMENTO, METODO_PAGAMENTO)
VALUES 
	(1, 1, '2024-11-01', 3500.00, 'Cart�o de Cr�dito'),
	(2, 2, '2024-11-02', 2500.00, 'Transfer�ncia Banc�ria'),
	(3, 3, '2024-11-03', 1500.00, 'Pix'),
	(4, 1, '2024-11-04', 800.00, 'Boleto Banc�rio'),
	(5, 4, '2024-11-05', 120.00, 'Cart�o de D�bito');


	SELECT * FROM pagamentos;