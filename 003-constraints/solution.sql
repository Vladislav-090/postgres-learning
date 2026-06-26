CREATE TABLE users_constraints (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 0),
    status VARCHAR(20) DEFAULT 'active',
    balance NUMERIC(10, 2) DEFAULT 0 CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users_constraints (name, email, age, balance)
VALUES
('Max', 'max@example.com', 30, 100.50),
('Vlad', 'vlad@example.com', 31, 250.00),
('Viola', 'viola@example.com', 15, 0);

SELECT * FROM users_constraints
ORDER BY id ASC;

INSERT INTO users_constraints (name, email, age)
VALUES ('Alex', 'alex@example.com', 25);

SELECT * FROM users_constraints
ORDER BY id ASC;

INSERT INTO users_constraints (email, age)
VALUES ('noname@example.com', 20);

INSERT INTO users_constraints (name, email, age)
VALUES ('Another Max', 'max@example.com', 40);

INSERT INTO users_constraints (name, email, age)
VALUES ('Bad Age', 'badage@example.com', -5);

INSERT INTO users_constraints (name, email, age, balance)
VALUES ('Bad Balance', 'badbalance@example.com', 22, -100);