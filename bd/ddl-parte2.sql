use `biblioteca_pessoal`;

CREATE TABLE IF NOT EXISTS autores(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    biografia text NOT NULL,
    dataNascimento DATE NOT NULL
);

INSERT INTO autores (nome, biografia, dataNascimento)
SELECT autor, 'Precisa alterar na tela de cadastro', now()
from livros;

ALTER TABLE livros
ADD id_autor INT;

UPDATE livros l
SET id_autor = (SELECT min(a.id) FROM autores a WHERE a.nome = l.autor);

ALTER TABLE livros
DROP COLUMN autor;

ALTER TABLE livros
MODIFY id_autor INT NOT NULL;