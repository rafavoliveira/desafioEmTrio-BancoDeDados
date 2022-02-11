-- Resolução do desafio em trio de Banco de Dados
-- Integrantes: Alex Ramos/ Olivia Rodrigues/ Rafael Vasconcelos
CREATE TABLE cliente(

   id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

   nome VARCHAR(100) NOT NULL, 

   email VARCHAR(70) NOT NULL UNIQUE, 

   senha VARCHAR(20) NOT NULL, 

   cpf VARCHAR(15) NOT NULL UNIQUE

);


CREATE TABLE departamento(

codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

nome   VARCHAR(50) NOT NULL, 

descricao TEXT

);



CREATE TABLE endereco(

num_seq    INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

tipo       VARCHAR(5) NOT NULL, 

logradouro VARCHAR(45) NOT NULL, 

numero     INTEGER, 

complemento VARCHAR(20), 

bairro     VARCHAR(30), 

cidade     VARCHAR(50),

estado     VARCHAR(2), 

cep        VARCHAR(10), 

cliente_id INTEGER NOT NULL,

CONSTRAINT endereco_cliente FOREIGN KEY 

(cliente_id) REFERENCES cliente(id)

);





CREATE TABLE pedido(

numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

status VARCHAR(1) NOT NULL, 

data_pedido DATE, 

valor_bruto DOUBLE, 

desconto    DOUBLE, 

valor_final   DOUBLE, 

cliente_id INTEGER NOT NULL,

CONSTRAINT cliente_pedido FOREIGN KEY 

   (cliente_id) REFERENCES cliente(id)

);



CREATE TABLE produto(

codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

nome VARCHAR(45) NOT NULL, 

descricao TEXT, 

preco DOUBLE, 

estoque INTEGER, 

link_foto VARCHAR(255), 

    departamento_codigo INTEGER NOT NULL,

CONSTRAINT produto_depto FOREIGN KEY 

(departamento_codigo) REFERENCES departamento(codigo)

);



CREATE TABLE item_pedido(

num_sequencial INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 

quantidade INTEGER, 

valor_unitario DOUBLE, 

valor_total DOUBLE, 

produto_codigo INTEGER NOT NULL, 

pedido_numero INTEGER NOT NULL,

CONSTRAINT item_produto FOREIGN KEY 

(produto_codigo) REFERENCES produto(codigo),

CONSTRAINT item_pedido FOREIGN KEY 

    (pedido_numero) REFERENCES pedido(numero)

);


insert into cliente (nome, email, senha, cpf)
values ("Alberto", "alberto@gmail.com", "alb1275", "631.808.200-04");
insert into cliente (nome, email, senha, cpf)
values ("Lucivânia", "lucivania@gmail.com", "luci7310", "697.080.340-61");
insert into cliente (nome, email, senha, cpf)
values ("Alexandre", "alexandre@gmail.com", "@ale754312", "924.945.250-04");
insert into cliente (nome, email, senha, cpf)
values ("Yuri", "yurimarques@gmail.com", "@Yuri#1704", "257.492.130-56");
insert into cliente (nome, email, senha, cpf)
values ("Marcos", "marcosantonio@gmail.com", "marcos321", "198.203.290-19");


insert into departamento (nome, descricao)
values ("eletrônicos", "seção de produtos eletrônicos");
insert into departamento (nome, descricao)
values ("móveis", "seção de móveis para casa");
insert into departamento (nome, descricao)
values ("ferramentas", "seção de ferramentas");
insert into departamento (nome, descricao)
values ("livros", "seção de livros");
insert into departamento (nome, descricao)
values ("informática", "seção de produtos de informática");

insert into endereco (tipo, logradouro, numero, complemento, bairro,
cidade, estado, cep, cliente_id) values ("casa", "Vila Oiticica", 101, "", "Centro",
"Viçosa do Ceará", "CE", "62300-976", 1);
insert into endereco (tipo, logradouro, numero, complemento, bairro,
cidade, estado, cep, cliente_id) values ("casa", "Rua Américo Campolina Rezende", 87, "",
"Fernão Dias","Belo Horizonte", "MG", "31910-385", 2);
insert into endereco (tipo, logradouro, numero, complemento, bairro,
cidade, estado, cep, cliente_id) values ("casa", "Rua Herculano", 215, "", "Sumaré",
"São Paulo", "SP", "01257-030", 3);
insert into endereco (tipo, logradouro, numero, complemento, bairro,
cidade, estado, cep, cliente_id) values ("apto", "Rua Ramiro Cabral e Silva", 33, "", "Águas
Claras","Brusque", "SC", "88353-718", 4);
insert into endereco (tipo, logradouro, numero, complemento, bairro,
cidade, estado, cep, cliente_id) values ("casa", "Rua H-I", 75, "Altos", "Novo Aleixo",
"Manaus", "AM", "69058-566", 6);



insert into produto (nome, departamento_codigo, preco, estoque) values ("Celular", 1, 32.50, 5);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Maquina da lavar", 1, 6.50, 645);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Cama", 2, 11.50, 50);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 1", 2, 1.50, 50);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 2", 3, 7.50, 3);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 3", 3, 8.50, 4);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 4", 4, 6.50, 645);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 5", 4, 4.50, 50);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 6", 5, 8.50, 50);
insert into produto (nome, departamento_codigo, preco, estoque) values ("Produto 7", 5, 0.50, 6);



insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-01-05", 40.50, 3.50, 37.00, 1);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-02-05", 40.50, 3.50, 37.00, 1);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-04-05", 40.50, 3.50, 37.00, 2);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-01-05", 40.50, 3.50, 37.00, 2);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-01-05", 40.50, 3.50, 37.00, 3);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-01-02", 40.50, 3.50, 37.00, 3);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-02-03", 40.50, 3.50, 37.00, 4);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-02-04", 40.50, 3.50, 37.00, 5);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-02-05", 40.50, 3.50, 37.00, 5);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2022-02-06", 40.50, 3.50, 37.00, 4);
insert into pedido (status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) values ("E", "2020-02-06", 30.50, 3.50, 37.00, 4);



insert into item_pedido (quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (40, 10.10, 404.00, 4, 1);
insert into item_pedido (quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (40, 10.10, 404.00, 5, 1);
insert into item_pedido (quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (40, 10.10, 404.00, 3, 2);
insert into item_pedido (quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (40, 10.10, 404.00, 6, 2);
insert into item_pedido (quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (40, 10.10, 404.00, 1, 3);
insert into item_pedido (quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) values (40, 10.10, 404.00, 2, 3);

-- *************** EXERCÍCIOS ***************

-- 1- Quantos clientes estão cadastrados na sua base?
R: select count(cliente.id) from cliente;

-- 2- Qual o produto mais caro?
R: select nome, preco from produto where preco = (select max(preco) from produto);


-- 3- Qual o produto mais barato?
R: select nome, preco from produto where preco = (select min(preco) from produto);

-- 4- Mostre todos os produtos com seus respectivos departamentos.
R: select * from produto inner join departamento on departamento.codigo = produto.departamento_codigo;

-- 5- Quantos produtos há em cada departamento? Exiba o nome do departamento e a quantidade de produtos que há em cada um. (pense em SUM e GROUP BY)
R: select departamento.nome, count(produto.codigo), departamento.codigo from produto right outer join departamento on produto.departamento_codigo = departamento.codigo group by departamento.codigo;

-- 6- Mostre os dados dos pedidos, incluindo nomes dos clientes e nomes dos produtos que foram vendidos.
R: select pedido.numero, pedido.status, pedido.data_pedido, pedido.valor_bruto, pedido.desconto, pedido.valor_final, cliente.nome as cliente, produto.nome as produto from pedido left join cliente on pedido.cliente_id = cliente.id right join item_pedido on pedido.numero = item_pedido.pedido_numero left join produto on produto.codigo = item_pedido.produto_codigo;

-- 7- Mostre quantos pedidos foram feitos por mês no ano de 2022 (caso você tenha registros neste ano, senão escolha um ano que você tenha cadastrado - Novamente pense em COUNT e GROUP BY).
R: SELECT month(pedido.data_pedido) as 'Mês de 2022', count(month(pedido.data_pedido)) as Quantidade from pedido WHERE YEAR(pedido.data_pedido) = 2022 group by MONTH(pedido.data_pedido);

-- 8- Mostre quanto foi faturado por mês (leve em conta o valor total de cada pedido - novamente pense em GROUP BY e SUM).
R: SELECT month(pedido.data_pedido) as 'Mês', year(pedido.data_pedido) as 'Ano', count(month(pedido.data_pedido)) as Quantidade, sum(pedido.valor_final) as 'Rendimento mensal' from pedido group by year(pedido.data_pedido), MONTH(pedido.data_pedido);

-- 9- Mostre o valor total do estoque por departamento.
R: select sum(produto.preco * produto.estoque) as Inventário, departamento.codigo, departamento.nome from produto right outer join departamento on produto.departamento_codigo = departamento.codigo group by departamento.codigo;

