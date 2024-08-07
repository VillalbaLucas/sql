USE sql_database;
SHOW TABLES;
-- Query WHERE (conditions)
SELECT * FROM clients;
SELECT * FROM clients WHERE id BETWEEN 2 AND 4;
SELECT * FROM clients WHERE id IN(2,4);
SELECT * FROM clients WHERE id NOT IN(2,4);
SELECT * FROM clients WHERE name IN("lucas","Marcelo");

--Cadenas de texto

SELECT * FROM cards;
-- = es case sensitive, LIKE es case insensitive
SELECT * FROM cards WHERE brand = "MasterCard"; 
SELECT * FROM cards WHERE brand Like "mastercard"; 
SELECT * FROM cards WHERE brand != "Mastercard"; 
SELECT * FROM cards WHERE type_card LIKE "%D__"; 

-- ORDER BY, LIMIT, OFFSET, DISTINCT
SELECT * FROM clients  ORDER BY name ASC; 
SELECT DISTINCT name FROM clients ORDER BY name ASC; 
SELECT * FROM clients WHERE name LIKE "lali" ORDER BY age ASC; 
SELECT * FROM clients ORDER BY name ASC LIMIT 3 OFFSET 0; 

-- JOINS

SELECT name, brand, type_card, amount FROM clients 
    INNER JOIN cards ON clients.id = client_id
    ORDER BY amount ASC;
SELECT name, brand, type_card, amount FROM clients 
    RIGHT JOIN cards ON clients.id = client_id;
SELECT name, brand, type_card, amount FROM clients 
    LEFT JOIN cards ON clients.id = client_id;
SELECT * FROM clients 
    FULL JOIN cards ON clients.id = cards.client_id;
