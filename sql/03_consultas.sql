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

-- 04: qual serviços são mais realizados?
SELECT servico.id_servico,
    servico.descricao_servico,
    COUNT(*) AS quantidade
FROM servico
JOIN servico_agendado
    ON servico.id_servico = servico_agendado.id_servico
GROUP BY servico.id_servico, servico.descricao_servico
ORDER BY quantidade DESC
LIMIT 1;
    
-- 05: quais cobranças estão pendentes ou atrasadas?
SELECT id_cobranca, valor_total, status_cobranca
FROM cobranca
WHERE status_cobranca IN ('pendente', 'atrasado');

-- 06: qual foi o faturamento total do salão?
SELECT SUM(pagamento.id_pagamento) FROM pagamento;