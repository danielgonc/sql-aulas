SET SEARCH_PATH='rev_p1';
/* 1 */
CREATE OR REPLACE FUNCTION ADD_VENDA(integer)
	RETURNS integer AS $$
		DECLARE	
			codcliente ALIAS FOR $1;
		BEGIN
			INSERT INTO venda VALUES(DEFAULT, NOW(), codcliente);
			RETURN (SELECT MAX(cod_venda) FROM venda);
		END;
	$$ LANGUAGE plpgsql;

select add_venda(3);
/*2*/
CREATE OR REPLACE FUNCTION ADD_PRODUTO_VENDA(INTEGER,INTEGER)
	RETURNS VOID AS $$
		DECLARE 
			codvenda ALIAS FOR $1;
			codproduto ALIAS FOR $2;
		BEGIN
			INSERT INTO produtos_venda VALUES(codvenda, codproduto,1,50, FALSE);
		END;
	$$ LANGUAGE plpgsql;

select add_produto_venda(2,1);
/*3*/
CREATE OR REPLACE FUNCTION BAIXA_ESTOQUE(INTEGER)
	RETURNS VOID AS $$
		DECLARE 
			codvenda ALIAS FOR $1;
		BEGIN
			UPDATE produtos_venda SET baixa_estoque = TRUE WHERE cod_venda = codvenda;
		END;
	$$ LANGUAGE PLPGSQL;

select baixa_estoque(2)
/* 4 */

CREATE OR REPLACE FUNCTION CANCELAR_VENDA(INTEGER)
	RETURNS VOID AS $$
		DECLARE 
			codvenda ALIAS FOR $1;
		BEGIN
			IF (SELECT TRUE IN (SELECT baixa_estoque FROM produtos_venda WHERE  cod_venda = 1)) THEN

				
		END;
	$$ LANGUAGE PLPGSQL;

SELECT * FROM PRODUTO
SELECT * FROM VENDA
SELECT * FROM PRODUTOS_VENDA
UPDATE produtos_venda set baixa_estoque = false 
/* 5 */
CREATE OR REPLACE FUNCTION ALIMENTAR_VENDAS_REGIAO(DATE,DATE)
	RETURNS VOID AS $$
		
	
		
	$$ LANGUAGE PLPGSQL;
	
