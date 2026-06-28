# Task 008 — Transactions

In this task, I practiced PostgreSQL transactions.

The goal was to understand how to group multiple SQL commands into one safe operation using `BEGIN`, `COMMIT`, and `ROLLBACK`.

## What I practiced

* `BEGIN`
* `COMMIT`
* `ROLLBACK`
* Updating balances
* Checking transaction results
* Using `CHECK` to prevent negative balances
* Understanding failed transactions

## Table

I created a `wallets` table:

```sql
CREATE TABLE wallets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    balance NUMERIC(10, 2) NOT NULL CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

The table stores wallet balances.

| Column       | Description               |
| ------------ | ------------------------- |
| `id`         | Unique wallet identifier  |
| `name`       | Wallet owner name         |
| `balance`    | Wallet balance            |
| `created_at` | Wallet creation timestamp |

## Insert initial balances

```sql
INSERT INTO wallets (name, balance)
VALUES
('Max', 500.99),
('Vlad', 19000.00),
('Viola', 1000.00);
```

Initial balances:

```text
Max   = 500.99
Vlad  = 19000.00
Viola = 1000.00
```

## Successful transaction with COMMIT

```sql
BEGIN;

UPDATE wallets 
SET balance = balance - 200
WHERE name = 'Max';

UPDATE wallets
SET balance = balance + 200
WHERE name = 'Viola';

COMMIT;
```

This transaction transfers `200` from Max to Viola.

After `COMMIT`, the changes are saved.

Result:

```text
Max   = 300.99
Vlad  = 19000.00
Viola = 1200.00
```

## Transaction with ROLLBACK

```sql
BEGIN;

UPDATE wallets
SET balance = balance - 100
WHERE name = 'Viola';

UPDATE wallets
SET balance = balance + 100
WHERE name = 'Vlad';

ROLLBACK;
```

This transaction starts a transfer from Viola to Vlad, but then cancels it.

After `ROLLBACK`, the changes are not saved.

The balances stay the same as before the transaction.

## Failed transaction

I also tested an invalid update:

```sql
BEGIN;

UPDATE wallets
SET balance = balance - 1000
WHERE name = 'Max';
```

This query fails because Max does not have enough balance.

The table has this constraint:

```sql
CHECK (balance >= 0)
```

PostgreSQL rejects the update because the balance would become negative.

Example failed value:

```text
Max = -699.01
```

After an error inside a transaction, PostgreSQL switches the transaction into an aborted state.

The prompt changes from:

```text
postgres_learning=*#
```

to:

```text
postgres_learning=!#
```

In this state, the transaction must be rolled back.

```sql
ROLLBACK;
```

## Important notes

`BEGIN` starts a transaction.

`COMMIT` saves all changes inside the transaction.

`ROLLBACK` cancels all changes inside the transaction.

If one command inside a transaction fails, the transaction should be rolled back.

Transactions are important when several database changes must happen together.

## Why transactions are important

Transactions are very important for backend development.

For example, a money transfer should not be partially completed.

If money is removed from one wallet, it must also be added to another wallet.

If something goes wrong, the whole operation should be cancelled.

## What I learned

I learned how to use transactions in PostgreSQL.

I practiced successful transactions with `COMMIT`, cancelled transactions with `ROLLBACK`, and failed transactions caused by a `CHECK` constraint.

This is important for real backend systems that work with balances, payments, orders, wallets, and financial operations.
