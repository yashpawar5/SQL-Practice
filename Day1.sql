SELECT * FROM customer;

SELECT title FROM album;

SELECT artist_id, title FROM album;

SELECT first_name, country, email FROM customer; 

SELECT title FROM album WHERE album_id BETWEEN 200 AND 300;

SELECT * FROM album WHERE title LIKE 'Bongo Fury';

SELECT * FROM customer WHERE city NOT LIKE 'Prague';

SELECT title FROM employee WHERE state NOT IN('A', 'B');

SELECT first_name FROM customer WHERE first_name LIKE 'J%' AND LENGTH(first_name) BETWEEN 3 AND 5;