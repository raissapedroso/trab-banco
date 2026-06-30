# Trabalho Prático de Banco de Dados

Este projeto apresenta a modelagem e implementação de um banco de dados relacional para um sistema de gerenciamento de salão de beleza. O banco foi desenvolvido em PostgreSQL e pode ser executado localmente com Docker, terminal `psql` ou pgAdmin.

## Tecnologias utilizadas

- PostgreSQL
- Docker
- pgAdmin
- SQL

## Estrutura sugerida do projeto

```text
projeto-banco-dados/
├── README.md
├── scripts/
│   ├── 01_criacao_tabelas.sql
│   ├── 02_insercao_dados.sql
│   └── 03_consultas.sql
└── diagramas/
    └── modelo_er.png
```

> Os nomes dos arquivos podem ser adaptados conforme a organização do seu projeto.

## 1. Subindo o banco com Docker

Para criar e iniciar um container PostgreSQL, execute:

```bash
docker run --name bd-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=salao_beleza \
  -p 5432:5432 \
  -d postgres
```

Esse comando cria um banco chamado `salao_beleza`, com usuário `postgres` e senha `postgres`.

## 2. Verificando se o container está rodando

Execute:

```bash
docker ps
```

Se o container aparecer na lista, o PostgreSQL está ativo.

Caso ele esteja parado, use:

```bash
docker start bd-postgres
```

Para parar o container:

```bash
docker stop bd-postgres
```

## 3. Acessando o PostgreSQL pelo terminal

Para entrar no terminal do PostgreSQL dentro do container, execute:

```bash
docker exec -it bd-postgres psql -U postgres -d salao_beleza
```

Dentro do `psql`, alguns comandos úteis são:

```sql
\dt
```

Lista as tabelas criadas.

```sql
SELECT * FROM cliente;
```

Consulta os dados da tabela `cliente`.

Para sair do `psql`, use:

```sql
\q
```

## 4. Executando os scripts SQL pelo terminal

Se os arquivos estiverem dentro da pasta `scripts`, execute os comandos abaixo na pasta raiz do projeto.

### Criar as tabelas

```bash
docker exec -i bd-postgres psql -U postgres -d salao_beleza < scripts/01_criacao_tabelas.sql
```

### Inserir os dados iniciais

```bash
docker exec -i bd-postgres psql -U postgres -d salao_beleza < scripts/02_insercao_dados.sql
```

### Executar as consultas

```bash
docker exec -i bd-postgres psql -U postgres -d salao_beleza < scripts/03_consultas.sql
```

## 5. Configurando o banco no pgAdmin

Para acessar o banco pelo pgAdmin, crie um novo servidor com as seguintes configurações:

### Aba General

- Name: `bd-postgres`

### Aba Connection

- Host name/address: `localhost`
- Port: `5432`
- Maintenance database: `salao_beleza`
- Username: `postgres`
- Password: `postgres`

Depois de conectar, o banco estará disponível em:

```text
Servers > bd-postgres > Databases > salao_beleza
```

## 6. Ordem correta de execução

A ordem recomendada para rodar o projeto é:

1. Subir o container PostgreSQL.
2. Executar o script de criação das tabelas.
3. Executar o script de inserção dos dados.
4. Executar as consultas SQL.
5. Conferir os resultados no terminal ou no pgAdmin.

## 7. Como testar se deu certo

Após executar os scripts, entre no banco:

```bash
docker exec -it bd-postgres psql -U postgres -d salao_beleza
```

Liste as tabelas:

```sql
\dt
```

Faça uma consulta simples:

```sql
SELECT * FROM cliente;
```

Se as tabelas e os registros aparecerem, o banco foi configurado corretamente.

## 8. Possíveis problemas

### Erro: container com esse nome já existe

Se aparecer erro dizendo que o container `bd-postgres` já existe, inicie ele com:

```bash
docker start bd-postgres
```

Ou remova o container antigo e crie novamente:

```bash
docker rm bd-postgres
```

Depois execute novamente o comando `docker run`.

### Erro: porta 5432 já está em uso

Isso significa que outro PostgreSQL já está rodando na máquina. Você pode parar o serviço existente ou trocar a porta do Docker, por exemplo:

```bash
docker run --name bd-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=salao_beleza \
  -p 5433:5432 \
  -d postgres
```

Nesse caso, no pgAdmin, use a porta `5433`.

## 9. Observação

Este README foi criado para facilitar a configuração do ambiente, a execução dos scripts SQL e a validação do banco de dados tanto pelo terminal quanto pelo pgAdmin.
