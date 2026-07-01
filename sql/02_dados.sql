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
    
INSERT INTO cliente (prenome, sobrenome, cpf, email, data_nascimento) VALUES
('Daniela', 'Ferreira', '444.444.444-44', 'daniela.ferreira@email.com', '1992-11-30'),
('Eduarda', 'Pereira', '555.555.555-55', 'eduarda.pereira@email.com', '2001-01-18'),
('Fernanda', 'Almeida', '666.666.666-66', 'fernanda.almeida@email.com', '1988-07-09'),
('Gabriela', 'Rodrigues', '777.777.777-77', 'gabriela.rodrigues@email.com', '1999-12-05'),
('Helena', 'Martins', '888.888.888-88', 'helena.martins@email.com', '1990-04-25'),
('Isabela', 'Gomes', '999.999.999-99', 'isabela.gomes@email.com', '1997-09-14');

INSERT INTO cliente_telefone (id_cliente, telefone) VALUES
(4, '(55) 99999-4444'),
(5, '(55) 99999-5555'),
(5, '(55) 98888-5555'),
(6, '(55) 99999-6666'),
(7, '(55) 99999-7777'),
(8, '(55) 99999-8888'),
(9, '(55) 99999-9999');

INSERT INTO profissional (prenome, sobrenome, data_contratacao, tempo_experiencia, certificacoes) VALUES
('Camila', 'Ribeiro', '2018-03-12', 10, 'Cortes masculinos e femininos'),
('Larissa', 'Teixeira', '2023-05-08', 2, 'Design de sobrancelhas'),
('Bianca', 'Moreira', '2020-10-17', 5, 'Massagem facial e estética corporal');

INSERT INTO cabeleireiro (id_profissional, tecnica_principal, especialidade_corte) VALUES
(5, 'Corte e finalização', 'Corte repicado');

INSERT INTO manicure (id_profissional, especialidade_mao) VALUES
(6, 'Esmaltação em gel');

INSERT INTO esteticista (id_profissional, area_atuacao, nivel_experiencia) VALUES
(7, 'Estética corporal', 'Intermediário');

INSERT INTO servico (preco, descricao_servico) VALUES
(90.00, 'Escova modelada'),
(200.00, 'Coloração'),
(45.00, 'Design de sobrancelhas'),
(180.00, 'Massagem facial'),
(250.00, 'Progressiva');

INSERT INTO agendamento (id_cliente, id_profissional, data_atendimento, horario) VALUES
(4, 1, '2026-06-24', '13:00'),
(5, 5, '2026-06-24', '16:00'),
(6, 6, '2026-06-25', '11:00'),
(7, 7, '2026-06-26', '14:30'),
(8, 1, '2026-06-27', '09:30'),
(9, 3, '2026-06-28', '15:00'),
(2, 4, '2026-06-29', '10:30'),
(3, 5, '2026-06-30', '17:00');

INSERT INTO servico_agendado (id_agendamento, id_servico) VALUES
(5, 1),
(5, 6),
(6, 7),
(6, 10),
(7, 3),
(7, 8),
(8, 9),
(9, 2),
(9, 7),
(10, 5),
(10, 9),
(11, 4),
(12, 1),
(12, 10);

INSERT INTO cobranca (id_agendamento, valor_total, valor_desconto, data_emissao, status_cobranca) VALUES
(5, 170.00, 0.00, '2026-06-24', 'pago'),
(6, 450.00, 20.00, '2026-06-24', 'pago'),
(7, 105.00, 0.00, '2026-06-25', 'pendente'),
(8, 180.00, 0.00, '2026-06-26', 'pago'),
(9, 320.00, 30.00, '2026-06-27', 'pendente'),
(10, 195.00, 0.00, '2026-06-28', 'atrasado'),
(11, 70.00, 0.00, '2026-06-29', 'pago'),
(12, 330.00, 0.00, '2026-06-30', 'pendente');

INSERT INTO parcela (id_cobranca, num_parcela, valor_parcela, data_vencimento, valor_juros, status_parcela) VALUES
(5, 1, 170.00, '2026-06-24', 0.00, 'pago'),
(6, 1, 215.00, '2026-06-24', 0.00, 'pago'),
(6, 2, 215.00, '2026-07-24', 0.00, 'pago'),
(7, 1, 105.00, '2026-07-05', 0.00, 'pendente'),
(8, 1, 180.00, '2026-06-26', 0.00, 'pago'),
(9, 1, 145.00, '2026-07-10', 0.00, 'pendente'),
(9, 2, 145.00, '2026-08-10', 0.00, 'pendente'),
(10, 1, 195.00, '2026-06-28', 8.00, 'atrasado'),
(11, 1, 70.00, '2026-06-29', 0.00, 'pago'),
(12, 1, 110.00, '2026-07-15', 0.00, 'pendente'),
(12, 2, 110.00, '2026-08-15', 0.00, 'pendente'),
(12, 3, 110.00, '2026-09-15', 0.00, 'pendente');

INSERT INTO forma_pagamento (ativo) VALUES
(TRUE),
(TRUE),
(TRUE),
(TRUE),
(TRUE);

INSERT INTO forma_pix (id_forma_pagamento, chave_pix, data_expiracao, data_confirmacao) VALUES
(4, 'daniela.pix@email.com', '2026-12-31', '2026-06-24'),
(5, 'gabriela.pix@email.com', '2026-12-31', '2026-06-26');

INSERT INTO forma_cartao (id_forma_pagamento, tipo_cartao, bandeira, taxa_operadora, ultimos_4_digitos) VALUES
(6, 'crédito', 'Mastercard', 2.80, '5678'),
(7, 'débito', 'Elo', 1.50, '9012');

INSERT INTO forma_dinheiro (id_forma_pagamento, valor_recebido) VALUES
(8, 200.00);

INSERT INTO pagamento (id_parcela, id_forma_pagamento, valor_pago, data_pagamento) VALUES
(6, 4, 170.00, '2026-06-24'),
(7, 6, 215.00, '2026-06-24'),
(8, 6, 215.00, '2026-07-24'),
(10, 5, 180.00, '2026-06-26'),
(14, 8, 70.00, '2026-06-29');