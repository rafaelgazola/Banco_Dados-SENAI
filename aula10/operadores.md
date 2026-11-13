# Guia de Estudos: Operadores e Funções no PostgreSQL

Este material resume todos os conceitos, sintaxes, funções e operadores utilizados no **PostgreSQL**, com exemplos práticos e a resolução dos exercícios da aula.

---

## 1. Operadores no PostgreSQL

Operadores são símbolos ou palavras reservadas usadas em expressões para manipular valores, realizar cálculos e filtrar consultas nas cláusulas `SELECT`, `WHERE`, `UPDATE` e `INSERT`.

### 1.1. Operadores Aritméticos
Usados para realizar cálculos matemáticos com valores numéricos.

| Operador | Descrição | Exemplo SQL | Resultado |
| :---: | :--- | :--- | :---: |
| `+` | Adição | `SELECT 5 + 3;` | `8` |
| `-` | Subtração | `SELECT 5 - 3;` | `2` |
| `*` | Multiplicação | `SELECT 5 * 3;` | `15` |
| `/` | Divisão | `SELECT 10 / 2;` | `5` |
| `%` ou `MOD()` | Resto da divisão | `SELECT 10 % 3;` ou `SELECT MOD(10, 3);` | `1` |

> **Exemplo Prático:**
> ```sql
> SELECT nome, salario, salario * 0.15 AS bonus 
> FROM funcionarios;
> ```

---

### 1.2. Operadores Relacionais
Usados para comparar valores e retornar um resultado booleano (`TRUE`, `FALSE` ou `NULL`).

| Operador | Descrição | Exemplo (`WHERE`) | Resultado |
| :---: | :--- | :--- | :--- |
| `=` | Igual | `WHERE idade = 18` | `TRUE` se a idade for 18 |
| `<>` ou `!=` | Diferente | `WHERE idade <> 18` | `TRUE` se a idade for diferente de 18 |
| `>` | Maior que | `WHERE salario > 2000` | `TRUE` se salário for maior que 2000 |
| `<` | Menor que | `WHERE salario < 2000` | `TRUE` se salário for menor que 2000 |
| `>=` | Maior ou igual | `WHERE idade >= 18` | `TRUE` se idade for 18 ou mais |
| `<=` | Menor ou igual | `WHERE idade <= 18` | `TRUE` se idade for 18 ou menos |

> **Exemplo Prático:**
> ```sql
> SELECT * FROM alunos 
> WHERE idade >= 18;
> ```

---

### 1.3. Operadores Lógicos
Usados para combinar múltiplas condições em uma consulta.

| Operador | Descrição | Exemplo | Comportamento |
| :---: | :--- | :--- | :--- |
| `AND` | E (Especial) | `WHERE serie = 3 AND idade > 15` | Retorna `TRUE` apenas se **todas** as condições forem verdadeiras. |
| `OR` | OU | `WHERE serie = 3 OR idade > 15` | Retorna `TRUE` se **pelo menos uma** condição for verdadeira. |
| `NOT` | NÃO (Negação) | `WHERE NOT serie = 3` | Inverte o resultado booleano da condição. |

> **Exemplo Prático:**
> ```sql
> SELECT * FROM funcionarios 
> WHERE salario > 2000 AND cargo = 'Analista';
> ```

---

### 1.4. Operadores Auxiliares
Operadores especiais para filtragem avançada de dados.

| Operador | Descrição | Exemplo |
| :--- | :--- | :--- |
| `BETWEEN` | Filtra valores dentro de um intervalo (inclusive limites) | `WHERE idade BETWEEN 18 AND 25` |
| `IN` | Verifica se o valor pertence a uma lista específica | `WHERE cidade IN ('SP', 'RJ', 'MG')` |
| `LIKE` | Busca por padrão de texto sensível a maiúsculas/minúsculas | `WHERE nome LIKE 'Mar%'` *(Começa com "Mar")* |
| `ILIKE` | Busca por padrão **ignorando** maiúsculas/minúsculas | `WHERE nome ILIKE 'mar%'` *(Encontra "Mar", "mar", "MAR")* |
| `IS NULL` | Verifica se o campo está nulo/sem valor | `WHERE telefone IS NULL` |
| `IS NOT NULL` | Verifica se o campo possui valor preenchido | `WHERE telefone IS NOT NULL` |

> **Exemplo Prático:**
> ```sql
> SELECT * FROM produtos 
> WHERE preco BETWEEN 50 AND 100 
>   AND nome ILIKE '%mouse%';
> ```

---

## 2. Funções no PostgreSQL

Funções recebem argumentos, processam dados e retornam um valor de saída.

### 2.1. Funções de Data e Hora

| Função / Operação | Descrição | Exemplo SQL | Resultado Esperado |
| :--- | :--- | :--- | :---: |
| `NOW()` ou `CURRENT_TIMESTAMP` | Data e hora atuais | `SELECT NOW();` | `2025-08-09 21:15:00` |
| `CURRENT_DATE` | Data atual | `SELECT CURRENT_DATE;` | `2025-08-09` |
| `CURRENT_TIME` | Hora atual | `SELECT CURRENT_TIME;` | `21:15:00` |
| `::DATE` | Converte/extrai apenas a data | `SELECT NOW()::DATE;` | `2025-08-09` |
| `EXTRACT(YEAR FROM ...)` | Extrai o ano | `SELECT EXTRACT(YEAR FROM '2023-11-15'::DATE);` | `2023` |
| `EXTRACT(MONTH FROM ...)` | Extrai o mês | `SELECT EXTRACT(MONTH FROM '2023-11-15'::DATE);` | `11` |
| `EXTRACT(DAY FROM ...)` | Extrai o dia | `SELECT EXTRACT(DAY FROM '2023-11-15'::DATE);` | `15` |
| `+ INTERVAL` | Adiciona intervalo de tempo | `SELECT CURRENT_DATE + INTERVAL '7 days';` | Data atual + 7 dias |
| `-` (Subtração) | Diferença em dias entre duas datas | `SELECT '2025-08-15'::DATE - CURRENT_DATE;` | Número de dias |

---

### 2.2. Funções Matemáticas

| Função | Descrição | Exemplo SQL | Resultado Esperado |
| :--- | :--- | :--- | :---: |
| `ABS(x)` | Valor absoluto (sem sinal negativo) | `SELECT ABS(-10);` | `10` |
| `ROUND(x, d)` | Arredonda para $d$ casas decimais | `SELECT ROUND(3.14159, 2);` | `3.14` |
| `CEIL(x)` | Arredonda para cima | `SELECT CEIL(3.14);` | `4` |
| `FLOOR(x)` | Arredonda para baixo | `SELECT FLOOR(3.99);` | `3` |
| `MOD(n, m)` | Resto da divisão de $n$ por $m$ | `SELECT MOD(10, 3);` | `1` |
| `POWER(b, e)` | Potência de $b^e$ | `SELECT POWER(2, 3);` | `8` |
| `SQRT(x)` | Raiz quadrada | `SELECT SQRT(16);` | `4` |

---

### 2.3. Funções de String (Texto)

| Função / Operador | Descrição | Exemplo SQL | Resultado |
| :--- | :--- | :--- | :---: |
| `\|\|` ou `CONCAT()` | Concatena (junta) textos | `SELECT 'Olá, ' \|\| 'Mundo';` | `Olá, Mundo` |
| `LENGTH()` | Quantidade de caracteres | `SELECT LENGTH('abc');` | `3` |
| `LOWER()` | Converte para minúsculas | `SELECT LOWER('ABC');` | `abc` |
| `UPPER()` | Converte para maiúsculas | `SELECT UPPER('abc');` | `ABC` |
| `SUBSTRING()` | Extrai trecho do texto | `SELECT SUBSTRING('ABCDEFG' FROM 2 FOR 3);` | `BCD` |
| `TRIM()` | Remove espaços extras no início/fim | `SELECT TRIM(' texto ');` | `texto` |

---

### 2.4. Funções de Agregação
Calculam resultados consolidados sobre múltiplas linhas.

| Função | Descrição | Exemplo SQL |
| :--- | :--- | :--- |
| `COUNT()` | Conta a quantidade total de registros | `SELECT COUNT(*) FROM funcionarios;` |
| `SUM()` | Soma os valores de uma coluna | `SELECT SUM(salario) FROM funcionarios;` |
| `AVG()` | Calcula a média aritmética dos valores | `SELECT AVG(idade) FROM funcionarios;` |
| `MIN()` | Retorna o menor valor de uma coluna | `SELECT MIN(salario) FROM funcionarios;` |
| `MAX()` | Retorna o maior valor de uma coluna | `SELECT MAX(idade) FROM funcionarios;` |

---

## 3. Resolução da Atividade Prática (PostgreSQL)

Abaixo estão todos os comandos na sintaxe oficial do PostgreSQL para resolver os exercícios propostos no PDF:

```sql
-- 1. Criar a tabela 'funcionarios' (uso do tipo SERIAL para autoincremento no PostgreSQL)
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    idade INT
);

-- 2. Inserir 5 registros fictícios
INSERT INTO funcionarios (nome, cargo, salario, data_admissao, idade) VALUES
('Ana', 'Analista', 3500.50, '2020-01-15', 29),
('Bruno', 'Dev', 2700.00, '2018-06-10', 34),
('Carla', 'Gerente', 4500.75, '2019-03-22', 27),
('Daniel', 'Dev', 1800.00, '2022-11-01', 22),
('Amanda', 'Analista', 3100.00, '2021-05-18', 28);

-- 3. Calcular um bônus de 15% sobre o salário
SELECT nome, salario, ROUND(salario * 0.15, 2) AS bonus_15
FROM funcionarios;

-- 4. Listar funcionários com salário acima de 3000
SELECT * FROM funcionarios 
WHERE salario > 3000;

-- 5. Filtrar funcionários com salário acima de 2000 E idade abaixo de 30
SELECT * FROM funcionarios 
WHERE salario > 2000 AND idade < 30;

-- 6. Operadores auxiliares:
-- a) Filtrar por intervalo de idades (BETWEEN)
SELECT * FROM funcionarios 
WHERE idade BETWEEN 25 AND 30;

-- b) Buscar nomes que começam com "A" (uso de ILIKE para evitar problemas com maiúsculas)
SELECT * FROM funcionarios 
WHERE nome ILIKE 'A%';

-- c) Selecionar cargos específicos usando IN
SELECT * FROM funcionarios 
WHERE cargo IN ('Analista', 'Dev');

-- Exemplos Extras de Funções no Postgres:
SELECT NOW() AS data_hora_atual;
SELECT data_admissao + INTERVAL '1 year' AS proxima_avaliacao FROM funcionarios;
SELECT 'Funcionário: ' || nome AS identificacao FROM funcionarios;
SELECT COUNT(*) AS total, AVG(salario) AS media_salarial FROM funcionarios;
```