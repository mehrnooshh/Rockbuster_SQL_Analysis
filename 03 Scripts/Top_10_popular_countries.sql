-- Top 10 countries for Rockbuster in terms of customer numbers

SELECT customer.customer_id, customer.first_name, customer.last_name, city.city, country.country, SUM(payment.amount) AS total_amount_paid
	FROM payment
			JOIN customer ON customer.customer_id = payment.customer_id
			JOIN address ON address.address_id = customer.address_id
			JOIN city ON address.city_id = city.city_id
			JOIN country ON country.country_id = city.country_id
	    WHERE city.city IN ('Aurora', 'Pingxiang', 'Sivas', 'Dhule (Dhulia)', 'Kurashiki', 'Xintai', 'Adoni', 'Celaya', 'Ozamis', 'Atlixco')
	    GROUP BY customer.customer_id, customer.first_name, customer.last_name, city.city, country.country
	    ORDER BY total_amount_paid DESC
	    LIMIT 5