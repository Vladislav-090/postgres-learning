SELECT 
    fk_orders.id,
    fk_users.name,
    fk_orders.total_amount,
    fk_orders.status
FROM fk_orders
JOIN fk_users ON fk_orders.user_id = fk_users.id
ORDER BY fk_orders.id ASC;


SELECT 
    fk_orders.id AS order_id,
    fk_users.name AS user_name,
    fk_users.email AS user_email,
    fk_orders.total_amount,
    fk_orders.status
FROM fk_orders
JOIN fk_users ON fk_orders.user_id = fk_users.id
ORDER BY fk_orders.id ASC;


SELECT 
    o.id AS order_id,
    u.name AS user_name,
    u.email AS user_email,
    o.total_amount,
    o.status
FROM fk_orders o
JOIN fk_users u ON o.user_id = u.id
ORDER BY o.id ASC;

SELECT 
    o.id AS order_id,
    u.name AS user_name,
    o.total_amount,
    o.status
FROM fk_orders o
JOIN fk_users u ON o.user_id = u.id
WHERE o.status = 'paid'
ORDER BY o.id ASC;

SELECT 
    o.id AS order_id,
    u.name AS user_name,
    u.email AS user_email,
    o.total_amount,
    o.status
FROM fk_orders o
JOIN fk_users u ON o.user_id = u.id
WHERE u.name = 'Max'
ORDER BY o.id ASC;


SELECT 
    o.id AS order_id,
    u.name AS user_name,
    o.total_amount,
    o.status
FROM fk_orders o 
JOIN fk_users u ON o.user_id = u.id
ORDER BY o.total_amount DESC;