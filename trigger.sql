/* 10.7
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions. 
*/

-- Table-Level Events:
    -- INSERT, UPDATE, DELETE, TRUNCATE
-- Database-Level Events
    -- Database Startup, Database Shutdown, Connection start and end etc

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW] 
-- EXECUTE FUNCTION function_name();

CREATE Trigger TR 
    BEFORE DELETE
    ON USER
    for EACH ROW
    EXECUTE FUNCTION function_name()
;

CREATE Table my_users(
    user_name VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO my_users VALUES('Raufur', 'raufur@gmail.com'), ('Ontiya', 'ontiya@gmail.com');

CREATE Table deleted_users_audit(
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);

-- trigger function
CREATE OR REPLACE Function save_deleted_user()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
    AS
    $$
        BEGIN
            INSERT INTO deleted_users_audit VALUES(OLD.user_name, now());
            RAISE NOTICE 'Deleted user audit log created';
            RETURN OLD;
        END
    $$



CREATE OR REPLACE Trigger save_deleted_trigger
    BEFORE DELETE
    ON my_users
    for EACH row
    EXECUTE FUNCTION save_deleted_user()
;

DELETE FROM my_users WHERE user_name = 'Raufur';


SELECT * FROM my_users;
SELECT * FROM deleted_users_audit;