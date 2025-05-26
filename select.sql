-- Active: 1747457371350@@127.0.0.1@5432@ph2
SELECT * FROM students;
CREATE TABLE students(
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

INSERT INTO students 
(first_name, last_name, age, grade, course, email, dob, blood_group, country) 
VALUES 
('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-05-20', 'A-', 'USA'),
('Alice', 'Smith', 21, 'B', 'Physics', 'alice.smith@example.com', '2003-11-15', 'B+', 'UK'),
('Bob', 'Johnson', 22, 'A', 'Chemistry', 'bob.johnson@example.com', '2002-08-30', 'O+', 'Canada'),
('Emma', 'Williams', 19, 'C', 'Biology', 'emma.williams@example.com', '2005-03-25', 'AB-', 'Australia'),
('Liam', 'Brown', 23, 'B', 'History', 'liam.brown@example.com', '2001-07-12', 'O-', 'Germany'),
('Olivia', 'Jones', 18, 'A', 'Math', 'olivia.jones@example.com', '2006-09-18', 'B-', 'India'),
('Noah', 'Garcia', 20, 'B', 'Physics', 'noah.garcia@example.com', '2004-04-10', 'A+', 'France'),
('Ava', 'Martinez', 21, 'C', 'Chemistry', 'ava.martinez@example.com', '2003-01-05', 'O+', 'Brazil'),
('William', 'Rodriguez', 22, 'A', 'Biology', 'william.rodriguez@example.com', '2002-06-09', 'AB+', 'Spain'),
('Sophia', 'Hernandez', 19, 'B', 'History', NULL, '2005-10-22', 'A-', 'Italy'),
('James', 'Lopez', 20, 'A', 'Math', 'james.lopez@example.com', '2004-02-14', 'B+', 'USA'),
('Isabella', 'Gonzalez', 21, 'C', 'Physics', NULL, '2003-12-03', 'O-', 'Mexico'),
('Benjamin', 'Wilson', 23, 'B', 'Chemistry', 'benjamin.wilson@example.com', '2001-05-01', 'A+', 'Canada'),
('Mia', 'Anderson', 18, 'A', 'Biology', 'mia.anderson@example.com', '2006-08-08', 'AB-', 'UK'),
('Lucas', 'Thomas', 22, 'C', 'History', 'lucas.thomas@example.com', '2002-03-17', 'B-', 'Australia'),
('Charlotte', 'Taylor', 20, 'B', 'Math', 'charlotte.taylor@example.com', '2004-06-06', 'O+', 'USA'),
('Henry', 'Moore', 21, 'A', 'Physics', 'henry.moore@example.com', '2003-09-09', 'A-', 'Germany'),
('Amelia', 'Jackson', 19, 'C', 'Chemistry', 'amelia.jackson@example.com', '2005-12-12', 'B+', 'India'),
('Alexander', 'Martin', 23, 'B', 'Biology', 'alexander.martin@example.com', '2001-04-04', 'O-', 'France'),
('Harper', 'Lee', 20, 'A', 'History', 'harper.lee@example.com', '2004-01-01', 'AB+', 'Spain');

SELECT student_id, email FROM students;
SELECT  email as studentEmail FROM students;
SELECT  email as "Student Email" FROM students;
SELECT  email as "Student Email" , age FROM students;
SELECT * FROM students;
SELECT * FROM students ORDER BY first_name ASC;
SELECT * FROM students ORDER BY first_name DESC;
SELECT * FROM students ORDER BY age DESC;
SELECT* FROM students ORDER BY dob ASC;


-- data filtering

-- select students from the USA
-- select students with "A" grade in Physics
-- select students with a specific blood group "A+"
-- select students from the USA or from Australia
-- select students from the USA or from Australia and the age is 20
-- select students with a grade of 'A' or 'B' in Math or Physics

-- select students older than 20 years

SELECT country FROM students ORDER BY country ASC;
SELECT DISTINCT country FROM students ORDER BY country ASC;

-- where 
SELECT * FROM students 
    WHERE country = 'Canada';
SELECT * FROM students
    WHERE grade = 'A' AND course = 'Physics';
SELECT * FROM students
    WHERE blood_group = 'A+';
SELECT * FROM students
    WHERE country = 'USA' OR country='Australia';
SELECT * FROM students
    WHERE (country = 'USA' OR country = 'Australia') OR age = 20;

SELECT * FROM students
    WHERE age >= 20;
SELECT * FROM students
    WHERE age >= 20 AND course = 'History';
SELECT * FROM students
    WHERE age != 20; -- != or <>
SELECT * FROM students
    WHERE country <> 'USA';


-- FUNCTION
-- SCALAR
SELECT upper(first_name) FROM students;
SELECT upper(first_name) as first_name_in_upper_case, * FROM students;

SELECT upper(last_name) as last_name_in_upper_case, * FROM students;
SELECT UPPER(last_name) AS upper_last_name, * FROM students;
SELECT concat(first_name, ' ', last_name) FROM students;
SELECT length(first_name) FROM students;


-- AGGREGATE
SELECT avg(age) FROM students;
SELECT max(age) FROM students;
SELECT min(age) FROM students;
SELECT sum(age) FROM students;
SELECT count(*) FROM students;
SELECT  max(first_name), max(length(first_name)) FROM students;
SELECT  max(length(first_name)) FROM students;

SELECT max(first_name), max(length(first_name)) FROM students;

SELECT first_name, LENGTH(first_name)
FROM students
WHERE LENGTH(first_name) = (
    SELECT MAX(LENGTH(first_name)) FROM students
);


-- NOT
SELECT * FROM students
    WHERE country <> 'USA';
SELECT * FROM students
    WHERE NOT country = 'USA';

-- NULL
SELECT NULL = 1;
SELECT NULL <> 1;
SELECT NULL = NULL;
SELECT * FROM students
    WHERE email != 'alice.smith@example.com';
SELECT * FROM students
    WHERE email is NOT NULL;

-- COALESCE
SELECT COALESCE(email, 'Email not provided') as "Email", first_name, last_name FROM students

-- SELECT * FROM students
    -- WHERE country = 'USA' OR country =  'Canada' OR country =  'UK';
SELECT * FROM students
    WHERE country IN ('USA', 'UK'); 
SELECT * FROM students
    WHERE country NOT IN ('USA', 'UK'); 
SELECT* FROM students 
    WHERE age BETWEEN 19 AND 20;
SELECT* FROM students 
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01';
SELECT* FROM students 
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01' ORDER BY dob ASC;
SELECT * FROM students
    WHERE first_name LIKE '%a';
SELECT * FROM students
    WHERE first_name LIKE 'A%';
SELECT * FROM students
    WHERE first_name LIKE '___a_%';
SELECT * FROM students
    WHERE first_name LIKE '___a';
SELECT * FROM students
    WHERE first_name ILIKE 'a%';


-- LIMIT OFFSET -> pagination
-- LIMIT
SELECT * FROM students LIMIT 5;
SELECT * FROM students
    WHERE country NOT IN ('USA', 'UK', 'Canada') LIMIT 5; 

-- OFFSET
SELECT * FROM students LIMIT 5 OFFSET 5;
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;

-- DELETE data 
DELETE FROM students; -- it can delete whole data. be careful 
DELETE FROM students 
    WHERE grade = 'C';
DELETE FROM students
    WHERE grade = 'B' AND country = 'USA';

-- UPDATE
UPDATE students 
    SET email = 'default@mail.com', age = 30
    WHERE student_id = 50;

SELECT * FROM students;
