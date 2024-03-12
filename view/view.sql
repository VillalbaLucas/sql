
DROP VIEW IF EXISTS cantidad;
CREATE VIEW cantidad_precio_buys AS
SELECT b.id, b.quantity, p.name, p.category, price_total(b.id) FROM buys b
    JOIN products p
    WHERE b.product_id = p.id;