SELECT 
	billing_city,
	SUM(total) "Total Sales"
FROM
	invoice
GROUP BY
	billing_city
ORDER BY "Total Sales" DESC
LIMIT 15; 


SELECT 
	g.name,
	SUM(t.unit_price) "Total Price"
FROM 
	genre g 
	LEFT JOIN track t USING(genre_id)
GROUP BY g.name
ORDER BY "Total Price" DESC;
	

SELECT 
	c.first_name || ' ' || c.last_name "Customer",
	SUM(i.total) "Total Amount Spent"
FROM
	customer c 
	LEFT JOIN invoice i USING (customer_id)
GROUP BY "Customer"
ORDER BY "Total Amount Spent" DESC;


SELECT 
	c.first_name || ' ' || c.last_name "Customer",
	SUM(i.total) "Total Amount Spent"
FROM
	customer c 
	LEFT JOIN invoice i USING (customer_id)
GROUP BY "Customer"
HAVING 
	SUM(i.total) > 40
ORDER BY "Total Amount Spent" DESC;


SElECT * FROM artist
UNION --UNION removes duplicate entries, UNION ALL allows duplicate entries.
SELECT * FROM genre;


SELECT 
	genre_id ,
	COUNT(*) total_tracks
FROM
	track 
GROUP BY 
	genre_id ;


SELECT 
	billing_country,
	COUNT(*) no_of_customers
FROM
	invoice
GROUP BY
	billing_country 
ORDER BY COUNT(*) DESC;


SELECT
	g.name,
	COUNT(*) total_tracks
FROM 
	track
	LEFT JOIN genre g USING(genre_id)
GROUP BY
	g.name
ORDER BY COUNT(*) DESC
LIMIT 5;


SELECT 
i.billing_country, 
c.customer_id, 
SUM(i.total) AS TotalSales
FROM 
	invoice i
	JOIN customer c ON i.customer_id = c.customer_id
GROUP BY 
	GROUPING SETS (
	(i.billing_country, c.customer_id), 
	(i.billing_country), 
	()
	);


SELECT 
	a.artist_id, 
	al.album_id, 
	COUNT(*) AS TotalTracksSold
FROM 
	invoice_line il
	JOIN track t ON il.track_id = t.track_id
	JOIN album al ON t.album_id = al.album_id
	JOIN artist a ON a.artist_id = al.album_id 
GROUP BY 
	GROUPING SETS (
		(a.artist_id, al.album_id), 
		(a.artist_id), 
		()
	);

