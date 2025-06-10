CREATE TABLE LogEstoque (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    ProdutoID INT NOT NULL,
    EstoqueAntigo INT NOT NULL,
    EstoqueNovo INT NOT NULL,
    Usuario VARCHAR(100),
    DataAlteracao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);
