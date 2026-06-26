# Task 002 — Update and Delete

In this task, I practiced updating and deleting rows in a PostgreSQL table.

The goal of this task was to understand how to safely change and remove data using `UPDATE`, `SET`, `DELETE`, and `WHERE`.

## What I practiced

* Updating one row by `id`
* Updating one column
* Updating multiple columns in one query
* Updating multiple rows by condition
* Deleting one row by `id`
* Checking results with `SELECT`
* Understanding why `WHERE` is important

## Database

For this task, I used the existing `users` table from the `postgres_learning` database.

```text
Database: postgres_learning
Table: users
```

## Initial table

Before this task, the `users` table contained three users:

```text
id | name  | age | email             | is_active
---+-------+-----+-------------------+----------
1  | Max   | 29  | max@example.com   | true
2  | Vlad  | 30  | vlad@example.com  | true
3  | Viola | 15  | viola@example.com | true
```

## Update one user by id

```sql
UPDATE users
SET age = 30
WHERE id = 1;
```

This query updates the `age` value for the user with `id = 1`.

In this case, Max's age was changed from `29` to `30`.

## Update multiple columns

```sql
UPDATE users
SET 
    age = 31,
    is_active = false
WHERE id = 2;
```

This query updates two columns at the same time:

* `age`
* `is_active`

In this case, Vlad's age was changed to `31`, and his `is_active` status was changed to `false`.

## Important syntax note

When updating multiple columns, `SET` is written only once.

Correct example:

```sql
UPDATE users
SET 
    age = 31,
    is_active = false
WHERE id = 2;
```

Incorrect example:

```sql
UPDATE users
SET age = 31
SET is_active = false
WHERE id = 2;
```

The second example is incorrect because `SET` cannot be repeated inside one `UPDATE` query.

## Update rows by condition

```sql
UPDATE users
SET is_active = false
WHERE is_active = true;
```

This query updates all users where `is_active` is `true`.

In this task, it changed all remaining active users to inactive.

## Delete one row

```sql
DELETE FROM users
WHERE id = 1;
```

This query deletes the user with `id = 1`.

In this task, Max was deleted from the table.

## Final table

After all updates and delete operation, the table contained two users:

```text
id | name  | age | email             | is_active
---+-------+-----+-------------------+----------
2  | Vlad  | 31  | vlad@example.com  | false
3  | Viola | 15  | viola@example.com | false
```

## Important note about WHERE

`WHERE` is very important when using `UPDATE` and `DELETE`.

Without `WHERE`, PostgreSQL applies the command to all rows in the table.

Dangerous example:

```sql
UPDATE users
SET age = 100;
```

This updates the age for every user.

Dangerous example:

```sql
DELETE FROM users;
```

This deletes all rows from the table.

## Important note about row order

A simple query like this:

```sql
SELECT * FROM users;
```

does not guarantee the order of rows.

If I want to see rows in a specific order, I should use `ORDER BY`.

Example:

```sql
SELECT * FROM users
ORDER BY id ASC;
```

## What I learned

I learned how to update and delete data in PostgreSQL.

I also learned that `UPDATE` uses one `SET` keyword, and multiple columns are updated using commas.

Most importantly, I learned that `UPDATE` and `DELETE` should usually be used with a clear `WHERE` condition to avoid changing or deleting all rows by mistake.
