-- pergunta de negócio:
-- 01: quais clientes possuem mais agendamentos cadastrados?
SELECT
    cliente.id_cliente,
    cliente.prenome,
    cliente.sobrenome,
    COUNT(agendamento.id_agendamento) AS quantidade_agendamentos
FROM cliente
JOIN agendamento
    ON agendamento.id_cliente = cliente.id_cliente
GROUP BY
    cliente.id_cliente,
    cliente.prenome,
    cliente.sobrenome
ORDER BY quantidade_agendamentos DESC;

-- 02: quais profissionais realizaram mais atendimentos?
SELECT profissional.id_profissional, 
    profissional.prenome,
    profissional.sobrenome,
    COUNT(agendamento.id_agendamento) AS quantidade_atendimentos
FROM profissional
JOIN agendamento
    ON agendamento.id_profissional = profissional.id_profissional
GROUP BY 
    profissional.id_profissional,
    profissional.prenome,
    profissional.sobrenome
ORDER BY quantidade_atendimentos DESC;

-- 03: qual serviços são mais realizados?
SELECT servico.id_servico,
    servico.descricao_servico,
    COUNT(*) AS quantidade
FROM servico
JOIN servico_agendado
    ON servico.id_servico = servico_agendado.id_servico
GROUP BY servico.id_servico, servico.descricao_servico
ORDER BY quantidade DESC
LIMIT 1;
    
-- 04: quais cobranças estão pendentes ou atrasadas?
SELECT id_cobranca, 
    valor_total, 
    status_cobranca
FROM cobranca
WHERE status_cobranca IN ('pendente', 'atrasado');

-- 05: qual foi o faturamento total do salão?
SELECT SUM(pagamento.id_pagamento) FROM pagamento;

-- 06: Qual cliente gastou mais dinheiro no salão?
SELECT
    cliente.id_cliente,
    cliente.prenome,
    cliente.sobrenome,
    SUM(cobranca.valor_total) AS total_gasto
FROM cliente
JOIN agendamento
    ON cliente.id_cliente = agendamento.id_cliente
JOIN cobranca
    ON agendamento.id_agendamento = cobranca.id_agendamento
GROUP BY
    cliente.id_cliente,
    cliente.prenome,
    cliente.sobrenome
ORDER BY total_gasto DESC
LIMIT 1;

-- 07: Quais pagamentos foram realizados e qual forma de pagamento foi usada?
SELECT
    pagamento.id_pagamento,
    pagamento.valor_pago,
    pagamento.data_pagamento,
    forma_pagamento.id_forma_pagamento,
    forma_pix.chave_pix,
    forma_cartao.tipo_cartao,
    forma_cartao.bandeira,
    forma_dinheiro.valor_recebido
FROM pagamento
JOIN forma_pagamento
    ON pagamento.id_forma_pagamento = forma_pagamento.id_forma_pagamento
LEFT JOIN forma_pix
    ON forma_pagamento.id_forma_pagamento = forma_pix.id_forma_pagamento
LEFT JOIN forma_cartao
    ON forma_pagamento.id_forma_pagamento = forma_cartao.id_forma_pagamento
LEFT JOIN forma_dinheiro
    ON forma_pagamento.id_forma_pagamento = forma_dinheiro.id_forma_pagamento;

-- 08: Qual a forma de pagamento mais utilizada?
SELECT
    CASE
        WHEN forma_pix.id_forma_pagamento IS NOT NULL THEN 'Pix'
        WHEN forma_cartao.id_forma_pagamento IS NOT NULL THEN 'Cartão'
        WHEN forma_dinheiro.id_forma_pagamento IS NOT NULL THEN 'Dinheiro'
    END AS forma_pagamento,
    COUNT(pagamento.id_pagamento) AS quantidade_utilizada
FROM pagamento
JOIN forma_pagamento
    ON pagamento.id_forma_pagamento = forma_pagamento.id_forma_pagamento
LEFT JOIN forma_pix
    ON forma_pagamento.id_forma_pagamento = forma_pix.id_forma_pagamento
LEFT JOIN forma_cartao
    ON forma_pagamento.id_forma_pagamento = forma_cartao.id_forma_pagamento
LEFT JOIN forma_dinheiro
    ON forma_pagamento.id_forma_pagamento = forma_dinheiro.id_forma_pagamento
GROUP BY forma_pagamento
ORDER BY quantidade_utilizada DESC
LIMIT 1;

-- 09: Qual é o valor médio das cobranças?
SELECT
    AVG(valor_total) AS media_cobrancas
FROM cobranca;