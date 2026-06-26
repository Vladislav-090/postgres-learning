CREATE TABLE fk_users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE fk_orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL CHECK (total_amount >= 0),
    status VARCHAR(30) DEFAULT 'created',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_user_id_fk
        FOREIGN KEY (user_id)
        REFERENCES fk_users(id)
);

INSERT INTO fk_users (name, email)
VALUES
('Max', 'max@example.com'),
('Vlad', 'vlad@example.com'),
('Viola', 'viola@example.com');

SELECT * FROM fk_users
ORDER BY id ASC;

INSERT INTO fk_orders (user_id, total_amount, status)
VALUES
(1, 150.00, 'paid'),
(1, 300.50, 'created'),
(2, 999.99, 'paid'),
(3, 50.00, 'cancelled');

SELECT * FROM fk_orders
ORDER BY id ASC;