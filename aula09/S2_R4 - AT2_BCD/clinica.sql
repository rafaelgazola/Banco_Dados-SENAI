-- Criação do banco de dados
CREATE DATABASE clinica_veterinaria;
USE clinica_veterinaria;

-- 1. Criação das Tabelas
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(150),
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE animais (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(20) NOT NULL,
    raca VARCHAR(30),
    data_nasc YEAR,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    data_consulta DATE NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_animal) REFERENCES animais(id_animal)
);

-- 2. Inserção de Registros (Dados Genéricos e Individuais)
-- Inserindo 5 clientes
INSERT INTO clientes (nome, telefone, email) VALUES ('Cliente 1', '1912345678', 'cliente1@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Cliente 2', '1912345678', 'cliente2@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Cliente 3', '1912345678', 'cliente3@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Cliente 4', '1912345678', 'cliente4@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Cliente 5', '1912345678', 'cliente5@email.com');

-- Inserindo 8 animais vinculados aos clientes acima (id_cliente de 1 a 5)
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Animal 1', 'Cachorro', 'Poodle', 2018);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Animal 2', 'Gato', 'Siamês', 2020);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (2, 'Animal 3', 'Cachorro', 'Bulldog', 2019);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (3, 'Animal 4', 'Cachorro', 'Pastor', 2015);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (4, 'Animal 5', 'Gato', 'Persa', 2021);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (4, 'Animal 6', 'Cachorro', 'Golden', 2022);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (5, 'Animal 7', 'Coelho', NULL, 2023);

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (5, 'Animal 8', 'Pássaro', 'Calopsita', 2020);

-- Inserindo 10 consultas de forma individual
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-10-01', 'Consulta de rotina');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (2, '2026-10-05', 'Vacina anual');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (3, '2026-10-10', 'Problema de pele');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (4, '2026-10-12', 'Exame de sangue');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (5, '2026-10-15', 'Vacina felina');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (6, '2026-10-18', 'Corte de unhas');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (7, '2026-10-20', 'Avaliação dentária');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (8, '2026-10-22', 'Corte de asas');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-10-25', 'Retorno da vacina');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (3, '2026-10-30', 'Retorno tratamento de pele');

-- 3. Consultas Solicitadas com inner join

SELECT animais.nome, animais.especie, clientes.nome 
FROM animais 
JOIN clientes ON animais.id_cliente = clientes.id_cliente;

-- Listar todas as consultas ordenando por data de realização
SELECT * FROM consultas ORDER BY data_consulta ASC;