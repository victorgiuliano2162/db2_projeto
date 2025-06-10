CREATE TABLE Avaliacoes (
    AvaliacaoID INT PRIMARY KEY AUTO_INCREMENT,
    ProdutoID INT,
    ClienteID INT,
    Nota INT CHECK (Nota >= 1 AND Nota <= 5),
    Comentario TEXT,
    DataAvaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
