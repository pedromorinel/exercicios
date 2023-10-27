-- EXERCÍCIO 1 --

CREATE TABLE Aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE Responsavel (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE parentesco (
    alunoId INT,
    responsavelId INT,
  	parentesco VARCHAR(255),
    FOREIGN KEY (alunoId) REFERENCES aluno(id),
    FOREIGN KEY (responsavelId) REFERENCES responsavel(id)
);

INSERT INTO aluno (nome) VALUES ('Lucas');
INSERT INTO parentesco (responsavelId, alunoId, parentesco) VALUES (1, 1, 'Pai'), (2, 1, 'Mãe');

-- EXERCÍCIO 2 --

WITH RankedParentescos AS (
    SELECT
        a.nome AS Aluno,
        r.nome AS Responsavel,
        p.parentesco,
        ROW_NUMBER() OVER (PARTITION BY a.id ORDER BY p.responsavelId) AS rn
    FROM
        aluno a
    JOIN
        parentesco p ON a.id = p.alunoId
    JOIN
        responsavel r ON p.responsavelId = r.id
)
SELECT
    Aluno,
    MAX(CASE WHEN rn = 1 THEN Responsavel END) AS Responsavel1,
    MAX(CASE WHEN rn = 1 THEN parentesco END) AS Parentesco1,
    MAX(CASE WHEN rn = 2 THEN Responsavel END) AS Responsavel2,
    MAX(CASE WHEN rn = 2 THEN parentesco END) AS Parentesco2
FROM
    RankedParentescos
GROUP BY
    Aluno;

-- EXERCÍCIO 3 --

select aluno.id as "ID do Aluno", aluno.nome as "Nome do Aluno", parentesco.alunoid as "Aluno ID", parentesco.responsavelid as "ID do Responsável", responsavel.id as "ID do Responsável", responsavel.nome as "Nome do Responsável", parentesco.parentesco as "Parentesco" from aluno 
join parentesco on aluno.ID = parentesco.alunoId
join responsavel on responsavel.id = parentesco.responsavelid;

