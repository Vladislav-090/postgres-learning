SELECT * FROM users;

UPDATE users
SET age = 30
WHERE id = 1;

SELECT * FROM users;

UPDATE users
SET 
    age = 31,
    is_active = false
WHERE id = 2;

SELECT * FROM users;

UPDATE users
SET is_active = false
WHERE is_active = true;

SELECT * FROM users;

DELETE FROM users
WHERE id = 1;

SELECT * FROM users;