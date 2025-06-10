CREATE PROCEDURE AdicionarItemAoPedido (
    IN p_PedidoID INT,
    IN p_ProdutoID INT,
    IN p_Quantidade INT
)
BEGIN
    DECLARE v_PrecoProduto DECIMAL(10, 2);
    DECLARE v_EstoqueAtual INT;
    DECLARE v_ValorItem DECIMAL(10, 2);

    START TRANSACTION;

    SELECT Preco, Estoque INTO v_PrecoProduto, v_EstoqueAtual
    FROM Produtos WHERE ProdutoID = p_ProdutoID;

    IF v_EstoqueAtual >= p_Quantidade THEN
        SET v_ValorItem = v_PrecoProduto * p_Quantidade;

      
        INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario)
        VALUES (p_PedidoID, p_ProdutoID, p_Quantidade, v_PrecoProduto);

      
        UPDATE Produtos
        SET Estoque = Estoque - p_Quantidade
        WHERE ProdutoID = p_ProdutoID;

   
        UPDATE Pedidos
        SET TotalPedido = TotalPedido + v_ValorItem
        WHERE PedidoID = p_PedidoID;


        COMMIT;
    ELSE
   
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Estoque insuficiente.';
    END IF;
END;

CREATE PROCEDURE AdicionarAvaliacaoProduto (
    IN p_ProdutoID INT,
    IN p_ClienteID INT,
    IN p_Nota INT,
    IN p_Comentario TEXT
)
BEGIN
    INSERT INTO Avaliacoes (ProdutoID, ClienteID, Nota, Comentario, DataAvaliacao)
    VALUES (p_ProdutoID, p_ClienteID, p_Nota, p_Comentario, CURRENT_TIMESTAMP);
END;
