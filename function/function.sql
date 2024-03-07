USE sql_database;
DROP FUNCTION IF EXISTS price_total;
DELIMITER $$
CREATE FUNCTION price_total(buys_id INT) RETURNS DOUBLE DETERMINISTIC 
BEGIN
    DECLARE total DOUBLE;
    SELECT b.quantity * p.price INTO total 
    FROM buys b JOIN products p
        ON b.product_id = p.id 
        WHERE b.id = buys_id;
    RETURN total;
END$$
DELIMITER ;