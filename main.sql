DROP DATABASE IF EXIST sql_database;
CREATE DATABASE IF EXISTS sql_database;
USE sql_database;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS cards;
SHOW TABLES;

--Variables globales
SET @iva = 123;

--Modelos
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
SELECT * FROM cards;
SELECT u.name, c.brand, c.amount  FROM cards c JOIN clients u ON c.client_id = u.id;

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
    ('Marcelo', 4, 'MALE');

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
SELECT * FROM products;

CREATE TABLE buys (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    product_id INT NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);
INSERT INTO buys (quantity, product_id, client_id)
VALUES (3, 10, 2),
       (2, 12, 1);
SELECT * FROM buys;
SELECT b.id, b.quantity, c.name, price_total(b.id) as total  FROM buys b
    JOIN clients c
    ON b.client_id = c.id;
CREATE VIEW cantidad AS
SELECT b.id, b.quantity, p.name, p.category, price_total(b.id) FROM buys b
    JOIN products p
    WHERE b.product_id = p.id;
