# Task 005 — Foreign Key

In this task, I practiced creating relationships between PostgreSQL tables using `FOREIGN KEY`.

The goal was to understand how one table can reference another table and how PostgreSQL protects related data.

## What I practiced

* Creating related tables
* Using `PRIMARY KEY`
* Using `FOREIGN KEY`
* Using `REFERENCES`
* Creating a one-to-many relationship
* Inserting related data
* Understanding relational integrity

## Tables

I created two tables:

```text
fk_users
fk_orders
```

The relationship between them is:

```text
One user can have many orders.
One order belongs to one user.
```

## Users table

```sql
CREATE TABLE fk_users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);
```

The `fk_users` table stores users.

| Column  | Description            |
| ------- | ---------------------- |
| `id`    | Unique user identifier |
| `name`  | User name              |
| `email` | Unique user email      |

## Orders table

```sql
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
```

The `fk_orders` table stores orders.

| Column         | Description                                   |
| -------------- | --------------------------------------------- |
| `id`           | Unique order identifier                       |
| `user_id`      | Reference to a user from the `fk_users` table |
| `total_amount` | Order amount                                  |
| `status`       | Order status                                  |
| `created_at`   | Order creation timestamp                      |

## Foreign key

The most important part is:

```sql
CONSTRAINT fk_orders_user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES fk_users(id)
```

This means that `fk_orders.user_id` must reference an existing `fk_users.id`.

In simple words:

```text
fk_users.id        -> main user id
fk_orders.user_id  -> reference to user id
```

PostgreSQL will not allow creating an order for a user that does not exist.

## Insert users

```sql
INSERT INTO fk_users (name, email)
VALUES
('Max', 'max@example.com'),
('Vlad', 'vlad@example.com'),
('Viola', 'viola@example.com');
```

## Insert orders

```sql
INSERT INTO fk_orders (user_id, total_amount, status)
VALUES
(1, 150.00, 'paid'),
(1, 300.50, 'created'),
(2, 999.99, 'paid'),
(3, 50.00, 'cancelled');
```

In this example:

| user_id | Meaning                |
| ------- | ---------------------- |
| `1`     | Order belongs to Max   |
| `2`     | Order belongs to Vlad  |
| `3`     | Order belongs to Viola |

Max has two orders, Vlad has one order, and Viola has one order.

## Invalid foreign key example

This query should fail:

```sql
INSERT INTO fk_orders (user_id, total_amount, status)
VALUES (999, 100.00, 'created');
```

It fails because there is no user with `id = 999` in the `fk_users` table.

This shows that the foreign key protects the relationship between tables.

## Delete protection example

This query can also fail:

```sql
DELETE FROM fk_users
WHERE id = 1;
```

It can fail because the user with `id = 1` has related orders in the `fk_orders` table.

PostgreSQL does not allow deleting a parent row while child rows still reference it.

## Important notes

`PRIMARY KEY` uniquely identifies a row inside its own table.

`FOREIGN KEY` creates a relationship with another table.

`REFERENCES` tells PostgreSQL which table and column should be referenced.

A foreign key helps prevent broken data, for example orders without real users.

## What I learned

I learned how to create a relationship between two tables using `FOREIGN KEY`.

I also learned that PostgreSQL protects relational data by rejecting invalid references.

This is important for backend applications because real systems usually have related tables like users, orders, payments, wallets, and transactions.
