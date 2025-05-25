-- Active: 1747457371350@@127.0.0.1@5432@ph2SELECT * from  employees;
-- 10.8-10.9

EXPLAIN ANALYSE
SELECT * from employees WHERE emp_no = '10004';

CREATE INDEX idx_employees_last_name
on employees (last_name);

SHOW data_directory;