USE sakila;

#1
#1.1
SELECT MAX(length) AS max_duration
FROM film;


SELECT title, length AS max_duration
FROM film
ORDER BY length DESC
LIMIT 1;

SELECT title, length AS mim_duration
FROM film
ORDER BY length ASC
LIMIT 1;

#1.2
SELECT CONCAT(
        FLOOR(AVG(length) / 60), ' hours ',
        AVG(length) % 60, ' minutes') AS avg_duration
FROM film;

#2
#2.1
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date))
FROM rental 
ORDER BY rental_id;

SELECT * FROM rental;

#2.2
SELECT rental_id, MONTH(rental_date) AS month_rental , WEEKDAY(rental_date) AS weekday_rental
FROM rental 
LIMIT 20;

#2.3
SELECT *, CASE 
	WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'weekday'
    ELSE 'workday'
	END AS DAY_TYPE
FROM rental;

#3
SELECT title, length, IFNULL( NULL, 'Not Available')
FROM film
ORDER BY title ASC;

#4
SELECT CONCAT(first_name, ' ', last_name) AS full_name, LEFT(email, 3) AS email_costumer
FROM customer
ORDER BY last_name ASC;
    
###########

#1.
#1.1
SELECT COUNT(*) AS total_release
FROM film
ORDER BY release_year;

#1.2
SELECT rating, COUNT(*) AS total_rating
FROM film
GROUP BY rating;

#1.3
SELECT rating, COUNT(*) AS total_rating
FROM film
GROUP BY rating
ORDER BY rating DESC;

#2
#2.1
SELECT rating, ROUND(AVG(length), 2) AS avg_film
FROM film
GROUP BY rating
ORDER BY avg_film DESC;

#2.2
SELECT rating, AVG(length) AS avg_film
FROM film
GROUP BY rating
ORDER BY avg_film > 120;


#2.3
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;









