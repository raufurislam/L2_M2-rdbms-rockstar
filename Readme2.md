# PostgreSQL Module 9 Summary (Time, Grouping, Keys, Joins)

This document summarizes the key SQL concepts practiced in PostgreSQL Module 9. The examples and patterns covered here are essential for mastering SQL operations related to time handling, grouping data, foreign key constraints, and performing joins between tables. These concepts are critical for real-world database management and analytics tasks.

---

## 9.1 Date & Time Functions

### ✅ Show current timezone and timestamp

```sql
SHOW timezone;
SELECT now();
```

### ✅ Create table with timestamps

```sql
CREATE TABLE timez (
  ts TIMESTAMP WITHOUT TIME ZONE,
  tsz TIMESTAMP WITH TIME ZONE
);
INSERT INTO timez VALUES ('2024-01-12 10:45:00', '2024-01-12 10:45:00');
```

### ✅ Date operations

```sql
SELECT CURRENT_DATE;
SELECT now()::DATE;
SELECT to_char(now(), 'dd/mm/yyyy'); -- format
SELECT to_char(now(), 'DDD'); -- day of year
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';
```

### ✅ Age calculation

```sql
SELECT age(CURRENT_DATE, '2000-07-13');
SELECT age(CURRENT_DATE, '1999-08-03');
```

### ✅ Extract and type casting

```sql
SELECT extract(YEAR FROM '2000-07-13'::DATE);
SELECT 1::BOOLEAN;      -- true
SELECT 'n'::BOOLEAN;    -- false
```

---

## 9.2 GROUP BY & Aggregation

### ✅ Basic group by

```sql
SELECT country FROM students GROUP BY country;
SELECT country, COUNT(*), AVG(age) FROM students GROUP BY country;
```

### ✅ HAVING to filter groups

```sql
SELECT country, AVG(age) FROM students GROUP BY country HAVING AVG(age) > 22;
```

### ✅ Group by expression (year of birth)

```sql
SELECT EXTRACT(YEAR FROM dob) AS birth_year, COUNT(*) FROM students GROUP BY birth_year;
```

---

## 9.3 Foreign Key Constraint (User & Post Example)

### ✅ Create tables with FK and constraints

```sql
CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  username VARCHAR(25) NOT NULL
);

CREATE TABLE post (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  user_id INTEGER REFERENCES "user"(id) ON DELETE SET DEFAULT DEFAULT 2
);

ALTER TABLE post ALTER COLUMN user_id SET NOT NULL;
```

### ✅ Insert data with FK

```sql
INSERT INTO "user" (username) VALUES ('akash'), ('batash'), ('sagor'), ('nodi');
INSERT INTO post (title, user_id) VALUES ('Example Title', 1);
```

### ✅ FK behavior with invalid and null insertions

```sql
-- Invalid FK reference
INSERT INTO post (title, user_id) VALUES ('test', 8); -- Error

-- Valid insert
INSERT INTO post (title, user_id) VALUES ('test2', 3);

-- Null insert (not allowed if NOT NULL)
INSERT INTO post (title, user_id) VALUES ('test3', NULL); -- Error if NOT NULL
```

### ✅ FK Deletion Behaviors

- `ON DELETE RESTRICT` – prevent delete if referenced
- `ON DELETE CASCADE` – delete all referencing
- `ON DELETE SET NULL` – set user_id NULL in `post`
- `ON DELETE SET DEFAULT` – set to default (e.g. 2)

```sql
DELETE FROM "user" WHERE id = 4; -- if ON DELETE SET DEFAULT, posts updated
```

---

## 9.6-9.8 SQL Joins

### ✅ INNER JOIN

```sql
SELECT title, username FROM post JOIN "user" ON post.user_id = "user".id;
SELECT * FROM post p JOIN "user" u ON p.user_id = u.id;
```

### ✅ LEFT JOIN

```sql
SELECT * FROM post AS p LEFT JOIN "user" AS u ON p.user_id = u.id;
```

### ✅ RIGHT JOIN

```sql
SELECT * FROM post AS p RIGHT OUTER JOIN "user" AS u ON p.user_id = u.id;
```

### ✅ FULL JOIN

```sql
SELECT * FROM post AS p FULL OUTER JOIN "user" AS u ON p.user_id = u.id;
```

### ✅ USING clause (if same column name)

```sql
SELECT * FROM employees JOIN departments USING(department_id);
```

---

## ✅ Summary

This module taught essential SQL patterns:

- How to handle timestamps and format/display them
- How to group and aggregate data
- How to use HAVING for filtering grouped results
- How to create and use foreign keys with constraint options
- How to perform different types of JOINs for combining relational data

> Mastering these queries builds a strong foundation for real-world database applications and backend systems.

---
