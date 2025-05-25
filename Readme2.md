# 🧠 PostgreSQL Advanced Techniques: Subqueries, Views, Procedural SQL, Triggers, Performance & Indexing (10.2–10.9)

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
