CREATE DATABASE sistema_eleitoral;
USE sistema_eleitoral;

CREATE TABLE LOCALIDADE (
    id_localidade INT PRIMARY KEY,
    nome_localidade VARCHAR(100),
    estado VARCHAR(2)
);

CREATE TABLE ZONA_ELEITORAL (
    id_zona INT PRIMARY KEY,
    nome_zona VARCHAR(100),
    FK_LOCALIDADE_id_localidade INT,
    FOREIGN KEY (FK_LOCALIDADE_id_localidade) REFERENCES LOCALIDADE(id_localidade)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE SECAO_ELEITORAL (
    id_secao INT PRIMARY KEY,
    nome_secao VARCHAR(100),
    FK_ZONA_id_zona INT,
    FOREIGN KEY (FK_ZONA_id_zona) REFERENCES ZONA_ELEITORAL(id_zona)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- LOCALIDADE
INSERT INTO LOCALIDADE VALUES 
(1, 'Capital Paulista', 'SP'),
(2, 'Cidade Maravilhosa', 'RJ'),
(3, 'Bela Horizonte', 'MG'),
(4, 'Salvador das Almas', 'BA'),
(5, 'Capital do Sul', 'PR');

INSERT INTO ZONA_ELEITORAL VALUES
(1, 'Zona Norte', 1),
(2, 'Zona Sul Profunda', 1),
(3, 'Zona Leste', 2),
(4, 'Zona Oeste', 3),
(5, 'Zona Central', 4);

INSERT INTO SECAO_ELEITORAL VALUES
(1, 'Seção 101', 1),
(2, 'Seção 102', 1),
(3, 'Seção 201', 2),
(4, 'Seção 301', 3),
(5, 'Seção 401', 4);

UPDATE LOCALIDADE 
SET nome_localidade = 'Capital Paulista Atualizada' 
WHERE id_localidade = 1;

UPDATE ZONA_ELEITORAL 
SET nome_zona = 'Zona Sul Extrema' 
WHERE id_zona = 2;

DELETE FROM SECAO_ELEITORAL WHERE id_secao = 5;
DELETE FROM SECAO_ELEITORAL WHERE id_secao = 4;

SELECT ZE.nome_zona
FROM ZONA_ELEITORAL ZE
JOIN LOCALIDADE L ON ZE.FK_LOCALIDADE_id_localidade = L.id_localidade
WHERE L.nome_localidade = 'Capital Paulista Atualizada'
ORDER BY ZE.nome_zona;

SELECT nome_secao
FROM SECAO_ELEITORAL
WHERE FK_ZONA_id_zona = 1
ORDER BY nome_secao;