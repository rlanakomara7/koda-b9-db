CREATE TABLE acara (
    event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL
);
SELECT * FROM acara;
INSERT INTO
    acara (event_name, start_date)
VALUES
    ('Event A', '2024-01-01'),
    ('Event B', '2024-01-05'),
    ('Event C', '2024-01-10');

SELECT 
    e1.event_name,
    e1.start_date,
    MIN(e2.event_name) AS next_event
FROM events e1
LEFT JOIN events e2
    ON e2.start_date > e1.start_date
GROUP BY 
    e1.event_id,
    e1.event_name,
    e1.start_date;