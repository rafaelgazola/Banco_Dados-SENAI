CREATE TABLE alunos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(60),
    turma VARCHAR(12),
    nascimento DATE,
    ativo BOOLEAN

);


INSERT INTO alunos(
    id,
    nome,
    turma,
    nascimento,
    ativo)

    VALUES(
        '1',
        'Gazola',
        'I1D46A',
        '2010/06/20',
        '1'
)

-- alter --
SELECT * FROM alunos;

--modific--

ALTER TABLE alunos ALTER COLUMN nome TYPE VARCHAR(255);

-- acrescentar uma coluno --

UPDATE alunos
SET email = 'rafaelgomescosta17@gmail.com'
WHERE id = 1;

UPDATE alunos
SET turma = 'I1D46a', date = '2001-09-11'
WHERE id = 10;

DELETE FROM alunos;


SELECT * FROM alunos;