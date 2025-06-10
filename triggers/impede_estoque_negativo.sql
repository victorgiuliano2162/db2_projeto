DELIMITER $$

CREATE TRIGGER tg_impede_estoque_negativo
BEFORE UPDATE ON Produtos
FOR EACH ROW
BEGIN
        IF NEW.Estoque < 0 THEN
                SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação cancelada: O estoque de um produto não pode ser negativo.';
    END IF;
END$$

DELIMITER ;
