# Task 007 — Aggregation

In this task, I practiced aggregation queries in PostgreSQL.

The goal was to understand how to calculate totals, averages, minimums, maximums, counts, and grouped results using SQL.

## What I practiced

* `COUNT`
* `SUM`
* `AVG`
* `MIN`
* `MAX`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* Aggregation with `JOIN`

## Tables

This task uses the existing tables from previous tasks:

```text
fk_users
fk_orders
```

The relationship is:

```text
fk_users.id = fk_orders.user_id
```

This means that each order belongs to one user.

## Count all orders

```sql
SELECT COUNT(*) AS total_orders
FROM fk_orders;
```

This query counts all rows in the `fk_orders` table.

## Sum all order amounts

```sql
SELECT SUM(total_amount) AS total_revenue
FROM fk_orders;
```

This query calculates the total amount of all orders.

## Average order amount

```sql
SELECT AVG(total_amount) AS average_order_amount
FROM fk_orders;
```

This query calculates the average order amount.

## Minimum and maximum order amount

```sql
SELECT
    MAX(total_amount) AS max_order_amount,
    MIN(total_amount) AS min_order_amount
FROM fk_orders;
```

This query returns the highest and lowest order amount.

## Count orders by user

```sql
SELECT
    user_id,
    COUNT(*) AS orders_count
FROM fk_orders
GROUP BY user_id
ORDER BY user_id ASC;
```

This query groups orders by `user_id` and counts how many orders each user has.

## Sum orders by user

```sql
SELECT
    user_id,
    SUM(total_amount) AS total_spent
FROM fk_orders
GROUP BY user_id
ORDER BY user_id ASC;
```

This query groups orders by `user_id` and calculates how much each user spent.

## Aggregation with JOIN

```sql
SELECT
    u.name AS user_name,
    COUNT(o.id) AS orders_count,
    SUM(o.total_amount) AS total_spent
FROM fk_users u
JOIN fk_orders o ON u.id = o.user_id
GROUP BY u.name
ORDER BY total_spent DESC;
```

This query joins users with orders, groups the result by user name, counts the number of orders, and calculates the total amount spent by each user.

## Count orders by status

```sql
SELECT 
    status,
    COUNT(*) AS orders_count
FROM fk_orders
GROUP BY status
ORDER BY orders_count DESC;
```

This query groups orders by status and counts how many orders exist in each status.

## HAVING

```sql
SELECT 
    user_id,
    SUM(total_amount) AS total_spent
FROM fk_orders
GROUP BY user_id
HAVING SUM(total_amount) > 300
ORDER BY total_spent DESC;
```

`HAVING` is used to filter grouped results.

In this query, PostgreSQL first groups orders by `user_id`, then calculates the total amount for each user, and only keeps users whose total amount is greater than `300`.

## JOIN with HAVING

```sql
SELECT 
    u.name AS user_name,
    COUNT(o.id) AS orders_count,
    SUM(o.total_amount) AS total_spent
FROM fk_users u
JOIN fk_orders o ON u.id = o.user_id
GROUP BY u.name
HAVING SUM(o.total_amount) > 300
ORDER BY total_spent DESC;
```

This query returns users whose total order amount is greater than `300`.

It also shows the user name, number of orders, and total spent amount.

## Important notes

`COUNT` counts rows.

`SUM` calculates the total value.

`AVG` calculates the average value.

`MIN` returns the smallest value.

`MAX` returns the largest value.

`GROUP BY` groups rows before aggregation.

`HAVING` filters groups after aggregation.

`WHERE` filters rows before grouping.

`ORDER BY` sorts the final result.

## What I learned

I learned how to use aggregation functions to analyze data in PostgreSQL.

I also learned how to group orders by user or status and how to combine aggregation with `JOIN`.

This is important for backend development because real applications often need statistics, reports, balances, totals, and user activity summaries.
