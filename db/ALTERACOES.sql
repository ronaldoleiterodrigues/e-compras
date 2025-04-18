-- **************************
-- ALTERAÇÕES TABELA VENDAS
-- **************************
ALTER TABLE VENDA ADD COLUMN STATUS VARCHAR(20);
ALTER TABLE VENDA MODIFY COLUMN VALOR DECIMAL(10,2);

ALTER TABLE VENDA DROP COLUMN USUARIO;
ALTER TABLE VENDA ADD COLUMN CLIENTE INT(11);


SELECT CONSTRAINT_NAME 
FROM information_schema.KEY_COLUMN_USAGE 
WHERE TABLE_NAME = 'VENDA' 
AND COLUMN_NAME = 'USUARIO';


#ALTER TABLE VENDA DROP FOREIGN KEY venda_ibfk_3;


ALTER TABLE VENDA 
ADD CONSTRAINT fk_vendas_clientes  FOREIGN KEY (CLIENTE) REFERENCES CLIENTES(ID) 
ON DELETE CASCADE;

ALTER TABLE VENDA MODIFY COLUMN STATUS VARCHAR(20) AFTER CLIENTE

-- **************************
-- ALTERAÇÕES TABELA CLIENTES
-- **************************

ALTER TABLE CLIENTES ADD COLUMN PERFIL INT(11);

ALTER TABLE CLIENTES 
ADD CONSTRAINT fk_clientes_perfil  FOREIGN KEY (PERFIL) REFERENCES PERFIL(ID) 
ON DELETE CASCADE;

UPDATE CLIENTES SET PERFIL = 2

-- ************************** 
--     SCRIPTS DASHBOARD
-- **************************

--INDICADORES
SELECT 
    SUM(VALOR) AS FATURAMENTO,  
    (SELECT COUNT(*) FROM VENDA) AS TOTALVENDAS, 
    (SUM(VALOR) / NULLIF((SELECT COUNT(*) FROM VENDA), 0)) AS TICKETMEDIO
FROM VENDA;  

-- PRODUTOS MAIS VENDIDOS

SELECT 
    P.ID, 
    P.NOME, 
    SUM(I.QUANTIDADE) AS QUANTIDADE
FROM ITENSVENDA I  
INNER JOIN PRODUTO P ON P.ID = I.PRODUTO
GROUP BY 1,2 
ORDER BY 3 DESC
LIMIT 10;


-- VENDAS POR MÊS
SELECT 
    SUM(VALOR) AS TOTAL, 
    DATE(DATAVENDA) AS DATA
FROM VENDA
GROUP BY DATA
ORDER BY TOTAL DESC;

-- CATEGORIAS MAIS VENDIDAS
SELECT  
    P.CATEGORIA, 
    C.DESCRICAO, 
    SUM(I.QUANTIDADE) AS TOTAL
FROM ITENSVENDA I  
INNER JOIN PRODUTO P ON P.ID = I.PRODUTO  
INNER JOIN CATEGORIA C ON C.ID = P.CATEGORIA
GROUP BY 1,2
ORDER BY 3 DESC;
