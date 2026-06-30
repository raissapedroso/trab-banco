# Sistema de Gerenciamento de Salão de Beleza - Banco de Dados

## Integrantes
-   Maria de Lurdes 
-   Raissa Pedroso

## Tecnologias utilizadas

-   PostgreSQL
-   pgAdmin 4 (opcional)
-   Docker
-   Docker Compose

------------------------------------------------------------------------

## Estrutura do projeto

``` text
.
├── docker-compose.yml
├── sql/
│   ├── ddl.sql          # Criação das tabelas
│   ├── dml.sql          # Massa de dados
│   └── consultas.sql    # Consultas do trabalho
└── README.md
```

> Caso os arquivos SQL estejam em outro diretório, apenas ajuste os
> caminhos dos comandos.

------------------------------------------------------------------------

## 1. Iniciar o banco

Na pasta do projeto execute:

``` bash
docker compose up -d
```

Verifique se o container está em execução:

``` bash
docker ps
```

------------------------------------------------------------------------

## 2. Entrar no PostgreSQL

Se o container estiver com o nome **bd-postgres**:

``` bash
docker exec -it bd-postgres psql -U postgres
```

Caso o nome seja diferente:

``` bash
docker ps
```

e utilize o nome exibido.

------------------------------------------------------------------------

## 3. Criar o banco

Dentro do PostgreSQL:

``` sql
CREATE DATABASE salao;
```

Conectar ao banco:

``` sql
\c salao
```

------------------------------------------------------------------------

## 4. Executar os scripts

Ainda no terminal do PostgreSQL:

``` sql
\i /caminho/para/sql/ddl.sql
```

Depois:

``` sql
\i /caminho/para/sql/dml.sql
```

Exemplo em Linux:

``` sql
\i /app/sql/ddl.sql
```

Exemplo no Windows (psql local):

``` sql
\i C:/Users/SeuUsuario/Projeto/sql/ddl.sql
```

------------------------------------------------------------------------

## 5. Conferir se tudo foi criado

Listar tabelas:

``` sql
\dt
```

Visualizar alguns registros:

``` sql
SELECT * FROM cliente;
SELECT * FROM profissional;
SELECT * FROM servico;
SELECT * FROM agendamento;
```

------------------------------------------------------------------------

## 6. Executar as consultas

``` sql
\i /caminho/para/sql/consultas.sql
```

Ou execute cada consulta individualmente no pgAdmin.

------------------------------------------------------------------------

## Utilizando o pgAdmin

1.  Abra o pgAdmin.
2.  Conecte ao servidor PostgreSQL.
3.  Abra o banco **salao**.
4.  Abra o Query Tool.
5.  Execute primeiro o arquivo **ddl.sql**.
6.  Execute o arquivo **dml.sql**.
7.  Execute o arquivo **consultas.sql**.

------------------------------------------------------------------------

## Observações

-   O projeto utiliza chaves primárias com
    `GENERATED ALWAYS AS IDENTITY`.
-   As restrições de integridade (PRIMARY KEY, FOREIGN KEY, UNIQUE e
    CHECK) já estão implementadas.
-   Os dados de teste são inseridos automaticamente pelo arquivo
    `dml.sql`.
-   As consultas presentes em `consultas.sql` demonstram o funcionamento
    do banco e atendem aos requisitos do trabalho.

------------------------------------------------------------------------

## Limpar o ambiente

Parar os containers:

``` bash
docker compose down
```

Remover também os volumes (apagando o banco):

``` bash
docker compose down -v
```
