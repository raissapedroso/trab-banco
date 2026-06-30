-- massa inicial de dados fictícios para validação do banco

INSERT INTO cliente (prenome, sobrenome, cpf, email, data_nascimento) VALUES
('Ana', 'Silva', '111.111.111-11', 'ana.silva@email.com', '1998-05-10'),
('Bruna', 'Oliveira', '222.222.222-22', 'bruna.oliveira@email.com', '1995-08-22'),
('Carla', 'Santos', '333.333.333-33', 'carla.santos@email.com', '2000-03-15');

INSERT INTO cliente_telefone (id_cliente, telefone) VALUES
(1, '(55) 99999-1111'),
(1, '(55) 98888-1111'),
(2, '(55) 99999-2222'),
(3, '(55) 99999-3333');

INSERT INTO profissional (prenome, sobrenome, data_contratacao, tempo_experiencia, certificacoes) VALUES
('Marina', 'Costa', '2020-02-01', 6, 'Colorimetria e cortes femininos'),
('Juliana', 'Mendes', '2021-06-15', 4, 'Alongamento de unhas'),
('Patricia', 'Lima', '2019-09-10', 8, 'Estética facial'),
('Fernanda', 'Souza', '2022-01-20', 3, 'Pedicure profissional');

INSERT INTO cabeleireiro (id_profissional, tecnica_principal, especialidade_corte) VALUES
(1, 'Colorimetria', 'Corte em camadas');

INSERT INTO manicure (id_profissional, especialidade_mao) VALUES
(2, 'Alongamento em gel');

INSERT INTO pedicure (id_profissional, especialidade_pe) VALUES
(4, 'Spa dos pés');

INSERT INTO esteticista (id_profissional, area_atuacao, nivel_experiencia) VALUES
(3, 'Limpeza de pele', 'Avançado');

INSERT INTO servico (preco, descricao_servico) VALUES
(80.00, 'Corte feminino'),
(120.00, 'Hidratação capilar'),
(60.00, 'Manicure'),
(70.00, 'Pedicure'),
(150.00, 'Limpeza de pele');

INSERT INTO agendamento (id_cliente, id_profissional, data_atendimento, horario) VALUES
(1, 1, '2026-06-20', '14:00'),
(2, 2, '2026-06-21', '10:00'),
(3, 3, '2026-06-22', '15:30'),
(1, 4, '2026-06-23', '09:00');

INSERT INTO servico_agendado (id_agendamento, id_servico) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 5),
(4, 4);

INSERT INTO cobranca (id_agendamento, valor_total, valor_desconto, data_emissao, status_cobranca) VALUES
(1, 200.00, 0.00, '2026-06-20', 'pago'),
(2, 60.00, 0.00, '2026-06-21', 'pago'),
(3, 150.00, 10.00, '2026-06-22', 'pendente'),
(4, 70.00, 0.00, '2026-06-23', 'pendente');

INSERT INTO parcela (id_cobranca, num_parcela, valor_parcela, data_vencimento, valor_juros, status_parcela) VALUES
(1, 1, 200.00, '2026-06-20', 0.00, 'pago'),
(2, 1, 60.00, '2026-06-21', 0.00, 'pago'),
(3, 1, 70.00, '2026-07-01', 0.00, 'pendente'),
(3, 2, 70.00, '2026-08-01', 0.00, 'pendente'),
(4, 1, 70.00, '2026-06-25', 5.00, 'atrasado');

INSERT INTO forma_pagamento (ativo) VALUES
(TRUE),
(TRUE),
(TRUE);

INSERT INTO forma_pix (id_forma_pagamento, chave_pix, data_expiracao, data_confirmacao) VALUES
(1, 'salao.bela@pix.com', '2026-12-31', '2026-06-20');

INSERT INTO forma_cartao (id_forma_pagamento, tipo_cartao, bandeira, taxa_operadora, ultimos_4_digitos) VALUES
(2, 'crédito', 'Visa', 2.50, '1234');

INSERT INTO forma_dinheiro (id_forma_pagamento, valor_recebido) VALUES
(3, 100.00);

INSERT INTO pagamento (id_parcela, id_forma_pagamento, valor_pago, data_pagamento) VALUES
(1, 1, 200.00, '2026-06-20'),
(2, 2, 60.00, '2026-06-21');