CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    CategoriaID INT,
    Nome VARCHAR(150) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT DEFAULT 0,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);
