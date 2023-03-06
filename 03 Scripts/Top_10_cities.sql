-- Top 10 cities within the top 10 countries

SELECT city.city, country.country, COUNT(customer.customer_id) AS customer_count
	    FROM customer
   	 JOIN address ON customer.address_id = address.address_id
	    JOIN city ON address.city_id = city.city_id
	    JOIN country ON country.country_id = city.country_id
	    WHERE country.country IN ('India','China','United States','Japan','Mexico','Brezil','Russian Federation','Philippines','Turkey','Indonesia')
	    GROUP BY city, country
	    ORDER BY customer_count DESC
	    LIMIT 10