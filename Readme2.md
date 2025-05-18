# **`📘 PostgreSQL Learning Notes (VS Code Based)`**

A clean, organized, and beginner-friendly summary of PostgreSQL core concepts using the **PostgreSQL VS Code extension**.

---

## 🧩 Setup in VS Code

1. Install the **PostgreSQL** extension by **Database Client**.
2. Connect to your PostgreSQL server.
3. Open `.sql` files, run queries directly, or use the graphical browser for databases.

---

## ⚖️ ALTER TABLE

```sql
-- Rename a table
ALTER TABLE old_table_name RENAME TO new_table_name;

-- Add a column
ALTER TABLE person2 ADD COLUMN email VARCHAR(50) DEFAULT 'default@mail.com' NOT NULL;

-- Drop a column
ALTER TABLE person2 DROP COLUMN email;

-- Rename a column
ALTER TABLE person2 RENAME COLUMN age TO user_age;

-- Change column type
ALTER TABLE person2 ALTER COLUMN user_name TYPE VARCHAR(50);

-- Set/DROP NOT NULL
ALTER TABLE person2 ALTER COLUMN user_age SET NOT NULL;
ALTER TABLE person2 ALTER COLUMN user_age DROP NOT NULL;

-- Add constraint (UNIQUE)
ALTER TABLE person2 ADD CONSTRAINT UNIQUE_person2_user_age UNIQUE(user_age);

-- Drop constraint
ALTER TABLE person2 DROP CONSTRAINT UNIQUE_person2_user_age;
```

---

## 🗑️ Table Deletion & Reset

```sql
-- Empty the table
TRUNCATE TABLE person2;

-- Delete table
DROP TABLE person2;
```

---

## 🤔 Table & Sample Data

```sql
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  age INT,
  grade CHAR(2),
  course VARCHAR(50),
  email VARCHAR(100),
  dob DATE,
  blood_group VARCHAR(5),
  country VARCHAR(50)
);

-- Sample INSERT (insert at least 20 rows)
INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES (...);
```

---

## 🧪 Scalar vs Aggregate Functions

### ✅ Scalar Functions

Operate per row:

```sql
SELECT UPPER(first_name), LENGTH(first_name), CONCAT(first_name, ' ', last_name) FROM students;
```

### ✅ Aggregate Functions

Summarize many rows:

```sql
SELECT AVG(age), MAX(age), MIN(age), SUM(age), COUNT(*) FROM students;
```

---

## 🔍 SELECT Basics

```sql
SELECT * FROM students;
SELECT first_name, age FROM students;
SELECT email AS "Student Email" FROM students;
SELECT DISTINCT country FROM students;
```

---

## ⚠️ Filtering with WHERE

```sql
-- Equality / Inequality
SELECT * FROM students WHERE country = 'Canada';
SELECT * FROM students WHERE age != 20;

-- AND, OR, NOT
SELECT * FROM students WHERE grade = 'A' AND course = 'Physics';
SELECT * FROM students WHERE NOT country = 'USA';

-- NULL checks
SELECT * FROM students WHERE email IS NOT NULL;
SELECT COALESCE(email, 'N/A') FROM students;
```

---

## 🔄 Advanced Filters

```sql
-- IN / NOT IN
SELECT * FROM students WHERE country IN ('USA', 'UK');
SELECT * FROM students WHERE country NOT IN ('USA', 'UK');

-- BETWEEN
SELECT * FROM students WHERE age BETWEEN 19 AND 20;
SELECT * FROM students WHERE dob BETWEEN '2000-01-01' AND '2005-01-01';

-- LIKE / ILIKE
SELECT * FROM students WHERE first_name LIKE 'A%';
SELECT * FROM students WHERE first_name ILIKE 'a%';

-- Complex example
SELECT * FROM students WHERE (country = 'USA' OR country = 'Australia') AND age = 20;
```

---

## 🔄 ORDER BY + Pagination

```sql
-- Sort
SELECT * FROM students ORDER BY first_name ASC;
SELECT * FROM students ORDER BY dob DESC;

-- Pagination
SELECT * FROM students LIMIT 5;
SELECT * FROM students LIMIT 5 OFFSET 5;
```

---

## 🔄 UPDATE & DELETE

```sql
-- Update rows
UPDATE students
SET email = 'default@mail.com', age = 30
WHERE student_id = 50;

-- Delete rows
DELETE FROM students WHERE grade = 'C';
DELETE FROM students; -- Caution!
```

---

## 📓 Notes

- `NULL` is never equal to anything, not even another `NULL`.
- Scalar = per row; Aggregate = all rows.
- Use `LIMIT` + `OFFSET` for pagination in real-world apps.
- Always backup before `DELETE` or `DROP` operations.

---

Happy Learning PostgreSQL! 🌟
