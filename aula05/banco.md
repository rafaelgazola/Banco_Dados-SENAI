### Redmd. MD
```Mermaid
---
title: Atividade 01
--- 
erDiagram
    CLIENTES{
        int ID PK
        string Nome 
        string CPF
    }

    TELEFONE{
        int ID PK
        int ID_CLIENTE FK
        string TELEFONE
    }

    CLIENTES ||--o{ TELEFONE : ID_CLIENTE
```


```Mermaid
---
title: Atividade 02
---

erDiagram
    LIVRO{
        int ID PK
        string ISBN
        varchar(50) Titulo
        varchar(20) autores FK
        varchar(20) editores
    }

    AUTORES{
        int ID PK
        varcahr(60) nome
    }
    LIVRO ||--o{ AUTORES : "possui"
```

```Mermaid
---
title: Atividade 03
---
erDiagram
    PEDIDO {
        int CodPedido PK
        string Data
        string Cliente
    }

    PRODUTO {
        int CodProduto PK
        string NomeProduto
        decimal PrecoUnitario
    }

    CLIENTE {
        int CodPedido FK
        int CodProduto FK
        int Quantidade
    }
CLIENTE ||--o{ PRODUTO: "certo"
PRODUTO ||--o{ PEDIDO: "Compro"
```

```Mermaid

---
title: Atividade 04
---
erDiagram
    TURMA{
        string CodTurma PK
        varchar(30) nomeTurma
        varchar(30) Disciplina
        varchar(30) Professor
    }
    
    DISCIPLINA{
        int id PK
        varchar(30) nome
        varchar(20) professor(FK)
        string CodTurma FK
    }

    PROFESSOR{
        int id PK
        varchar(10) nome
    }

TURMA ||--o{ DISCIPLINA : "aprendem"
DISCIPLINA ||--o{ PROFESSOR: "leciona" 
TURMA ||--o{ PROFESSOR: "dimistram"
```



```Mermaid

---
title: Atividade 05
---
erDiagram
    PROJETO {
        INT ID_Proj PK
        VARCHAR NomeProjeto
    }

    FUNCIONARIO {
        INT ID_Func PK
        VARCHAR NomeFuncionario
    }

    ALOCACAO {
        INT ID_Proj FK
        INT ID_Func FK
        VARCHAR Funcao
    }

PROJETO ||--|{ ALOCACAO : possui
FUNCIONARIO ||--|{ ALOCACAO : trabalha_em




