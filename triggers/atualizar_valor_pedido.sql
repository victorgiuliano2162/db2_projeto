DELIMITER $$

CREATE TRIGGER tg_atualiza_valor_pago_pedido
AFTER INSERT ON Pagamentos
FOR EACH ROW
BEGIN
    UPDATE Pedidos
    SET ValorPago = ValorPago + NEW.Valor
    WHERE PedidoID = NEW.PedidoID;
END$$

DELIMITER ;
