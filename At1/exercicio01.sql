CREATE DATABASE exercicio_de_fixacao;
USE exercicio_de_fixacao;

CREATE TABLE nomes(
    nome VARCHAR(70) NOT NULL
);

iNSERT  INTO nomes
VALUES ('Roberta'), ('Roberta'), ('Maria Clara'), ('João');
select*from nomes;

SELECT UPPER(nomes) AS nomes_maiusculo
FROM nomes;

SELECT UPPER(nomes) AS nomes_maiusculo, LENGTH(nomes) AS tamanho_nomes
FROM nomes;

SELECT
  CONCAT(
    CASE 
      WHEN sexo = 'M' THEN 'Sr.'  WHEN sexo = 'F' THEN 'Sra.' ELSE ''
    END,
    UPPER(nomes)
  ) AS saudacao_nomes
FROM nomes;