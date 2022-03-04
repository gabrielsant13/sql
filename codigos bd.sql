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
-------------------------------------------------------------------------------------------------------------------------------------------------

--Join
    --Retorna apenas os resultados que correspondem (existem) tanto na tabelaA como na tabelaB INNER JOIN
    select idTabelaA, nomeTabelaA, ruaTabelaB, cidadeTabelaB from TabelaA A inner join TabelaB on B.chaveprimaria = A.chaveestrangeira      /*Para juntar todas as informaçoes das tabelas*/ => select top 10 * from TabelaA A inner join TabelaB on B.chaveprimaria = A.chaveestrangeira

    --Retorna o conjunto de todos os registros correspondentes da tabelaA e tabelaB quando sao iguais.E caso nao haja valores correspondentes , ele irá preencher esse lado com null FULL OUTER JOIN
    select * from tabelaA full outer join tabelaB on tabelaA.nome = tabelaB.nome

    --Retorna um conjunto de todos os registros da TabelaA, e alem disso, os registros correspondentes (quando disponiveis) na tabelaB. Se nao houver registros correspondentes, ele simplismente vai preencher com null LEFT OUTER JOIN
    select * from tabelaA left outer join tabelaB on tabelaA.nome = tabelaB.nome
-----------------------------------------------------------------------------------

-- Combina dois ou mais resultados de um select em apenas um resultado UNION
select coluna1, coluna2 from tabela1 union select coluna1, coluna2 from tabela2 -- removendo resultados duplicados
select coluna1, coluna2 from tabela1 union all select coluna1, coluna2 from tabela2 -- incluindo resultados duplicados

--Extrair diversas informações diferentes de um dado de coluna que tem informação de data
--DATEPART
    --Datepart sql server (google) lista de comandos que podem ser executados
    select id, datepart(info que quer extrair, coluna) from tabela

--Concatenar colunas
select concat(coluna1, coluna2... colunaN) from tabela --para ter espaço entre as colunas: concat(coluna1,' ', coluna2... colunaN)

--Operações com strings
--Sql server string operations (google)
-- Alguns exemplos
    select upper(coluna) from tabela -- para deixar todas as letras da string maiusculas
    select lower(coluna) from tabela -- para deixar todas as letras da string minusculas
    select len(coluna) from tabela -- para retornar o numero de caracteres de uma string
    select substring(coluna, indice que vai começar, quantidade de letras que vai extrair) from tabela -- para extrair um pedaço de dentro de uma string
    select replace(coluna, 'o que esta buscando para substituir', 'pelo o que vai substituir') from tabela -- para substituir algo por outra coisa
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Funções matemáticas
--funções matematicas sql server (google)

--Operações básicas de matemática funcionam normalmente
select coluna1 + coluna2 from tabela...

--Para arredondar valores ROUND
select round(coluna, 2 /*(seria a precisao decimal)*/) from tabela

--Raiz quadrada
select sqrt(coluna) from tabela
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--SUB-SELECT

--Exemplo
    --Monte um relatorio de todos os produtos que tem preço de venda acima da media
    select * from tabela where coluna > (select avg(coluna) from tabela)  --OBS: é melhor usar inner join para alguns casos
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Utilização de outro banco de dados --Northwind--

--SELF-JOIN
--Sintaxe
    select coluna from tabela A, tabela B where condicao
    --exemplo1: eu quero todos os clientes que moram na mesma regiao
        select A.contactname, b.contactname from customers A, customers B where A.region = B.region

    --exemplo2: eu quero encontrar (nome e data de contratação) de todos os funcionarios que foram contratados no mesmo ano
        select A.firstname, A.hiredate, B.firstname, B.hiredate from employees A, employees B where datepart(year, A.hiredate) = datepart(year, B.hiredate)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--TIPOS DE DADOS

1 booleanos 
    -- Por padrao ele é inicializado como nulo, e pode receber tanto 1 ou 0 BIT > tipo booleano 

2 caracteres 
    -- Tamanho fixo - char // permite inserir ate uma quantidade fixa de caracters e sempre ocupa todo o espaço reservado
    -- Tamanhos variaveis - varchar ou nvarchar // permite inserir ate uma quantidade que for definida, porem so usa o espaco que for preenchido

3 numeros
    valores exatos
        1 TINYINT -- nao tem valor fracionado, somente inteiros
        2 SMALLINT -- mesma coisa, porem limite maior
        3 INT -- mesma coisa, porem limite maior
        4 BIGINT -- mesma coisa, porem limite maior
        5 NUMERIC ou DECIMAL -- valores exatos, porem permite ter parte fracionada, que tambem pode ser especificado a precisao e escala (escala é o numero de digitos na parte fracional) ex: Numeric (5,2), 5 é a quantidade total de digitos que pode armazenar (precisao), 2 é quantos numeros decimais ele terá. nesse caso => 123,45

    valores aproximados
        1 REAL --tem precisao aproximada de ate 15 digitos (apos a virgula)
        2 FLOAT -- mesmo conceito do REAL

4 temporais
    Date -- armazena data no formato aaaa/mm/dd
    DATETIME -- armazena data e horas no formato aaaa/mm/dd:hh:mm:ss
    DATETIME2 --armazena data e horas com adicao de milissegundos no formato aaaa/mm/dd:hh:mm:sssssss
    SMALLDATETIME -- data e hora mas respeitando o limite entre '1900-01-01:00:00:00' ate '2079-06-06:23:59:59'
    TIME -- armazena horas com adicao de milissegundos no formato hh:mm:sssssss respeitando o limite entre '00:00:00.0000000' ate '23:59:59.9999999'
    DATETIMEOFFSET -- permite armazenar informaçoes de data e horas incluindo o fuso horario
----------------------------------------------------------------------------------------------------------------------------------------------------------------


--TABLES
create table nomeTabela (
    coluna1 tipo restricaoDaColuna,
    coluna2 tipo..,
    coluna3 tipo
);
    --Principais tipos de restricoes que podem ser aplicadas
    NOT NULL -- nao permite nulos
    UNIQUE -- força que todos os valores em uma coluna sejam diferentes
    PRIMARY KEY -- uma junção de NOT NULL E UNIQUE
    FOREIGN KEY -- identifica unicamente uma linha em outra tabela (foreign key references nomeDaTabela_onde_ta_a_PK)
    CHECK -- força uma condiçao especifica em uma coluna (ex: apenas sejam inseridos valores com ate 10 caracteres)
    DEFAULT -- força um valor padrao quando nenhum valor é passado 

--INSERT INTO
insert into nomeTabela(coluna1,coluna2,...)
values (valor1, valor2,...),
(valor1, valor2,...), -- podendo colocar varias linhas ao mesmo tempo
(valor1, valor2,...)

    --Inserindo informaçoes de outra tabela em uma tabela existente
    insert into tabelaA (coluna1) select coluna2 from tabelaB -- puxando informaçao da coluna1 tabelaA para coluna2 tabelaB

-- Copiando dados de outra tabela para uma nova tabela
select * into nomeTabelaNova from TabelaASerCopiada
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--CRUD tabela/BD

--UPDATE
--Serve para atualizar linhas da tabela, podendo atualizar tanto uma linha como todas as linhas de uma vez
update nomeTabela 
set coluna1 = valor1
    coluna2 = valor2
where condicao -- Caso esqueça de colocar essa condição, sera alterado todos os dados do BD

--DELETE
--Apagar linhas da tabela, caso esqueça da condição, sera excluido tudo da tabela
delete from nomeTabela where condicao

--ALTER TABLE
--Serve para alterar a estrutura de uma tabela
alter table nomeTabela condicoes_que_serao_alteradas
    --Exemplos do que pode ser feito
        --add, remover, or alterar uma coluna
        --setar valores padroes para uma coluna
        --add ou remover restrições de colunas
        --renomear uma tabela/coluna

--Adicionando uma nova coluna
alter table nomeTabela add novaColuna tipoColuna

--Alterando algum tipo de limite de uma coluna
alter table tabela alter column nomeColuna novo_valor_a_ser_alterado

--Alterando nome da coluna
EXEC sp_RENAME 'nomeTabela.nomeColunaAtual', 'nomeColunaNova', 'COLUMN'

--Alterando o nome da tabela
EXEC sp_RENAME 'nomeTabelaAtual', 'nomeTabelaNova'

--DROP TABLE
--Serve para excluir uma tabela
drop table nomeTabela

--Apagar apenas o conteudo da tabela
truncate table nomeTabela
----------------------------------------------------------------------------------------------------------------------------

--CHECK CONSTRAINT
--Serve para criar restrições sobre valores
--exemplo:
    create table carteiraMotorista(
        id int not null,
        nome varchar(255) not null,
        idade int CHECK (idade >= 18) -- check ta impondo uma validação
    )

--NOT NULL CONSTRAINT
--Serve para dizer que precisamos que o valor seja preenchido
--exemplo:
        create table carteiraMotorista(
        id int NOT NULL,
        nome varchar(255) NOT NULL,
        idade int CHECK (idade >= 18) -- check ta impondo uma validação
    )

--UNIQUE CONSTRAINT
--Nao permite que seja inserido valores repetidos em uma tabela, porem nao é uma PK
--exemplo:
    create table carteiraMotorista(
        id int NOT NULL,
        nome varchar(255) NOT NULL,
        idade int CHECK (idade >= 18) -- check ta impondo uma validação
        codigoCNH int not null UNIQUE
    )

--VIEWS
--Uma forma de extrair informações  especificas de uma tabela existente
--basicamente cria uma tabela 'atalho' derivada da tabela principal, contendo apenas as informaçoes que quero apresentar
create view [nome_da_view] as select coluna1, coluna2 from tabela where condicao