# Tabela de Equivalência: MySQL vs PostgreSQL

Conforme foi passado na atividade ("Verificar as funções equivalentes entre MySQL e o PostgreSQL"), abaixo estão as principais diferenças entre os comandos nativos do MySQL para o PostgreSQL.

| O que a função faz | No MySQL (Como estava nas questões) | No PostgreSQL | Explicação Simples |
| :--- | :--- | :--- | :--- |
| **Criar ID Automático** | `id INT AUTO_INCREMENT PRIMARY KEY` | `id SERIAL PRIMARY KEY` | O PostgreSQL usa a palavra `SERIAL` para criar uma sequência que se preenche sozinha. |
| **Pegar a Data Atual** | `CURDATE()` | `CURRENT_DATE` | Funções com nomes um pouco diferentes para pegar a data de hoje. |
| **Pegar a Hora Atual** | `CURTIME()` | `CURRENT_TIME` | O PostgreSQL prefere o padrão SQL universal usando a palavra `CURRENT`. |
| **Pegar o Ano da Data** | `YEAR(data_admissao)` | `EXTRACT(YEAR FROM data_admissao)` | O PostgreSQL usa a função `EXTRACT` para "extrair" pedaços específicos de uma data. |
| **Adicionar 1 Ano** | `DATE_ADD(data, INTERVAL 1 YEAR)` | `data + INTERVAL '1 year'` | No PostgreSQL, podemos somar um intervalo diretamente usando o sinal de mais (`+`). |
| **Diferença de Dias** | `DATEDIFF(CURDATE(), data_admissao)`| `CURRENT_DATE - data_admissao` | O PostgreSQL não precisa da função `DATEDIFF` para dias. É só subtrair uma data da outra usando matemática básica. |

### Funções que são idênticas nos dois bancos:
Várias funções que foram utilizadas são padrão e funcionam do mesmo jeitinho tanto no MySQL quanto no PostgreSQL.
- `NOW()`
- `ABS()` e `ROUND()`
- `CEIL()` e `FLOOR()`
- `SQRT()` e `POWER()`
- `UPPER()` e `LOWER()`
- `TRIM()` e `CONCAT()`
- Funções de cálculo como `SUM()`, `MAX()`, `MIN()`, `AVG()` e `COUNT()`