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
