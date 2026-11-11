CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    idade INT,
    data_admissao DATE
);


INSERT INTO funcionarios (nome, cargo, salario, idade, data_admissao) 
VALUES 
    ('Ana', 'Analista', 3500.90, 29, '2020-01-15'),
    ('Bruno', 'Gerente', 6200.49, 40, '2015-07-22'),
    ('Carla', 'Assistente', 2400.35, 25, '2021-03-10'),
    ('Diego', 'Estagiário', 1500.87, 21, '2023-02-01'),
    ('Elisa', 'Analista', 3800.51, 32, '2019-11-09'),
    ('Fábio', 'Coordenador', 4800.50, 36, '2018-04-18');
