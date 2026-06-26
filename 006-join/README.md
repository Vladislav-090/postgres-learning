# Task 006 — Joins

In this task, I practiced using `JOIN` in PostgreSQL.

The goal was to understand how to combine data from two related tables.

## What I practiced

* `JOIN`
* `ON`
* Table aliases
* Column aliases with `AS`
* Filtering joined data with `WHERE`
* Sorting joined data with `ORDER BY`

## Tables

This task uses the tables from the previous foreign key task:

```text
fk_users
fk_orders
```

The relationship is:

```text
fk_users.id = fk_orders.user_id
```

This means that each order belongs to one user.

## Basic JOIN

```sql
SELECT 
    fk_orders.id,
    fk_users.name,
    fk_orders.total_amount,
    fk_orders.status
FROM fk_orders
JOIN fk_users ON fk_orders.user_id = fk_users.id
ORDER BY fk_orders.id ASC;
```

This query joins orders with users.

It returns order data together with the user name.

## Column aliases

```sql
SELECT 
    fk_orders.id AS order_id,
    fk_users.name AS user_name,
    fk_users.email AS user_email,
    fk_orders.total_amount,
    fk_orders.status
FROM fk_orders
JOIN fk_users ON fk_orders.user_id = fk_users.id
ORDER BY fk_orders.id ASC;
```

`AS` is used to rename columns in the result.

For example:

```sql
fk_orders.id AS order_id
```

means that the `id` column from `fk_orders` will be shown as `order_id`.

## Table aliases

```sql
SELECT 
    o.id AS order_id,
    u.name AS user_name,
    u.email AS user_email,
    o.total_amount,
    o.status
FROM fk_orders o
JOIN fk_users u ON o.user_id = u.id
ORDER BY o.id ASC;
```

Table aliases make queries shorter and easier to read.

In this query:

```text
fk_orders o
fk_users u
```

means:

```text
o = fk_orders
u = fk_users
```

## Filter joined data by order status

```sql
SELECT 
    o.id AS order_id,
    u.name AS user_name,
    o.total_amount,
    o.status
FROM fk_orders o
JOIN fk_users u ON o.user_id = u.id
WHERE o.status = 'paid'
ORDER BY o.id ASC;
```

This query returns only orders with status `paid`.

## Filter joined data by user name

```sql
SELECT 
    o.id AS order_id,
    u.name AS user_name,
    u.email AS user_email,
    o.total_amount,
    o.status
FROM fk_orders o
JOIN fk_users u ON o.user_id = u.id
WHERE u.name = 'Max'
ORDER BY o.id ASC;
```

This query returns only orders that belong to Max.

## Sort joined data by amount

```sql
SELECT 
    o.id AS order_id,
    u.name AS user_name,
    o.total_amount,
    o.status
FROM fk_orders o 
JOIN fk_users u ON o.user_id = u.id
ORDER BY o.total_amount DESC;
```

This query returns orders sorted by total amount from highest to lowest.

## Important notes

`JOIN` is used to combine rows from two related tables.

`ON` defines how the tables are connected.

`WHERE` filters the result.

`ORDER BY` sorts the result.

Aliases make SQL queries shorter and more readable.

## What I learned

I learned how to get related data from multiple tables.

Before this task, I could see users and orders separately.

After this task, I can combine them and show order information together with user data.

This is important for backend development because real APIs often need to return data from several related tables.
