# Criando tabela de compras dos clientes

``` mermaid
    erDiagram
        clientes{
            int id PK
            string nome
            string cpf
            string endereço
            FK int numero_compra
            date data
            date valid
            date pago
            float valor
            status bool 
        }

    compras { 
        int id PK
        int id_cliente
        date data_compra
    }

    endereco{
        int id PK
        int idcliente fk
        string rua
        string numero 
        string bairro
        string CEP
        string uf
    }

    numero{
        int id PK
        int id_cliente FK
        varchar tipo
        varcher telefone
    }

    clientes ||--o{ compras: "conecta"
    clientes ||--o{ endereco: "conecta"
    clientes ||--o{ numero: "conecta"
```