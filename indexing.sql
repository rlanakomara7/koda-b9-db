CREATE TABLE users (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(255) NOT NULL,
    age int NOT NULL CHECK (age > 0),
    email varchar(255) NOT NULL,
    profile_picture varchar(255) NOT NULL,
    created_at timestamp NULL DEFAULT NOW (),
    updated_at timestamp NULL DEFAULT NULL
);
SELECT *
FROM users

EXPLAIN ANALYZE -- Use EXPLAIN ANALYZE to diagnose query performance
SELECT 
    name,
    age,
    email,
    profile_picture,
    created_at
FROM 
    users
WHERE created_at < '2026-01-01';

CREATE INDEX created_idx ON users (created_at);
DROP INDEX created_at;

SELECT *(count)
FROM users;
















