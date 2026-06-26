# Task 001 — Users Basics

In this task, I created a simple `users` table in PostgreSQL and practiced basic SQL queries.

The goal of this task was to understand how to create a table, insert data, read data, filter rows, and sort query results.

## What I practiced

* Connecting to PostgreSQL through the terminal
* Creating a database for learning
* Creating a table with `CREATE TABLE`
* Using `SERIAL PRIMARY KEY`
* Using basic PostgreSQL data types
* Adding rows with `INSERT INTO`
* Reading data with `SELECT`
* Selecting specific columns
* Filtering rows with `WHERE`
* Sorting rows with `ORDER BY`

## Database

For this task, I used a local PostgreSQL database:

```text
Database: postgres_learning
Host: localhost
Port: 5432
User: postgres
```

## Table structure

The table name is `users`.

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    email VARCHAR(255) UNIQUE,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Columns

| Column       | Type                                  | Description                                                             |
| ------------ | ------------------------------------- | ----------------------------------------------------------------------- |
| `id`         | `SERIAL PRIMARY KEY`                  | Unique user identifier. PostgreSQL automatically increments this value. |
| `name`       | `VARCHAR(100) NOT NULL`               | User name. This field is required.                                      |
| `age`        | `INTEGER`                             | User age.                                                               |
| `email`      | `VARCHAR(255) UNIQUE`                 | User email. Each email must be unique.                                  |
| `is_active`  | `BOOLEAN DEFAULT true`                | User activity status. Default value is `true`.                          |
| `created_at` | `TIMESTAMP DEFAULT CURRENT_TIMESTAMP` | Timestamp when the row was created.                                     |

## Insert data

I inserted three users into the table:

```sql
INSERT INTO users (name, age, email)
VALUES
('Max', 29, 'max@example.com'),
('Vlad', 30, 'vlad@example.com'),
('Viola', 15, 'viola@example.com');
```

## Select all users

```sql
SELECT * FROM users;
```

This query returns all columns from the `users` table.

## Select specific columns

```sql
SELECT name, age FROM users;
```

This query returns only the `name` and `age` columns.

## Filter users by age

```sql
SELECT * FROM users
WHERE age > 20;
```

This query returns only users whose age is greater than `20`.

## Sort users by age

```sql
SELECT * FROM users
ORDER BY age DESC;
```

This query returns all users sorted by age from highest to lowest.

## Important note

The `SELECT` statement must specify what columns should be returned.

Correct examples:

```sql
SELECT * FROM users;
```

```sql
SELECT name, age FROM users;
```

Incorrect example:

```sql
SELECT FROM users;
```

This query does not specify which columns should be returned.

## Useful psql commands

```sql
\l
```

Show all databases.

```sql
\c postgres_learning
```

Connect to the `postgres_learning` database.

```sql
\dt
```

Show all tables in the current database.

```sql
\d users
```

Show the structure of the `users` table.

```sql
\q
```

Exit from PostgreSQL.

## What I learned

I learned how to create a basic PostgreSQL table, insert data into it, and retrieve data using simple SQL queries.

I also learned that PostgreSQL tables are created inside the database, not inside the project folder. To save my work in GitHub, I need to store SQL commands in a `.sql` file and document the task in a `README.md` file.
