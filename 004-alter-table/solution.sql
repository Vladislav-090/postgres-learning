CREATE TABLE users_alter (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER CHECK (age >= 0)
);

ALTER TABLE users_alter
ADD COLUMN email VARCHAR(255) UNIQUE;

ALTER TABLE users_alter
ADD COLUMN is_active BOOLEAN DEFAULT true;

INSERT INTO users_alter (name, age, email)
VALUES
('Max', 29, 'max@example.com'),
('Vlad', 15, 'vlad@example.com'),
('Viola', 30, 'viola@example.com');

SELECT * FROM users_alter
ORDER BY id ASC;

ALTER TABLE users_alter
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users_alter
ALTER COLUMN is_active SET DEFAULT false;

INSERT INTO users_alter (name, age, email)
VALUES ('Alex', 10, 'alex@example.com');

SELECT * FROM users_alter
ORDER BY id ASC;

ALTER TABLE users_alter
ADD COLUMN temporary_note TEXT;

ALTER TABLE users_alter
DROP COLUMN temporary_note;

ALTER TABLE users_alter
RENAME COLUMN name TO fullname;

SELECT * FROM users_alter
ORDER BY id ASC;

ALTER TABLE users_alter
ADD COLUMN score INTEGER DEFAULT 0;

SELECT * FROM users_alter
ORDER BY id ASC;

ALTER TABLE users_alter
ADD CONSTRAINT users_alter_check_score CHECK (score >= 0);

INSERT INTO users_alter (fullname, age, email, score)
VALUES ('Semen', 31, 'semen@example.com', 100);

SELECT * FROM users_alter
ORDER BY id ASC;