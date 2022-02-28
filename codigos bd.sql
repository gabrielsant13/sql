--Criar e excluir banco de dados
create database nomedoBanco;
drop database nomedoBanco;

--remove nomes duplicados de uma consulta DISTINCT
select distinct consulta from tabela;

--condiçoes WHERE
select coluna from tabela where condição;

/* OPERADOR        -       DESCRIÇÃO
    =                        IGUAL
    >                        MAIOR QUE
    <                        MENOR QUE
    >=                       MAIOR QUE OU IGUAL
    <=                       MENOR QUE OU IGUAL
    <>                       DIFERENTE DE
    AND                      OPERADOR LOGICO E
    OR                       OPERADOR LOGICO OU
    BETWEEN                  ENTRE
*/

-- contagem de todas as colunas da tabela, pode ser utilizado com distict COUNT
select count(*) from tabela                         select count(distinct(*)) from tabela
ou select count(coluna) from tabela 

-- vai filtrar/limitar a quantidade de dados de um select TOP
select top 10 * from tabela

-- ordenar os resultados por alguma coluna em ordem crescente (asc) ou decrescente (desc) ORDER BY
select * from tabela ORDER by coluna asc ou desc

-- usado pra enconhtar valor entre um valor minimo e valor maximo BETWEEN/NOT BETWEEN
select * from tabela where coluna between x and y

-- verificar se um valor correspondem com qualquer valor passado na lista de valores IN/not in
select * from tabela where coluna in (x,y,z)        é o mesmo que select * from tabela where coluna = x or coluna = y or coluna = z 

-- caso queira encontrar algo que voce saiba uma parte do nome
-- para casos que queira completar o final
select * from tabela where coluna like 'ma%'
-- para casos que queira completar o inicio
select * from tabela where coluna like '%ma'
-- para casos que queira completar o inicio/final
select * from tabela where coluna like '%ma%'
-- para casos que queira completar apenas um caracter
select * from tabela where coluna like '%ma_'
------------------------------------------------------------------------------------------------------------------------------------
--DESAFIOS FUNDAMENTOS SQL - Banco de Dados genérico AdventureWorks2017 **************

--Quantos produtos temos cadastrados no sistema que custa mais de 1500 dorales?
select count(*) from Production.Product where ListPrice >1500;

--Quantas pessoas temos com o sobrenome que inicia com a letrta p?
select count(*) from Person.Person where LastName like 'p%';

--Em quantas cidades unicas estao cadastrados nossos clientes?
select count(distinct(city)) from Person.Address;

--Quais sao as cidades unicas que temos cadastrados em nosso sistemas?
select distinct(city) from Person.Address;

--Quantos produtos vermelhos tem preço entre 500 a 1000 dolares?
select COUNT(name) from Production.Product where color = 'red' and ListPrice between 500 and 1000;

--Quantos produtos cadastrados tem a palavra 'road' no nome delas?
select count(*) from Production.Product where Name like '%road%';
-------------------------------------------------------------------------------------------------------------------------------------

--FUNÇÕES DE AGREGAÇÃO

--Total de algo SUM
select top 10, sum(coluna que sera encontrado o total) from tabela

--Para apelidar uma coluna AS
select top 10, sum(coluna que sera encontrado o total) as "soma" from tabela --a coluna retornada voltara com o nome de soma

--para retornar o menor valor MIN
select top 10, min(coluna) from tabela

--para retornar o maior valor MAX
select top 10, max(coluna) from tabela

--para retornar a media AVG
select top 10, avg(coluna) from tabela
-------------------------------------------------------------------------------------------------------------------------------------

--Divide o resultado da pesquisa em grupos, agrupa pela coluna que foi indicada GROUP BY
select coluna1, sum(coluna2) from tabela group by coluna1 --agrupando pela coluna 1, e somando todos os valores referentes a 1 id da coluna1

--Filtrar dados que ja estao agrupados (where para dados agrupados) HAVING
    --Diferença entre o HAVING e Where: Having é aplicado depois que os dados ja foram agrupados e o Where antes dos dados serem agrupados
    select coluna1, sum(coluna2) "total" from tabela group by coluna1 having condição
