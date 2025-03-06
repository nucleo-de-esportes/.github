CREATE TABLE usuario (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE aluno (
    ra SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE,
    CONSTRAINT fk_aluno_usuario FOREIGN KEY (user_id) REFERENCES usuario(user_id) ON DELETE CASCADE
);

CREATE TABLE professor (
    matricula_professor SERIAL PRIMARY KEY,
    user_id INTEGER UNIQUE,
    CONSTRAINT fk_professor_usuario FOREIGN KEY (user_id) REFERENCES usuario(user_id) ON DELETE CASCADE
);

CREATE TABLE modalidade (
    modalidade_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE local (
    local_id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    campus VARCHAR(255) NOT NULL
);

CREATE TABLE turma (
    turma_id SERIAL PRIMARY KEY,
    horario TIMESTAMP NOT NULL,
    limite_inscritos INTEGER NOT NULL,
    dia_semana VARCHAR(50) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    local_id INTEGER,
    modalidade_id INTEGER NOT NULL,
    CONSTRAINT fk_turma_local FOREIGN KEY (campus_id) REFERENCES local(local_id) ON DELETE SET NULL,
    CONSTRAINT fk_turma_modalidade FOREIGN KEY (modalidade_id) REFERENCES modalidade(modalidade_id) ON DELETE CASCADE
);

CREATE TABLE usuario_turma (
    user_id INTEGER,
    turma_id INTEGER,
    PRIMARY KEY (user_id, turma_id),
    CONSTRAINT fk_usuario_turma_usuario FOREIGN KEY (user_id) REFERENCES usuario(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_turma_turma FOREIGN KEY (turma_id) REFERENCES turma(turma_id) ON DELETE CASCADE
);
