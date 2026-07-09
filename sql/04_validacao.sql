-- Teste 01 - CPF DUPLICADO
-- Deve falhar porque o CPF 111.111.111-11 já pertence à Ana Silva

INSERT INTO cliente (prenome, sobrenome, cpf, email, data_nascimento)
VALUES ('Teste', 'CPF Duplicado', '111.111.111-11', 'duplicado@email.com', '1990-01-01');

-- Teste 02 - CLIENTE SEM PRENOME
-- Deve falhar porque prenome é NOT NULL

INSERT INTO cliente (prenome, sobrenome, cpf, email, data_nascimento)
VALUES (NULL, 'Sem Prenome', '101.101.101-10', 'semprenome@email.com', '1990-01-01');

-- Teste 03 - AGENDAMENTO COM CLIENTE INEXISTENTE
-- Deve falhar porque não existe cliente com id_cliente = 999

INSERT INTO agendamento (id_cliente, id_profissional, data_atendimento, horario)
VALUES (999, 1, '2026-07-10', '10:00');

-- Teste 04 - AGENDAMENTO COM PROFISSIONAL INEXISTENTE
-- Deve falhar porque não existe profissional com id_profissional = 999

INSERT INTO agendamento (id_cliente, id_profissional, data_atendimento, horario)
VALUES (1, 999, '2026-07-10', '11:00');

-- Teste 05 - PROFISSIONAL COM EXPERIÊNCIA NEGATIVA
-- Deve falhar por causa da restrição CHECK

INSERT INTO profissional (prenome, sobrenome, data_contratacao, tempo_experiencia, certificacoes)
VALUES ('Teste', 'Experiencia Negativa', '2024-01-01', -3, 'Teste inválido');

-- Teste 06 - COBRANÇA COM STATUS INVÁLIDO
-- Deve falhar porque o status deve ser pago, pendente, atrasado ou cancelado

INSERT INTO cobranca (id_agendamento, valor_total, valor_desconto, data_emissao, status_cobranca)
VALUES (1, 100.00, 0.00, '2026-07-01', 'em aberto');

-- Teste 07 - PARCELA COM STATUS INVÁLIDO
-- Deve falhar porque o status deve ser pago, pendente, atrasado ou cancelado

INSERT INTO parcela (id_cobranca, num_parcela, valor_parcela, data_vencimento, valor_juros, status_parcela)
VALUES (1, 2, 100.00, '2026-07-20', 0.00, 'aguardando');

-- Teste 08 - AGENDAMENTO DUPLICADO PARA O MESMO PROFISSIONAL
-- Deve falhar porque a profissional Marina já tem atendimento
-- em 2026-06-20 às 14:00

INSERT INTO agendamento (id_cliente, id_profissional, data_atendimento, horario)
VALUES (2, 1, '2026-06-20', '14:00');

-- Teste 09 - COBRANÇA DUPLICADA PARA O MESMO AGENDAMENTO
-- Deve falhar porque o agendamento 1 já possui cobrança

INSERT INTO cobranca (id_agendamento, valor_total, valor_desconto, data_emissao, status_cobranca)
VALUES (1, 200.00, 0.00, '2026-07-01', 'pendente');

-- Teste 10 - PAGAMENTO DUPLICADO PARA A MESMA PARCELA
-- Deve falhar porque a parcela 1 já possui pagamento

INSERT INTO pagamento (id_parcela, id_forma_pagamento, valor_pago, data_pagamento)
VALUES (1, 1, 200.00, '2026-07-01');

-- Teste 11 - PAGAMENTO COM FORMA DE PAGAMENTO INEXISTENTE
-- Deve falhar porque não existe forma_pagamento com id 999

INSERT INTO pagamento (id_parcela, id_forma_pagamento, valor_pago, data_pagamento)
VALUES (3, 999, 70.00, '2026-07-01');

-- Teste 12 - TRANSAÇÃO COM ROLLBACK
-- O cliente será inserido, mas a operação será desfeita

BEGIN;

INSERT INTO cliente (prenome, sobrenome, cpf, email, data_nascimento)
VALUES ('Cliente', 'Rollback', '123.123.123-12', 'rollback@email.com', '2000-01-01');

ROLLBACK;

SELECT *
FROM cliente
WHERE cpf = '123.123.123-12';

-- Teste 13 - TRANSAÇÃO COM COMMIT
-- O cliente será inserido e confirmado no banco

BEGIN;

INSERT INTO cliente (prenome, sobrenome, cpf, email, data_nascimento)
VALUES ('Cliente', 'Commit', '321.321.321-32', 'commit@email.com', '2001-01-01');

COMMIT;

SELECT *
FROM cliente
WHERE cpf = '321.321.321-32';


-- Teste 14 - UPDATE VÁLIDO
-- Atualiza uma parcela pendente para pago

UPDATE parcela
SET status_parcela = 'pago'
WHERE id_parcela = 3;

SELECT *
FROM parcela
WHERE id_parcela = 3;


-- Teste 15 - UPDATE INVÁLIDO
-- Deve falhar porque o status_parcela não aceita esse valor

UPDATE parcela
SET status_parcela = 'finalizado'
WHERE id_parcela = 4;


-- Teste 16 - DELETE VÁLIDO
-- Remove o cliente criado no teste de COMMIT

DELETE FROM cliente
WHERE cpf = '321.321.321-32';

SELECT *
FROM cliente
WHERE cpf = '321.321.321-32';