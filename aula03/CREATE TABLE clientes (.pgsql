CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    sobre_nome VARCHAR(50),
    telefone INT,
    cpf VARCHAR(13)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    data DATE,
    id_cliente INT
);

INSERT INTO clientes (
    nome,
    sobre_nome,
    telefone,
    cpf)

    VALUES (
    'Rafael',
    'Gazola',
    1999999999,
    19967676767
);

SELECT * FROM clientes;