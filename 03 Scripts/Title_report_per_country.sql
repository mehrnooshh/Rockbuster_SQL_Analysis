-- Film revenue and reports per country using CTE


-- Creating a CTE for revenue per country
WITH payment_and_country_cte(payment_id, country) 
	AS
			(
			SELECT payment_id, country.country
		FROM payment
			JOIN staff ON payment.staff_id = staff.staff_id
			JOIN store ON staff.store_id = store.store_id
			JOIN address ON store.address_id = address.address_id
			JOIN city ON address.city_id = city.city_id
			JOIN country ON city.country_id = country.country_id
			),

-- Creating a CTE for the report of rental_rate, rental_days, and replacement_cost per film_title		
title_earned_per_pay_cte (title, payment_id, title_earned, rental_rate, rental_days, replacement_cost)
	AS
		(SELECT film.title, payment_id, payment.amount AS title_earned, film.rental_rate, film.rental_duration AS rental_days, film.replacement_cost
		FROM payment
			JOIN rental ON payment.rental_id = rental.rental_id
			JOIN inventory ON rental.inventory_id = inventory.inventory_id
			JOIN film ON inventory.film_id = film.film_id
		GROUP BY film.title, title_earned, payment_id, film.rental_rate, rental_days, film.replacement_cost
		ORDER BY title_earned DESC)

-- Creating final query to find total revenue and report per country for each title
SELECT  title_earned_per_pay_cte.title, payment_and_country_cte.country, SUM(title_earned_per_pay_cte.title_earned) AS total_amount, title_earned_per_pay_cte.rental_rate, title_earned_per_pay_cte.rental_days AS rental_days, title_earned_per_pay_cte.replacement_cost
		FROM payment_and_country_cte
		JOIN title_earned_per_pay_cte ON title_earned_per_pay_cte.payment_id = payment_and_country_cte.payment_id
		GROUP by title_earned_per_pay_cte.title, payment_and_country_cte.country, title_earned_per_pay_cte.rental_rate, rental_days, title_earned_per_pay_cte.replacement_cost
		ORDER BY total_amount DESC