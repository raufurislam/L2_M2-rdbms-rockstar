SELECT * FROM person2;


-- Add column  
ALTER TABLE person2
    ADD COLUMN email VARCHAR(50) DEFAULT 'default@mail.com' NOT NULL ;

-- drop column 
ALTER TABLE person2
    DROP COLUMN email;

-- Rename column
ALTER Table person2
    RENAME COLUMN age to user_age;

-- change data type
ALTER TABLE person2 
    ALTER COLUMN user_name TYPE VARCHAR(50);

-- insert column
INSERT INTO person2 values(7, 'test', 20, 'test2@gmail.com');

-- set constraint
ALTER TABLE person2
    alter COLUMN user_age set NOT NULL;    

-- drop constraint
ALTER TABLE person2
    alter COLUMN user_age DROP NOT NULL;

-- some of the CONSTRAINT can't set with directly using alter and set but it can be set via this syntax
-- naming convention CONSTRAINT_whichTable_whichColumn
-- to check table design - edit table
ALTER TABLE person2
    ADD constraint UNIQUE_person2_user_age UNIQUE(user_age);

ALTER TABLE person2
    DROP constraint UNIQUE_person2_user_age;

-- truncate table will empty the value but field will be there 
truncate TABLE person2;

-- but if i drop table all the value are gone 
DROP TABLE person2;