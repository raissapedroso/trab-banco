CREATE TABLE cliente (
    id_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    prenome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE cliente_telefone (
    id_cliente INTEGER NOT NULL,
    telefone VARCHAR(20) NOT NULL,

    PRIMARY KEY (id_cliente, telefone),

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
        ON DELETE CASCADE
);

CREATE TABLE profissional (
    id_profissional INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    prenome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    tempo_experiencia INTEGER CHECK (tempo_experiencia >= 0),
    certificacoes VARCHAR(255)
);

CREATE TABLE cabeleireiro (
    id_profissional INTEGER PRIMARY KEY,
    tecnica_principal VARCHAR(100),
    especialidade_corte VARCHAR(100),

    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)
        ON DELETE CASCADE
);

CREATE TABLE manicure (
    id_profissional INTEGER PRIMARY KEY,
    especialidade_mao VARCHAR(100),

    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)
        ON DELETE CASCADE
);

CREATE TABLE pedicure (
    id_profissional INTEGER PRIMARY KEY,
    especialidade_pe VARCHAR(100),

    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)
        ON DELETE CASCADE
);

CREATE TABLE esteticista (
    id_profissional INTEGER PRIMARY KEY,
    area_atuacao VARCHAR(100),
    nivel_experiencia VARCHAR(100),

    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)
        ON DELETE CASCADE
);

CREATE TABLE servico (
    id_servico INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    preco NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    descricao_servico VARCHAR(255) NOT NULL
);

CREATE TABLE agendamento (
    id_agendamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_profissional INTEGER NOT NULL,
    data_atendimento DATE NOT NULL,
    horario TIME NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional),

    UNIQUE (id_profissional, data_atendimento, horario)
);

CREATE TABLE servico_agendado (
    id_agendamento INTEGER NOT NULL,
    id_servico INTEGER NOT NULL,

    PRIMARY KEY (id_agendamento, id_servico),

    FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento)
        ON DELETE CASCADE,

    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

CREATE TABLE cobranca (
    id_cobranca INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_agendamento INTEGER NOT NULL UNIQUE,
    valor_total NUMERIC(10,2) NOT NULL CHECK (valor_total >= 0),
    valor_desconto NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (valor_desconto >= 0),
    data_emissao DATE NOT NULL DEFAULT CURRENT_DATE,
    status_cobranca VARCHAR(20) NOT NULL DEFAULT 'pendente'
        CHECK (status_cobranca IN ('pendente', 'pago', 'cancelado')),

    FOREIGN KEY (id_agendamento) REFERENCES agendamento(id_agendamento)
        ON DELETE CASCADE
);

CREATE TABLE parcela (
    id_parcela INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cobranca INTEGER NOT NULL,
    num_parcela INTEGER NOT NULL CHECK (num_parcela > 0),
    valor_parcela NUMERIC(10,2) NOT NULL CHECK (valor_parcela >= 0),
    data_vencimento DATE NOT NULL,
    valor_juros NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (valor_juros >= 0),
    status_parcela VARCHAR(20) NOT NULL DEFAULT 'pendente'
        CHECK (
            status_parcela IN (
                'pendente',
                'pago',
                'atrasado',
                'cancelado'
            )
        ),

    FOREIGN KEY (id_cobranca) REFERENCES cobranca(id_cobranca)
        ON DELETE CASCADE,

    UNIQUE (id_cobranca, num_parcela)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pagamento (
    id_pagamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_parcela INTEGER NOT NULL UNIQUE,
    id_forma_pagamento INTEGER NOT NULL,
    valor_pago NUMERIC(10,2) NOT NULL CHECK (valor_pago >= 0),
    data_pagamento DATE NOT NULL DEFAULT CURRENT_DATE,

    FOREIGN KEY (id_parcela) REFERENCES parcela(id_parcela)
        ON DELETE CASCADE,

    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

CREATE TABLE forma_pix (
    id_forma_pagamento INTEGER PRIMARY KEY,
    chave_pix VARCHAR(100),
    data_expiracao DATE,
    data_confirmacao DATE,

    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
        ON DELETE CASCADE
);

CREATE TABLE forma_cartao (
    id_forma_pagamento INTEGER PRIMARY KEY,
    tipo_cartao VARCHAR(30),
    bandeira VARCHAR(30),
    taxa_operadora NUMERIC(5,2) DEFAULT 0 CHECK (taxa_operadora >= 0),
    ultimos_4_digitos CHAR(4),

    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
        ON DELETE CASCADE
);

CREATE TABLE forma_dinheiro (
    id_forma_pagamento INTEGER PRIMARY KEY,
    valor_recebido NUMERIC(10,2) CHECK (valor_recebido >= 0),

    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
        ON DELETE CASCADE
);