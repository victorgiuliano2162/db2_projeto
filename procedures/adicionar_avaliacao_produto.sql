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
