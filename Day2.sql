-- create a new table
CREATE TABLE sort_demo(num INT);

-- insert some data
INSERT INTO sort_demo(num) 
VALUES 
  (1), 
  (2), 
  (3), 
  (null);



SELECT first_name || ' ' || last_name AS "full name", city FROM customer; --use " " if the columnalias contains one or more spaces

SELECT NOW();

SELECT last_name AS surname FROM customer;

SELECT last_name surname FROM customer;

SELECT first_name, last_name FROM customer ORDER BY first_name ASC;

SELECT last_name, first_name FROM customer ORDER BY last_name DESC;

SElECT first_name, last_name FROM customer ORDER BY first_name ASC, last_name DESC;

SELECT first_name, LENGTH(first_name) length FROM customer ORDER BY length DESC; 

SELECT num FROM sort_demo ORDER BY num;

SELECT num FROM sort_demo ORDER BY num NULLS FIRST;

SELECT num FROM sort_demo ORDER BY num DESC NULLS LAST;

SELECT DISTINCT * FROM track ORDER BY track_id ASC;

SELECT DISTINCT first_name FROM customer ORDER BY first_name;

SELECT DISTINCT first_name, last_name from customer ORDER BY first_name, last_name; --here both columns are used to evaluate uniqueness

SELECT * FROM customer WHERE country LIKE 'B%' OR email LIKE '%.com';

SELECT * FROM customer WHERE country LIKE 'U%' AND email LIKE '%.com';

SELECT first_name FROM customer WHERE LENGTH(first_name) BETWEEN 4 AND 7 ORDER BY first_name LIMIT 10 OFFSET 2;

SELECT * FROM invoice WHERE total <= 2 ORDER BY total FETCH FIRST 5 ROW ONLY;

SELECT billing_city as city FROM invoice WHERE total > 4 FETCH FIRST 5 ROW ONLY;

SELECT name FROM track WHERE track_id IN (1, 2, 3, 4, 5);

SELECT billing_address FROM invoice WHERE total BETWEEN 1 AND 3 ORDER BY total LIMIT 5;
