-- 9.3, 9.4, 9.5
CREATE Table "user"(
    id SERIAL PRIMARY key,
    username VARCHAR(25) NOT NULL 
);

CREATE Table post(
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) on delete set DEFAULT DEFAULT 2
);
ALTER Table post 
    alter COLUMN user_id set NOT NULL;

INSERT INTO "user" (username) VALUES ('akash'), ('batash'), ('sagor'), ('nodi');

INSERT INTO post (title, user_id) VALUES
    ('Enjoying a snny day with Akash', 2),
    ('Batash just shared A amazing recipe', 1),
    ('Exploring Adventure with sagor', 4),
    ('Nodi''s Wisdom always leaves me inspire', 3)
;

-- ***
-- Insertion constraint on INSERT post
-- Attempting to insert a post with a user ID that does not exist
-- Inserting a post with a valid user ID
-- attempting to insert a post without specifying a new userID
INSERT INTO post (title, user_id) VALUES('test', 8);
INSERT INTO post (title, user_id) VALUES('test2', 3);
INSERT INTO post (title, user_id) VALUES('test2', NULL);

-- ***
-- Deletion constraint on DELETE user 
-- Restrict Deletion -> ON DELETE RESTRICT / ON DELETE ON ACTION (default)
-- Cascading deletion -> ON DELETE CASCADE
-- Setting NULL -> ON DELETE SET NULL
-- Set Default Values -> ON DELETE SET DEFAULT

DELETE FROM "user"
    WHERE id = 4;

DROP TABLE post;
DROP TABLE "user";

SELECT* FROM post;
SELECT * FROM "user"