CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    email VARCHAR(255) UNIQUE,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, age, email)
VALUES
('Max', 29, 'max092_@mail.ru'),
('Vlad', 30, 'pastukhov013@gmail.com'),
('Viola', 15, 'viola08_08@mail.ru');


SELECT *FROM users;


SELECT name, age FROM users;


SELECT *FROM users
WHERE age > 23 ;

SELECT *FROM users
ORDER BY age DESC;