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