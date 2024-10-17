DROP DATABASE IF EXISTS db_alugueaqui;
CREATE DATABASE IF NOT EXISTS db_alugueaqui;


CREATE TABLE IF NOT EXISTS db_alugueaqui.usuarios(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(500) NOT NULL,
    endereco TEXT,
    cep INTEGER(12)
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.produtos(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idEmpresa INTEGER, 
    nomeProduto VARCHAR(50) NOT NULL,
    preco FLOAT(50),
    qtdProduto FLOAT 
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.empresas(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idTransacao INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    nomeEmpresa VARCHAR(50) NOT NULL,
    emailEmpresa VARCHAR(50),
    endereco TEXT,
    cepEmpresa FLOAT(50)
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.anuncios(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idProduto INTEGER NOT NULL,
    idUsuario INTEGER NOT NULL,
    idCarrinho INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.produto_alugado(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idTransacoes INTEGER NOT NULL,
    idProduto INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS db_alugueaqui.transacoes(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    idAnuncio INTEGER NOT NULL,
    idEmpresa INTEGER NOT NULL,
    idProdutoAlugado INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS db_alugueaqui.carrinho(
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    idAnuncio INTEGER NOT NULL,
    idTransacoes INTEGER NOT NULL,
    itens INTEGER
);



ALTER TABLE db_alugueaqui.anuncios ADD CONSTRAINT fk_anuncios_produto FOREIGN KEY (idProduto)
REFERENCES db_alugueaqui.produtos(id);
ALTER TABLE db_alugueaqui.carrinho ADD CONSTRAINT fk_carrinho_anuncios FOREIGN KEY (idAnuncio)
REFERENCES db_alugueaqui.anuncios(id);
ALTER TABLE db_alugueaqui.anuncios ADD CONSTRAINT fk_transacoes_carrinho FOREIGN KEY (idCarrinho)
REFERENCES db_alugueaqui.carrinho(id);
ALTER TABLE db_alugueaqui.anuncios ADD CONSTRAINT fk_transacoes_carrinho FOREIGN KEY (idCarrinho)
REFERENCES db_alugueaqui.carrinho(id);
