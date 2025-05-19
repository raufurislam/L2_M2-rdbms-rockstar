-- 9.2 
SELECT * FROM students;

SELECT * FROM students
    GROUP BY country; -- Error: column "students.student_id" must appear in the GROUP BY clause or be used in an aggregate function

SELECT country FROM students
    GROUP BY country;
SELECT country, count(*), avg(age) FROM students
    GROUP BY country;
SELECT country,  avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 22
    ;

-- filter groups using having to show only countries with average age above 22
SELECT country, avg(age) FROM students
    GROUP BY country HAVING avg(age) > 22;

-- Count students Born in Each Year
SELECT extract(year from dob) as birth_year, count(*)
    FROM students
    GROUP BY birth_year;

SELECT * FROM students;
SELECT count(*) FROM students;