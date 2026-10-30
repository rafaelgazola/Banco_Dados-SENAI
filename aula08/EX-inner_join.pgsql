SELECT * FROM livros;
SELECT * FROM livros_autores;

INSERT INTO autores (nome) VALUES ('marcio');

ALTER TABLE livros 
ADD CONSTRAINT isbn_unique UNIQUE (isbn);

INSERT INTO livros (isbn, titulo, editora) VALUES ('aaaa-bbbb', 'teste', 'senai')

SELECT l.titulo, a.nome, l.editora from livros_autores AS la
INNER JOIN livros AS l ON la.id_autor = l.id
INNER JOIN autores AS a ON la.id_autor = a.id




