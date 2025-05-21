/*
Demo Table Overview
All of the following tasks are based on a sample table named students. Use this as a reference while solving the following tasks. Here's a quick overview of the structure:
Column Name    
Description
id Auto-incremented primary key
roll Unique roll number for each student
name Name of the student
age Age of the student
department Student’s department (e.g., CSE, EEE)
score Score achieved by the student
status Academic status (e.g., passed, failed)
last_login Last login date
*/

CREATE TABLE studentsP (
    id SERIAL PRIMARY KEY,                  -- Auto-incremented primary key
    roll INT UNIQUE,                        -- Unique roll number
    name VARCHAR(50) NOT NULL,              -- Name (required)
    age INT CHECK (age >= 0),               -- Age cannot be negative
    department VARCHAR(20),                 -- Department name
    score INT CHECK (score BETWEEN 0 AND 100), -- Score in valid range
    status VARCHAR(10) CHECK (status IN ('passed', 'failed')), -- Limited values
    last_login DATE                         -- Last login date
);

INSERT INTO studentsP (roll, name, age, department, score, status, last_login) VALUES
(101, 'Alice Smith', 20, 'CSE', 85, 'passed', '2025-05-15'),
(102, 'Bob Johnson', 22, 'EEE', 76, 'passed', '2025-05-14'),
(103, 'Charlie Brown', 19, 'CSE', 92, 'passed', '2025-05-12'),
(104, 'David Wilson', 21, 'BBA', 67, 'passed', '2025-05-13'),
(105, 'Eva Davis', 23, 'CSE', 45, 'failed', '2025-05-10'),
(106, 'Frank Moore', 18, 'EEE', 59, 'passed', '2025-05-16'),
(107, 'Grace Lee', 20, 'CSE', 100, 'passed', '2025-05-17'),
(108, 'Hannah White', 22, 'BBA', 35, 'failed', '2025-05-11'),
(109, 'Ian Martin', 19, 'EEE', 78, 'passed', '2025-05-13'),
(110, 'Jane Clark', 20, 'CSE', 90, 'passed', '2025-05-09'),
(111, 'Kevin Lewis', 24, 'LAW', 48, 'failed', '2025-05-08'),
(112, 'Lily Walker', 21, 'CSE', 82, 'passed', '2025-05-07'),
(113, 'Mike Hall', 22, 'EEE', 73, 'passed', '2025-05-06'),
(114, 'Nina Young', 20, 'BBA', 65, 'passed', '2025-05-04'),
(115, 'Oscar King', 23, 'CSE', 88, 'passed', '2025-05-05'),
(116, 'Pamela Scott', 18, 'LAW', 40, 'failed', '2025-05-03'),
(117, 'Quinn Green', 21, 'EEE', 60, 'passed', '2025-05-02'),
(118, 'Rachel Adams', 19, 'CSE', 83, 'passed', '2025-05-01'),
(119, 'Sam Baker', 22, 'BBA', 70, 'passed', '2025-04-30'),
(120, 'Tina Wright', 20, 'LAW', 30, 'failed', '2025-04-29');


CREATE TABLE studentsP(
    id SERIAL PRIMARY KEY,
    roll INT UNIQUE,
    name VARCHAR(50) NOT NULL,
    age INT check(age>=0),
    department VARCHAR(20),
    score INT check(score between 0 and 100),
    status VARCHAR(10) check (status in ('passed', 'failed')),
    last_login DATE
);

-- 1 Add a column email (VARCHAR) to the existing students table.
ALTER Table studentsP
    ADD COLUMN email VARCHAR(100);

-- 2. Rename the column email to student_email.
ALTER Table studentsP
    RENAME COLUMN email to student_email;

-- 3. Add a UNIQUE constraint to student_email.
ALTER Table studentsP
    ADD constraint unique_student_email UNIQUE (student_email);

-- 4. Add a PRIMARY KEY to a new table named courses.
CREATE Table coursesP(
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(50)
);

ALTER Table coursesP 
    RENAME COLUMN courses_id to course_id;
ALTER Table coursesp
    ADD CONSTRAINT pk_course_id PRIMARY KEY (course_id);

ALTER TABLE coursesp
    ADD COLUMN something VARCHAR(50);
SELECT * FROM coursesP;

-- 5. Drop a column from any existing table.
ALTER Table coursesp
    DROP COLUMN something;


-- Filtering & Logical Operations (Based on 8-5, 8-7, 8-8)
-- Write a query to find all students who have a score greater than 80 and not null.
SELECT * FROM studentsp


-- Use the NOT operator to exclude students from a specific department.


-- Fetch students whose names start with ‘A’ using LIKE and ILIKE.


-- Select all students whose age is between 18 and 25.


-- Retrieve rows using IN for a specific set of roll numbers.




SELECT * FROM studentsP;
DROP Table studentsP;