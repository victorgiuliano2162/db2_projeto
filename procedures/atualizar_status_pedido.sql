CREATE PROCEDURE AtualizarStatusPedido (
    IN p_PedidoID INT,
    IN p_NovoStatus VARCHAR(50)
)
BEGIN
    
    UPDATE Pedidos
    SET StatusPedido = p_NovoStatus
    WHERE PedidoID = p_PedidoID;
END;
