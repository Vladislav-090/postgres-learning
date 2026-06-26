# Task 004 — Alter Table

In this task, I practiced modifying an existing PostgreSQL table using `ALTER TABLE`.

The goal was to understand how to add new columns, change default values, rename columns, drop columns, and add constraints to an existing table.

## What I practiced

* `ALTER TABLE`
* `ADD COLUMN`
* `DROP COLUMN`
* `RENAME COLUMN`
* `ALTER COLUMN SET DEFAULT`
* `ADD CONSTRAINT`
* `CHECK`
* `UNIQUE`
* `DEFAULT`

## Initial table

I started with a simple `users_alter` table:

```sql
CREATE TABLE users_alter (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER CHECK (age >= 0)
);
```

The table had three columns:

| Column | Description                  |
| ------ | ---------------------------- |
| `id`   | Unique user identifier       |
| `name` | User name                    |
| `age`  | User age, cannot be negative |

## Add new columns

I added an `email` column:

```sql
ALTER TABLE users_alter
ADD COLUMN email VARCHAR(255) UNIQUE;
```

Then I added an `is_active` column with a default value:

```sql
ALTER TABLE users_alter
ADD COLUMN is_active BOOLEAN DEFAULT true;
```

After that, I inserted several users:

```sql
INSERT INTO users_alter (name, age, email)
VALUES
('Max', 29, 'max@example.com'),
('Vlad', 15, 'vlad@example.com'),
('Viola', 30, 'viola@example.com');
```

## Add created_at column

I added a `created_at` column:

```sql
ALTER TABLE users_alter
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
```

This column automatically stores the current timestamp when a row is created.

## Change default value

I changed the default value of `is_active`:

```sql
ALTER TABLE users_alter
ALTER COLUMN is_active SET DEFAULT false;
```

After this change, new users receive `false` as the default value for `is_active`.

Existing rows keep their previous values.

## Add and drop a temporary column

I added a temporary column:

```sql
ALTER TABLE users_alter
ADD COLUMN temporary_note TEXT;
```

Then I removed it:

```sql
ALTER TABLE users_alter
DROP COLUMN temporary_note;
```

## Rename a column

I renamed the `name` column to `fullname`:

```sql
ALTER TABLE users_alter
RENAME COLUMN name TO fullname;
```

After renaming, the old column name `name` no longer exists.

Correct:

```sql
SELECT fullname FROM users_alter;
```

Incorrect:

```sql
SELECT name FROM users_alter;
```

## Add score column

I added a `score` column:

```sql
ALTER TABLE users_alter
ADD COLUMN score INTEGER DEFAULT 0;
```

Existing rows received the default value `0`.

## Add constraint

I added a check constraint for the `score` column:

```sql
ALTER TABLE users_alter
ADD CONSTRAINT users_alter_check_score CHECK (score >= 0);
```

This constraint prevents negative score values.

## Constraint test

I tested the constraint with an invalid insert:

```sql
INSERT INTO users_alter (fullname, age, email, score)
VALUES ('Bad Score', 20, 'badscore@example.com', -10);
```

PostgreSQL rejected this row because `score` cannot be negative.

Then I inserted a valid user:

```sql
INSERT INTO users_alter (fullname, age, email, score)
VALUES ('Semen', 31, 'semen@example.com', 100);
```

## Important notes

`ALTER TABLE` is used when a table already exists and needs to be changed.

`ADD COLUMN` adds a new column.

`DROP COLUMN` removes a column.

`RENAME COLUMN` changes a column name.

`ALTER COLUMN SET DEFAULT` changes the default value for future rows.

`ADD CONSTRAINT` adds a new rule to an existing table.

A failed `INSERT` can still consume a value from a sequence. Because of this, `id` values may have gaps. This is normal.

## What I learned

I learned how to modify an existing PostgreSQL table.

I practiced adding columns, deleting columns, renaming columns, changing default values, and adding constraints.

I also understood that constraints help protect data at the database level.
