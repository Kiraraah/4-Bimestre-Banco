DELIMITER//
CREATE FUNCTION total_livros_por_genero(
    nome_genero VARCHAR(80)
) RETURNS INT
BEGIN
    DECLARE total_livros INT DEFAULT 0;
    DECLARE livro_genero VARCHAR(80);

    DECLARE cursor_livros CURSOR FOR
        SELECT genero FROM livros;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET total_livros = -1;
    OPEN cursor_livros;

    read_loop: LOOP
        FETCH cursor_livros INTO livro_genero;

        IF total_livros = -1 THEN
            LEAVE read_loop;
        END IF;

        IF livro_genero = nome_genero THEN
            SET total_livros = total_livros + 1;
        END IF;
    END LOOP;

    CLOSE cursor_livros;