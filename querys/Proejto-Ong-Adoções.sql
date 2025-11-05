-- Projeto SQL - ONG de Adoção de Animais

-- selecionar o banco de dados
use ong_adocao;

-- selecionar as tabelas (adocoes e animais)
select * from adocoes;
select * from animais;



-- Contexto:
-- A ONG_Adocao é uma organição (fictícia) sem fins lucrativos que abriga, trata e promove adoção de animais.
-- Eles querem entender melhor seus processos, adoções e perfil dos animais.


-- Dados gerais
-- 1° Quantos animais existem cadastrados no total?
-- 2° Quantas espécies diferentes existem na base?
-- 3° Qunatos animais estão disponíveis, adotados eem tratamento? 
-- 4° Qual é a média de idade dos animais cadastrados?

-- Análise de adoções
-- 5° Quantas adoções foram realizadas no total?
-- 6° Qual é a média da taxa de adoção cobrada?
-- 7° Quantos animais foram adotados por espécie?
-- 8° Quais cidades mais realizaram adoções?
-- 9° Qual o valor total arrecadado em taxas de adoção?
-- 10° Qual é o mês com maior número de adoções?

-- Outras Perguntas
-- Quais animais adotados têm idade superior a 5 anos?
-- Quais animais foram cadastrados em 2024 e já estão marcados como "Adotado"?
-- Liste o nome do animal, o nome do adotante e a cidade onde ele foi adotado. 
-- Mostre os animais e suas respectivas datas de adoção (incluindo os que ainda não foram adotados). 
-- Quais são as raças mais adotadas?




-- 1° Quantos animais existem cadastrados no total?

select
	count(*) as total_animais_cadastrados
from animais;


-- 2° Quantas espécies diferentes existem na base?

select
	count(distinct(Especie)) as Qtd_especies
from animais;


-- 3° Quantos animais estão disponíveis, adotados e em tratamento?

select
	Especie,
	count(Status) as Status
from animais
group by Especie
order by Status desc;


select * from animais limit 10;
-- 4° Qual é a média de idade dos animais cadastrados?

select
	avg(Idade) as media_idade  -- aplicando a função round(	,0) aredonda para 7
from animais;



-- 5° Quantas adoções foram realizadas no total?

select
	count(Status) as Status
from animais
where Status = 'Adotado';



-- 6° Qual é a média da taxa de adoção cobrada?
select
	round(avg(Taxa_Adocao), 2) as media_taxa_adocao
from adocoes;


select * from adocoes limit 10;
-- 7° Quantos animais foram adotados por espécie?

select
	Especie,
	count(*) as Qtd_Adotados
from animais
where Status = 'Adotado'
group by Especie
order by Especie;




-- 8° Quais cidades mais realizaram adoções?
select
    adocoes.Cidade,
    count(*) as Qtd_Animais_Adotados
from animais 
join adocoes
	on animais.ID_Animal = adocoes.ID_Animal
where animais.Status = 'Adotado'
group by adocoes.Cidade
order by Qtd_Animais_Adotados desc;




-- 9° Qual o valor total arrecadado em taxas de adoção?

select
	sum(Taxa_Adocao) as Valor_Total_Arrecadado
from adocoes
join animais
	on adocoes.ID_Animal = animais.ID_Animal
where animais.Status = 'Adotado';




-- 10° Qual é o mês com maior número de adoções?

-- Configurar o nome do mês para português:
set lc_time_names = 'pt_BR';

select
	date_format(adocoes.Data_Adocao, '%M') as Mes_Adocao,
	count(*) as Numero_Adocoes
from animais
join adocoes
	on animais.ID_Animal = adocoes.ID_Animal
where animais.Status = 'Adotado'
group by Mes_Adocao
order by Numero_Adocoes desc
limit 1;





-- 11° Quais animais adotados têm idade superior a 5 anos?

select
	Nome,
    Especie,
	Idade
from animais
where animais.Status = 'Adotado'
and idade > 5
order by Idade desc;





-- 12° Quais animais foram cadastrados em 2024 e já estão marcados como "Adotado"?
select
	Nome as Nome_Animal,
    Especie,
	date_format(Data_Cadastro, '%Y') as Ano,
    Status
from animais
where Status = 'Adotado' 
and year(Data_Cadastro) = 2024
order by Nome_Animal;




-- 13° Liste o nome do animal, o nome do adotante e a cidade onde ele foi adotado. 
select
	animais.Nome as Nome_Animal,
    adocoes.Nome_Adotante as Adotante,
    adocoes.Cidade
from animais
join adocoes
	on animais.ID_Animal = adocoes.ID_Animal
order by animais.Nome;




-- 14° Mostre os animais e suas respectivas datas de adoção (incluindo os que ainda não foram adotados). 
select
	animais.Nome,
    animais.Especie,
    animais.Data_Cadastro,
    adocoes.Data_Adocao
from animais
left join adocoes
	on animais.ID_Animal = adocoes.ID_Animal
order by animais.Nome;




-- 15° Quais são as raças mais adotadas?

select
	Raca,
    count(*) as Qtd_Adocao
from animais
where Status = 'Adotado'
group by Raca
order by Qtd_Adocao desc;



