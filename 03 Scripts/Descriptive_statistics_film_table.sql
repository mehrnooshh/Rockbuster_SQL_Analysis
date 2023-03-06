/* Descriptive statistics for film table */



SELECT 

-- Numerical fileds
	MIN(rental_duration) AS min_rental_days, MAX(rental_duration) AS max_rental_days, ROUND(AVG(rental_duration), 2) AS avg_rental_days
	, MIN(rental_rate) AS min_rental_rate, MAX(rental_rate) AS max_rental_rate, ROUND(AVG(rental_rate), 2) AS avg_rental_rate
	, MIN(length) AS min_length, MAX(length) AS max_length, ROUND(AVG(length), 2) AS avg_length
	, MIN(release_year) AS min_release_year, MAX(release_year) AS max_release_year, ROUND(AVG(release_year)) AS avg_release_year
	, MIN(replacement_cost) AS min_replacement_cost, MAX(replacement_cost) AS max_replacement_cost, ROUND(AVG(replacement_cost), 2) AS avg_replacement_cost,
	
-- Non-Numerical filed

	MODE() WITHIN GROUP(ORDER BY title) AS title_modal,
	MODE() WITHIN GROUP(ORDER BY description) AS description_modal,
	MODE() WITHIN GROUP(ORDER BY release_year) AS release_year_modal,
	MODE() WITHIN GROUP(ORDER BY special_features) AS special_features_modal,
	MODE() WITHIN GROUP(ORDER BY fulltext) AS full_text_modal
	
	FROM film

