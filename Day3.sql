SELECT 
	c.first_name 
FROM 
	customer as c 
ORDER BY c.first_name 
LIMIT 5;

SELECT 
	c.first_name, 
	c.last_name, 
	i.billing_city, 
	i.total 
FROM 
	customer c 
	INNER JOIN invoice i ON c.customer_id = i.customer_id
ORDER BY i.total DESC 
LIMIT 10 OFFSET 5;


SELECT
	t.name,
	t.composer,
	a.title
FROM
	track t
	INNER JOIN album a ON t.album_id = a.album_id 
ORDER BY t.name
LIMIT 10;


SELECT 
	t.name,
	t.composer,
	a.title
FROM
	track t
	INNER JOIN album a USING(album_id) --IF columns for matching share the same name then USING keyword can be used.
LIMIT 10;


SELECT 
	t1.name,
	t2.name,
	t1.bytes
FROM 
	track t1
	INNER JOIN track t2 ON t1.bytes = t2.bytes AND 
			   t1.name <> t2.name
ORDER BY t1.bytes DESC;

SELECT 
	t.name "Track Title",
	a.title "Album Name",
	ar.name "Artist Name"
FROM
	track t
	INNER JOIN album a USING(album_id)
	INNER JOIN artist ar USING(artist_id)
LIMIT 10;


SELECT 
	c.first_name || ' ' || c.last_name "Customer Name",
	i.invoice_id,
	i.total
FROM
	customer c 
	LEFT JOIN invoice i USING (customer_id)
ORDER BY "Customer Name" ASC
LIMIT 15;

SELECT 
	c.first_name,
	i.invoice_id,
	i.total
FROM 
	customer c 
	LEFT JOIN invoice i USING(customer_id)
WHERE
	i.total = 0.99
ORDER BY c.first_name
LIMIT 15;


SELECT
	t.track_id,
	t.name "Track",
	g.name "Genre"
FROM 
	track t 
	RIGHT JOIN genre g USING(genre_id)
ORDER BY g.name NULLS FIRST;
	
SELECT 
	e.first_name || ' ' || e.last_name "Employee",
	m.first_name || ' ' || m.last_name "Manager",
	e.title
FROM
	employee e 
	INNER JOIN employee m ON m.employee_id = e.reports_to
ORDER BY e.first_name;

SELECT 
	name "Track Name",
	il.unit_price
FROM
	track t 
	FULL OUTER JOIN invoice_line il USING(track_id)
ORDER BY track_id
LIMIT 20;


SELECT 
	t.name,
	a.title
FROM
	track t
	CROSS JOIN album a
LIMIT 10;


SELECT 
	t.name 
FROM
	track t 
	NATURAL JOIN album a
ORDER BY t.name 
LIMIT 20;

SELECT
	AVG(totaL) average_total
FROM
	invoice;


SELECT 
	COUNT(*) 
FROM
	track;
	