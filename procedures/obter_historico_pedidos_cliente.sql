CREATE PROCEDURE ObterHistoricoPedidosCliente (
    IN p_ClienteID INT
)
BEGIN

    SELECT
        PedidoID,
        DataPedido,
        StatusPedido,
        TotalPedido
    FROM Pedidos
    WHERE ClienteID = p_ClienteID
    ORDER BY DataPedido DESC;
END;
