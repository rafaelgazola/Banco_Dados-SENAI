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