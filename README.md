# **`🐘 PostgreSQL CLI Guide (Beginner to Intermediate)`**

A clean and complete guide for developers managing PostgreSQL via terminal. Ideal for full-stack devs working with databases, roles, table structures, and permissions in local dev environments.

---

## 🧠 Essential psql Meta-Commands (inside the psql shell)

| Command             | Description                                  |
| ------------------- | -------------------------------------------- |
| `select version();` | Show PostgreSQL version                      |
| `\l`                | List all databases                           |
| `\c <db_name>`      | Connect/switch to a database                 |
| `\dt`               | List all tables in current schema            |
| `\d <table_name>`   | Describe structure of a table                |
| `\d+ <table_name>`  | Describe with detailed info                  |
| `\dn`               | List available schemas                       |
| `\du`               | List all roles/users                         |
| `\conninfo`         | Show current user and connection info        |
| `\! cls`            | Clear terminal screen (on Windows)           |
| `\q`                | Quit psql shell                              |
| `\?`                | Help for meta-commands                       |
| `\h <command>`      | Help on SQL syntax (e.g., `\h CREATE TABLE`) |

---

## 🔧 Setup for Using psql in Any Terminal

1. **Set Environment Variable for PostgreSQL CLI**

   Add the PostgreSQL binary path to system environment variables:

   ```
   C:\Program Files\PostgreSQL\17\bin
   ```

2. **Launch from any terminal:**

   ```bash
   psql -U postgres
   ```

3. **Connect to specific database:**

   ```bash
   psql -U postgres -d mydb
   ```

---

## 🗃️ Database Management

| Task            | Command                                  |
| --------------- | ---------------------------------------- |
| Create database | `CREATE DATABASE mydb;`                  |
| Rename database | `ALTER DATABASE test RENAME TO newname;` |
| Delete database | `DROP DATABASE mydb;`                    |
| Connect to DB   | `\c mydb` or `psql -U user -d mydb`      |

### 🔗 Full Syntax for Creating a Database:

```sql
CREATE DATABASE dbname
  WITH
  OWNER = user_name
  TEMPLATE = template
  ENCODING = 'UTF8'
  LOCALE = 'en_US.UTF-8'
  LC_COLLATE = 'en_US.UTF-8'
  LC_CTYPE = 'en_US.UTF-8'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;
```

📖 [Full CREATE DATABASE options](https://www.postgresql.org/docs/current/sql-createdatabase.html)

---

## 👤 User and Role Management

| Task                      | Command                                                     |
| ------------------------- | ----------------------------------------------------------- |
| List roles/users          | `\du`                                                       |
| Create user               | `CREATE USER user1;`                                        |
| Create user with password | `CREATE USER user1 WITH LOGIN ENCRYPTED PASSWORD '123456';` |
| Create role with login    | `CREATE ROLE role1 WITH LOGIN ENCRYPTED PASSWORD '123456';` |
| Switch users              | `psql -U user1 -d postgres`                                 |

✅ Tip: Roles are groups of permissions. Assign them to users to organize access control better.

---

## 📑 Table Operations

| Task            | Command                                          |
| --------------- | ------------------------------------------------ |
| Create table    | `CREATE TABLE test_table (name VARCHAR(50));`    |
| Show all tables | `\dt`                                            |
| Describe table  | `\d test_table`                                  |
| Insert data     | `INSERT INTO test_table(name) VALUES ('Alice');` |
| View data       | `SELECT * FROM test_table;`                      |

---

## 🔐 Permissions & Access Control

If you encounter:

```
ERROR: permission denied for table test_table
```

This means the current user doesn’t have permission.

### ✅ Granting Access

| Task                                        | Command                                                         |
| ------------------------------------------- | --------------------------------------------------------------- |
| Full access to user                         | `GRANT ALL PRIVILEGES ON TABLE test_table TO user1;`            |
| Read-only access                            | `GRANT SELECT ON TABLE test_table TO user2;`                    |
| Revoke access                               | `REVOKE SELECT ON TABLE test_table FROM user2;`                 |
| Access all tables in schema (best practice) | `GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO user2;` |
| Assign role to user                         | `GRANT role1 TO user3;`                                         |
| Role can read all schema tables             | `GRANT SELECT ON ALL TABLES IN SCHEMA public TO role1;`         |

---

## 🧪 Practice Example (Quick Recap)

```sql
-- Create database
CREATE DATABASE testdb;

-- Create user
CREATE USER user1 WITH LOGIN ENCRYPTED PASSWORD '123456';

-- Connect as user
psql -U user1 -d testdb

-- Admin creates table
CREATE TABLE test_table (name VARCHAR(50));

-- Grant permission
GRANT ALL PRIVILEGES ON TABLE test_table TO user1;

-- Insert and view
INSERT INTO test_table(name) VALUES ('John Doe');
SELECT * FROM test_table;
```

---

## ⚠️ Additional Developer Tips

- Use `template0` only when you need a "clean" database with no locale or extensions.
- Avoid using `GRANT ALL ON ALL TABLES` broadly in production—be specific.
- Always check your current user and database with `\conninfo`.
- Use meaningful user/role names like `readonly_user`, `editor_user`, `analytics_role`.

---

# **`PostgreSQL GUI Tools: pgAdmin & Valentina Studio Guide`**

This summarizes current learning and experience with graphical tools for PostgreSQL primarily **pgAdmin 4** and **Valentina Studio** and adds relevant foundational knowledge for efficient database management.

---

## 📌 pgAdmin 4 – GUI for PostgreSQL

pgAdmin 4 is the official web-based administration tool for PostgreSQL.

### 🔹 Basic Structure

```
Servers
└── PostgreSQL
    ├── Databases
    │   └── [Your Database]
    │       ├── Schemas
    │       │   └── public
    │       │       ├── Tables
    │       │       ├── Views
    │       │       ├── Functions
    │       │       ├── Sequences
    │       │       └── Types
    │       ├── Extensions
    │       └── Event Triggers
    └── Login/Group Roles (Users & Permissions)

```

### 🔹 Key Features

- **Visual Navigation**: Easily browse servers, databases, schemas, tables.
- **Login/Group Roles**: Manage users and permissions.
- **Query Tool**: Execute SQL queries interactively.
- **Dashboard & Stats**: Monitor database performance and activity.

### 🔹 User Management (GUI Alternative to CLI)

1. Navigate to `Login/Group Roles`
2. Create or edit a user
3. Go to **Privileges tab** to assign table-level, schema-level, or global permissions.

> 📝 Equivalent of `CREATE USER`, `GRANT`, `REVOKE`, etc., from the command line.

---

## 📌 Valentina Studio – Modern Multi-DB GUI (PostgreSQL, MySQL, etc.)

Valentina Studio is a modern GUI tool that works with multiple databases including PostgreSQL.

### 🔹 Getting Started

- **Open SQL Editor**: For running SQL commands (like `psql` terminal)
- **Schema Editor**: Visually create/edit tables, fields, and constraints

### 🔹 Creating Database

```sql
CREATE DATABASE ph;
```

### 🔹 Creating a Table

```sql
CREATE TABLE person (
  person_id SERIAL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INTEGER,
  is_active BOOLEAN,
  dob DATE
);
```

### 🔹 Rename or Drop a Table

```sql
ALTER TABLE person RENAME TO "user";  -- Quotes required for reserved words
DROP TABLE "user";
```

> ⚠️ Always click **Refresh** after operations — Valentina Studio doesn’t auto-refresh.

### 🔹 Create Table with Constraints

```sql
CREATE TABLE person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  age INTEGER CHECK(age >= 18),
  email VARCHAR(255) UNIQUE
);
```

- Constraints can be viewed/edited visually from the **Design → Constraints** section.

### 🔹 Insert Data

#### Single Row Insert

```sql
INSERT INTO your_table (column1, column2, column3)
VALUES (value1, value2, value3);
```

#### Multi Row Insert

```sql
INSERT INTO your_table (column1, column2, column3)
VALUES
  (val1_1, val2_1, val3_1),
  (val1_2, val2_2, val3_2),
  (val1_3, val2_3, val3_3);
```

#### Alternate (Not Recommended for Production)

```sql
INSERT INTO your_table
VALUES (val1, val2, val3); -- Must maintain column order
```

---

## ✅ Extra Recommendations

### 🔹 Good Practices

- Avoid using reserved keywords (e.g., `user`) as table names — use quotes if needed.
- Always **refresh** after updates in Valentina.
- Keep **constraints** clear and visible from the GUI to reduce errors.
- Use **pgAdmin** for deeper server/user management, **Valentina** for faster schema/table edits.

### 🔹 Optional Enhancements (Future Study)

- Explore **ERD Diagrams** via Valentina Studio or pgAdmin to visualize schema.
- Use **Data Types** effectively (`TEXT`, `UUID`, `TIMESTAMP` with timezone).
- Learn about **indexes** and performance tuning.

---

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

# **`PostgreSQL Module 9 Summary (Time, Grouping, Keys, Joins)`**

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

# **`PostgreSQL Advanced Techniques: Subqueries, Views, Procedural SQL, Triggers, Performance & Indexing (10.2–10.9)`**

> 🎓 **Goal**: This README summarizes advanced PostgreSQL techniques using real examples and highlights **why they are important**, helping you write smarter queries, automate actions, and optimize performance.

---

## 🔁 10.2–10.3: Subqueries (Nested Queries)

### 🧩 What are Subqueries?

A **subquery** is a query inside another query. It helps you:

- Break down complex queries
- Reuse logic inside SELECT, FROM, or WHERE
- Improve readability and abstraction

### ✅ Use Cases & Examples

#### 1️⃣ Scalar Subquery (returns a single value)

```sql
SELECT * FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_name = 'HR');
```

📌 _This returns employees whose salary is higher than the highest salary in the HR department._

#### 2️⃣ Column Subquery (returns a list)

```sql
SELECT employee_name, salary FROM employees
WHERE department_name IN (
    SELECT department_name FROM employees WHERE department_name LIKE '%R%'
);
```

📌 _This selects employees from departments that contain the letter “R”._

#### 3️⃣ Subquery in SELECT clause

```sql
SELECT *, (SELECT SUM(salary) FROM employees) AS total_salary FROM employees;
```

📌 _This shows each employee’s info along with the total salary of all employees._

#### 4️⃣ Subquery in FROM clause

```sql
SELECT * FROM (
    SELECT department_name, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_name
) AS dept_salary;
```

📌 _This creates a temporary table of department salary totals that you can further query._

---

## 🔍 10.4: Views

### 🧱 What is a View?

A **view** is a saved SQL query that acts like a virtual table. It simplifies repeated queries and provides a layer of abstraction or security.

### ✨ Why Use Views?

- Simplify complex logic
- Reuse without rewriting
- Hide sensitive data (e.g., don't show passwords)
- Make front-end integration easier

### 🧪 Examples

#### Create a View with Aggregate Function

```sql
CREATE VIEW dept_avg_salary AS
SELECT department_name, AVG(salary) FROM employees GROUP BY department_name;
```

#### Create a Filtered View

```sql
CREATE VIEW test_view AS
SELECT employee_name, salary, department_name FROM employees
WHERE department_name IN (
    SELECT department_name FROM employees WHERE department_name LIKE '%R%'
);
```

#### Query a View

```sql
SELECT * FROM dept_avg_salary;
```

---

## 🛠️ 10.5–10.6: Procedural vs Non-Procedural SQL

### ✅ Non-Procedural SQL (Standard SQL)

- Focuses on **what to do**, not how
- Example: `SELECT`, `DELETE`, `UPDATE`
- Simple and concise

```sql
DELETE FROM employees WHERE employee_id = 5;
```

### 🧠 Procedural SQL (PL/pgSQL)

- Adds control flow like `IF`, `LOOP`, variables
- Useful for complex logic, automation, reusable routines

#### Function to Delete by ID

```sql
CREATE OR REPLACE FUNCTION delete_emp_by_id(p_emp_id INT)
RETURNS void LANGUAGE SQL AS $$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

-- Call the function
SELECT delete_emp_by_id(28);
```

📌 _This shows how to wrap standard SQL in a reusable procedure._

---

## 🔔 10.7: Triggers

### ⚡ What is a Trigger?

A **trigger** automatically runs a function when an event (INSERT, UPDATE, DELETE) happens on a table.

### 🎯 Why Use Triggers?

- Track changes or log history
- Enforce business rules
- Auto-update other tables

### 🧪 Example: Log Deleted Users

#### Step 1: Create Audit Table

```sql
CREATE TABLE deleted_users_audit (
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);
```

#### Step 2: Create Trigger Function

```sql
CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
BEGIN
    INSERT INTO deleted_users_audit VALUES (OLD.user_name, now());
    RAISE NOTICE 'Deleted user audit log created';
    RETURN OLD;
END
$$;
```

#### Step 3: Create Trigger

```sql
CREATE TRIGGER save_deleted_trigger
BEFORE DELETE ON my_users
FOR EACH ROW EXECUTE FUNCTION save_deleted_user();
```

#### Step 4: Try It Out

```sql
DELETE FROM my_users WHERE user_name = 'Raufur';
```

📌 _Now every deleted user will be saved in the audit table automatically._

---

## 🚀 10.8–10.9: Performance Optimization & Indexing

### 🔍 Explain Analyze: See How PostgreSQL Executes Queries

```sql
EXPLAIN ANALYZE
SELECT * FROM employees WHERE emp_no = '10004';
```

📌 _Shows cost, time, and plan used by PostgreSQL. Helps in debugging and optimizing queries._

### ⚡ Indexes: Speed Up Searches

```sql
CREATE INDEX idx_employees_last_name ON employees (last_name);
```

📌 _Use indexes on frequently searched columns to boost performance._

> ✅ **Best Practice**: Don’t overuse indexes — they speed up reads but slow down writes.

### 📁 View PostgreSQL Data Directory

```sql
SHOW data_directory;
```

📌 _Useful to check where your database physically stores data._

---

## 📌 Summary & Best Practices

| Feature        | Use Case                        | Why It Matters                            |
| -------------- | ------------------------------- | ----------------------------------------- |
| **Subqueries** | Complex filters, aggregation    | Improves query logic & reuse              |
| **Views**      | Simplify repeated logic         | Enhances maintainability, security        |
| **Procedures** | Reusable operations             | Adds flexibility, allows control flow     |
| **Triggers**   | Automate actions on data change | Useful for logging, enforcing rules       |
| **Indexes**    | Speed up SELECTs                | Crucial for performance in large tables   |
| **EXPLAIN**    | Debug/optimize slow queries     | Helps find bottlenecks in query execution |

---

## 🏁 Final Thoughts

This section covers **real-world skills** for building production-ready databases:

- Clean structure with views and subqueries
- Logic encapsulation with triggers and functions
- Performance awareness with `EXPLAIN` and indexing

> 🚀 **Recommendation**: Always test queries with `EXPLAIN`, use views to reduce duplication, and automate repetitive actions with triggers or stored procedures.

---

Happy Learning PostgreSQL! 🌟
