-- pergunta de negócio:
-- quais clientes possuem mais agendamentos cadastrados?
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

-- quais profissionais realizaram mais atendimentos?
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

-- quais serviços são mais realizados?
SELECT 
    servico.id_servico,
    servico.preco,
    servico.descricao_servico,
    