# O básico de BD
# Comando que eu não vou esquecer
### 1.0. Acessar o Postgress por CLI:
### 1.1. Usando o Usuário do Linux(PAM):
```bash
- sudo -u postgres psql -h localhost;
```

### 1.2.  Utilizando o Usuário do postgres:
```bash
- psql -U *usuario* -h localhost -d *banco_app*;
```
---
### 2.0. Gerenciando Banco de Dados:
```bash
- CREATE DATABASE *nome_do banco_*(minusculo);
```
### 2.1 Alterar dono do Banco de Dados
```bash
- ALTER DATABASE *nome_do_banco* OWNER TO *usuario*; 
```
### 2.2 Apagar o Banco:
```bash
- DROP DATABASE *nome_do_banco*;
```

---
### 3.0 Criando Um Novo Usuário no Postgres
```bash
- CREATE USER *nome_do_usuario* WITH PASSWORD 'senha';
```

### 3.2. Trocando a Senha:
```bash
- ALTER USER *nome_do_usuario* WITH PASSWORD 'senha';
```


### 3.3. Deletando o Usuário:
```bash
- DELETE USER *nome_do_usuario;
```

### 3.4 Trocando o Nome do Usuário
```bash
-ALTER USER nome_atual WITH NAME = novo_nome;
```




