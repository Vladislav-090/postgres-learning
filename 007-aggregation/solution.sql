SELECT COUNT(*) FROM fk_orders;

SELECT COUNT(*) AS total_orders
FROM fk_orders;

SELECT SUM(total_amount) AS total_revenue
FROM fk_orders;

SELECT AVG(total_amount) AS average_order_amount
FROM fk_orders;

SELECT MAX(total_amount) AS max_order_amount
FROM fk_orders;

SELECT MIN(total_amount) AS min_order_amount
FROM fk_orders;

SELECT
    MAX(total_amount) AS max_order_amount,
    MIN(total_amount) AS min_order_amount
FROM fk_orders;

SELECT
    user_id,
    COUNT(*) AS orders_count
FROM fk_orders
GROUP BY user_id
ORDER BY user_id ASC;

SELECT
    user_id,
    SUM(total_amount) AS total_spent
FROM fk_orders
GROUP BY user_id
ORDER BY user_id ASC;

SELECT
    u.name AS user_name,
    COUNT(o.id) AS orders_count,
    SUM(o.total_amount) AS total_spent
FROM fk_users u
JOIN fk_orders o ON u.id = o.user_id
GROUP BY u.name
ORDER BY total_spent ASC;

SELECT 
    status,
    COUNT(*) AS orders_count
FROM fk_orders
GROUP BY status
ORDER BY orders_count ASC;


SELECT 
    user_id,
    SUM(total_amount) AS total_spent
FROM fk_orders
GROUP BY user_id
HAVING SUM(total_amount) > 300
ORDER BY total_spent ASC;


SELECT 
    u.name AS user_name,
    COUNT(o.id) AS orders_count,
    SUM(o.total_amount) AS total_spent
FROM fk_users u
JOIN fk_orders o ON u.id = o.user_id
GROUP BY u.name
HAVING SUM(o.total_amount) > 300
ORDER BY total_spent DESC;