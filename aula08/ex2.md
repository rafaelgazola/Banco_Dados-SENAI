### Exercício 2: Catálogo de Livros e Autores  
#### Cenário: Um sistema de biblioteca exibe os dados assim:  
*View_Livros: ISBN, Titulo, Autores, Editora*  

_Dados: 978-85, "Banco de Dados", "C.J. Date, Abraham Silberschatz", "Pearson"_

*Tarefa: Um livro pode ser escrito por vários autores e um autor pode escrever vários livros. Crie o diagrama no Mermaid aplicando a normalização (incluindo a tabela associativa/intermediária).*  


#### Primeira solução  
```mermaid
erDiagram
Livros { 
    int IDAutor FK "UNIQUE AUTOINCREMENT"
    string ISBN "NOT NULL"
    string titulo "NOT NULL"
    string editora "NOT NULL"
}

Autores {
    int ID PK "UNIQUE AUTOINCREMENT"
    int IDLivro FK "NOT NULL"
    string nome "NOT NULL"
}

Livros }|--|{ Autores:"São escritos"
```
#### Segunda solução - Com 3 Entidades
```mermaid
erDiagram
Livros {
    int ID PK "UNIQUE AUTOINCREMENT"
    string ISBN "NOT NULL"
    string titulo "NOT NULL"
    string editora  "NOT NULL"
    %% string autores - retirado desta entidade por ser um atributo composto
}

Autores {
    int ID PK "UNIQUE AUTOINCREMENT"
    string nome "NOT NULL"
}

LivrosAutores {
    int ID PK "UNIQUE AUTOINCREMENT"
    int ID_Autor FK "NOT NULL"
    int ID_LIvro FK "NOT NULL"
}

Livros ||--|{ LivrosAutores:"São publicados por autor(es)"
Autores ||--|{ LivrosAutores:"Escreve(m) livro(s)"
```
