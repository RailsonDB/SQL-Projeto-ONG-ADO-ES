# 🐾 Projeto SQL - ONG de Adoção de Animais 

## 📋 Descrição do Projeto
Esse projeto simula o banco de dados de uma **ONG de adoção de animias** fictícia, com o objetivo de analisar
informações sobre **animais cadastratados, adoções realizadas e taxas de arrecadação**.

O propósito do projeto é mostrar o uso de *consultas SQL* para gerar insights sobre os processos da ONG, como espécies
mais adotadas, média de idade dos animais, cidades com mais adoções e muito mais.



## 🧩 Estrutura do Banco de Dados

O banco de dados **ong_adocao** contém duas tabelas principais:

-**animais**🐶🐱
  Contém dados sobre os animais cadastrados na ONG, como nome, idade, espécie,
raça, status(Adotado, Em tratamento, Disponível) e data de cadastro.

-- **adocoes**💚 
  Registra informações sobre as adoções realizadas, incluindo o
nome do adotante, cidade, taxa de adoção e data de adoção.



## 📊 Perguntas Respondidas  

### 🔹 Dados Gerais  
1. Quantos animais existem cadastrados no total?  
2. Quantas espécies diferentes existem na base?  
3. Quantos animais estão *disponíveis, **adotados* e *em tratamento*?  
4. Qual é a *média de idade* dos animais cadastrados?

### 🔹 Análise de Adoções  
5. Quantas adoções foram realizadas no total?  
6. Qual é a *média da taxa de adoção* cobrada?  
7. Quantos animais foram adotados por espécie?  
8. Quais cidades mais realizaram adoções?  
9. Qual o *valor total arrecadado* em taxas de adoção?  
10. Qual é o *mês com maior número de adoções*?

### 🔹 Consultas Avançadas  
11. Quais animais adotados têm *idade superior a 5 anos*?  
12. Quais animais foram cadastrados em *2024* e já estão marcados como “Adotado”?  
13. Liste o *nome do animal*, o nome do *adotante* e a *cidade* da adoção.  
14. Mostre todos os animais com suas respectivas *datas de adoção* (incluindo os que ainda não foram adotados).  
15. Quais são as *raças mais adotadas*?



## 💡 Tecnologias Utilizadas  
*MySQL* | Banco de dados relacional usado para gerenciar o projeto |<br>
*SQL* | Linguagem de consulta estruturada para extração de dados e análises |<br>



## 🧠 Principais Conceitos Trabalhados 
- Uso de *funções de agragação* (COUNT, AVG, SUM, ROUND)
- *Junções entre tabelas* (JOIN e LEFT JOIN)
- Agrupamentos e *estatísticas por categoria* (GROUP BY, ORDER BY)
- *Funções de data* (YEAR, DATE_FORMAT)
- Filtragem condicional (WHERE, AND, OR)



## 🧰 Como utilizar o projeto no MySQL

1. **Crie o banco de dados `ong_adocao`** diretamente no MySQL  
   Você pode criar manualmente ou clonar este repositório com o banco e as tabelas já prontos.

   ```sql
   CREATE DATABASE IF NOT EXISTS ong_adocao;
   USE ong_adocao;





