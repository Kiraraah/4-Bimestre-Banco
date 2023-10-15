DELIMITER//

CREATE FUNCTION listar_livros_por_autor(
    primeiro_nome VARCHAR(100),
    ultimo_nome VARCHAR(100)
) RETURNS TEXT
BEGIN
    DECLARE lista_livros TEXT DEFAULT '';
    DECLARE livro_titulo VARCHAR(100);

    DECLARE cursor_livros CURSOR FOR
        SELECT livro_titulo
        FROM Livro_Autor la
        INNER JOIN Livro ON livro_id = livro_id
        WHERE primeiro_nome = primeiro_nome
            AND ultimo_nome = ultimo_nome;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET lista_livros = NULL;

    OPEN cursor_livros;

    read_loop: LOOP
        FETCH cursor_livros INTO livro_titulo;

        IF lista_livros IS NULL THEN
            LEAVE read_loop;
        END IF;

        SET lista_livros = CONCAT(lista_livros, livro_titulo, '\n');
    END LOOP;

    CLOSE cursor_livros;

    RETURN lista_livros;
END//

DELIMITER;