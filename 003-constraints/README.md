# Task 003 — Constraints

In this task, I practiced PostgreSQL constraints.

The goal of this task was to understand how a database can protect data using rules like `NOT NULL`, `UNIQUE`, `DEFAULT`, `CHECK`, and `PRIMARY KEY`.

## What I practiced

* Creating a table with constraints
* Using `PRIMARY KEY`
* Using `NOT NULL`
* Using `UNIQUE`
* Using `DEFAULT`
* Using `CHECK`
* Testing constraint errors
* Renaming a table with `ALTER TABLE`
* Understanding that renaming a table does not change its columns

## Database

For this task, I used the local PostgreSQL database:

```text
Database: postgres_learning
Table: users_constraints
```

## Table structure

```sql
CREATE TABLE users_constraints (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 0),
    status VARCHAR(20) DEFAULT 'active',
    balance NUMERIC(10, 2) DEFAULT 0 CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Columns

| Column       | Type             | Constraint                       | Description                                                             |
| ------------ | ---------------- | -------------------------------- | ----------------------------------------------------------------------- |
| `id`         | `SERIAL`         | `PRIMARY KEY`                    | Unique user identifier. PostgreSQL automatically increments this value. |
| `name`       | `VARCHAR(100)`   | `NOT NULL`                       | User name. This field is required.                                      |
| `email`      | `VARCHAR(255)`   | `UNIQUE NOT NULL`                | User email. It must be unique and cannot be empty.                      |
| `age`        | `INTEGER`        | `CHECK (age >= 0)`               | User age. It cannot be negative.                                        |
| `status`     | `VARCHAR(20)`    | `DEFAULT 'active'`               | User status. Default value is `active`.                                 |
| `balance`    | `NUMERIC(10, 2)` | `DEFAULT 0 CHECK (balance >= 0)` | User balance. It cannot be negative.                                    |
| `created_at` | `TIMESTAMP`      | `DEFAULT CURRENT_TIMESTAMP`      | Timestamp when the row was created.                                     |

## Insert valid data

```sql
INSERT INTO users_constraints (name, email, age, balance)
VALUES
('Max', 'max@example.com', 30, 100.50),
('Vlad', 'vlad@example.com', 31, 250.00),
('Viola', 'viola@example.com', 15, 0);
```

This query inserts valid users into the table.

## Check inserted data

```sql
SELECT * FROM users_constraints
ORDER BY id ASC;
```

I used `ORDER BY id ASC` to display rows in a predictable order.

## Testing DEFAULT values

```sql
INSERT INTO users_constraints (name, email, age)
VALUES ('Alex', 'alex@example.com', 25);
```

In this query, I did not provide values for:

* `status`
* `balance`
* `created_at`

PostgreSQL automatically used default values:

* `status = active`
* `balance = 0`
* `created_at = current timestamp`

## Testing NOT NULL constraint

```sql
INSERT INTO users_constraints (email, age)
VALUES ('noname@example.com', 20);
```

This query should fail because the `name` column has a `NOT NULL` constraint.

The database does not allow inserting a user without a name.

## Testing UNIQUE constraint

```sql
INSERT INTO users_constraints (name, email, age)
VALUES ('Another Max', 'max@example.com', 40);
```

This query should fail because `max@example.com` already exists in the table.

The `email` column has a `UNIQUE` constraint.

## Testing CHECK constraint for age

```sql
INSERT INTO users_constraints (name, email, age)
VALUES ('Bad Age', 'badage@example.com', -5);
```

This query should fail because the `age` column has a `CHECK (age >= 0)` constraint.

The database does not allow negative age values.

## Testing CHECK constraint for balance

```sql
INSERT INTO users_constraints (name, email, age, balance)
VALUES ('Bad Balance', 'badbalance@example.com', 22, -100);
```

This query should fail because the `balance` column has a `CHECK (balance >= 0)` constraint.

The database does not allow negative balance values.

## Important note about ALTER TABLE

I also practiced renaming a table:

```sql
ALTER TABLE users_constrains
RENAME TO users_constraints;
```

This command changes only the table name.

It does not change the table structure or add missing columns.

If a table was created without the `email` column, renaming the table will not add the `email` column.

## What I learned

I learned that constraints are rules that protect data at the database level.

Even if an application sends incorrect data, PostgreSQL can reject it using constraints.

I also learned that:

* `NOT NULL` requires a value
* `UNIQUE` prevents duplicate values
* `DEFAULT` sets an automatic value
* `CHECK` validates values before saving them
* `PRIMARY KEY` uniquely identifies each row
* `ALTER TABLE ... RENAME TO ...` renames a table but does not change its columns

This task helped me understand why database constraints are important for real backend applications.
