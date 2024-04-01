SELECT p.product_name, s.price, s.year
FROM product p
JOIN sales s ON p.product_id = s.product_id;