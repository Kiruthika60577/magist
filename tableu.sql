SELECT product_category_name,COUNT(*) AS num_products
FROM products
GROUP BY product_category_name;

--------

SELECT 
    product_category_name,
    COUNT(*) AS total_items_sold,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM products) AS percentage
FROM products
WHERE product_category_name IN ('audio', 'pcs', 'informatica_accessorios', 'consoles_games', 'electronicos', 'pc_gamer', 'dimatizacao', 'telephony')
GROUP BY product_category_name;

------ 
SELECT 
    product_category_name,
    COUNT(*) AS total_items_sold,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM products) AS category_percentage,
    (SELECT COUNT(*) FROM products WHERE product_category_name NOT IN ('audio', 'pcs', 'informatica_accessorios', 'consoles_games', 'electronicos', 'pc_gamer', 'dimatizacao', 'telephony')) * 100.0 / COUNT(*) AS other_categories_percentage
FROM products
WHERE 
    product_category_name IN ('audio', 'pcs', 'informatica_accessorios', 'consoles_games', 'electronicos', 'pc_gamer', 'dimatizacao', 'telephony')
GROUP BY product_category_name;

---------

SELECT AVG(price) AS average_price
FROM order_items;

--------

SELECT product_category_name,
    CASE WHEN price > 1000 THEN 'Expensive'
         ELSE 'Not Expensive'
    END AS price,
    COUNT(*) AS total_items_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE product_category_name IN ('audio', 'pcs', 'informatica_accessorios', 'consoles_games', 'electronicos', 'pc_gamer', 'dimatizacao', 'telephony')
GROUP BY product_category_name,price;








