# 📘 PostgreSQL CLI Commands & Setup Guide

A concise and beautifully structured guide to help you get started with PostgreSQL using the terminal/CLI. Includes common commands, setup instructions, user/role management, and access control.

---

## 🧠 Basic PostgreSQL CLI Commands

| Command              | Description                                               |
| -------------------- | --------------------------------------------------------- |
| `select version();`  | Show the current PostgreSQL version                       |
| `\l`                 | List all databases                                        |
| `\c <database_name>` | Connect/switch to a specific database                     |
| `\dt`                | Show tables in the current schema                         |
| `\d <table_name>`    | Show table structure                                      |
| `\d+ <table_name>`   | Show detailed table structure and extra info              |
| `\dn`                | List available schemas                                    |
| `\du`                | List all roles/users                                      |
| `\! cls`             | Clear the terminal screen (works on Windows)              |
| `\conninfo`          | Show current connection info (user, database, host, etc.) |
| `\q`                 | Quit `psql`                                               |

---

## 🛠️ Setting Up psql in Any Terminal (Outside the Default Shell)

1. **Add PostgreSQL to your System PATH**
   Search for `Environment Variables` in Windows
   ➜ Edit System Environment Variables
   ➜ Add to `Path`:

   ```
   C:\Program Files\PostgreSQL\17\bin
   ```

2. **Connect to PostgreSQL from any terminal**

   ```bash
   psql -U postgres
   ```

   You’ll be prompted for the password.

3. **Connect to a specific database**

   ```bash
   psql -U postgres -d template0
   ```

---

## 🗃️ Database Management

| Task            | Command                 |
| --------------- | ----------------------- |
| Create database | `CREATE DATABASE mydb;` |
| Connect to DB   | `\c mydb`               |

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

🔗 [Official PostgreSQL CREATE DATABASE Docs](https://www.postgresql.org/docs/current/sql-createdatabase.html)

---

## 👤 User and Role Management

| Task                      | Command                                                     |
| ------------------------- | ----------------------------------------------------------- |
| List all users/roles      | `\du`                                                       |
| Create user               | `CREATE USER user1;`                                        |
| Create user with password | `CREATE USER user1 WITH LOGIN ENCRYPTED PASSWORD '123456';` |
| Create role with login    | `CREATE ROLE role1 WITH LOGIN ENCRYPTED PASSWORD '123456';` |
| Switch users              | `psql -U user1 -d postgres`                                 |

---

## 🧱 Table Operations

| Task            | Command                                          |
| --------------- | ------------------------------------------------ |
| Create table    | `CREATE TABLE test_table (name VARCHAR(50));`    |
| Show tables     | `\dt`                                            |
| Check structure | `\d test_table`                                  |
| Insert data     | `INSERT INTO test_table(name) VALUES ('Alice');` |
| View data       | `SELECT * FROM test_table;`                      |

---

## 🔐 Permissions and Access Control

Sometimes, users get errors like:

```
ERROR:  permission denied for table test_table
```

This means the user doesn't have access to the table. Grant permissions as shown below:

### ✅ Grant Permissions

| Task                                        | Command                                                         |
| ------------------------------------------- | --------------------------------------------------------------- |
| Full access to user                         | `GRANT ALL PRIVILEGES ON TABLE test_table TO user1;`            |
| Read-only access                            | `GRANT SELECT ON TABLE test_table TO user2;`                    |
| Revoke access                               | `REVOKE SELECT ON TABLE test_table FROM user2;`                 |
| Grant all tables access (not best practice) | `GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO user2;` |
| Best practice for schema access             | `GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO user2;` |
| Assign role to user                         | `GRANT role1 TO user3;`                                         |
| Role permission to read all tables          | `GRANT SELECT ON ALL TABLES IN SCHEMA public TO role1;`         |

---

## 🌟 Pro Tips

- Always create users with limited access based on use case.
- Use roles for grouping permissions and assign them to users.
- Use `\?` in psql to see all meta-commands available.
- Use `\h <command>` to get help on a specific SQL command (e.g., `\h CREATE TABLE`).
- To list databases from outside psql:

  ```bash
  createdb -U postgres dbname
  ```

---

## ✅ Example Flow (Quick Recap)

```bash
# Create DB
CREATE DATABASE testdb;

# Create user
CREATE USER user1 WITH LOGIN ENCRYPTED PASSWORD '123456';

# Connect as user
psql -U user1 -d testdb

# Create table (admin)
CREATE TABLE test_table (name VARCHAR(50));

# Grant access
GRANT ALL PRIVILEGES ON TABLE test_table TO user1;

# Insert & select
INSERT INTO test_table(name) VALUES ('John Doe');
SELECT * FROM test_table;
```

---
