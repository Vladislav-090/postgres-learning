CREATE TABLE wallets (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
balance NUMERIC(10, 2) NOT NULL CHECK (balance >=0),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
---------------------
INSERT INTO wallets (name, balance)
VALUES
('Max', 500.99),
('Vlad', 19000.00),
('Viola', 1000.00);

SELECT * FROM wallets
ORDER BY id ASC;
----------------------
BEGIN;

UPDATE wallets 
SET balance = balance - 200
WHERE name = 'Max';

UPDATE wallets
SET balance = balance + 200
WHERE name = 'Viola';

COMMIT;
-----------------------
BEGIN;

UPDATE wallets
SET balance = balance - 100
WHERE name = 'Vlad';

UPDATE wallets
SET balance = balance + 100
WHERE name = 'Viola';

ROLLBACK;

SELECT * FROM wallets
ORDER BY id ASC;

---------------------
BEGIN;

UPDATE wallets
SET balance = balance - 1000
WHERE name = 'Max';

COMMIT;

SELECT * FROM wallets
ORDER BY id ASC;