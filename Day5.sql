-- Find Customers with Above-Average Total Purchases

SELECT
	c.first_name || ' ' || c.last_name "Customer",
	c.country,
	i.total
FROM
	customer c 
	LEFT JOIN invoice i USING(customer_id)
WHERE 
	i.total IS NOT NULL
	AND
	i.total > (
		SELECT 
			AVG(total)
		FROM
			invoice		
	) 
ORDER BY
	i.total DESC;
	
--Find Albums with More Than 10 Tracks

SELECT 
	a.title album,
	COUNT(t.track_id)
FROM
	album a 
	JOIN track t USING(album_id)
GROUP BY 
	a.album_id ;

SELECT 
	a.album_id,
	a.title
FROM
	album a
WHERE
	a.album_id IN(SELECT 
					album_id
				FROM
					track
				GROUP BY album_id
				HAVING COUNT(*) > 10
	);
	
--Find the Most Expensive Invoice

SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	i.invoice_id,
	i.total
FROM
	invoice i 
	JOIN customer c USING(customer_id)
WHERE 
	i.total = (
		SELECT 
			MAX(total)
		FROM
			invoice
		
	);

--Find Genres with Tracks Longer Than the Average Track Length

SELECT 
	g.genre_id,
	g.name,
	t.milliseconds 
FROM
	genre g
	JOIN track t USING(genre_id)
WHERE 
	t.milliseconds > (
		SELECT 
			AVG(milliseconds)
		FROM
			track
	)
ORDER BY t.milliseconds DESC 
LIMIT 10;


--Find Customers Who Have Purchased Tracks from Multiple Genres
SELECT
	c.customer_id,
	c.first_name,
	c.last_name
FROM
	customer c 
	JOIN invoice i USING(customer_id)
	JOIN invoice_line il USING(invoice_id)
	JOIN track t USING(track_id)
	JOIN genre g USING(genre_id)
GROUP BY
	c.customer_id, c.first_name, c.last_name
HAVING 
	COUNT(genre_id)>1
ORDER BY c.first_name;


--Find Customers with an Invoice Greater than the Overall Average Invoice of All Customers

SELECT 
    i.customer_id, 
    i.invoice_id, 
    i.total AS invoice_total
FROM 
    invoice i
WHERE 
    i.total > (
        SELECT AVG(total)
        FROM invoice
    );

   

--Find Customers Who Have Purchased Tracks in a Given Price Range
   
SELECT 
	c.customer_id,
	c.first_name,
	c.last_name
FROM 
	customer c 
WHERE 
	EXISTS (
		SELECT 
			1
		FROM
			invoice i 
			JOIN invoice_line il USING(invoice_id)
		WHERE 
			i.customer_id = c.customer_id 
			AND 
			il.unit_price > ANY (
								SELECT 
									unit_price
								FROM 
									track
								)
			);


--Find Invoices with Total Higher than Any Customer's First Invoice

SELECT
	invoice_id,
	total
FROM
	invoice
WHERE
	total > ANY (
				SELECT
					MIN(total)
				FROM
					invoice
				GROUP BY customer_id
				);
				
--