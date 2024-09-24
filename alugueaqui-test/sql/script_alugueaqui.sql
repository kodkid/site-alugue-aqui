DROP DATABASE IF EXISTS db_alugueaqui;
CREATE DATABASE IF NOT EXISTS db_alugueaqui;

CREATE TABLE IF NOT EXISTS db_alugueaqui.users(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(500) NOT NULL,
    endereco TEXT
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.produtos(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idEmpresa INTEGER, 
    nomeProduto VARCHAR(50) NOT NULL,
    qtdProduto FLOAT 
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.empresas(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idProduto INTEGER,
    nomeEmpresa VARCHAR(50) NOT NULL,
    endereco TEXT
);

CREATE TABLE IF NOT EXISTS db_alugueaqui.lojas(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    idProduto INTEGER NOT NULL,
    idEmpresa INTEGER NOT NULL,
    descricao TEXT
);

ALTER TABLE db_alugueaqui.produtos ADD CONSTRAINT fk_produto_empresa FOREIGN KEY (idEmpresa)
REFERENCES db_alugueaqui.empresas(id);
ALTER TABLE db_alugueaqui.empresas ADD CONSTRAINT fk_empresa_produto FOREIGN KEY (idProduto)
REFERENCES db_alugueaqui.produtos(id);
ALTER TABLE db_alugueaqui.lojas ADD CONSTRAINT fk_loja_produto FOREIGN KEY (idProduto)
REFERENCES db_alugueaqui.produtos(id);
ALTER TABLE db_alugueaqui.lojas ADD CONSTRAINT fk_loja_empresas FOREIGN KEY (idEmpresa)
REFERENCES db_alugueaqui.empresas(id);