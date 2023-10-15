DELIMITER //

CREATE FUNCTION atualizar_resumos()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE livro_id INT;
    DECLARE resumo_atual VARCHAR(100);

    DECLARE cursor_livros CURSOR FOR
        SELECT livro_id, resumo
        FROM Livro;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cursor_livros;

    read_loop: LOOP
        FETCH cursor_livros INTO livro_id, resumo_atual;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        UPDATE Livro
        SET resumo = CONCAT(resumo_atual, "Este é um excelente livro!!")
        WHERE livro_id = livro_id;
    END LOOP;

    CLOSE cursor_livros;
END//

DELIMITER;