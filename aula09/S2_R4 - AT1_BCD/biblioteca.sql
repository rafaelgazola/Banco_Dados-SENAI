-- 1. Criação das Tabelas
CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(150),
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INTEGER NOT NULL,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE emprestimos (
    id_emprestimo SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

CREATE TABLE itens_emprestimo (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    PRIMARY KEY (id_emprestimo, id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimos(id_emprestimo),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- 2. Inserção de Registros (Individuais)

-- Inserindo 3 alunos
INSERT INTO alunos (nome, matricula, email) VALUES ('Aluno 1', 'MAT01', 'aluno1@email.com');
INSERT INTO alunos (nome, matricula, email) VALUES ('Aluno 2', 'MAT02', 'aluno2@email.com');
INSERT INTO alunos (nome, matricula, email) VALUES ('Aluno 3', 'MAT03', 'aluno3@email.com');

-- Inserindo 10 livros
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 1', 'Autor A', 2001);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 2', 'Autor B', 2002);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 3', 'Autor C', 2003);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 4', 'Autor D', 2004);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 5', 'Autor E', 2005);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 6', 'Autor F', 2006);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 7', 'Autor G', 2007);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 8', 'Autor H', 2008);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 9', 'Autor I', 2009);
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES ('Livro 10', 'Autor J', 2010);

-- Inserindo 15 empréstimos (3 meses diferentes)
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-01-05', '2026-01-10');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-01-12', '2026-01-15');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-01-18', NULL);
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-01-22', '2026-01-25');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-01-28', '2026-01-30');

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-02-02', '2026-02-08');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-02-10', '2026-02-15');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-02-14', NULL);
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-02-20', '2026-02-24');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-02-25', '2026-02-28');

INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-03-05', '2026-03-10');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-03-12', '2026-03-15');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (1, '2026-03-18', NULL);
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (2, '2026-03-22', '2026-03-26');
INSERT INTO emprestimos (id_aluno, data_emprestimo, data_devolucao) VALUES (3, '2026-03-28', '2026-03-31');

-- Vinculando livros aos empréstimos
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (1, 1);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (2, 2);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (3, 3);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (4, 4);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (5, 5);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (6, 6);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (7, 7);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (8, 8);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (9, 9);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (10, 10);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (11, 1);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (12, 2);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (13, 3);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (14, 4);
INSERT INTO itens_emprestimo (id_emprestimo, id_livro) VALUES (15, 5);

-- 3. Consultas Solicitadas
SELECT titulo, autor FROM livros;
SELECT * FROM emprestimos ORDER BY data_emprestimo ASC;