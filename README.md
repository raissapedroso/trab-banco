# Trabalho Prático de Banco de Dados – Entrega 2

## Sistema de Gerenciamento de Salão de Beleza

### Grupo 04

## Integrantes

* Raissa Pedroso
* Maria de Lurdes
* Glaucia D. Tavares

---

# Descrição do Projeto

Este projeto consiste no desenvolvimento de um banco de dados para um sistema de gerenciamento de um salão de beleza.

O objetivo é permitir o gerenciamento de clientes, profissionais, serviços, agendamentos, cobranças, parcelas e pagamentos, garantindo a integridade dos dados por meio das restrições implementadas no PostgreSQL.

O ambiente foi desenvolvido utilizando Docker Compose, permitindo que o banco de dados seja recriado automaticamente em qualquer computador que possua Docker instalado.

---

# Tecnologias Utilizadas

* PostgreSQL 16
* Docker
* Docker Compose

---

# Estrutura do Projeto

```
grupo_04_entrega_2/

├── README.md
├── compose.yaml
├── .env.example
├── sql/
│   ├── 01_schema.sql
│   ├── 02_dados.sql
│   ├── 03_consultas.sql
│   └── 04_validacao.sql
├── diagramas/
│   ├── modelo_conceitual.pdf
│   └── modelo_logico.pdf
```

---

# Pré-requisitos

Para executar o projeto é necessário possuir instalado:

* Docker Desktop
* Docker Compose

Não é necessário instalar o PostgreSQL localmente.

---

# Informações do Banco de Dados

**Banco de dados**

```
salao_beleza
```

**Usuário**

```
grupo04
```

**Senha**

```
grupo04
```

**Imagem Docker**

```
postgres:16
```

**Porta**

```
5432
```

---

# Inicializando o Ambiente

Na pasta do projeto execute:

```bash
docker compose up -d
```

Esse comando irá:

* criar o container PostgreSQL;
* criar automaticamente o banco de dados;
* executar o arquivo `01_schema.sql`;
* executar o arquivo `02_dados.sql`;
* carregar a massa inicial de dados.

---

# Verificando se o Container está em Execução

Execute:

```bash
docker ps
```

O resultado deverá apresentar um container semelhante a:

```
grupo04_postgres
```

---

# Acessando o PostgreSQL

Para acessar o banco de dados execute:

```bash
docker exec -it grupo04_postgres psql -U grupo04 -d salao_beleza
```

---

# Comandos Úteis

## Listar todas as tabelas

```sql
\dt
```

## Descrever uma tabela

Exemplo:

```sql
\d cliente
```

## Sair do PostgreSQL

```sql
\q
```

---

# Executando as Consultas

Caso deseje executar todas as consultas de uma única vez:

```bash
docker exec -it grupo04_postgres \
psql -U grupo04 -d salao_beleza \
-f /scripts/03_consultas.sql
```

As consultas respondem perguntas de negócio como:

* clientes com maior número de agendamentos;
* profissionais com mais atendimentos;
* serviços mais realizados;
* cobranças pendentes;
* faturamento total;
* cliente que mais gastou;
* pagamentos realizados;
* forma de pagamento utilizada;
* valor médio das cobranças.

---

# Executando os Testes de Validação

Para executar os testes:

```bash
docker exec -it grupo04_postgres \
psql -U grupo04 -d salao_beleza \
-f /scripts/04_validacao.sql
```

Esse arquivo contém testes para validar as restrições implementadas no banco de dados.

Os testes incluem:

* inserções válidas;
* violações de chave primária;
* violações de chave estrangeira;
* violações de UNIQUE;
* violações de CHECK;
* violações de NOT NULL;
* testes de UPDATE;
* testes de DELETE;
* transações utilizando BEGIN, COMMIT e ROLLBACK.

Alguns comandos foram desenvolvidos para falhar propositalmente, verificando o correto funcionamento das restrições de integridade.

---

# Reiniciando o Banco de Dados

Para parar os containers:

```bash
docker compose down
```

Para remover completamente os dados persistidos:

```bash
docker compose down -v
```

Para reconstruir completamente o ambiente:

```bash
docker compose up -d
```

Após esse procedimento o banco será recriado automaticamente com o esquema e a massa inicial de dados.

---

# Organização dos Scripts

## 01_schema.sql

Contém toda a implementação do banco de dados, incluindo:

* criação das tabelas;
* chaves primárias;
* chaves estrangeiras;
* restrições NOT NULL;
* restrições UNIQUE;
* restrições CHECK;
* valores padrão;
* relacionamentos.

---

## 02_dados.sql

Contém a massa inicial de dados fictícios utilizada para validar o funcionamento do banco.

Os dados contemplam todas as tabelas do sistema e representam diferentes situações de negócio.

---

## 03_consultas.sql

Contém as consultas SQL desenvolvidas para responder perguntas relacionadas ao domínio do salão de beleza.

Todas as consultas possuem comentários explicando a pergunta de negócio respondida.

---

## 04_validacao.sql

Contém testes de validação das regras de integridade implementadas no PostgreSQL.

Esse arquivo deve ser executado manualmente.

---

# Limitações Conhecidas

Este projeto foi desenvolvido exclusivamente para fins acadêmicos.

Os dados utilizados são totalmente fictícios.

O sistema contempla apenas a camada de banco de dados, não possuindo interface gráfica ou aplicação para manipulação dos registros.

---

# Observações Finais

O ambiente foi desenvolvido para ser totalmente reproduzível utilizando Docker Compose.

Após a execução dos comandos apresentados neste documento, o avaliador poderá reconstruir integralmente o banco de dados, executar as consultas, realizar os testes de validação e verificar o funcionamento do projeto sem necessidade de configurações adicionais.

---

# Declaração de Uso de Inteligência Artificial

Foram utilizadas ferramentas de Inteligência Artificial, incluindo ChatGPT/Codex, como apoio à revisão textual, conferência dos critérios de avaliação, verificação de coerência entre artigo e scripts SQL, e identificação de inconsistências técnicas. O conteúdo foi revisado pelo grupo, que permanece responsável pela autoria, pelas decisões de modelagem e pela correção final da entrega.
