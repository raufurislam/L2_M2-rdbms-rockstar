-- VIEW 10.4
-- non-materialized view 
CREATE View dept_avg_salary 
    as 
        SELECT department_name, avg(salary) FROM employees GROUP BY department_name;
SELECT * FROM dept_avg_salary;

CREATE View test_view 
    as
        SELECT employee_name, salary, department_name FROM employees
            WHERE department_name in (SELECT department_name FROM employees WHERE department_name LIKE '%R%'); 
SELECT * FROM test_view;



SELECT * FROM employees;
SELECT department_name, avg(salary) FROM employees GROUP BY department_name;

-- Simplifying complex queries
-- Improved security
-- Enhanced data abstraction