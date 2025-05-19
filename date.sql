-- 9.1
SHOW timezone;
-- show timezone
SELECT now();

CREATE Table timeZ (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);
INSERT INTO timez VALUES ('2024-01-12 10:45:00', '2024-01-12 10:45:00');

SELECT CURRENT_DATE;
SELECT now()::DATE;

SELECT to_char(now(), 'dd/mm/yyyy');
SELECT to_char(now(), 'DDD');

SELECT CURRENT_DATE - INTERVAL '1 Year 2 month';

SELECT age(CURRENT_DATE,'2000-07-13');
SELECT age(CURRENT_DATE,'1999-08-03');


SELECT * FROM students;
SELECT *, age(CURRENT_DATE, dob) FROM students;

SELECT extract(YEAR FROM '2000-07-13'::date);
SELECT 1::BOOLEAN;
SELECT 'n'::BOOLEAN;

SELECT now();
SELECT * FROM timez;