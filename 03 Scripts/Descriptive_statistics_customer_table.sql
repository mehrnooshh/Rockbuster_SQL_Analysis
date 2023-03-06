-- Descriptive statistics for customer table (both Numerical and Non-numerical columns)

SELECT
	COUNT(customer_id) AS customer_count, COUNT(store_id) AS store_count,
	COUNT(address_id) AS address_count,
	MODE() WITHIN GROUP (ORDER BY active) AS active_status_modal,
	MODE() WITHIN GROUP (ORDER BY first_name) AS first_name_modal,
	MODE() WITHIN GROUP (ORDER BY last_name) AS last_name_modal,
	MAX(last_update) AS last_update,
	COUNT(email) AS emailaddress_count
	FROM customer
