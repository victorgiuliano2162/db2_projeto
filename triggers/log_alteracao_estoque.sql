DELIMITER $$

CREATE TRIGGER tg_log_alteracao_estoque
AFTER UPDATE ON Produtos
FOR EACH ROW
BEGIN
    IF OLD.Estoque <> NEW.Estoque THEN
        INSERT INTO LogEstoque (ProdutoID, EstoqueAntigo, EstoqueNovo, Usuario)
        VALUES (OLD.ProdutoID, OLD.Estoque, NEW.Estoque, CURRENT_USER());
    END IF;
END$$

DELIMITER;
