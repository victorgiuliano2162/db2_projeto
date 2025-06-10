CREATE TABLE ProdutosFornecedores (
    ProdutoID INT,
    FornecedorID INT,
    PRIMARY KEY (ProdutoID, FornecedorID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);
