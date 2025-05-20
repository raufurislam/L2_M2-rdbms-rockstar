-- 9.6, 9.7
CREATE Table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE Table post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);


INSERT INTO "user" (username) VALUES ('akash'), ('batash'), ('sagor'), ('nodi');

INSERT INTO post (title, user_id) VALUES
    ('Enjoying a snny day with Akash', 2),
    ('Batash just shared A amazing recipe', 1),
    ('Exploring Adventure with sagor', 4),
    ('Nodi''s Wisdom always leaves me inspire', 3)
;

SELECT title, username FROM post
    JOIN "user" on post.user_id = "user".id;

SELECT post.id,  title, username FROM post
    JOIN "user" ON post.user_id = "user".id;

SELECT * FROM post
    JOIN "user" ON post.user_id = "user".id;

SELECT post.id FROM post
    JOIN "user" ON post.user_id = "user".id;

SELECT p.id FROM post p
    JOIN "user" ON p.user_id = "user".id;

SELECT p.id FROM post p
    JOIN "user" u ON p.user_id = u.id;
SELECT * FROM post p
    JOIN "user" u ON p.user_id = u.id;
SELECT * FROM post AS p 
    JOIN "user" AS u ON p.user_id = u.id;
SELECT * FROM "user"
    JOIN post on post.user_id = "user".id;
SELECT * FROM post
    JOIN "user" on post.user_id = "user".id;

SELECT * FROM post AS p 
    LEFT JOIN "user" AS u ON p.user_id = u.id;
SELECT * FROM post AS p 
    RIGHT OUTER JOIN "user" AS u ON p.user_id = u.id;



-- Full JOIN
SELECT * FROM post AS p 
    FULL OUTER JOIN "user" AS u ON p.user_id = u.id;

-- INNER JOIN
-- LEFT JOIN;
-- RIGHT JOIN;
-- FULL JOIN;


DROP Table "user";
DROP Table post;

INSERT INTO post (id, title, user_id) VALUES
    (5, 'this is a test post title', NULL);

SELECT * FROM "user";
SELECT * FROM post;