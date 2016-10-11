
CREATE SEQUENCE public.id_tempo_seq;

CREATE TABLE public.Tempo (
                Id_tempo BIGINT NOT NULL DEFAULT nextval('public.id_tempo_seq'),
                Semestre INTEGER NOT NULL,
                Ano INTEGER NOT NULL,
                CONSTRAINT id_tempo PRIMARY KEY (Id_tempo)
);


ALTER SEQUENCE public.id_tempo_seq OWNED BY public.Tempo.Id_tempo;

CREATE SEQUENCE public.id_curso_seq;

CREATE TABLE public.Curso (
                Id_curso VARCHAR NOT NULL DEFAULT nextval('public.id_curso_seq'),
                Descricao VARCHAR NOT NULL,
                CONSTRAINT id_curso PRIMARY KEY (Id_curso)
);


ALTER SEQUENCE public.id_curso_seq OWNED BY public.Curso.Id_curso;

CREATE SEQUENCE public.id_disciplina_seq;

CREATE TABLE public.Disciplina (
                Id_disciplina BIGINT NOT NULL DEFAULT nextval('public.id_disciplina_seq'),
                Descricao VARCHAR NOT NULL,
                CONSTRAINT id_disciplina PRIMARY KEY (Id_disciplina)
);


ALTER SEQUENCE public.id_disciplina_seq OWNED BY public.Disciplina.Id_disciplina;

CREATE SEQUENCE public.id_aluno_seq;

CREATE TABLE public.Aluno (
                Id_aluno BIGINT NOT NULL DEFAULT nextval('public.id_aluno_seq'),
                Nome VARCHAR NOT NULL,
                Idade INTEGER NOT NULL,
                CONSTRAINT id_aluno PRIMARY KEY (Id_aluno)
);


ALTER SEQUENCE public.id_aluno_seq OWNED BY public.Aluno.Id_aluno;

CREATE TABLE public.fato_aulas (
                Id_tempo BIGINT NOT NULL,
                Id_disciplina BIGINT NOT NULL,
                Id_curso VARCHAR NOT NULL,
                Id_aluno BIGINT NOT NULL,
                Aprovados INTEGER NOT NULL,
                Reprovados INTEGER NOT NULL,
                Quant_alunos_curso INTEGER NOT NULL,
                Quant_disc_curso INTEGER NOT NULL,
                CONSTRAINT fato_aulas_pk PRIMARY KEY (Id_tempo, Id_disciplina, Id_curso, Id_aluno)
);


ALTER TABLE public.fato_aulas ADD CONSTRAINT dim_tempo_fato_aulas_fk
FOREIGN KEY (Id_tempo)
REFERENCES public.Tempo (Id_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_aulas ADD CONSTRAINT dim_curso_fato_aulas_fk
FOREIGN KEY (Id_curso)
REFERENCES public.Curso (Id_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_aulas ADD CONSTRAINT dim_disciplina_fato_aulas_fk
FOREIGN KEY (Id_disciplina)
REFERENCES public.Disciplina (Id_disciplina)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fato_aulas ADD CONSTRAINT aluno_fato_aulas_fk
FOREIGN KEY (Id_aluno)
REFERENCES public.Aluno (Id_aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
