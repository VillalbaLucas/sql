DROP DATABASE IF EXIST sql_database;
CREATE DATABASE IF NOT EXISTS sql_database;
USE sql_database;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS cards;
SHOW TABLES;

--Variables globales
SET @iva = 123;

--Modelos
CREATE TABLE clients (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL, 
    gender ENUM('MALE', 'FEMALE') NOT NULL
);
SELECT * FROM clients;
INSERT INTO clients (name, age, gender)
VALUES ('Lucas', 24, 1),
    ('Mariana', 41, 'FEMALE'),
    ('Robertinhi', 19, 'MALE'),
    ('Marcelo', 4, 'MALE'),
    ('Marcelo', 32, 'MALE'),
    ('Lali', 25, 'FEMALE'),
    ('Lali', 21, 'FEMALE');

CREATE TABLE cards (
    id INT UNIQUE NOT NULL AUTO_INCREMENT, 
    brand VARCHAR(100) NOT NULL, 
    type_card ENUM('DEBIT', 'CREDIT') NOT NULL, 
    amount DOUBLE NOT NULL,
    client_id INT, 
    FOREIGN KEY (client_id) REFERENCES clients (id)
);
INSERT INTO cards ( brand, type_card, amount, client_id)
VALUES ('MasterCard', 'CREDIT', 120000.12, 1),
    ('Visa', 'CREDIT', 50700, 2),
    ('Uala', 'DEBIT', 12000, 1),
    ('BruBank', 'CREDIT', 40500.50, 4);
CREATE TABLE products (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50) NOT NULL, 
    price DOUBLE NOT NULL, 
    category ENUM('TECNOLOGIA', 'COCINA', 'MUEBLE', 'HERRAMIENTA', 'ELECTRONICA', 'DEPORTE') NOT NULL
);
INSERT INTO products (name, price, category)
VALUES ('Xiaomi', 40000, 1),
       ('Silla de madera', 5500.99, 3),
       ('Pelota', 10100, 6),
       ('Tablet', 63700.50, 1);

CREATE TABLE buys (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    product_id INT NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);
INSERT INTO buys (quantity, product_id, client_id)
VALUES (3, 1, 2),
       (2, 3, 1);

--Consultas
SELECT * FROM clients;
SELECT * FROM cards;
SELECT * FROM products;
SELECT * FROM buys;

SELECT u.name, c.brand, c.amount  FROM cards c JOIN clients u ON c.client_id = u.id;
SELECT b.id, b.quantity, c.name, price_total(b.id) as total  FROM buys b
    JOIN clients c
    ON b.client_id = c.id;

--Consulta a una view creada
SELECT * FROM cantidad_precio_buys;
